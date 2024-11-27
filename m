Return-Path: <linux-media+bounces-22146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3E9DA4E5
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C11E7B25BC3
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91325193417;
	Wed, 27 Nov 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rna7kMF2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47207193060;
	Wed, 27 Nov 2024 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700244; cv=none; b=UaF+JMRjISHUtJSuhvB2j3A7sBrbLE7SbdT9HYJ9stoRACJKfr/q0elu0IKXnrotpST9D0Fx0dBL+gf5d8lRD2bm8c7S3AEtmxoaHk3nw8dSSJsIYvaJPbO+0UG4sjcb27WSPesFpB1tO/rT1LNqBYTu0dtxnB9SsyMYIkbw2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700244; c=relaxed/simple;
	bh=SQh5A74zeJ4kLZ2smIPegr1uRFLCN+SK/PXk4yOVJ0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuXGl0tHTuUs6TDjLY09nxKmdcDzUd+9zCRZ0Se/D7n/3UuMLqdgWZosFeVMYbkdpVhSCJ4j1DUy45nhZHfQYWjczp8ClUL7VQMMb+Dnzn1FlOM6ms3E1nr6qSQsIfQGAg/e1vvIS9HttqU34Bz6/MU2PUaqsc6svLG6xb5vNLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rna7kMF2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 546B0792;
	Wed, 27 Nov 2024 10:36:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732700217;
	bh=SQh5A74zeJ4kLZ2smIPegr1uRFLCN+SK/PXk4yOVJ0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rna7kMF2Ltekhn/FDz73kqMgCkAl+J/6L1T43/tyZYBrTFkKDTFRcxnsFiX9AG76X
	 Z99HXOU8HG6fb1UMR8DcO4dVNfwBM5OYk1MYhxkaeWK+hphyLWZ3GWNcKHln4xmlH2
	 Mc+eeMgRgtj+xBBU+19AykC+8OF1l7J7nl8j4Qgo=
Date: Wed, 27 Nov 2024 15:07:14 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <umnnd72lotwgm46bv43bn3vdvcuqxf3idurp63hbilosx3gs4o@gp63z27qtlxp>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
 <Z0Xc6FYyYdLTUfll@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vaciytpsagh4qsad"
Content-Disposition: inline
In-Reply-To: <Z0Xc6FYyYdLTUfll@kekkonen.localdomain>


--vaciytpsagh4qsad
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
MIME-Version: 1.0

Hi Sakari,

On Nov 26, 2024 at 14:36:24 +0000, Sakari Ailus wrote:
> Hi Jai,
>=20
> On Mon, Nov 25, 2024 at 08:36:27PM +0530, Jai Luthra wrote:
> > When the analog binning mode is used for high framerate operation,
> > the pixel rate is effectively doubled. Account for this when setting up
> > the pixel clock rate, and applying the vblank and exposure controls.
> >=20
> > The previous logic only used analog binning for 8-bit modes, but normal
> > binning limits the framerate on 10-bit 480p [1]. So with this patch we
> > switch to using special binning (with 2x pixel rate) for all formats of
> > 480p mode and 8-bit 1232p.
> >=20
> > [1]: https://github.com/raspberrypi/linux/issues/5493
> >=20
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 120 ++++++++++++++++++++++++++++---------=
--------
> >  1 file changed, 76 insertions(+), 44 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 970e6362d0ae3a9078daf337155e83d637bc1ca1..39b85cdee58318b080c867a=
fd68ca33d14d3eda7 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -149,6 +149,12 @@
> >  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
> >  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> > =20
> > +enum binning_mode {
> > +	BINNING_NONE =3D IMX219_BINNING_NONE,
> > +	BINNING_X2 =3D IMX219_BINNING_X2,
> > +	BINNING_ANALOG_X2 =3D IMX219_BINNING_X2_ANALOG,
> > +};
> > +
> >  /* Mode : resolution and related config&values */
> >  struct imx219_mode {
> >  	/* Frame width */
> > @@ -337,6 +343,10 @@ struct imx219 {
> > =20
> >  	/* Two or Four lanes */
> >  	u8 lanes;
> > +
> > +	/* Binning mode */
> > +	enum binning_mode bin_h;
> > +	enum binning_mode bin_v;
> >  };
> > =20
> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > @@ -362,6 +372,36 @@ static u32 imx219_get_format_code(struct imx219 *i=
mx219, u32 code)
> >  	return imx219_mbus_formats[i];
> >  }
> > =20
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
> > +	switch (imx219->bin_v) {
> > +	case BINNING_NONE:
> > +	case BINNING_X2:
> > +		return 1;
> > +	case BINNING_ANALOG_X2:
> > +		return 2;
>=20
> FWIW, what the CCS driver does is that it exposes different horizontal
> blanking ranges for devices that use analogue binning. The rate is really
> about reading pixels and with analogue binning the rate is the same, it's
> just that fewer pixels are being (digitally) read (as they are binned). I
> wonder if this would be a workable approach for this sensor, too. Of cour=
se
> if the LLP behaves differently for this sensor, then we should probably
> just accept that.
>=20

IMX219 seems to be odd in this case, as the LLP doesn't change during=20
analog binning. Shared some more details in this thread:

https://lore.kernel.org/linux-media/20241125-imx219_fixes-v3-0-434fc0b541c8=
@ideasonboard.com/T/#m1da4206e91db12b8e377dc686935195fc5f4bb68

> > +	}
> > +	return -EINVAL;
> > +}
> > +
> >  /* -------------------------------------------------------------------=
----------
> >   * Controls
> >   */
> > @@ -373,10 +413,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
> >  	const struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_subdev_state *state;
> > +	int rate_factor;
>=20
> u32?
>=20

Fixed.

> >  	int ret =3D 0;
> > =20
> >  	state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> >  	format =3D v4l2_subdev_state_get_format(state, 0);
> > +	rate_factor =3D imx219_get_rate_factor(imx219);
> > =20
> >  	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >  		int exposure_max, exposure_def;
> > @@ -405,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val, &ret);
> > +			  ctrl->val / rate_factor, &ret);
>=20
> Isn't the exposure in lines? It shouldn't be affected by the rate change,
> shouldn't it?
>=20

=46rom the sensor datasheet the unit of FRAME_LENGTH register is updated=20
to 2xLines when analog binning is used. And exposure and vertical=20
blanking values are also in units of FRAME_LENGTH. This is also=20
consistent with the behavior seen while testing.

> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -422,7 +464,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_VTS,
> > -			  format->height + ctrl->val, &ret);
> > +			  (format->height + ctrl->val) / rate_factor, &ret);
>=20
> The same for vertical blanking.
>=20
> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_HTS,
> > @@ -463,7 +505,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops =
=3D {
> > =20
> >  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
> >  {
> > -	return (imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RA=
TE_4LANE;
> > +	return ((imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE :
> > +		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
> >  }
> > =20
> >  /* Initialize control handlers */
> > @@ -592,29 +635,12 @@ static int imx219_set_framefmt(struct imx219 *imx=
219,
> >  {
> >  	const struct v4l2_mbus_framefmt *format;
> >  	const struct v4l2_rect *crop;
> > -	unsigned int bpp;
> > -	u64 bin_h, bin_v;
> > +	u32 bpp;
> >  	int ret =3D 0;
> > =20
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
> > =20
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> >  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > @@ -625,28 +651,8 @@ static int imx219_set_framefmt(struct imx219 *imx2=
19,
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> >  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> > =20
> > -	switch (crop->width / format->width) {
> > -	case 1:
> > -	default:
> > -		bin_h =3D IMX219_BINNING_NONE;
> > -		break;
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
> > -		break;
> > -	case 2:
> > -		bin_v =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X=
2;
> > -		break;
> > -	}
> > -
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->bin_h, &=
ret);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->bin_v, &=
ret);
>=20
> Please run:
>=20
> $ ./scripts/checkpatch.pl --strict --max-line-length=3D80
>=20

Oops, fixed in next revision.

> > =20
> >  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> >  		  format->width, &ret);
> > @@ -851,6 +857,27 @@ static int imx219_set_pad_format(struct v4l2_subde=
v *sd,
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int hblank;
> > +		int pixel_rate;
> > +		u32 bpp =3D imx219_get_format_bpp(format);
> > +		enum binning_mode binning =3D BINNING_NONE;
> > +
> > +		/*
> > +		 * For 8-bit formats, analog horizontal binning is required,
> > +		 * else the output image is garbage.
> > +		 * For 10-bit formats, analog horizontal binning is optional,
> > +		 * but still useful as it doubles the effective framerate.
> > +		 * We can only use it with width <=3D 1624, as for higher values
> > +		 * there are blocky artefacts.
>=20
> This comment would benefit from rewrapping.
>=20

Fixed.

> > +		 *
> > +		 * Vertical binning should match the horizontal binning mode.
> > +		 */
> > +		if (bin_h =3D=3D 2 && (format->width <=3D 1624 || bpp =3D=3D 8))
> > +			binning =3D BINNING_ANALOG_X2;
> > +		else
> > +			binning =3D BINNING_X2;
> > +
> > +		imx219->bin_h =3D (bin_h =3D=3D 2) ? binning : BINNING_NONE;
> > +		imx219->bin_v =3D (bin_v =3D=3D 2) ? binning : BINNING_NONE;
>=20
> It'd be also nice to move the state information to sub-device state.
>=20

I'm not sure I follow, do you mean the framework should store the=20
binning mode, similar to how crop rectangle and interval are stored in=20
v4l2_subdev_state?

> > =20
> >  		/* Update limits and set FPS to default */
> >  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > @@ -879,6 +906,11 @@ static int imx219_set_pad_format(struct v4l2_subde=
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
> > =20
> >  	return 0;
> >=20
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Thanks,
Jai

--vaciytpsagh4qsad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdG6EoACgkQQ96R+SSa
cUXAKhAAzNTmYpcYfeU5K+wMywjLP91wbN4f+4vfUmDonuWjpvBOx16NlH8JnapY
/k2KQ7ZsgQtKbkboH1eQa5wWpBLlvxOGfWUsro/NoacDT+9ASt8JZvyoBzAfTU6U
TIzDF9cFYxpUG6Dm/KVNDmggtdnx3ShYrsBP+CoOoiPhqhtFMp9j20wFDo3ILvrI
lwZUlDVikvOYZvjLHOLfqgUECLxgLRCPZoDF6yv7GoxBcxwjhXfwJ+tOd6lLTnwV
8o8gIW6MXpmHer0gYw3Lk2mrUCAxEjwvui5a+RZybkPAB3uH1cZEuiOAPdQ1ZJO6
fZbHegx1FEzveOQyYkSyxhtZvJS9fWpN+ufy73o5Lwn8+AabEL4mUOi4/e//EkA1
/rscX+HeDq7LFOyL1NOwoSsQ8M0yU7mbKfrbbKxdOqWeTXZNZZg7DVKvhKZ8+dJ1
jLLoac2cUGtqcFmrYQAWpqZnp8ht0MBEaVS4P7+LjbpYPAy904BK6FaUNpAyiAlU
saGVobn+/7mjA8kBSyQ5gqlENfdyRnnzNc9g9LUw34p1gjyUzFkQ2MfXku6gfiOB
FacDn5Rh8Soas/VbCJ0pouHVsJnH8FS4DWxQgaCKheGZKIlxZX5ekm1kSF2A0CQG
1JgNiqfjQSfcudFprLW9c5QzbGb7nicLbam2ZQ2B4j3W09euX8A=
=sIAJ
-----END PGP SIGNATURE-----

--vaciytpsagh4qsad--

