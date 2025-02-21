Return-Path: <linux-media+bounces-26557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B0A3F233
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DC53BC388
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33E92054E8;
	Fri, 21 Feb 2025 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gmbb0Xmb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F91FF1AF;
	Fri, 21 Feb 2025 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740134244; cv=none; b=Xge4j9lS71JIN7tRP6QDAWdGn65ulOGLJj7WRQJAsOy6srt1ee8rosZ8KiDD27tCaPUQKmuEMa2I9xa6bmMt8YT/BIDgBsCTzqRnpP9E6X7uNRumZVpbIh7zvLaQkRQK9uS4lyV4a0z5Sot3X+nBM5fLlMDanreM307DrdQ80SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740134244; c=relaxed/simple;
	bh=gRBgJtkXNndTygei2/WU8WKjZkABz8HcvljFdyBrIgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLFZDRIV2tKYGTHYohEC1SoaCv9TLKKqR8cgLvw4okndbpDy10IBfTgT9fS0VnmOSl79aGOHeV5RFJicb84SA8MVaLFZTzRGvWQqmG/T5XBYFWJL2GLg53OeibaqIL3lnbkGryUO7A5eSJODIvNRNlNCPhpQyBNor456he6feKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gmbb0Xmb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B49342EC;
	Fri, 21 Feb 2025 11:35:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740134156;
	bh=gRBgJtkXNndTygei2/WU8WKjZkABz8HcvljFdyBrIgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmbb0XmbO/gfQQ2P9CUic9YnHpaGA9RrxgDPyBrXWK0diB71jGF7PYw1uzI4DKDjY
	 5U/TcMNX3aEYO7q1DCmdRO+XD0Hi43PgqcPHnjlYc1hH9M7MU42EUhwF88jQGCb4CG
	 xybQKsMUMzyRAQm+tmGWUf8eYCasPe9xaFPkuYXI=
Date: Fri, 21 Feb 2025 16:07:13 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: imx219: Only use higher LLP_MIN for
 binned resolutions
Message-ID: <attkqzfqwxjrozx27utbyh2q2jfci3ytjsq2we4db3nhf22l3e@7uv3j2imledv>
References: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
 <20250219-imx219_fixes_v2-v1-1-0e3f5dd9b024@ideasonboard.com>
 <mloobyyocd5f4hbkenplebwyffacdjjhzhxefvlx2og5qz5xlx@zswcyzzfcpy3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mloobyyocd5f4hbkenplebwyffacdjjhzhxefvlx2og5qz5xlx@zswcyzzfcpy3>

Hi Jacopo,

Thanks for the review.

On Feb 21, 2025 at 10:28:40 +0100, Jacopo Mondi wrote:
> Hi Jai
> 
> On Wed, Feb 19, 2025 at 05:16:43PM +0530, Jai Luthra wrote:
> > The LLP_MIN of 3560 is only needed to fix artefacts seen with binned
> > resolutions. As increasing the LLP reduces the highest possible
> > framerate by ~3%, use the default minimum of 3448 for non-binned
> > resolutions.
> >
> 
> Also restore the fll_def value for non-binned modes in the modes definition
> to restore the default mode framerate to 30fps.
> 

Will add in v2.

> > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Link: https://lore.kernel.org/linux-media/CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com/
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index f662c9d755114265aad46c5cc7f5031b9bc0dbba..6e51a7af5e2a05cacefb201d96a9fbdc349f17d8 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -74,7 +74,8 @@
> >  #define IMX219_FLL_MAX			0xffff
> >  #define IMX219_VBLANK_MIN		32
> >  #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
> > -#define IMX219_LLP_MIN			0x0de8
> > +#define IMX219_LLP_MIN			0x0d78
> > +#define IMX219_BINNED_LLP_MIN		0x0de8
> >  #define IMX219_LLP_MAX			0x7ff0
> >
> >  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
> > @@ -317,13 +318,13 @@ static const struct imx219_mode supported_modes[] = {
> >  		/* 8MPix 15fps mode */
> >  		.width = 3280,
> >  		.height = 2464,
> > -		.fll_def = 3415,
> > +		.fll_def = 3526,
> >  	},
> >  	{
> >  		/* 1080P 30fps cropped */
> >  		.width = 1920,
> >  		.height = 1080,
> > -		.fll_def = 1707,
> > +		.fll_def = 1763,
> >  	},
> >  	{
> >  		/* 2x2 binned 60fps mode */
> > @@ -901,7 +902,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >  		int exposure_max;
> >  		int exposure_def;
> > -		int hblank;
> > +		int hblank, llp_min;
> >  		int pixel_rate;
> >
> >  		/* Update limits and set FPS to default */
> > @@ -918,6 +919,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  					 imx219->exposure->minimum,
> >  					 exposure_max, imx219->exposure->step,
> >  					 exposure_def);
> > +
> > +		/*
> > +		 * With analog binning the default minimum line length of 3448
> > +		 * can cause artefacts because the ADC operates on two lines
> > +		 * together. Switch to higher minimum of 3560 if we are binning.
> > +		 */
> > +		llp_min = (bin_h || bin_v) ? IMX219_BINNED_LLP_MIN :
> 
> As you know, this is always true.
> 

Oops my bad. Will fix in v2.

I realized it would be cleaner to use the new version of 
imx219_get_binning() to check if analog binning is used before updating 
the minimum.

> > +					     IMX219_LLP_MIN;
> > +		__v4l2_ctrl_modify_range(imx219->hblank, llp_min - mode->width,
> > +					 IMX219_LLP_MAX - mode->width, 1,
> > +					 llp_min - mode->width);
> >  		/*
> >  		 * Retain PPL setting from previous mode so that the
> >  		 * line time does not change on a mode change.
> > @@ -926,10 +938,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  		 * mode width subtracted.
> >  		 */
> >  		hblank = prev_line_len - mode->width;
> > -		__v4l2_ctrl_modify_range(imx219->hblank,
> > -					 IMX219_LLP_MIN - mode->width,
> > -					 IMX219_LLP_MAX - mode->width, 1,
> > -					 IMX219_LLP_MIN - mode->width);
> >  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> >
> >  		/* Scale the pixel rate based on the mode specific factor */
> >
> > --
> > 2.48.1
> >

-- 
Thanks,
Jai

