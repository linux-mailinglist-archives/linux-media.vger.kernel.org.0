Return-Path: <linux-media+bounces-10651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49588BA308
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 00:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130641C21A2C
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 22:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3742557CA8;
	Thu,  2 May 2024 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZACfO29x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8B57CA2;
	Thu,  2 May 2024 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714688216; cv=none; b=s8NhxhWVWrfInp5BxD0v7GeosphJohB4rzKODDdNbmEVEvwvCbQ1zQexCNJhA+Nnjoumhynsb8RMD30iokevd8PmpETT2OwqDDIe8R24OYBOO23XFbJb8r1tjVC172NL1GIXmUirXU2/q+AdNkSnpAbtlWhgeSCAr/h5/aqdbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714688216; c=relaxed/simple;
	bh=SSft/gL3qokVbBhzqwQmQzTBKPSRsY5sFmSeIM12fnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyhTY38qzQpnF1C16VEjcjRPJbolh6EiCUurtiPnjZ2D8F4+NScxxhnjhBW0lb2ggkqyK6+dIcugS27QzQ3pUQ+pu7xmbvouK7972seuimC3WbYRZoGjAlcGdTVapBx+z1G06tiT6PSE5n0rJNnFMHlBFxLrzXyrPHx5cJidcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZACfO29x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EED064CE;
	Fri,  3 May 2024 00:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714688156;
	bh=SSft/gL3qokVbBhzqwQmQzTBKPSRsY5sFmSeIM12fnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZACfO29xyFqx5jgmJ/IKh/ccmfjP8qpoxHWcmYoZYgDByc4Y9P+KSRiZcg7126QyX
	 1P64cfCRbXOPm1YdmoyuW+QgMYcdh9kAPOCxNweEOpFeDugodS+Y/1Rl9VoFAbxlZY
	 RWKleOzs+U25wd6zm2McaA27+SC/9tBMw82lVuEs=
Date: Fri, 3 May 2024 01:16:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 19/19] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
Message-ID: <20240502221647.GE4959@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-20-jacopo.mondi@ideasonboard.com>
 <20240502143326.GD3927860@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502143326.GD3927860@ragnatech.se>

On Thu, May 02, 2024 at 04:33:26PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
> 
> Same for this patch, can't we fix this issue independent from the 
> streams work?

+1

> On 2024-04-30 12:39:55 +0200, Jacopo Mondi wrote:
> > The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
> > BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
> > driver and are thus disallowed when capturing frames from the R-Car
> > CSI-2 interface according to the hardware manual.
> > 
> > As the 1X16 format variants are meant to be used with serial busses they
> > have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
> > from CSI-2, which is a valid setting for CSI-2.
> > 
> > Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
> > and format are valid") disallowed capturing YUV16 when using the CSI-2
> > interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
> > use.
> > 
> > Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index e2c40abc6d3d..21d5b2815e86 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
> >  	 */
> >  	switch (vin->mbus_code) {
> >  	case MEDIA_BUS_FMT_YUYV8_1X16:
> > -		/* BT.601/BT.1358 16bit YCbCr422 */
> > -		vnmc |= VNMC_INF_YUV16;
> > +		if (vin->is_csi)
> > +			/* YCbCr422 8-bit */
> > +			vnmc |= VNMC_INF_YUV8_BT601;
> > +		else
> > +			/* BT.601/BT.1358 16bit YCbCr422 */
> > +			vnmc |= VNMC_INF_YUV16;
> >  		input_is_yuv = true;
> >  		break;
> >  	case MEDIA_BUS_FMT_UYVY8_1X16:
> > -		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
> > +		if (vin->is_csi)
> > +			/* YCbCr422 8-bit */
> > +			vnmc |= VNMC_INF_YUV8_BT601;
> > +		else
> > +			/* BT.601/BT.1358 16bit YCbCr422 */
> > +			vnmc |= VNMC_INF_YUV16;
> > +		vnmc |= VNMC_YCAL;
> >  		input_is_yuv = true;
> >  		break;
> >  	case MEDIA_BUS_FMT_UYVY8_2X8:

-- 
Regards,

Laurent Pinchart

