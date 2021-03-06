<div class="block">

	{* Subtrees *}
	<div class="block">
	<fieldset>
		<legend>{'Subtrees'|i18n( 'design/admin/workflow/eventtype/edit' )}</legend>
		{if $event.selected_subtrees}
			<table class="list" cellspacing="0">
				<tr>
					<th class="tight">&nbsp;</th>
					<th>{'Subtree'|i18n( 'design/admin/workflow/eventtype/edit' )}</th>
				</tr>
				{foreach $event.selected_subtrees as $subtree sequence array( bglight, bgdark ) as $sequence}
					<tr class="{$sequence}">
						<td><input type="checkbox" name="RemoveSubtreesIDArray_{$event.id}[]" value="{$subtree}" />
						<input type="hidden" name="WorkflowEvent_event_autonotifications_selected_subtrees_{$event.id}[]" value="{$subtree}" /></td>
						<td>{fetch(content, node, hash( node_id, $subtree)).name|wash}</td>
					</tr>
				{/foreach}
			</table>
		{else}
			<p>{'No subtrees selected.'|i18n( 'design/admin/workflow/eventtype/edit' )}</p>
		{/if}

		<input class="button" type="submit" name="CustomActionButton[{$event.id}_RemoveSubtrees]" value="{'Remove selected'|i18n( 'design/admin/workflow/eventtype/edit' )}"{if $event.selected_subtrees|not}disabled="disabled"{/if} />
		<input class="button" type="submit" name="CustomActionButton[{$event.id}_AddSubtrees]" value="{'Add items'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}" />

		</fieldset>
	</div>

	{* Affected versions option *}
	<div class="element">
		<label>{'Affected versions'|i18n( 'design/admin/workflow/eventtype/edit' )}:</label>
		<select name="WorkflowEvent_event_autonotifications_version_option_{$event.id}[]" size="3" multiple="multiple">
		<option value="0"{if or( lt($event.version_option, 1), gt($event.version_option, 2) )} selected="selected"{/if}>{'All versions'|i18n( 'design/admin/workflow/eventtype/edit' )}</option>
		<option value="1"{if eq( $event.version_option, 1)} selected="selected"{/if}>{'Publishing new object'|i18n( 'design/admin/workflow/eventtype/edit' )}</option>
		<option value="2"{if eq( $event.version_option, 2)} selected="selected"{/if}>{'Updating existing object'|i18n( 'design/admin/workflow/eventtype/edit' )}</option>
		</select>
	</div>

	{* Users *}
	<div class="element">
		<label>{'Users'|i18n( 'design/admin/workflow/eventtype/edit' )}:</label>
		<select name="WorkflowEvent_event_autonotifications_selected_usergroups_{$event.id}[]" size="5" multiple="multiple">
			{foreach $event.workflow_type.usergroups as $group}
				<option value="{$group.value}"{if $event.selected_usergroups|contains( $group.value )} selected="selected"{/if}>{$group.name|wash}</option>
			{/foreach}
		</select>
	</div>

</div>
