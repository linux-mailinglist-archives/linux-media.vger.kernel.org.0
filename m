Return-Path: <linux-media+bounces-4106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A1839822
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865DE1C26C50
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 18:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06672823AF;
	Tue, 23 Jan 2024 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CQHOLJYs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519581217;
	Tue, 23 Jan 2024 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035554; cv=none; b=oSXZ04bNNvR7z7ICBg0yMflH1G57bapzVpRiCrZH1qQwCEM5hT1JV9KDHRgbS7spClGpXkTWlqy/tlC5rKa7na6vHPHc5bt6yCq9YxkPRLVLcpwzcQDGN/+9jJG/wJQk0eDL69dCGDq13Pj1OpZj4k/kD10fqQoBgRtZc6KCpUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035554; c=relaxed/simple;
	bh=FifBFda1BULQdJPThIP0UT4ARArkgTXu12mOvZ2GCRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaO9qU1+cIzFABm5I8tWMj9JphsgGBPDq+GqFYGb9kASrOZgeNjgKrSbqKQVOre3bmDiisN7fvq4vjOayDdR2Z8F5ycWZOFJ088WAPuvS90/1AUgC21oedSmwjgs/xWkrnDbjW/9I3Wv8h8urg4XNhcotAl+f7XX8KCKWTkRDww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CQHOLJYs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0B60BEB;
	Tue, 23 Jan 2024 19:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706035476;
	bh=FifBFda1BULQdJPThIP0UT4ARArkgTXu12mOvZ2GCRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQHOLJYsJFYd8VGAeO74ho+MYoESY5vwgSd3TVsPOFBBftMpov9cZ6IMJFlGFjxs6
	 uEn+BiYgLl20tlI1S6PxTqFXuPwggZnRmeW6u96DMDygUz5OYVJZ6ZawJiYdmmkvoq
	 dMig3TlsDV8ewzT/NcvObBQg7CoaEYrDVeHg32OY=
Date: Tue, 23 Jan 2024 20:45:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay
 after D-PHY reset
Message-ID: <20240123184547.GE14927@pendragon.ideasonboard.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-3-biju.das.jz@bp.renesas.com>
 <20240123153024.GQ10679@pendragon.ideasonboard.com>
 <TYCPR01MB11269CDDA833B19000893C90B86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269CDDA833B19000893C90B86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>

On Tue, Jan 23, 2024 at 06:38:00PM +0000, Biju Das wrote:
> Hi Laurent Pinchart,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Tuesday, January 23, 2024 3:30 PM
> > Subject: Re: [PATCH 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay
> > after D-PHY reset
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jan 23, 2024 at 11:58:19AM +0000, Biju Das wrote:
> > > As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on
> > > the latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned
> > > that after DPHY reset, we need to wait for 1 msec or more before start
> > > receiving data from the sensor. So add a delay after pre_streamon().
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > > index 9f351a05893e..5468dc179de7 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright (C) 2022 Renesas Electronics Corp.
> > >   */
> > >
> > > +#include <linux/delay.h>
> > >  #include "rzg2l-cru.h"
> > >
> > >  struct rzg2l_cru_ip_format {
> > > @@ -71,6 +72,8 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev
> > *sd, int enable)
> > >  		if (ret)
> > >  			return ret;
> > >
> > > +		usleep_range(1000, 2000);
> > > +
> > 
> > What would you think of using
> > 
> > 		fsleep(1000);
> > 
> > instead ?
> 
> Essentially it is same by looking at the code[1].
> OK will use fsleep()

Yes, it will result in the same delay. fsleep() is recommended as the
default sleep function unless there's a specific need to do something
different.

> [1]
> static inline void fsleep(unsigned long usecs)
> {
> 	if (usecs <= 10)
> 		udelay(usecs);
> 	else if (usecs <= 20000)
> 		usleep_range(usecs, 2 * usecs);
> 	else
> 		msleep(DIV_ROUND_UP(usecs, 1000));
> }
> 
> > With or without that,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > >  		ret = rzg2l_cru_start_image_processing(cru);
> > >  		if (ret) {
> > >  			v4l2_subdev_call(cru->ip.remote, video, post_streamoff);

-- 
Regards,

Laurent Pinchart

