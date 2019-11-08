Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D8BF4FEC
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfKHPjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:39:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36562 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHPjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:39:52 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id A6FD229111D
Subject: Re: [PATCH v2 1/3] media: vimc: Add the implementation for the
 configfs api
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com
References: <20191105152059.9994-1-dafna.hirschfeld@collabora.com>
 <20191105152059.9994-2-dafna.hirschfeld@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <2ba39eed-33ee-1c83-3111-4ea96d1685d7@collabora.com>
Date:   Fri, 8 Nov 2019 16:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105152059.9994-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the series.

Did you run checkpatch on it? I think there are lines exceeding 80 chars.
These are newly added lines, so why not have them fit the recommended
limit?

Please also see inline,

Andrzej

W dniu 05.11.2019 o 16:20, Dafna Hirschfeld pisze:
> Add the code that implements the usage of configfs in order
> to create and configure a device topology from userspace.
> The code is only added in this patch but is not used.
> It will be used in next patch in the series.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> [refactored for upstream]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---

<snip>

> +static ssize_t vimc_cfs_link_type_store(struct config_item *item,
> +					   const char *buf,
> +					   size_t size)
> +{
> +	struct vimc_cfs_link *c_link =
> +		container_of(item, struct vimc_cfs_link, ci);
> +
> +	ci_dbg(item, "buf = '%s'\n", buf);
> +	if (!strcmp(buf, "disabled\n") || !strcmp(buf, "off\n") ||
> +		!strcmp(buf, "disabled") || !strcmp(buf, "off")) {
> +		c_link->link.flags &= ~MEDIA_LNK_FL_IMMUTABLE;
> +		c_link->link.flags &= ~MEDIA_LNK_FL_ENABLED;
> +	} else if (!strcmp(buf, "enabled\n") || !strcmp(buf, "on\n") ||
> +		   !strcmp(buf, "enabled") || !strcmp(buf, "on")) {
> +		c_link->link.flags &= ~MEDIA_LNK_FL_IMMUTABLE;
> +		c_link->link.flags |= MEDIA_LNK_FL_ENABLED;
> +	} else if (!strcmp(buf, "immutable\n") || !strcmp(buf, "immutable")) {
> +		c_link->link.flags |= MEDIA_LNK_FL_IMMUTABLE;
> +		c_link->link.flags |= MEDIA_LNK_FL_ENABLED;
> +	} else {
> +		ci_err(item, "'%s' is an invalid value, see vimc doc for valid values",
> +		       buf);
> +		return -EINVAL;
> +	}
> +	return strlen(buf);
> +}

In the above function you keep asking whether the "buf" contains
a string, or the same string followed by a newline. Maybe create a helper
which will check for the buffer contents being equal the string
or the string followed by a newline?

if (buf_contains("disabled") || buf_contains("off")) {
	....
} else if (buf_contains("enabled") || buf_contains("on")) {
	....
} else if (buf_contains("immutable")) {
} else {
}

Otherwise you could normalize the buffer in this function to always
not include the newline.

> +
> +
> +static ssize_t vimc_cfs_link_type_show(struct config_item *item,
> +					  char *buf)
> +{
> +	struct vimc_cfs_link *c_link = container_of(item,
> +					struct vimc_cfs_link, ci);
> +
> +	if (c_link->link.flags & MEDIA_LNK_FL_IMMUTABLE)
> +		strcpy(buf, "immutable\n");
> +	else if (c_link->link.flags & MEDIA_LNK_FL_ENABLED)
> +		strcpy(buf, "enabled\n");
> +	else
> +		strcpy(buf, "disabled\n");
> +	return strlen(buf);
> +}
> +
> +CONFIGFS_ATTR(vimc_cfs_link_, type);
> +
> +/*
> + * add the link to the list of links
> + * this function assumes src and target are valid and that the su_mutex
> + * is locked
> + */
> +static int vimc_cfs_adding_link(struct config_item *src,
> +				struct config_item *target)
> +{
> +	struct config_item *src_ent_ci = src->ci_parent;
> +	struct config_item *trgt_ent_ci = target->ci_parent->ci_parent;
> +	struct vimc_cfs_link *c_link =
> +			container_of(target, struct vimc_cfs_link, ci);

2 tabs needed?

> +	struct vimc_cfs_ent *vimc_src_ent = container_of(src_ent_ci,
> +							 struct vimc_cfs_ent,
> +							 cg.cg_item);

if a newline and 1 tab indent is used will the whole invocation of
container_of() fit in 1 line in a fashion similar to c_link assignment?
This comment applies to the whole patch.

> +	struct vimc_cfs_ent *vimc_trgt_ent = container_of(trgt_ent_ci,
> +							 struct vimc_cfs_ent,
> +							 cg.cg_item);
> +	struct vimc_cfs_device *cfs = container_of(src_ent_ci->ci_parent,
> +							 struct vimc_cfs_device,
> +							 gdev.cg_item);
> +
> +	mutex_lock(&cfs->pdata.topology_mutex);
> +	if (c_link->link.source) {
> +		ci_warn(src, "the sink target %s is already linked\n",
> +				target->ci_name);
> +		mutex_unlock(&cfs->pdata.topology_mutex);
> +		return -EINVAL;
> +	}
> +
> +	/* src and target validation already done in the allow_link callback,
> +	 * so there is no need to check sscanf result
> +	 */
> +	sscanf(src->ci_name, VIMC_CFS_SRC_PAD "%hu",
> +	       &c_link->link.source_pad);
> +	sscanf(target->ci_parent->ci_name, VIMC_CFS_SINK_PAD "%hu",
> +	       &c_link->link.sink_pad);
> +
> +	c_link->link.source = &vimc_src_ent->ent;
> +	c_link->link.sink = &vimc_trgt_ent->ent;
> +
> +	cg_dbg(&cfs->gdev, "creating link %s:%u->%s:%u\n",
> +	       c_link->link.source->name, c_link->link.source_pad,
> +	       c_link->link.sink->name, c_link->link.sink_pad);
> +
> +	list_add(&c_link->link.entry, &cfs->pdata.links);
> +	mutex_unlock(&cfs->pdata.topology_mutex);
> +	return 0;
> +}
> +
> +static void vimc_cfs_drop_link(struct config_item *src,
> +			       struct config_item *target)
> +{
> +	struct vimc_cfs_link *c_link = container_of(target,
> +						    struct vimc_cfs_link, ci);
> +	struct config_item *src_ent_ci = src->ci_parent;
> +	struct vimc_cfs_device *cfs = container_of(src_ent_ci->ci_parent,
> +						   struct vimc_cfs_device,
> +						   gdev.cg_item);
> +
> +	mutex_lock(&cfs->pdata.topology_mutex);
> +	ci_dbg(&c_link->ci, "dropping link %s:%u->%s:%u\n",
> +	       c_link->link.source->name, c_link->link.source_pad,
> +	       c_link->link.sink->name, c_link->link.sink_pad);
> +
> +	c_link->link.source_pad = 0;
> +	c_link->link.sink_pad = 0;
> +	c_link->link.source = NULL;
> +	c_link->link.sink = NULL;
> +	list_del(&c_link->link.entry);
> +	mutex_unlock(&cfs->pdata.topology_mutex);
> +}
> +
> +static int vimc_cfs_allow_link(struct config_item *src,
> +			       struct config_item *target)
> +{
> +	struct config_item *src_vimc_dev;
> +	struct config_item *target_vimc_dev;
> +	struct config_item *tmp;
> +	struct config_item *src_ent_ci, *trgt_ent_ci;
> +	int target_depth = 0, ret = 0;
> +
> +
> +	mutex_lock(&vimc_cfs_subsys.subsys.su_mutex);
> +
> +	/* the allow_link callback exists only for dirs of the form
> +	 * $CONFIGFS/vimc/<dev>/vimc-<type>:<name>/source:<pad>/
> +	 * therefore, we can be sure that parent and grandparent are non NULL
> +	 * and that grandparent is the vimc device
> +	 */
> +	src_vimc_dev = src->ci_parent->ci_parent;
> +
> +
> +	/* the target must be of the form:
> +	 * $CONFIGFS/vimc/<dev>/vimc-<type>:<name>/sink:<pad>/<link-name>
> +	 * so we should make sure that it's depth is exactly 5
> +	 */
> +	for (tmp = target->ci_parent; tmp; tmp = tmp->ci_parent)
> +		target_depth++;
> +
> +	if (target_depth != 5) {
> +		ci_warn(src, "link target (%s) is not a sink pad\n",
> +			target->ci_name);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	/*
> +	 * make sure that the target is under a directory named
> +	 * 'sink:<pad>
> +	 */
> +	if (strncmp(target->ci_parent->ci_name, VIMC_CFS_SINK_PAD,
> +	    sizeof(VIMC_CFS_SINK_PAD) - 1)) {
> +		ci_warn(src, "link target (%s) is not a sink pad\n",
> +			target->ci_name);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	target_vimc_dev = target->ci_parent->ci_parent->ci_parent;
> +	if (src_vimc_dev != target_vimc_dev) {
> +		ci_warn(src, "linking between different vimc devices: (%s), (%s) is not allowed\n",
> +			src_vimc_dev->ci_name, target_vimc_dev->ci_name);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +	src_ent_ci = target->ci_parent;
> +	trgt_ent_ci = src->ci_parent->ci_parent;
> +	if (src_ent_ci == trgt_ent_ci) {
> +		ci_warn(src, "both pads belong to the same entity (%s) - this is not allowed\n",
> +			src_ent_ci->ci_name);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +	ret = vimc_cfs_adding_link(src, target);
> +	if (ret)
> +		goto end;

What's the point?
Is some code missing between this place and the "end" label?

> +end:
> +	mutex_unlock(&vimc_cfs_subsys.subsys.su_mutex);
> +	return ret;
> +}
> +
> +static void vimc_cfs_link_target_release(struct config_item *item)
> +{
> +	struct vimc_cfs_link *c_link = container_of(item,
> +						    struct vimc_cfs_link, ci);
> +
> +	ci_dbg(item, "releasing link target '%s'", item->ci_name);
> +	kfree(c_link);
> +}
> +
> +static struct configfs_attribute *vimc_cfs_link_attrs[] = {
> +	&vimc_cfs_link_attr_type,
> +	NULL,
> +};
> +
> +static struct configfs_item_operations vimc_cfs_link_target_ops = {
> +	.release	= vimc_cfs_link_target_release,
> +};
> +
> +
> +static struct config_item_type vimc_cfs_link_target_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_attrs = vimc_cfs_link_attrs,
> +	.ct_item_ops = &vimc_cfs_link_target_ops,
> +};
> +
> +/* --------------------------------------------------------------------------
> + * Source pad instance
> + */
> +
> +static void vimc_cfs_sink_pad_link_target_drop_item(
> +		struct config_group *sink_pad_group,
> +		struct config_item *c_link)
> +{
> +
> +	struct config_item *cfs_item;
> +	struct vimc_cfs_device *cfs;
> +
> +	cfs_item = sink_pad_group->cg_item.ci_parent->ci_parent;

Maybe a comment why you can safely dereference here?
I guess it is because the drop_item() is called only when the item
does exist?

> +	cfs = container_of(cfs_item, struct vimc_cfs_device, gdev.cg_item);
> +	cg_dbg(&cfs->gdev, "dropping link target '%s' cfs=%p\n",
> +	       c_link->ci_name, cfs);
> +	config_item_put(c_link);
> +}
> +
> +static struct config_item *vimc_cfs_sink_pad_link_target_make_item(
> +			   struct config_group *group,
> +			   const char *name)
> +{
> +	struct vimc_cfs_link *c_link = kzalloc(sizeof(*c_link), GFP_KERNEL);

I know that "small allocations never fail", but...

> +
> +	cg_dbg(group, "link target name is '%s'\n", name);
> +	config_item_init_type_name(&c_link->ci, name,
> +				   &vimc_cfs_link_target_type);
> +	return &c_link->ci;
> +}
> +
> +static struct configfs_group_operations vimc_cfs_sink_pad_ops = {
> +	.make_item = vimc_cfs_sink_pad_link_target_make_item,
> +	.drop_item = vimc_cfs_sink_pad_link_target_drop_item,
> +};
> +
> +static struct configfs_item_operations vimc_cfs_src_pad_ops = {
> +	.allow_link = vimc_cfs_allow_link,
> +	.drop_link = vimc_cfs_drop_link,
> +};
> +
> +
> +static struct config_item_type vimc_cfs_src_pad_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_item_ops = &vimc_cfs_src_pad_ops,
> +};
> +
> +static struct config_item_type vimc_cfs_sink_pad_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_group_ops = &vimc_cfs_sink_pad_ops,
> +};
> +
> +
> +/* --------------------------------------------------------------------------
> + * Device instance
> + */
> +
> +static void vimc_cfs_ent_release(struct config_item *item)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(item, struct vimc_cfs_ent,
> +						  cg.cg_item);
> +
> +	ci_dbg(item, "releasing entity '%s' of type '%s'",
> +	       c_ent->ent.name, c_ent->ent.type_name);
> +	kfree(c_ent);
> +}
> +
> +static struct configfs_item_operations vimc_cfs_ent_item_ops = {
> +	.release	= vimc_cfs_ent_release,
> +};
> +
> +static struct config_item_type vimc_cfs_ent_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_item_ops = &vimc_cfs_ent_item_ops,
> +};
> +
> +void vimc_cfs_add_sink_pad(struct config_group *ent_group,
> +					int pad_idx, const char *name)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(ent_group,
> +						  struct vimc_cfs_ent, cg);
> +
> +	config_group_init_type_name(&c_ent->pad_groups[pad_idx], name,
> +				    &vimc_cfs_sink_pad_type);
> +	configfs_add_default_group(&c_ent->pad_groups[pad_idx], ent_group);
> +}
> +
> +
> +void vimc_cfs_add_source_pad(struct config_group *ent_group,
> +					  int pad_idx, const char *name)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(ent_group,
> +						  struct vimc_cfs_ent, cg);
> +
> +	config_group_init_type_name(&c_ent->pad_groups[pad_idx], name,
> +				    &vimc_cfs_src_pad_type);
> +	configfs_add_default_group(&c_ent->pad_groups[pad_idx], ent_group);
> +}
> +
> +static void vimc_cfs_dev_drop_ent_item(struct config_group *dev_group,
> +				       struct config_item *ent_item)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(ent_item, struct vimc_cfs_ent,
> +						  cg.cg_item);
> +	struct vimc_cfs_device *cfs = container_of(dev_group,
> +						   struct vimc_cfs_device,
> +						   gdev);
> +
> +	cg_dbg(&cfs->gdev, "dropping entity '%s' of type '%s'",
> +	       c_ent->ent.name, c_ent->ent.type_name);
> +	mutex_lock(&cfs->pdata.topology_mutex);
> +	list_del(&c_ent->ent.entry);
> +	mutex_unlock(&cfs->pdata.topology_mutex);
> +	config_item_put(ent_item);
> +}
> +
> +static struct config_group *vimc_cfs_dev_make_ent_group(
> +			struct config_group *group, const char *name)
> +{
> +	struct vimc_cfs_device *cfs = container_of(group,
> +						   struct vimc_cfs_device,
> +						   gdev);
> +	char *type_name, *ent_name, *sep;
> +	struct vimc_cfs_ent *c_ent;
> +	struct vimc_entity_data *ent;
> +	struct vimc_cfs_ent_type *c_ent_type = NULL;
> +	char buf[VIMC_MAX_CFS_NAME_LEN];
> +
> +	cg_dbg(group, "trying to make entity '%s'\n", name);
> +	if (snprintf(buf, VIMC_MAX_CFS_NAME_LEN, "%s", name) >= sizeof(buf))
> +		return ERR_PTR(-ENAMETOOLONG);
> +
> +	/* Parse format "type_name:ent_name" */
> +	sep = strchr(buf, CHAR_SEPARATOR);
> +	if (!sep) {
> +		cg_warn(&cfs->gdev,
> +			"Could not find separator '%c'\n", CHAR_SEPARATOR);
> +		goto syntax_error;
> +	}
> +	*sep = '\0';
> +
> +	ent_name = &sep[1];
> +	type_name = buf;
> +
> +	if (!*ent_name || sep == type_name) {
> +		cg_warn(&cfs->gdev,
> +			"%s: Driver name and entity name can't be empty.\n",
> +			name);
> +		goto syntax_error;
> +	}
> +	if (strlen(ent_name) >= VIMC_MAX_NAME_LEN) {
> +		cg_err(&cfs->gdev,
> +		       "%s: Driver name length should be less than %u.\n",
> +		       name, VIMC_MAX_NAME_LEN);
> +		goto syntax_error;
> +	}
> +	mutex_lock(&cfs->pdata.topology_mutex);
> +	list_for_each_entry(ent, &cfs->pdata.ents, entry) {
> +		if (!strncmp(ent->name, ent_name, sizeof(ent->name))) {
> +			cg_err(&cfs->gdev, "entity `%s` already exist\n",
> +			       ent->name);
> +			mutex_unlock(&cfs->pdata.topology_mutex);
> +			goto syntax_error;
> +		}
> +	}
> +
> +	c_ent = kzalloc(sizeof(*c_ent), GFP_KERNEL);
> +	if (!c_ent) {
> +		mutex_unlock(&cfs->pdata.topology_mutex);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	strscpy(c_ent->ent.name, ent_name, sizeof(c_ent->ent.name));
> +
> +	/* TODO: add support for hotplug at entity level */
> +	list_for_each_entry(c_ent_type, &vimc_cfs_subsys.ent_types, entry) {
> +		if (!strcmp(type_name, c_ent_type->name)) {
> +			config_group_init_type_name(&c_ent->cg, ent_name,
> +						    &vimc_cfs_ent_type);
> +			if (c_ent_type->create_pads)
> +				c_ent_type->create_pads(&c_ent->cg);
> +			c_ent->ent.type_name = c_ent_type->name;
> +			list_add(&c_ent->ent.entry, &cfs->pdata.ents);
> +			mutex_unlock(&cfs->pdata.topology_mutex);

Maybe add a blank line before the return? And a comment?
Of course they way it looks to me is individual to me, but my
perception is that the below "return" is "visually lost" and the
function...

> +			return &c_ent->cg;
> +		}
> +	}
> +	mutex_unlock(&cfs->pdata.topology_mutex);
> +	cg_warn(&cfs->gdev, "entity type '%s' not found\n", type_name);
> +	kfree(c_ent);
> +	return ERR_PTR(-EINVAL);
> +

...right here a bit surprisingly returns with an error in a place
where one could expect a success instead (I mean the above
"return ERR_PTR(-EINVAL)").

> +syntax_error:
> +	cg_err(&cfs->gdev,
> +	       "couldn't create entity '%s' wrong syntax.", name);
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int vimc_cfs_decode_state(const char *buf, size_t size)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(vimc_cfs_hotplug_values); i++) {
> +		for (j = 0; j < ARRAY_SIZE(vimc_cfs_hotplug_values[0]); j++) {
> +			if (!strncmp(buf, vimc_cfs_hotplug_values[i][j], size))
> +				return i;
> +		}
> +	}

Braces redundant?

> +	return -EINVAL;
> +}
> +
> +static ssize_t vimc_cfs_dev_hotplug_show(struct config_item *item,
> +					 char *buf)
> +{
> +	struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +						   gdev.cg_item);
> +
> +	cg_dbg(&cfs->gdev, "%s: cfs=%p\n", __func__, cfs);
> +	strcpy(buf, vimc_cfs_hotplug_values[IS_PLUGGED(cfs)][0]);
> +	return strlen(buf);
> +}
> +
> +static ssize_t vimc_cfs_dev_hotplug_store(struct config_item *item,
> +					  const char *buf, size_t size)
> +{
> +	struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +						   gdev.cg_item);
> +	int state = vimc_cfs_decode_state(buf, size);
> +
> +	cg_dbg(&cfs->gdev, "%s: cfs=%p\n", __func__, cfs);
> +	if (state == VIMC_CFS_HOTPLUG_STATE_UNPLUGGED) {
> +		vimc_cfs_device_unplug(cfs);
> +	} else if (state == VIMC_CFS_HOTPLUG_STATE_PLUGGED) {
> +		int ret = vimc_cfs_device_plug(cfs);
> +
> +		if (ret)
> +			return ret;
> +	}
> +	return size;
> +}
> +
> +CONFIGFS_ATTR(vimc_cfs_dev_, hotplug);
> +
> +static void vimc_cfs_dev_release(struct config_item *item)
> +{
> +	struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +						   gdev.cg_item);
> +
> +	ci_dbg(item, "releasing dev %s (%p)\n", item->ci_name, cfs);
> +	kfree(cfs);
> +}
> +
> +static struct configfs_group_operations vimc_cfs_dev_group_ops = {
> +	.make_group = vimc_cfs_dev_make_ent_group,
> +	.drop_item = vimc_cfs_dev_drop_ent_item,
> +};
> +
> +static struct configfs_item_operations vimc_cfs_dev_item_ops = {
> +	.release = vimc_cfs_dev_release,
> +};
> +
> +static struct configfs_attribute *vimc_cfs_dev_attrs[] = {
> +	&vimc_cfs_dev_attr_hotplug,
> +	NULL,
> +};
> +
> +static struct config_item_type vimc_cfs_dev_type = {
> +	.ct_group_ops = &vimc_cfs_dev_group_ops,
> +	.ct_item_ops = &vimc_cfs_dev_item_ops,
> +	.ct_attrs = vimc_cfs_dev_attrs,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/* --------------------------------------------------------------------------
> + * Subsystem
> + * --------------------------------------------------------------------------
> + */
> +
> +static void vimc_cfs_subsys_drop_dev_item(struct config_group *group,
> +				   struct config_item *item)
> +{
> +	struct vimc_cfs_device *cfs = container_of(to_config_group(item),
> +						   struct vimc_cfs_device,
> +						   gdev);
> +
> +	cg_dbg(&cfs->gdev, "dropping dev item '%s'", item->ci_name);
> +	vimc_cfs_device_unplug(cfs);
> +	config_item_put(item);
> +}
> +
> +static struct config_group *vimc_cfs_subsys_make_dev_group(
> +				struct config_group *group, const char *name)
> +{
> +	struct vimc_cfs_device *cfs = kzalloc(sizeof(*cfs), GFP_KERNEL);
> +
> +	if (!cfs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cg_dbg(&cfs->gdev, "making dev group '%s'", name);
> +	/* Configure platform data */
> +	mutex_init(&cfs->pdata.topology_mutex);
> +	INIT_LIST_HEAD(&cfs->pdata.ents);
> +	INIT_LIST_HEAD(&cfs->pdata.links);
> +	mutex_init(&cfs->pdev_mutex);
> +	config_group_init_type_name(&cfs->gdev, name, &vimc_cfs_dev_type);
> +
> +	return &cfs->gdev;
> +}
> +
> +int vimc_cfs_subsys_register(void)
> +{
> +	config_group_init(&vimc_cfs_subsys.subsys.su_group);
> +	return configfs_register_subsystem(&vimc_cfs_subsys.subsys);
> +}
> +
> +void vimc_cfs_subsys_unregister(void)
> +{
> +	configfs_unregister_subsystem(&vimc_cfs_subsys.subsys);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-configfs.h b/drivers/media/platform/vimc/vimc-configfs.h
> new file mode 100644
> index 000000000000..d6789914850c
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-configfs.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * vimc-configfs.h Virtual Media Controller Driver
> + *
> + * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
> + */
> +
> +#ifndef _VIMC_CONFIGFS_H_
> +#define _VIMC_CONFIGFS_H_
> +
> +#include <linux/configfs.h>
> +
> +#define VIMC_CFS_SRC_PAD "source:"
> +#define VIMC_CFS_SINK_PAD "sink:"
> +
> +#define VIMC_CFS_SRC_PAD_NUM(n) "source:" #n
> +#define VIMC_CFS_SINK_PAD_NUM(n) "sink:" #n
> +
> +extern struct config_item_type vimc_default_cfs_pad_type;
> +
> +void vimc_cfs_add_source_pad(struct config_group *ent_group,
> +					int pad_idx, const char *name);
> +
> +void vimc_cfs_add_sink_pad(struct config_group *ent_group,
> +				      int pad_idx, const char *name);
> +struct vimc_cfs_ent_type {
> +	const char *name;
> +	struct list_head entry;
> +
> +	void (*const create_pads)(struct config_group *parent);
> +};
> +
> +int vimc_cfs_subsys_register(void);
> +
> +void vimc_cfs_subsys_unregister(void);
> +
> +void vimc_cfs_ent_type_register(struct vimc_cfs_ent_type *c_ent_type);
> +
> +void vimc_cfs_ent_type_unregister(struct vimc_cfs_ent_type *c_ent_type);
> +
> +#endif
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 8860ca3bf400..715de945e3a2 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -14,6 +14,7 @@
>   #include <media/v4l2-subdev.h>
>   
>   #include "vimc-common.h"
> +#include "vimc-configfs.h"
>   
>   enum vimc_deb_rgb_colors {
>   	VIMC_DEB_RED = 0,
> @@ -604,3 +605,24 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   
>   	return NULL;
>   }
> +
> +static void vimc_deb_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_source_pad(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(1));
> +	vimc_cfs_add_sink_pad(ent_group, 1, VIMC_CFS_SINK_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_ent_type vimc_deb_cfs_ent_type = {
> +	.name = VIMC_DEB_NAME,
> +	.create_pads = vimc_deb_create_cfs_pads,
> +};
> +
> +void vimc_deb_exit(void)
> +{
> +	vimc_cfs_ent_type_unregister(&vimc_deb_cfs_ent_type);
> +}
> +
> +void vimc_deb_init(void)
> +{
> +	vimc_cfs_ent_type_register(&vimc_deb_cfs_ent_type);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index cb04408834b5..d4d20c579bc8 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -10,6 +10,7 @@
>   #include <linux/v4l2-mediabus.h>
>   #include <media/v4l2-subdev.h>
>   
> +#include "vimc-configfs.h"
>   #include "vimc-common.h"
>   
>   static unsigned int sca_mult = 3;
> @@ -398,3 +399,24 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>   
>   	return &vsca->ved;
>   }
> +
> +static void vimc_sca_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_source_pad(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(1));
> +	vimc_cfs_add_sink_pad(ent_group, 1, VIMC_CFS_SINK_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_ent_type vimc_sca_cfs_ent_type = {
> +	.name = VIMC_SCA_NAME,
> +	.create_pads = vimc_sca_create_cfs_pads,
> +};
> +
> +void vimc_sca_exit(void)
> +{
> +	vimc_cfs_ent_type_unregister(&vimc_sca_cfs_ent_type);
> +}
> +
> +void vimc_sca_init(void)
> +{
> +	vimc_cfs_ent_type_register(&vimc_sca_cfs_ent_type);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index f137ff23b892..4ea831c834df 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -12,6 +12,7 @@
>   #include <media/v4l2-subdev.h>
>   #include <media/tpg/v4l2-tpg.h>
>   
> +#include "vimc-configfs.h"
>   #include "vimc-common.h"
>   
>   struct vimc_sen_device {
> @@ -401,3 +402,23 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   
>   	return NULL;
>   }
> +
> +static void vimc_sen_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_source_pad(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_ent_type vimc_sen_cfs_ent_type = {
> +	.name = VIMC_SEN_NAME,
> +	.create_pads = vimc_sen_create_cfs_pads,
> +};
> +
> +void vimc_sen_exit(void)
> +{
> +	vimc_cfs_ent_type_unregister(&vimc_sen_cfs_ent_type);
> +}
> +
> +void vimc_sen_init(void)
> +{
> +	vimc_cfs_ent_type_register(&vimc_sen_cfs_ent_type);
> +}
> 

