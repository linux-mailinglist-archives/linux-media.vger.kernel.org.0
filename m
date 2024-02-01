Return-Path: <linux-media+bounces-4545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2608453C4
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 10:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA89328E388
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 09:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC4515D5A4;
	Thu,  1 Feb 2024 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k73UnDR6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79B15CD4A
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779330; cv=none; b=aLrX8WPLfZz/XJhDYEA2KU6JTsdveWxXJ1JIGntGK/dO3bFCm9Ia67jlGW4JTA5cHsNOR+po/V92+ZXKym5hBS5XqjoVN89AizZCKLgeNEOMMKrAe6sSm3S9wspVuR9o4HwaWvUC7GkMN0Q3AqozyGsvcMifjZeJpOCRQ3HbCL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779330; c=relaxed/simple;
	bh=vliiYuw2YCe794AvmlpJaXqRU0xBZuVtVEhoCGgVqPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Svz2esEB8vqos6WN5h/93N6bfdmgq5BjERlGT5QsNLFVYlGxvIBOxrR920qTXUmaif0Sa42Xkrooxc8M21ogh4171wdKfdjvLWYZ+3MkmLyO31qPSBW0BA1gHNL1Z8tfCRFlCL1z8XxIB7VlukyUGLy/wloDogfG9KV1SZavBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k73UnDR6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706779328; x=1738315328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vliiYuw2YCe794AvmlpJaXqRU0xBZuVtVEhoCGgVqPQ=;
  b=k73UnDR6K6ZumsBEZkp7sNXLYeA89L6rwMtKfxWxjus7L5tVbEv2XOo3
   dmyGmEMZkgVDX9edrTdTsTUbpx0W3a5nhMvS6G1PZkaw0nwjEYPFubsGj
   +zMwWfgg+mfK8wipEOhmcD5njNVNIks99I5LxaGfnHAIL+KN4QqmHpjGi
   HVWY4eULtkHAgp2NMA8DBUcKDCxOPCGeHENSF6hZYEb5nruOW3CCdaqSi
   Gx9m+5jIHyVFswlv/8R+iUc5FuxeUJkBeKir+v6nWcZzHqoJ23Hqzu5UG
   bdwnf6HjhF0a2Bwo4zU38xxl/zr9kF8L8qTGpkAw1jpXeeTNhfe+hbLs9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="36559"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="36559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 01:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="912071907"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="912071907"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 01:22:04 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8651E11FA94;
	Thu,  1 Feb 2024 11:22:01 +0200 (EET)
Date: Thu, 1 Feb 2024 09:22:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 17/19] media: mc: Check pad flag validity
Message-ID: <Zbtiucur0Y_gSEQc@kekkonen.localdomain>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
 <20231002105557.28972-18-sakari.ailus@linux.intel.com>
 <20240201091713.GA69174@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201091713.GA69174@google.com>

Hi Sergey,

Thanks for the review.

On Thu, Feb 01, 2024 at 06:17:13PM +0900, Sergey Senozhatsky wrote:
> On (23/10/02 13:55), Sakari Ailus wrote:
> > 
> > Check the validity of pad flags on entity init. Exactly one of the flags
> > must be set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 83468d4a440b..543a392f8635 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	struct media_device *mdev = entity->graph_obj.mdev;
> >  	struct media_pad *iter;
> >  	unsigned int i = 0;
> > +	int ret = 0;
> >  
> >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> >  		return -E2BIG;
> > @@ -210,15 +211,27 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	media_entity_for_each_pad(entity, iter) {
> >  		iter->entity = entity;
> >  		iter->index = i++;
> > +
> > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > +			ret = -EINVAL;
> 
> Can we please have some sort of WARN_ON() or pr_err() here?
> This is a pretty big change.

Doing proper input validation is hardly anything unusual, is it?

I'm fine with a WARN_ON() though, I'll add that to v8.

-- 
Regards,

Sakari Ailus

