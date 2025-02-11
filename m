Return-Path: <linux-media+bounces-25986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D269CA304BA
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9213A3C3E
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8601EDA22;
	Tue, 11 Feb 2025 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tj5GbFS6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F5C1E3DF7;
	Tue, 11 Feb 2025 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259879; cv=none; b=Gtbpu1bGe+Zbrfkc/TCQOoLUHh0kxdZI1r8Ps+FpYzULi9qgsMAMBKVUlB0Snu5n67dQhsxSMFxYud2qorMtls8rMXsuPxncJLy/X25tSfH4x4h4HdLB+PPvx3vPiVPR41jL1Ra3h3vSIsVedPnkzVQRmyakaO4HAnsBSCYH8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259879; c=relaxed/simple;
	bh=cm9PDeObe5p5RSqkrtZnN39LVuPDAZMxEFWvY/jtciQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQkXFhWyKg1IgduBg2wWfZB8woINN6HsT6wOzhKtj9BcuPh4t2Jdg4tM8cYCwLKXlJvXH0rT9ORNb+EIe3iq1/0eWKdcgZDSVLmV41l0BTEf6qLLu51oHw0rP99KcH3h3HWxX3sXchu2UOlYdv893VlcsW4kmj06OVEA0WAXvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tj5GbFS6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.86.242])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF65122E;
	Tue, 11 Feb 2025 08:43:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739259798;
	bh=cm9PDeObe5p5RSqkrtZnN39LVuPDAZMxEFWvY/jtciQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tj5GbFS6qOaeLXyn7zOkwk4Lsb/HG6EyvM0spC5AmhUvQGH6SVvxtFukj4TNO24tS
	 X+NJvIxAl4yn+29s02/FEuTCGAF2jyIUPf1Loa/dSUih0cvIaZXCxRo132TT2SsVnq
	 S2dnABEebvKosZEK67GBjk0EsorqvZnXda2hZKOA=
Date: Tue, 11 Feb 2025 13:14:12 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v6 5/5] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <n544346jf6wbzvrewfqs53fi6vlilw2kqirm4rh6fg7pfexkss@gynbikwrhmdh>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
 <20250204-imx219_fixes-v6-5-84ffa5030972@ideasonboard.com>
 <ubuuob7mb3o5bxoumrxv4rufutgk3lvdmdery6d3bfc6rytfti@tcchhlechzzp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ubuuob7mb3o5bxoumrxv4rufutgk3lvdmdery6d3bfc6rytfti@tcchhlechzzp>

Hi Jacopo, Naush,

On Feb 07, 2025 at 17:49:19 +0100, Jacopo Mondi wrote:
> Hi Jai
> 
> On Tue, Feb 04, 2025 at 12:34:40PM +0530, Jai Luthra wrote:
> > When the analog binning mode is used for high framerate operation, the
> > pixel rate is effectively doubled. Account for this when setting up the
> > pixel clock rate, and applying the vblank and exposure controls.
> >
> > The previous logic only used analog binning for RAW8, but normal binning
> > limits the framerate on RAW10 480p [1]. So with this patch we switch to
> > using special binning (with 2x pixel rate) wherever possible.
> >
> > [1]: https://github.com/raspberrypi/linux/issues/5493
> >
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---

[snip]

> > @@ -367,10 +426,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl 
> > *ctrl)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >  	const struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_subdev_state *state;
> > +	u32 rate_factor;
> >  	int ret = 0;
> >
> >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> >  	format = v4l2_subdev_state_get_format(state, 0);
> > +	rate_factor = imx219_get_rate_factor(imx219);
> >
> >  	if (ctrl->id == V4L2_CID_VBLANK) {
> >  		int exposure_max, exposure_def;
> > @@ -399,7 +460,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val, &ret);
> > +			  ctrl->val / rate_factor, &ret);
> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -416,7 +477,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -			  format->height + ctrl->val, &ret);
> > +			  (format->height + ctrl->val) / rate_factor, &ret);
> 
> 
> Isn't this (and exposure) compensatd by the doubled pixel rate ?
> 

The datasheet mentions that FRM_LENGTH_A register is in units of 2xLines 
when analog binning mode is selected. And the exposure is also usually 
in unit of lines, so I assume that is why the same division was made in 
the original commit by Naush [1]

[1] https://github.com/raspberrypi/linux/commit/caebe4fe817b5079

> Applications use the pixel rate to compute the line duration and from
> there transform the frame duration and the exposure in lines, don't
> they ?

While this change doesn't update the user-side of the control values, 
only the register values, I wonder if there is a clean way to handle 
this without updating some assumptions in the application.

The IMX219 pixel clock behaves differently with analog binning compared 
to (most of our) intuitions, where rather than doubling the horizontal 
pixel clock, each line is still read-out in the same time but the number 
of lines read are halved.. at least that's the best explanation I have 
from these results:
https://lore.kernel.org/linux-media/zla2sogd7ov3yz2k2je6zrgh3uzeermowlaixt3qkcioturppo@tswbw354tpdk/

And that is why the total pixel rate is doubled, but the actual line 
duration should be the same as a digitally binned or cropped format.

> 
> Overall, very nice to be able to double the achievable frame rate
> without any artifacts! Good job!
> 
> Thanks
>   j
> 

Thanks,
Jai

> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,

[snip]

