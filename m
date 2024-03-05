Return-Path: <linux-media+bounces-6414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5608718BF
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 09:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658631F22FF3
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3530C4F5FA;
	Tue,  5 Mar 2024 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1qBMBkR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242538DD1
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629169; cv=none; b=QyBbXfHKrjsXyOarmxpv9aPNzEPIxH0zMoRWeAXuGWVIktsORKP45Wk6mVccMmGG/lt+yEtPo7u/q2BnsGUdG4P2PZUsNhj46tbmDIlAisPjq5mwE9n8WvE8+M4ZOMYFhpPSkLqCAV+JUUk6GAUktUigIh4EdDR/Kjfok4dC4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629169; c=relaxed/simple;
	bh=u8/MuSG1BJQ+jzH8h+dAenC0hMUIqvPpk/BZm8DHFlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwtDCeTEnH7+jh1J1FY7dpguhD6bis4uhBhN5QissJXPdb9oMn4k0XUtKQD4i6N9HYjg1ZPdtWHnE9OQezu1h7FguP8vZp+P62YNgVHWrp6QCKan9hHSKqKJqV4dnFOF3oeBSd1DLk21wm6FIfIhUa8kJukzvTs2eVv10k00jHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1qBMBkR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709629168; x=1741165168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u8/MuSG1BJQ+jzH8h+dAenC0hMUIqvPpk/BZm8DHFlo=;
  b=E1qBMBkRLCJyFhdD75COdZso94sSqltoAnXMqNXoV8y/RvtXclerVztU
   VSKisH8S8471t7Vlr+kbm5APcyvLhc/21LD5YnqK9BUPZPllLxIu1rshD
   4AubjoVv8p3tgdxVIIHnBzxeTAN5Mt+mppAKrTiFLuzbAl+14vKhxTyku
   X9/BWjAaoES1lMCDlKMiUYXc7f1Ney/mS30r+qZJAJm1B8MRPveLx9udf
   B2Tqgxgoovtz9hvJiMSiI1l2xsjTF5r2tgSjT7+pwMXHdY+peZXC7Kvhs
   fnxNfGZsnlJWSNGC5Jz1HP9GHIl7eojvICsxK427Qb4b0PYFmcQt2O/q4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15596755"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="15596755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9478102"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:59:26 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7C2F511F871;
	Tue,  5 Mar 2024 10:59:23 +0200 (EET)
Date: Tue, 5 Mar 2024 08:59:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 11/29] media: mc: Split initialising and adding media
 devnode
Message-ID: <Zebe65TscNPsJi6S@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-12-sakari.ailus@linux.intel.com>
 <20240207104613.GH23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207104613.GH23702@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Wed, Feb 07, 2024 at 12:46:13PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:36:55PM +0200, Sakari Ailus wrote:
> > As registering a device node of an entity belonging to a media device
> 
> Did you mean s/As registering/Registering/ ?

That works better in the current context. I'll use that.

> 
> > will require a reference to the struct device. Taking that reference is
> > only possible once the device has been initialised, which took place only
> 
> s/took/takes/
> 
> > when it was registered. Split this in two, and initialise the device when
> 
> s/was/is/

This describes the behaviour before the patch. I think it makes sense to
use imperfect here.

> 
> > the media device is allocated.
> > 
> > Don't distribute the effects of these changes yet. Add media_device_get()
> > and media_device_put() first.
> 
> Don't propagate the effects of these changes to drivers yet, we want to
> expose media_device refcounting with media_device_get() and
> media_device_put() functions first.
> 
> 
> I'm not sure that's exactly what you meant though.

Yes, that's roughly what I meant, I can use the above text.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> > ---
> >  drivers/media/mc/mc-device.c  | 18 +++++++++++++-----
> >  drivers/media/mc/mc-devnode.c | 17 ++++++++++-------
> >  include/media/media-devnode.h | 19 ++++++++++++++-----
> >  3 files changed, 37 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index c0ea08a8fc31..ebf037cd5f4a 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -717,19 +717,26 @@ int __must_check __media_device_register(struct media_device *mdev,
> >  	/* Set version 0 to indicate user-space that the graph is static */
> >  	mdev->topology_version = 0;
> >  
> > +	media_devnode_init(&mdev->devnode);
> > +
> >  	ret = media_devnode_register(&mdev->devnode, owner);
> >  	if (ret < 0)
> > -		return ret;
> > +		goto out_put;
> >  
> >  	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
> > -	if (ret < 0) {
> > -		media_devnode_unregister(&mdev->devnode);
> > -		return ret;
> > -	}
> > +	if (ret < 0)
> > +		goto out_unregister;
> >  
> >  	dev_dbg(mdev->dev, "Media device registered\n");
> >  
> >  	return 0;
> > +
> > +out_unregister:
> 
> I would name the labels err_unregister and err_put.

Sounds good.

> 
> > +	media_devnode_unregister(&mdev->devnode);
> > +out_put:
> > +	put_device(&mdev->devnode.dev);
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(__media_device_register);
> >  
> > @@ -803,6 +810,7 @@ void media_device_unregister(struct media_device *mdev)
> >  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
> >  	dev_dbg(mdev->dev, "Media device unregistering\n");
> >  	media_devnode_unregister(&mdev->devnode);
> > +	put_device(&mdev->devnode.dev);
> >  }
> >  EXPORT_SYMBOL_GPL(media_device_unregister);
> >  
> > diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> > index 8bc7450ac144..7b17419050fb 100644
> > --- a/drivers/media/mc/mc-devnode.c
> > +++ b/drivers/media/mc/mc-devnode.c
> > @@ -204,6 +204,11 @@ static const struct file_operations media_devnode_fops = {
> >  	.llseek = no_llseek,
> >  };
> >  
> > +void media_devnode_init(struct media_devnode *devnode)
> > +{
> > +	device_initialize(&devnode->dev);
> > +}
> > +
> >  int __must_check media_devnode_register(struct media_devnode *devnode,
> >  					struct module *owner)
> >  {
> > @@ -235,7 +240,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
> >  	if (devnode->parent)
> >  		devnode->dev.parent = devnode->parent;
> >  	dev_set_name(&devnode->dev, "media%d", devnode->minor);
> > -	device_initialize(&devnode->dev);
> >  
> >  	/* Part 3: Add the media and character devices */
> >  	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
> > @@ -267,14 +271,13 @@ void media_devnode_unregister(struct media_devnode *devnode)
> >  	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
> >  	mutex_unlock(&media_devnode_lock);
> >  
> > -	cdev_del(&devnode->cdev);
> > -	device_unregister(&devnode->dev);
> > +	cdev_device_del(&devnode->cdev, &devnode->dev);
> >  }
> >  
> >  /*
> >   *	Initialise media for linux
> >   */
> > -static int __init media_devnode_init(void)
> > +static int __init media_devnode_module_init(void)
> >  {
> >  	int ret;
> >  
> > @@ -296,14 +299,14 @@ static int __init media_devnode_init(void)
> >  	return 0;
> >  }
> >  
> > -static void __exit media_devnode_exit(void)
> > +static void __exit media_devnode_module_exit(void)
> >  {
> >  	bus_unregister(&media_bus_type);
> >  	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
> >  }
> >  
> > -subsys_initcall(media_devnode_init);
> > -module_exit(media_devnode_exit)
> > +subsys_initcall(media_devnode_module_init);
> > +module_exit(media_devnode_module_exit)
> >  
> >  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> >  MODULE_DESCRIPTION("Device node registration for media drivers");
> > diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> > index 1117d1dfd6bf..6d46c658be21 100644
> > --- a/include/media/media-devnode.h
> > +++ b/include/media/media-devnode.h
> > @@ -90,6 +90,17 @@ struct media_devnode {
> >  /* dev to media_devnode */
> >  #define to_media_devnode(cd) container_of(cd, struct media_devnode, dev)
> >  
> > +/**
> > + * media_devnode_init - initialise a media devnode
> > + *
> > + * @devnode: struct media_devnode we want to initialise
> > + *
> > + * Initialise a media devnode. Note that after initialising the media
> > + * devnode is refcounted. Releasing references to it may be done using
> > + * put_device().
> > + */
> > +void media_devnode_init(struct media_devnode *devnode);
> > +
> >  /**
> >   * media_devnode_register - register a media device node
> >   *
> > @@ -100,11 +111,9 @@ struct media_devnode {
> >   * with the kernel. An error is returned if no free minor number can be found,
> >   * or if the registration of the device node fails.
> >   *
> > - * Zero is returned on success.
> > - *
> > - * Note that if the media_devnode_register call fails, the release() callback of
> > - * the media_devnode structure is *not* called, so the caller is responsible for
> > - * freeing any data.
> > + * Zero is returned on success. Note that in case
> > + * media_devnode_register() fails, the caller is responsible for
> > + * releasing the reference to the device using put_device().
> >   */
> >  int __must_check media_devnode_register(struct media_devnode *devnode,
> >  					struct module *owner);
> 

-- 
Regards,

Sakari Ailus

