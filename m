Return-Path: <linux-media+bounces-21718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDA09D47F7
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 07:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CD5FB219A2
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 06:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9681C7B64;
	Thu, 21 Nov 2024 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FKGkBEU8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E308314EC55;
	Thu, 21 Nov 2024 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171923; cv=none; b=HR8mZeO5q6DQOInK6TwJBlMZOr86f4dIGq6jpNTc5fTdhrWt6kjnnHapFw2y1+IkxSD7Lfx2y639kw/UZiSldPQxzDYzCO06WrCweCqjFmpez9HcZ7YFEx9GA9oNL83cr8o7uomPEp4z8Ae+y+8pMkbsYmJeE4wYRq6wRtI2zWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171923; c=relaxed/simple;
	bh=YgJMkIIeR/OD7ZBUj7by9c6o9e2+OmKxPw1PrKI/+UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SON3xLfiBJbVu4a39bZTAa4DQNIzP2oCmJW11mNX5yt3t5MGXByd/FzmITYBvcm6t+C+nZFg3tFTaLE2p65CZmgC4+GhTs0tOPfQnGtJgNHk091J1yXDTf2tkaLW0yV1GKJOMifAq3SUHQAY91tYn3hVYItEpNfXml1ChM+wkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FKGkBEU8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:10f2:5b4b:5292:ac46:e988])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC7DC219;
	Thu, 21 Nov 2024 07:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732171900;
	bh=YgJMkIIeR/OD7ZBUj7by9c6o9e2+OmKxPw1PrKI/+UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKGkBEU8DRGaTYxRIyb5WM7awU6wXQ53jujsiq10fLNQ+Boc3QYuGfWyaPRbvL26/
	 +rjPQkiLk1vBParqw3BNHPIVqagvJYo9GILVhKKi/3gB3so3OmV52Q1OroIMuTnDzY
	 XovjAGmLpuDvyp36yg2AL6j47TnQAvQ1zqXsN9aY=
Date: Thu, 21 Nov 2024 12:21:52 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx219: Scale the pixel rate for analog
 binning
Message-ID: <36iub5tnualpkuvkrvkl5ujrecdjrveewv7rqpeasxzjhqkn73@v5hzsy7qs6oh>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-3-b45dc3658b4e@ideasonboard.com>
 <zhr3qtslhjnfnt7eora2vh77luspbsu33r2dxxvuodrdsljbdc@dml43w33fhmu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5us2d46eiw4xwlz4"
Content-Disposition: inline
In-Reply-To: <zhr3qtslhjnfnt7eora2vh77luspbsu33r2dxxvuodrdsljbdc@dml43w33fhmu>


--5us2d46eiw4xwlz4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] media: i2c: imx219: Scale the pixel rate for analog
 binning
MIME-Version: 1.0

Hi Jacopo,

Thanks for the review.

On Nov 04, 2024 at 10:33:14 +0100, Jacopo Mondi wrote:
> Hello
>=20
> On Tue, Oct 29, 2024 at 02:27:37PM +0530, Jai Luthra wrote:
> > When the analog binning mode is used for high framerate operation,
> > the pixel rate is effectively doubled. Account for this when setting up
> > the pixel clock rate, and applying the vblank and exposure controls.
> >
> > The previous logic only used analog binning for 8-bit modes, but normal
> > binning limits the framerate on 10-bit 480p [1]. So with this patch we
> > switch to using special binning (with 2x pixel rate) for all formats of
> > 480p mode and 8-bit 1232p.
> >
> > To do this cleanly, re-introduce the book-keeping for which binning mode
> > is used with which resolution/format.
> >
> > [1]: https://github.com/raspberrypi/linux/issues/5493
> >
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 149 ++++++++++++++++++++++++++++++++-----=
--------
> >  1 file changed, 106 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index de9230d4ad81f085640be254db9391ae7ad20773..140d958f80eb57dfb4ecf17=
96fcdf77081a662d7 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -149,6 +149,18 @@
> >  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
> >  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> >
> > +enum binning_mode {
> > +	BINNING_NONE,
> > +	BINNING_X2,
> > +	BINNING_ANALOG_X2,
>=20
> You could assign to the enumerated values the corresponding values of
> IMX219_BINNING_... so that in imx219_set_framefmt() you could write
> imx219->binning directly
>=20

Will do.

> > +};
> > +
> > +enum binning_bit_depths {
> > +	BINNING_IDX_8_BIT,
> > +	BINNING_IDX_10_BIT,
> > +	BINNING_IDX_MAX
> > +};
> > +
> >  /* Mode : resolution and related config&values */
> >  struct imx219_mode {
> >  	/* Frame width */
> > @@ -158,6 +170,9 @@ struct imx219_mode {
> >
> >  	/* V-timing */
> >  	unsigned int vts_def;
> > +
> > +	/* binning mode based on format code */
> > +	enum binning_mode binning[BINNING_IDX_MAX];
> >  };
> >
> >  static const struct cci_reg_sequence imx219_common_regs[] =3D {
> > @@ -293,24 +308,40 @@ static const struct imx219_mode supported_modes[]=
 =3D {
> >  		.width =3D 3280,
> >  		.height =3D 2464,
> >  		.vts_def =3D 3526,
> > +		.binning =3D {
> > +			[BINNING_IDX_8_BIT] =3D BINNING_NONE,
> > +			[BINNING_IDX_10_BIT] =3D BINNING_NONE,
> > +		},
> >  	},
> >  	{
> >  		/* 1080P 30fps cropped */
> >  		.width =3D 1920,
> >  		.height =3D 1080,
> >  		.vts_def =3D 1763,
> > +		.binning =3D {
> > +			[BINNING_IDX_8_BIT] =3D BINNING_NONE,
> > +			[BINNING_IDX_10_BIT] =3D BINNING_NONE,
> > +		},
> >  	},
> >  	{
> >  		/* 2x2 binned 30fps mode */
> >  		.width =3D 1640,
> >  		.height =3D 1232,
> >  		.vts_def =3D 1763,
> > +		.binning =3D {
> > +			[BINNING_IDX_8_BIT] =3D BINNING_ANALOG_X2,
> > +			[BINNING_IDX_10_BIT] =3D BINNING_X2,
> > +		},
> >  	},
> >  	{
> >  		/* 640x480 30fps mode */
> >  		.width =3D 640,
> >  		.height =3D 480,
> >  		.vts_def =3D 1763,
> > +		.binning =3D {
> > +			[BINNING_IDX_8_BIT] =3D BINNING_ANALOG_X2,
> > +			[BINNING_IDX_10_BIT] =3D BINNING_ANALOG_X2,
> > +		},
> >  	},
> >  };
> >
> > @@ -337,6 +368,9 @@ struct imx219 {
> >
> >  	/* Two or Four lanes */
> >  	u8 lanes;
> > +
> > +	/* Binning mode */
> > +	enum binning_mode binning;
> >  };
> >
> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > @@ -362,6 +396,36 @@ static u32 imx219_get_format_code(struct imx219 *i=
mx219, u32 code)
> >  	return imx219_mbus_formats[i];
> >  }
> >
> > +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *form=
at)
> > +{
> > +	switch (format->code) {
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		return 8;
> > +
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	default:
> > +		return 10;
> > +	}
> > +}
> > +
> > +static int imx219_get_rate_factor(struct imx219 *imx219)
> > +{
> > +	switch (imx219->binning) {
> > +	case BINNING_NONE:
> > +	case BINNING_X2:
> > +		return 1;
> > +	case BINNING_ANALOG_X2:
> > +		return 2;
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> >  /* -------------------------------------------------------------------=
----------
> >   * Controls
> >   */
> > @@ -373,10 +437,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
> >  	const struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_subdev_state *state;
> > +	int rate_factor;
> >  	int ret =3D 0;
> >
> >  	state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> >  	format =3D v4l2_subdev_state_get_format(state, 0);
> > +	rate_factor =3D imx219_get_rate_factor(imx219);
> >
> >  	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >  		int exposure_max, exposure_def;
> > @@ -405,7 +471,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val, &ret);
> > +			  ctrl->val / rate_factor, &ret);
> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -422,7 +488,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_VTS,
> > -			  format->height + ctrl->val, &ret);
> > +			  (format->height + ctrl->val) / rate_factor, &ret);
>=20
> As noticed by Sakari, should hblank be similarly scaled ?
>=20

=46rom the datasheet, only the FRM_LENGTH_A (VTS) register unit changes to=
=20
2 x Lines when analog binning is used. LINE_LENGTH_A (HTS) always has=20
unit as Pixels.

Trying to scale it made the sensor not stream anything for analog binned=20
modes.

> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_HTS,
> > @@ -463,7 +529,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops =
=3D {
> >
> >  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
> >  {
> > -	return (imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RA=
TE_4LANE;
> > +	return ((imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE :
> > +		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
> >  }
> >
> >  /* Initialize control handlers */
> > @@ -473,7 +540,7 @@ static int imx219_init_controls(struct imx219 *imx2=
19)
> >  	const struct imx219_mode *mode =3D &supported_modes[0];
> >  	struct v4l2_ctrl_handler *ctrl_hdlr;
> >  	struct v4l2_fwnode_device_properties props;
> > -	int exposure_max, exposure_def, hblank;
> > +	int exposure_max, exposure_def, hblank, pixel_rate;
> >  	int i, ret;
> >
> >  	ctrl_hdlr =3D &imx219->ctrl_handler;
> > @@ -482,11 +549,11 @@ static int imx219_init_controls(struct imx219 *im=
x219)
> >  		return ret;
> >
> >  	/* By default, PIXEL_RATE is read only */
> > +	pixel_rate =3D imx219_get_pixel_rate(imx219);
> >  	imx219->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >  					       V4L2_CID_PIXEL_RATE,
> > -					       imx219_get_pixel_rate(imx219),
> > -					       imx219_get_pixel_rate(imx219), 1,
> > -					       imx219_get_pixel_rate(imx219));
> > +					       pixel_rate, pixel_rate, 1,
> > +					       pixel_rate);
>=20
> Is this change needed ?
>=20

Hmm I guess the compiler would optimize it, I'll revert it.

> >
> >  	imx219->link_freq =3D
> >  		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
> > @@ -593,29 +660,13 @@ static int imx219_set_framefmt(struct imx219 *imx=
219,
> >  {
> >  	const struct v4l2_mbus_framefmt *format;
> >  	const struct v4l2_rect *crop;
> > -	unsigned int bpp;
> > -	u64 bin_h, bin_v;
> > +	u64 binning;
>=20
> why u64 for a value that gets written to a 16 bits register ?
>=20

Dropped the variable altogether, now that enum stores the reg vals.

> > +	u32 bpp;
> >  	int ret =3D 0;
> >
> >  	format =3D v4l2_subdev_state_get_format(state, 0);
> >  	crop =3D v4l2_subdev_state_get_crop(state, 0);
> > -
> > -	switch (format->code) {
> > -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -		bpp =3D 8;
> > -		break;
> > -
> > -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -	default:
> > -		bpp =3D 10;
> > -		break;
> > -	}
> > +	bpp =3D imx219_get_format_bpp(format);
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> >  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > @@ -626,28 +677,20 @@ static int imx219_set_framefmt(struct imx219 *imx=
219,
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> >  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> >
> > -	switch (crop->width / format->width) {
> > -	case 1:
> > -	default:
> > -		bin_h =3D IMX219_BINNING_NONE;
> > +	switch (imx219->binning) {
> > +	case BINNING_NONE:
> > +		binning =3D IMX219_BINNING_NONE;
> >  		break;
> > -	case 2:
> > -		bin_h =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X=
2;
> > -		break;
> > -	}
> > -
> > -	switch (crop->height / format->height) {
> > -	case 1:
> > -	default:
> > -		bin_v =3D IMX219_BINNING_NONE;
> > +	case BINNING_X2:
> > +		binning =3D IMX219_BINNING_X2;
> >  		break;
> > -	case 2:
> > -		bin_v =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X=
2;
> > +	case BINNING_ANALOG_X2:
> > +		binning =3D IMX219_BINNING_X2_ANALOG;
> >  		break;
> >  	}
> >
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, binning, &ret);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, binning, &ret);
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> >  		  format->width, &ret);
> > @@ -851,6 +894,21 @@ static int imx219_set_pad_format(struct v4l2_subde=
v *sd,
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int hblank;
> > +		int pixel_rate;
> > +
> > +		/* Update binning mode based on format */
> > +		switch (imx219_get_format_bpp(format)) {
> > +		case 8:
> > +			imx219->binning =3D mode->binning[BINNING_IDX_8_BIT];
> > +			break;
> > +
> > +		case 10:
> > +			imx219->binning =3D mode->binning[BINNING_IDX_10_BIT];
> > +			break;
> > +
> > +		default:
> > +			imx219->binning =3D BINNING_NONE;
> > +		}
> >
> >  		/* Update limits and set FPS to default */
> >  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > @@ -879,6 +937,11 @@ static int imx219_set_pad_format(struct v4l2_subde=
v *sd,
> >  					 IMX219_PPL_MAX - mode->width,
> >  					 1, IMX219_PPL_MIN - mode->width);
> >  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +		/* Scale the pixel rate based on the mode specific factor */
> > +		pixel_rate =3D imx219_get_pixel_rate(imx219);
> > +		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > +					 pixel_rate, 1, pixel_rate);
> >  	}
> >
> >  	return 0;
> >
> > --
> > 2.47.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--5us2d46eiw4xwlz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmc+2IgACgkQQ96R+SSa
cUVnaA//cCh3jU0gBD5FKB9QpcPOVCdFnYTOXi5HGgmE8Qmx+JG+FR4APIkUS6/N
4iWNnVDGfOwM7b4sawf6XZv0LgHi3VjdGzoiRRcv5WnxsS2L7NfdivnFHH7RFfmn
RdqIDw9cgeBTOJjXsQWVhaPIma61ibCkXDCulR3gs1aqMdE2HYVA876m2Ka0k3EB
uAvn1haQdypr3Xh9n0V7vK6/PC+ONabVadobCMjyrDfvnGjzTkuyD7twK4znAz5a
QFKBgNOYpsfOd2lIDcV0WkxFMXRt9p93Enj7I+bPzU3w9OUN4WXG9NkRnDn006AV
sZk9Yi2ARKpcQQTfcKQTvWKFOYy6JEbwmQdaiMMKnCd/I1ef98LvnNo/iPTLoa+B
ignu4qyjcIBf9D8/KdB/ISPFb9HRcbFxa/xOhRyYnXkprv6igFsClQWBLzXTiA5+
MJOV/YjPU/ACQXD4lDSB8XhT+6hG8P8wN8UOE5Z4W3in7CVrjFR+Uc2wmh3DKqFK
5pHFT4HIZmG8IwwWh2NyXUVyxSeJTTLakeGwHYM/u5OczocXWb2amELyP+PybxWh
FZzhXzlzxoWEeFS21zIg4fh+g31S6AujEgmsRB44eMCGXb8721RW4DRqQacnhaC7
wPv6+SMpXr1VK7Z24mcmaMS3/O4GLN3+KKGQr7aPwY+4u26T9Vo=
=wX3U
-----END PGP SIGNATURE-----

--5us2d46eiw4xwlz4--

