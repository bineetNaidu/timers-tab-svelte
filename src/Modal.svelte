<script lang="ts">
  export let showModal: boolean = false;
</script>

<style>
  .backdrop {
    width: 100%;
    height: 100vh;
    position: fixed;
    background: rgba(0, 0, 0, 0.8);
  }
  .modal_svelte {
    padding: 10px;
    border-radius: 10px;
    max-width: 400px;
    margin: 10% auto;
    text-align: center;
    background: white;
  }
</style>

{#if showModal}
  <div class="backdrop" on:click|self>
    <div class="modal_svelte">
      <h1>Times up ⏲️!!!</h1>
      <audio controls autoplay loop>
        <track kind="captions" />
        <source src="/assets/ALARM.mp3" type="audio/mp3" />
        <!-- <source src="viper.ogg" type="audio/ogg"> -->
        <p>Your browser doesn't support HTML5 audio.</p>
      </audio>
    </div>
  </div>
{/if}
