<script lang="ts">
  let time: number = 0;

  $: counterTime = 0;

  let unSub;

  const handleSubmit = () => {
    counterTime = time;
    unSub = setInterval(() => {
      counterTime = counterTime - 1;
      if (unSub && counterTime === 0) {
        clearInterval(unSub);
      }
    }, 1000);
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

<main class="container">
  <h1 class="text-center">Svelte Timers Tab!</h1>
  <form on:submit|preventDefault={handleSubmit}>
    <input type="number" bind:value={time} step={1} placeholder="*in Secs" />
    <button type="submit">Start</button>
  </form>

  <h1>{counterTime}</h1>
  <button on:click={handleReset}>Reset</button>
</main>
