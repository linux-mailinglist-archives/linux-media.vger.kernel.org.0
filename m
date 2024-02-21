Return-Path: <linux-media+bounces-5531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3009F85D36A
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 10:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7FC288BD0
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329403D0C8;
	Wed, 21 Feb 2024 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm5q0wYg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE8F3A8EF
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507457; cv=none; b=MNni+YxbCL+GT0s1Guqg8cJwPMA9+wvSM1oTaEh6/WwtW2e7G6Bq5otxXWMMbmdCubDQuHYeijWgUrI0DaXc+ZKVP9q555BYxeZpEH59gqK2f0FcZvnzimQPXMZAcWYX4RtgyyCqKKPykbdTrYirnzwR5lv5XE5iPP++IVAhEKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507457; c=relaxed/simple;
	bh=bxnHkKfqOJBh2FomH9u4396Uda9vld6rNSN/f/5V6vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISS6x8Ahex+E8YaqeXyjy+G1lJBX92FItf+OyvqYNoS3BvK8D8oAL+LZjf3D/T3bc6Hcz6LYckrKuc/FaT3YJjZ0I4ue7qCON1EnGDlg9V6J3l2FsdlbE7yPWu4L+Q21qVJZGeA9LCRMZdA/7FMLPlLi9C7qfMXeub+NwG/vFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm5q0wYg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708507455; x=1740043455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bxnHkKfqOJBh2FomH9u4396Uda9vld6rNSN/f/5V6vU=;
  b=jm5q0wYgYjjVGxJLMLpjpiERxUOgcRp68XsiEVeSWTgbJ+sI3L3N4g7E
   5LG+wly0Wk5hccPSbcq1uVuR7D9SvI3wZmgJvDMTvxFXu2WgMw6NT3cT0
   o8ktXO5TCbzYp5GZU724torindAuqynhsL29Jk4Lbtji2PWr3jB8uhIS3
   tpRkIVsFviR5XRKUbQ2AjruEEHi9Fi24AJ9Dg2selDjvZmfBfuVobP0yI
   JH6KsXvC333y67fZ2rj5N4m9HXKRaxAqsD0nRlarF6Kp6Kv1YpL8Icv13
   /BiBfausYFMMaatOSt+vXa9hEc/5nSe+JnpW94Wm+dff9s3CmKduOYGND
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5612295"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5612295"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 01:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936614225"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="936614225"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 01:24:13 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0DB8211F855;
	Wed, 21 Feb 2024 11:24:11 +0200 (EET)
Date: Wed, 21 Feb 2024 09:24:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 15/29] media: mc: Unassign minor only if it has been
 assigned
Message-ID: <ZdXBOwzA5DWa269n@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-16-sakari.ailus@linux.intel.com>
 <20240207105815.GM23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207105815.GM23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 12:58:15PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:36:59PM +0200, Sakari Ailus wrote:
> > Assign the media device minor to -1 if it has not been previously
> > assigned. There's no dependence to this yes but it will be required by
> > patch "media: mc: Implement best effort media device removal safety sans
> > refcount" soon.
> 
> After a quick look at that patch, I don't see the dependency I'm afraid.
> Could you please explain it better ?
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-devnode.c | 9 ++++++++-
> >  include/media/media-devnode.h | 2 +-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> > index 717408791a7c..5057c48f8870 100644
> > --- a/drivers/media/mc/mc-devnode.c
> > +++ b/drivers/media/mc/mc-devnode.c
> > @@ -59,7 +59,8 @@ static void media_devnode_release(struct device *cd)
> >  {
> >  	struct media_devnode *devnode = to_media_devnode(cd);
> >  
> > -	media_devnode_free_minor(devnode->minor);
> > +	if (devnode->minor != -1)
> > +		media_devnode_free_minor(devnode->minor);
> 
> Should the test be moved to media_devnode_free_minor() ?

The intention here is to free the minor number once and only once.

Moving the test to media_devnode_free_minor() is not an option as the
devnode may be released already by that time. See the patch the commit
message refers to.

> 
> >  
> >  	/* Release media_devnode and perform other cleanups as needed. */
> >  	if (devnode->release)
> > @@ -212,6 +213,7 @@ static const struct file_operations media_devnode_fops = {
> >  void media_devnode_init(struct media_devnode *devnode)
> >  {
> >  	device_initialize(&devnode->dev);
> > +	devnode->minor = -1;
> >  }
> >  
> >  int __must_check media_devnode_register(struct media_devnode *devnode,
> > @@ -220,6 +222,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
> >  	int minor;
> >  	int ret;
> >  
> > +	if (devnode->minor != -1)
> > +		return -EINVAL;
> > +
> >  	/* Part 1: Find a free minor number */
> >  	mutex_lock(&media_devnode_lock);
> >  	minor = find_first_zero_bit(media_devnode_nums, MEDIA_NUM_DEVICES);
> > @@ -261,6 +266,8 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
> >  cdev_add_error:
> >  	media_devnode_free_minor(devnode->minor);
> >  
> > +	devnode->minor = -1;
> > +
> >  	return ret;
> >  }
> >  
> > diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> > index 6d46c658be21..d050f54f252a 100644
> > --- a/include/media/media-devnode.h
> > +++ b/include/media/media-devnode.h
> > @@ -60,7 +60,7 @@ struct media_file_operations {
> >   * @dev:	pointer to struct &device containing the media controller device
> >   * @cdev:	struct cdev pointer character device
> >   * @parent:	parent device
> > - * @minor:	device node minor number
> > + * @minor:	device node minor number, -1 if unassigned
> >   * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
> >   * @release:	release callback called at the end of ``media_devnode_release()``
> >   *		routine at media-device.c.
> 

-- 
Regards,

Sakari Ailus

