Return-Path: <linux-media+bounces-21986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C89D865F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 712D4B2B52B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A44A19F475;
	Mon, 25 Nov 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q782AO+9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2119AD70;
	Mon, 25 Nov 2024 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732538100; cv=none; b=nfo6OCGXy5dfN6+P/M+06J7pmCBIg4x02sjVx9p8Vhhf4v66Q8i/mHBIT48cE44ZuxhwK25el32xOaE3zbB3aqs6l5TY7jfB2eY3/eQ58P4YVlWp6wfvtfpBAZCKq6ZxShJpi/AIgYngJ34pDPUmXgzDlCJ61YbWLRYhbTVpq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732538100; c=relaxed/simple;
	bh=fCcmYR3uXAxUJ7gB5tb++ALMFoBbjIn6dT1hpUr/PQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZBXU3xF2r0hJq3BaZ3vs+oxj4vFljF4eK4R6Wzcp9ncAbJ2wnSsVLZAQxL3Xz3KFsY/VeI70exUe2fUsF1Fh2Xo0IsSFFKr4ow4JsUBXGF4RXR9RSSg4UvVyTF4r5agTWxl7SUbNetUmxdmbd+auEg+s2rBNS+47NgpF57zf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q782AO+9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72F1AA2F;
	Mon, 25 Nov 2024 13:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732538075;
	bh=fCcmYR3uXAxUJ7gB5tb++ALMFoBbjIn6dT1hpUr/PQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q782AO+9bTIKECvw/xWLVQU4dpjmutfDlBehanmA35u3FpfHEE0pzwz3cpY5d0+w/
	 Gl6ut+fVctYudcqafX1QVR6nALHGal8wBZlpFjcO8e6IXIGuuWNleFn5Ehc7Q3frB/
	 2VbcWwyCGQDs1OdM7anb6FR79v0N8zFQVk/62wxE=
Date: Mon, 25 Nov 2024 18:04:49 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <h5hozek5zljqa62nnfqsse232xmdihfyqipsryw3tctu2lu7td@tsnd2s6lsv22>
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
 <20241121-imx219_fixes-v2-3-7b068a60ea40@ideasonboard.com>
 <npwwmrap6l3pfs6uuh5jxssrox5dp6h3bcvw4ihqqxrlhcmdks@vbyqxsakhlwg>
 <20241124033432.GF19573@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k3rnv7u34cbtcwra"
Content-Disposition: inline
In-Reply-To: <20241124033432.GF19573@pendragon.ideasonboard.com>


--k3rnv7u34cbtcwra
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
MIME-Version: 1.0

Hi Dave,

& Laurent, Jacopo,

On Nov 24, 2024 at 05:34:32 +0200, Laurent Pinchart wrote:
> On Fri, Nov 22, 2024 at 11:31:58AM +0100, Jacopo Mondi wrote:
> > On Thu, Nov 21, 2024 at 05:38:04PM +0530, Jai Luthra wrote:
> > > When the analog binning mode is used for high framerate operation,
> > > the pixel rate is effectively doubled. Account for this when setting =
up
> > > the pixel clock rate, and applying the vblank and exposure controls.
> > >
> > > The previous logic only used analog binning for 8-bit modes, but norm=
al
> > > binning limits the framerate on 10-bit 480p [1]. So with this patch we
> > > switch to using special binning (with 2x pixel rate) for all formats =
of
> > > 480p mode and 8-bit 1232p.
> > >
> > > To do this cleanly, re-introduce the book-keeping for which binning m=
ode
> > > is used with which resolution/format.
> >=20
> > I think the patch is correct, however this goes a bit in the opposite
> > direction of making the driver freely configurable. IOW the more we
> > store in modes, the harder it will become to freely configure the
> > sensor. I know there are different opinions on how much this is
> > actually an issue, with valid arguments on both sides, but as I recall
> > freely configurable was a goal of Laurent's series, let me cc him
> > explicitly.
>=20
> Correct. I would like the binning configuration to be computed by the
> driver, not hardcoded. Let's do better than this.
>=20

=46rom commit ef86447e775fb1f2ced00d4c7fff2c0a1c63f165 we know the special=
=20
"analog" 2x binning mode causes artefacts for RAW10 1640x1232 capture.=20
But it works (and is preferred due to higher pixelrate) for RAW10=20
640x480.

I did some experimentation with different resolutions, keeping format=20
set to RAW10, and analog binning always enabled.

Any width > 1624 causes same artefacts. And any width <=3D 1624 gives a=20
normal image. Height doesn't seem to matter.

Dave do you know somebody in Sony who can clarify why that is the case?

I am planning to send a v3 for this patch using width <=3D 1624 to decide=
=20
which binning mode to pick.

> > > [1]: https://github.com/raspberrypi/linux/issues/5493
> > >
> > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 138 ++++++++++++++++++++++++++++++-----=
----------
> > >  1 file changed, 94 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 970e6362d0ae3a9078daf337155e83d637bc1ca1..ec795569361987ae30bff=
234e97fa34600bf5975 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -149,6 +149,18 @@
> > >  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
> > >  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> > >
> > > +enum binning_mode {
> > > +	BINNING_NONE =3D IMX219_BINNING_NONE,
> > > +	BINNING_X2 =3D IMX219_BINNING_X2,
> > > +	BINNING_ANALOG_X2 =3D IMX219_BINNING_X2_ANALOG,
> > > +};
> > > +
> > > +enum binning_bit_depths {
> > > +	BINNING_IDX_8_BIT,
> > > +	BINNING_IDX_10_BIT,
> > > +	BINNING_IDX_MAX
> > > +};
> > > +
> > >  /* Mode : resolution and related config&values */
> > >  struct imx219_mode {
> > >  	/* Frame width */
> > > @@ -158,6 +170,9 @@ struct imx219_mode {
> > >
> > >  	/* V-timing */
> > >  	unsigned int vts_def;
> > > +
> > > +	/* binning mode based on format code */
> > > +	enum binning_mode binning[BINNING_IDX_MAX];
> > >  };
> > >
> > >  static const struct cci_reg_sequence imx219_common_regs[] =3D {
> > > @@ -293,24 +308,40 @@ static const struct imx219_mode supported_modes=
[] =3D {
> > >  		.width =3D 3280,
> > >  		.height =3D 2464,
> > >  		.vts_def =3D 3526,
> > > +		.binning =3D {
> > > +			[BINNING_IDX_8_BIT] =3D BINNING_NONE,
> > > +			[BINNING_IDX_10_BIT] =3D BINNING_NONE,
> > > +		},
> > >  	},
> > >  	{
> > >  		/* 1080P 30fps cropped */
> > >  		.width =3D 1920,
> > >  		.height =3D 1080,
> > >  		.vts_def =3D 1763,
> > > +		.binning =3D {
> > > +			[BINNING_IDX_8_BIT] =3D BINNING_NONE,
> > > +			[BINNING_IDX_10_BIT] =3D BINNING_NONE,
> > > +		},
> > >  	},
> > >  	{
> > >  		/* 2x2 binned 30fps mode */
> > >  		.width =3D 1640,
> > >  		.height =3D 1232,
> > >  		.vts_def =3D 1763,
> > > +		.binning =3D {
> > > +			[BINNING_IDX_8_BIT] =3D BINNING_ANALOG_X2,
> > > +			[BINNING_IDX_10_BIT] =3D BINNING_X2,
> > > +		},
> > >  	},
> > >  	{
> > >  		/* 640x480 30fps mode */
> > >  		.width =3D 640,
> > >  		.height =3D 480,
> > >  		.vts_def =3D 1763,
> > > +		.binning =3D {
> > > +			[BINNING_IDX_8_BIT] =3D BINNING_ANALOG_X2,
> > > +			[BINNING_IDX_10_BIT] =3D BINNING_ANALOG_X2,
> > > +		},
> > >  	},
> > >  };
> > >
> > > @@ -337,6 +368,9 @@ struct imx219 {
> > >
> > >  	/* Two or Four lanes */
> > >  	u8 lanes;
> > > +
> > > +	/* Binning mode */
> > > +	enum binning_mode binning;
> > >  };
> > >
> > >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > > @@ -362,6 +396,36 @@ static u32 imx219_get_format_code(struct imx219 =
*imx219, u32 code)
> > >  	return imx219_mbus_formats[i];
> > >  }
> > >
> > > +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *fo=
rmat)
> > > +{
> > > +	switch (format->code) {
> > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > +		return 8;
> > > +
> > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > +	default:
> > > +		return 10;
> > > +	}
> > > +}
> > > +
> > > +static int imx219_get_rate_factor(struct imx219 *imx219)
> > > +{
> > > +	switch (imx219->binning) {
> > > +	case BINNING_NONE:
> > > +	case BINNING_X2:
> > > +		return 1;
> > > +	case BINNING_ANALOG_X2:
> > > +		return 2;
> > > +	}
> > > +	return -EINVAL;
> > > +}
> > > +
> > >  /* -----------------------------------------------------------------=
------------
> > >   * Controls
> > >   */
> > > @@ -373,10 +437,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ct=
rl)
> > >  	struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
> > >  	const struct v4l2_mbus_framefmt *format;
> > >  	struct v4l2_subdev_state *state;
> > > +	int rate_factor;
> > >  	int ret =3D 0;
> > >
> > >  	state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> > >  	format =3D v4l2_subdev_state_get_format(state, 0);
> > > +	rate_factor =3D imx219_get_rate_factor(imx219);
> > >
> > >  	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > >  		int exposure_max, exposure_def;
> > > @@ -405,7 +471,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  		break;
> > >  	case V4L2_CID_EXPOSURE:
> > >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > > -			  ctrl->val, &ret);
> > > +			  ctrl->val / rate_factor, &ret);
> > >  		break;
> > >  	case V4L2_CID_DIGITAL_GAIN:
> > >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > > @@ -422,7 +488,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  		break;
> > >  	case V4L2_CID_VBLANK:
> > >  		cci_write(imx219->regmap, IMX219_REG_VTS,
> > > -			  format->height + ctrl->val, &ret);
> > > +			  (format->height + ctrl->val) / rate_factor, &ret);
> > >  		break;
> > >  	case V4L2_CID_HBLANK:
> > >  		cci_write(imx219->regmap, IMX219_REG_HTS,
> > > @@ -463,7 +529,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops=
 =3D {
> > >
> > >  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
> > >  {
> > > -	return (imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_=
RATE_4LANE;
> > > +	return ((imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE :
> > > +		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
> > >  }
> > >
> > >  /* Initialize control handlers */
> > > @@ -592,29 +659,12 @@ static int imx219_set_framefmt(struct imx219 *i=
mx219,
> > >  {
> > >  	const struct v4l2_mbus_framefmt *format;
> > >  	const struct v4l2_rect *crop;
> > > -	unsigned int bpp;
> > > -	u64 bin_h, bin_v;
> > > +	u32 bpp;
> > >  	int ret =3D 0;
> > >
> > >  	format =3D v4l2_subdev_state_get_format(state, 0);
> > >  	crop =3D v4l2_subdev_state_get_crop(state, 0);
> > > -
> > > -	switch (format->code) {
> > > -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > -		bpp =3D 8;
> > > -		break;
> > > -
> > > -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > -	default:
> > > -		bpp =3D 10;
> > > -		break;
> > > -	}
> > > +	bpp =3D imx219_get_format_bpp(format);
> > >
> > >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> > >  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > > @@ -625,28 +675,8 @@ static int imx219_set_framefmt(struct imx219 *im=
x219,
> > >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> > >  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> > >
> > > -	switch (crop->width / format->width) {
> > > -	case 1:
> > > -	default:
> > > -		bin_h =3D IMX219_BINNING_NONE;
> > > -		break;
> > > -	case 2:
> > > -		bin_h =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING=
_X2;
> > > -		break;
> > > -	}
> > > -
> > > -	switch (crop->height / format->height) {
> > > -	case 1:
> > > -	default:
> > > -		bin_v =3D IMX219_BINNING_NONE;
> > > -		break;
> > > -	case 2:
> > > -		bin_v =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING=
_X2;
> >=20
> > So if I got this right, another way of handling this would be to
> >=20
> > 		bin_v =3D (bpp =3D=3D 8 || (format->width =3D=3D 640 && format->heigh=
t =3D 480)
> >                       ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> >=20
> >=20
> > I'm not sure how much better this is, as then freely configure the
> > sensor at (random numbers) 720x480@10bpp would not use analog binning
> > while it might be beneficial. Actually knowing what analog mode is how
> > it shuold be used would help, but if I recall correctly it wasn't
> > clear from documentation or not fully clarified by Sony ?
> >=20
> > When it comes to scaling PIXEL_RATE, the above switch could be moved
> > to set_pad_format and store imx219->binning to be
> > 1) used here
> > 2) used in s_ctrl

Agreed, will move it to set_pad_format.

> >=20
> > like this patch does already.
> >=20
> > Opinions ?
> >=20
> > > -		break;
> > > -	}
> > > -
> > > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> > > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->binnin=
g, &ret);
> > > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->binnin=
g, &ret);
> > >
> > >  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> > >  		  format->width, &ret);
> > > @@ -851,6 +881,21 @@ static int imx219_set_pad_format(struct v4l2_sub=
dev *sd,
> > >  		int exposure_max;
> > >  		int exposure_def;
> > >  		int hblank;
> > > +		int pixel_rate;
> > > +
> > > +		/* Update binning mode based on format */
> > > +		switch (imx219_get_format_bpp(format)) {
> > > +		case 8:
> > > +			imx219->binning =3D mode->binning[BINNING_IDX_8_BIT];
> > > +			break;
> > > +
> > > +		case 10:
> > > +			imx219->binning =3D mode->binning[BINNING_IDX_10_BIT];
> > > +			break;
> > > +
> > > +		default:
> > > +			imx219->binning =3D BINNING_NONE;
> > > +		}
> > >
> > >  		/* Update limits and set FPS to default */
> > >  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > > @@ -879,6 +924,11 @@ static int imx219_set_pad_format(struct v4l2_sub=
dev *sd,
> > >  					 IMX219_PPL_MAX - mode->width,
> > >  					 1, IMX219_PPL_MIN - mode->width);
> > >  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > > +
> > > +		/* Scale the pixel rate based on the mode specific factor */
> > > +		pixel_rate =3D imx219_get_pixel_rate(imx219);
> > > +		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > > +					 pixel_rate, 1, pixel_rate);
> > >  	}
> > >
> > >  	return 0;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--k3rnv7u34cbtcwra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdEbukACgkQQ96R+SSa
cUXyGBAAgwfMgOe7rfHLeL40RCaFJ2n/yXadiGGv6mdA4wk/DtHia7IajQsBwtz2
Hmt/Gm1h+uzw3p7Vr1jAn1BUnPfnbOoBmPegIlK/Dr4GLPNEN9YmbpTUTMvpzdHn
0llh6YkCO8GdmjW2qxKw5BAOFjwRR1hFMJExZcjatJk5Zzr3Q6YGvBYxNWcgyBEq
NdnuaWIVdHYsnSHafcY64Pc6iDRx+YmvXVOg9VyN9f6GyRKtNWhSWG7zN4B9sY1n
orYT0M03aEsQ8NAfO4Qo2gxCXBsRxACsSESIBY1c+Zij6V7IKqcZe2RZzhcKz2/4
j+7fjakQgC/7Arx56oOH9CID1ScmlG4T6d1hzzu5hY4Ui2ReZxxirRYUB5mUgaX5
U0V3mR4LA3/ao9ynfPTtGN0worEE2ijWm3yeNlFqQ0pwVpTi1KwUEOgzjIZhIIew
emeHPCE76A0O9RVnFHu+QIC3yNRE0cKy+zaNVtN23Zf5DaanpG1cV9zBqmaUgVvn
m/JmfxQUzUtJqSENLaUyct5OLiDG8IAmzrJpkRkgICWUutoZsCAzstwRlVsiKGLc
vchjrSkugJPMBADoPwYyq2hLpFtdzOyqUDaKhsMPfxac4GZAJsbHTskjpcvx8Q+A
pCCao/XlXznx+SJLJq28/RnWUzvlCS1kgcCjvotfwSYT/OLLFX8=
=QtfA
-----END PGP SIGNATURE-----

--k3rnv7u34cbtcwra--

