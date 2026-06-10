Return-Path: <linux-media+bounces-64380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5jMBOCAeKWrRQwMAu9opvQ
	(envelope-from <linux-media+bounces-64380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:19:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DEE66711F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:19:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=CHlWZRNh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64380-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64380-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D0043066780
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97FE3A4F30;
	Wed, 10 Jun 2026 08:13:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E53A453A
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079203; cv=none; b=E3yLjD/sk6nOeF7aR+FuNzHFQdzVSZA/jbfbSQXvwbdU5SJIIXM0iP9bmHnBi8k/pKxyq1WwgdpKiDKXbX0U4w51MNShBfxHKezEX7+CW95lCLp5350+0p3V9+LWYJEUSLpMNt1Gr2sOvNvnb2KD39c/+G1i1QZWEV3SQhNUQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079203; c=relaxed/simple;
	bh=hSXXsMm7U84+UjpjNoJtem7oYfMuUHlezKlHf6C4XPA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dVYqHD+1h34sgEXbpbvHj53MMIjX9XlhCBjUjRs/r1tThpY9ArSXqfbz0tnWGkOHrlDCHeWLNZrDb9tAifrtcayIZNUWQ56OurhbbqR5rrSNw0eOzDJIXGrhPzLlJf9kTEo0JBEJmvyy5AV9AGy6omhC2x7HYyjxNEuD2jX5mDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CHlWZRNh; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83B539D1;
	Wed, 10 Jun 2026 10:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781079171;
	bh=hSXXsMm7U84+UjpjNoJtem7oYfMuUHlezKlHf6C4XPA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CHlWZRNh32gPxb6BcD5zp+mOzSNW8DvoPduC6mE+WVa990ZPRPX4+/DTd81aePEgl
	 lMSHaDBaPvxzQEAWYQQmUGVN23nSXcwXI7xRZI/Mi8XUoXlyERDKlCYHEsXn7Eed7o
	 MVKNhvJf3vLNBrY2IUowWwXeIpHI7wxD7Knwe4mI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB1829E36CF8A24535254A09D78B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260610-imx219-pixelrate-v2-1-45d1d201cd6b@ideasonboard.com> <PN3P287MB1829E36CF8A24535254A09D78B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v2] media: i2c: imx219: Fix PIXEL_RATE for special binning mode
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Wed, 10 Jun 2026 13:43:14 +0530
Message-ID: <178107919437.1799417.4860337502728861947@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:tarang.raval@siliconsignals.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64380-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0DEE66711F

Hi Tarang,

Quoting Tarang Raval (2026-06-10 13:27:54)
> Hi Jai,
>=20
> > When using the special analog binning mode the sensor requires the frame
> > length to be programmed in units of 2xLines, but it still produces the
> > same number of lines overall.
> >
> > Earlier we used to double the pixel rate reported to userspace, to avoid
> > negative values for the vertical blanking control. But in the new raw
> > sensor model, we have to expose the sensor's frame length and line
> > length directly to the userspace through new controls, which requires we
> > keep the pixel rate value the same.
> >
> > There is sufficient range available in the line length register, so we
> > can halve the value computed and passed to userspace as V4L2_CID_HBLANK
> > instead, and thereby keep the same pixel rate.
> >
> > Whether the new controls for frame length and line length should also
> > scale similarly to give userspace a consistent view, as opposed to the
> > sensor's awkward register programming model, is left as a decision for
> > later.
> >
> > While at it, also drop the pixel_rate member from struct imx219 as we no
> > longer access or modify it. And simplify the hblank computation during
> > mode changes to default to the minimum value instead of trying to retain
> > the old line length. That would be unnecessarily complicated, and most
> > applications anyway modify the blankings freely to achieve their desired
> > framerate.
> >
> > Link: https://lore.kernel.org/all/178091757893.16054.458338927041225137=
9@freya/
> > Link: https://lore.kernel.org/all/20260409201501.975242-65-sakari.ailus=
@linux.intel.com/
> > Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > This is a follow-up to the discussion done on Sakari's proposed fix for
> > the same issue:
> > https://lore.kernel.org/all/178091466607.16054.13972332068848565738@fre=
ya/
> >
> > Tested on Raspberry Pi 5 with libcamera, which can still hit the same
> > FPS ranges as before for both binned and non-binned modes.
> > ---
> > Changes in v2:
> > - Set vblank step size to fll_factor
> > - Drop pixel_rate variable as we don't scale it anymore
> > - Use variables for new hblank and hblank_max values in set_pad_format
> > - Fix commit message and code comments with Dave's suggestions
> > - Set hblank to default value on mode change as opposed to retaining the
> >   LLP value set by user (Dave, I've kept your Tested-by, but please feel
> >                          free to drop it if you disagree)
> > - Link to v1: https://lore.kernel.org/r/20260609-imx219-pixelrate-v1-1-=
02359def6b41@ideasonboard.com
> > ---
> >  drivers/media/i2c/imx219.c | 104 ++++++++++++++++++++++++++-----------=
--------
> >  1 file changed, 61 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 7da02ce5da15..ec65349e63f9 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -348,7 +348,6 @@ struct imx219 {
> >
> >         struct v4l2_ctrl_handler ctrl_handler;
> >         /* V4L2 Controls */
> > -       struct v4l2_ctrl *pixel_rate;
> >         struct v4l2_ctrl *link_freq;
> >         struct v4l2_ctrl *exposure;
> >         struct v4l2_ctrl *vflip;
> > @@ -420,7 +419,30 @@ static void imx219_get_binning(struct v4l2_subdev_=
state *state, u8 *bin_h,
> >
> >  }
> >
> > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *sta=
te)
> > +/*
> > + * When using the special binning mode the sensor requires the FRAME_L=
ENGTH to
> > + * be programmed in units of 2xLines, but it still outputs the same nu=
mber of
> > + * lines overall.
> > + *
> > + * FRAME_LENGTH =3D (output height + vblank) / 2
> > + *
> > + * If we go ahead with it and set `vblank =3D FRAME_LENGTH - height` i=
t would
> > + * make the control value negative.
> > + *
> > + * Instead we can compensate for it in the horizontal dimension, as LI=
NE_LENGTH
> > + * has enough room, so both blanking values stay positive.
> > + *
> > + * LINE_LENGTH =3D (output width + hblank) * 2
> > + *
> > + * So the blanking values when using the special binning mode are:
> > + *
> > + * vblank =3D FRAME_LENGTH * 2 - height
> > + * hblank =3D LINE_LENGTH / 2 - width
> > + *
> > + * where FRAME_LENGTH and LINE_LENGTH are the values programmed in the=
 sensor
> > + * registers.
> > + */
> > +static inline u32 imx219_get_fll_factor(struct v4l2_subdev_state *stat=
e)
> >  {
> >         u8 bin_h, bin_v;
> >
> > @@ -440,12 +462,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
> >         const struct v4l2_mbus_framefmt *format;
> >         struct v4l2_subdev_state *state;
> > -       u32 rate_factor;
> > +       u32 fll_factor;
> >         int ret =3D 0;
> >
> >         state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> >         format =3D v4l2_subdev_state_get_format(state, 0);
> > -       rate_factor =3D imx219_get_rate_factor(state);
> > +       fll_factor =3D imx219_get_fll_factor(state);
> >
> >         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >                 int exposure_max, exposure_def;
> > @@ -478,7 +500,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_EXPOSURE:
> >                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -                         ctrl->val / rate_factor, &ret);
> > +                         ctrl->val / fll_factor, &ret);
> >                 break;
> >         case V4L2_CID_DIGITAL_GAIN:
> >                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -495,11 +517,11 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_VBLANK:
> >                 cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -                         (format->height + ctrl->val) / rate_factor, &=
ret);
> > +                         (format->height + ctrl->val) / fll_factor, &r=
et);
> >                 break;
> >         case V4L2_CID_HBLANK:
> >                 cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > -                         format->width + ctrl->val, &ret);
> > +                         (format->width + ctrl->val) * fll_factor, &re=
t);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN_RED:
> >                 cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> > @@ -555,11 +577,10 @@ static int imx219_init_controls(struct imx219 *im=
x219)
> >                 return ret;
> >
> >         /* By default, PIXEL_RATE is read only */
> > -       imx219->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctr=
l_ops,
> > -                                              V4L2_CID_PIXEL_RATE,
> > -                                              imx219_get_pixel_rate(im=
x219),
> > -                                              imx219_get_pixel_rate(im=
x219), 1,
> > -                                              imx219_get_pixel_rate(im=
x219));
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_PIXEL_R=
ATE,
> > +                         imx219_get_pixel_rate(imx219),
> > +                         imx219_get_pixel_rate(imx219), 1,
> > +                         imx219_get_pixel_rate(imx219));
> >
> >         imx219->link_freq =3D
> >                 v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
> > @@ -880,15 +901,19 @@ static int imx219_set_pad_format(struct v4l2_subd=
ev *sd,
> >         crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -               int exposure_max;
> > -               int exposure_def;
> > -               int hblank, llp_min;
> > -               int pixel_rate;
> > +               int exposure_max, exposure_def;
> > +               int llp_min, hblank, hblank_max;
> > +               u32 fll_factor =3D imx219_get_fll_factor(state);
> >
> > -               /* Update limits and set FPS to default */
> > +               /*
> > +                * Update VBLANK range and default value to match the m=
ode.
> > +                * Also fix the step-size to fll_factor, as we halve th=
e values
> > +                * before writing to the register when special binning =
is used.
> > +                */
> >                 ret =3D __v4l2_ctrl_modify_range(imx219->vblank, IMX219=
_VBLANK_MIN,
> > -                                              IMX219_FLL_MAX - mode->h=
eight, 1,
> > -                                              mode->fll_def - mode->he=
ight);
> > +                                              IMX219_FLL_MAX - mode->h=
eight,
> > +                                              fll_factor, mode->fll_de=
f -
> > +                                              mode->height);
>=20
> Do we need to update the exposure control step size to fll_factor as well?
>=20

Argh, yes. I'll wait for a couple of days for more comments and then send a
v3 with this fixed, and I also forgot to drop prev_line_len which is now
unused.

> Best Regards,
> Tarang
   =20
Thanks,
Jai

