Return-Path: <linux-media+bounces-12525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8875C8FB0A4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 13:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B51811C21002
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 11:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95999145326;
	Tue,  4 Jun 2024 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW6ux2uq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B638B
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498796; cv=none; b=kF4zIwpjrNqih6Gh6Kh5Knc2x0pxg5K10jMru7X0a947b/PPKFo3fykDcJ8b1hrxcj4xatBEMjdi7XF9LmHLzmeaEP3scu6nVonSp5aF0BOEkT5vU1J9qobiAlH2LkRKJltzBFotcXL/0atsGF/6QnOkDKcL74yVTk+jmrkGND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498796; c=relaxed/simple;
	bh=dqc0VFm4RhmwNAvJF6A6ETXxlW3vn9Ybh7F40rubBN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amf9zWmmg7igTaRuKnMmQllXqhX5fjSECkWUFCUdddldi7xI250axLwlpmno0g6b305QMb7VXya6SC9dsbfTrO3VQI72uHJeQIj9pApgrByq7WQLizDsXe6j5ieH0jUSbZNW15vT5RYrv2NgaVYgA3I5DCnmGLAue8ooKIdX570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW6ux2uq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717498794; x=1749034794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqc0VFm4RhmwNAvJF6A6ETXxlW3vn9Ybh7F40rubBN8=;
  b=DW6ux2uqGCxLaegrEwgCfjcvVIVSPUHx2eQEI2aIqcdZCpM9mU602tRt
   1Evv7bbaTEO7GGHqfTMFRp8PE6wb267yI593AJL3ZDyQV3rUgMezORFVU
   oIwD07WkPqIISqwJvGS/WfPz9rjHalJ5OSXLBAuZBTxBilUTxYOYjVTy7
   yZeNU89WbEa+zVH77Po53ZgKo7/GyNAcfx7OfXJZJXeZoK2F+W8tIY0Rf
   ITWBFCCA+Nk8//VufLPVywtVik3gQhya47QWq6S5Q6LdHY34uVrWe4Hii
   MpLMCipuriqK+XN1xIhkepE4Q75eoAwqo10qJ/rq//cJlXstVo460Wkib
   Q==;
X-CSE-ConnectionGUID: N2Q9WUBGRmOvUuk4z7B4tw==
X-CSE-MsgGUID: h98bbKHtRLeuxAOBviGr6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25434318"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="25434318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 03:59:53 -0700
X-CSE-ConnectionGUID: BszXjN4SR7qhSPf2ZWEfMA==
X-CSE-MsgGUID: wdYfWmntTnqyzxi+9d/AKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37127967"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 03:59:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9A68911FA4A;
	Tue,  4 Jun 2024 13:59:49 +0300 (EEST)
Date: Tue, 4 Jun 2024 10:59:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 18/29] media: mc: Postpone graph object removal until
 free
Message-ID: <Zl7zpctzVHO1BGL5@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-19-sakari.ailus@linux.intel.com>
 <20240207141820.GP23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207141820.GP23702@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the comments. Apologies for missing this earlier.

On Wed, Feb 07, 2024 at 04:18:20PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:37:02PM +0200, Sakari Ailus wrote:
> > The media device itself will be unregistered based on it being unbound and
> > driver's remove callback being called. The graph objects themselves may
> > still be in use; rely on the media device release callback to release
> > them.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> > ---
> >  drivers/media/mc/mc-device.c | 53 +++++++++++++++++-------------------
> >  1 file changed, 25 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index bbc233e726d2..10426c2796b6 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -702,8 +702,33 @@ EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
> >  
> >  static void __media_device_release(struct media_device *mdev)
> >  {
> > +	struct media_entity *entity;
> > +	struct media_entity *next;
> > +	struct media_interface *intf, *tmp_intf;
> > +	struct media_entity_notify *notify, *nextp;
> > +
> >  	dev_dbg(mdev->dev, "Media device released\n");
> 
> No need for locking ? I suppose we can't reach this point if someone
> else has a reference to the media device. A comment to mention it would
> be nice.

There's indeed no point in locking a mutex in memory that's about to get
released. In fact, the mutex is about to get destroyed first. Other release
callback don't have comments, although the purpose of
__media_device_release wasn't that of an ordinary release callback. Still,
bygones are bygones.

> 
> >  
> > +	/* Remove all entities from the media device */
> > +	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
> > +		__media_device_unregister_entity(entity);
> 
> Should the __media_device_unregister_entity() function be renamed to
> __media_device_remove_entity() (in a separate patch) ? Same for
> __media_device_unregister_entity_notify().

"unregister" pairs with "register" so at least for now I'd prefer to keep
the naming as-is. I'm fine discussing the naming after this set though.

> 
> > +
> > +	/* Remove all entity_notify callbacks from the media device */
> > +	list_for_each_entry_safe(notify, nextp, &mdev->entity_notify, list)
> > +		__media_device_unregister_entity_notify(mdev, notify);
> > +
> > +	/* Remove all interfaces from the media device */
> > +	list_for_each_entry_safe(intf, tmp_intf, &mdev->interfaces,
> > +				 graph_obj.list) {
> > +		/*
> > +		 * Unlink the interface, but don't free it here; the
> > +		 * module which created it is responsible for freeing
> > +		 * it
> > +		 */
> > +		__media_remove_intf_links(intf);
> > +		media_gobj_destroy(&intf->graph_obj);
> > +	}
> > +
> >  	ida_destroy(&mdev->entity_internal_idx);
> >  	mdev->entity_internal_idx_max = 0;
> >  	media_graph_walk_cleanup(&mdev->pm_count_walk);
> > @@ -787,42 +812,14 @@ EXPORT_SYMBOL_GPL(__media_device_register);
> >  
> >  void media_device_unregister(struct media_device *mdev)
> >  {
> > -	struct media_entity *entity;
> > -	struct media_entity *next;
> > -	struct media_interface *intf, *tmp_intf;
> > -	struct media_entity_notify *notify, *nextp;
> > -
> >  	if (mdev == NULL)
> >  		return;
> >  
> >  	mutex_lock(&mdev->graph_mutex);
> > -
> > -	/* Check if mdev was ever registered at all */
> >  	if (!media_devnode_is_registered(&mdev->devnode)) {
> >  		mutex_unlock(&mdev->graph_mutex);
> 
> Unless I'm mistaken we don't need to lock the graph mutext to test this,
> so I think you can drop locking completely here.

There may be IOCTL calls in progress while unregister takes place. The test
seems to be fine outside the lock but the section below still needs the
lock.

I'll change this for v4.

> 
> >  		return;
> >  	}
> > -
> > -	/* Remove all entities from the media device */
> > -	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
> > -		__media_device_unregister_entity(entity);
> > -
> > -	/* Remove all entity_notify callbacks from the media device */
> > -	list_for_each_entry_safe(notify, nextp, &mdev->entity_notify, list)
> > -		__media_device_unregister_entity_notify(mdev, notify);
> > -
> > -	/* Remove all interfaces from the media device */
> > -	list_for_each_entry_safe(intf, tmp_intf, &mdev->interfaces,
> > -				 graph_obj.list) {
> > -		/*
> > -		 * Unlink the interface, but don't free it here; the
> > -		 * module which created it is responsible for freeing
> > -		 * it
> > -		 */
> > -		__media_remove_intf_links(intf);
> > -		media_gobj_destroy(&intf->graph_obj);
> > -	}
> > -
> >  	mutex_unlock(&mdev->graph_mutex);
> >  
> >  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
> 

-- 
Kind regards,

Sakari Ailus

