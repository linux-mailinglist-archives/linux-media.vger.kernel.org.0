Return-Path: <linux-media+bounces-34414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95214AD32C4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1911B16D6B4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE6228B7C7;
	Tue, 10 Jun 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VYcfkAMM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC428B501;
	Tue, 10 Jun 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549175; cv=none; b=lCJPiuFpf+207FPaXSNwP4Mc/P5CXGznWI7HQJr74M2K3UlN9nf83yyzOTpnxwAoA0YW6S5kCKpUsfEf7u1yQ/9Vkc9ugDldbjDsunc0K3siTVk/KHnX/2tCkzhjTvlyfx3naeyQhon1bYO5JfbRCNvbF+G+8OKWQBE1BJR5T18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549175; c=relaxed/simple;
	bh=Im5GYUCb1sxEGckIaOnAeshf/338KvZJ59zmYw//6eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7sa3u+Y6/607ZqJnIF7/TabN0huglyP9qpT1ORT+VHhSYbScLHf/oW2H7nUXt6YrlRljER92F1TKoEwxTV2n8kijPn3Aj9a5k0p+sMjMDPVEhlKM0Ix5CldXvsruiF/If+eVqEMLg3LiZ8pwhoOZKwsmrzDV2ptTG5S1Y7aEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VYcfkAMM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 214AF169;
	Tue, 10 Jun 2025 11:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749549163;
	bh=Im5GYUCb1sxEGckIaOnAeshf/338KvZJ59zmYw//6eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYcfkAMMn6K+mvIMMfKStHcleEwEsMpB7hzK4Uas/m9rLyIes7YU38x0/mJedVKBb
	 caB2NaQvYMsZEPK6xmrYorLMaXFrM06ojzRyDabW+HtlAOOCyaWl7YOSDgbGyGGDRW
	 JUC8Rlqi98psv8LRKo/fJIvtHFGGNjRIl9u7t2jY=
Date: Tue, 10 Jun 2025 12:52:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Message-ID: <20250610095238.GA28428@pendragon.ideasonboard.com>
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
 <20250609003751.GD14545@pendragon.ideasonboard.com>
 <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>

On Mon, Jun 09, 2025 at 03:33:29PM +0100, Dave Stevenson wrote:
> On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart wrote:
> > On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > > components, with the components being in the red, green, and blue order
> > > from left to right.
> > >
> > > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > > RGB888) with blue coming first, then green, then red. So the opposite of
> > > what V4L2 means by RGB.
> > >
> > > Since the hardware cannot reorder the components, this means that when
> > > selecting the RGB24 format, you get inverted red and blue components
> > > compared to what you'd expect.
> > >
> > > The driver already supports BGR24, so we can simply remove the RGB24
> > > format from the driver.
> >
> > The only reason I could think of to explain why the driver exposes
> > V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> > with a non-standard order. I don't know what hardware would do that.
> > Dave, Naush, do you recall why this pixel format is supported by the
> > unicam driver ?
> 
> I've lost track of exactly what gets validated along the pipeline.
> unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
> format and media bus codes match as listed in the table.
> 
> tc358743, adv7604, adv7511, and adv748x are all saying they produce
> MEDIA_BUS_FMT_RGB888_1X24
> ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.
> 
> Is that an error in the ov5640 driver? If not, then both entries have
> to be in the table to support all those drivers.

We haven't standardized which media bus code to use for 24-bit RGB on
CSI-2, so I'm not surprised drivers didn't get it right :-( The adv7604
and adv7511 shouldn't be relevant here though, as they're not CSI-2
devices. tc358743 and adv748x are relevant.

Sakari, which media bus code would you expect ?

> Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
> there (and RBG888 in the case of alvium).
> Unicam's hardware doesn't care about the ordering as it just writes
> the incoming data to memory, so having all the sensible mappings
> between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.
> 
> My initial reaction though is that simply removing the entry won't
> solve the problem anyway. You won't get a match between the
> MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
> pixel format, so the link_validate will fail.
> Swapping either fourcc or code between the two entries would be the
> fix I was expecting.
> 
> [1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169
> 
> > > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> > >       /* RGB Formats */
> > >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> > >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> > >               .depth          = 16,
> > >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > > -     }, {
> > > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > > -             .depth          = 24,
> > > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> > >       }, {
> > >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> > >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> > >               .depth          = 24,
> > >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> > >
> > > ---
> > > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad

-- 
Regards,

Laurent Pinchart

