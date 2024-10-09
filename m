Return-Path: <linux-media+bounces-19300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED3995F59
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 08:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 000CCB24371
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 06:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2D216BE20;
	Wed,  9 Oct 2024 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQqXzOJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FC4A3F;
	Wed,  9 Oct 2024 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728453713; cv=none; b=rYQeR7mSd16mn6sfXqilLNzLXeME407kIyOHp0+XS28A5ccNvabPVWNAY6tjtzGwDzwBlvbKGSBe9yuriCwc2ajiFWPsil3biCIDLHlwsAlEHp8jztnpnud5wjIkkSfu5mftP5AzE2gqmHxSHBoEAzWuaEWLhqbhpA8Wwpbt+FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728453713; c=relaxed/simple;
	bh=mYR/iz/uQadaFyZ0VIZKdCNT+eZ0L87m2kP4syS1bd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtsntF7B9HSfYX2SXmHmBwbG2u3aciyULdK2ZKesm+3/VWm06O7saljE+zLkelHb6bwSV4Vn/2pKqLmAwkCBYUGOE45dvLCZhqiZuR3oYW3hbYFuaDBhqkSi2jzz6bkcY+SOKnF05Ooz68eTkJDb0y2uZQig6hpFnTNzsM7+7jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQqXzOJX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728453712; x=1759989712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYR/iz/uQadaFyZ0VIZKdCNT+eZ0L87m2kP4syS1bd0=;
  b=aQqXzOJXVJhQOnmDcnXE7Lkmy7So4bvpzJQcsLSxl/MHshUkBQPOcok8
   4OQuZfQShEJ0AdJTobj9eV2zG6xVQWrSG3CXtuZATo6KoMXKeVK9EY+n+
   GSBNo7cuAA5boIUP7BpAMS6zXrNhSC4NLxU02CnKieL+JMQKTufgzN7AY
   BdSUiHZZ+FZZ3e6n6vuBcgT2mQzv0kJG0f18qBmNZ6pZhNYPd5QVPCFD2
   bcA9Ffevxj6zo9wssFZdiNbPx5r3PH1jzFVDJ2Doq1qgYHqYqUeCVH1r0
   0E3ilH7GOelgNzQTmcRKqH7WDIuzGbZkM0YdM/nIOgCvpZKq7s4gw6jhd
   w==;
X-CSE-ConnectionGUID: 9gLPYes7Sv6dYHglR+hHBA==
X-CSE-MsgGUID: t6pDzzOyT3yQUI+Vlebl+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31621534"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31621534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:01:51 -0700
X-CSE-ConnectionGUID: ArXbDQ8oQTKsiOArIZe8bA==
X-CSE-MsgGUID: z93e8qWzTniQ+s9BvtsiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="113619784"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:01:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3B06C11F855;
	Wed,  9 Oct 2024 09:01:45 +0300 (EEST)
Date: Wed, 9 Oct 2024 06:01:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad
 type in call_get_frame_desc()
Message-ID: <ZwYcSZyEFtyl8QpQ@kekkonen.localdomain>
References: <20241007123809.89281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241007181654.GD14766@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007181654.GD14766@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Oct 07, 2024 at 09:16:54PM +0300, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Mon, Oct 07, 2024 at 01:38:09PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > The `get_frame_desc()` operation should always be called on a source pad,
> > which is indicated by the `MEDIA_PAD_FL_SOURCE` flag. This patch adds a
> > check in `call_get_frame_desc()` to ensure that the `MEDIA_PAD_FL_SOURCE`
> > flag is set for the pad before invoking `get_frame_desc()`. If the pad is
> > not a source pad, the function will return an `-EOPNOTSUPP` error,
> > signaling that the operation is not supported on non-source pads.
> > 
> > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Added a check for CONFIG_MEDIA_CONTROLLER, as the `entity` member in 
> >   `struct v4l2_subdev` is only available when CONFIG_MEDIA_CONTROLLER
> >   is enabled.
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index de9ac67574bb..446fbc3805c7 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -325,6 +325,11 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  	unsigned int i;
> >  	int ret;
> >  
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
> 
> As this should really not happen, I wonder if we shouldn't be more
> vocal:
> 
> 	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
> 
> Sakari, what do you think ? Either way,

I wouldn't as this is probably going to be user-triggerable. The problem
shouldn't be too hard to find out either.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

-- 
Kind regards,

Sakari Ailus

