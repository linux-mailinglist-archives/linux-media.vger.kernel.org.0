Return-Path: <linux-media+bounces-4804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF30684C934
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 12:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34BE81F24414
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD4917BC5;
	Wed,  7 Feb 2024 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kOw1MnX9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22317BCD
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304130; cv=none; b=hq4CdLUb3+TOVPHJ/WqvXQDs0KsKdn/lCldBUb5MrLLOWsthinD98waTosu6QaVWYR/5Um42xVUcwUv2anLzlozXB8WbI2XEzLjL9wsBoTV+u2Ury/0lII5byQxIpOWAAICs8xzluL46qf1yOJyEjfjmUcTkcUa+TPlKqw+RoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304130; c=relaxed/simple;
	bh=WPYWniCuOZziODkvNOguB6N7j1mvOKESRZo8JgqXOEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiSG8AjTk+Iv/uC8gWbUlmtN0dmPZi5EEONxudp0ZDCoiDh5ueNP56UIhMKi/GEKeeBXYxZyLbyHDQ9YVdaMYBWPwF9Ki1WFi2K6x4IA1GKCTiG3LwSsjAVBUoN4unbLC+/oq/Qh7zsXaCfQ+Avo0ph2vnqQ6RMlO6YwNY+7tfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kOw1MnX9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCF3B975;
	Wed,  7 Feb 2024 12:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707304043;
	bh=WPYWniCuOZziODkvNOguB6N7j1mvOKESRZo8JgqXOEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOw1MnX9mdTPqhCD/H3Cdgq0/UWtoKU5mI4uwFH++0lGSL+cx2rfWTfLMKJ5UZX+F
	 KzDTWE2Y4+URAnrNA8gXtTJs1e4xvl1zdp9mUHj9JjZSIHyoznpfZn4vAcATTAaE1H
	 B5Hiot8S+OHtlCbm+bnoO0c4DeO89FWZ/zZTHmLc=
Date: Wed, 7 Feb 2024 13:08:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 16/29] media: mc: Refcount the media device
Message-ID: <20240207110848.GN23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-17-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:37:00PM +0200, Sakari Ailus wrote:
> As the struct media_device embeds struct media_devnode, the lifetime of
> that object must be that same than that of the media_device.
> 
> References are obtained by media_device_get() and released by
> media_device_put(). In order to use refcounting, the driver must set the
> release callback before calling media_device_init() on the media device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/mc/mc-device.c  | 36 +++++++++++++++++++++++++++++------
>  drivers/media/mc/mc-devnode.c |  6 +++++-
>  include/media/media-device.h  | 28 +++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index e6ac9b066524..bbc233e726d2 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -700,6 +700,31 @@ void media_device_unregister_entity_notify(struct media_device *mdev,
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
>  
> +static void __media_device_release(struct media_device *mdev)
> +{
> +	dev_dbg(mdev->dev, "Media device released\n");
> +
> +	ida_destroy(&mdev->entity_internal_idx);
> +	mdev->entity_internal_idx_max = 0;
> +	media_graph_walk_cleanup(&mdev->pm_count_walk);
> +	mutex_destroy(&mdev->graph_mutex);
> +	mutex_destroy(&mdev->req_queue_mutex);
> +}
> +
> +static void media_device_release(struct media_devnode *devnode)
> +{
> +	struct media_device *mdev = to_media_device(devnode);
> +
> +	if (mdev->ops && mdev->ops->release) {
> +		/*
> +		 * If release op isn't set, __media_device_release() is called
> +		 * via media_device_cleanup().
> +		 */
> +		__media_device_release(mdev);
> +		mdev->ops->release(mdev);
> +	}
> +}
> +
>  void media_device_init(struct media_device *mdev)
>  {
>  	INIT_LIST_HEAD(&mdev->entities);
> @@ -712,6 +737,8 @@ void media_device_init(struct media_device *mdev)
>  	mutex_init(&mdev->graph_mutex);
>  	ida_init(&mdev->entity_internal_idx);
>  	atomic_set(&mdev->request_id, 0);
> +
> +	mdev->devnode.release = media_device_release;
>  	media_devnode_init(&mdev->devnode);
>  
>  	if (!*mdev->bus_info)
> @@ -724,12 +751,9 @@ EXPORT_SYMBOL_GPL(media_device_init);
>  
>  void media_device_cleanup(struct media_device *mdev)
>  {
> -	ida_destroy(&mdev->entity_internal_idx);
> -	mdev->entity_internal_idx_max = 0;
> -	media_graph_walk_cleanup(&mdev->pm_count_walk);
> -	mutex_destroy(&mdev->graph_mutex);
> -	mutex_destroy(&mdev->req_queue_mutex);
> -	put_device(&mdev->devnode.dev);
> +	WARN_ON(mdev->ops && mdev->ops->release);
> +	__media_device_release(mdev);
> +	media_device_put(mdev);
>  }
>  EXPORT_SYMBOL_GPL(media_device_cleanup);
>  
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 5057c48f8870..4ea05e42dafb 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -59,6 +59,10 @@ static void media_devnode_release(struct device *cd)
>  {
>  	struct media_devnode *devnode = to_media_devnode(cd);
>  
> +	/* If the devnode has a ref, it is simply released by the user. */
> +	if (devnode->ref)

The structure has no ref member.

> +		return;
> +
>  	if (devnode->minor != -1)
>  		media_devnode_free_minor(devnode->minor);
>  
> @@ -213,6 +217,7 @@ static const struct file_operations media_devnode_fops = {
>  void media_devnode_init(struct media_devnode *devnode)
>  {
>  	device_initialize(&devnode->dev);
> +	devnode->dev.release = media_devnode_release;
>  	devnode->minor = -1;
>  }
>  
> @@ -246,7 +251,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  
>  	devnode->dev.bus = &media_bus_type;
>  	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
> -	devnode->dev.release = media_devnode_release;
>  	if (devnode->parent)
>  		devnode->dev.parent = devnode->parent;
>  	dev_set_name(&devnode->dev, "media%d", devnode->minor);
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index fb0855b217ce..c6816be0eee8 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -62,6 +62,7 @@ struct media_entity_notify {
>   *	       request (and thus the buffer) must be available to the driver.
>   *	       And once a buffer is queued, then the driver can complete
>   *	       or delete objects from the request before req_queue exits.
> + * @release: Release the resources of the media device.
>   */
>  struct media_device_ops {
>  	int (*link_notify)(struct media_link *link, u32 flags,
> @@ -70,6 +71,7 @@ struct media_device_ops {
>  	void (*req_free)(struct media_request *req);
>  	int (*req_validate)(struct media_request *req);
>  	void (*req_queue)(struct media_request *req);
> +	void (*release)(struct media_device *mdev);
>  };
>  
>  /**
> @@ -219,6 +221,30 @@ struct usb_device;
>   */
>  void media_device_init(struct media_device *mdev);
>  
> +/**
> + * media_device_get() - Get a reference to a media device

Maybe mimick the get_device() wording and state "atomically increment
the reference count for the media device" ? Same for put.

> + *
> + * @mdev: media device

This should return a pointer to the media_device, as other get functions
do.

> + */
> +#define media_device_get(mdev)						\
> +	do {								\
> +		dev_dbg((mdev)->dev, "%s: get media device %s\n",	\
> +			__func__, (mdev)->bus_info);			\

Do we really need this ? I'd prefer inline functions to ensure type
safety. If we need to track the get/put callers, I think using ftrace
would be a better option.

> +		get_device(&(mdev)->devnode.dev);			\
> +	} while (0)
> +
> +/**
> + * media_device_put() - Put a reference to a media device
> + *
> + * @mdev: media device
> + */
> +#define media_device_put(mdev)						\
> +	do {								\
> +		dev_dbg((mdev)->dev, "%s: put media device %s\n",	\
> +			__func__, (mdev)->bus_info);			\
> +		put_device(&(mdev)->devnode.dev);			\
> +	} while (0)
> +
>  /**
>   * media_device_cleanup() - Cleanups a media device element
>   *
> @@ -432,6 +458,8 @@ void __media_device_usb_init(struct media_device *mdev,
>  			     const char *driver_name);
>  
>  #else
> +#define media_device_get(mdev) do { } while (0)
> +#define media_device_put(mdev) do { } while (0)
>  static inline int media_device_register(struct media_device *mdev)
>  {
>  	return 0;

-- 
Regards,

Laurent Pinchart

