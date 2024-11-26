Return-Path: <linux-media+bounces-22069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE6F9D939B
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B3916724D
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355BF1B0F26;
	Tue, 26 Nov 2024 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K+Vl6KWF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3013C3F6;
	Tue, 26 Nov 2024 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611294; cv=none; b=iTj8hQ2IHl8ft1uFRrokKYpr1hDWS9ISbHhW9oHI00+BbSUloMzFNQiq1y1ygIZq3k3P5ZrvaKybmCibBeRtebuYzlgNZUT1cG961WLzKNclGBHFMVtblTVjj2tMg7RB6dkms1xgrSrh/cimwEzv9xMB73q0UeUN8JAhtSRi2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611294; c=relaxed/simple;
	bh=jxsZyKN8oqJKqHK7ZX/E9+3hoxUlbUB0V7EsScgVeAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ino0sgBy/oAWlF6MvufRGKDcXqYa6yFL4nueRnVbt/H+XR/wBGIPFXnIoGIJ9T4OlUz8VkTP7v5NQ/9zyxcYCzXQjOcjUERJSJQU06Nd8YW/EUi06J7rf3hjIu5sfsxm0flw1vrizwoMJGDUJ5/aiR1WK76v80gtBO4zLCegl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K+Vl6KWF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 169FCB63;
	Tue, 26 Nov 2024 09:54:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732611268;
	bh=jxsZyKN8oqJKqHK7ZX/E9+3hoxUlbUB0V7EsScgVeAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+Vl6KWF61N4G3kew/5RAXcFlgSCoxP9QK0eioW1QDqhcJr6a3GZOOo5v5++u7azY
	 ZZEk8gvg1TVL/ew7fw4LpvYdIJHPb3NCpbRF+/JvvNDF37ZdER6PcJXyLC50H0wRDV
	 yk4bGUfMQsdZPIqsEoQX+/vqLzloEb/+R4eUNyyA=
Date: Tue, 26 Nov 2024 14:24:44 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <zla2sogd7ov3yz2k2je6zrgh3uzeermowlaixt3qkcioturppo@tswbw354tpdk>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
 <CAPY8ntDeHCHtM6O5iDvnXJSx9AcKw2C8HA6B4Fn2mObaH7URGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3eos7dmtsdagw2u"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDeHCHtM6O5iDvnXJSx9AcKw2C8HA6B4Fn2mObaH7URGg@mail.gmail.com>


--v3eos7dmtsdagw2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
MIME-Version: 1.0

Hi Dave,

On Nov 25, 2024 at 18:40:50 +0000, Dave Stevenson wrote:
> Hi Jai
>=20
> On Mon, 25 Nov 2024 at 15:07, Jai Luthra <jai.luthra@ideasonboard.com> wr=
ote:
> >
> > When the analog binning mode is used for high framerate operation,
> > the pixel rate is effectively doubled. Account for this when setting up
> > the pixel clock rate, and applying the vblank and exposure controls.
> >
> > The previous logic only used analog binning for 8-bit modes, but normal
> > binning limits the framerate on 10-bit 480p [1]. So with this patch we
> > switch to using special binning (with 2x pixel rate) for all formats of
> > 480p mode and 8-bit 1232p.
> >
> > [1]: https://github.com/raspberrypi/linux/issues/5493
> >
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 120 ++++++++++++++++++++++++++++---------=
--------
> >  1 file changed, 76 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 970e6362d0ae3a9078daf337155e83d637bc1ca1..39b85cdee58318b080c867a=
fd68ca33d14d3eda7 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -149,6 +149,12 @@
> >  #define IMX219_PIXEL_ARRAY_WIDTH       3280U
> >  #define IMX219_PIXEL_ARRAY_HEIGHT      2464U
> >
> > +enum binning_mode {
> > +       BINNING_NONE =3D IMX219_BINNING_NONE,
> > +       BINNING_X2 =3D IMX219_BINNING_X2,
> > +       BINNING_ANALOG_X2 =3D IMX219_BINNING_X2_ANALOG,
> > +};
> > +
> >  /* Mode : resolution and related config&values */
> >  struct imx219_mode {
> >         /* Frame width */
> > @@ -337,6 +343,10 @@ struct imx219 {
> >
> >         /* Two or Four lanes */
> >         u8 lanes;
> > +
> > +       /* Binning mode */
> > +       enum binning_mode bin_h;
> > +       enum binning_mode bin_v;
> >  };
> >
> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > @@ -362,6 +372,36 @@ static u32 imx219_get_format_code(struct imx219 *i=
mx219, u32 code)
> >         return imx219_mbus_formats[i];
> >  }
> >
> > +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *form=
at)
> > +{
> > +       switch (format->code) {
> > +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +               return 8;
> > +
> > +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +       default:
> > +               return 10;
> > +       }
> > +}
> > +
> > +static int imx219_get_rate_factor(struct imx219 *imx219)
> > +{
> > +       switch (imx219->bin_v) {
> > +       case BINNING_NONE:
> > +       case BINNING_X2:
> > +               return 1;
> > +       case BINNING_ANALOG_X2:
> > +               return 2;
> > +       }
> > +       return -EINVAL;
> > +}
> > +
> >  /* -------------------------------------------------------------------=
----------
> >   * Controls
> >   */
> > @@ -373,10 +413,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
> >         const struct v4l2_mbus_framefmt *format;
> >         struct v4l2_subdev_state *state;
> > +       int rate_factor;
> >         int ret =3D 0;
> >
> >         state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> >         format =3D v4l2_subdev_state_get_format(state, 0);
> > +       rate_factor =3D imx219_get_rate_factor(imx219);
> >
> >         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >                 int exposure_max, exposure_def;
> > @@ -405,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_EXPOSURE:
> >                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -                         ctrl->val, &ret);
> > +                         ctrl->val / rate_factor, &ret);
> >                 break;
> >         case V4L2_CID_DIGITAL_GAIN:
> >                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -422,7 +464,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_VBLANK:
> >                 cci_write(imx219->regmap, IMX219_REG_VTS,
> > -                         format->height + ctrl->val, &ret);
> > +                         (format->height + ctrl->val) / rate_factor, &=
ret);
> >                 break;
> >         case V4L2_CID_HBLANK:
> >                 cci_write(imx219->regmap, IMX219_REG_HTS,
> > @@ -463,7 +505,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops =
=3D {
> >
> >  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
> >  {
> > -       return (imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE : IMX219_PI=
XEL_RATE_4LANE;
> > +       return ((imx219->lanes =3D=3D 2) ? IMX219_PIXEL_RATE :
> > +               IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx21=
9);
>=20
> This feels wrong.
> imx219_get_rate_factor will return the factor based on vertical
> binning. I would have expected the pixel rate to change based on
> horizontal binning.
> You'd need a mode which uses different binning modes in each direction
> to verify that though.
>=20

I did tests with only vertically-binned and only horizontally-binned=20
modes, and the framerate captured seemed to indicate that analog binning=20
only changes the pixelrate when it is vertically binned.

With the following driver change on top of my series:

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 39b85cdee583..38039847ded5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -312,6 +312,16 @@ static const struct imx219_mode supported_modes[] =3D {
                .height =3D 1232,
                .vts_def =3D 1763,
        },
+       {
+               .width =3D 3280,
+               .height =3D 1232,
+               .vts_def =3D 1763,
+       },
+       {
+               .width =3D 1624,
+               .height =3D 2464,
+               .vts_def =3D 1763,
+       },
        {
                /* 640x480 30fps mode */
                .width =3D 640,

If I configure the sensor to 1624 x 2464 it uses analog horizontal=20
binning and no vertical binning.

With the default vblank =3D 531 and hblank =3D 1824, it captures 17.66=20
frames/s [1]

182400000/((1624+1824)*(2464+531)) =3D 17.66

So the pixelrate seems to have stayed the same.

It's a stretch, but given that the datasheet mentions VTS unit is in=20
2-Lines when using analog binning mode and no change to the HTS unit, I=20
think the sensor must be taking the same time to read out a single line=20
of pixels irrespective of if they are binned digitally or not.

> (Updating exposure and vblank values based on vertical binning makes
> sense, as they are both in terms of lines).

Agreed, only the pixelrate seems unintuitive.

>=20
>   Dave
>=20
> >  }
> >
> >  /* Initialize control handlers */
> > @@ -592,29 +635,12 @@ static int imx219_set_framefmt(struct imx219 *imx=
219,
> >  {
> >         const struct v4l2_mbus_framefmt *format;
> >         const struct v4l2_rect *crop;
> > -       unsigned int bpp;
> > -       u64 bin_h, bin_v;
> > +       u32 bpp;
> >         int ret =3D 0;
> >
> >         format =3D v4l2_subdev_state_get_format(state, 0);
> >         crop =3D v4l2_subdev_state_get_crop(state, 0);
> > -
> > -       switch (format->code) {
> > -       case MEDIA_BUS_FMT_SRGGB8_1X8:
> > -       case MEDIA_BUS_FMT_SGRBG8_1X8:
> > -       case MEDIA_BUS_FMT_SGBRG8_1X8:
> > -       case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -               bpp =3D 8;
> > -               break;
> > -
> > -       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -       case MEDIA_BUS_FMT_SGRBG10_1X10:
> > -       case MEDIA_BUS_FMT_SGBRG10_1X10:
> > -       case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -       default:
> > -               bpp =3D 10;
> > -               break;
> > -       }
> > +       bpp =3D imx219_get_format_bpp(format);
> >
> >         cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> >                   crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > @@ -625,28 +651,8 @@ static int imx219_set_framefmt(struct imx219 *imx2=
19,
> >         cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> >                   crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1=
, &ret);
> >
> > -       switch (crop->width / format->width) {
> > -       case 1:
> > -       default:
> > -               bin_h =3D IMX219_BINNING_NONE;
> > -               break;
> > -       case 2:
> > -               bin_h =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX=
219_BINNING_X2;
> > -               break;
> > -       }
> > -
> > -       switch (crop->height / format->height) {
> > -       case 1:
> > -       default:
> > -               bin_v =3D IMX219_BINNING_NONE;
> > -               break;
> > -       case 2:
> > -               bin_v =3D bpp =3D=3D 8 ? IMX219_BINNING_X2_ANALOG : IMX=
219_BINNING_X2;
> > -               break;
> > -       }
> > -
> > -       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &re=
t);
> > -       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &re=
t);
> > +       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->bi=
n_h, &ret);
> > +       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->bi=
n_v, &ret);
> >
> >         cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> >                   format->width, &ret);
> > @@ -851,6 +857,27 @@ static int imx219_set_pad_format(struct v4l2_subde=
v *sd,
> >                 int exposure_max;
> >                 int exposure_def;
> >                 int hblank;
> > +               int pixel_rate;
> > +               u32 bpp =3D imx219_get_format_bpp(format);
> > +               enum binning_mode binning =3D BINNING_NONE;
> > +
> > +               /*
> > +                * For 8-bit formats, analog horizontal binning is requ=
ired,
> > +                * else the output image is garbage.
> > +                * For 10-bit formats, analog horizontal binning is opt=
ional,
> > +                * but still useful as it doubles the effective framera=
te.
> > +                * We can only use it with width <=3D 1624, as for high=
er values
> > +                * there are blocky artefacts.
> > +                *
> > +                * Vertical binning should match the horizontal binning=
 mode.
> > +                */
> > +               if (bin_h =3D=3D 2 && (format->width <=3D 1624 || bpp =
=3D=3D 8))
> > +                       binning =3D BINNING_ANALOG_X2;
> > +               else
> > +                       binning =3D BINNING_X2;
> > +
> > +               imx219->bin_h =3D (bin_h =3D=3D 2) ? binning : BINNING_=
NONE;
> > +               imx219->bin_v =3D (bin_v =3D=3D 2) ? binning : BINNING_=
NONE;
> >
> >                 /* Update limits and set FPS to default */
> >                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_=
MIN,
> > @@ -879,6 +906,11 @@ static int imx219_set_pad_format(struct v4l2_subde=
v *sd,
> >                                          IMX219_PPL_MAX - mode->width,
> >                                          1, IMX219_PPL_MIN - mode->widt=
h);
> >                 __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +               /* Scale the pixel rate based on the mode specific fact=
or */
> > +               pixel_rate =3D imx219_get_pixel_rate(imx219);
> > +               __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > +                                        pixel_rate, 1, pixel_rate);
> >         }
> >
> >         return 0;
> >
> > --
> > 2.47.0
> >

[1]:

- entity 41: imx219 1-0010 (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev4
        pad0: SOURCE
                [stream:0 fmt:SRGGB10_1X10/1624x2464 field:none colorspace:=
raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/3280x2464
                 crop:(24,8)/3248x2464]
                -> "csis-32e40000.csi":0 [ENABLED]

$ v4l2-ctl -d0 --stream-mmap
<<<<<<<<<<<<<<<<<<< 17.66 fps
<<<<<<<<<<<<<<<<<< 17.66 fps
<<<<^C

$ v4l2-ctl -d/dev/v4l-subdev4 -l | grep blanking
              vertical_blanking 0x009e0901 (int)    : min=3D32 max=3D64303 =
step=3D1 default=3D531 value=3D531
            horizontal_blanking 0x009e0902 (int)    : min=3D1824 max=3D3112=
8 step=3D1 default=3D1824 value=3D1824


Thanks,
Jai

--v3eos7dmtsdagw2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdFjNQACgkQQ96R+SSa
cUUX+Q//ernwAaDADbSjWBzGmKpj6r8kMvnbRIE4wvoezdUOc1x8m8gt7ZqGchj3
1X21PfoYY8ePJ84Hd9TW0tBKsA86RdvVJKxzop87gMDbFVxRXaHf7/y9Mbi/VZch
tE3wYpVSbkUDDTPwsuYsttNFeSXTDL/VqXLRqvreghcnvd63wEvt/BKPdEKF+7yb
jF/pcuY+0fzblUJt0raj4xPikzJ8wLFa/ICxP3XHSTmJPMveLtWnU7DAclhX1Mba
I2ePfWzuEdBVvX6dNBq5J7KRqK3+oDxjIvVwoLq9wwZOTgR6HBwy3onbc4H08vOy
4PQE8w/PPG8JDnhLvdF5mRVwoOOCZOb3EkE+tfy5P5f/272QGF+CqWkFuxFBjyaL
dLMapNn9KlRbfQl5OE/7NdJ8hENdcJQeuJqn8mtDNJAGgaRPsUt6AGO0nqu6MvzR
T4JKnZN1LdQpLOfJjOAPGtJA+NWzkO6cHzNM3q39P28mzud5hsvka5eRqjhCIqzu
K6KsAhCnc/LNdJ0le/Z40X/4ZPc7hXALqWbvkBgDY7uPGJqVJm0bA6vX7eDtwX/r
/mdXDPaffQmVShiHOPmHRIPZTsgFtz5RefTqe/04mTYbVWaBZZXcaDzW1mogQg9n
xIYMtkl27/0h58YFkmwYU0u2/vvyBcjIKiztqDTI/zbgtklrs/0=
=fwGh
-----END PGP SIGNATURE-----

--v3eos7dmtsdagw2u--

