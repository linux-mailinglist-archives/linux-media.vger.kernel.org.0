Return-Path: <linux-media+bounces-6618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D280D874C88
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 11:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021751C20E37
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D022085282;
	Thu,  7 Mar 2024 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maenK8/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7091E4B3
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709807839; cv=none; b=gKGQ43Cn0230UJNUKZMbEj16z/aKTe/Jo/W3+2v7SybKPXSGVnf5YiXmJOJLV9I+tTcfD1x5K3IGnFvlG1sy234eqQcnEEw3bV0jnjzf2w2nqDgNPSaysMGvxotNjVpTbNggX0zJ7FBaT1hC/kO6OBhEYX8WCDevAXzxnzDlpDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709807839; c=relaxed/simple;
	bh=Kx8Jwjn7JRj9ftv5xA2d9FQkLpc/6YFsv/UiCyFJ8vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhYsc48eEq1z9atNVcHW3gC7LqlLogUeN6PuQYeiKAhEWOpl9AKxqMAVxyaR1LL3Wj77CxOo96zd5o9vo2Nv+raNYCrEejIZwzOChp/0hH886Q0XtuHVs708JIWkJkfyfDLrqa94mCOBhcyymCmsoJH8GrKq80J8Zh6Ufi0T+iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maenK8/8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709807837; x=1741343837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kx8Jwjn7JRj9ftv5xA2d9FQkLpc/6YFsv/UiCyFJ8vE=;
  b=maenK8/8jDvong/TgIGDHFiJ6UB4GqJIrSbn7dUw7nWWkFV+fQFDQjhD
   9IhIcoOdafEiMpBE6TjHOlfFiMMLLTCTPyeCJvnjCA9Pk9k9d4phUtBv4
   5oQOiuFOwGoGSdYvDD8xWHeYt9iK+SvD8uv5RUhEl4j3f4ZoR08OMYNi4
   GdKXANXER/0VK7KdsrIRf2fAKGUgprGg/yQpCq+tNrqmFkSOyZIOwfMu8
   Iu1snLP7iWOA+CCq+YFDq8vpxJrwKkw1EGWrJQ2fqhS8jwEM30lHKmU2f
   GMN0qZfEslnXXXJN2rDf3aHdTBNVQzbbZwmzO/fIvCtrmUhdcxGuEAFKD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="5055195"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="5055195"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 02:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="14756582"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 02:37:15 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5EA4511F819;
	Thu,  7 Mar 2024 12:37:12 +0200 (EET)
Date: Thu, 7 Mar 2024 10:37:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 16/29] media: mc: Refcount the media device
Message-ID: <ZemY2EvwWC2xDT8g@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-17-sakari.ailus@linux.intel.com>
 <20240207110848.GN23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207110848.GN23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 01:08:48PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:37:00PM +0200, Sakari Ailus wrote:
> > As the struct media_device embeds struct media_devnode, the lifetime of
> > that object must be that same than that of the media_device.
> > 
> > References are obtained by media_device_get() and released by
> > media_device_put(). In order to use refcounting, the driver must set the
> > release callback before calling media_device_init() on the media device.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/mc/mc-device.c  | 36 +++++++++++++++++++++++++++++------
> >  drivers/media/mc/mc-devnode.c |  6 +++++-
> >  include/media/media-device.h  | 28 +++++++++++++++++++++++++++
> >  3 files changed, 63 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index e6ac9b066524..bbc233e726d2 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -700,6 +700,31 @@ void media_device_unregister_entity_notify(struct media_device *mdev,
> >  }
> >  EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
> >  
> > +static void __media_device_release(struct media_device *mdev)
> > +{
> > +	dev_dbg(mdev->dev, "Media device released\n");
> > +
> > +	ida_destroy(&mdev->entity_internal_idx);
> > +	mdev->entity_internal_idx_max = 0;
> > +	media_graph_walk_cleanup(&mdev->pm_count_walk);
> > +	mutex_destroy(&mdev->graph_mutex);
> > +	mutex_destroy(&mdev->req_queue_mutex);
> > +}
> > +
> > +static void media_device_release(struct media_devnode *devnode)
> > +{
> > +	struct media_device *mdev = to_media_device(devnode);
> > +
> > +	if (mdev->ops && mdev->ops->release) {
> > +		/*
> > +		 * If release op isn't set, __media_device_release() is called
> > +		 * via media_device_cleanup().
> > +		 */
> > +		__media_device_release(mdev);
> > +		mdev->ops->release(mdev);
> > +	}
> > +}
> > +
> >  void media_device_init(struct media_device *mdev)
> >  {
> >  	INIT_LIST_HEAD(&mdev->entities);
> > @@ -712,6 +737,8 @@ void media_device_init(struct media_device *mdev)
> >  	mutex_init(&mdev->graph_mutex);
> >  	ida_init(&mdev->entity_internal_idx);
> >  	atomic_set(&mdev->request_id, 0);
> > +
> > +	mdev->devnode.release = media_device_release;
> >  	media_devnode_init(&mdev->devnode);
> >  
> >  	if (!*mdev->bus_info)
> > @@ -724,12 +751,9 @@ EXPORT_SYMBOL_GPL(media_device_init);
> >  
> >  void media_device_cleanup(struct media_device *mdev)
> >  {
> > -	ida_destroy(&mdev->entity_internal_idx);
> > -	mdev->entity_internal_idx_max = 0;
> > -	media_graph_walk_cleanup(&mdev->pm_count_walk);
> > -	mutex_destroy(&mdev->graph_mutex);
> > -	mutex_destroy(&mdev->req_queue_mutex);
> > -	put_device(&mdev->devnode.dev);
> > +	WARN_ON(mdev->ops && mdev->ops->release);
> > +	__media_device_release(mdev);
> > +	media_device_put(mdev);
> >  }
> >  EXPORT_SYMBOL_GPL(media_device_cleanup);
> >  
> > diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> > index 5057c48f8870..4ea05e42dafb 100644
> > --- a/drivers/media/mc/mc-devnode.c
> > +++ b/drivers/media/mc/mc-devnode.c
> > @@ -59,6 +59,10 @@ static void media_devnode_release(struct device *cd)
> >  {
> >  	struct media_devnode *devnode = to_media_devnode(cd);
> >  
> > +	/* If the devnode has a ref, it is simply released by the user. */
> > +	if (devnode->ref)
> 
> The structure has no ref member.

This could explain some of the problems GCC has had compiling this patch.
;-)

This belongs to patch "media: mc: Implement best effort media device
removal safety sans refcount".

> 
> > +		return;
> > +
> >  	if (devnode->minor != -1)
> >  		media_devnode_free_minor(devnode->minor);
> >  
> > @@ -213,6 +217,7 @@ static const struct file_operations media_devnode_fops = {
> >  void media_devnode_init(struct media_devnode *devnode)
> >  {
> >  	device_initialize(&devnode->dev);
> > +	devnode->dev.release = media_devnode_release;
> >  	devnode->minor = -1;
> >  }
> >  
> > @@ -246,7 +251,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
> >  
> >  	devnode->dev.bus = &media_bus_type;
> >  	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
> > -	devnode->dev.release = media_devnode_release;
> >  	if (devnode->parent)
> >  		devnode->dev.parent = devnode->parent;
> >  	dev_set_name(&devnode->dev, "media%d", devnode->minor);
> > diff --git a/include/media/media-device.h b/include/media/media-device.h
> > index fb0855b217ce..c6816be0eee8 100644
> > --- a/include/media/media-device.h
> > +++ b/include/media/media-device.h
> > @@ -62,6 +62,7 @@ struct media_entity_notify {
> >   *	       request (and thus the buffer) must be available to the driver.
> >   *	       And once a buffer is queued, then the driver can complete
> >   *	       or delete objects from the request before req_queue exits.
> > + * @release: Release the resources of the media device.
> >   */
> >  struct media_device_ops {
> >  	int (*link_notify)(struct media_link *link, u32 flags,
> > @@ -70,6 +71,7 @@ struct media_device_ops {
> >  	void (*req_free)(struct media_request *req);
> >  	int (*req_validate)(struct media_request *req);
> >  	void (*req_queue)(struct media_request *req);
> > +	void (*release)(struct media_device *mdev);
> >  };
> >  
> >  /**
> > @@ -219,6 +221,30 @@ struct usb_device;
> >   */
> >  void media_device_init(struct media_device *mdev);
> >  
> > +/**
> > + * media_device_get() - Get a reference to a media device
> 
> Maybe mimick the get_device() wording and state "atomically increment
> the reference count for the media device" ? Same for put.

Sounds good.

> 
> > + *
> > + * @mdev: media device
> 
> This should return a pointer to the media_device, as other get functions
> do.

Yes, I'll do that for v3.

> 
> > + */
> > +#define media_device_get(mdev)						\
> > +	do {								\
> > +		dev_dbg((mdev)->dev, "%s: get media device %s\n",	\
> > +			__func__, (mdev)->bus_info);			\
> 
> Do we really need this ? I'd prefer inline functions to ensure type
> safety. If we need to track the get/put callers, I think using ftrace
> would be a better option.

I think we can drop this. It was useful for development though.

> 
> > +		get_device(&(mdev)->devnode.dev);			\
> > +	} while (0)
> > +
> > +/**
> > + * media_device_put() - Put a reference to a media device
> > + *
> > + * @mdev: media device
> > + */
> > +#define media_device_put(mdev)						\
> > +	do {								\
> > +		dev_dbg((mdev)->dev, "%s: put media device %s\n",	\
> > +			__func__, (mdev)->bus_info);			\
> > +		put_device(&(mdev)->devnode.dev);			\
> > +	} while (0)
> > +
> >  /**
> >   * media_device_cleanup() - Cleanups a media device element
> >   *
> > @@ -432,6 +458,8 @@ void __media_device_usb_init(struct media_device *mdev,
> >  			     const char *driver_name);
> >  
> >  #else
> > +#define media_device_get(mdev) do { } while (0)
> > +#define media_device_put(mdev) do { } while (0)
> >  static inline int media_device_register(struct media_device *mdev)
> >  {
> >  	return 0;
> 

-- 
Regards,

Sakari Ailus

