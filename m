Return-Path: <linux-media+bounces-64352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iyBpB9kDKWqCOwMAu9opvQ
	(envelope-from <linux-media+bounces-64352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:27:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8581C6663E5
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:27:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Uu+k5BxJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64352-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64352-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEB06301B912
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FB5371CEE;
	Wed, 10 Jun 2026 06:27:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66083019BA
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:27:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072852; cv=none; b=D2bEBZZ98srf0+hGSHLR6JzSm2fgsv9tccoYUOL5KbIUltTi7yLtEhKPFvHhpJW02yFYfs3RMJkvh//4f/0r4muCqgHiXG3zIUJudtv0DLvOLxDPmM7Qyzf4Goxp+vetZWoUvFeZfUi69PetKvWO/ir0VncGagTrfpYeCeIquGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072852; c=relaxed/simple;
	bh=sgMB4niC3pFhSIO/DCUP02jmUHPdmuH6E1ntFSiHUZA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TkS3Mc8Jr7lfk/JaHruau+MhHeTbRIjKYd1ljyNdk2unrN++MS+TSO9/Aq4INi26B/tk7JzuktFKccymtBA69PLb8Vs3Ix71IWI0EfICzicAsWrcYxTeWs4HCFDg5pYTlcS8dp9fQIcLHvZbHWZPWX4GobrtmsUgHuqGSd/2aDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uu+k5BxJ; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60A0D517;
	Wed, 10 Jun 2026 08:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781072817;
	bh=sgMB4niC3pFhSIO/DCUP02jmUHPdmuH6E1ntFSiHUZA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Uu+k5BxJfsHsINXOWaFM64kdAK7ZdEc3hmTQ3tkWMVrsqdwiRDvSntOBM7LrMiuGS
	 oaKO8BxDPwmunG8zTkqIqUj5QIk5ixwuQWAw7LybUwY88TkIszRf9oCg+15FHvmyIf
	 wMZM09ilquQmefXubc11/5QdS3V+ZZs/Yi/CKMWI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntCcUgtmLxopBJncXJDXW-wp8Dupg0GdbDZhAv9Pe7S-tg@mail.gmail.com>
References: <20260609-imx219-pixelrate-v1-1-02359def6b41@ideasonboard.com> <CAPY8ntCcUgtmLxopBJncXJDXW-wp8Dupg0GdbDZhAv9Pe7S-tg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Drop the hack of doubling PIXEL_RATE
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 10 Jun 2026 11:57:21 +0530
Message-ID: <178107284167.1799417.15966261890414428461@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64352-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8581C6663E5

Hi Dave

Quoting Dave Stevenson (2026-06-09 23:51:09)
> Hi Jai
>=20
> Thanks for the patch
>=20
> On Tue, 9 Jun 2026 at 08:03, Jai Luthra <jai.luthra@ideasonboard.com> wro=
te:
> >
> > Doubling the PIXEL_RATE for the special analogue binning mode was always
> > a hack done to make the userspace framerate calculations happy, as the
> > sensor's PLL has always been unchanged.
> >
> > After analyzing the sensor behaviour with minimum possible values for
> > frame and line length for different binning modes, it is likely that the
> > sensor is doing averaging in the analogue domain for 4 pixels when the
> > special binning mode is used. So use that to model the userspace
> > blanking controls, instead of the hack of doubling the pixel rate.
>=20
> "Averaging 4 pixels" doesn't actually explain what is being done in
> order to make a model, and is very much educated guesswork as to what
> is going on.
>=20
> I'd suggest something like:
> When using the special analog binning mode the sensor requires that
> the Frame Length is programmed in units of 2lines, but it is still
> producing the same number of lines overall.
> The new raw sensor model requires that the pixel rate is fixed, so the
> approach of doubling the pixel rate when binning can't be adopted.
>=20
> There is sufficient range available in the Line Length register to
> halve the value computed and passed to userspace as V4L2_CID_HBLANK
> instead, and thereby keep the same pixel rate.
>=20

Ack

> > This has an additional benefit to make it easier to move to the new raw
> > sensor model, where we have to expose the sensor's frame length and line
> > length registers directly to the userspace through new controls, thus
> > requiring the pixel rate control to match the sensor read out.
> >
> > Whether those new controls should also scale to give userspace a
> > "correct" view of the sensor internals, as opposed to the sensor's
> > register programming model is left as a decision for later.
> >
> > Link: https://lore.kernel.org/all/178091757893.16054.458338927041225137=
9@freya/
> > Link: https://lore.kernel.org/all/20260409201501.975242-65-sakari.ailus=
@linux.intel.com/
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > This is a follow-up to the discussion done on Sakari's proposed fix for
> > the same issue:
> > https://lore.kernel.org/all/178091466607.16054.13972332068848565738@fre=
ya/
> >
> > Tested on Raspberry Pi 5 with libcamera, which can still hit the same
> > FPS ranges as before for both binned/non-binned modes.
> > ---
> >  drivers/media/i2c/imx219.c | 65 ++++++++++++++++++++++++++++++++++----=
--------
> >  1 file changed, 49 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 7da02ce5da15..534d9ba0588c 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -420,7 +420,33 @@ static void imx219_get_binning(struct v4l2_subdev_=
state *state, u8 *bin_h,
> >
> >  }
> >
> > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *sta=
te)
> > +/*
> > + * When doing the special binning the sensor does the averaging in the=
 analogue
> > + * domain (before ADC) for both H/V dimensions and reads out only a qu=
arter of
> > + * the pixels.
>=20
> This is phrased as a statement of fact when we don't know what it's
> actually doing.
>=20

Fair enough, I'll switch it out in v2.

> > The sensor programming model convolutes this by never changing
> > + * the line length values and expecting frame length to be in units of=
 2xLines.
> > + *
> > + * FLL =3D (output height + vblank) / 2
> > + *
> > + * If we go ahead with it and set `vblank =3D FLL - height` it would m=
ake the
> > + * control value negative.
> > + *
> > + * So we instead keep the userspace sane by adjusting the blanking con=
trols to
> > + * match the sensor read-out instead of the broken register model.
> > + *
> > + * Thus compensate LLP in the other direction,
> > + *
> > + * LLP =3D (output width + hblank) * 2
> > + *
> > + * So the blanking values are:
> > + *
> > + * vblank =3D FLL * 2 - height
> > + * hblank =3D LLP / 2 - width
> > + *
> > + * where FLL and LLP are the values in the registers using the sensor
> > + * programming model.
> > + */
> > +static inline u32 imx219_get_fll_factor(struct v4l2_subdev_state *stat=
e)
> >  {
> >         u8 bin_h, bin_v;
> >
> > @@ -440,12 +466,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
> > @@ -478,7 +504,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_EXPOSURE:
> >                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -                         ctrl->val / rate_factor, &ret);
> > +                         ctrl->val / fll_factor, &ret);
> >                 break;
> >         case V4L2_CID_DIGITAL_GAIN:
> >                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -495,11 +521,11 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
> > @@ -884,6 +910,7 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
> >                 int exposure_def;
> >                 int hblank, llp_min;
> >                 int pixel_rate;
> > +               int fll_factor;
> >
> >                 /* Update limits and set FPS to default */
> >                 ret =3D __v4l2_ctrl_modify_range(imx219->vblank, IMX219=
_VBLANK_MIN,
>=20
> If being a real stickler, then vblank will have a step size of 2 when
> binning, aka fll_factor.
>=20

Good catch, will do.

> > @@ -910,20 +937,28 @@ static int imx219_set_pad_format(struct v4l2_subd=
ev *sd,
> >                         return ret;
> >
> >                 /*
> > -                * With analog binning the default minimum line length =
of 3448
> > -                * can cause artefacts with RAW10 formats, because the =
ADC
> > -                * operates on two lines together. So we switch to a hi=
gher
> > -                * minimum of 3560.
> > +                * With special analog binning the default minimum line=
 length
> > +                * of 3448 can cause artefacts with RAW10 formats becau=
se the
> > +                * sensor is averaging 4 pixels in analogue domain as o=
pposed
> > +                * to just 2, increasing the minimum time to read it ou=
t.
> > +                *
> > +                * So we switch to a higher minimum of 3560.
> >                  */
> >                 imx219_get_binning(state, &bin_h, &bin_v);
> >                 llp_min =3D (bin_h & bin_v) =3D=3D IMX219_BINNING_X2_AN=
ALOG ?
> >                                   IMX219_BINNED_LLP_MIN : IMX219_LLP_MI=
N;
> > +
> > +               fll_factor =3D imx219_get_fll_factor(state);
> >                 ret =3D __v4l2_ctrl_modify_range(imx219->hblank,
> > -                                              llp_min - mode->width,
> > -                                              IMX219_LLP_MAX - mode->w=
idth, 1,
> > -                                              llp_min - mode->width);
> > +                                              (llp_min / fll_factor) -
> > +                                              mode->width,
> > +                                              (IMX219_LLP_MAX / fll_fa=
ctor) -
> > +                                              mode->width, 1,
> > +                                              (llp_min / fll_factor) -
> > +                                              mode->width);
> >                 if (ret)
> >                         return ret;
> > +
> >                 /*
> >                  * Retain PPL setting from previous mode so that the
> >                  * line time does not change on a mode change.
> > @@ -936,9 +971,7 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
> >                 if (ret)
> >                         return ret;
> >
> > -               /* Scale the pixel rate based on the mode specific fact=
or */
> > -               pixel_rate =3D imx219_get_pixel_rate(imx219) *
> > -                            imx219_get_rate_factor(state);
> > +               pixel_rate =3D imx219_get_pixel_rate(imx219);
> >                 ret =3D __v4l2_ctrl_modify_range(imx219->pixel_rate, pi=
xel_rate,
> >                                                pixel_rate, 1, pixel_rat=
e);
>=20
> pixel_rate now never changes, so there's no need to update it here.
>=20

Will do, and drop the member from struct imx219 now that we don't modify
it after init_controls.

> Overall I think I prefer the approach to that of negative blanking
> values, and it's pretty much the comments explaining it that are
> slightly awkwardly worded.
>=20
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20

Thanks for the tests.

> I do want to just confirm that the slowest frame rate hasn't been
> altered, but I don't think it has.
>=20

I checked on 3280x2464 and 1640x1232 and same FPS range is possible with
libcamera on a Pi 5 even though the horizontal blanking range has changed
for the binned mode.

Thanks,
    Jai

>   Dave
>=20
> >                 if (ret)
> >
> > ---
> > base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> > change-id: 20260609-imx219-pixelrate-d6cc96558482
> >
> > Best regards,
> > --
> > Jai Luthra <jai.luthra@ideasonboard.com>
> >

