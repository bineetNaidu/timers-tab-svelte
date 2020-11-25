<script lang="ts">
  import Modal from './Modal.svelte';

  let time: number = 0;

  $: counterTime = 0;

  let unSub;
  let showModal: boolean = false;

  const handleSubmit = () => {
    if (time !== 0) {
      counterTime = time;
      unSub = setInterval(() => {
        counterTime = counterTime - 1;
        if (unSub && counterTime === 0) {
          clearInterval(unSub);
          showModal = true;
        }
      }, 1000);
    } else {
      alert('Please set a valid timer (not 0)');
    }
  };

  const handleReset = () => {
    time = 0;
    counterTime = 0;
    clearInterval(unSub);
  };
</script>

<style>
  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }
</style>

<svelte:head>
  <title>{counterTime}s | Svelte Timers Tab</title>
</svelte:head>

<Modal {showModal} on:click={() => (showModal = false)} />

<main class="container">
  <h1 class="text-center">Svelte Timers Tab!</h1>
  <form on:submit|preventDefault={handleSubmit}>
    <input type="number" bind:value={time} step={1} placeholder="*in Secs" />
    <button type="submit">Start</button>
  </form>

  <h1>{counterTime}</h1>
  <button on:click={handleReset}>Reset</button>
</main>
