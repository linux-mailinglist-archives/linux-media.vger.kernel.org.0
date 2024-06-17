Return-Path: <linux-media+bounces-13473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFF90B86B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 19:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBA69B24F61
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A282F18EFEF;
	Mon, 17 Jun 2024 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evPZhUlz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711463E479
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718646372; cv=none; b=C4YngiFA83oIP2o/FKNNgDYS8z6tGcfiOUXWu4ZPnOI1D7kZwSEjxNoggg+2fAF3hFSI6tKI3T3VVrTv9+omON5/WKlFKG28QGoZmeUQaEzBdEvCJYnOySFOu/ggO80ltfuL777oxUlWkoWeRytDHiEKUKa2mW6q6lJfBy6Teqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718646372; c=relaxed/simple;
	bh=K1wGk1fb3IYQmA+gmbfCan1xSFULuYgnpkQi8wDSr44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mksv62r/IReXt6n3xfqq6/vDLWbNQQW1HfepV5uw+ZS/2ZnJDymkOM5IjIkxd5c7KJBt367w97aSTtEVB2QRBUsnMYJPx445K38lIUvJVeUub/AU87ACbmyYxHbEtro6s3sPzDaif3eBY9ZMS2voddGEXBlXzGGaPymwlVbafOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evPZhUlz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718646371; x=1750182371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K1wGk1fb3IYQmA+gmbfCan1xSFULuYgnpkQi8wDSr44=;
  b=evPZhUlzEnYRvi9fkhV2Cm4emtGj5HGe0cKlsJ6JJFPjs3+Be85hVgwj
   7uFewpebZBEB8daZ8xwF+cPhLy3VGKN59CBRoKHUk4FSX2iVZUMJzCGOA
   bcrLt1BuzPBIhtx+lGjGYPMPRv6gAUxY20fScq+WGRBb9xwKzSNGOphk2
   /PpD4EQQDpUnOozdqQ/r/144Nbbq+6OwrGCda0F2dTv/N3epRDSXyRPvO
   ouBf3dHwdDQkMFImHIbZWIlEJeNlR8SflRoHdN0LobZ3t6RrMNNQ5QbQj
   7J9hoi1hcZJLHOAsT+9yyW0i/k8AMCUlTzQnd1riTZu1csFRsKvPiS5jZ
   A==;
X-CSE-ConnectionGUID: OV89N/Z/TFGaunp86YhCJg==
X-CSE-MsgGUID: 0Vk+D7QyRGWtziPjyA433g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18402878"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="18402878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:46:10 -0700
X-CSE-ConnectionGUID: ESNa25s4TZSqhY47XksxuQ==
X-CSE-MsgGUID: aPqsa3x0SBCdEFSSt2aq0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41139029"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:46:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 58EB011F9DB;
	Mon, 17 Jun 2024 20:46:06 +0300 (EEST)
Date: Mon, 17 Jun 2024 17:46:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 22/26] media: mc: Maintain a list of open file handles
 in a media device
Message-ID: <ZnB2Xu5AD-qUDj20@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-23-sakari.ailus@linux.intel.com>
 <20c3243e-9bd4-457a-9b1d-d6c65cf31a58@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c3243e-9bd4-457a-9b1d-d6c65cf31a58@xs4all.nl>

Hi Hans,

On Mon, Jun 17, 2024 at 11:57:20AM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > The list of file handles is needed to deliver media events as well as for
> > other purposes in the future.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-device.c  | 19 ++++++++++++++++++-
> >  drivers/media/mc/mc-devnode.c |  2 +-
> >  include/media/media-devnode.h |  4 +++-
> >  3 files changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index a9505ab4412d..46d1b0c9d8be 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -45,8 +45,9 @@ static inline void __user *media_get_uptr(__u64 arg)
> >  	return (void __user *)(uintptr_t)arg;
> >  }
> >  
> > -static int media_device_open(struct file *filp)
> > +static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >  {
> > +	struct media_device *mdev = to_media_device(devnode);
> >  	struct media_device_fh *fh;
> >  
> >  	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> > @@ -55,13 +56,23 @@ static int media_device_open(struct file *filp)
> >  
> >  	filp->private_data = &fh->fh;
> >  
> > +	spin_lock_irq(&mdev->fh_list_lock);
> > +	list_add(&fh->mdev_list, &mdev->fh_list);
> > +	spin_unlock_irq(&mdev->fh_list_lock);
> > +
> >  	return 0;
> >  }
> >  
> >  static int media_device_close(struct file *filp)
> >  {
> > +	struct media_devnode *devnode = media_devnode_data(filp);
> > +	struct media_device *mdev = to_media_device(devnode);
> >  	struct media_device_fh *fh = media_device_fh(filp);
> >  
> > +	spin_lock_irq(&mdev->fh_list_lock);
> > +	list_del(&fh->mdev_list);
> > +	spin_unlock_irq(&mdev->fh_list_lock);
> > +
> >  	kfree(fh);
> >  
> >  	return 0;
> > @@ -769,11 +780,13 @@ void media_device_init(struct media_device *mdev)
> >  	INIT_LIST_HEAD(&mdev->pads);
> >  	INIT_LIST_HEAD(&mdev->links);
> >  	INIT_LIST_HEAD(&mdev->entity_notify);
> > +	INIT_LIST_HEAD(&mdev->fh_list);
> >  
> >  	mutex_init(&mdev->req_queue_mutex);
> >  	mutex_init(&mdev->graph_mutex);
> >  	ida_init(&mdev->entity_internal_idx);
> >  	atomic_set(&mdev->request_id, 0);
> > +	spin_lock_init(&mdev->fh_list_lock);
> >  
> >  	mdev->devnode.release = media_device_release;
> >  	media_devnode_init(&mdev->devnode);
> > @@ -830,6 +843,10 @@ void media_device_unregister(struct media_device *mdev)
> >  	if (!media_devnode_is_registered(&mdev->devnode))
> >  		return;
> >  
> > +	spin_lock_irq(&mdev->fh_list_lock);
> > +	list_del_init(&mdev->fh_list);
> > +	spin_unlock_irq(&mdev->fh_list_lock);
> 
> Huh? This doesn't make sense to me. Unregistering the media device
> makes no difference to the list of open filehandles.

Right, I agree with that.

Presumably the list will be empty at release time. I think I'll drop this
and add a sanity check for the list.

> 
> > +
> >  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
> >  	dev_dbg(mdev->dev, "Media device unregistering\n");
> >  	media_devnode_unregister(&mdev->devnode);
> > diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> > index 26491daaba96..617156963911 100644
> > --- a/drivers/media/mc/mc-devnode.c
> > +++ b/drivers/media/mc/mc-devnode.c
> > @@ -154,7 +154,7 @@ static int media_open(struct inode *inode, struct file *filp)
> >  	get_device(&devnode->dev);
> >  	mutex_unlock(&media_devnode_lock);
> >  
> > -	ret = devnode->fops->open(filp);
> > +	ret = devnode->fops->open(devnode, filp);
> >  	if (ret) {
> >  		put_device(&devnode->dev);
> >  		return ret;
> > diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> > index e4e8552598eb..898fa67ca090 100644
> > --- a/include/media/media-devnode.h
> > +++ b/include/media/media-devnode.h
> > @@ -21,6 +21,8 @@
> >  #include <linux/device.h>
> >  #include <linux/cdev.h>
> >  
> > +struct media_devnode;
> > +
> >  /*
> >   * Flag to mark the media_devnode struct as registered. Drivers must not touch
> >   * this flag directly, it will be set and cleared by media_devnode_register and
> > @@ -49,7 +51,7 @@ struct media_file_operations {
> >  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
> >  	long (*ioctl) (struct file *, unsigned int, unsigned long);
> >  	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
> > -	int (*open) (struct file *);
> > +	int (*open) (struct media_devnode *, struct file *);
> >  	int (*release) (struct file *);
> >  };
> >  
> 

-- 
Kind regards,

Sakari Ailus

