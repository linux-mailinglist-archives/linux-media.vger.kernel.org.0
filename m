Return-Path: <linux-media+bounces-58838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CkoG8nK32nVYwAAu9opvQ
	(envelope-from <linux-media+bounces-58838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 19:28:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C22406CB1
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 19:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1D39315307F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B814D3E8C50;
	Wed, 15 Apr 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CjEdGEGN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E8372665
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776273343; cv=none; b=FO0V8oeiMqD7DvYOG7FKKf9MUEW96gk4j3zz7LU5lESN78R+N2g1i/bX2/iQA4+JN1mbCRnciQsIRBBk3ZoSiG5dT5SM/97TZ+UZ2hyXjbuVlFmJmkK2k84IbKJmom7B7+ZaTeYtqzMrxyha6jXqEI4bZqRR4A3fBdYcOo0I3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776273343; c=relaxed/simple;
	bh=O1F2775dG0lVDsjLYbSXZ5V9rA45ikM5Plx534YJoPM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QTABIdVy5PEjlv5FYfzDdmRWV/FMf1syaFO4T/VE6KRMWeeU4mVKRYr/yrpYqpjuABvtVLLkjSE5Efdg7Zk+SO0pDMhdauMka2Palo6I4fcx8xFtlLQEPfPwi7XE6SeKElCgbaGuHy7IcYO3M7h2e4RfmIvih4F6wu4QzR7chwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CjEdGEGN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:51df:7e0d:3bc9:3b1b:3f69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FA45DF3;
	Wed, 15 Apr 2026 19:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776273243;
	bh=O1F2775dG0lVDsjLYbSXZ5V9rA45ikM5Plx534YJoPM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CjEdGEGNjSmnNlB3Z5g/POzxgm+/FM7tFcmMxdgRPJJyKlwKx2svH0U7CKSZc5loF
	 0WdtxXxJXbvmWEmi45B0YGgS2gv5xOYmRdREaUvKBQ68AIkR3hqHL3L7vDTNItnElf
	 lX9yFYeSI6o0YTnzSVbHcMqMSEWgGLIeLTmo4xLg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260408153939.969381-6-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com> <20260408153939.969381-6-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 05/29] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen
  <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 15 Apr 2026 22:45:31 +0530
Message-ID: <177627333160.489396.4707310040596157667@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58838-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: C6C22406CB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-08 21:09:14)
> When vertical analogue binning is in use, the minimum frame length in
> lines decreases to around half of the normal. In relation to the sensor's
> output size this means vertical blanking can be negative but that's not an
> issue as control values are signed. Remove the workaround for this
> non-issue that doubled the pixel rate, frame length in lines and exposure
> time.
>=20
> The resulting change also fixes the minimum, the maximum and the step
> values for the control.
>=20
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog=
 binning")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6819a2fa3262..a72630ad1561 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_st=
ate *state, u8 *bin_h,
> =20
>  }
> =20
> -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
> -{
> -       u8 bin_h, bin_v;
> -
> -       imx219_get_binning(state, &bin_h, &bin_v);
> -
> -       return (bin_h & bin_v) =3D=3D IMX219_BINNING_X2_ANALOG ? 2 : 1;
> -}
> -
>  /* ---------------------------------------------------------------------=
--------
>   * Controls
>   */
> @@ -440,12 +431,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
>         const struct v4l2_mbus_framefmt *format;
>         struct v4l2_subdev_state *state;
> -       u32 rate_factor;
>         int ret =3D 0;
> =20
>         state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
>         format =3D v4l2_subdev_state_get_format(state, 0);
> -       rate_factor =3D imx219_get_rate_factor(state);
> =20
>         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
>                 int exposure_max, exposure_def;
> @@ -478,7 +467,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_EXPOSURE:
>                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> -                         ctrl->val / rate_factor, &ret);
> +                         ctrl->val, &ret);
>                 break;
>         case V4L2_CID_DIGITAL_GAIN:
>                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> @@ -495,7 +484,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_VBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> -                         (format->height + ctrl->val) / rate_factor, &re=
t);
> +                         format->height + ctrl->val, &ret);
>                 break;
>         case V4L2_CID_HBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> @@ -878,7 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *=
sd,
>         crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> =20
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> -               unsigned int rate_factor =3D imx219_get_rate_factor(state=
);
>                 int exposure_max;
>                 int exposure_def;
>                 int llp_min;
> @@ -886,15 +874,16 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
> =20
>                 /* Update limits and set FPS to default */
>                 ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> -                                              IMX219_VBLANK_MIN * rate_f=
actor,
> -                                              (IMX219_FLL_MAX - mode->he=
ight) *
> -                                              rate_factor, rate_factor,
> -                                              mode->fll_def - mode->heig=
ht);
> +                                              (int)(mode->height / binni=
ng),

This line seems to be the crux of the issue causing modes other than VGA to
not work, and also restricting the FPS.

Vertical blanking control is defined relative to the output height. While
the minimum value for FLL for analogue binning mode is:

    min_FLL =3D (mode->height / binning) + IMX219_VBLANK_MIN

So the minimum control value for vblank should be:

    vblank_min =3D min_FLL - mode->height

Making that change I get the correct range for VBLANK control that leads to
high FPS capture.

So we finally have something working. Now the debate is between these two
models:

1. PIXEL_RATE means the output rate of the PLL for the sensor's internal
pixel clock. That would mean this special binning mode leads to negative
blanking values, which breaks intuition for what blanking means, but lines
up well with exposing sensor FLL/LLP registers directly for the new raw
sensor model.

2. H/V_BLANK are always positive and defined w.r.t source pad width/height.
Thus special binning mode would need to have "double" the PIXEL_RATE, even
though the sensor PLL is configured the same way. This aligns with what
applications expect today.

Even "normal" binning mode on IMX219 and many other sensors does binning in
the Analogue domain for one dimension. As we discussed before in [1].

Which makes the former a cleaner model to adopt for future. Now what we
should do for existing sensors is a question that needs more discussion.

I am fine with both approaches, but this does mean fixing libcamera to work
with negative blanking values (which it doesn't currently at least in my
short test today) and breaks intuition for what blanking means (which is
annoying).

Jacopo & Laurent, what do you think?

Thanks,
    Jai

[1]: https://lore.kernel.org/all/20260225-media-fps-docs-v2-1-5cb222d41e4d@=
ideasonboard.com/

> +                                              IMX219_FLL_MAX - mode->hei=
ght, 1,
> +                                              (int)(mode->fll_def / binn=
ing) -
> +                                              (int)mode->height);
>                 if (ret)
>                         return ret;
> =20
>                 ret =3D __v4l2_ctrl_s_ctrl(imx219->vblank,
> -                                        mode->fll_def - mode->height);
> +                                        (int)(mode->fll_def / binning) -
> +                                        (int)mode->height);
>                 if (ret)
>                         return ret;
> =20
> @@ -931,7 +920,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *=
sd,
>                         return ret;
> =20
>                 /* Scale the pixel rate based on the mode specific factor=
 */
> -               pixel_rate =3D imx219_get_pixel_rate(imx219) * rate_facto=
r;
> +               pixel_rate =3D imx219_get_pixel_rate(imx219);
>                 ret =3D __v4l2_ctrl_modify_range(imx219->pixel_rate, pixe=
l_rate,
>                                                pixel_rate, 1, pixel_rate);
>                 if (ret)
> --=20
> 2.47.3
>

