Return-Path: <linux-media+bounces-4790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC684C7B1
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9B21F26B75
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 09:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A433C082;
	Wed,  7 Feb 2024 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wISpQNSE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093383C068
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707298702; cv=none; b=bvgA8iKxpzq6S3ODwN05VGzLMEQyEVl6SEzx7cmN6x3Fidg7Qn88xOXWhp6neLB8r4CjdRJfW94iWh421BTPwWEbNyt21Pi0sfayAyd6Mh72t0y0XlFH3T9n/C2irlo+qNjQeeSG5C7yKHDRX1uAZ80IzyL3BrsKOkrYBIDK860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707298702; c=relaxed/simple;
	bh=eeeqz/EsQkf14bOEGSTFR0nfLxapT900pH2ArOt4S8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKzEqZlaFUQ9NYMMQdv5CNw/ocA5iMHDo+8z4SfwxeXarmfVMlX9KyqS8O3SdelmUwcJbQDoFx3EZodyztZXxotXxImRB4csZZKSqjmr4s/DPcV7Vr81vyM78EZCCZm7jBuFre4SsTjCumOaf2JRha+cDYAC9VKPT6MD94+1gpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wISpQNSE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EDCE975;
	Wed,  7 Feb 2024 10:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707298612;
	bh=eeeqz/EsQkf14bOEGSTFR0nfLxapT900pH2ArOt4S8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wISpQNSEodbL5dY9EkTRQBGnS6XvB54nJ81lYanlUnQ3ZAvbCZQ8Gu6HRaOjVuUiI
	 yKx028yX9CLKkEOH/V9u8QP1NLu0quntqli9WfC/IKz3D0Ga/1y8tG42FCaGP/aaQS
	 Drc+OwI4NmrS3R3HkuATuySVvEnaEeNSCD08gWf4=
Date: Wed, 7 Feb 2024 11:38:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 04/29] media: mc: utilize new cdev_device_add helper
 function
Message-ID: <20240207093817.GF2827@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-5-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:48PM +0200, Sakari Ailus wrote:
> From: Logan Gunthorpe <logang@deltatee.com>
> 
> Replace the open coded registration of the cdev and dev with the
> new device_add_cdev() helper. The helper replaces a common pattern by
> taking the proper reference against the parent device and adding both
> the cdev and the device.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This reapplies a commit you've reverted in 02/29 in this series. I
understand this is done to be able to apply the revert in 03/29 cleanly.
Given that those three patches are consecutive, wouldn't it be better to
squash 02/29, 03/29 and 04/29, with the commit message of 03/29 ?
Otherwise, I would at least drop the Acked-by and Reviewed-by tags in
the patches you reapply, as they've been reviewed in a different
context.

The same applies to patches 05/29, 06/29 and 07/29.

> ---
>  drivers/media/cec/core/cec-core.c | 16 ++++------------
>  drivers/media/mc/mc-devnode.c     | 23 +++++++++--------------
>  2 files changed, 13 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
> index 0645e68411fb..15494b46458a 100644
> --- a/drivers/media/cec/core/cec-core.c
> +++ b/drivers/media/cec/core/cec-core.c
> @@ -137,26 +137,19 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
>  
>  	/* Part 2: Initialize and register the character device */
>  	cdev_init(&devnode->cdev, &cec_devnode_fops);
> -	devnode->cdev.kobj.parent = &devnode->dev.kobj;
>  	devnode->cdev.owner = owner;
>  	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);
>  
>  	devnode->registered = true;
> -	ret = cdev_add(&devnode->cdev, devnode->dev.devt, 1);
> -	if (ret < 0) {
> -		pr_err("%s: cdev_add failed\n", __func__);
> +	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
> +	if (ret) {
> +		pr_err("%s: cdev_device_add failed\n", __func__);
>  		devnode->registered = false;
>  		goto clr_bit;
>  	}
>  
> -	ret = device_add(&devnode->dev);
> -	if (ret)
> -		goto cdev_del;
> -
>  	return 0;
>  
> -cdev_del:
> -	cdev_del(&devnode->cdev);
>  clr_bit:
>  	mutex_lock(&cec_devnode_lock);
>  	clear_bit(devnode->minor, cec_devnode_nums);
> @@ -202,8 +195,7 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
>  	cec_adap_enable(adap);
>  	mutex_unlock(&adap->lock);
>  
> -	device_del(&devnode->dev);
> -	cdev_del(&devnode->cdev);
> +	cdev_device_del(&devnode->cdev, &devnode->dev);
>  	put_device(&devnode->dev);
>  }
>  
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 1e1792c3ae3f..fabcd646679b 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -232,29 +232,24 @@ int __must_check media_devnode_register(struct media_device *mdev,
>  	devnode->minor = minor;
>  	devnode->media_dev = mdev;
>  
> -	/* Part 2: Initialize and register the character device */
> +	/* Part 2: Initialize the media and character devices */
>  	cdev_init(&devnode->cdev, &media_devnode_fops);
>  	devnode->cdev.owner = owner;
>  	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
>  
> -	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
> -					     devnode->minor), 1);
> -	if (ret < 0) {
> -		pr_err("%s: cdev_add failed\n", __func__);
> -		goto error;
> -	}
> -
> -	/* Part 3: Register the media device */
>  	devnode->dev.bus = &media_bus_type;
>  	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
>  	devnode->dev.release = media_devnode_release;
>  	if (devnode->parent)
>  		devnode->dev.parent = devnode->parent;
>  	dev_set_name(&devnode->dev, "media%d", devnode->minor);
> -	ret = device_register(&devnode->dev);
> +	device_initialize(&devnode->dev);
> +
> +	/* Part 3: Add the media and character devices */
> +	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
>  	if (ret < 0) {
> -		pr_err("%s: device_register failed\n", __func__);
> -		goto error;
> +		pr_err("%s: cdev_device_add failed\n", __func__);
> +		goto cdev_add_error;
>  	}
>  
>  	/* Part 4: Activate this minor. The char device can now be used. */
> @@ -262,9 +257,9 @@ int __must_check media_devnode_register(struct media_device *mdev,
>  
>  	return 0;
>  
> -error:
> +cdev_add_error:
>  	mutex_lock(&media_devnode_lock);
> -	cdev_del(&devnode->cdev);
> +	cdev_device_del(&devnode->cdev, &devnode->dev);
>  	clear_bit(devnode->minor, media_devnode_nums);
>  	mutex_unlock(&media_devnode_lock);
>  

-- 
Regards,

Laurent Pinchart

