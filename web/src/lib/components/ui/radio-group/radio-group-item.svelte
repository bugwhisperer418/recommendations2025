<script lang="ts">
	import { RadioGroup as RadioGroupPrimitive } from "bits-ui";
	import Circle from "lucide-svelte/icons/circle";
	import { cn } from "$lib/utils.js";

	type $$Props = RadioGroupPrimitive.ItemProps;
	type $$Events = RadioGroupPrimitive.ItemEvents;

	let className: $$Props["class"] = undefined;
	export let value: $$Props["value"];
	export { className as class };
</script>

<RadioGroupPrimitive.Item
	{value}
	class={cn(
		"border-primary text-primary ring-offset-background focus-visible:ring-ring aspect-square h-4 w-4 rounded-full border focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
		className,
	)}
	{...$$restProps}
	on:click
>
	<div class="flex items-center justify-center">
		<RadioGroupPrimitive.ItemIndicator>
			<Circle class="h-2.5 w-2.5 fill-current text-current" />
		</RadioGroupPrimitive.ItemIndicator>
	</div>
</RadioGroupPrimitive.Item>
