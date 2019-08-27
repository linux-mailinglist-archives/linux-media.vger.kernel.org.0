Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C5F9F232
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 20:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730569AbfH0SRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 14:17:08 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40190 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbfH0SRI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 14:17:08 -0400
Received: by mail-io1-f68.google.com with SMTP id t6so351316ios.7
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 11:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kQcP4jBJWULyHOVzAbLlgGlqZlCtw2jO2tey4T/b81M=;
        b=dgbTu7rQ2vH2hOX89JwRCo+ZV+GJNwvo7zSanpLfh7ogVkDVzzyIrKJETuDNq5taBz
         muxbZmbVhzt6SXg2Jxh02RW9OW0NzKj87P4OqaHpbHM6w1zaBefE/cK6Z+wOwD5p+TBi
         jcwcXN2K7DkMkLM1E7fKZ34ZWu+B/m2YmjRhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kQcP4jBJWULyHOVzAbLlgGlqZlCtw2jO2tey4T/b81M=;
        b=jQnSuJbQY/wYjzgUTTz+mBGOkS4flygmpRVtn1TmqND2nJmqKQunvQ1ndMXgY85LT1
         EK3L/XaAwKFmVtAw9MpjX7JOczJxXkIdaAJ4zx7rftadiYFXl1TFNl/NKmW8jQnj6Swm
         Czjyn6DfKpnSaZ3n6SCme6ZPOxFp34VT60G8XgFX59Fi0vFhV6kmEMwRGoD4EjJMwVZj
         jPWl/9ZrrOCRItztjlbsamRm4AF1ezlpjLkREEArT7DqXnW/CLxb4FC5EwIyOIQ4HGVO
         DGqHWwrFJsjw5T6j6rnyUnMeWyFAbaFZOHd3WuzuO5xyOB352dOB8J2Mf8VRa6XEB/le
         MiVg==
X-Gm-Message-State: APjAAAXVjM43i/mX28J/myMXaVMWyiM/sifFqZh6wXOgUEttzyFtei3i
        Boydn5YDh+NHlsyyOhCfn4+Pkg==
X-Google-Smtp-Source: APXvYqztKLNmr05qLGnGvLPiNSplBtL0GQ3ePdQWR/++z3ePNL197cXREEcbGUg3K4yWhaYqSD7Nqw==
X-Received: by 2002:a6b:b886:: with SMTP id i128mr32440627iof.90.1566929827349;
        Tue, 27 Aug 2019 11:17:07 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id z19sm11993225ioh.12.2019.08.27.11.17.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 11:17:06 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] media: vimc: Collapse component structure into a
 single monolithic driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        andrealmeid@collabora.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1566334362.git.skhan@linuxfoundation.org>
 <a7b877c08d0885fe7e8bffc9b24ef0a2d6236147.1566334363.git.skhan@linuxfoundation.org>
 <20190827165536.GD5054@pendragon.ideasonboard.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <35160afe-b9ca-7304-e8b0-d7c809c57dcc@linuxfoundation.org>
Date:   Tue, 27 Aug 2019 12:17:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827165536.GD5054@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/27/19 10:55 AM, Laurent Pinchart wrote:
> Hi Shuah,
> 
> Thank you for the patch.
> 
> On Tue, Aug 20, 2019 at 03:18:41PM -0600, Shuah Khan wrote:
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
> 
> Mixing data and function pointers in a read-write structure is a
> security issue, as it helps an attacker who could overwrite the
> structure to run arbitrary code :-/ I think you should split this in
> two, with the read-only name and function pointers stored as a const
> array, and the vimc_ent_device pointers stored separately (possibly in a
> linked list, or worst case an array that mirrors ent_config, as I
> suppose the configfs support will remove the ent_config array).
> 

Array that mirrors might be sufficient. We do all or nothing adds for
these entities anyway. If we can't add one entity, we delete all and
fail the probe.

> This is I think the only blocker for this patch series, and fortunately
> it shouldn't be difficult to fix.
> 

Yeah. I should have thought about that in the first place. :( Will fix
it and send updated patch.

thanks,
-- Shuah
