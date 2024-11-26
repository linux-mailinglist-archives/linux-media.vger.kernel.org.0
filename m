Return-Path: <linux-media+bounces-22085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECC9D98B0
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 14:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 324BC163462
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 13:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDEB1CDFA7;
	Tue, 26 Nov 2024 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aQBbhhzK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA25D53C;
	Tue, 26 Nov 2024 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732628432; cv=none; b=l5nn2Fbco/k9O9WryEIfEgMLM+mO3S5iyyKyBckgImTXkDIiy9a5OFtOiCf6o/Ztq7Z1QBM9er3QAmrG+32D7GOSupwyV/2smntpjCbQtWRWWWgAfGoWWfRQ52qDGzkMnv1zkx0EZ+F7500NZjhL4kGa5ftwt4urwlzJS6/foJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732628432; c=relaxed/simple;
	bh=FRUEJx/YtX/HxlBaOoXiJn5e8TVV7GoapIGo4oBAoEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6ni4L1HlMVJfEN1e5G+VdYNEj1ZLZsGon5dVrK9e06lUEswNGt1xY1J18C9n7TABFsqAe4QcyKxXt18AF8HiZ/5a877EMR6FvKg7hxMj1+kWpb9IgAaL3KuJLXYXRiL+cEFDMhFIdGKXsFYYZbFG0JKLLylnj9wqWgKd+A+lWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aQBbhhzK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A44876BE;
	Tue, 26 Nov 2024 14:40:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732628406;
	bh=FRUEJx/YtX/HxlBaOoXiJn5e8TVV7GoapIGo4oBAoEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQBbhhzKja6KK7Ka/uY51Cltx0Hq+AiykrFfGAbhhvQJAPsEHqEgLvvn3ADhCSiHi
	 /aFAidwvflM6TO8uMPdtcyIcioUFNpELaTrolXrHN7l84uCxmzRTpAZU3KkpN04Qeb
	 YMeJmjo756+sjpOtWw85Qllx+tZTNS0mSs5uDD8o=
Date: Tue, 26 Nov 2024 15:40:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx219: make HBLANK r/w to allow
 longer exposures
Message-ID: <20241126134019.GG5461@pendragon.ideasonboard.com>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-2-434fc0b541c8@ideasonboard.com>
 <20241126121640.GE5461@pendragon.ideasonboard.com>
 <CAPY8ntDAnj1uf-fBRbioZSwRm9zO4=e4-E+Rd-PAz0N3cmad-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDAnj1uf-fBRbioZSwRm9zO4=e4-E+Rd-PAz0N3cmad-A@mail.gmail.com>

Hi Dave,

On Tue, Nov 26, 2024 at 01:21:27PM +0000, Dave Stevenson wrote:
> On Tue, 26 Nov 2024 at 12:16, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 08:36:26PM +0530, Jai Luthra wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > The HBLANK control was read-only, and always configured such
> > > that the sensor HTS register was 3448. This limited the maximum
> > > exposure time that could be achieved to around 1.26 secs.
> > >
> > > Make HBLANK read/write so that the line time can be extended,
> > > and thereby allow longer exposures (and slower frame rates).
> > > Retain the overall HTS setting when changing modes rather than
> > > resetting it to a default.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 37 ++++++++++++++++++++++++-------------
> > >  1 file changed, 24 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index f98aad74fe584a18e2fe7126f92bf294762a54e3..970e6362d0ae3a9078daf337155e83d637bc1ca1 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -76,8 +76,10 @@
> > >
> > >  #define IMX219_VBLANK_MIN            32
> > >
> > > -/* HBLANK control - read only */
> > > -#define IMX219_PPL_DEFAULT           3448
> > > +/* HBLANK control range */
> >
> > Just drop the comment, and drop the blank lines, this belongs to the
> > "V_TIMING internal" section.
> >
> > > +#define IMX219_PPL_MIN                       0x0d78
> >
> > Why PPL and not HTS ?
> 
> The IMX219 datasheet defines the register as LINE_LENGTH_A, with
> comment line_length_pck.
> 
> HTS is not a term used in the imx219 datasheet, so why introduce it to
> the driver? I'd go along with a rename to LLP if you wish.
> (HTS is more commonly an Omnivision term, not a Sony one).

I thought the datasheet used HTS, my bad. Now that you mention it, HTS
is indeed more of an OmniVision term. Sorry for the oversight.

I would then name the macro IMX219_REG_LINE_LENGTH, and rename
IMX219_REG_VTS to IMX219_REG_FRM_LENGTH.

> > > +#define IMX219_PPL_MAX                       0x7ff0
> > > +#define IMX219_REG_HTS                       CCI_REG16(0x0162)
> >
> > The min/max should go below the register definition.
> >
> > >
> > >  #define IMX219_REG_LINE_LENGTH_A     CCI_REG16(0x0162)
> > >  #define IMX219_REG_X_ADD_STA_A               CCI_REG16(0x0164)
> > > @@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >               cci_write(imx219->regmap, IMX219_REG_VTS,
> > >                         format->height + ctrl->val, &ret);
> > >               break;
> > > +     case V4L2_CID_HBLANK:
> > > +             cci_write(imx219->regmap, IMX219_REG_HTS,
> > > +                       format->width + ctrl->val, &ret);
> > > +             break;
> > >       case V4L2_CID_TEST_PATTERN_RED:
> > >               cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> > >                         ctrl->val, &ret);
> > > @@ -496,12 +502,10 @@ static int imx219_init_controls(struct imx219 *imx219)
> > >                                          V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> > >                                          IMX219_VTS_MAX - mode->height, 1,
> > >                                          mode->vts_def - mode->height);
> > > -     hblank = IMX219_PPL_DEFAULT - mode->width;
> > > +     hblank = IMX219_PPL_MIN - mode->width;
> > >       imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> > >                                          V4L2_CID_HBLANK, hblank, hblank,
> >
> > The minimum and maximum are identical, is this intentional ?
> 
> The limits should be updated when the format is set, so the values
> shouldn't matter when created. However I'd want to check that did
> happen seeing as vblank computes the limits here.
> It is as easy to set them correctly here too (max = IMX219_PPL_MAX -
> mode->width), so you may as well.

I would at least handle hblank and vblank the same way. If we expect the
values to be updated, a comment to indicate so would be good. The
current code states

	/* Initial vblank/hblank/exposure parameters based on current mode */

> > >                                          1, hblank);
> > > -     if (imx219->hblank)
> > > -             imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >       exposure_max = mode->vts_def - 4;
> > >       exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> > >               exposure_max : IMX219_EXPOSURE_DEFAULT;
> > > @@ -817,6 +821,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >       struct v4l2_mbus_framefmt *format;
> > >       struct v4l2_rect *crop;
> > >       unsigned int bin_h, bin_v;
> > > +     u32 prev_hts;
> > > +
> > > +     format = v4l2_subdev_state_get_format(state, 0);
> > > +     prev_hts = format->width + imx219->hblank->val;
> > >
> > >       mode = v4l2_find_nearest_size(supported_modes,
> > >                                     ARRAY_SIZE(supported_modes),
> > > @@ -824,8 +832,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >                                     fmt->format.width, fmt->format.height);
> > >
> > >       imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> > > -
> > > -     format = v4l2_subdev_state_get_format(state, 0);
> > >       *format = fmt->format;
> > >
> > >       /*
> > > @@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >                                        exposure_max, imx219->exposure->step,
> > >                                        exposure_def);
> > >               /*
> > > -              * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> > > -              * depends on mode->width only, and is not changeble in any
> > > -              * way other than changing the mode.
> > > +              * Retain PPL setting from previous mode so that the
> >
> > Rename PPL to HTS here too.
> 
> Disagree as above. The local variable here should be renamed prev_ppl
> or prev_llp.

Or prev_line_length. I agree that hts isn't a good name here.

> > > +              * line time does not change on a mode change.
> > > +              * Limits have to be recomputed as the controls define
> > > +              * the blanking only, so PPL values need to have the
> > > +              * mode width subtracted.
> > >                */
> > > -             hblank = IMX219_PPL_DEFAULT - mode->width;
> > > -             __v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> > > -                                      hblank);
> > > +             hblank = prev_hts - mode->width;
> > > +             __v4l2_ctrl_modify_range(imx219->hblank,
> > > +                                      IMX219_PPL_MIN - mode->width,
> > > +                                      IMX219_PPL_MAX - mode->width,
> > > +                                      1, IMX219_PPL_MIN - mode->width);
> > > +             __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > >       }
> > >
> > >       return 0;

-- 
Regards,

Laurent Pinchart

