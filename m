Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 634C61021B
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 23:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfD3V7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 17:59:18 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40384 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfD3V7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 17:59:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id e56so7319678ede.7;
        Tue, 30 Apr 2019 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LJjGuRjlqfpGmpPjlCquHx8kcOlygrzBLbFITedv3d0=;
        b=uFwObtZ6pwaI0kZMGhis4CSKl4QPHu3xJ9HCJboLlDvKX9a8Zn70X3fqK6/XxuH4F6
         DvvfdfwU2O+ijVVWImqCXFSmPzLH67y2ODtdTQUWSuagCJOifDcEK377rOJ/pQmZuk/n
         ltAND11Y0EG3vxVEpxtK6WoN31mN+rISlS5nZD/ToymIfnhJCLaj9zXl6lA4kPLxOKnh
         60giF8Wj432AFz3JZgqm4uNsMHt4nhB/psIRgNHZ+H6l/40ge1dblxcbD/34zLx+6w39
         FU/1603Vd88MO+djd5ufYUKtVPAh5WqwECV+5DbxaMVOKdP9LOyqc/v+MxMa704/DXcs
         AMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LJjGuRjlqfpGmpPjlCquHx8kcOlygrzBLbFITedv3d0=;
        b=HkVVVh9UtXDmkwp5FLnW8zvBJRoL0xalKbmZrFqTaVmZLrZMPtKww1qQf0pEkvZGID
         wpXQNtQNNm9gSSDDq7sD5fBvcEpNRRCH3lzgiDkZGkYYXH8xS2t0ul68EmNh7NMU/SDB
         0ciG2izYlE1I3KQl3han/VCR7Vm79PEaEW3371OUcGX3v2Zv3zYmRXQu8J5gBVtEVyNm
         CEQWx2IqvchCVCX3KSvzt4SGem2VFYoYrPLk65KiM4c92Umf7TYIUz/bBtHDiIKTbyPx
         phHPf8vbP/bh4U3e8mr8EwfIyGIqqqwcwYw+QaVjQmpfjYpODqAtznNpXfuYA03ZMj2j
         xJkw==
X-Gm-Message-State: APjAAAVRKrhS1JljzpKxC1xw1CTV2xgv9yNjYjG/utVXD3+vNt9jv1fR
        jmXmAfaMMKGmytFMVF2W1tLKbSQJ
X-Google-Smtp-Source: APXvYqw46cVWQ+ntHFnusosHesUXZioNi+MAuWzAVAQXAwqcBz/IQNDzCyZihW4BySX+ZIBX78G6mg==
X-Received: by 2002:a50:99ca:: with SMTP id n10mr7288099edb.279.1556661554794;
        Tue, 30 Apr 2019 14:59:14 -0700 (PDT)
Received: from [172.30.89.180] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r2sm2001990ejp.76.2019.04.30.14.59.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:59:13 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] media: staging/imx: Switch to sync registration
 for IPU subdevs
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190428190916.26567-1-slongerbeam@gmail.com>
 <20190428190916.26567-2-slongerbeam@gmail.com> <m3a7g7nom1.fsf@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <d73e9504-5d4a-14cd-d834-0e21d0ca0d65@gmail.com>
Date:   Tue, 30 Apr 2019 14:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <m3a7g7nom1.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Rui for catching the bisect problem, I will fix for v3.

Steve


On 4/30/19 2:56 PM, Rui Miguel Silva wrote:
> Hi Steve,
> On Sun 28 Apr 2019 at 20:09, Steve Longerbeam wrote:
>> Because the IPU sub-devices VDIC and IC are not present in the
>> device-tree, platform devices were created for them instead. This
>> allowed these sub-devices to be added to the media device's async
>> notifier and registered asynchronously along with the other
>> sub-devices that do have a device-tree presence (CSI and devices
>> external to the IPU and SoC).
>>
>> But that approach isn't really necessary. The IPU sub-devices don't
>> actually require a backing device (sd->dev is allowed to be NULL).
>> And that approach can't get around the fact that the IPU sub-devices
>> are not part of a device hierarchy, which makes it awkward to retrieve
>> the parent IPU of these devices.
>>
>> By registering them synchronously, they can be registered from the CSI
>> async bound notifier, so the init function for them can be given the CSI
>> subdev, who's dev->parent is the IPU. That is a somewhat cleaner way
>> to retrieve the parent IPU.
>>
>> So convert to synchronous registration for the VDIC and IC task
>> sub-devices, at the time a CSI sub-device is bound. There is no longer
>> a backing device for them (sd->dev is NULL), but that's ok. Also
>> set the VDIC/IC sub-device owner as the IPU, so that a reference can
>> be taken on the IPU module.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> I am trying to bisect when my capture starts to fail to work with
> this series, since they are so many changes and reorg that I got
> lost on some of them. But... see below.
>
>> ---
>>   drivers/staging/media/imx/imx-ic-common.c     |  70 ++--
>>   drivers/staging/media/imx/imx-ic-prp.c        |  34 +-
>>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  70 ++--
>>   drivers/staging/media/imx/imx-ic.h            |   7 +-
>>   drivers/staging/media/imx/imx-media-capture.c |   7 +-
>>   drivers/staging/media/imx/imx-media-csi.c     |   2 +-
>>   drivers/staging/media/imx/imx-media-dev.c     | 121 +-----
>>   .../staging/media/imx/imx-media-internal-sd.c | 356 ++++++++----------
>>   drivers/staging/media/imx/imx-media-of.c      |  38 +-
>>   drivers/staging/media/imx/imx-media-vdic.c    |  85 ++---
>>   drivers/staging/media/imx/imx-media.h         |  67 ++--
>>   drivers/staging/media/imx/imx7-media-csi.c    |   3 +-
>>   12 files changed, 325 insertions(+), 535 deletions(-)
>>
>> +	dev_dbg(priv->ipu_dev, "%s: link setup %s -> %s",
> <snip>
>
>> +		sd->name, remote->entity->name, local->entity->name);
>>   
>>   	mutex_lock(&priv->lock);
>>   
>> @@ -864,9 +856,6 @@ static int vdic_registered(struct v4l2_subdev *sd)
>>   	int i, ret;
>>   	u32 code;
>>   
>> -	/* get media device */
>> -	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
>> -
>>   	for (i = 0; i < VDIC_NUM_PADS; i++) {
>>   		priv->pad[i].flags = (i == VDIC_SRC_PAD_DIRECT) ?
>>   			MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
>> @@ -938,77 +927,55 @@ static const struct v4l2_subdev_internal_ops vdic_internal_ops = {
>>   	.unregistered = vdic_unregistered,
>>   };
>>   
>> -static int imx_vdic_probe(struct platform_device *pdev)
>> +struct v4l2_subdev *imx_media_vdic_register(struct imx_media_dev *imxmd,
>> +					    struct device *ipu_dev,
>> +					    struct ipu_soc *ipu,
>> +					    u32 grp_id)
>>   {
>> -	struct imx_media_ipu_internal_sd_pdata *pdata;
>> +	struct v4l2_device *v4l2_dev = &imxmd->v4l2_dev;
>>   	struct vdic_priv *priv;
>>   	int ret;
>>   
>> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	priv = devm_kzalloc(ipu_dev, sizeof(*priv), GFP_KERNEL);
>>   	if (!priv)
>> -		return -ENOMEM;
>> +		return ERR_PTR(-ENOMEM);
>>   
>> -	platform_set_drvdata(pdev, &priv->sd);
>> -	priv->dev = &pdev->dev;
>> -
>> -	pdata = priv->dev->platform_data;
>> -	priv->ipu_id = pdata->ipu_id;
>> +	priv->ipu_dev = ipu_dev;
>> +	priv->ipu = ipu;
>> +	priv->md = imxmd;
>>   
>>   	v4l2_subdev_init(&priv->sd, &vdic_subdev_ops);
>>   	v4l2_set_subdevdata(&priv->sd, priv);
>>   	priv->sd.internal_ops = &vdic_internal_ops;
>>   	priv->sd.entity.ops = &vdic_entity_ops;
>>   	priv->sd.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>> -	priv->sd.dev = &pdev->dev;
>> -	priv->sd.owner = THIS_MODULE;
>> +	priv->sd.owner = ipu_dev->driver->owner;
>>   	priv->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> -	/* get our group id */
>> -	priv->sd.grp_id = pdata->grp_id;
>> -	strscpy(priv->sd.name, pdata->sd_name, sizeof(priv->sd.name));
>> +	priv->sd.grp_id = grp_id;
>> +	imx_media_grp_id_to_sd_name(priv->sd.name, sizeof(priv->sd.name),
>> +				    priv->sd.grp_id, ipu_get_num(ipu));
>>   
>>   	mutex_init(&priv->lock);
>>   
>> -	ret = v4l2_async_register_subdev(&priv->sd);
>> +	ret = v4l2_device_register_subdev(v4l2_dev, &priv->sd);
>>   	if (ret)
>>   		goto free;
>>   
>> -	return 0;
>> +	return &priv->sd;
>>   free:
>>   	mutex_destroy(&priv->lock);
>> -	return ret;
>> +	return ERR_PTR(ret);
>>   }
>>   
>> -static int imx_vdic_remove(struct platform_device *pdev)
>> +int imx_media_vdic_unregister(struct v4l2_subdev *sd)
>>   {
>> -	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
>>   	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
>>   
>>   	v4l2_info(sd, "Removing\n");
>>   
>> -	v4l2_async_unregister_subdev(sd);
>> +	v4l2_device_unregister_subdev(sd);
>>   	mutex_destroy(&priv->lock);
>>   	media_entity_cleanup(&sd->entity);
>>   
>>   	return 0;
>>   }
>> -
>> -static const struct platform_device_id imx_vdic_ids[] = {
>> -	{ .name = "imx-ipuv3-vdic" },
>> -	{ },
>> -};
>> -MODULE_DEVICE_TABLE(platform, imx_vdic_ids);
>> -
>> -static struct platform_driver imx_vdic_driver = {
>> -	.probe = imx_vdic_probe,
>> -	.remove = imx_vdic_remove,
>> -	.id_table = imx_vdic_ids,
>> -	.driver = {
>> -		.name = "imx-ipuv3-vdic",
>> -	},
>> -};
>> -module_platform_driver(imx_vdic_driver);
>> -
>> -MODULE_DESCRIPTION("i.MX VDIC subdev driver");
>> -MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
>> -MODULE_LICENSE("GPL");
>> -MODULE_ALIAS("platform:imx-ipuv3-vdic");
> This breaks compilation until patch 6/8. I think you need to make
> some makefile changes also in this patch.
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/staging/media/imx/imx-media-ic.o
> see include/linux/module.h for more information
> WARNING: modpost: missing MODULE_LICENSE() in drivers/staging/media/imx/imx-media-vdic.o
> see include/linux/module.h for more information
> ERROR: "imx_media_ic_register" [drivers/staging/media/imx/imx-media.ko] undefined!
> ERROR: "imx_media_vdic_register" [drivers/staging/media/imx/imx-media.ko] undefined!
> ERROR: "imx_media_vdic_unregister" [drivers/staging/media/imx/imx-media.ko] undefined!
> ERROR: "imx_media_ic_unregister" [drivers/staging/media/imx/imx-media.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
> make[1]: *** [/dev/shm/linux-git/Makefile:1263: modules] Error 2
> make: *** [Makefile:170: sub-make] Error 2
>
> ---
> Cheers,
> 	Rui
>

