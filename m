Return-Path: <linux-media+bounces-13201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D490776D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 17:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D3C2894A7
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6EA14A61E;
	Thu, 13 Jun 2024 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASTrUCME"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB7612DDA5
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718293424; cv=none; b=p1Z60e6s5RXiw2sjOvZna+NzG6hmbMZxAUin4DGPDpucaghY2R2hYp5FTbXjrHHgPd6LTLNkHCRYPI9HGYqpwu0v6NIwpJRJMaiqucjZ+iTXB4ET5SPyupKbT3l+7jeR3u2bj8jrTrYlOJQ3i7Jd4FUJ0sIWd2bSrrTsd49a3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718293424; c=relaxed/simple;
	bh=KSgtLRSPdPJDc75iCHbWbthWJHchvr/B9aGg15RWKA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V25ho+QRrJWQIaBYwTR5nFb4DIrCWASGD3+F4p1GTN915/7wJerXqGIMlpJaIounEzod1OE3DSkrdESGyxef0HIq9ka6ruOi2gBlT/qWNsNtjVxMk9e24UutPRdAn25neu0q9vJBHxoEhvyETbJa3/pCASqBMBJxUK5fybDmKQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASTrUCME; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718293423; x=1749829423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSgtLRSPdPJDc75iCHbWbthWJHchvr/B9aGg15RWKA8=;
  b=ASTrUCMEy3zOTy/usjp4DfAIdNwix5KIa/5Wa3rujiRaBRpYAIO2QENX
   Ed8MHR5hX32CtexBtsEM53mjD6aHREnR06r8Ow4RwvdKwAyp7hH2CtleE
   OBVqj666uiPPg4ITct0Mwha2C5aj/IkbTj2g2QCL3ZyT+hgsS4zqHDXLf
   mCJSwQmsYimzSaJvxr8ufByFzLsPSA5SFZtAw2SYjU5ir+6u4dNjPh87k
   SX5OKx8iceCsByoEqawGBtmPVYzFq4RYP7DPsLUfGOHZFo9RPZePMAzGI
   TgcYee9pzgTrzaa3he4hmbnE8f4Gqsicr+Zk2iwWXV8tXhNFPqoVMWN2V
   Q==;
X-CSE-ConnectionGUID: d44CH0f+S1SleIHwSte+wQ==
X-CSE-MsgGUID: 7iFrZyyKTUW78oWDHUxYrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18908575"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="18908575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:43:08 -0700
X-CSE-ConnectionGUID: Q85zRMnTQFudYZq61MAXwA==
X-CSE-MsgGUID: pOSVXcpuTxqNGwOqzi/Qtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="45298047"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:43:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2146211FA94;
	Thu, 13 Jun 2024 18:43:04 +0300 (EEST)
Date: Thu, 13 Jun 2024 15:43:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: imx283: drop CENTERED_RECTANGLE due to clang
 failure
Message-ID: <ZmsTiONeON0ijKfk@kekkonen.localdomain>
References: <ff7a05e2-2908-4da0-817a-1d7c271e788a@xs4all.nl>
 <171829240304.2248009.15616094068000525791@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171829240304.2248009.15616094068000525791@ping.linuxembedded.co.uk>

Hi Kieran, Hans,

Thanks for working on this.

On Thu, Jun 13, 2024 at 04:26:43PM +0100, Kieran Bingham wrote:
> Quoting Hans Verkuil (2024-06-13 16:19:08)
> > The CENTERED_RECTANGLE define fails to compile on clang and old gcc
> > versions. Just drop it and fill in the crop rectangles explicitly.
> 
> So back when I was playing around with this I thought it would have got
> dropped during review / upstreaming before now - because I couldn't find
> a way to make sure the macro args were guaranteed to be used only once,
> by putting some locals in the macro (because of the initialisation).
> 
> So I'm not surprised that it needs to be removed, but I am surprised
> that it wasn't for the reason I expected ;-)
> 
> Anyway - maybe later I'll experiement with more common helpers perhaps -
> but not if it hits compile errors..

Or once clang before ~ 17 is deprecated? :-)

> 
> 
> 
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> > diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> > index 6428eb5394a9..8490618c5071 100644
> > --- a/drivers/media/i2c/imx283.c
> > +++ b/drivers/media/i2c/imx283.c
> > @@ -407,14 +407,6 @@ static const struct imx283_reg_list link_freq_reglist[] = {
> >         },
> >  };
> > 
> > -#define CENTERED_RECTANGLE(rect, _width, _height)                      \
> > -       {                                                               \
> > -               .left = rect.left + ((rect.width - (_width)) / 2),      \
> > -               .top = rect.top + ((rect.height - (_height)) / 2),      \
> > -               .width = (_width),                                      \
> > -               .height = (_height),                                    \
> > -       }
> > -
> >  /* Mode configs */
> >  static const struct imx283_mode supported_modes_12bit[] = {
> >         {
> > @@ -440,7 +432,12 @@ static const struct imx283_mode supported_modes_12bit[] = {
> >                 .min_shr = 11,
> >                 .horizontal_ob = 96,
> >                 .vertical_ob = 16,
> > -               .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
> > +               .crop = {
> > +                       .top = 40,
> > +                       .left = 108,
> > +                       .width = 5472,
> > +                       .height = 3648,
> > +               },
> 
> I do recall using v4l2_rects to define the active area so they could be
> used collectively rather than initialising things as
> 	.width = WIDTH,
> 	.height = HEIGHT,

I'd prefer this, too. Plain numbers are easier to get wrong.

> 
> So - perhaps this could be (if it compiles):
> 	.crop = imx283_active_area,

This is my preference as well.

> 
> but either way is fine with me if it unbreaks linux-next.
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Either way, as a clang compilation workaround this is ok so:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> >         },
> >         {
> >                 /*
> > @@ -468,7 +465,12 @@ static const struct imx283_mode supported_modes_12bit[] = {
> >                 .horizontal_ob = 48,
> >                 .vertical_ob = 4,
> > 
> > -               .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
> > +               .crop = {
> > +                       .top = 40,
> > +                       .left = 108,
> > +                       .width = 5472,
> > +                       .height = 3648,
> > +               },
> >         },
> >  };
> > 
> > @@ -489,7 +491,12 @@ static const struct imx283_mode supported_modes_10bit[] = {
> >                 .min_shr = 10,
> >                 .horizontal_ob = 96,
> >                 .vertical_ob = 16,
> > -               .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
> > +               .crop = {
> > +                       .top = 40,
> > +                       .left = 108,
> > +                       .width = 5472,
> > +                       .height = 3648,
> > +               },
> >         },
> >  };
> > 
> >

-- 
Kind regards,

Sakari Ailus

