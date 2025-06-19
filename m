Return-Path: <linux-media+bounces-35361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E69C4AE0B23
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C771886D4D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6BC28B7FE;
	Thu, 19 Jun 2025 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eU+ckuLc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315D21C9ED
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750349690; cv=none; b=mP7zk+OMfj9yZc0U51Vdi3U3wI45CCwOA2NHRKm6OZU5gC61RuidrBOdGzW7xi7JMX0HTrFg2HPex3nPkdk8RFyCblNLKMdqT3cEEUw+YqrvHCVCwStk2GfV0HyRdECFiKczc/w21e3FXmGmAuLVRPZz5ZU0KJ/9yXOzRI7i6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750349690; c=relaxed/simple;
	bh=CTrHpLaWm+KljLlXGG1WLy5gHdxadaeTIYTEdBWd+2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaRFVoxzziLkNmZJO5uJu1Dj1plDtxDNZ6X6EZQR48FX6woWNZWZlWrVBV620xr7t6FMhb/3m0O1thdjlg6jcIeRKKxABiiJhQtQVIFybftBqQ6En9iQtRKo3qVH9aM17CYnZirzZEZG15jQcunpU6nxVE5PqC5AuetL4ujjUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eU+ckuLc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750349689; x=1781885689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTrHpLaWm+KljLlXGG1WLy5gHdxadaeTIYTEdBWd+2U=;
  b=eU+ckuLckE6KBWRwSQ9k3BIkFf+1QHrc64TtlEhrJElGrEBYNf4xLu3l
   zxDqL8FJ0Rq6el9k9DH2KfjZBc8fxS4JwwhL7aVgK44WAOOc35eW3ahQM
   yjdBxlK/G9SDGGu/S86IZi3cfPt+L4kmMHlH+dFAzAeRS7wzrjqbSQzT7
   dQfB3s84kFZrTg2k1pTQw0Yjfe5wuOGJiBWiANglBDMSZA+R8eOA7ht+/
   U9yM/S0IV6s8GvWjNKXEBFiT9qPOlcrT08QJudSUVhi1rFcm4fdWgFWqf
   nh/qE8+WwOVVZx17pv9cRy8E6ueIk9FixVVLpZlifgHeQ3B7wVR+BKGjB
   w==;
X-CSE-ConnectionGUID: Sm5lredLSuC23/XRCWTJbw==
X-CSE-MsgGUID: ioAq30LlT06walXodlIZ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70044867"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70044867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 09:14:48 -0700
X-CSE-ConnectionGUID: Zx4VfJMIS62kFcvW2oXzoQ==
X-CSE-MsgGUID: 1asgIZzdTdW8xmEEHCSMrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="156184033"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.10])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 09:14:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7802E11FA65;
	Thu, 19 Jun 2025 19:14:43 +0300 (EEST)
Date: Thu, 19 Jun 2025 16:14:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619152033.GG32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > pointer value.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-dev.h | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > index 1b6222fab24e..069c2f14b473 100644
> > --- a/include/media/v4l2-dev.h
> > +++ b/include/media/v4l2-dev.h
> > @@ -313,10 +313,16 @@ struct video_device {
> >   * media_entity_to_video_device - Returns a &struct video_device from
> >   *	the &struct media_entity embedded on it.
> >   *
> > - * @__entity: pointer to &struct media_entity
> > - */
> > -#define media_entity_to_video_device(__entity) \
> > -	container_of(__entity, struct video_device, entity)
> > + * @__entity: pointer to &struct media_entity, may be NULL
> > + */
> > +#define media_entity_to_video_device(__entity)				\
> > +	({								\
> > +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> > +									\
> > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > +						struct video_device, entity) : \
> > +			NULL;						\
> > +	})
> 
> This makes the macro safer, it's a good idea. Wouldn't it be better
> implemented as a container_of_null() (name to be bikeshedded) though ? I
> don't think media_entity_to_video_device() is the only macro that could
> benefit from this. It could even be integrated in container_of(), but I
> fear that could introduce issues.

That sounds like a good idea. I'll first see how this would look like with
container_of_const()...

-- 
Regards,

Sakari Ailus

