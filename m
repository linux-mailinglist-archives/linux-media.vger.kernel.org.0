Return-Path: <linux-media+bounces-34436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF272AD377A
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7E13172637
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40829A336;
	Tue, 10 Jun 2025 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWBVq6vB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A3293469;
	Tue, 10 Jun 2025 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559644; cv=none; b=DC4G+B5OlQ6SVPJfy5qWdDmt291lFWFeolPsqw1BikupVTWmRNRcdboFcKrAOqOpyRN2QnfZphZd4zmk+HJ4BbuNzZ2n5PMbOgK0+ACDIV7ox3fks/l9aFuEpOX39GRsA65wBjJr8M3sAk0CK2uAQKaanAJv92z+SN89J35lB3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559644; c=relaxed/simple;
	bh=Q9YIQ730GHAcOU4O1jEnaS7atkULzfK70EqJ4k2AIrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIcIwzgUYBTmyXF+jvBMlbK7Yv/pHvyXTh5pIJiQ4h21WOxc7XEnsbSxGmSKFilPYlCYjehWU7D1hTEY3LnSKKJc4AaBotcvI3gnsXktBC/pRaXhphE3wTTywONhHoFQ0V8ENPYPJ9DWpao4ynMegHzU4H47dsls0MVFnk7eEMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWBVq6vB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749559643; x=1781095643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9YIQ730GHAcOU4O1jEnaS7atkULzfK70EqJ4k2AIrQ=;
  b=jWBVq6vBkOZoffGVHfzfKIOtnXnj90xK0lCsqFDq2TFgwz411qN16an8
   ofxPFJWRDvf/tGErpJVaGgcvH7hwq6F27S4okDrw5Euu08cNvQjKGW8oN
   Oj4EOdOmYZb3glYrshqC4Zbi/RtIXSqjQvNsJnFYZMaU1Tt+GuWNl6DqJ
   64taew93XmwNzfLrrMWOqVXTeuGb1ets+Qlsy7xTgJPsK6WD2u1nla/EZ
   vOExv4zNBJE9JpwzMSj7hwOwVnviTtS7SMg52SW20mbo0qXqlNfZKg41F
   hp3HWXP3sFv047T9HdlSV1xIj9DrGrB62GLW/erwGIDQnJUno1XDUxiI8
   A==;
X-CSE-ConnectionGUID: RK3tpsNdRQe0b81l6lTElA==
X-CSE-MsgGUID: iOVNVYU+SqqH9t9lqhygVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55458312"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="55458312"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:47:22 -0700
X-CSE-ConnectionGUID: 4Cziqe11QyubbBtGWExN/A==
X-CSE-MsgGUID: 5JQpjcB0Qjym4IDP1f45tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151700327"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.55])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:47:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8F7F011FB81;
	Tue, 10 Jun 2025 15:47:15 +0300 (EEST)
Date: Tue, 10 Jun 2025 12:47:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Message-ID: <aEgpU9VUGZuSHpC0@kekkonen.localdomain>
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
 <20250609003751.GD14545@pendragon.ideasonboard.com>
 <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
 <20250610095238.GA28428@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610095238.GA28428@pendragon.ideasonboard.com>

Hi Laurent, others,

On Tue, Jun 10, 2025 at 12:52:38PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 09, 2025 at 03:33:29PM +0100, Dave Stevenson wrote:
> > On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart wrote:
> > > On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > > > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > > > components, with the components being in the red, green, and blue order
> > > > from left to right.
> > > >
> > > > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > > > RGB888) with blue coming first, then green, then red. So the opposite of
> > > > what V4L2 means by RGB.
> > > >
> > > > Since the hardware cannot reorder the components, this means that when
> > > > selecting the RGB24 format, you get inverted red and blue components
> > > > compared to what you'd expect.
> > > >
> > > > The driver already supports BGR24, so we can simply remove the RGB24
> > > > format from the driver.
> > >
> > > The only reason I could think of to explain why the driver exposes
> > > V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> > > with a non-standard order. I don't know what hardware would do that.
> > > Dave, Naush, do you recall why this pixel format is supported by the
> > > unicam driver ?
> > 
> > I've lost track of exactly what gets validated along the pipeline.
> > unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
> > format and media bus codes match as listed in the table.
> > 
> > tc358743, adv7604, adv7511, and adv748x are all saying they produce
> > MEDIA_BUS_FMT_RGB888_1X24
> > ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.
> > 
> > Is that an error in the ov5640 driver? If not, then both entries have
> > to be in the table to support all those drivers.
> 
> We haven't standardized which media bus code to use for 24-bit RGB on
> CSI-2, so I'm not surprised drivers didn't get it right :-( The adv7604
> and adv7511 shouldn't be relevant here though, as they're not CSI-2
> devices. tc358743 and adv748x are relevant.

My understanding is the order indeed is BGR. But let's say that if there's
a device that generates RGB (as in pixel order) pixel data, then it should
be reflected in V4L2 pixelformat as well.

> 
> Sakari, which media bus code would you expect ?

MEDIA_BUS_FMT_BGR888_1X24. That's actually used in the example as well:
<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode>.

> 
> > Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
> > there (and RBG888 in the case of alvium).
> > Unicam's hardware doesn't care about the ordering as it just writes
> > the incoming data to memory, so having all the sensible mappings
> > between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.
> > 
> > My initial reaction though is that simply removing the entry won't
> > solve the problem anyway. You won't get a match between the
> > MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
> > pixel format, so the link_validate will fail.
> > Swapping either fourcc or code between the two entries would be the
> > fix I was expecting.
> > 
> > [1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169
> > 
> > > > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> > > >  1 file changed, 5 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> > > >       /* RGB Formats */
> > > >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> > > >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> > > >               .depth          = 16,
> > > >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > > > -     }, {
> > > > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > > > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > > > -             .depth          = 24,
> > > > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> > > >       }, {
> > > >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> > > >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> > > >               .depth          = 24,
> > > >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> > > >
> > > > ---
> > > > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > > > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
> 

-- 
Regards,

Sakari Ailus

