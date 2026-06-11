Return-Path: <linux-media+bounces-64584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9qtZMq2mKmqmuQMAu9opvQ
	(envelope-from <linux-media+bounces-64584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:14:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D6671B99
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:14:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b="f+c/EBlJ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64584-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64584-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 075D5307EED6
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CB53EDE58;
	Thu, 11 Jun 2026 12:12:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA62F1FE4
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:12:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179972; cv=none; b=MvB+/Jbw5DvyrZT61I3oKkcchPSFfTUVdnFtF0qHLTPPW9WgH3fX7r3l2gJ7nzkMKa288FiILMjLiGSH20walYdeiKrRD5qxGdZcjG75K054CAeqkQ3qpTGxYBU57W0dkgdE1GNUpRNTu4gKWdxajgWwaP7eoVJCMVyZ4nmra1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179972; c=relaxed/simple;
	bh=lJpRsCtpyjcKD/ya9HmM1kTwsWOjRap69Qtv7WEIUpw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=S1u3N9GHSDlo1A/lUKbaUoJyOh/q6rLw94N1C0mwJrGz02ciiqzOrG9zzTcn7vDuARBaQbogNFKKoXlGpf1CW4txamUBQZQEzLpm8vMtnr4vIk6HQdwqjZgQvO9g/v/1xoiwCyPxm1xAi2pbgjkaSrN60A4tF5rtHxe0iYcJJ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f+c/EBlJ reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EAEE673;
	Thu, 11 Jun 2026 14:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781179937;
	bh=lJpRsCtpyjcKD/ya9HmM1kTwsWOjRap69Qtv7WEIUpw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f+c/EBlJ+TsQH609qYW8ZTpSz4Tfflunuudyjqc/VcC70B1EI6rqdijmlt6zp/m72
	 e5LRP6O5gl1uEx/KwuxIWRLri29QUOjh2WKDisf4X15gehoXgkRMtqP5mg/QUImTK0
	 z+IcEKxyaJUK3an4xeDlOMVBvLptbOB3n4zc7TSU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-61-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-61-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 60/86] media: imx219: Add embedded data support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Thu, 11 Jun 2026 17:42:41 +0530
Message-ID: <178117996109.1799417.15021338357084733334@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64584-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 528D6671B99

Hi Sakari,

Thank you for the patch.

Not a full review, just some things that I noticed while trying to test
this branch with libcamera..

Quoting Sakari Ailus (2026-04-10 01:44:35)
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> The IMX219 generates embedded data unconditionally. Report it as an
> additional stream, with a new internal embedded data pad, and update
> subdev operations accordingly.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 187 +++++++++++++++++++++++++++++++------
>  1 file changed, 161 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index d695987839e4..e744b96a08f6 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -154,6 +154,9 @@
>  #define IMX219_PIXEL_ARRAY_HEIGHT      2480U
>  #define IMX219_NATIVE_FORMAT           MEDIA_BUS_FMT_SRGGB10_1X10
> =20
> +/* Embedded metadata stream height */
> +#define IMX219_EMBEDDED_DATA_HEIGHT    2U
> +
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>         /* Frame width */
> @@ -345,11 +348,13 @@ static const struct imx219_mode supported_modes[] =
=3D {
>  enum imx219_pad_ids {
>         IMX219_PAD_SOURCE =3D 0,
>         IMX219_PAD_IMAGE,
> +       IMX219_PAD_EDATA,
>         IMX219_NUM_PADS,
>  };
> =20
>  enum imx219_stream_ids {
>         IMX219_STREAM_IMAGE,
> +       IMX219_STREAM_EDATA,
>  };
> =20
>  struct imx219 {
> @@ -375,6 +380,8 @@ struct imx219 {
> =20
>         /* Two or Four lanes */
>         u8 lanes;
> +
> +       u64 streams_enabled;
>  };
> =20
>  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> @@ -418,6 +425,25 @@ static u32 imx219_get_format_bpp(const struct v4l2_m=
bus_framefmt *format)
>         }
>  }
> =20
> +static u32
> +imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
> +{
> +       switch (format->code) {
> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> +               return MEDIA_BUS_FMT_META_8;
> +
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +       default:
> +               return MEDIA_BUS_FMT_META_10;
> +       }
> +}
> +
>  static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_=
h,
>                                u8 *bin_v)
>  {
> @@ -749,6 +775,15 @@ static int imx219_enable_streams(struct v4l2_subdev =
*sd,
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
>         int ret;
> =20
> +       /*
> +        * The image stream controls sensor streaming, as embedded data i=
sn't
> +        * controllable independently.
> +        */
> +       if (imx219->streams_enabled) {
> +               imx219->streams_enabled |=3D streams_mask;
> +               return 0;
> +       }
> +
>         ret =3D pm_runtime_resume_and_get(&client->dev);
>         if (ret < 0)
>                 return ret;
> @@ -791,6 +826,8 @@ static int imx219_enable_streams(struct v4l2_subdev *=
sd,
>         __v4l2_ctrl_grab(imx219->vflip, true);
>         __v4l2_ctrl_grab(imx219->hflip, true);
> =20
> +       imx219->streams_enabled =3D streams_mask;
> +
>         return 0;
> =20
>  err_rpm_put:
> @@ -806,6 +843,10 @@ static int imx219_disable_streams(struct v4l2_subdev=
 *sd,
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
>         int ret;
> =20
> +       imx219->streams_enabled &=3D ~streams_mask;
> +       if (imx219->streams_enabled)
> +               return 0;
> +
>         /* set stream off register */
>         ret =3D cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
>                         IMX219_MODE_STANDBY, NULL);
> @@ -826,17 +867,32 @@ static int imx219_enum_mbus_code(struct v4l2_subdev=
 *sd,
>  {
>         struct imx219 *imx219 =3D to_imx219(sd);
> =20
> -       if (code->pad =3D=3D IMX219_PAD_IMAGE) {
> -               /* The internal image pad is hardwired to the native form=
at. */
> +       switch (code->pad) {
> +       case IMX219_PAD_IMAGE:
>                 if (code->index > 0)
>                         return -EINVAL;
> =20
> -               code->code =3D IMX219_NATIVE_FORMAT;
> -       } else {
> -               /*
> -                * On the source pad, the sensor supports multiple raw fo=
rmats
> -                * with different bit depths.
> -                */
> +               code->code =3D MEDIA_BUS_FMT_RAW_10;
> +               return 0;
> +
> +       case IMX219_PAD_EDATA:
> +               if (code->index > 0)
> +                       return -EINVAL;
> +
> +               code->code =3D MEDIA_BUS_FMT_META_10;
> +               return 0;
> +
> +       case IMX219_PAD_SOURCE:
> +       default:
> +               break;
> +       }
> +
> +       /*
> +        * On the source pad, the sensor supports multiple image raw form=
ats
> +        * with different bit depths. The embedded data format bit depth
> +        * follows the image stream.
> +        */
> +       if (code->stream =3D=3D IMX219_STREAM_IMAGE) {
>                 u32 format;
> =20
>                 if (code->index >=3D ARRAY_SIZE(imx219_mbus_formats) / 4)
> @@ -844,6 +900,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev =
*sd,
> =20
>                 format =3D imx219_mbus_formats[code->index * 4];
>                 code->code =3D imx219_get_format_code(imx219, format);
> +       } else {
> +               struct v4l2_mbus_framefmt *fmt;
> +
> +               if (code->index > 0)
> +                       return -EINVAL;
> +
> +               fmt =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SO=
URCE,
> +                                                  IMX219_STREAM_EDATA);
> +               code->code =3D fmt->code;
>         }
> =20
>         return 0;
> @@ -855,15 +920,33 @@ static int imx219_enum_frame_size(struct v4l2_subde=
v *sd,
>  {
>         struct imx219 *imx219 =3D to_imx219(sd);
> =20
> -       if (fse->pad =3D=3D IMX219_PAD_IMAGE) {
> +       switch (fse->pad) {
> +       case IMX219_PAD_IMAGE:
>                 if (fse->code !=3D IMX219_NATIVE_FORMAT || fse->index > 0)

This should be MEDIA_BUS_FMT_RAW_10 I believe?

>                         return -EINVAL;
> =20
> -               fse->min_width =3D IMX219_PIXEL_ARRAY_WIDTH;
> -               fse->max_width =3D IMX219_PIXEL_ARRAY_WIDTH;
> -               fse->min_height =3D IMX219_PIXEL_ARRAY_HEIGHT;
> -               fse->max_height =3D IMX219_PIXEL_ARRAY_HEIGHT;
> -       } else {
> +               fse->min_width =3D IMX219_VISIBLE_WIDTH;
> +               fse->max_width =3D IMX219_VISIBLE_WIDTH;
> +               fse->min_height =3D IMX219_VISIBLE_HEIGHT;
> +               fse->max_height =3D IMX219_VISIBLE_HEIGHT;
> +               return 0;
> +
> +       case IMX219_PAD_EDATA:
> +               if (fse->code !=3D MEDIA_BUS_FMT_META_8 || fse->index > 0)

And this should be MEDIA_BUS_FMT_META_10, to match these both with what
imx219_enum_mbus_code() is doing.

But I guess we need to handle both 8 and 10 bit formats at both places.

Thanks,
    Jai

> +                       return -EINVAL;
> +
> +               fse->min_width =3D IMX219_VISIBLE_WIDTH;
> +               fse->max_width =3D IMX219_VISIBLE_WIDTH;
> +               fse->min_height =3D IMX219_EMBEDDED_DATA_HEIGHT;
> +               fse->max_height =3D IMX219_EMBEDDED_DATA_HEIGHT;
> +               return 0;
> +
> +       case IMX219_PAD_SOURCE:
> +       default:
> +               break;
> +       }
> +
> +       if (fse->stream =3D=3D IMX219_STREAM_IMAGE) {
>                 if (fse->code !=3D imx219_get_format_code(imx219, fse->co=
de) ||
>                     fse->index >=3D ARRAY_SIZE(supported_modes))
>                         return -EINVAL;
> @@ -872,6 +955,21 @@ static int imx219_enum_frame_size(struct v4l2_subdev=
 *sd,
>                 fse->max_width =3D fse->min_width;
>                 fse->min_height =3D supported_modes[fse->index].height;
>                 fse->max_height =3D fse->min_height;
> +       } else {
> +               struct v4l2_mbus_framefmt *fmt;
> +
> +               fmt =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SO=
URCE,
> +                                                  IMX219_STREAM_EDATA);
> +               if (fse->code !=3D fmt->code)
> +                       return -EINVAL;
> +
> +               if (fse->index > 0)
> +                       return -EINVAL;
> +
> +               fse->min_width =3D fmt->width;
> +               fse->max_width =3D fmt->width;
> +               fse->min_height =3D IMX219_EMBEDDED_DATA_HEIGHT;
> +               fse->max_height =3D IMX219_EMBEDDED_DATA_HEIGHT;
>         }
> =20
>         return 0;
> @@ -883,13 +981,16 @@ static int imx219_set_pad_format_compat(struct v4l2=
_subdev *sd,
>  {
>         struct imx219 *imx219 =3D to_imx219(sd);
>         const struct imx219_mode *mode;
> -       struct v4l2_mbus_framefmt *format;
> +       struct v4l2_mbus_framefmt *format, *embedded_format;
>         struct v4l2_rect *crop;
>         u8 bin_h, bin_v, bin_hv;
>         int ret;
> =20
>         format =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
>                                               IMX219_STREAM_IMAGE);
> +       embedded_format =3D
> +               v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +                                            IMX219_STREAM_EDATA);
> =20
>         /*
>          * Adjust the requested format to match the closest mode. The Bay=
er
> @@ -911,6 +1012,8 @@ static int imx219_set_pad_format_compat(struct v4l2_=
subdev *sd,
> =20
>         *format =3D fmt->format;
> =20
> +       embedded_format->code =3D imx219_get_embedded_format_code(format);
> +
>         /*
>          * Use binning to maximize the crop rectangle size, and centre it=
 in the
>          * sensor.
> @@ -988,7 +1091,7 @@ static int imx219_set_pad_format(struct v4l2_subdev =
*sd,
>         if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_S=
ENSOR))
>                 return imx219_set_pad_format_compat(sd, state, fmt);
> =20
> -       if (fmt->pad !=3D IMX219_PAD_SOURCE)
> +       if (fmt->pad !=3D IMX219_PAD_SOURCE && fmt->stream !=3D IMX219_ST=
REAM_IMAGE)
>                 return v4l2_subdev_get_fmt(sd, ci, state, fmt);
> =20
>         format =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> @@ -1038,7 +1141,11 @@ static int imx219_get_selection(struct v4l2_subdev=
 *sd,
>                 return -EINVAL;
>         }
> =20
> -       if (sel->pad !=3D IMX219_PAD_IMAGE)
> +       /*
> +        * The embedded data stream doesn't support selection rectangles,
> +        * neither on the embedded data pad nor on the source pad.
> +        */
> +       if (sel->pad !=3D IMX219_PAD_IMAGE || sel->stream !=3D IMX219_STR=
EAM_IMAGE)
>                 return -EINVAL;
> =20
>         switch (sel->target) {
> @@ -1068,35 +1175,41 @@ static int imx219_get_selection(struct v4l2_subde=
v *sd,
>  static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pa=
d,
>                                  struct v4l2_mbus_frame_desc *fd)
>  {
> -       const struct v4l2_mbus_framefmt *fmt;
>         struct v4l2_subdev_state *state;
> -       u32 code;
> +       u32 img_code;
> +       u32 ed_code;
> =20
>         if (pad !=3D IMX219_PAD_SOURCE)
>                 return -EINVAL;
> =20
>         state =3D v4l2_subdev_lock_and_get_active_state(sd);
> -       fmt =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> -                                          IMX219_STREAM_IMAGE);
> -       code =3D fmt->code;
> +       img_code =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SOURC=
E,
> +                                               IMX219_STREAM_IMAGE)->cod=
e;
> +       ed_code =3D v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +                                              IMX219_STREAM_EDATA)->code;
>         v4l2_subdev_unlock_state(state);
> =20
>         fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> -       fd->num_entries =3D 1;
> +       fd->num_entries =3D 2;
> =20
> -       fd->entry[0].pixelcode =3D code;
> +       fd->entry[0].pixelcode =3D img_code;
>         fd->entry[0].stream =3D IMX219_STREAM_IMAGE;
>         fd->entry[0].bus.csi2.vc =3D 0;
> -       fd->entry[0].bus.csi2.dt =3D imx219_format_bpp(code) =3D=3D 8 ?
> +       fd->entry[0].bus.csi2.dt =3D imx219_format_bpp(img_code) =3D=3D 8=
 ?
>                 MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
> =20
> +       fd->entry[1].pixelcode =3D ed_code;
> +       fd->entry[1].stream =3D IMX219_STREAM_EDATA;
> +       fd->entry[1].bus.csi2.vc =3D 0;
> +       fd->entry[1].bus.csi2.dt =3D MIPI_CSI2_DT_EMBEDDED_8B;
> +
>         return 0;
>  }
> =20
>  static int imx219_init_state(struct v4l2_subdev *sd,
>                              struct v4l2_subdev_state *state)
>  {
> -       struct v4l2_subdev_route routes[1] =3D {
> +       struct v4l2_subdev_route routes[] =3D {
>                 {
>                         .sink_pad =3D IMX219_PAD_IMAGE,
>                         .sink_stream =3D 0,
> @@ -1105,6 +1218,14 @@ static int imx219_init_state(struct v4l2_subdev *s=
d,
>                         .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE |
>                                  V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
>                                  V4L2_SUBDEV_ROUTE_FL_STATIC,
> +               }, {
> +                       .sink_pad =3D IMX219_PAD_EDATA,
> +                       .sink_stream =3D 0,
> +                       .source_pad =3D IMX219_PAD_SOURCE,
> +                       .source_stream =3D IMX219_STREAM_EDATA,
> +                       .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +                                V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
> +                                V4L2_SUBDEV_ROUTE_FL_STATIC,
>                 },
>         };
>         struct v4l2_subdev_krouting routing =3D {
> @@ -1127,6 +1248,11 @@ static int imx219_init_state(struct v4l2_subdev *s=
d,
>         struct v4l2_mbus_framefmt *source_format =3D
>                 v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
>                                              IMX219_STREAM_IMAGE);
> +       struct v4l2_mbus_framefmt *embedded_format =3D
> +               v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
> +       struct v4l2_mbus_framefmt *embedded_source_format =3D
> +               v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +                                            IMX219_STREAM_EDATA);
> =20
>         /* The image pad models the pixel array, and thus has a fixed for=
mat. */
>         pixel_array_format->code =3D MEDIA_BUS_FMT_RAW_10;
> @@ -1151,6 +1277,13 @@ static int imx219_init_state(struct v4l2_subdev *s=
d,
>         source_format->width =3D compose->width;
>         source_format->height =3D compose->height;
> =20
> +       embedded_format->code =3D MEDIA_BUS_FMT_META_10;
> +       embedded_format->width =3D source_format->width;
> +       embedded_format->height =3D IMX219_EMBEDDED_DATA_HEIGHT;
> +       embedded_format->field =3D V4L2_FIELD_NONE;
> +
> +       *embedded_source_format =3D *embedded_format;
> +
>         return 0;
>  }
> =20
> @@ -1426,6 +1559,8 @@ static int imx219_probe(struct i2c_client *client)
>         imx219->pads[IMX219_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
>         imx219->pads[IMX219_PAD_IMAGE].flags =3D MEDIA_PAD_FL_SINK
>                                              | MEDIA_PAD_FL_INTERNAL;
> +       imx219->pads[IMX219_PAD_EDATA].flags =3D MEDIA_PAD_FL_SINK
> +                                            | MEDIA_PAD_FL_INTERNAL;
> =20
>         ret =3D media_entity_pads_init(&imx219->sd.entity,
>                                      ARRAY_SIZE(imx219->pads), imx219->pa=
ds);
> --=20
> 2.47.3
>=20
>

