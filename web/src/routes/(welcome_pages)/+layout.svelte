<script lang="ts">
	import Header from "$lib/components/Header.svelte";
	import Footer from "$lib/components/Footer.svelte";
	import "../../app.css";
	import { Toaster } from "$lib/components/ui/sonner";
	import { current_user } from "$lib/state/current_user.svelte";
	import { afterNavigate } from "$app/navigation";
	import { checkAndShowPendingToasts } from "$lib/state/toast.svelte";

	let { children, data } = $props();

	current_user.id = data.current_user_id;

	afterNavigate(() => {
		checkAndShowPendingToasts();
	});
</script>

<div class="bg-teal-100"></div>

<div class="flex flex-col h-screen justify-between">
	<div>
		<Header />
		<Toaster closeButton={true} richColors={true} />
	</div>

	<main>
		<div class="flex items-center justify-center">
			{@render children()}
		</div>
	</main>

	<Footer />
</div>
