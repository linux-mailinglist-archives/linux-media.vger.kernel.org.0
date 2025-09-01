Return-Path: <linux-media+bounces-41432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F3B3E257
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323E43B65A0
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3601E277032;
	Mon,  1 Sep 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX12spDQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A92765E3;
	Mon,  1 Sep 2025 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728673; cv=none; b=Spfd41IVAqjHnbsYLPcfrZ7RX2chHgx5CuMB/Q+/oxK8UMWGS0D6W9lY+sHPYlcXUyAan9MsHC4yCq4pVsiWoUFqVVOfNeyATQzLWu5E3ydFGqQoOyWK8aUwGvRqqksfWeR2fKFKCxcY2anDpiL4DrlBKmBMJYbJtbYPplbU5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728673; c=relaxed/simple;
	bh=BhDpfpJvIimS2A5/9ELJfbY3vyKUD5N4q9GhNW02pHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+mukSIKBWqj8/vwmvDM3ezKK5y5c8BvMCaHl9pKlATc6XM9ggfK1I4vsQ2sClsHf0wQkxp/31PnlIka8IGf9i8aceTpI5DgTDBIn90O2e1687h+9g2wPNfsItZKUwdaKENLMOLBXVqzWbT/88gABAEhmLXGeDe3IDftGuz6l+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX12spDQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756728672; x=1788264672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BhDpfpJvIimS2A5/9ELJfbY3vyKUD5N4q9GhNW02pHE=;
  b=VX12spDQpSjRvfmvz5pOo/t0dkDref/RSESt1H+6TeFnTxXDG/xqSY4w
   ebabpDYFK/0DKg4sNQopRZCZz2pkmGdXOAyldv/SPI7fGQRrJv6DzZuuu
   0zkrYKlstbFtD17eyfq/OApr4/5XCwCax0emssy5xIBmpX7YRAi6oibB3
   lRO2Oe5EQbNh9ud4ZcHe/bs3nUIONsQE0nN3S3H3KgUa7buy+Un7PIjVc
   kjnXzT+DZy32hn4ULAtmjn1VP4kYDglFydd2dOShYKlqrXX3AH/LPeZ+h
   oX3V4cOPEZfcRAfSJgE0vpIj1isbjMN9FRFcAFdDV5uMNd5j+wi2D87DJ
   w==;
X-CSE-ConnectionGUID: lxkgHIx/TYKQ5+C0Ew0FEA==
X-CSE-MsgGUID: zrFBJE68S1msyEM+qWVRGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58917452"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58917452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:11:11 -0700
X-CSE-ConnectionGUID: tMtO88dqTDW/rGxtV5RDjA==
X-CSE-MsgGUID: 1y2Gb3UlTTC9+bzzNX+X/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201932054"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.220])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:11:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5B77D11FA4A;
	Mon, 01 Sep 2025 15:11:07 +0300 (EEST)
Date: Mon, 1 Sep 2025 15:11:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 03/11] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <aLWNW1cBCOdXg3nU@kekkonen.localdomain>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
 <20250716-ov9282-flash-strobe-v6-3-934f12aeff33@linux.dev>
 <aKv3uUXf87im8ajX@kekkonen.localdomain>
 <rcgche43hzctpxbe2xt2cfksjbtyntc6ef26wptgkygcdlg5ga@sdhkkcpdfaek>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rcgche43hzctpxbe2xt2cfksjbtyntc6ef26wptgkygcdlg5ga@sdhkkcpdfaek>

Hi Richard,

On Mon, Sep 01, 2025 at 12:44:07PM +0200, Richard Leitner wrote:
> On Mon, Aug 25, 2025 at 08:42:17AM +0300, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > Thanks for the update (and for the ping!).
> > 
> > On Wed, Jul 16, 2025 at 11:06:53AM +0200, Richard Leitner wrote:
> > > Add the new strobe_duration control to v4l uAPI documentation.
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > @@ -186,3 +186,8 @@ Flash Control IDs
> > >      charged before strobing. LED flashes often require a cooldown period
> > >      after strobe during which another strobe will not be possible. This
> > >      is a read-only control.
> > > +
> > > +``V4L2_CID_FLASH_DURATION (integer)``
> > > +    Duration the flash should be on when the flash LED is in flash mode
> > > +    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (탎)
> > > +    if possible.
> > > 
> > 
> > I think we should add this is related to the hardware strobe.
> > 
> > How about:
> > 
> > ``V4L2_CID_FLASH_DURATION (integer)``
> > 
> >     Duration of the flash strobe from the strobe source, typically a camera
> >     sensor. Controlling the flash LED strobe length this way requires that the
> >     flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>` is set
> >     to ``V4L2_FLASH_LED_MODE_FLASH`` and :ref:`strobe source
> >     <v4l2-cid-strobe-source>` is set to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
> >     The unit should be microseconds (탎) if possible.
> > 
> > This requires of course the appropriate labels.
> > 
> > I also wonder whether we should use 0,1 탎 or even ns for the unit.
> 
> Thanks for the pointer.
> 
> I did a quick internet search and the shortest flash duration of
> speedlights/studio strobes I found was Profoto D2 with 1/63000 sec ~> 15.9탎.
> So I IMHO we are fine with 1탎 resolution here.

Works for me.

-- 
Sakari Ailus

