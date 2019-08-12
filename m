Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3D18A074
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 16:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfHLOMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 10:12:49 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39966 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHLOMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 10:12:49 -0400
Received: by mail-ot1-f65.google.com with SMTP id c34so19209379otb.7
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zog5C0gVeh8Tc+gLVLDVDnsAKfmT1k1tOVIh6+GWy88=;
        b=QhATvrRVd+3GLVAIK28NtCT0Tk7fSFkOcChmLBmucJftdJXo4+49PXDMo75wH0ZjOv
         V0sr8lE2pVuk0bLcyD6PqgnzNHjFncn6Q92lz/fOrW/9pjEgX7CU6qtakusF/KPYEo9g
         k765NhJASCm1NeDNKnCk3zaL7KzUHCpzR0HtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zog5C0gVeh8Tc+gLVLDVDnsAKfmT1k1tOVIh6+GWy88=;
        b=dIFqn1aqtdJ2aTEvFaUkSMneE2WIUwLJqN65cLKY8uznQRA/3cxu3fC6fUNC8mJKEZ
         b7zrXtIsZ9+gWeftxqo539v1VpKyGhoD7PAU8M1UupWuhIogbbAE7gUGo2eqJcElsiCT
         wTQtfKIGclc3jWeAxVxrWmha/OIM9p0+AQGNIn6bIYFYrMggik3LGG6Em/s2MBAQtIl5
         uVSP9wr2+bd2Huqhk25W6vnJpBMEdwofm2EQJMOcJLTVzHcv8bxWrLzOb6hHp/JCnqQP
         Hv9UfTYZSpEZFKnZN2pgBQh02gxek9gmF7XbmMdt7cYalFFtcQt5BNloxn4/C8NxmvXB
         M6Ig==
X-Gm-Message-State: APjAAAWQ14soKwIKocTU9nTRb9YW43Jgm6Z7bYvhoXYxAwkmHDQ6dgAl
        Qb/pWv7mXGstCoGVIVCAZ263Lg==
X-Google-Smtp-Source: APXvYqwUCck/UNDM54jsit0Q+iakQc6I5CphP0zIxPMOPfNnEwNR7yOdzz1DAoutds+eBiTkQry8qQ==
X-Received: by 2002:a02:aa0d:: with SMTP id r13mr38192219jam.129.1565619167723;
        Mon, 12 Aug 2019 07:12:47 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n2sm109405901ioa.27.2019.08.12.07.12.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 07:12:47 -0700 (PDT)
Subject: Re: [PATCH 2/3] media: vimc: Collapse component structure into a
 single monolithic driver
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        "skha >> Shuah Khan" <skhan@linuxfoundation.org>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <c87d018de30b791d7ac30da9d99e1dcfca9b38ea.1565386364.git.skhan@linuxfoundation.org>
 <85223214-5d1f-21b1-8845-3ed312a88f90@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3d8f70a1-1dcf-acde-f1ac-7b8dc016d3aa@linuxfoundation.org>
Date:   Mon, 12 Aug 2019 08:12:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85223214-5d1f-21b1-8845-3ed312a88f90@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/9/19 10:12 PM, Helen Koike wrote:
> Hi Shuah,
> 
> Thanks for the patch, just some small comments.
> 
> On 8/9/19 6:45 PM, Shuah Khan wrote:
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
>> - Make vimc_ent_config global by moving it to vimc.h
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
>>   drivers/media/platform/vimc/vimc-capture.c |  75 ++--------
>>   drivers/media/platform/vimc/vimc-core.c    | 156 ++++++++-------------
>>   drivers/media/platform/vimc/vimc-debayer.c |  68 ++-------
>>   drivers/media/platform/vimc/vimc-scaler.c  |  68 ++-------
>>   drivers/media/platform/vimc/vimc-sensor.c  |  69 ++-------
>>   drivers/media/platform/vimc/vimc.h         |  25 +++-
>>   7 files changed, 125 insertions(+), 343 deletions(-)
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
>> index c52fc5d97c2d..b7b2d3c3d4f8 100644
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
>> @@ -17,8 +13,6 @@
>>   #include "vimc-common.h"
>>   #include "vimc-streamer.h"
>>   
>> -#define VIMC_CAP_DRV_NAME "vimc-capture"
>> -
>>   static const u32 vimc_cap_supported_pixfmt[] = {
>>   	V4L2_PIX_FMT_BGR24,
>>   	V4L2_PIX_FMT_RGB24,
>> @@ -348,11 +342,11 @@ static void vimc_cap_release(struct video_device *vdev)
>>   	kfree(vcap);
>>   }
>>   
>> -static void vimc_cap_comp_unbind(struct device *comp, struct device *master,
>> -				 void *master_data)
>> +void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct vimc_ent_device *ved = dev_get_drvdata(comp);
>> -	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
>> +	struct vimc_ent_device *ved = vent->ved;
>> +	struct vimc_cap_device *vcap = container_of(ved,
>> +						    struct vimc_cap_device,
>>   						    ved);
>>   
>>   	vb2_queue_release(&vcap->queue);
>> @@ -399,11 +393,9 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>>   	return NULL;
>>   }
>>   
>> -static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>> -			      void *master_data)
>> +int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct v4l2_device *v4l2_dev = master_data;
>> -	struct vimc_platform_data *pdata = comp->platform_data;
>> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>   	struct vimc_cap_device *vcap;
>>   	struct video_device *vdev;
>>   	struct vb2_queue *q;
>> @@ -423,7 +415,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   	}
>>   
>>   	/* Initialize the media entity */
>> -	vcap->vdev.entity.name = pdata->entity_name;
>> +	vcap->vdev.entity.name = vent->name;
>>   	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>>   	ret = media_entity_pads_init(&vcap->vdev.entity,
>>   				     1, vcap->ved.pads);
>> @@ -447,8 +439,8 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   
>>   	ret = vb2_queue_init(q);
>>   	if (ret) {
>> -		dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
>> -			pdata->entity_name, ret);
>> +		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
>> +			vent->name, ret);
>>   		goto err_clean_m_ent;
>>   	}
>>   
>> @@ -465,8 +457,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   	vcap->ved.ent = &vcap->vdev.entity;
>>   	vcap->ved.process_frame = vimc_cap_process_frame;
>>   	vcap->ved.vdev_get_format = vimc_cap_get_format;
>> -	dev_set_drvdata(comp, &vcap->ved);
>> -	vcap->dev = comp;
>> +	vcap->dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the video_device struct */
>>   	vdev = &vcap->vdev;
>> @@ -479,17 +470,18 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>>   	vdev->queue = q;
>>   	vdev->v4l2_dev = v4l2_dev;
>>   	vdev->vfl_dir = VFL_DIR_RX;
>> -	strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
>> +	strscpy(vdev->name, vent->name, sizeof(vdev->name));
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
>> +	vent->ved = &vcap->ved;
>>   	return 0;
>>   
>>   err_release_queue:
>> @@ -503,44 +495,3 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
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
>> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
>> index c9b351472272..3bd89cf38a90 100644
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
>> @@ -25,12 +24,6 @@
>>   	.flags = link_flags,					\
>>   }
>>   
>> -/* Structure which describes individual configuration for each entity */
>> -struct vimc_ent_config {
>> -	const char *name;
>> -	const char *drv;
>> -};
>> -
>>   /* Structure which describes links between entities */
>>   struct vimc_ent_link {
>>   	unsigned int src_ent;
>> @@ -42,7 +35,7 @@ struct vimc_ent_link {
>>   
>>   /* Structure which describes the whole topology */
>>   struct vimc_pipeline_config {
>> -	const struct vimc_ent_config *ents;
>> +	struct vimc_ent_config *ents;
>>   	size_t num_ents;
>>   	const struct vimc_ent_link *links;
>>   	size_t num_links;
>> @@ -52,43 +45,61 @@ struct vimc_pipeline_config {
>>    * Topology Configuration
>>    */
>>   
>> -static const struct vimc_ent_config ent_config[] = {
>> +static struct vimc_ent_config ent_config[] = {
>>   	{
>>   		.name = "Sensor A",
>>   		.drv = "vimc-sensor",
>> +		.add = vimc_sen_add,
>> +		.rm = vimc_sen_rm,
>>   	},
>>   	{
>>   		.name = "Sensor B",
>>   		.drv = "vimc-sensor",
>> +		.add = vimc_sen_add,
>> +		.rm = vimc_sen_rm,
>>   	},
>>   	{
>>   		.name = "Debayer A",
>>   		.drv = "vimc-debayer",
>> +		.add = vimc_deb_add,
>> +		.rm = vimc_deb_rm,
>>   	},
>>   	{
>>   		.name = "Debayer B",
>>   		.drv = "vimc-debayer",
>> +		.add = vimc_deb_add,
>> +		.rm = vimc_deb_rm,
>>   	},
>>   	{
>>   		.name = "Raw Capture 0",
>>   		.drv = "vimc-capture",
>> +		.add = vimc_cap_add,
>> +		.rm = vimc_cap_rm,
>>   	},
>>   	{
>>   		.name = "Raw Capture 1",
>>   		.drv = "vimc-capture",
>> +		.add = vimc_cap_add,
>> +		.rm = vimc_cap_rm,
>>   	},
>>   	{
>>   		.name = "RGB/YUV Input",
>>   		/* TODO: change this to vimc-input when it is implemented */
>>   		.drv = "vimc-sensor",
>> +		.add = vimc_sen_add,
>> +		.rm = vimc_sen_rm,
>>   	},
>>   	{
>>   		.name = "Scaler",
>>   		.drv = "vimc-scaler",
>> +		.add = vimc_sca_add,
>> +		.rm = vimc_sca_rm,
>>   	},
>>   	{
>>   		.name = "RGB/YUV Capture",
>>   		.drv = "vimc-capture",
>> +		.add = vimc_cap_add,
>> +		.rm = vimc_cap_rm,
>>   	},
>>   };
>>   
>> @@ -111,7 +122,7 @@ static const struct vimc_ent_link ent_links[] = {
>>   	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
>>   };
>>   
>> -static const struct vimc_pipeline_config pipe_cfg = {
>> +static struct vimc_pipeline_config pipe_cfg = {
> 
> Any special reason why the const was dropped here?
> 

Since this gets passed in .add and .rm hooks to be updated by subdevs
to save their struct vimc_ent_device for use by vimc-core, this needs
to writable. Without removing const, we will see warns.

>>   	.ents		= ent_config,
>>   	.num_ents	= ARRAY_SIZE(ent_config),
>>   	.links		= ent_links,
>> @@ -128,14 +139,11 @@ static int vimc_create_links(struct vimc_device *vimc)
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
>> @@ -147,13 +155,28 @@ static int vimc_create_links(struct vimc_device *vimc)
>>   	return 0;
>>   }
>>   
>> -static int vimc_comp_bind(struct device *master)
>> +static int vimc_add_subdevs(struct vimc_device *vimc)
>>   {
>> -	struct vimc_device *vimc = container_of(to_platform_device(master),
>> -						struct vimc_device, pdev);
>> -	int ret;
>> +	int i;
> 
> unsigned int
> 
>> +	int ret = 0;
> 
> no need to init to 0, but not a problem either.
> 
>> +
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
>>   
>> -	dev_dbg(master, "bind");
>> +static int vimc_register_devices(struct vimc_device *vimc)
>> +{
>> +	int ret;
>>   
>>   	/* Register the v4l2 struct */
>>   	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
>> @@ -163,22 +186,20 @@ static int vimc_comp_bind(struct device *master)
>>   		return ret;
>>   	}
>>   
>> -	/* Bind subdevices */
>> -	ret = component_bind_all(master, &vimc->v4l2_dev);
>> -	if (ret)
>> -		goto err_v4l2_unregister;
>> +	/* Invoke enitity config hooks to initialize and register subdevs */
>> +	vimc_add_subdevs(vimc);
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
>> @@ -195,98 +216,36 @@ static int vimc_comp_bind(struct device *master)
>>   err_mdev_unregister:
>>   	media_device_unregister(&vimc->mdev);
>>   	media_device_cleanup(&vimc->mdev);
>> -err_comp_unbind_all:
>> -	component_unbind_all(master, NULL);
>>   err_v4l2_unregister:
>>   	v4l2_device_unregister(&vimc->v4l2_dev);
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
>>   static void vimc_rm_subdevs(struct vimc_device *vimc)
>>   {
>>   	unsigned int i;
>>   
>>   	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
>> -		platform_device_unregister(vimc->subdevs[i]);
>> +		vimc->pipe_cfg->ents[i].rm(vimc, &vimc->pipe_cfg->ents[i]);
>>   }
>>   
>> -static const struct component_master_ops vimc_comp_ops = {
>> -	.bind = vimc_comp_bind,
>> -	.unbind = vimc_comp_unbind,
>> -};
>> -
>>   static int vimc_probe(struct platform_device *pdev)
>>   {
>>   	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
>> -	struct component_match *match = NULL;
>> -	int ret;
>> +	int ret = 0;
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
>> @@ -298,16 +257,11 @@ static int vimc_probe(struct platform_device *pdev)
>>   	vimc->mdev.dev = &pdev->dev;
>>   	media_device_init(&vimc->mdev);
>>   
>> -	/* Add self to the component system */
>> -	ret = component_master_add_with_match(&pdev->dev, &vimc_comp_ops,
>> -					      match);
>> -	if (ret) {
>> +	ret = vimc_register_devices(vimc);
>> +	if (ret)
>>   		media_device_cleanup(&vimc->mdev);
>> -		vimc_rm_subdevs(vimc);
>> -		return ret;
>> -	}
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   static int vimc_remove(struct platform_device *pdev)
>> @@ -316,8 +270,8 @@ static int vimc_remove(struct platform_device *pdev)
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
>> index 750752bb173c..b58e0946ac2a 100644
>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>> @@ -5,10 +5,7 @@
>>    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>    */
>>   
>> -#include <linux/component.h>
>>   #include <linux/module.h>
>> -#include <linux/mod_devicetable.h>
>> -#include <linux/platform_device.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/v4l2-mediabus.h>
>>   #include <media/v4l2-subdev.h>
>> @@ -16,9 +13,7 @@
>>   #include "vimc.h"
>>   #include "vimc-common.h"
>>   
>> -#define VIMC_DEB_DRV_NAME "vimc-debayer"
>> -/* This module only supports transforming a bayer format
>> - * to V4L2_PIX_FMT_RGB24
>> +/* Supports transforming a bayer format to V4L2_PIX_FMT_RGB24
>>    */
>>   #define VIMC_DEB_SRC_PIXFMT V4L2_PIX_FMT_RGB24
>>   #define VIMC_DEB_SRC_MBUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
>> @@ -499,21 +494,19 @@ static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
>>   	.release = vimc_deb_release,
>>   };
>>   
>> -static void vimc_deb_comp_unbind(struct device *comp, struct device *master,
>> -				 void *master_data)
>> +void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct vimc_ent_device *ved = dev_get_drvdata(comp);
>> -	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
>> +	struct vimc_ent_device *ved = vent->ved;
>> +	struct vimc_deb_device *vdeb = container_of(ved,
>> +						    struct vimc_deb_device,
>>   						    ved);
>>   
>>   	vimc_ent_sd_unregister(ved, &vdeb->sd);
>>   }
>>   
>> -static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>> -			      void *master_data)
>> +int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct v4l2_device *v4l2_dev = master_data;
>> -	struct vimc_platform_data *pdata = comp->platform_data;
>> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>   	struct vimc_deb_device *vdeb;
>>   	int ret;
>>   
>> @@ -524,7 +517,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>>   
>>   	/* Initialize ved and sd */
>>   	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>> -				   pdata->entity_name,
>> +				   vent->name,
>>   				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
>>   				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>>   				   MEDIA_PAD_FL_SOURCE},
>> @@ -535,8 +528,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>>   	}
>>   
>>   	vdeb->ved.process_frame = vimc_deb_process_frame;
>> -	dev_set_drvdata(comp, &vdeb->ved);
>> -	vdeb->dev = comp;
>> +	vdeb->dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the frame format */
>>   	vdeb->sink_fmt = sink_fmt_default;
>> @@ -549,46 +541,6 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>>   	 */
>>   	vdeb->set_rgb_src = vimc_deb_set_rgb_pix_rgb24;
>>   
>> +	vent->ved = &vdeb->ved;
>>   	return 0;
>>   }
>> -
>> -static const struct component_ops vimc_deb_comp_ops = {
>> -	.bind = vimc_deb_comp_bind,
>> -	.unbind = vimc_deb_comp_unbind,
>> -};
>> -
>> -static int vimc_deb_probe(struct platform_device *pdev)
>> -{
>> -	return component_add(&pdev->dev, &vimc_deb_comp_ops);
>> -}
>> -
>> -static int vimc_deb_remove(struct platform_device *pdev)
>> -{
>> -	component_del(&pdev->dev, &vimc_deb_comp_ops);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct platform_device_id vimc_deb_driver_ids[] = {
>> -	{
>> -		.name           = VIMC_DEB_DRV_NAME,
>> -	},
>> -	{ }
>> -};
>> -
>> -static struct platform_driver vimc_deb_pdrv = {
>> -	.probe		= vimc_deb_probe,
>> -	.remove		= vimc_deb_remove,
>> -	.id_table	= vimc_deb_driver_ids,
>> -	.driver		= {
>> -		.name	= VIMC_DEB_DRV_NAME,
>> -	},
>> -};
>> -
>> -module_platform_driver(vimc_deb_pdrv);
>> -
>> -MODULE_DEVICE_TABLE(platform, vimc_deb_driver_ids);
>> -
>> -MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Debayer");
>> -MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
>> -MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>> index fe99b9102ada..7cd478fee3ae 100644
>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>> @@ -5,10 +5,7 @@
>>    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>    */
>>   
>> -#include <linux/component.h>
>>   #include <linux/module.h>
>> -#include <linux/mod_devicetable.h>
>> -#include <linux/platform_device.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/v4l2-mediabus.h>
>>   #include <media/v4l2-subdev.h>
>> @@ -16,8 +13,6 @@
>>   #include "vimc.h"
>>   #include "vimc-common.h"
>>   
>> -#define VIMC_SCA_DRV_NAME "vimc-scaler"
>> -
>>   static unsigned int sca_mult = 3;
>>   module_param(sca_mult, uint, 0000);
>>   MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>> @@ -331,22 +326,21 @@ static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
>>   	.release = vimc_sca_release,
>>   };
>>   
>> -static void vimc_sca_comp_unbind(struct device *comp, struct device *master,
>> -				 void *master_data)
>> +void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct vimc_ent_device *ved = dev_get_drvdata(comp);
>> -	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
>> +	struct vimc_ent_device *ved = vent->ved;
>> +	struct vimc_sca_device *vsca = container_of(ved,
>> +						    struct vimc_sca_device,
>>   						    ved);
>>   
>> +
>>   	vimc_ent_sd_unregister(ved, &vsca->sd);
>>   }
>>   
>>   
>> -static int vimc_sca_comp_bind(struct device *comp, struct device *master,
>> -			      void *master_data)
>> +int vimc_sca_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct v4l2_device *v4l2_dev = master_data;
>> -	struct vimc_platform_data *pdata = comp->platform_data;
>> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>   	struct vimc_sca_device *vsca;
>>   	int ret;
>>   
>> @@ -357,7 +351,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
>>   
>>   	/* Initialize ved and sd */
>>   	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
>> -				   pdata->entity_name,
>> +				   vent->name,
>>   				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
>>   				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>>   				   MEDIA_PAD_FL_SOURCE},
>> @@ -368,52 +362,12 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
>>   	}
>>   
>>   	vsca->ved.process_frame = vimc_sca_process_frame;
>> -	dev_set_drvdata(comp, &vsca->ved);
>> -	vsca->dev = comp;
>> +	vsca->dev = &vimc->pdev.dev;
>> +
>> +	vent->ved = &vsca->ved;
>>   
>>   	/* Initialize the frame format */
>>   	vsca->sink_fmt = sink_fmt_default;
>>   
>>   	return 0;
>>   }
>> -
>> -static const struct component_ops vimc_sca_comp_ops = {
>> -	.bind = vimc_sca_comp_bind,
>> -	.unbind = vimc_sca_comp_unbind,
>> -};
>> -
>> -static int vimc_sca_probe(struct platform_device *pdev)
>> -{
>> -	return component_add(&pdev->dev, &vimc_sca_comp_ops);
>> -}
>> -
>> -static int vimc_sca_remove(struct platform_device *pdev)
>> -{
>> -	component_del(&pdev->dev, &vimc_sca_comp_ops);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct platform_device_id vimc_sca_driver_ids[] = {
>> -	{
>> -		.name           = VIMC_SCA_DRV_NAME,
>> -	},
>> -	{ }
>> -};
>> -
>> -static struct platform_driver vimc_sca_pdrv = {
>> -	.probe		= vimc_sca_probe,
>> -	.remove		= vimc_sca_remove,
>> -	.id_table	= vimc_sca_driver_ids,
>> -	.driver		= {
>> -		.name	= VIMC_SCA_DRV_NAME,
>> -	},
>> -};
>> -
>> -module_platform_driver(vimc_sca_pdrv);
>> -
>> -MODULE_DEVICE_TABLE(platform, vimc_sca_driver_ids);
>> -
>> -MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Scaler");
>> -MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
>> -MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
>> index 6c57b1e262f9..bd237e030a1b 100644
>> --- a/drivers/media/platform/vimc/vimc-sensor.c
>> +++ b/drivers/media/platform/vimc/vimc-sensor.c
>> @@ -5,10 +5,6 @@
>>    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>    */
>>   
>> -#include <linux/component.h>
>> -#include <linux/module.h>
>> -#include <linux/mod_devicetable.h>
>> -#include <linux/platform_device.h>
>>   #include <linux/v4l2-mediabus.h>
>>   #include <linux/vmalloc.h>
>>   #include <media/v4l2-ctrls.h>
>> @@ -19,8 +15,6 @@
>>   #include "vimc.h"
>>   #include "vimc-common.h"
>>   
>> -#define VIMC_SEN_DRV_NAME "vimc-sensor"
>> -
>>   static const struct v4l2_mbus_framefmt fmt_default = {
>>   	.width = 640,
>>   	.height = 480,
>> @@ -268,12 +262,12 @@ static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
>>   	.release = vimc_sen_release,
>>   };
>>   
>> -static void vimc_sen_comp_unbind(struct device *comp, struct device *master,
>> -				 void *master_data)
>> +void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct vimc_ent_device *ved = dev_get_drvdata(comp);
>> -	struct vimc_sen_device *vsen =
>> -				container_of(ved, struct vimc_sen_device, ved);
>> +	struct vimc_ent_device *ved = vent->ved;
>> +	struct vimc_sen_device *vsen = container_of(ved,
>> +						    struct vimc_sen_device,
>> +						    ved);
>>   
>>   	vimc_ent_sd_unregister(ved, &vsen->sd);
>>   }
>> @@ -295,11 +289,9 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
>>   	.qmenu = tpg_pattern_strings,
>>   };
>>   
>> -static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>> -			      void *master_data)
>> +int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
>>   {
>> -	struct v4l2_device *v4l2_dev = master_data;
>> -	struct vimc_platform_data *pdata = comp->platform_data;
>> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>   	struct vimc_sen_device *vsen;
>>   	int ret;
>>   
>> @@ -332,7 +324,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>>   
>>   	/* Initialize ved and sd */
>>   	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
>> -				   pdata->entity_name,
>> +				   vent->name,
>>   				   MEDIA_ENT_F_CAM_SENSOR, 1,
>>   				   (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
>>   				   &vimc_sen_int_ops, &vimc_sen_ops);
>> @@ -340,8 +332,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>>   		goto err_free_hdl;
>>   
>>   	vsen->ved.process_frame = vimc_sen_process_frame;
>> -	dev_set_drvdata(comp, &vsen->ved);
>> -	vsen->dev = comp;
>> +	vsen->dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the frame format */
>>   	vsen->mbus_format = fmt_default;
>> @@ -353,6 +344,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>>   	if (ret)
>>   		goto err_unregister_ent_sd;
>>   
>> +	vent->ved = &vsen->ved;
>>   	return 0;
>>   
>>   err_unregister_ent_sd:
>> @@ -364,44 +356,3 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>>   
>>   	return ret;
>>   }
>> -
>> -static const struct component_ops vimc_sen_comp_ops = {
>> -	.bind = vimc_sen_comp_bind,
>> -	.unbind = vimc_sen_comp_unbind,
>> -};
>> -
>> -static int vimc_sen_probe(struct platform_device *pdev)
>> -{
>> -	return component_add(&pdev->dev, &vimc_sen_comp_ops);
>> -}
>> -
>> -static int vimc_sen_remove(struct platform_device *pdev)
>> -{
>> -	component_del(&pdev->dev, &vimc_sen_comp_ops);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct platform_device_id vimc_sen_driver_ids[] = {
>> -	{
>> -		.name           = VIMC_SEN_DRV_NAME,
>> -	},
>> -	{ }
>> -};
>> -
>> -static struct platform_driver vimc_sen_pdrv = {
>> -	.probe		= vimc_sen_probe,
>> -	.remove		= vimc_sen_remove,
>> -	.id_table	= vimc_sen_driver_ids,
>> -	.driver		= {
>> -		.name	= VIMC_SEN_DRV_NAME,
>> -	},
>> -};
>> -
>> -module_platform_driver(vimc_sen_pdrv);
>> -
>> -MODULE_DEVICE_TABLE(platform, vimc_sen_driver_ids);
>> -
>> -MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Sensor");
>> -MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
>> -MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/vimc/vimc.h b/drivers/media/platform/vimc/vimc.h
>> index a5adebdda941..cd527c6fe6fc 100644
>> --- a/drivers/media/platform/vimc/vimc.h
>> +++ b/drivers/media/platform/vimc/vimc.h
>> @@ -92,11 +92,30 @@ struct vimc_device {
>>   	/* The Associated media_device parent */
>>   	struct media_device mdev;
>>   
>> -	/* Internal v4l2 parent device*/
>> +	/* Internal v4l2 parent device */
>>   	struct v4l2_device v4l2_dev;
>> +};
>>   
>> -	/* Subdevices */
>> -	struct platform_device **subdevs;
>> +/* Structure which describes individual configuration for each entity */
>> +struct vimc_ent_config {
>> +	const char *name;
>> +	const char *drv;
> 
> I was tempted in suggesting to remove this field as it is not being used anymore,
> but it will be usefull for the configfs patch.
> 

.drv isn't used anymore. I can remove that. name is still used.

thanks,
-- Shuah
