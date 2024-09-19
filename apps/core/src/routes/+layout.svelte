<script lang="ts">
	import type { Snippet } from 'svelte';
	import { page } from '$app/stores';
	import "$lib/assets/app.css"

	type Props = {
		children: Snippet;
	};
	let { children }: Props = $props();
</script>

{#if $page.url.pathname === '/about'}
	{@render children()}
{:else}
	{@render children()}
{/if}
