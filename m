Return-Path: <linux-media+bounces-4798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E384C8E4
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 960A51F23D53
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8586E16431;
	Wed,  7 Feb 2024 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y07aEhHk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896C17582
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 10:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707302775; cv=none; b=lqHoFY4yXKdqQjULur5PzNnRPwIhhcN+SFGMFo6Q/6XmRPP968HaiG2I5vcsGCTT9DE7bSMuDmwZdT7FCqeGi//JH0VT3Bb/4MqvxJxTVlC2xXHe/Z+YzfVjOwXOjLKyTug53oAD2hbi0ThvmRDENQekq+40CiSEHFmsIszspYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707302775; c=relaxed/simple;
	bh=JUC5pmGAzWpqEgyes88EhCXyc6dXiIiiwfdTYwc/+NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDotPEfwUgHfrYex5joD3jp7oJ1TlH1N2nH+dY+oEa9nky/RnudfjVDEsggasIgflVUpmGqt6uGHLvvfDalnzoFgZKlsldAzmEgOWyuRa+MHHotH3lp3+eI8MFx4JCvl2Dar6S3WDuF5PpwosjNAMZtwnqzUL1DCKJeaNhiYOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y07aEhHk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BBAE975;
	Wed,  7 Feb 2024 11:44:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707302687;
	bh=JUC5pmGAzWpqEgyes88EhCXyc6dXiIiiwfdTYwc/+NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y07aEhHkRNupHXv8qaXZmy6H5wsGt8nzSobyeAnaFyS48ISMN9yBKNQ3Njk9ILyPg
	 PAVRr+pIQY4TwKB/79HcByz9n9nnmPxoO+PDamfZ4/fkYL87Rf9WTMNxO3TuPaU2Mz
	 GdqmF15qyt+zcj7IJxsrKTCtFrxJgNR12yvZITxo=
Date: Wed, 7 Feb 2024 12:46:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 11/29] media: mc: Split initialising and adding media
 devnode
Message-ID: <20240207104613.GH23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-12-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:55PM +0200, Sakari Ailus wrote:
> As registering a device node of an entity belonging to a media device

Did you mean s/As registering/Registering/ ?

> will require a reference to the struct device. Taking that reference is
> only possible once the device has been initialised, which took place only

s/took/takes/

> when it was registered. Split this in two, and initialise the device when

s/was/is/

> the media device is allocated.
> 
> Don't distribute the effects of these changes yet. Add media_device_get()
> and media_device_put() first.

Don't propagate the effects of these changes to drivers yet, we want to
expose media_device refcounting with media_device_get() and
media_device_put() functions first.


I'm not sure that's exactly what you meant though.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-device.c  | 18 +++++++++++++-----
>  drivers/media/mc/mc-devnode.c | 17 ++++++++++-------
>  include/media/media-devnode.h | 19 ++++++++++++++-----
>  3 files changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index c0ea08a8fc31..ebf037cd5f4a 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -717,19 +717,26 @@ int __must_check __media_device_register(struct media_device *mdev,
>  	/* Set version 0 to indicate user-space that the graph is static */
>  	mdev->topology_version = 0;
>  
> +	media_devnode_init(&mdev->devnode);
> +
>  	ret = media_devnode_register(&mdev->devnode, owner);
>  	if (ret < 0)
> -		return ret;
> +		goto out_put;
>  
>  	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
> -	if (ret < 0) {
> -		media_devnode_unregister(&mdev->devnode);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto out_unregister;
>  
>  	dev_dbg(mdev->dev, "Media device registered\n");
>  
>  	return 0;
> +
> +out_unregister:

I would name the labels err_unregister and err_put.

> +	media_devnode_unregister(&mdev->devnode);
> +out_put:
> +	put_device(&mdev->devnode.dev);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(__media_device_register);
>  
> @@ -803,6 +810,7 @@ void media_device_unregister(struct media_device *mdev)
>  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
>  	dev_dbg(mdev->dev, "Media device unregistering\n");
>  	media_devnode_unregister(&mdev->devnode);
> +	put_device(&mdev->devnode.dev);
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister);
>  
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 8bc7450ac144..7b17419050fb 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -204,6 +204,11 @@ static const struct file_operations media_devnode_fops = {
>  	.llseek = no_llseek,
>  };
>  
> +void media_devnode_init(struct media_devnode *devnode)
> +{
> +	device_initialize(&devnode->dev);
> +}
> +
>  int __must_check media_devnode_register(struct media_devnode *devnode,
>  					struct module *owner)
>  {
> @@ -235,7 +240,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  	if (devnode->parent)
>  		devnode->dev.parent = devnode->parent;
>  	dev_set_name(&devnode->dev, "media%d", devnode->minor);
> -	device_initialize(&devnode->dev);
>  
>  	/* Part 3: Add the media and character devices */
>  	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
> @@ -267,14 +271,13 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
>  	mutex_unlock(&media_devnode_lock);
>  
> -	cdev_del(&devnode->cdev);
> -	device_unregister(&devnode->dev);
> +	cdev_device_del(&devnode->cdev, &devnode->dev);
>  }
>  
>  /*
>   *	Initialise media for linux
>   */
> -static int __init media_devnode_init(void)
> +static int __init media_devnode_module_init(void)
>  {
>  	int ret;
>  
> @@ -296,14 +299,14 @@ static int __init media_devnode_init(void)
>  	return 0;
>  }
>  
> -static void __exit media_devnode_exit(void)
> +static void __exit media_devnode_module_exit(void)
>  {
>  	bus_unregister(&media_bus_type);
>  	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
>  }
>  
> -subsys_initcall(media_devnode_init);
> -module_exit(media_devnode_exit)
> +subsys_initcall(media_devnode_module_init);
> +module_exit(media_devnode_module_exit)
>  
>  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>  MODULE_DESCRIPTION("Device node registration for media drivers");
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index 1117d1dfd6bf..6d46c658be21 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -90,6 +90,17 @@ struct media_devnode {
>  /* dev to media_devnode */
>  #define to_media_devnode(cd) container_of(cd, struct media_devnode, dev)
>  
> +/**
> + * media_devnode_init - initialise a media devnode
> + *
> + * @devnode: struct media_devnode we want to initialise
> + *
> + * Initialise a media devnode. Note that after initialising the media
> + * devnode is refcounted. Releasing references to it may be done using
> + * put_device().
> + */
> +void media_devnode_init(struct media_devnode *devnode);
> +
>  /**
>   * media_devnode_register - register a media device node
>   *
> @@ -100,11 +111,9 @@ struct media_devnode {
>   * with the kernel. An error is returned if no free minor number can be found,
>   * or if the registration of the device node fails.
>   *
> - * Zero is returned on success.
> - *
> - * Note that if the media_devnode_register call fails, the release() callback of
> - * the media_devnode structure is *not* called, so the caller is responsible for
> - * freeing any data.
> + * Zero is returned on success. Note that in case
> + * media_devnode_register() fails, the caller is responsible for
> + * releasing the reference to the device using put_device().
>   */
>  int __must_check media_devnode_register(struct media_devnode *devnode,
>  					struct module *owner);

-- 
Regards,

Laurent Pinchart

