Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84459F21C
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 20:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfH0SLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 14:11:52 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33932 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbfH0SLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 14:11:48 -0400
Received: by mail-io1-f66.google.com with SMTP id s21so400327ioa.1
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PgKLmqB/YBP1c/eVnkykvuwEHIkyxn4ZiTy0O+mYyUc=;
        b=czEjLP3hKFLyfCQudIxSr7IFTTcUbL+9GQcJOWSEftGWuH3QY+mrcfCM37KhHhf3Pg
         Bld20Tn13vU8keUabgqVj/jC8MoaafK3iyzJDadlm1TyleUtV15wl9kN6XE6yMw2+BSN
         pwkKUYhyxH36jdqrCDNssZ2kdtD/OH/lxGd1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PgKLmqB/YBP1c/eVnkykvuwEHIkyxn4ZiTy0O+mYyUc=;
        b=AIPJbIOzNwroL1EHqk5iONTYBQCL2MzSm+IucdvrFXYV2LziEE6YTvdfkA3ZqIIHuh
         13FQWoXrPFvBXiU801/rpP1dBcAFyagJZjCr7sCBA597tV1y0Z8BofZTaAOl+acawHxG
         w/MU16clOUirCMZvRT8EmEBr77G4AHxTrX0Yu+2p9vqhRD46PtnTeXr3yZKxi3cE53Af
         +ZQOj8DTdxdHs2EPNGq5TWMnPe3bvS2XRpTr3Zr21QM+4Ig3+rKUhTpMHaff6HUkk3Ox
         Mb9dzYZwAVfA9ctk70ZEuBZY/E2QOpvOImBpRtMZN6N+ug6RUoaSslUC4Re02LgENlMJ
         KZWA==
X-Gm-Message-State: APjAAAUYSbEbabk+mNOb5kw8mjgVsitTiVpBxeFtGzvElhWml+7KrYhB
        EWUB+2xg9Y+mJx9A0GT+UH66EA==
X-Google-Smtp-Source: APXvYqzSfRExgKS/dfsvgskQYlUhFfa+7SU9jFaZRU73VX1gaDKdvcHf8jnVVh7SaIdEwMtAK05ENw==
X-Received: by 2002:a6b:e013:: with SMTP id z19mr7858504iog.141.1566929506715;
        Tue, 27 Aug 2019 11:11:46 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n22sm17199467iob.37.2019.08.27.11.11.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 11:11:45 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] media: vimc: Collapse component structure into a
 single monolithic driver
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1566334362.git.skhan@linuxfoundation.org>
 <a7b877c08d0885fe7e8bffc9b24ef0a2d6236147.1566334363.git.skhan@linuxfoundation.org>
 <3b84f769563775f6b564c7f4e6136b3359e10b67.camel@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7e169f3e-4b7b-aac1-d111-b99cc97da3c5@linuxfoundation.org>
Date:   Tue, 27 Aug 2019 12:11:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b84f769563775f6b564c7f4e6136b3359e10b67.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/27/19 10:16 AM, Dafna Hirschfeld wrote:
> On Tue, 2019-08-20 at 15:18 -0600, Shuah Khan wrote:
>> vimc uses Component API to split the driver into functional components.
>> The real hardware resembles a monolith structure than component and
>> component structure added a level of complexity making it hard to
>> maintain without adding any real benefit.
>>
>> The sensor is one vimc component that would makes sense to be a separate
>> module to closely align with the real hardware. It would be easier to
>> collapse vimc into single monolithic driver first and then split the
>> sensor off as a separate module.
>>
>> Collapse it into a single monolithic driver removing the Component API.
>> This patch removes the component API and makes minimal changes to the
>> code base preserving the functional division of the code structure.
>> Preserving the functional structure allows us to split the sensor off
>> as a separate module in the future.
>>
>> Major design elements in this change are:
>> - Use existing struct vimc_ent_config and struct vimc_pipeline_config
>>    to drive the initialization of the functional components.
>> - Make vimc_device and vimc_ent_config global by moving them to
>>    vimc-common.h
>> - Add two new hooks add and rm to initialize and register, unregister
>>    and free subdevs.
>> - All component API is now gone and bind and unbind hooks are modified
>>    to do "add" and "rm" with minimal changes to just add and rm subdevs.
>> - vimc-core's bind and unbind are now register and unregister.
>> - vimc-core invokes "add" hooks from its vimc_register_devices().
>>    The "add" hooks remain the same and register subdevs. They don't
>>    create platform devices of their own and use vimc's pdev.dev as
>>    their reference device. The "add" hooks save their vimc_ent_device(s)
>>    in the corresponding vimc_ent_config.
>> - vimc-core invokes "rm" hooks from its unregister to unregister subdevs
>>    and cleanup.
>> - vimc-core invokes "add" and "rm" hooks with pointer to struct vimc_device
>>    and the corresponding struct vimc_ent_config pointer.
>>
>> The following configure and stream test works on all devices.
>>
>> media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>> media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>> media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
>> media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
>>
>> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>> v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>> v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>>
>> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
>> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   drivers/media/platform/vimc/Makefile       |   7 +-
>>   drivers/media/platform/vimc/vimc-capture.c |  79 ++------
>>   drivers/media/platform/vimc/vimc-common.h  |  48 +++++
>>   drivers/media/platform/vimc/vimc-core.c    | 199 ++++++++-------------
>>   drivers/media/platform/vimc/vimc-debayer.c |  67 ++-----
>>   drivers/media/platform/vimc/vimc-scaler.c  |  71 ++------
>>   drivers/media/platform/vimc/vimc-sensor.c  |  71 ++------
>>   7 files changed, 176 insertions(+), 366 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
>> index 96d06f030c31..a53b2b532e9f 100644
>> --- a/drivers/media/platform/vimc/Makefile
>> +++ b/drivers/media/platform/vimc/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> -vimc-y := vimc-core.o vimc-common.o vimc-streamer.o
>> +vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
>> +		vimc-debayer.o vimc-scaler.o vimc-sensor.o
>> +
>> +obj-$(CONFIG_VIDEO_VIMC) += vimc.o
>>   
>> -obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-capture.o vimc-debayer.o \
>> -                vimc-scaler.o vimc-sensor.o
>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>> index 1d56b91830ba..e04b60ec0738 100644
>> --- a/drivers/media/platform/vimc/vimc-capture.c
>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>> @@ -5,10 +5,6 @@
>>    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>    */
>>   
>> -#include <linux/component.h>
>> -#include <linux/module.h>
>> -#include <linux/mod_devicetable.h>
>> -#include <linux/platform_device.h>
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/videobuf2-core.h>
>>   #include <media/videobuf2-vmalloc.h>
>> @@ -16,8 +12,6 @@
>>   #include "vimc-common.h"
>>   #include "vimc-streamer.h"
>>   
>> -#define VIMC_CAP_DRV_NAME "vimc-capture"
>> -
>>   struct vimc_cap_device {
>>   	struct vimc_ent_device ved;
>>   	struct video_device vdev;
>> @@ -340,13 +334,15 @@ static void vimc_cap_release(struct video_device *vdev)
>>   	kfree(vcap);
>>   }
>>   
>> -static void vimc_cap_comp_unbind(struct device *comp, struct device *master,
>> -				 void *master_data)
>> +void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>>   {
>> -	struct vimc_ent_device *ved = dev_get_drvdata(comp);
>> -	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
>> -						    ved);
>> +	struct vimc_ent_device *ved = vcfg->ved;
>> +	struct vimc_cap_device *vcap;
>> +
>> +	if (!ved)
>> +		return;
>>   
>> +	vcap = container_of(ved, struct vimc_cap_device, ved);
>>   	vb2_queue_release(&vcap->queue);
>>   	media_entity_cleanup(ved->ent);
>>   	video_unregister_device(&vcap->vdev);
> 
> Since !ved assumes that the entity is not added (or added and then
> removed) I guess it it good to set 'vcfg->ved = NULL' at the end of the
> 'rm' of all the entities.
> 

I will update that.

>> @@ -391,11 +387,9 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>>   	return NULL;
>>   }
>>   
>> -static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>> -			      void *master_data)
>> +int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>>   {
>> -	struct v4l2_device *v4l2_dev = master_data;
>> -	struct vimc_platform_data *pdata = comp->platform_data;
>> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>   	const struct vimc_pix_map *vpix;
>>   	struct vimc_cap_device *vcap;
>>   	struct video_device *vdev;
>> @@ -416,7 +410,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   	}
>>   
>>   	/* Initialize the media entity */
>> -	vcap->vdev.entity.name = pdata->entity_name;
>> +	vcap->vdev.entity.name = vcfg->name;
>>   	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>>   	ret = media_entity_pads_init(&vcap->vdev.entity,
>>   				     1, vcap->ved.pads);
>> @@ -440,8 +434,8 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   
>>   	ret = vb2_queue_init(q);
>>   	if (ret) {
>> -		dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
>> -			pdata->entity_name, ret);
>> +		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
>> +			vcfg->name, ret);
>>   		goto err_clean_m_ent;
>>   	}
>>   
>> @@ -460,8 +454,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   	vcap->ved.ent = &vcap->vdev.entity;
>>   	vcap->ved.process_frame = vimc_cap_process_frame;
>>   	vcap->ved.vdev_get_format = vimc_cap_get_format;
>> -	dev_set_drvdata(comp, &vcap->ved);
>> -	vcap->dev = comp;
>> +	vcap->dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the video_device struct */
>>   	vdev = &vcap->vdev;
>> @@ -474,17 +467,18 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   	vdev->queue = q;
>>   	vdev->v4l2_dev = v4l2_dev;
>>   	vdev->vfl_dir = VFL_DIR_RX;
>> -	strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
>> +	strscpy(vdev->name, vcfg->name, sizeof(vdev->name));
>>   	video_set_drvdata(vdev, &vcap->ved);
>>   
>>   	/* Register the video_device with the v4l2 and the media framework */
>>   	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
>>   	if (ret) {
>> -		dev_err(comp, "%s: video register failed (err=%d)\n",
>> +		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
>>   			vcap->vdev.name, ret);
>>   		goto err_release_queue;
>>   	}
>>   
>> +	vcfg->ved = &vcap->ved;
>>   	return 0;
>>   
>>   err_release_queue:
>> @@ -498,44 +492,3 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   
>>   	return ret;
>>   }
>> -
>> -static const struct component_ops vimc_cap_comp_ops = {
>> -	.bind = vimc_cap_comp_bind,
>> -	.unbind = vimc_cap_comp_unbind,
>> -};
>> -
>> -static int vimc_cap_probe(struct platform_device *pdev)
>> -{
>> -	return component_add(&pdev->dev, &vimc_cap_comp_ops);
>> -}
>> -
>> -static int vimc_cap_remove(struct platform_device *pdev)
>> -{
>> -	component_del(&pdev->dev, &vimc_cap_comp_ops);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct platform_device_id vimc_cap_driver_ids[] = {
>> -	{
>> -		.name           = VIMC_CAP_DRV_NAME,
>> -	},
>> -	{ }
>> -};
>> -
>> -static struct platform_driver vimc_cap_pdrv = {
>> -	.probe		= vimc_cap_probe,
>> -	.remove		= vimc_cap_remove,
>> -	.id_table	= vimc_cap_driver_ids,
>> -	.driver		= {
>> -		.name	= VIMC_CAP_DRV_NAME,
>> -	},
>> -};
>> -
>> -module_platform_driver(vimc_cap_pdrv);
>> -
>> -MODULE_DEVICE_TABLE(platform, vimc_cap_driver_ids);
>> -
>> -MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Capture");
>> -MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
>> -MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>> index 9c2e0e216c6b..5b2282de395c 100644
>> --- a/drivers/media/platform/vimc/vimc-common.h
>> +++ b/drivers/media/platform/vimc/vimc-common.h
>> @@ -9,6 +9,7 @@
>>   #define _VIMC_COMMON_H_
>>   
>>   #include <linux/slab.h>
>> +#include <linux/platform_device.h>
>>   #include <media/media-device.h>
>>   #include <media/v4l2-device.h>
>>   
>> @@ -84,6 +85,21 @@ struct vimc_pix_map {
>>   	bool bayer;
>>   };
>>   
>> +/**
>> + * struct vimc_device - main device for vimc driver
>> + *
>> + * @pdev	pointer to the platform device
>> + * @pipe_cfg	pointer to the vimc pipeline configuration structure
>> + * @mdev	the associated media_device parent
>> + * @v4l2_dev	Internal v4l2 parent device
>> + */
>> +struct vimc_device {
>> +	struct platform_device pdev;
>> +	const struct vimc_pipeline_config *pipe_cfg;
>> +	struct media_device mdev;
>> +	struct v4l2_device v4l2_dev;
>> +};
>> +
>>   /**
>>    * struct vimc_ent_device - core struct that represents a node in the topology
>>    *
>> @@ -111,6 +127,38 @@ struct vimc_ent_device {
>>   			      struct v4l2_pix_format *fmt);
>>   };
>>   
>> +/**
>> + * struct vimc_ent_config	Structure which describes individual
>> + *				configuration for each entity
>> + *
>> + * @name			entity name
>> + * @ved				pointer to vimc_ent_device (a node in the
>> + *					topology)
>> + * @add				subdev add hook - initializes and registers
>> + *					subdev called from vimc-core
>> + * @rm				subdev rm hook - unregisters and frees
>> + *					subdev called from vimc-core
>> + */
>> +struct vimc_ent_config {
>> +	const char *name;
>> +	struct vimc_ent_device *ved;
>> +	int (*add)(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +	void (*rm)(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +};
>> +
>> +/* prototypes for vimc_ent_config add and rm hooks */
>> +int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +
>> +int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +
>> +int vimc_sca_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +
>> +int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>> +
>>   /**
>>    * vimc_pads_init - initialize pads
>>    *
>> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
>> index 571c55aa0e16..3749bfa88e40 100644
>> --- a/drivers/media/platform/vimc/vimc-core.c
>> +++ b/drivers/media/platform/vimc/vimc-core.c
>> @@ -5,7 +5,6 @@
>>    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>    */
>>   
>> -#include <linux/component.h>
>>   #include <linux/init.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> @@ -24,29 +23,6 @@
>>   	.flags = link_flags,					\
>>   }
>>   
>> -struct vimc_device {
>> -	/* The platform device */
>> -	struct platform_device pdev;
>> -
>> -	/* The pipeline configuration */
>> -	const struct vimc_pipeline_config *pipe_cfg;
>> -
>> -	/* The Associated media_device parent */
>> -	struct media_device mdev;
>> -
>> -	/* Internal v4l2 parent device*/
>> -	struct v4l2_device v4l2_dev;
>> -
>> -	/* Subdevices */
>> -	struct platform_device **subdevs;
>> -};
>> -
>> -/* Structure which describes individual configuration for each entity */
>> -struct vimc_ent_config {
>> -	const char *name;
>> -	const char *drv;
>> -};
>> -
>>   /* Structure which describes links between entities */
>>   struct vimc_ent_link {
>>   	unsigned int src_ent;
>> @@ -58,7 +34,7 @@ struct vimc_ent_link {
>>   
>>   /* Structure which describes the whole topology */
>>   struct vimc_pipeline_config {
>> -	const struct vimc_ent_config *ents;
>> +	struct vimc_ent_config *ents;
>>   	size_t num_ents;
>>   	const struct vimc_ent_link *links;
>>   	size_t num_links;
>> @@ -68,43 +44,61 @@ struct vimc_pipeline_config {
>>    * Topology Configuration
>>    */
>>   
>> -static const struct vimc_ent_config ent_config[] = {
>> +static struct vimc_ent_config ent_config[] = {
>>   	{
>>   		.name = "Sensor A",
>> -		.drv = "vimc-sensor",
>> +		.ved = NULL,
>> +		.add = vimc_sen_add,
>> +		.rm = vimc_sen_rm,
>>   	},
>>   	{
>>   		.name = "Sensor B",
>> -		.drv = "vimc-sensor",
>> +		.ved = NULL,
>> +		.add = vimc_sen_add,
>> +		.rm = vimc_sen_rm,
>>   	},
>>   	{
>>   		.name = "Debayer A",
>> -		.drv = "vimc-debayer",
>> +		.ved = NULL,
>> +		.add = vimc_deb_add,
>> +		.rm = vimc_deb_rm,
>>   	},
>>   	{
>>   		.name = "Debayer B",
>> -		.drv = "vimc-debayer",
>> +		.ved = NULL,
>> +		.add = vimc_deb_add,
>> +		.rm = vimc_deb_rm,
>>   	},
>>   	{
>>   		.name = "Raw Capture 0",
>> -		.drv = "vimc-capture",
>> +		.ved = NULL,
>> +		.add = vimc_cap_add,
>> +		.rm = vimc_cap_rm,
>>   	},
>>   	{
>>   		.name = "Raw Capture 1",
>> -		.drv = "vimc-capture",
>> +		.ved = NULL,
>> +		.add = vimc_cap_add,
>> +		.rm = vimc_cap_rm,
>>   	},
>>   	{
>> -		.name = "RGB/YUV Input",
>>   		/* TODO: change this to vimc-input when it is implemented */
>> -		.drv = "vimc-sensor",
>> +		.name = "RGB/YUV Input",
>> +		.ved = NULL,
>> +		.add = vimc_sen_add,
>> +		.rm = vimc_sen_rm,
>>   	},
>>   	{
>>   		.name = "Scaler",
>> -		.drv = "vimc-scaler",
>> +		.ved = NULL,
>> +		.add = vimc_sca_add,
>> +		.rm = vimc_sca_rm,
>>   	},
>>   	{
>>   		.name = "RGB/YUV Capture",
>> -		.drv = "vimc-capture",
>> +		.ved = NULL,
>> +		.add = vimc_cap_add,
>> +		.rm = vimc_cap_rm,
>>   	},
>>   };
>>   
>> @@ -127,7 +121,7 @@ static const struct vimc_ent_link ent_links[] = {
>>   	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
>>   };
>>   
>> -static const struct vimc_pipeline_config pipe_cfg = {
>> +static struct vimc_pipeline_config pipe_cfg = {
>>   	.ents		= ent_config,
>>   	.num_ents	= ARRAY_SIZE(ent_config),
>>   	.links		= ent_links,
>> @@ -144,14 +138,11 @@ static int vimc_create_links(struct vimc_device *vimc)
>>   	/* Initialize the links between entities */
>>   	for (i = 0; i < vimc->pipe_cfg->num_links; i++) {
>>   		const struct vimc_ent_link *link = &vimc->pipe_cfg->links[i];
>> -		/*
>> -		 * TODO: Check another way of retrieving ved struct without
>> -		 * relying on platform_get_drvdata
>> -		 */
>> +
>>   		struct vimc_ent_device *ved_src =
>> -			platform_get_drvdata(vimc->subdevs[link->src_ent]);
>> +			vimc->pipe_cfg->ents[link->src_ent].ved;
>>   		struct vimc_ent_device *ved_sink =
>> -			platform_get_drvdata(vimc->subdevs[link->sink_ent]);
>> +			vimc->pipe_cfg->ents[link->sink_ent].ved;
>>   
>>   		ret = media_create_pad_link(ved_src->ent, link->src_pad,
>>   					    ved_sink->ent, link->sink_pad,
>> @@ -163,13 +154,36 @@ static int vimc_create_links(struct vimc_device *vimc)
>>   	return 0;
>>   }
>>   
>> -static int vimc_comp_bind(struct device *master)
>> +static int vimc_add_subdevs(struct vimc_device *vimc)
>>   {
>> -	struct vimc_device *vimc = container_of(to_platform_device(master),
>> -						struct vimc_device, pdev);
>> +	unsigned int i;
>>   	int ret;
>>   
>> -	dev_dbg(master, "bind");
>> +	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
>> +		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
>> +			vimc->pipe_cfg->ents[i].name);
>> +		ret = vimc->pipe_cfg->ents[i].add(vimc,
>> +				&vimc->pipe_cfg->ents[i]);
>> +		if (ret) {
>> +			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
>> +				vimc->pipe_cfg->ents[i].name);
>> +			return ret;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void vimc_rm_subdevs(struct vimc_device *vimc)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
>> +		vimc->pipe_cfg->ents[i].rm(vimc, &vimc->pipe_cfg->ents[i]);
>> +}
>> +
>> +static int vimc_register_devices(struct vimc_device *vimc)
>> +{
>> +	int ret;
>>   
>>   	/* Register the v4l2 struct */
>>   	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
>> @@ -179,22 +193,22 @@ static int vimc_comp_bind(struct device *master)
>>   		return ret;
>>   	}
>>   
>> -	/* Bind subdevices */
>> -	ret = component_bind_all(master, &vimc->v4l2_dev);
>> +	/* Invoke entity config hooks to initialize and register subdevs */
>> +	ret = vimc_add_subdevs(vimc);
>>   	if (ret)
>> -		goto err_v4l2_unregister;
>> +		goto err_add_subdevs;
>>   
>>   	/* Initialize links */
>>   	ret = vimc_create_links(vimc);
>>   	if (ret)
>> -		goto err_comp_unbind_all;
>> +		goto err_v4l2_unregister;
>>   
>>   	/* Register the media device */
>>   	ret = media_device_register(&vimc->mdev);
>>   	if (ret) {
>>   		dev_err(vimc->mdev.dev,
>>   			"media device register failed (err=%d)\n", ret);
>> -		goto err_comp_unbind_all;
>> +		goto err_v4l2_unregister;
>>   	}
>>   
>>   	/* Expose all subdev's nodes*/
>> @@ -211,98 +225,30 @@ static int vimc_comp_bind(struct device *master)
>>   err_mdev_unregister:
>>   	media_device_unregister(&vimc->mdev);
>>   	media_device_cleanup(&vimc->mdev);
>> -err_comp_unbind_all:
>> -	component_unbind_all(master, NULL);
>>   err_v4l2_unregister:
>>   	v4l2_device_unregister(&vimc->v4l2_dev);
>> +err_add_subdevs:
>> +	vimc_rm_subdevs(vimc);
>>   
>>   	return ret;
>>   }
>>   
>> -static void vimc_comp_unbind(struct device *master)
>> +static void vimc_unregister(struct vimc_device *vimc)
>>   {
>> -	struct vimc_device *vimc = container_of(to_platform_device(master),
>> -						struct vimc_device, pdev);
>> -
>> -	dev_dbg(master, "unbind");
>> -
>>   	media_device_unregister(&vimc->mdev);
>>   	media_device_cleanup(&vimc->mdev);
>> -	component_unbind_all(master, NULL);
>>   	v4l2_device_unregister(&vimc->v4l2_dev);
>>   }
>>   
>> -static int vimc_comp_compare(struct device *comp, void *data)
>> -{
>> -	return comp == data;
>> -}
>> -
>> -static struct component_match *vimc_add_subdevs(struct vimc_device *vimc)
>> -{
>> -	struct component_match *match = NULL;
>> -	struct vimc_platform_data pdata;
>> -	int i;
>> -
>> -	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
>> -		dev_dbg(&vimc->pdev.dev, "new pdev for %s\n",
>> -			vimc->pipe_cfg->ents[i].drv);
>> -
>> -		strscpy(pdata.entity_name, vimc->pipe_cfg->ents[i].name,
>> -			sizeof(pdata.entity_name));
>> -
>> -		vimc->subdevs[i] = platform_device_register_data(&vimc->pdev.dev,
>> -						vimc->pipe_cfg->ents[i].drv,
>> -						PLATFORM_DEVID_AUTO,
>> -						&pdata,
>> -						sizeof(pdata));
>> -		if (IS_ERR(vimc->subdevs[i])) {
>> -			match = ERR_CAST(vimc->subdevs[i]);
>> -			while (--i >= 0)
>> -				platform_device_unregister(vimc->subdevs[i]);
>> -
>> -			return match;
>> -		}
>> -
>> -		component_match_add(&vimc->pdev.dev, &match, vimc_comp_compare,
>> -				    &vimc->subdevs[i]->dev);
>> -	}
>> -
>> -	return match;
>> -}
>> -
>> -static void vimc_rm_subdevs(struct vimc_device *vimc)
>> -{
>> -	unsigned int i;
>> -
>> -	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
>> -		platform_device_unregister(vimc->subdevs[i]);
>> -}
>> -
>> -static const struct component_master_ops vimc_comp_ops = {
>> -	.bind = vimc_comp_bind,
>> -	.unbind = vimc_comp_unbind,
>> -};
>> -
>>   static int vimc_probe(struct platform_device *pdev)
>>   {
>>   	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
>> -	struct component_match *match = NULL;
>>   	int ret;
>>   
>>   	dev_dbg(&pdev->dev, "probe");
>>   
>>   	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
>>   
>> -	/* Create platform_device for each entity in the topology*/
>> -	vimc->subdevs = devm_kcalloc(&vimc->pdev.dev, vimc->pipe_cfg->num_ents,
>> -				     sizeof(*vimc->subdevs), GFP_KERNEL);
>> -	if (!vimc->subdevs)
>> -		return -ENOMEM;
>> -
>> -	match = vimc_add_subdevs(vimc);
>> -	if (IS_ERR(match))
>> -		return PTR_ERR(match);
>> -
>>   	/* Link the media device within the v4l2_device */
>>   	vimc->v4l2_dev.mdev = &vimc->mdev;
>>   
>> @@ -314,12 +260,9 @@ static int vimc_probe(struct platform_device *pdev)
>>   	vimc->mdev.dev = &pdev->dev;
>>   	media_device_init(&vimc->mdev);
>>   
>> -	/* Add self to the component system */
>> -	ret = component_master_add_with_match(&pdev->dev, &vimc_comp_ops,
>> -					      match);
>> +	ret = vimc_register_devices(vimc);
>>   	if (ret) {
>>   		media_device_cleanup(&vimc->mdev);
>> -		vimc_rm_subdevs(vimc);
>>   		return ret;
>>   	}
>>   
>> @@ -332,8 +275,8 @@ static int vimc_remove(struct platform_device *pdev)
>>   
>>   	dev_dbg(&pdev->dev, "remove");
>>   
>> -	component_master_del(&pdev->dev, &vimc_comp_ops);
>>   	vimc_rm_subdevs(vimc);
>> +	vimc_unregister(vimc);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>> index b72b8385067b..73dc17f0d990 100644
>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>> @@ -15,8 +15,6 @@
>>   
> 
> The included files linux/component.h, linux/mod_devicetable.h,
> linux/platform_device.h can be removed
> 

Thanks. I will do that in my next version.

thanks,
-- Shuah
