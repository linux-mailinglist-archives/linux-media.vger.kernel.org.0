Return-Path: <linux-media+bounces-37103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C893BAFCA07
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699653B60B3
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5725A2D3237;
	Tue,  8 Jul 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnkpkKyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B928A1D5
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751976156; cv=none; b=NT9qwhzpTV6rcIgT6VNcdLYPOuszexcPksGQ3sFtU0KVfrDzVYCrQSRStGUlB0xZBgJCvUldsFcZDF6PsX61zql8nedZ4hfTisWtVaMV3qqaN8S1pK1MRwOn9U2HmoAUrD9zgiv2WZybQxMVt7fU5FAaH3pctecHzSxHmg0FWaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751976156; c=relaxed/simple;
	bh=QiRc2nqgmbMrNQLVu7fP9afNuy9KzhMQringsd+D0a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMmeP0Is84ocxGNJfVp2lHfRLDswc5IZgIhAPnvZg+Q9I53PwAhSgGMumprEBKYiDvoC8ZA771MqA5/Vp41BwJf9in1qJVAbNJtZucHohxn8th5Xg+hhxlKa+HyMyiRHVGj0J6tyNgX4gaGKmihXKU079M5vIK62jQYX9ulZjsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnkpkKyj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751976155; x=1783512155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QiRc2nqgmbMrNQLVu7fP9afNuy9KzhMQringsd+D0a4=;
  b=XnkpkKyjTUVUIffndzH6l6lZQRoIeYIoZRqXyaq8jERZX71DHLHA9XII
   PloHAzKorK8CgTShtm6CDGHDvvc0jEqahHmWc5DEEP0uvXOLklmLwJDKd
   P1tdpopQddXoGyFoMsC//cus6XYMMDllZVaTRLv9FncPXWVhMOQG3GKV9
   ggZ1DTF2kDJ9zS9j9DpC/+2xJrVjIUBKfYJggTsVzn502pO7e0VzxvkWb
   HkrMRXLE1pBJKerBEn2LLvh80+SFZqGSxp45bfCtBGyJ/n6ZfPxPfNePF
   vDPWdFfQrDrfiW9cdxNBmFDra9pqpOkGbGIoK+4bfU02PIMrtzgBa9E3K
   g==;
X-CSE-ConnectionGUID: VFhgbrVfTe6/rjut7vxPqA==
X-CSE-MsgGUID: DrsKlTfTSIOQ4xw57j2QKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58012097"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="58012097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 05:02:34 -0700
X-CSE-ConnectionGUID: 1Z3BaiC6Qwiv7arLMxVL0w==
X-CSE-MsgGUID: iNCV1JSGTlycMPKwocJZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="156068607"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.230])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 05:02:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD6FA11F980;
	Tue,  8 Jul 2025 15:02:29 +0300 (EEST)
Date: Tue, 8 Jul 2025 12:02:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <aG0I1eoY0gwgE85O@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
 <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
 <20250708115616.GE1821@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708115616.GE1821@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jul 08, 2025 at 02:56:16PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 19, 2025 at 04:14:43PM +0000, Sakari Ailus wrote:
> > On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > > > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > > > pointer value.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  include/media/v4l2-dev.h | 14 ++++++++++----
> > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > index 1b6222fab24e..069c2f14b473 100644
> > > > --- a/include/media/v4l2-dev.h
> > > > +++ b/include/media/v4l2-dev.h
> > > > @@ -313,10 +313,16 @@ struct video_device {
> > > >   * media_entity_to_video_device - Returns a &struct video_device from
> > > >   *	the &struct media_entity embedded on it.
> > > >   *
> > > > - * @__entity: pointer to &struct media_entity
> > > > - */
> > > > -#define media_entity_to_video_device(__entity) \
> > > > -	container_of(__entity, struct video_device, entity)
> > > > + * @__entity: pointer to &struct media_entity, may be NULL
> > > > + */
> > > > +#define media_entity_to_video_device(__entity)				\
> > > > +	({								\
> > > > +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> > > > +									\
> > > > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > > > +						struct video_device, entity) : \
> > > > +			NULL;						\
> > > > +	})
> > > 
> > > This makes the macro safer, it's a good idea. Wouldn't it be better
> > > implemented as a container_of_null() (name to be bikeshedded) though ? I
> > > don't think media_entity_to_video_device() is the only macro that could
> > > benefit from this. It could even be integrated in container_of(), but I
> > > fear that could introduce issues.
> > 
> > That sounds like a good idea. I'll first see how this would look like with
> > container_of_const()...
> 
> Thinking some more about this, I think we can move forward without
> waiting for container_of_null().
> 
> Should we however add a check to ensure the entity is a video device (by
> checking that the function is MEDIA_ENT_F_IO_V4L), and return NULL if
> it's not ? It would make the macro even safer to use. There would be a
> small additional runtime cost for call sites that guarantee the entity
> is a video device.
> 
> I checked the current users of the macro, and the vast majority of them
> are in the .link_validate() operation, where they know that the entity
> is a video device. There are just a handful of locations where a check
> precedes the media_entity_to_video_device() call. So maybe it's not
> worth it ?
> 
> I also found no caller that checks for entity != NULL before calling the
> macro. Is this change actually needed ?

We have a similar check in media_entity_to_v4l2_subdev() macro. In the
patches for streaming control there's a need for an explicit check without
this patch. That's of course fine as well if we decide so.

-- 
Regards,

Sakari Ailus

