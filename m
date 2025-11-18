Return-Path: <linux-media+bounces-47262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BFC68F03
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F38624E8C39
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B9633E377;
	Tue, 18 Nov 2025 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="co0Wp3wo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0656631D723;
	Tue, 18 Nov 2025 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463441; cv=none; b=Yp4W1OBoN1grE/uIeq/c+yuYllRC2cIAqB2uutHp/xj/hAheseiAzl/DCguJN6PHVIUfNaPrhGCHoH12dp6HqEx4MlF2I/VTbVdI1lGFDdG1zKcnHk+yKeUwohXbIJ2yZLYP01WVi0AojvSxPSZ1P6BMIixTFz7Ishp+PiGRtRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463441; c=relaxed/simple;
	bh=RSIWFx/SvMPdUNLuiE3ukb3/EJw/SXKL00UeU8a30ns=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rJhuv23CYgeTBXKpqKGmO/ZKFdNMbOTAVUavDCBrZPylqfW+5MqbkpnlXQgNhnegGNXYYZP3zT8MwKYgeRZoW9Gog7EaUyA5jeIuG7JwJl9S9zkT7t01j6L4RoyTr5THdUmR+bjjRvK7GNLPZ/9Elj5bl1qT/998XdUU1LFZLR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=co0Wp3wo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EE26BE4;
	Tue, 18 Nov 2025 11:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763463312;
	bh=RSIWFx/SvMPdUNLuiE3ukb3/EJw/SXKL00UeU8a30ns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=co0Wp3wojRmmFBtMUYQZYH+xyNMpRsHsd+4Cswydwh9/DQV4nfv9vT3K25eD6LCEe
	 hW3G7/Yii3V/+L01nKtgk5tzH09iVXah7jXBHOg8WuXEYSAjKi1cazcrZ4zhJiWANd
	 q1IbiPwIGTK5sOP/Cj1SSf3lWqjCL357jA8iV0EY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <maj7fvugwy25d4fny4km26yoed4o4zdggh3totbuatqu73qjs2@tllxhvjg7qey>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com> <20251028-b4-rpi-ov5647-v1-9-098413454f5e@ideasonboard.com> <maj7fvugwy25d4fny4km26yoed4o4zdggh3totbuatqu73qjs2@tllxhvjg7qey>
Subject: Re: [PATCH 09/13] media: i2c: ov5647: Add control of V4L2_CID_HBLANK
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 18 Nov 2025 16:27:10 +0530
Message-ID: <176346343076.268162.8926249825341031408@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Jacopo,

Thanks for the review.

Quoting Jacopo Mondi (2025-11-02 16:37:55)
> Hi Jai
>=20
> On Tue, Oct 28, 2025 at 12:57:20PM +0530, Jai Luthra wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > The driver did expose V4L2_CID_HBLANK, but as a READ_ONLY control.
> >
> > The sensor only uses the HTS register to control the line length,
> > so convert this control to read/write, with the appropriate ranges.
> > Adopt the old fixed values as the minimum values permitted in each
> > mode to avoid issues of it not streaming.
> >
> > This should allow exposure times up to ~3 seconds (up from ~1sec).
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 3aad3dc9b5cd0c24c07a37e2567e3c61c52e4fc2..59c21b91d09d79f073a5487=
1221f197a0bcf3aa2 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -53,6 +53,8 @@
> >  #define OV5647_REG_AEC_AGC           0x3503
> >  #define OV5647_REG_GAIN_HI           0x350a
> >  #define OV5647_REG_GAIN_LO           0x350b
> > +#define OV5647_REG_HTS_HI            0x380c
> > +#define OV5647_REG_HTS_LO            0x380d
> >  #define OV5647_REG_VTS_HI            0x380e
> >  #define OV5647_REG_VTS_LO            0x380f
> >  #define OV5647_REG_VFLIP             0x3820
> > @@ -79,6 +81,8 @@
> >  #define OV5647_VBLANK_MIN            24
> >  #define OV5647_VTS_MAX                       32767
> >
> > +#define OV5647_HTS_MAX                       0x1fff
> > +
> >  #define OV5647_EXPOSURE_MIN          4
> >  #define OV5647_EXPOSURE_STEP         1
> >  #define OV5647_EXPOSURE_DEFAULT              1000
> > @@ -187,8 +191,6 @@ static struct regval_list ov5647_2592x1944_10bpp[] =
=3D {
> >       {0x3a19, 0xf8},
> >       {0x3c01, 0x80},
> >       {0x3b07, 0x0c},
> > -     {0x380c, 0x0b},
> > -     {0x380d, 0x1c},
> >       {0x3814, 0x11},
> >       {0x3815, 0x11},
> >       {0x3708, 0x64},
> > @@ -276,8 +278,6 @@ static struct regval_list ov5647_1080p30_10bpp[] =
=3D {
> >       {0x3a19, 0xf8},
> >       {0x3c01, 0x80},
> >       {0x3b07, 0x0c},
> > -     {0x380c, 0x09},
> > -     {0x380d, 0x70},
> >       {0x3814, 0x11},
> >       {0x3815, 0x11},
> >       {0x3708, 0x64},
> > @@ -375,8 +375,6 @@ static struct regval_list ov5647_2x2binned_10bpp[] =
=3D {
> >       {0x3809, 0x10},
> >       {0x380a, 0x03},
> >       {0x380b, 0xcc},
> > -     {0x380c, 0x07},
> > -     {0x380d, 0x68},
> >       {0x3811, 0x0c},
> >       {0x3813, 0x06},
> >       {0x3814, 0x31},
> > @@ -450,8 +448,6 @@ static struct regval_list ov5647_640x480_10bpp[] =
=3D {
> >       {0x3a19, 0xf8},
> >       {0x3c01, 0x80},
> >       {0x3b07, 0x0c},
> > -     {0x380c, 0x07},
> > -     {0x380d, 0x3c},
> >       {0x3814, 0x35},
> >       {0x3815, 0x35},
> >       {0x3708, 0x64},
> > @@ -1061,7 +1057,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev =
*sd,
> >                                        mode->pixel_rate, 1, mode->pixel=
_rate);
> >
> >               hblank =3D mode->hts - mode->format.width;
> > -             __v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, =
1,
> > +             __v4l2_ctrl_modify_range(sensor->hblank, hblank,
> > +                                      OV5647_HTS_MAX - mode->format.wi=
dth, 1,
>=20
> Is '1' really the min ? Who knows the datasheet doesn't report that :(
>=20

I think 1 is set as the step value here, keeping the minimum equal to
default HTS - width (to be safe, as I presume the HTS values for a mode
come from the sensor manufacturer)

> >                                        hblank);
> >
> >               vblank =3D mode->vts - mode->format.height;
> > @@ -1325,6 +1322,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >               ret =3D ov5647_write16(sd, OV5647_REG_VTS_HI,
> >                                    sensor->mode->format.height + ctrl->=
val);
> >               break;
> > +     case V4L2_CID_HBLANK:
> > +             ret =3D ov5647_write16(sd, OV5647_REG_HTS_HI,
> > +                                  sensor->mode->format.width + ctrl->v=
al);
>=20
> Why are we writing HTS_HI only ? The max control value is set to
> 0x1fff, this spans two registers..
>=20

IIUC ov5647_write16 sends two bytes of data over I2C, where it auto
increments the address when writing the second byte.

> > +             break;
> >       case V4L2_CID_TEST_PATTERN:
> >               ret =3D ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> >                                  ov5647_test_pattern_val[ctrl->val]);
> > @@ -1332,7 +1333,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >
> >       /* Read-only, but we adjust it based on mode. */
> >       case V4L2_CID_PIXEL_RATE:
> > -     case V4L2_CID_HBLANK:
> >               /* Read-only, but we adjust it based on mode. */
>=20
> We really like this comment, at the point of repeating it twice...
>=20

Oops, you're right, I'll drop this in the cleanup commit for PIXEL_RATE
control.

> Speaking of which... if you set the ctrl_handler to NULL when
> registering a ro control
>=20
>         sensor->pixel_rate =3D v4l2_ctrl_new_std(&sensor->ctrls, NULL,
>                                                V4L2_CID_PIXEL_RATE,
>                                                sensor->mode->pixel_rate,
>                                                sensor->mode->pixel_rate, =
1,
>                                                sensor->mode->pixel_rate);
>=20
> you can remove the above 4 lines.
>=20
> (the background is that for RO controls the control_handler has to be
> set to NULL, to avoid having to handle them in the s_ctrl handler)
>=20
> Maybe add a patch to this series ?

Nice, will do!

>=20
> >               break;
> >
> > @@ -1409,10 +1409,11 @@ static int ov5647_init_controls(struct ov5647 *=
sensor, struct device *dev)
> >                                              sensor->mode->pixel_rate, =
1,
> >                                              sensor->mode->pixel_rate);
> >
> > -     /* By default, HBLANK is read only, but it does change per mode. =
*/
> >       hblank =3D sensor->mode->hts - sensor->mode->format.width;
> >       sensor->hblank =3D v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl=
_ops,
> > -                                        V4L2_CID_HBLANK, hblank, hblan=
k, 1,
> > +                                        V4L2_CID_HBLANK, hblank,
> > +                                        OV5647_HTS_MAX -
> > +                                        sensor->mode->format.width, 1,
> >                                          hblank);
> >
> >       sensor->vblank =3D v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl=
_ops,
> > @@ -1446,7 +1447,6 @@ static int ov5647_init_controls(struct ov5647 *se=
nsor, struct device *dev)
> >               goto handler_free;
> >
> >       sensor->pixel_rate->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > -     sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >       sensor->sd.ctrl_handler =3D &sensor->ctrls;
> >
> >       return 0;
> >
> > --
> > 2.51.0
> >

Thanks,
Jai

