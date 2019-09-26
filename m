Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3003BFA38
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 21:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbfIZTlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 15:41:46 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39612 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbfIZTlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 15:41:46 -0400
Received: by mail-io1-f66.google.com with SMTP id a1so9715585ioc.6
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 12:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PnySkp/0SJYUbofVPCadN2UpKbr0sqyCWHLthTsrI8Y=;
        b=XZaOxAhx1xwadq3K3m/pykbFc4D9G8oJzDWOI9AZbNXRPkh7S/ME6Wmot2LukyELZf
         gwCgMzT7n6QUqxq7+vJZbmT7eqo6TlStshihVBm5u8+i09WH7QQxY2TqoCQv3A+O/XP+
         3fDPTOhQTIeBVGKUL57yIttY1Oqz7Qdgy6j1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PnySkp/0SJYUbofVPCadN2UpKbr0sqyCWHLthTsrI8Y=;
        b=sfzETnAXmW0vPZtCoIypUm+XEPflA+MBBkRQ4dvC68I+jRgZZJ9tHpQL1b1IFJpKm3
         1s9dze+FhrzftlTRcOtpSLIDIgA3tb9iFp9Z/IXTOcBCxxlcgq9CO0K60lr1S3kKNE+L
         pqesBkTda3exyU0/TpVKChW1OzA0+98HMjxNCd/XBnA5cp3UekfZUEM9mx8brdAUQaj3
         FtHFXOT2nNut/meXOXGX33Ut29PYy9lYU0YZaiYwwte2yaRqkvKWkuuU0/BQf3c3U4cI
         UekuWMiBPrfKvyj2NvjyH1/dciXxmWOd99iXXJUCPZW/2epvp0xPE4wT5wFsyOaFlDsw
         4/fw==
X-Gm-Message-State: APjAAAXC4Rt3hKt35MMCBA/ldkb4mQarpnJE3JAGPSeC3iKtpt+/K/z3
        7CRLZ6qD0fG5axmpOft71+5ybg==
X-Google-Smtp-Source: APXvYqy2bYKZKkRop+lxS7YWhATC5HLiRuA+43mkZdaFjsyasXNhuklY4+cTVk2coGH/zXjJji54dA==
X-Received: by 2002:a02:2b2e:: with SMTP id h46mr5009257jaa.141.1569526904762;
        Thu, 26 Sep 2019 12:41:44 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b26sm157300ilb.12.2019.09.26.12.41.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 12:41:44 -0700 (PDT)
Subject: Re: [PATCH 4/5] media: vimc: use configfs instead of having hardcoded
 configuration
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        "skha >> Shuah Khan" <skhan@linuxfoundation.org>
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
 <20190919203208.12515-5-dafna.hirschfeld@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6ad1b254-dca2-9153-5d71-52d2c914ae5b@linuxfoundation.org>
Date:   Thu, 26 Sep 2019 13:41:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919203208.12515-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/19/19 2:32 PM, Dafna Hirschfeld wrote:
> Use configfs in order to create a device and set its topology
> and remove the hardcoded device.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> [refactored for upstream]

What does this mean?

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   drivers/media/platform/vimc/vimc-capture.c  |  21 +-
>   drivers/media/platform/vimc/vimc-common.h   |  50 +--
>   drivers/media/platform/vimc/vimc-configfs.c |   6 +-
>   drivers/media/platform/vimc/vimc-core.c     | 319 ++++++++------------
>   drivers/media/platform/vimc/vimc-debayer.c  |  13 +-
>   drivers/media/platform/vimc/vimc-scaler.c   |   9 +-
>   drivers/media/platform/vimc/vimc-sensor.c   |  12 +-
>   7 files changed, 170 insertions(+), 260 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 5cc419e76ce7..6ccf879c0b75 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -335,11 +335,12 @@ static void vimc_cap_release(struct video_device *vdev)
>   	kfree(vcap);
>   }
>   
> -void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +void vimc_cap_rm(struct vimc_ent_device *ved)
>   {
> -	struct vimc_cap_device *vcap;
> +	struct vimc_cap_device *vcap = container_of(ved,
> +						    struct vimc_cap_device,
> +						    ved);
>   
> -	vcap = container_of(ved, struct vimc_cap_device, ved);
>   	vb2_queue_release(&vcap->queue);
>   	media_entity_cleanup(ved->ent);
>   	video_unregister_device(&vcap->vdev);
> @@ -397,8 +398,9 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   	/* Allocate the vimc_cap_device struct */
>   	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
>   	if (!vcap)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
> +	strscpy(vcap->ved.name, vcfg_name, sizeof(vcap->ved.name));
>   	/* Allocate the pads */
>   	vcap->ved.pads =
>   		vimc_pads_init(1, (const unsigned long[1]) {MEDIA_PAD_FL_SINK});
> @@ -408,7 +410,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   	}
>   
>   	/* Initialize the media entity */
> -	vcap->vdev.entity.name = vcfg_name;
> +	vcap->vdev.entity.name = vcap->ved.name;
>   	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>   	ret = media_entity_pads_init(&vcap->vdev.entity,
>   				     1, vcap->ved.pads);
> @@ -432,7 +434,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   
>   	ret = vb2_queue_init(q);
>   	if (ret) {
> -		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
> +		dev_err(vimc->mdev.dev, "%s: vb2 queue init failed (err=%d)\n",
>   			vcfg_name, ret);
>   		goto err_clean_m_ent;
>   	}
> @@ -452,7 +454,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   	vcap->ved.ent = &vcap->vdev.entity;
>   	vcap->ved.process_frame = vimc_cap_process_frame;
>   	vcap->ved.vdev_get_format = vimc_cap_get_format;
> -	vcap->dev = &vimc->pdev.dev;
> +
> +	vcap->dev = vimc->mdev.dev;
>   
>   	/* Initialize the video_device struct */
>   	vdev = &vcap->vdev;
> @@ -471,7 +474,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   	/* Register the video_device with the v4l2 and the media framework */
>   	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
>   	if (ret) {
> -		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
> +		dev_err(vimc->mdev.dev, "%s: video register failed (err=%d)\n",
>   			vcap->vdev.name, ret);
>   		goto err_release_queue;
>   	}
> @@ -487,7 +490,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   err_free_vcap:
>   	kfree(vcap);
>   
> -	return NULL;
> +	return ERR_PTR(ret);
>   }
>   
>   static void vimc_cap_create_cfs_pads(struct config_group *ent_group)
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index e0e3b3ab7b19..5c7f451a7bf0 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -63,21 +63,6 @@ do {									\
>   		(fmt)->xfer_func = V4L2_XFER_FUNC_DEFAULT;		\
>   } while (0)
>   
> -/**
> - * struct vimc_platform_data - platform data to components
> - *
> - * @entity_name:	The name of the entity to be created
> - *
> - * Board setup code will often provide additional information using the device's
> - * platform_data field to hold additional information.
> - * When injecting a new platform_device in the component system the core needs
> - * to provide to the corresponding submodules the name of the entity that should
> - * be used when registering the subdevice in the Media Controller system.
> - */
> -struct vimc_platform_data {
> -	char entity_name[32];
> -};
> -
>   /**
>    * struct vimc_platform_data_core - platform data to the core
>    *
> @@ -157,61 +142,56 @@ struct vimc_link {
>   /**
>    * struct vimc_device - main device for vimc driver
>    *
> - * @pdev	pointer to the platform device
> - * @pipe_cfg	pointer to the vimc pipeline configuration structure
> - * @ent_devs	array of vimc_ent_device pointers
>    * @mdev	the associated media_device parent
>    * @v4l2_dev	Internal v4l2 parent device
> + * @ents	list of vimc_ent_device objects
>    */
>   struct vimc_device {
> -	struct platform_device pdev;
> -	const struct vimc_pipeline_config *pipe_cfg;
> -	struct vimc_ent_device **ent_devs;
>   	struct media_device mdev;
>   	struct v4l2_device v4l2_dev;
> +
> +	struct list_head ents;
>   };
>   
>   /**
> - * struct vimc_ent_config	Structure which describes individual
> - *				configuration for each entity
> - *
> - * @name			entity name
> - * @ved				pointer to vimc_ent_device (a node in the
> - *					topology)
> + * struct ent_type		Structure for the add and remove callbacks
> + *				of entity type
> + * @name			entity type name
>    * @add				subdev add hook - initializes and registers
>    *					subdev called from vimc-core
>    * @rm				subdev rm hook - unregisters and frees
>    *					subdev called from vimc-core
>    */
> -struct vimc_ent_config {
> -	const char *name;
> -	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
> +
> +struct vimc_ent_type {
> +	const char name[VIMC_MAX_NAME_LEN];
> +	struct vimc_ent_device*	(*add)(struct vimc_device *vimc,
>   				       const char *vcfg_name);
> -	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +	void (*rm)(struct vimc_ent_device *ent);
>   };
>   
>   /* prototypes for vimc_ent_config add and rm hooks */
>   struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
> -void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_cap_rm(struct vimc_ent_device *ent);
>   void vimc_cap_init(void);
>   void vimc_cap_exit(void);
>   
>   struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
> -void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_deb_rm(struct vimc_ent_device *ent);
>   void vimc_deb_init(void);
>   void vimc_deb_exit(void);
>   
>   struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
> -void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_sca_rm(struct vimc_ent_device *ent);
>   void vimc_sca_init(void);
>   void vimc_sca_exit(void);
>   
>   struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
> -void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_sen_rm(struct vimc_ent_device *ent);
>   void vimc_sen_init(void);
>   void vimc_sen_exit(void);
>   
> diff --git a/drivers/media/platform/vimc/vimc-configfs.c b/drivers/media/platform/vimc/vimc-configfs.c
> index 933aece0bb5f..e99f926d2f93 100644
> --- a/drivers/media/platform/vimc/vimc-configfs.c
> +++ b/drivers/media/platform/vimc/vimc-configfs.c
> @@ -335,8 +335,8 @@ static void vimc_cfs_src_pad_prepare_link_drop_item(
>   	cfs_item = src_pad_group->cg_item.ci_parent->ci_parent;
>   	cfs = container_of(cfs_item->ci_parent, struct vimc_cfs_device,
>   			   gdev.cg_item);
> -	cg_dbg(&cfs->gdev, "dropping prepared link '%s'\n",
> -	       link_item->ci_name);
> +	cg_dbg(&cfs->gdev, "dropping prepared link '%s' cfs=%p\n",
> +	       link_item->ci_name, cfs);
>   	if (IS_PLUGGED(cfs))
>   		vimc_cfs_device_unplug(cfs);
>   	config_item_put(link_item);
> @@ -614,7 +614,7 @@ static struct config_group *vimc_cfs_subsys_make_dev_group(
>   	if (!cfs)
>   		return ERR_PTR(-ENOMEM);
>   
> -	cg_dbg(&cfs->gdev, "making dev group '%s'", name);
> +	cg_dbg(&cfs->gdev, "making dev group '%s', cfs=%p", name, cfs);
>   	/* Configure platform data */
>   	INIT_LIST_HEAD(&cfs->ents);
>   	INIT_LIST_HEAD(&cfs->links);
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 476bad2cb2de..06a36cc1f00c 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -17,178 +17,137 @@
>   
>   #include "vimc-configfs.h"
>   
> -#define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
> -	.src_ent = src,						\
> -	.src_pad = srcpad,					\
> -	.sink_ent = sink,					\
> -	.sink_pad = sinkpad,					\
> -	.flags = link_flags,					\
> -}
> -
> -/* Structure which describes links between entities */
> -struct vimc_ent_link {
> -	unsigned int src_ent;
> -	u16 src_pad;
> -	unsigned int sink_ent;
> -	u16 sink_pad;
> -	u32 flags;
> -};
>   
> -/* Structure which describes the whole topology */
> -struct vimc_pipeline_config {
> -	const struct vimc_ent_config *ents;
> -	size_t num_ents;
> -	const struct vimc_ent_link *links;
> -	size_t num_links;
> -};
> -
> -/* --------------------------------------------------------------------------
> - * Topology Configuration
> - */
> -
> -static struct vimc_ent_config ent_config[] = {
> -	{
> -		.name = "Sensor A",
> -		.add = vimc_sen_add,
> -		.rm = vimc_sen_rm,
> -	},
> +static struct vimc_ent_type ent_types[] = {
>   	{
> -		.name = "Sensor B",
> +		.name = VIMC_SEN_NAME,
>   		.add = vimc_sen_add,
>   		.rm = vimc_sen_rm,
>   	},
>   	{
> -		.name = "Debayer A",
> +		.name = VIMC_DEB_NAME,
>   		.add = vimc_deb_add,
>   		.rm = vimc_deb_rm,
>   	},
>   	{
> -		.name = "Debayer B",
> -		.add = vimc_deb_add,
> -		.rm = vimc_deb_rm,
> -	},
> -	{
> -		.name = "Raw Capture 0",
> -		.add = vimc_cap_add,
> -		.rm = vimc_cap_rm,
> -	},
> -	{
> -		.name = "Raw Capture 1",
> +		.name = VIMC_CAP_NAME,
>   		.add = vimc_cap_add,
>   		.rm = vimc_cap_rm,
>   	},
>   	{
> -		/* TODO: change this to vimc-input when it is implemented */
> -		.name = "RGB/YUV Input",
> -		.add = vimc_sen_add,
> -		.rm = vimc_sen_rm,
> -	},
> -	{
> -		.name = "Scaler",
> +		.name = VIMC_SCA_NAME,
>   		.add = vimc_sca_add,
>   		.rm = vimc_sca_rm,
>   	},
> -	{
> -		.name = "RGB/YUV Capture",
> -		.add = vimc_cap_add,
> -		.rm = vimc_cap_rm,
> -	},
>   };
>   
> -static const struct vimc_ent_link ent_links[] = {
> -	/* Link: Sensor A (Pad 0)->(Pad 0) Debayer A */
> -	VIMC_ENT_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -	/* Link: Sensor A (Pad 0)->(Pad 0) Raw Capture 0 */
> -	VIMC_ENT_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -	/* Link: Sensor B (Pad 0)->(Pad 0) Debayer B */
> -	VIMC_ENT_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -	/* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
> -	VIMC_ENT_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -	/* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
> -	VIMC_ENT_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
> -	/* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
> -	VIMC_ENT_LINK(3, 1, 7, 0, 0),
> -	/* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
> -	VIMC_ENT_LINK(6, 0, 7, 0, 0),
> -	/* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
> -	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -};
> -
> -static struct vimc_pipeline_config pipe_cfg = {
> -	.ents		= ent_config,
> -	.num_ents	= ARRAY_SIZE(ent_config),
> -	.links		= ent_links,
> -	.num_links	= ARRAY_SIZE(ent_links)
> -};
> +static struct vimc_ent_type *vimc_get_ent_type(const char *drv_name)
> +{
> +	int i;
>   
> -/* -------------------------------------------------------------------------- */
> +	for (i = 0; i < ARRAY_SIZE(ent_types); i++)
> +		if (!strcmp(drv_name, ent_types[i].name))
> +			return &ent_types[i];
> +	return NULL;
> +}
>   
> -static void vimc_rm_links(struct vimc_device *vimc)
> +struct vimc_ent_device *vimc_get_ent_dev(const struct vimc_device *vimc,
> +					 const char *const name)
>   {
> -	unsigned int i;
> +	struct vimc_ent_device *ent;
>   
> -	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
> -		media_entity_remove_links(vimc->ent_devs[i]->ent);
> +	list_for_each_entry(ent, &vimc->ents, list) {
> +		if (!strcmp(ent->name, name))
> +			return ent;
> +	}
> +	return NULL;
>   }
> +//TODO - remove subdevs upon failure
> +static int vimc_core_links_create(const struct vimc_device *vimc,
> +				  const struct vimc_platform_data_core *pdata)
> +{
> +	struct vimc_link *link;
> +
> +	list_for_each_entry(link, pdata->links, list) {
> +		struct vimc_ent_device *source = vimc_get_ent_dev(vimc,
> +						 link->source_name);
> +		struct vimc_ent_device *sink = vimc_get_ent_dev(vimc,
> +					       link->sink_name);
> +		int ret;
> +
> +		ret = media_create_pad_link(source->ent,
> +					    link->source_pad,
> +					    sink->ent,
> +					    link->sink_pad,
> +					    link->flags);
>   
> -static int vimc_create_links(struct vimc_device *vimc)
> +		if (ret) {
> +			pr_err("%s: failed to create link %s:%u->%s:%u\n",
> +					__func__,
> +					source->name, link->source_pad,
> +					sink->name, link->sink_pad);
> +			return ret;
> +		}
> +		pr_debug("%s: created link %s:%u->%s:%u\n", __func__,
> +				source->name, link->source_pad,
> +				sink->name, link->sink_pad);
> +	}
> +	return 0;
> +}
> +static void vimc_rm_subdevs(struct vimc_device *vimc,
> +			    const struct vimc_platform_data_core *pdata)
>   {
> -	unsigned int i;
> -	int ret;
> +	struct vimc_ent_device *ent;
> +	struct vimc_ent_device *ent_tmp;
>   
> -	/* Initialize the links between entities */
> -	for (i = 0; i < vimc->pipe_cfg->num_links; i++) {
> -		const struct vimc_ent_link *link = &vimc->pipe_cfg->links[i];
> +	list_for_each_entry_safe(ent, ent_tmp, &vimc->ents, list) {
>   
> -		struct vimc_ent_device *ved_src =
> -			vimc->ent_devs[link->src_ent];
> -		struct vimc_ent_device *ved_sink =
> -			vimc->ent_devs[link->sink_ent];
> +		struct vimc_ent_type *ent_type = vimc_get_ent_type(ent->drv_name);
>   
> -		ret = media_create_pad_link(ved_src->ent, link->src_pad,
> -					    ved_sink->ent, link->sink_pad,
> -					    link->flags);
> -		if (ret)
> -			goto err_rm_links;
> +		BUG_ON(!ent_type);

Please don't use BOG_ON here. We are trying to get rid of BUG_ONs in the
kernel.

> +		dev_dbg(vimc->mdev.dev, "removing entity %s:%s\n",
> +			ent->drv_name, ent->name);
> +		list_del(&ent->list);
> +		ent_type->rm(ent);
>   	}
> -
> -	return 0;
> -
> -err_rm_links:
> -	vimc_rm_links(vimc);
> -	return ret;
>   }
>   
> -static int vimc_add_subdevs(struct vimc_device *vimc)
> +static int vimc_add_subdevs(struct vimc_device *vimc,
> +		const struct vimc_platform_data_core *pdata)
>   {
> -	unsigned int i;
> -	struct vimc_ent_device *ved;
> -
> -	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
> -		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
> -			vimc->pipe_cfg->ents[i].name);
> -		ved = vimc->pipe_cfg->ents[i].add(vimc,
> -					vimc->pipe_cfg->ents[i].name);
> -		if (!ved) {
> -			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
> -				vimc->pipe_cfg->ents[i].name);
> -			return -EINVAL;
> +	struct vimc_entity_data *ent;
> +	int ret;
> +
> +	list_for_each_entry(ent, pdata->ents, list) {
> +
> +		struct vimc_ent_type *ent_type =
> +			vimc_get_ent_type(ent->drv_name);
> +		struct vimc_ent_device *ent_dev;
> +
> +		BUG_ON(!ent_type);

Same comment as above. No BUD_ON Let's handle the error.

> +
> +		ent_dev = ent_type->add(vimc, ent->name);
> +		if (IS_ERR(ent_dev)) {
> +			ret = PTR_ERR(ent_dev);
> +			dev_err(vimc->mdev.dev, "failed to add entity %s:%s\n",
> +				ent->drv_name, ent->name);
> +			goto err;
>   		}
> -		vimc->ent_devs[i] = ved;
> +		strscpy(ent_dev->name, ent->name, sizeof(ent_dev->name));
> +		strscpy(ent_dev->drv_name, ent->drv_name,
> +			sizeof(ent_dev->drv_name));
> +		list_add(&ent_dev->list, &vimc->ents);
> +		dev_dbg(vimc->mdev.dev, "%s: entity %s:%s added\n", __func__,
> +				ent->drv_name, ent->name);
>   	}
>   	return 0;
> +err:
> +	vimc_rm_subdevs(vimc, pdata);
> +	return ret;
>   }
>   
> -static void vimc_rm_subdevs(struct vimc_device *vimc)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
> -		if (vimc->ent_devs[i])
> -			vimc->pipe_cfg->ents[i].rm(vimc, vimc->ent_devs[i]);
> -}
> -
> -static int vimc_register_devices(struct vimc_device *vimc)
> +static int vimc_register_devices(struct vimc_device *vimc,
> +				 const struct vimc_platform_data_core *pdata)
>   {
>   	int ret;
>   
> @@ -196,25 +155,15 @@ static int vimc_register_devices(struct vimc_device *vimc)
>   	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
>   	if (ret) {
>   		dev_err(vimc->mdev.dev,
> -			"v4l2 device register failed (err=%d)\n", ret);
> +			"v4l2 device register failed (%d)\n", ret);
>   		return ret;
>   	}
>   
> -	/* allocate ent_devs */
> -	vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
> -				       sizeof(*vimc->ent_devs),
> -				       GFP_KERNEL);
> -	if (!vimc->ent_devs)
> -		goto err_v4l2_unregister;
> -
> -	/* Invoke entity config hooks to initialize and register subdevs */
> -	ret = vimc_add_subdevs(vimc);
> +	ret = vimc_add_subdevs(vimc, pdata);
>   	if (ret)
> -		/* remove sundevs that got added */
> -		goto err_rm_subdevs;
> +		goto err_v4l2_unregister;
>   
> -	/* Initialize links */
> -	ret = vimc_create_links(vimc);
> +	ret = vimc_core_links_create(vimc, pdata);
>   	if (ret)
>   		goto err_rm_subdevs;
>   
> @@ -222,16 +171,15 @@ static int vimc_register_devices(struct vimc_device *vimc)
>   	ret = media_device_register(&vimc->mdev);
>   	if (ret) {
>   		dev_err(vimc->mdev.dev,
> -			"media device register failed (err=%d)\n", ret);
> +			"media device register failed (%d)\n", ret);
>   		goto err_rm_subdevs;
>   	}
>   
> -	/* Expose all subdev's nodes*/
> +	/* Expose all subdev's nodes */
>   	ret = v4l2_device_register_subdev_nodes(&vimc->v4l2_dev);
>   	if (ret) {
>   		dev_err(vimc->mdev.dev,
> -			"vimc subdev nodes registration failed (err=%d)\n",
> -			ret);
> +			"vimc subdev nodes registration failed (%d)\n", ret);
>   		goto err_mdev_unregister;
>   	}
>   
> @@ -241,30 +189,28 @@ static int vimc_register_devices(struct vimc_device *vimc)
>   	media_device_unregister(&vimc->mdev);
>   	media_device_cleanup(&vimc->mdev);
>   err_rm_subdevs:
> -	vimc_rm_subdevs(vimc);
> -	kfree(vimc->ent_devs);
> +	vimc_rm_subdevs(vimc, pdata);
>   err_v4l2_unregister:
>   	v4l2_device_unregister(&vimc->v4l2_dev);
>   
>   	return ret;
>   }
>   
> -static void vimc_unregister(struct vimc_device *vimc)
> -{
> -	media_device_unregister(&vimc->mdev);
> -	media_device_cleanup(&vimc->mdev);
> -	v4l2_device_unregister(&vimc->v4l2_dev);
> -	kfree(vimc->ent_devs);
> -}
> -
>   static int vimc_probe(struct platform_device *pdev)
>   {
> -	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
> +	const struct vimc_platform_data_core *pdata = pdev->dev.platform_data;
> +	struct vimc_device *vimc;
>   	int ret;
>   
> -	dev_dbg(&pdev->dev, "probe");
> +	dev_dbg(&pdev->dev, "probe\n");
> +
> +	vimc = devm_kzalloc(&pdev->dev, sizeof(*vimc),
> +			GFP_KERNEL);
> +	if (!vimc)
> +		return -ENOMEM;
>   
>   	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
> +	INIT_LIST_HEAD(&vimc->ents);
>   
>   	/* Link the media device within the v4l2_device */
>   	vimc->v4l2_dev.mdev = &vimc->mdev;
> @@ -277,44 +223,33 @@ static int vimc_probe(struct platform_device *pdev)
>   	vimc->mdev.dev = &pdev->dev;
>   	media_device_init(&vimc->mdev);
>   
> -	ret = vimc_register_devices(vimc);
> -	if (ret) {
> -		media_device_cleanup(&vimc->mdev);
> +	ret = vimc_register_devices(vimc, pdata);
> +	if (ret)
>   		return ret;
> -	}
> -
> +	platform_set_drvdata(pdev, vimc);
>   	return 0;
>   }
>   
>   static int vimc_remove(struct platform_device *pdev)
>   {
> -	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
> +	struct vimc_device *vimc = platform_get_drvdata(pdev);
> +	struct vimc_platform_data_core *pdata = pdev->dev.platform_data;
>   
> -	dev_dbg(&pdev->dev, "remove");
> +	dev_dbg(&pdev->dev, "remove\n");
>   
> -	vimc_rm_subdevs(vimc);
> -	vimc_unregister(vimc);
> +	media_device_unregister(&vimc->mdev);
> +	media_device_cleanup(&vimc->mdev);
> +	vimc_rm_subdevs(vimc, pdata);
> +	v4l2_device_unregister(&vimc->v4l2_dev);
>   
>   	return 0;
>   }
>   
> -static void vimc_dev_release(struct device *dev)
> -{
> -}
> -
> -static struct vimc_device vimc_dev = {
> -	.pipe_cfg = &pipe_cfg,
> -	.pdev = {
> -		.name = VIMC_PDEV_NAME,
> -		.dev.release = vimc_dev_release,
> -	}
> -};
> -
>   static struct platform_driver vimc_pdrv = {
>   	.probe		= vimc_probe,
>   	.remove		= vimc_remove,
>   	.driver		= {
> -		.name	= VIMC_PDEV_NAME,
> +		.name	= "vimc-core",
>   	},
>   };
>   
> @@ -322,18 +257,9 @@ static int __init vimc_init(void)
>   {
>   	int ret;
>   
> -	ret = platform_device_register(&vimc_dev.pdev);
> -	if (ret) {
> -		dev_err(&vimc_dev.pdev.dev,
> -			"platform device registration failed (err=%d)\n", ret);
> -		return ret;
> -	}
> -
>   	ret = platform_driver_register(&vimc_pdrv);
>   	if (ret) {
> -		dev_err(&vimc_dev.pdev.dev,
> -			"platform driver registration failed (err=%d)\n", ret);
> -		platform_driver_unregister(&vimc_pdrv);
> +		pr_err("vimc init: platform driver register failed (%d)\n", ret);
>   		return ret;
>   	}
>   
> @@ -361,7 +287,6 @@ static void __exit vimc_exit(void)
>   
>   	vimc_cfs_subsys_unregister();
>   	platform_driver_unregister(&vimc_pdrv);
> -	platform_device_unregister(&vimc_dev.pdev);
>   }
>   
>   module_init(vimc_init);
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index e461b155e514..2391ac3b5014 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -486,11 +486,12 @@ static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
>   	.release = vimc_deb_release,
>   };
>   
> -void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +void vimc_deb_rm(struct vimc_ent_device *ved)
>   {
> -	struct vimc_deb_device *vdeb;
> +	struct vimc_deb_device *vdeb = container_of(ved,
> +						    struct vimc_deb_device,
> +						    ved);
>   
> -	vdeb = container_of(ved, struct vimc_deb_device, ved);
>   	vimc_ent_sd_unregister(ved, &vdeb->sd);
>   }
>   
> @@ -504,7 +505,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   	/* Allocate the vdeb struct */
>   	vdeb = kzalloc(sizeof(*vdeb), GFP_KERNEL);
>   	if (!vdeb)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	/* Initialize ved and sd */
>   	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
> @@ -515,11 +516,11 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   				   &vimc_deb_int_ops, &vimc_deb_ops);
>   	if (ret) {
>   		kfree(vdeb);
> -		return NULL;
> +		return ERR_PTR(ret);
>   	}
>   
>   	vdeb->ved.process_frame = vimc_deb_process_frame;
> -	vdeb->dev = &vimc->pdev.dev;
> +	vdeb->dev = vimc->mdev.dev;
>   
>   	/* Initialize the frame format */
>   	vdeb->sink_fmt = sink_fmt_default;
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index e5cf0073d68a..7d9726d0b39c 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -345,11 +345,12 @@ static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
>   	.release = vimc_sca_release,
>   };
>   
> -void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +void vimc_sca_rm(struct vimc_ent_device *ved)
>   {
> -	struct vimc_sca_device *vsca;
> +	struct vimc_sca_device *vsca = container_of(ved,
> +						    struct vimc_sca_device,
> +						    ved);
>   
> -	vsca = container_of(ved, struct vimc_sca_device, ved);
>   	vimc_ent_sd_unregister(ved, &vsca->sd);
>   }
>   
> @@ -363,7 +364,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>   	/* Allocate the vsca struct */
>   	vsca = kzalloc(sizeof(*vsca), GFP_KERNEL);
>   	if (!vsca)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	/* Initialize ved and sd */
>   	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 22e3ad98c818..556d49f338ab 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -300,12 +300,12 @@ static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
>   	.release = vimc_sen_release,
>   };
>   
> -void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +void vimc_sen_rm(struct vimc_ent_device *ent)
>   {
>   	struct vimc_sen_device *vsen;
>   
> -	vsen = container_of(ved, struct vimc_sen_device, ved);
> -	vimc_ent_sd_unregister(ved, &vsen->sd);
> +	vsen = container_of(ent, struct vimc_sen_device, ved);
> +	vimc_ent_sd_unregister(ent, &vsen->sd);
>   }
>   
>   /* Image Processing Controls */
> @@ -335,7 +335,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   	/* Allocate the vsen struct */
>   	vsen = kzalloc(sizeof(*vsen), GFP_KERNEL);
>   	if (!vsen)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	v4l2_ctrl_handler_init(&vsen->hdl, 4);
>   
> @@ -369,7 +369,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   		goto err_free_hdl;
>   
>   	vsen->ved.process_frame = vimc_sen_process_frame;
> -	vsen->dev = &vimc->pdev.dev;
> +	vsen->dev = vimc->mdev.dev;
>   
>   	/* Initialize the frame format */
>   	vsen->mbus_format = fmt_default;
> @@ -390,7 +390,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   err_free_vsen:
>   	kfree(vsen);
>   
> -	return NULL;
> +	return ERR_PTR(ret);
>   }
>   
>   static void vimc_sen_create_cfs_pads(struct config_group *ent_group)
> 

thanks,
-- Shuah
