Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2B8C007C
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 09:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfI0H4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 03:56:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53470 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfI0H4D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 03:56:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 72B1A28F4AF
Subject: Re: [PATCH 3/5] media: vimc: Add the implementation for the configfs
 api
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
 <20190919203208.12515-4-dafna.hirschfeld@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <5c758c6d-9e92-35a6-0fb4-6bbe5163d5bb@collabora.com>
Date:   Fri, 27 Sep 2019 09:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919203208.12515-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Please see inline.

W dniu 19.09.2019 o 22:32, Dafna Hirschfeld pisze:
> Add the code that implements the usage of configfs in order
> to create and configure a device topology from userspace.
> The code is only added in this patch but is not used.
> It will be used in next patch in the series.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> [refactored for upstream]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   drivers/media/platform/vimc/Kconfig         |   9 +-
>   drivers/media/platform/vimc/Makefile        |   2 +-
>   drivers/media/platform/vimc/vimc-capture.c  |  21 +
>   drivers/media/platform/vimc/vimc-common.h   |  46 ++
>   drivers/media/platform/vimc/vimc-configfs.c | 656 ++++++++++++++++++++
>   drivers/media/platform/vimc/vimc-configfs.h |  41 ++
>   drivers/media/platform/vimc/vimc-core.c     |  21 +-
>   drivers/media/platform/vimc/vimc-debayer.c  |  22 +
>   drivers/media/platform/vimc/vimc-scaler.c   |  26 +-
>   drivers/media/platform/vimc/vimc-sensor.c   |  21 +
>   10 files changed, 856 insertions(+), 9 deletions(-)
>   create mode 100644 drivers/media/platform/vimc/vimc-configfs.c
>   create mode 100644 drivers/media/platform/vimc/vimc-configfs.h
> 
> diff --git a/drivers/media/platform/vimc/Kconfig b/drivers/media/platform/vimc/Kconfig
> index bd221d3e1a4a..6d7836d58ef4 100644
> --- a/drivers/media/platform/vimc/Kconfig
> +++ b/drivers/media/platform/vimc/Kconfig
> @@ -1,15 +1,14 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config VIDEO_VIMC
>   	tristate "Virtual Media Controller Driver (VIMC)"
> -	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && CONFIGFS_FS
>   	select VIDEOBUF2_VMALLOC
>   	select VIDEO_V4L2_TPG
>   	help
> -	  Skeleton driver for Virtual Media Controller
> +	  Virtual Media Controller Driver
>   
> -	  This driver can be compared to the vivid driver for emulating
> +	  This driver emulates
>   	  a media node that exposes a complex media topology. The topology
> -	  is hard coded for now but is meant to be highly configurable in
> -	  the future.
> +	  is configurable through the configfs API.
>   
>   	  When in doubt, say N.
> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
> index a53b2b532e9f..eb03d487f308 100644
> --- a/drivers/media/platform/vimc/Makefile
> +++ b/drivers/media/platform/vimc/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
> -		vimc-debayer.o vimc-scaler.o vimc-sensor.o
> +		vimc-debayer.o vimc-scaler.o vimc-sensor.o  vimc-configfs.o
>   
>   obj-$(CONFIG_VIDEO_VIMC) += vimc.o
>   
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 602f80323031..5cc419e76ce7 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -9,6 +9,7 @@
>   #include <media/videobuf2-core.h>
>   #include <media/videobuf2-vmalloc.h>
>   
> +#include "vimc-configfs.h"
>   #include "vimc-common.h"
>   #include "vimc-streamer.h"
>   
> @@ -488,3 +489,23 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   
>   	return NULL;
>   }
> +
> +static void vimc_cap_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_sink_pad_api(ent_group, 0, VIMC_CFS_SINK_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_drv vimc_cap_cfs_drv = {
> +	.name = VIMC_CAP_NAME,
> +	.create_pads = vimc_cap_create_cfs_pads,
> +};
> +
> +__exit void vimc_cap_exit(void)
> +{
> +	vimc_cfs_drv_unregister(&vimc_cap_cfs_drv);
> +}
> +
> +__init void vimc_cap_init(void)
> +{
> +	vimc_cfs_drv_register(&vimc_cap_cfs_drv);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 698db7c07645..e0e3b3ab7b19 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -14,6 +14,7 @@
>   #include <media/v4l2-device.h>
>   
>   #define VIMC_PDEV_NAME "vimc"
> +#define VIMC_MAX_NAME_LEN V4L2_SUBDEV_NAME_SIZE
>   
>   /* VIMC-specific controls */
>   #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
> @@ -31,6 +32,11 @@
>   #define VIMC_IS_SRC(pad)	(pad)
>   #define VIMC_IS_SINK(pad)	(!(pad))
>   
> +#define VIMC_DEB_NAME "vimc-debayer"
> +#define VIMC_SEN_NAME "vimc-sensor"
> +#define VIMC_SCA_NAME "vimc-scaler"
> +#define VIMC_CAP_NAME "vimc-capture"
> +
>   /**
>    * struct vimc_colorimetry_clamp - Adjust colorimetry parameters
>    *
> @@ -72,6 +78,18 @@ struct vimc_platform_data {
>   	char entity_name[32];
>   };
>   
> +/**
> + * struct vimc_platform_data_core - platform data to the core
> + *
> + * @ents: list of vimc_entity_data objects allocated by the configfs
> + * @links: list of vimc_links objects allocated by the configfs
> + *
> + */
> +struct vimc_platform_data_core {
> +	struct list_head *ents;
> +	struct list_head *links;
> +};

What about changing *ents to ents and *links to links?
You seem to need this structure as platform data. No problem
with that. But then in struct vimc_cfs_device you in fact
duplicate ents and links even though the pdata member contains
almost the same kind of information. My impression is that you
need the above struct only to satisfy the requirements of
platform_device_register_data(), which wants to copy the passed
platform data. Is there any reason platform_device_register()
cannot be used instead with pdev->dev.platform_data set to the
address of the pdev member of struct vimc_cfs_device? This way
we would avoid a copy being made and we avoid duplicating ents
and links.

> +
>   /**
>    * struct vimc_pix_map - maps media bus code with v4l2 pixel format
>    *
> @@ -92,6 +110,8 @@ struct vimc_pix_map {
>   /**
>    * struct vimc_ent_device - core struct that represents a node in the topology
>    *
> + * @name:		the name of the entity
> + * @drv_name:		the name of the driver of the entity
>    * @ent:		the pointer to struct media_entity for the node
>    * @pads:		the list of pads of the node
>    * @process_frame:	callback send a frame to that node
> @@ -108,12 +128,30 @@ struct vimc_pix_map {
>    * media_entity
>    */
>   struct vimc_ent_device {
> +	char name[VIMC_MAX_NAME_LEN];
> +	char drv_name[VIMC_MAX_NAME_LEN];
>   	struct media_entity *ent;
>   	struct media_pad *pads;
>   	void * (*process_frame)(struct vimc_ent_device *ved,
>   				const void *frame);
>   	void (*vdev_get_format)(struct vimc_ent_device *ved,
>   			      struct v4l2_pix_format *fmt);
> +	struct list_head list;
> +};
> +
> +struct vimc_entity_data {
> +	char name[VIMC_MAX_NAME_LEN];
> +	char drv_name[VIMC_MAX_NAME_LEN];
> +	struct list_head list;
> +};
> +
> +struct vimc_link {
> +	char source_name[VIMC_MAX_NAME_LEN];
> +	char sink_name[VIMC_MAX_NAME_LEN];
> +	u16 source_pad;
> +	u16 sink_pad;
> +	u32 flags;
> +	struct list_head list;

Is the "list" member meant to be a head of some list, or an entry
of some other list? If entry, can you change it to "entry", please?
This comment refers to all other occurences of "struct list_head list;".

>   };

Can you document these structures, too?

>   
>   /**
> @@ -156,18 +194,26 @@ struct vimc_ent_config {
>   struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
>   void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_cap_init(void);
> +void vimc_cap_exit(void);
>   
>   struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
>   void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_deb_init(void);
> +void vimc_deb_exit(void);
>   
>   struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
>   void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_sca_init(void);
> +void vimc_sca_exit(void);
>   
>   struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
>   void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_sen_init(void);
> +void vimc_sen_exit(void);
>   
>   /**
>    * vimc_pads_init - initialize pads
> diff --git a/drivers/media/platform/vimc/vimc-configfs.c b/drivers/media/platform/vimc/vimc-configfs.c
> new file mode 100644
> index 000000000000..933aece0bb5f
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-configfs.c
> @@ -0,0 +1,656 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * vimc-configfs.c Virtual Media Controller Driver
> + *
> + * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
> + */
> +
> +#include <linux/platform_device.h>
> +
> +#include "vimc-common.h"
> +#include "vimc-configfs.h"
> +
> +#define CHAR_SEPARATOR ':'
> +#define CFS_SUBSYS_NAME "vimc"
> +#define MAX_PAD_DIGI_NUM 4
> +
> +#define ci_err(ci, fmt, ...) \
> +	pr_err("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
> +#define cg_err(cg, ...) ci_err(&(cg)->cg_item, ##__VA_ARGS__)
> +#define ci_warn(ci, fmt, ...) \
> +	pr_warn("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
> +#define cg_warn(cg, ...) ci_warn(&(cg)->cg_item, ##__VA_ARGS__)
> +#define ci_dbg(ci, fmt, ...) \
> +	pr_debug("vimc: %s: %s:" pr_fmt(fmt), (ci)->ci_name, __func__, ##__VA_ARGS__)
> +#define cg_dbg(cg, ...) ci_dbg(&(cg)->cg_item, ##__VA_ARGS__)
> +
> +#define IS_PLUGGED(cfs) (!!(cfs)->pdev)
> +
> +// currently there is no entity with more than two pads, this will
> +// change when adding the splitter entity

This comment style is against the coding style. Please use /* */.

> +#define VIMC_ENT_MAX_PADS 2
> +
> +enum vimc_cfs_hotplug_state {
> +	VIMC_CFS_HOTPLUG_STATE_UNPLUGGED = 0,
> +	VIMC_CFS_HOTPLUG_STATE_PLUGGED = 1,
> +};
> +
> +const static char *vimc_cfs_hotplug_values[2][3] = {
> +	[VIMC_CFS_HOTPLUG_STATE_UNPLUGGED] = {"unplugged\n", "unplug\n", "0\n"},
> +	[VIMC_CFS_HOTPLUG_STATE_PLUGGED] = {"plugged\n", "plug\n", "1\n"},
> +};
> +
> +/* --------------------------------------------------------------------------
> + * Pipeline structures
> + */
> +
> +static struct vimc_cfs_subsystem {
> +	struct configfs_subsystem subsys;
> +	struct list_head drvs;
> +} vimc_cfs_subsys;

If you already allocate this struct statically, why not initialize
the configfs subsystem statically? Please see drivers/usb/gadget/configfs.c.
The "drvs" list can also be initialized with LIST_HEAD_INIT.

> +
> +/* Structure which describes the whole topology */
> +struct vimc_cfs_device {
> +	struct list_head ents;
> +	struct list_head links;
> +	struct platform_device *pdev;
> +	struct vimc_platform_data_core pdata;
> +	struct config_group gdev;
> +};
> +
> +/* Structure which describes individual configuration for each entity */
> +struct vimc_cfs_ent {
> +	struct vimc_entity_data ent;
> +	struct config_group cg;
> +	struct config_group pad_groups[VIMC_ENT_MAX_PADS];
> +};
> +
> +struct vimc_cfs_link {
> +	struct vimc_link link;
> +	struct config_item ci;
> +};

Please consistently document the structs, at least with a simple /* .... */.

> +
> +void vimc_cfs_drv_register(struct vimc_cfs_drv *c_drv)
> +{
> +	pr_debug("%s: adding driver %s\n", __func__, c_drv->name);
> +	list_add(&c_drv->list, &vimc_cfs_subsys.drvs);
> +}
> +EXPORT_SYMBOL_GPL(vimc_cfs_drv_register);

Are the EXPORT_SYMBOL_GPL() needed provided that all these symbols
are used in the same vimc.ko module?

> +
> +void vimc_cfs_drv_unregister(struct vimc_cfs_drv *c_drv)
> +{
> +	pr_debug("%s: removing driver %s\n", __func__, c_drv->name);
> +	list_del(&c_drv->list);
> +}
> +EXPORT_SYMBOL_GPL(vimc_cfs_drv_unregister);
> +
> +/* --------------------------------------------------------------------------
> + * Platform Device builders
> + */
> +
> +static void vimc_cfs_device_unplug(struct vimc_cfs_device *cfs)
> +{
> +	dev_dbg(&cfs->pdev->dev, "Unplugging device\n");
> +	platform_device_unregister(cfs->pdev);
> +
> +	cfs->pdev = NULL;
> +}
> +
> +static int vimc_cfs_device_plug(struct vimc_cfs_device *cfs)
> +{
> +	cg_dbg(&cfs->gdev, "Plugging device\n");
> +
> +	if (list_empty(&cfs->ents)) {
> +		cg_warn(&cfs->gdev,
> +			"At least one entity is required to plug the device\n");
> +		return -EINVAL;
> +	}
> +
> +	cfs->pdev = platform_device_register_data(NULL, "vimc-core",
> +						  PLATFORM_DEVID_AUTO,
> +						  &cfs->pdata,
> +						  sizeof(cfs->pdata));

Please see above, platform_device_register_data() wants to copy
cfs->pdata. Do we need that copy?

> +	if (IS_ERR(cfs->pdev)) {
> +		int ret = PTR_ERR(cfs->pdev);
> +
> +		cfs->pdev = NULL;
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Links
> + */
> +
> +static ssize_t vimc_cfs_link_store_flag(struct config_item *item,
> +					const char *buf,
> +					size_t size, u32 flag)
> +{
> +	struct vimc_cfs_link *c_link =
> +		container_of(item, struct vimc_cfs_link, ci);
> +
> +	if (!strncmp(buf, "on\n", 4) || !strncmp(buf, "1\n", 3)) {
> +		c_link->link.flags |= MEDIA_LNK_FL_ENABLED;
> +		return strlen(buf);
> +	} else if (!strncmp(buf, "off\n", 5) || !strncmp(buf, "0\n", 3)) {
> +		c_link->link.flags &= ~MEDIA_LNK_FL_ENABLED;
> +		return strlen(buf);
> +	}

What about using strtobool()? [which is a wrapper around kstrtobool()]:

> +	return -EINVAL;
> +}
> +
> +static ssize_t vimc_cfs_link_show_flag(struct config_item *item,
> +				       char *buf, u32 flag)
> +{
> +	struct vimc_cfs_link *c_link = container_of(item,
> +						    struct vimc_cfs_link, ci);
> +
> +	if (c_link->link.flags & flag)
> +		strscpy(buf, "on\n", 4);
> +	else
> +		strscpy(buf, "off\n", 5);
> +	return strlen(buf);
> +}
> +
> +static ssize_t vimc_cfs_link_enabled_store(struct config_item *item,
> +					   const char *buf,
> +					   size_t size)
> +{
> +	return vimc_cfs_link_store_flag(item, buf, size, MEDIA_LNK_FL_ENABLED);
> +}
> +
> +
> +static ssize_t vimc_cfs_link_enabled_show(struct config_item *item,
> +					  char *buf)
> +{
> +	return vimc_cfs_link_show_flag(item, buf, MEDIA_LNK_FL_ENABLED);
> +}
> +
> +CONFIGFS_ATTR(vimc_cfs_link_, enabled);
> +
> +static ssize_t vimc_cfs_link_immutable_show(struct config_item *item,
> +						 char *buf)
> +{
> +	return vimc_cfs_link_show_flag(item, buf, MEDIA_LNK_FL_IMMUTABLE);
> +}
> +
> +static ssize_t vimc_cfs_link_immutable_store(struct config_item *item,
> +						   const char *buf, size_t size)
> +{
> +	return vimc_cfs_link_store_flag(item, buf, size,
> +					MEDIA_LNK_FL_IMMUTABLE);
> +}
> +
> +CONFIGFS_ATTR(vimc_cfs_link_, immutable);
> +
> +static void vimc_cfs_fill_link_data(struct config_item *src,
> +				struct config_item *target)
> +{
> +	struct config_item *src_ent_ci = src->ci_parent->ci_parent;
> +	struct config_item *trgt_ent_ci = target->ci_parent;
> +	struct vimc_cfs_link *c_link =
> +			container_of(src, struct vimc_cfs_link, ci);
> +	struct vimc_cfs_ent *vimc_src_ent = container_of(src_ent_ci,
> +							 struct vimc_cfs_ent,
> +							 cg.cg_item);
> +	struct vimc_cfs_ent *vimc_trgt_ent = container_of(trgt_ent_ci,
> +							 struct vimc_cfs_ent,
> +							 cg.cg_item);
> +	struct vimc_cfs_device *cfs = container_of(src_ent_ci->ci_parent,
> +							 struct vimc_cfs_device,
> +							 gdev.cg_item);

By accessing ci_parent you are effectively navigating the configfs hierarchy
(the hierarchy which mirrors the way config_items and config_groups are arranged
in the filesystem). This kind of access must be under the subsystem mutex as
per Documentation/filesystems/configfs/configfs.txt. This comments refers
also to other occurences of navigating the configfs hierarchy.

> +
> +	if (IS_PLUGGED(cfs))
> +		vimc_cfs_device_unplug(cfs);
> +
> +	/* src and target validation already done in the allow_link callback,
> +	 * so there is no need to check sscanf result
> +	 */
> +	sscanf(src->ci_parent->ci_name, VIMC_CFS_SRC_PAD "%hu",
> +	       &c_link->link.source_pad);
> +	sscanf(target->ci_parent->ci_name, VIMC_CFS_SINK_PAD "%hu",
> +	       &c_link->link.sink_pad);

Ditto.

> +
> +	strscpy(c_link->link.source_name, vimc_src_ent->ent.name,
> +		sizeof(c_link->link.source_name));
> +	strscpy(c_link->link.sink_name, vimc_trgt_ent->ent.name,
> +		sizeof(c_link->link.sink_name));
> +
> +	cg_dbg(&cfs->gdev, "creating link %s:%u->%s:%u\n",
> +			c_link->link.source_name, c_link->link.source_pad,
> +			c_link->link.sink_name, c_link->link.sink_pad);
> +
> +	list_add(&c_link->link.list, &cfs->links);

I'd prefer list_add(&c_link->link.entry, &cfs->links);
as pointed out above.

> +}
> +
> +static void vimc_cfs_drop_link(struct config_item *src,
> +			       struct config_item *target)
> +{
> +	struct vimc_cfs_link *c_link = container_of(src,
> +						    struct vimc_cfs_link, ci);
> +
> +	ci_dbg(&c_link->ci, "dropping link %s:%u->%s:%u\n",
> +	       c_link->link.source_name, c_link->link.source_pad,
> +	       c_link->link.sink_name, c_link->link.sink_pad);
> +
> +	c_link->link.source_pad = 0;
> +	c_link->link.sink_pad = 0;
> +	memset(c_link->link.source_name, 0, sizeof(c_link->link.source_name));
> +	memset(c_link->link.sink_name, 0, sizeof(c_link->link.sink_name));
> +	list_del(&c_link->link.list);
> +}
> +
> +int vimc_cfs_allow_link(struct config_item *src, struct config_item *target)
> +{
> +	struct config_item *s = src;
> +	struct config_item *t = target;
> +	struct config_item *src_ent_ci, *trgt_ent_ci;
> +	int i;
> +	int ret = 0;
> +	struct configfs_subsystem *subsys = &vimc_cfs_subsys.subsys;
> +
> +	if (strncmp(target->ci_name, VIMC_CFS_SINK_PAD,
> +		    sizeof(VIMC_CFS_SINK_PAD) - 1)) {
> +		ci_warn(src, "link target (%s) does not start with '%s'\n",
> +			target->ci_name, VIMC_CFS_SINK_PAD);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&subsys->su_mutex);
> +	for (i = 0; i < 3; i++)
> +		s = s->ci_parent;

Can you guarantee that there exist all 3 ancestors? If yes, then why not
s = s->ci_parent->ci_parent->ci_parent;

Also please add a comment what 3 levels up means (e.g. "access vimc device's
configfs root" /if really accessing vimc device's configfs root/)

> +
> +	for (i = 0; i < 2; i++) {
> +		t = t->ci_parent;
> +		if (!t) {
> +			ci_warn(src, "link target (%s) is not a sink pad\n",
> +				target->ci_name);
> +			ret = -EINVAL;
> +			goto end;
> +		}
> +	}

Please comment what accessing 2 levels up means.

> +
> +	if (s != t) {
> +		ci_warn(src, "not allow linking between different vimcs devices: (%s) and (%s)\n",

"linking between different vimc devices: (%s) and (%s) not allowed" ?

> +			s->ci_name, t->ci_name);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +	src_ent_ci = src->ci_parent->ci_parent;
> +	trgt_ent_ci = target->ci_parent;
> +	if (src_ent_ci == trgt_ent_ci) {
> +		ci_warn(src, "both pads belong to the same entity (%s) - this is not allowed\n",

"linking pads of the same entity (%s) not allowed" ?

> +				src_ent_ci->ci_name);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	vimc_cfs_fill_link_data(src, target);
> +end:
> +	mutex_unlock(&subsys->su_mutex);
> +	return ret;
> +}
> +
> +static void vimc_cfs_prepare_link_release(struct config_item *item)

I'd drop the "prepare_" substring from the function name.

> +{
> +	struct vimc_cfs_link *c_link = container_of(item,
> +						    struct vimc_cfs_link, ci);
> +
> +	ci_dbg(item, "releasing link '%s'", item->ci_name);
> +	kfree(c_link);
> +}
> +static struct configfs_attribute *vimc_cfs_link_attrs[] = {
> +	&vimc_cfs_link_attr_enabled,
> +	&vimc_cfs_link_attr_immutable,
> +	NULL,
> +};
> +
> +static struct configfs_item_operations vimc_cfs_allow_link_item_ops = {

I'd drop the "allow_" substring from the struct name, because it is
not only allow, but also actually drop. And release.

> +	.allow_link = vimc_cfs_allow_link,
> +	.drop_link = vimc_cfs_drop_link,
> +	.release = vimc_cfs_prepare_link_release,
> +};
> +
> +struct config_item_type vimc_cfs_allow_link_type = {

Ditto.

> +	.ct_owner = THIS_MODULE,
> +	.ct_item_ops = &vimc_cfs_allow_link_item_ops,
> +	.ct_attrs = vimc_cfs_link_attrs,
> +};
> +
> +/* --------------------------------------------------------------------------
> + * Source pad instance
> + */
> +
> +static void vimc_cfs_src_pad_prepare_link_drop_item(

Why "prepare_link_" ?

> +		struct config_group *src_pad_group,
> +		struct config_item *link_item)
> +{
> +
> +	struct config_item *cfs_item;
> +	struct vimc_cfs_device *cfs;
> +
> +	cfs_item = src_pad_group->cg_item.ci_parent->ci_parent;
> +	cfs = container_of(cfs_item->ci_parent, struct vimc_cfs_device,
> +			   gdev.cg_item);

Hierarchy navigation.

> +	cg_dbg(&cfs->gdev, "dropping prepared link '%s'\n",
> +	       link_item->ci_name);
> +	if (IS_PLUGGED(cfs))
> +		vimc_cfs_device_unplug(cfs);
> +	config_item_put(link_item);
> +}
> +
> +static struct config_item *vimc_cfs_src_pad_prepare_link_make_item(
> +			   struct config_group *group,
> +			   const char *name)
> +{
> +	struct vimc_cfs_link *c_link = kzalloc(sizeof(*c_link), GFP_KERNEL);
> +
> +	cg_dbg(group, "link name is '%s'\n", name);
> +	config_item_init_type_name(&c_link->ci, name,
> +				   &vimc_cfs_allow_link_type);
> +	return &c_link->ci;
> +}
> +struct config_item_type vimc_cfs_empty_type = {
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct configfs_group_operations vimc_cfs_src_pad_ops = {
> +	.make_item = vimc_cfs_src_pad_prepare_link_make_item,
> +	.drop_item = vimc_cfs_src_pad_prepare_link_drop_item
> +};
> +
> +struct config_item_type vimc_cfs_src_pad_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_group_ops = &vimc_cfs_src_pad_ops,
> +};
> +
> +/* --------------------------------------------------------------------------
> + * Device instance
> + */
> +
> +static void vimc_cfs_ent_release(struct config_item *item)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(item, struct vimc_cfs_ent,
> +	cg.cg_item);
> +
> +	ci_dbg(item, "releasing entity '%s' of driver '%s'",
> +	       c_ent->ent.name,
> +	       c_ent->ent.drv_name);
> +	kfree(c_ent);
> +}
> +
> +static struct configfs_item_operations vimc_cfs_ent_item_ops = {
> +	.release	= vimc_cfs_ent_release,
> +};
> +
> +struct config_item_type vimc_cfs_ent_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_item_ops = &vimc_cfs_ent_item_ops,
> +};
> +
> +void vimc_cfs_add_sink_pad_api(struct config_group *ent_group,
> +					int pad_idx, const char *name)

Why the "_api"?

> +{
> +	struct vimc_cfs_ent *c_ent = container_of(ent_group,
> +						  struct vimc_cfs_ent, cg);
> +
> +	config_group_init_type_name(&c_ent->pad_groups[pad_idx], name,
> +				    &vimc_cfs_empty_type);
> +	configfs_add_default_group(&c_ent->pad_groups[pad_idx], ent_group);
> +}
> +EXPORT_SYMBOL_GPL(vimc_cfs_add_sink_pad_api);
> +
> +void vimc_cfs_add_source_pad_api(struct config_group *ent_group,
> +					  int pad_idx, const char *name)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(ent_group,
> +						  struct vimc_cfs_ent, cg);
> +
> +	config_group_init_type_name(&c_ent->pad_groups[pad_idx], name,
> +				    &vimc_cfs_src_pad_type);
> +	configfs_add_default_group(&c_ent->pad_groups[pad_idx], ent_group);
> +}
> +EXPORT_SYMBOL_GPL(vimc_cfs_add_source_pad_api);
> +
> +static void vimc_cfs_dev_drop_ent_item(struct config_group *dev_group,
> +					   struct config_item *ent_item)
> +{
> +	struct vimc_cfs_ent *c_ent = container_of(ent_item, struct vimc_cfs_ent,
> +						  cg.cg_item);
> +	struct vimc_cfs_device *cfs = container_of(dev_group,
> +						   struct vimc_cfs_device,
> +						   gdev);
> +
> +	if (IS_PLUGGED(cfs))
> +		vimc_cfs_device_unplug(cfs);
> +
> +	cg_dbg(&cfs->gdev, "dropping entity '%s' of driver '%s'",
> +	       c_ent->ent.name, c_ent->ent.drv_name);
> +	list_del(&c_ent->ent.list);

Can something in vimc race with this removal?

> +	config_item_put(ent_item);
> +}
> +
> +static struct config_group *vimc_cfs_dev_make_ent_group(
> +			struct config_group *group, const char *name)
> +{
> +	struct vimc_cfs_device *cfs = container_of(group,
> +						   struct vimc_cfs_device,
> +						   gdev);
> +	char *ent_name, *sep = strchr(name, CHAR_SEPARATOR);
> +	struct vimc_cfs_ent *c_ent;
> +	struct vimc_entity_data *ent;
> +	size_t drv_namelen;
> +	struct vimc_cfs_drv *c_drv = NULL;
> +
> +	cg_dbg(group, "trying to make entity '%s'\n", name);
> +	if (IS_PLUGGED(cfs))
> +		vimc_cfs_device_unplug(cfs);

Perhaps delay this until after syntax is checked and memory allocated?
Actually, it seems until the beginning of body of the first nested if
inside list_for_each_entry below.

Otherwise if some of those fail then the side effect of invoking this
function will be vimc_cfs_device_unplug(cfs); is it expected?

> +
> +	/* Parse format "drv_name:ent_name" */
> +	if (!sep) {
> +		cg_warn(&cfs->gdev,
> +			"Could not find separator '%c'\n", CHAR_SEPARATOR);
> +		goto syntax_error;
> +	}
> +	drv_namelen = (size_t)(sep - name);
> +	ent_name = &sep[1];
> +	if (!*ent_name || !drv_namelen) {
> +		cg_warn(&cfs->gdev,
> +			"%s: Driver name and entity name can't be empty.\n",
> +		       name);
> +		goto syntax_error;
> +	}
> +	if (drv_namelen >= VIMC_MAX_NAME_LEN) {
> +		cg_err(&cfs->gdev,
> +		       "%s: Driver name length should be less than %u.\n",
> +		       name, VIMC_MAX_NAME_LEN);
> +		goto syntax_error;
> +	}
> +	list_for_each_entry(ent, &cfs->ents, list) {
> +		if (!strncmp(ent->name, ent_name, sizeof(ent->name))) {
> +			cg_err(&cfs->gdev, "entity `%s` already exist\n",
> +			       ent->name);
> +			goto syntax_error;
> +		}
> +	}
> +
> +	c_ent = kzalloc(sizeof(*c_ent), GFP_KERNEL);
> +	if (!c_ent)
> +		return ERR_PTR(-ENOMEM);
> +
> +	strscpy(c_ent->ent.drv_name, name, drv_namelen + 1);
> +	strscpy(c_ent->ent.name, ent_name, sizeof(c_ent->ent.name));
> +
> +	/* Configure group */
> +
> +	/* TODO: add support for hotplug at entity level */
> +	list_for_each_entry(c_drv, &vimc_cfs_subsys.drvs, list) {
> +		if (!strcmp(c_ent->ent.drv_name, c_drv->name)) {
> +			config_group_init_type_name(&c_ent->cg, name,
> +						    &vimc_cfs_ent_type);
> +			if (c_drv->create_pads)
> +				c_drv->create_pads(&c_ent->cg);
> +			list_add(&c_ent->ent.list, &cfs->ents);
> +			return &c_ent->cg;
> +		}
> +	}
> +	cg_warn(&cfs->gdev, "entity type %s not found\n", c_ent->ent.drv_name);
> +	kfree(c_ent);
> +	return ERR_PTR(-EINVAL);
> +
> +syntax_error:
> +	cg_err(&cfs->gdev,
> +		"couldn't create entity %s, wrong syntax.", name);
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
> +	return -EINVAL;
> +}
> +
> +static ssize_t vimc_cfs_dev_hotplug_show(struct config_item *item,
> +					      char *buf)
> +{
> +	struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +						   gdev.cg_item);
> +
> +	strcpy(buf, vimc_cfs_hotplug_values[IS_PLUGGED(cfs)][0]);
> +	return strlen(buf);
> +}
> +
> +static int vimc_cfs_hotplug_set(struct vimc_cfs_device *cfs,
> +				enum vimc_cfs_hotplug_state state)
> +{
> +	if (state == IS_PLUGGED(cfs)) {
> +		return 0;
> +	} else if (state == VIMC_CFS_HOTPLUG_STATE_UNPLUGGED) {
> +		vimc_cfs_device_unplug(cfs);
> +		return 0;
> +	} else if (state == VIMC_CFS_HOTPLUG_STATE_PLUGGED) {
> +		return vimc_cfs_device_plug(cfs);
> +	}
> +	return -EINVAL;
> +}

Is this helper really needed? The below function is short enough
to accommodate the above if statement.

> +
> +static ssize_t vimc_cfs_dev_hotplug_store(struct config_item *item,
> +					       const char *buf, size_t size)
> +{
> +	struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +						   gdev.cg_item);
> +	int state = vimc_cfs_decode_state(buf, size);
> +
> +	if (vimc_cfs_hotplug_set(cfs, state))
> +		return -EINVAL;
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
> +	ci_dbg(item, "releasing dev %s\n", item->ci_name);
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
> +	if (IS_PLUGGED(cfs))
> +		vimc_cfs_device_unplug(cfs);
> +	cg_dbg(&cfs->gdev, "dropping subsys '%s'", item->ci_name);
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
> +	INIT_LIST_HEAD(&cfs->ents);
> +	INIT_LIST_HEAD(&cfs->links);
> +	cfs->pdata.links = &cfs->links;
> +	cfs->pdata.ents = &cfs->ents;

See the comment in the beginning about platofrm data.

> +
> +	config_group_init_type_name(&cfs->gdev, name, &vimc_cfs_dev_type);
> +
> +	return &cfs->gdev;
> +}
> +
> +static struct configfs_group_operations vimc_cfs_subsys_group_ops = {
> +	.make_group	= vimc_cfs_subsys_make_dev_group,
> +	.drop_item	= vimc_cfs_subsys_drop_dev_item,
> +};
> +
> +static struct config_item_type vimc_cfs_subsys_type = {
> +	.ct_group_ops = &vimc_cfs_subsys_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +int vimc_cfs_subsys_register(void)
> +{
> +	struct configfs_subsystem *subsys = &vimc_cfs_subsys.subsys;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&vimc_cfs_subsys.drvs);
> +	config_group_init_type_name(&subsys->su_group, CFS_SUBSYS_NAME,
> +				    &vimc_cfs_subsys_type);
> +	mutex_init(&subsys->su_mutex);

See one of the comments above for static initialization of the subsystem.

> +	ret = configfs_register_subsystem(subsys);
> +
> +	return ret;
> +}
> +
> +void vimc_cfs_subsys_unregister(void)
> +{
> +	configfs_unregister_subsystem(&vimc_cfs_subsys.subsys);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-configfs.h b/drivers/media/platform/vimc/vimc-configfs.h
> new file mode 100644
> index 000000000000..0d3afdb31fdd
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
> +#define VIMC_CFS_SRC_PAD "pad:source:"
> +#define VIMC_CFS_SINK_PAD "pad:sink:"
> +
> +#define VIMC_CFS_SRC_PAD_NUM(n) "pad:source:" #n
> +#define VIMC_CFS_SINK_PAD_NUM(n) "pad:sink:" #n
> +
> +extern struct config_item_type vimc_default_cfs_pad_type;
> +
> +void vimc_cfs_add_source_pad_api(struct config_group *ent_group,
> +					int pad_idx, const char *name);
> +
> +void vimc_cfs_add_sink_pad_api(struct config_group *ent_group,
> +				      int pad_idx, const char *name);
> +struct vimc_cfs_drv {
> +	const char *name;
> +	struct list_head list;

Entry or list?

> +
> +	void (*const create_pads)(struct config_group *parent);
> +};
> +
> +int vimc_cfs_subsys_register(void);
> +
> +void vimc_cfs_subsys_unregister(void);
> +
> +void vimc_cfs_drv_register(struct vimc_cfs_drv *c_drv);
> +
> +void vimc_cfs_drv_unregister(struct vimc_cfs_drv *c_drv);
> +
> +#endif
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 6e3e5c91ae39..476bad2cb2de 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -15,6 +15,8 @@
>   
>   #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
>   
> +#include "vimc-configfs.h"
> +
>   #define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
>   	.src_ent = src,						\
>   	.src_pad = srcpad,					\
> @@ -335,13 +337,30 @@ static int __init vimc_init(void)
>   		return ret;
>   	}
>   
> +	ret = vimc_cfs_subsys_register();
> +	if (ret) {
> +		pr_err("%s: configfs subsys registration failed (%d)\n",
> +		       __func__, ret);
> +		platform_driver_unregister(&vimc_pdrv);
> +		return ret;
> +	}
> +
> +	vimc_sen_init();
> +	vimc_deb_init();
> +	vimc_sca_init();
> +	vimc_cap_init();
>   	return 0;
>   }
>   
>   static void __exit vimc_exit(void)
>   {
> -	platform_driver_unregister(&vimc_pdrv);
> +	vimc_sen_exit();
> +	vimc_deb_exit();
> +	vimc_sca_exit();
> +	vimc_cap_exit();
>   
> +	vimc_cfs_subsys_unregister();
> +	platform_driver_unregister(&vimc_pdrv);
>   	platform_device_unregister(&vimc_dev.pdev);
>   }
>   
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index feac47d79449..e461b155e514 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -12,6 +12,7 @@
>   #include <media/v4l2-subdev.h>
>   
>   #include "vimc-common.h"
> +#include "vimc-configfs.h"
>   
>   static unsigned int deb_mean_win_size = 3;
>   module_param(deb_mean_win_size, uint, 0000);
> @@ -533,3 +534,24 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   
>   	return &vdeb->ved;
>   }
> +
> +static void vimc_deb_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_source_pad_api(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(1));
> +	vimc_cfs_add_sink_pad_api(ent_group, 1, VIMC_CFS_SINK_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_drv vimc_deb_cfs_drv = {
> +	.name = VIMC_DEB_NAME,
> +	.create_pads = vimc_deb_create_cfs_pads,
> +};
> +
> +__exit void vimc_deb_exit(void)
> +{
> +	vimc_cfs_drv_unregister(&vimc_deb_cfs_drv);
> +}
> +
> +__init void vimc_deb_init(void)
> +{
> +	vimc_cfs_drv_register(&vimc_deb_cfs_drv);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index a6a3cc5be872..e5cf0073d68a 100644
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
> @@ -373,14 +374,35 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>   				   &vimc_sca_int_ops, &vimc_sca_ops);
>   	if (ret) {
>   		kfree(vsca);
> -		return NULL;
> +		return ERR_PTR(ret);
>   	}
>   
>   	vsca->ved.process_frame = vimc_sca_process_frame;
> -	vsca->dev = &vimc->pdev.dev;
> +	vsca->dev = vimc->mdev.dev;
>   
>   	/* Initialize the frame format */
>   	vsca->sink_fmt = sink_fmt_default;
>   
>   	return &vsca->ved;
>   }
> +
> +static void vimc_sca_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_source_pad_api(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(1));
> +	vimc_cfs_add_sink_pad_api(ent_group, 1, VIMC_CFS_SINK_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_drv vimc_sca_cfs_drv = {
> +	.name = VIMC_SCA_NAME,
> +	.create_pads = vimc_sca_create_cfs_pads,
> +};
> +
> +__exit void vimc_sca_exit(void)
> +{
> +	vimc_cfs_drv_unregister(&vimc_sca_cfs_drv);
> +}
> +
> +__init void vimc_sca_init(void)
> +{
> +	vimc_cfs_drv_register(&vimc_sca_cfs_drv);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 46dc6a535abe..22e3ad98c818 100644
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
> @@ -391,3 +392,23 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   
>   	return NULL;
>   }
> +
> +static void vimc_sen_create_cfs_pads(struct config_group *ent_group)
> +{
> +	vimc_cfs_add_source_pad_api(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(0));
> +}
> +
> +struct vimc_cfs_drv vimc_sen_cfs_drv = {
> +	.name = VIMC_SEN_NAME,
> +	.create_pads = vimc_sen_create_cfs_pads,
> +};
> +
> +__exit void vimc_sen_exit(void)
> +{
> +	vimc_cfs_drv_unregister(&vimc_sen_cfs_drv);
> +}
> +
> +__init void vimc_sen_init(void)
> +{
> +	vimc_cfs_drv_register(&vimc_sen_cfs_drv);
> +}
> 

Andrzej
