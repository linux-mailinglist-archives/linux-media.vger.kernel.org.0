Return-Path: <linux-media+bounces-4721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCF849E9E
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 16:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0A31F229AC
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CC72D638;
	Mon,  5 Feb 2024 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D17d1rAr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BED33CDA
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707147699; cv=none; b=JL4mBvlTht/lxswy9GDXoRv8XAoVJKiFUohsB2ZgX+qc7EG81Qm2TTfESHwcRpuawjNjBTMxhJlSoZjKlB1Ww1k9SoI3q7z57zEYMI4D6Q3VAiObGYTwPiX7lgvLzFSyRqThtacf9qpslAK+Mp4Wvkrk+IK8oemtddxLCEFSq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707147699; c=relaxed/simple;
	bh=r3ANmH3dHi4ouzAdk7/whR7RFNlrzu5m8k4y1xAeUJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6Wi0lPRS18vELSRQDWbYLrbsnS4hfdX1IVQ15VrN0j8px8H3vV7TmWB6D3l3t5CYE61UaX8gEQtaFcgyvYslg7/1uvdqgtnt14Q6V47QpR1yOmXyQ/fj6v5rhxHJuCx6pYJkvkPqQQxTeLkPAGkQR5DiS1S8OsaGbU3DMYn++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D17d1rAr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3C9B273;
	Mon,  5 Feb 2024 16:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707147612;
	bh=r3ANmH3dHi4ouzAdk7/whR7RFNlrzu5m8k4y1xAeUJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D17d1rAr/t1v4P9ECRTV2MghYIQx9wdRFaU/iYDqZw9yu/OxnYu8z4H2hYKOTV4ut
	 6qNHdgxqtLlSEdjMGPyKO1IDs/tqXXJKQKrMOJFFwUK93cEpQhf/QjuqhY76BOeqDr
	 XKm8kMJ/p9WZvhHOEBEhnHr8qKf4GnckPl2uoO9I=
Date: Mon, 5 Feb 2024 17:41:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 26/29] media: mc: Maintain a list of open file handles
 in a media device
Message-ID: <20240205154136.GA9560@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-27-sakari.ailus@linux.intel.com>
 <84475ab9-e644-4254-81f6-db4da6a3e12e@xs4all.nl>
 <20240205151602.GA8645@pendragon.ideasonboard.com>
 <659634d3-64c0-45fa-b816-4e32f9035a06@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <659634d3-64c0-45fa-b816-4e32f9035a06@xs4all.nl>

On Mon, Feb 05, 2024 at 04:32:44PM +0100, Hans Verkuil wrote:
> On 05/02/2024 16:16, Laurent Pinchart wrote:
> > On Mon, Feb 05, 2024 at 04:11:43PM +0100, Hans Verkuil wrote:
> >> On 20/12/2023 11:37, Sakari Ailus wrote:
> >>> The list of file handles is needed to deliver media events as well as for
> >>> other purposes in the future.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/mc/mc-device.c  | 23 ++++++++++++++++++++++-
> >>>  drivers/media/mc/mc-devnode.c |  2 +-
> >>>  include/media/media-devnode.h |  4 +++-
> >>>  3 files changed, 26 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> >>> index 67a39cb63f89..9cc055deeec9 100644
> >>> --- a/drivers/media/mc/mc-device.c
> >>> +++ b/drivers/media/mc/mc-device.c
> >>> @@ -45,9 +45,11 @@ static inline void __user *media_get_uptr(__u64 arg)
> >>>  	return (void __user *)(uintptr_t)arg;
> >>>  }
> >>>  
> >>> -static int media_device_open(struct file *filp)
> >>> +static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >>>  {
> >>> +	struct media_device *mdev = to_media_device(devnode);
> >>>  	struct media_device_fh *fh;
> >>> +	unsigned long flags;
> >>>  
> >>>  	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> >>>  	if (!fh)
> >>> @@ -55,12 +57,23 @@ static int media_device_open(struct file *filp)
> >>>  
> >>>  	filp->private_data = &fh->fh;
> >>>  
> >>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
> >>
> >> The only reason for using the irqsave variant is because we want
> >> to support events in the future, and those can be sent in irq context.
> > 
> > Even in that case, would media_device_open() ever be called from
> > interrupt context ? spin_lock_irqsave() is only needed if you don't know
> > which context the function can be called from. If we know we'll be
> > called from interruptible context only, you can use spin_lock_irq()
> > instead.
> 
> Someone can call open() while at the same time the kernel sends a
> media event from interrupt context. Such an event function will walk
> over the fh_list. The irqsave here is meant to ensure that no event
> interrupt can run while we add our fh to the fh list.

You don't need spin_lock_irqsave() for that, spin_lock_irq() is enough.
In your interrupt handler, you need spin_lock() only.
spin_lock_irqsave() is for places that can be called both from
interruptible and non-interruptible contexts.

> But without interrupts that access fh_list the irqsave variant is
> confusing.
> 
> >> But it is confusing to see this being used here when it is not yet
> >> needed.
> >>
> >> At minimum this should be explained in the commit log.
> >>
> >>> +	list_add(&fh->mdev_list, &mdev->fh_list);
> >>> +	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
> >>> +
> >>>  	return 0;
> >>>  }
> >>>  
> >>>  static int media_device_close(struct file *filp)
> >>>  {
> >>> +	struct media_devnode *devnode = media_devnode_data(filp);
> >>> +	struct media_device *mdev = to_media_device(devnode);
> >>>  	struct media_device_fh *fh = media_device_fh(filp);
> >>> +	unsigned long flags;
> >>> +
> >>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
> >>> +	list_del(&fh->mdev_list);
> >>> +	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
> >>>  
> >>>  	kfree(fh);
> >>>  
> >>> @@ -769,11 +782,13 @@ void media_device_init(struct media_device *mdev)
> >>>  	INIT_LIST_HEAD(&mdev->pads);
> >>>  	INIT_LIST_HEAD(&mdev->links);
> >>>  	INIT_LIST_HEAD(&mdev->entity_notify);
> >>> +	INIT_LIST_HEAD(&mdev->fh_list);
> >>>  
> >>>  	mutex_init(&mdev->req_queue_mutex);
> >>>  	mutex_init(&mdev->graph_mutex);
> >>>  	ida_init(&mdev->entity_internal_idx);
> >>>  	atomic_set(&mdev->request_id, 0);
> >>> +	spin_lock_init(&mdev->fh_list_lock);
> >>>  
> >>>  	mdev->devnode.release = media_device_release;
> >>>  	media_devnode_init(&mdev->devnode);
> >>> @@ -824,6 +839,8 @@ EXPORT_SYMBOL_GPL(__media_device_register);
> >>>  
> >>>  void media_device_unregister(struct media_device *mdev)
> >>>  {
> >>> +	unsigned long flags;
> >>> +
> >>>  	if (mdev == NULL)
> >>>  		return;
> >>>  
> >>> @@ -834,6 +851,10 @@ void media_device_unregister(struct media_device *mdev)
> >>>  	}
> >>>  	mutex_unlock(&mdev->graph_mutex);
> >>>  
> >>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
> >>> +	list_del_init(&mdev->fh_list);
> >>> +	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
> >>> +
> >>>  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
> >>>  	dev_dbg(mdev->dev, "Media device unregistering\n");
> >>>  	media_devnode_unregister(&mdev->devnode);
> >>> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> >>> index 04d376015526..0b5c24828e24 100644
> >>> --- a/drivers/media/mc/mc-devnode.c
> >>> +++ b/drivers/media/mc/mc-devnode.c
> >>> @@ -171,7 +171,7 @@ static int media_open(struct inode *inode, struct file *filp)
> >>>  	get_device(&devnode->dev);
> >>>  	mutex_unlock(&media_devnode_lock);
> >>>  
> >>> -	ret = devnode->fops->open(filp);
> >>> +	ret = devnode->fops->open(devnode, filp);
> >>>  	if (ret) {
> >>>  		put_device(&devnode->dev);
> >>>  		return ret;
> >>> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> >>> index b0efdde4ffd8..840f7ae852d3 100644
> >>> --- a/include/media/media-devnode.h
> >>> +++ b/include/media/media-devnode.h
> >>> @@ -21,6 +21,8 @@
> >>>  #include <linux/device.h>
> >>>  #include <linux/cdev.h>
> >>>  
> >>> +struct media_devnode;
> >>> +
> >>>  /*
> >>>   * Flag to mark the media_devnode struct as registered. Drivers must not touch
> >>>   * this flag directly, it will be set and cleared by media_devnode_register and
> >>> @@ -49,7 +51,7 @@ struct media_file_operations {
> >>>  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
> >>>  	long (*ioctl) (struct file *, unsigned int, unsigned long);
> >>>  	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
> >>> -	int (*open) (struct file *);
> >>> +	int (*open) (struct media_devnode *, struct file *);
> >>>  	int (*release) (struct file *);
> >>>  };
> >>>  

-- 
Regards,

Laurent Pinchart

