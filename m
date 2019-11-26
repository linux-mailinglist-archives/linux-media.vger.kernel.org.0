Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2E910A121
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbfKZPWt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:22:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53050 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfKZPWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:22:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 1849828FAEF
Subject: Re: [PATCH v3 1/3] media: vimc: Add the implementation for the
 configfs api
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com
References: <20191126121020.11597-1-dafna.hirschfeld@collabora.com>
 <20191126121020.11597-2-dafna.hirschfeld@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <69ddbed3-62b3-1061-c350-ac16b3a6cbed@collabora.com>
Date:   Tue, 26 Nov 2019 16:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126121020.11597-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch,

One more comment and few nitpicks follow.

With that addressed you can add

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

W dniu 26.11.2019 o 13:10, Dafna Hirschfeld pisze:
> Add the code that implements the usage of configfs in order
> to create and configure a device topology from userspace.
> The code is only added in this patch but is not used.
> It will be used in next patch in the series.
> 

<snip>

> +struct vimc_cfs_ent_type vimc_cap_cfs_ent_type = {
> +	.name = VIMC_CAP_NAME,
> +	.create_pads = vimc_cap_create_cfs_pads,
> +};

You have some instances of struct vimc_cfs_ent_type,
but at the same time you have an instance of struct
config_item_type called vimc_cfs_ent_type.
I haven't noticed it earlier, this is confusing.

<snip>

> diff --git a/drivers/media/platform/vimc/vimc-configfs.c b/drivers/media/platform/vimc/vimc-configfs.c
> new file mode 100644
> index 000000000000..81e6be5b30c5
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-configfs.c
> @@ -0,0 +1,720 @@

<snip>

> +static struct vimc_cfs_subsystem {
> +	struct configfs_subsystem subsys;
> +	struct list_head ent_types;
> +} vimc_cfs_subsys = {
> +	.subsys = {
> +		.su_group = {
> +			.cg_item = {
> +				.ci_namebuf = CFS_SUBSYS_NAME,
> +				.ci_type = &vimc_cfs_subsys_type,
> +			},
> +		},
> +		.su_mutex = __MUTEX_INITIALIZER(vimc_cfs_subsys.subsys.su_mutex),

A newline and tabs to fit 80 chars limit?

		.su_mutex =
			__MUTEX_INITIALIZER(vimc_cfs_subsys.subsys.su_mutex),

<snip>

> +
> +static struct config_group *vimc_cfs_dev_make_ent_group(
> +			struct config_group *group, const char *name)
> +{
> +	struct vimc_cfs_device *cfs =
> +		container_of(group, struct vimc_cfs_device, gdev);
> +	char *type_name, *ent_name, *sep;
> +	struct vimc_cfs_ent *c_ent;
> +	struct vimc_entity_data *ent;
> +	struct vimc_cfs_ent_type *c_ent_type = NULL;
> +	struct vimc_cfs_ent_type *found_ent_type = NULL;
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
> +	list_for_each_entry(c_ent_type, &vimc_cfs_subsys.ent_types, entry) {
> +		if (!strcmp(type_name, c_ent_type->name)) {
> +			found_ent_type = c_ent_type;
> +			break;
> +		}
> +	}

list_for_each_entry() ultimately expands to a "for" loop, and inside it
you only have a single statement (the "if") so the outer braces seem redundant.
