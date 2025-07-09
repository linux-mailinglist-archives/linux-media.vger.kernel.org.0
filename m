Return-Path: <linux-media+bounces-37226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33440AFF295
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 22:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D2F03B441D
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 20:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F346D244186;
	Wed,  9 Jul 2025 20:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6qUGugB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E28242D8D
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752091394; cv=none; b=Zn/rFDpz4iqOgukeG/WoKlAh8znekKFdxeYtDuaTVBAt7ALiMypL8AmAV/AI2C98zvUH2HicIC4dM+P28bP64axiXyXQFrGIIo8Qr+mOb0xermC7YT+E6WrPCNRGyZWeMozoEdLnFzuN6YoeZyEt+380ZBh71KN9A9PLcvCryXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752091394; c=relaxed/simple;
	bh=0uX6mUDwBSOjK3pT9wZD1Run9eH8SgbqPe4mdjkC14g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuAwdxETyDLviFrGY4H4RnwJ2B4vbapCmdHy2Pg0SD+QH+MbIA2inhjeR5u/belvj7+oT63ebzIzOljBhJs4/99dkJzV0ljCi+NywjY8WuiaxECpMAHBiSNsHyBdYB5G7nYFwKr287EIesEOk7qVtClVi9d3qPnQUmGoYjDNUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6qUGugB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752091393; x=1783627393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0uX6mUDwBSOjK3pT9wZD1Run9eH8SgbqPe4mdjkC14g=;
  b=b6qUGugBBSo3wgbz8K2x+6IiDp0xG9AI+5/C9nramaBN79BiIo70VbLK
   Rgv9/Z7UP7TgMyOI7VhH7jE73MjY4Ep3oXV9lgC6GpQtvkZFnw//iLynk
   VwvxcbDtc4t+k4tpf9BeJOJ/RhasTi5swPvOkxMoGnMxAOwLu4n+mKfyT
   AXKXOi3Wr9lc66CWPvGoyYktjuXvNQyqPzkmbIuJdDovZ2fuTNGxsEeLI
   jWs9H56okfBgsPb2KvaVDnSrOrA0309GKqMomx3RVnlce+2Negp82PuJ3
   yuZxaNfMKtupDqy71dkhPL5meBIeb5hcGZS68xGXPWupvBg5rsrDYYZgY
   g==;
X-CSE-ConnectionGUID: rKTyJb5QTkOQKwnWsvUrBw==
X-CSE-MsgGUID: ncaW8M5DSkS3VbfxAwNcKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="56971539"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="56971539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:03:12 -0700
X-CSE-ConnectionGUID: kWZtRYpMR1Cs/q5eXdTiUA==
X-CSE-MsgGUID: 8uc9G7C9SKa7ixROQuNPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161527120"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:03:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1BBDC11F8F6;
	Wed,  9 Jul 2025 23:03:07 +0300 (EEST)
Date: Wed, 9 Jul 2025 20:03:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <aG7K-xBVC8cmg3z6@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
 <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
 <20250708115616.GE1821@pendragon.ideasonboard.com>
 <aG0I1eoY0gwgE85O@kekkonen.localdomain>
 <20250708161747.GA23181@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708161747.GA23181@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jul 08, 2025 at 07:17:47PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 08, 2025 at 12:02:29PM +0000, Sakari Ailus wrote:
> > On Tue, Jul 08, 2025 at 02:56:16PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jun 19, 2025 at 04:14:43PM +0000, Sakari Ailus wrote:
> > > > On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > > > > > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > > > > > pointer value.
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > >  include/media/v4l2-dev.h | 14 ++++++++++----
> > > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > > > index 1b6222fab24e..069c2f14b473 100644
> > > > > > --- a/include/media/v4l2-dev.h
> > > > > > +++ b/include/media/v4l2-dev.h
> > > > > > @@ -313,10 +313,16 @@ struct video_device {
> > > > > >   * media_entity_to_video_device - Returns a &struct video_device from
> > > > > >   *	the &struct media_entity embedded on it.
> > > > > >   *
> > > > > > - * @__entity: pointer to &struct media_entity
> > > > > > - */
> > > > > > -#define media_entity_to_video_device(__entity) \
> > > > > > -	container_of(__entity, struct video_device, entity)
> > > > > > + * @__entity: pointer to &struct media_entity, may be NULL
> > > > > > + */
> > > > > > +#define media_entity_to_video_device(__entity)				\
> > > > > > +	({								\
> > > > > > +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> 
> This should be __me_vdev_ent to align the naming with
> media_entity_to_v4l2_subdev().
> 
> > > > > > +									\
> > > > > > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > > > > > +						struct video_device, entity) : \
> 
> And here you should write
> 
> 	__me_to_vdev_ent ?						   \
> 		container_of(__me_vdev_ent, struct video_device, entity) : \
> 		NULL;							   \

I'm fine wrap after '?' as well, but another wrap is needed due to
indentation in any case.

> 
> > > > > > +			NULL;						\
> > > > > > +	})
> > > > > 
> > > > > This makes the macro safer, it's a good idea. Wouldn't it be better
> > > > > implemented as a container_of_null() (name to be bikeshedded) though ? I
> > > > > don't think media_entity_to_video_device() is the only macro that could
> > > > > benefit from this. It could even be integrated in container_of(), but I
> > > > > fear that could introduce issues.
> > > > 
> > > > That sounds like a good idea. I'll first see how this would look like with
> > > > container_of_const()...
> > > 
> > > Thinking some more about this, I think we can move forward without
> > > waiting for container_of_null().
> > > 
> > > Should we however add a check to ensure the entity is a video device (by
> > > checking that the function is MEDIA_ENT_F_IO_V4L), and return NULL if
> > > it's not ? It would make the macro even safer to use. There would be a
> > > small additional runtime cost for call sites that guarantee the entity
> > > is a video device.
> > > 
> > > I checked the current users of the macro, and the vast majority of them
> > > are in the .link_validate() operation, where they know that the entity
> > > is a video device. There are just a handful of locations where a check
> > > precedes the media_entity_to_video_device() call. So maybe it's not
> > > worth it ?
> > > 
> > > I also found no caller that checks for entity != NULL before calling the
> > > macro. Is this change actually needed ?
> > 
> > We have a similar check in media_entity_to_v4l2_subdev() macro.
> 
> That's a good point. Different behaviours for the two macros would be
> confusing I suppose, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

> 
> I'm tempted to convert the macro to an inline function, but that would
> make it more difficult to switch to container_of_const().

Let's not do that. Eventually container_of() should become what
container_of_const() is at the moment.

But once this is in, I can introduce container_of_null() which we could
later use. I wonder how it will look like.

-- 
Regards,

Sakari Ailus

