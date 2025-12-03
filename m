Return-Path: <linux-media+bounces-48122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B4C9DF24
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 07:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984DF3A816D
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 06:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9928CF52;
	Wed,  3 Dec 2025 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s3BTL0u+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A635F3207;
	Wed,  3 Dec 2025 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744090; cv=none; b=I1ibaXVw+t59OKmmJh3K7c1k6ac5fm5Mgenwip85KH0F+D94F6ctvXlVOk/OuL3TykztYRoFdJOpw9haoUGIIrO0ZalSNOviU4zUm5/xzI+nAM35jDli7ekp1br6+K7plCOLQ3b5ZZ/k7cIRQ1JM8K5h8Zpu4ujWArYMarauyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744090; c=relaxed/simple;
	bh=0aFrg3MqzYPdjBCauoQA3qryzHF16AeGLG4VSivDR0Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=P5SayH1a06Cj+1RfC4i/XmDX7X2O7c4hMBfsjaJKJbHGS+OqF1Yb+dVfIjprBhg6kkiQodpEBLm6ZTEj451mcLdYBLUMsZ/6OEeywy7muTGRgvSlhNTRDbXlSamHcigkfERVismcEGgre6omyUeiJjpR4yH5u4B08s+ty/ZoShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s3BTL0u+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:14e0:17fd:e3c6:810:1656])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 355A9965;
	Wed,  3 Dec 2025 07:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764743943;
	bh=0aFrg3MqzYPdjBCauoQA3qryzHF16AeGLG4VSivDR0Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=s3BTL0u+p4LIwbvwx55ZPAIYuc++kSzKBjEEMLJ+/BNzHWkEs8hRy1Uv5G5hdeiz8
	 VveYW5TpEK8ITVtphvQtq3gXCSwhrGVmULOi9cflmV/SCiWlgS7+tlkL+I1Zx8QyvQ
	 U+3Mk44CdrrTFsq1wYPN+LRCxhUn/9UiPexXnQz0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <gla47pqyt6aan7fzr4eizm5ftyoc5s5u3dyh5u2fqbig7h2n6o@3lernf2jpswf>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com> <20251118-b4-rpi-ov5647-v2-9-5e78e7cb7f9b@ideasonboard.com> <gla47pqyt6aan7fzr4eizm5ftyoc5s5u3dyh5u2fqbig7h2n6o@3lernf2jpswf>
Subject: Re: [PATCH v2 09/16] media: i2c: ov5647: Support HFLIP and VFLIP
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 03 Dec 2025 12:11:12 +0530
Message-ID: <176474407271.1636185.12086100281205720721@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Jacopo

Quoting Jacopo Mondi (2025-12-01 20:45:27)
> Hi Jai
>=20
> On Tue, Nov 18, 2025 at 05:33:02PM +0530, Jai Luthra wrote:
> > From: David Plowman <david.plowman@raspberrypi.com>
> >
> > Add missing controls for horizontal and vertical flipping.
> >
> > The sensor readout mirrors in the horizontal direction by default (if
> > 0x3821[1] =3D 0) which can make things unnecessarily difficult for
> > applications. The register table prior to this commit was setting that
> > bit explicitly, to achieve a normally oriented image.
> >
> > Now that we have userspace controls for HFLIP, we keep the convention
> > and report the non-mirrored image (with 0x3821[1] =3D 1) as
> > horizontal_flip=3D0, and vice versa.
>=20
> I would drop this last part. This patch makes thing work "as
> expected", HFLIP=3D1 -> mirror, HFLIP=3D0 -> non mirror
>=20
> The fact we invert the control value to get the right register value
> might just be confusing to read here ?

I think if someone looks at the git blame years down the line, it might
help that the commit description states explicitly that register value is
the opposite of the control value, and it was an informed choice.

>=20
> >
> > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 86 ++++++++++++++++++++++++++++++++++++++=
++++----
> >  1 file changed, 79 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 5009fd8c05a64d7e06f66f8f75f0a881cd0b95c1..0343583692ab9bcca1a07d8=
74a707ac6093a9035 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -55,6 +55,8 @@
> >  #define OV5647_REG_GAIN_LO           0x350b
> >  #define OV5647_REG_VTS_HI            0x380e
> >  #define OV5647_REG_VTS_LO            0x380f
> > +#define OV5647_REG_TIMING_TC_V               0x3820
> > +#define OV5647_REG_TIMING_TC_H               0x3821
> >  #define OV5647_REG_FRAME_OFF_NUMBER  0x4202
> >  #define OV5647_REG_MIPI_CTRL00               0x4800
> >  #define OV5647_REG_MIPI_CTRL14               0x4814
> > @@ -120,6 +122,8 @@ struct ov5647 {
> >       struct v4l2_ctrl                *hblank;
> >       struct v4l2_ctrl                *vblank;
> >       struct v4l2_ctrl                *exposure;
> > +     struct v4l2_ctrl                *hflip;
> > +     struct v4l2_ctrl                *vflip;
> >  };
> >
> >  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > @@ -161,7 +165,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] =
=3D {
> >       {0x3036, 0x69},
> >       {0x303c, 0x11},
> >       {0x3106, 0xf5},
> > -     {0x3821, 0x06},
> > +     {0x3821, 0x00},
> >       {0x3820, 0x00},
> >       {0x3827, 0xec},
> >       {0x370c, 0x03},
> > @@ -250,7 +254,7 @@ static struct regval_list ov5647_1080p30_10bpp[] =
=3D {
> >       {0x3036, 0x62},
> >       {0x303c, 0x11},
> >       {0x3106, 0xf5},
> > -     {0x3821, 0x06},
> > +     {0x3821, 0x00},
> >       {0x3820, 0x00},
> >       {0x3827, 0xec},
> >       {0x370c, 0x03},
> > @@ -414,7 +418,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] =
=3D {
> >       {0x4800, 0x24},
> >       {0x3503, 0x03},
> >       {0x3820, 0x41},
> > -     {0x3821, 0x07},
> > +     {0x3821, 0x01},
> >       {0x350a, 0x00},
> >       {0x350b, 0x10},
> >       {0x3500, 0x00},
> > @@ -430,7 +434,7 @@ static struct regval_list ov5647_640x480_10bpp[] =
=3D {
> >       {0x3035, 0x11},
> >       {0x3036, 0x46},
> >       {0x303c, 0x11},
> > -     {0x3821, 0x07},
> > +     {0x3821, 0x01},
>=20
> So we now mirror by default (HFLIP=3D1). See below at controls
> initialization

Ah this is unintentional, we don't mirror by default. All control values
get applied when sensor wakes up on .s_stream, and BIT(1) here gets written
as our default control value is hflip=3D0 (which is intended).

But I agree this is confusing, so I will fix the register table value to
match the control value in next revision.

>=20
> >       {0x3820, 0x41},
> >       {0x370c, 0x03},
> >       {0x3612, 0x59},
> > @@ -956,6 +960,26 @@ static const struct v4l2_subdev_video_ops ov5647_s=
ubdev_video_ops =3D {
> >       .s_stream =3D             ov5647_s_stream,
> >  };
> >
> > +/*
> > + * This function returns the mbus code for the current settings of the=
 HFLIP
> > + * and VFLIP controls.
> > + */
> > +static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd)
> > +{
> > +     struct ov5647 *sensor =3D to_sensor(sd);
> > +     /* The control values are only 0 or 1. */
> > +     int index =3D  sensor->hflip->val | (sensor->vflip->val << 1);
> > +
> > +     static const u32 codes[4] =3D {
> > +             MEDIA_BUS_FMT_SGBRG10_1X10,
> > +             MEDIA_BUS_FMT_SBGGR10_1X10,
> > +             MEDIA_BUS_FMT_SRGGB10_1X10,
> > +             MEDIA_BUS_FMT_SGRBG10_1X10
> > +     };
> > +
> > +     return codes[index];
> > +}
> > +
> >  static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
> >                                struct v4l2_subdev_state *sd_state,
> >                                struct v4l2_subdev_mbus_code_enum *code)
> > @@ -963,7 +987,7 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev=
 *sd,
> >       if (code->index > 0)
> >               return -EINVAL;
> >
> > -     code->code =3D MEDIA_BUS_FMT_SBGGR10_1X10;
> > +     code->code =3D ov5647_get_mbus_code(sd);
> >
> >       return 0;
> >  }
> > @@ -974,7 +998,7 @@ static int ov5647_enum_frame_size(struct v4l2_subde=
v *sd,
> >  {
> >       const struct v4l2_mbus_framefmt *fmt;
> >
> > -     if (fse->code !=3D MEDIA_BUS_FMT_SBGGR10_1X10 ||
> > +     if (fse->code !=3D ov5647_get_mbus_code(sd) ||
> >           fse->index >=3D ARRAY_SIZE(ov5647_modes))
> >               return -EINVAL;
> >
> > @@ -1007,6 +1031,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev =
*sd,
> >       }
> >
> >       *fmt =3D *sensor_format;
> > +     /* The code we pass back must reflect the current h/vflips. */
> > +     fmt->code =3D ov5647_get_mbus_code(sd);
> >       mutex_unlock(&sensor->lock);
> >
> >       return 0;
> > @@ -1054,6 +1080,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev =
*sd,
> >                                        exposure_def);
> >       }
> >       *fmt =3D mode->format;
> > +     /* The code we pass back must reflect the current h/vflips. */
> > +     fmt->code =3D ov5647_get_mbus_code(sd);
> >       mutex_unlock(&sensor->lock);
> >
> >       return 0;
> > @@ -1229,6 +1257,36 @@ static int ov5647_s_exposure(struct v4l2_subdev =
*sd, u32 val)
> >       return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
> >  }
> >
> > +static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
> > +{
> > +     int ret;
> > +     u8 reg_val;
>=20
> nit: invert the declaration order
>=20
> > +
> > +     /*
> > +      * TIMING TC REG20 (Vertical) and REG21 (Horizontal):
> > +      * - [2]:       ISP mirror/flip
> > +      * - [1]:       Sensor mirror/flip
> > +      *
> > +      * We only use sensor flip.
> > +      *
> > +      * Using ISP flip retains the BGGR pattern at the cost of changin=
g the
> > +      * pixel array readout. This affects the selection rectangles in =
ways
> > +      * that are not very well documented, and would be tougher to dea=
l with
> > +      * for applications compared to reading a different bayer pattern.
>=20
> Nice you reported this
>=20
> > +      */
> > +     ret =3D ov5647_read(sd, reg, &reg_val);
> > +     if (ret =3D=3D 0) {
>=20
> isn't it easier:
>=20
>         if (ret)
>                 return ret;
>=20
>=20
> > +             if (ctrl_val)
> > +                     reg_val |=3D BIT(1);
> > +             else
> > +                     reg_val &=3D ~BIT(1);
> > +
> > +             ret =3D ov5647_write(sd, reg, reg_val);
>=20
>         return ov5647_write(sd, reg, val ? reg_val | BIT(1)
>                                          : reg_val &=3D ~BIT(1));
>=20

Indeed, will do.

> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >  static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >       struct ov5647 *sensor =3D container_of(ctrl->handler,
> > @@ -1291,6 +1349,14 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >               /* Read-only, but we adjust it based on mode. */
> >               break;
> >
> > +     case V4L2_CID_HFLIP:
> > +             /* There's an in-built hflip in the sensor, so account fo=
r that here. */
> > +             ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             ov5647_s_flip(sd, OV5647_REG_TIMING_TC_V, ctrl->val);
> > +             break;
> > +
> >       default:
> >               dev_info(&client->dev,
> >                        "Control (id:0x%x, val:0x%x) not supported\n",
> > @@ -1324,7 +1390,7 @@ static int ov5647_init_controls(struct ov5647 *se=
nsor)
> >       int hblank, exposure_max, exposure_def;
> >       struct device *dev =3D &client->dev;
> >
> > -     v4l2_ctrl_handler_init(&sensor->ctrls, 11);
> > +     v4l2_ctrl_handler_init(&sensor->ctrls, 13);
> >
> >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> >                         V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > @@ -1373,6 +1439,12 @@ static int ov5647_init_controls(struct ov5647 *s=
ensor)
> >                                    ARRAY_SIZE(ov5647_test_pattern_menu)=
 - 1,
> >                                    0, 0, ov5647_test_pattern_menu);
> >
> > +     sensor->hflip =3D v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_=
ops,
> > +                                       V4L2_CID_HFLIP, 0, 1, 1, 0);
>=20
> if now we mirror by default, should you initialize the control value
> to 1 ?
>=20

We don't mirror by default, I will fix the register table instead to avoid
confusion.

> Nits apart
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20

Thank you for the review!
    Jai

> Thanks
>   j
>=20
> > +
> > +     sensor->vflip =3D v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_=
ops,
> > +                                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> >       v4l2_fwnode_device_parse(dev, &props);
> >
> >       v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
> >
> > --
> > 2.51.1
> >

