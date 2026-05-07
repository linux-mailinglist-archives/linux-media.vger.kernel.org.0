Return-Path: <linux-media+bounces-60785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLViHJJ+/GnXQgAAu9opvQ
	(envelope-from <linux-media+bounces-60785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:59:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F414E7DEF
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92EB83073752
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA493E9584;
	Thu,  7 May 2026 11:56:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF223D47B7
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154976; cv=none; b=Wgbr28qwdd4YWddC5KWZmFFnbLUpc63BTDtpSi2Aqvl/fiLdFoSlkEYwma+pCItVuW8NnMFb6poMdaNy3hB5NKBjcgALsPEizGApL0/i+wpHhKMPlEEGKuOT4WzZKC912gHFgUSvywxm6cwrqyPWR0TpUUhJ0dq2+u3CHUsKo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154976; c=relaxed/simple;
	bh=3Q8CS8yrRyzlrQQu4yCX6qXota4NMdUIhaTDiliCC5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQDvx52XzJVAWxuT1xpujQ6A5cWRIZ1cp+RRzqxAfHuhudGlXhw0k8rZALCzIi8hD72tvxM79qLIt7LsZhLRGpHROd6h9BM8nhBlxN7g3sv6hJsmtLAEBEDQoLl/j28r0EIr9xm4oH2SB7iwt1IPKdmllj7bwqWjA1k5Y5gV7Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 8CEBA1F80044
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:56:00 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AF458B405F8; Thu,  7 May 2026 11:55:58 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 47285B405F1;
	Thu,  7 May 2026 11:55:56 +0000 (UTC)
Date: Thu, 7 May 2026 13:55:54 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 1/3] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Message-ID: <afx9ypU16kWyAzpp@collins>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
 <20260217064050.18388-2-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uk7XHTKhtIa6n4gB"
Content-Disposition: inline
In-Reply-To: <20260217064050.18388-2-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: 01F414E7DEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60785-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paulk.fr:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sys-base.io:email,sys-base.io:url]
X-Rspamd-Action: no action


--Uk7XHTKhtIa6n4gB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Tue 17 Feb 26, 10:10, Arash Golgol a =C3=A9crit :
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>=20
> Previously, capture accessed bridge private state directly. After
> moving to framework-managed state, resolve the format through the
> subdev pad API.
>=20
> The sun6i-csi-bridge hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
>=20
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

This looks very good to me, thanks for your great work!

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  3 files changed, 85 insertions(+), 105 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..4406b0f8c839 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -13,26 +13,6 @@
>  #include "sun6i_csi_bridge.h"
>  #include "sun6i_csi_reg.h"
> =20
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -				 unsigned int *width, unsigned int *height)
> -{
> -	if (width)
> -		*width =3D csi_dev->bridge.mbus_format.width;
> -	if (height)
> -		*height =3D csi_dev->bridge.mbus_format.height;
> -}
> -
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -			     u32 *mbus_code, u32 *field)
> -{
> -	if (mbus_code)
> -		*mbus_code =3D csi_dev->bridge.mbus_format.code;
> -	if (field)
> -		*field =3D csi_dev->bridge.mbus_format.field;
> -}
> -
>  /* Format */
> =20
>  static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] =
=3D {
> @@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi=
_device *csi_dev)
>  }
> =20
>  static void
> -sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
> +				     const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct device *dev =3D csi_dev->dev;
>  	struct regmap *regmap =3D csi_dev->regmap;
> @@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi=
_device *csi_dev)
>  		&csi_dev->bridge.source_parallel.endpoint;
>  	unsigned char bus_width =3D endpoint->bus.parallel.bus_width;
>  	unsigned int flags =3D endpoint->bus.parallel.flags;
> -	u32 field;
> +	u32 field =3D mbus_format->field;
>  	u32 value =3D SUN6I_CSI_IF_CFG_IF_CSI;
> =20
> -	sun6i_csi_bridge_format(csi_dev, NULL, &field);
> -
>  	if (field =3D=3D V4L2_FIELD_INTERLACED ||
>  	    field =3D=3D V4L2_FIELD_INTERLACED_TB ||
>  	    field =3D=3D V4L2_FIELD_INTERLACED_BT)
> @@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_cs=
i_device *csi_dev)
>  }
> =20
>  static void
> -sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
> +				      const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap =3D csi_dev->regmap;
>  	u32 value =3D SUN6I_CSI_IF_CFG_IF_MIPI;
> -	u32 field;
> -
> -	sun6i_csi_bridge_format(csi_dev, NULL, &field);
> +	u32 field =3D mbus_format->field;
> =20
>  	if (field =3D=3D V4L2_FIELD_INTERLACED ||
>  	    field =3D=3D V4L2_FIELD_INTERLACED_TB ||
> @@ -335,19 +313,19 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_c=
si_device *csi_dev)
>  	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
>  }
> =20
> -static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *c=
si_dev)
> +static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *c=
si_dev,
> +					       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap =3D csi_dev->regmap;
>  	bool capture_streaming =3D csi_dev->capture.state.streaming;
>  	const struct sun6i_csi_bridge_format *bridge_format;
>  	const struct sun6i_csi_capture_format *capture_format;
> -	u32 mbus_code, field, pixelformat;
> +	u32 pixelformat;
> +	u32 field =3D mbus_format->field;
>  	u8 input_format, input_yuv_seq, output_format;
>  	u32 value =3D 0;
> =20
> -	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
> -
> -	bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +	bridge_format =3D sun6i_csi_bridge_format_find(mbus_format->code);
>  	if (WARN_ON(!bridge_format))
>  		return;
> =20
> @@ -391,16 +369,17 @@ static void sun6i_csi_bridge_configure_format(struc=
t sun6i_csi_device *csi_dev)
>  }
> =20
>  static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
> -				       struct sun6i_csi_bridge_source *source)
> +				       struct sun6i_csi_bridge_source *source,
> +				       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct sun6i_csi_bridge *bridge =3D &csi_dev->bridge;
> =20
>  	if (source =3D=3D &bridge->source_parallel)
> -		sun6i_csi_bridge_configure_parallel(csi_dev);
> +		sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format);
>  	else
> -		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
> +		sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format);
> =20
> -	sun6i_csi_bridge_configure_format(csi_dev);
> +	sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
>  }
> =20
>  /* V4L2 Subdev */
> @@ -415,6 +394,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>  	struct sun6i_csi_bridge_source *source;
>  	struct v4l2_subdev *source_subdev;
>  	struct media_pad *remote_pad;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *mbus_format;
>  	int ret;
> =20
>  	/* Source */
> @@ -433,6 +414,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_sub=
dev *subdev, int on)
>  	else
>  		source =3D &bridge->source_mipi_csi2;
> =20
> +	/* Active State */
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);
>  		ret =3D 0;
> @@ -443,7 +428,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
> =20
>  	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	/* Clear */
> =20
> @@ -451,7 +436,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
> =20
>  	/* Configure */
> =20
> -	sun6i_csi_bridge_configure(csi_dev, source);
> +	mbus_format =3D v4l2_subdev_state_get_format(state,
> +						   SUN6I_CSI_BRIDGE_PAD_SINK);
> +	sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
> =20
>  	if (capture_streaming)
>  		sun6i_csi_capture_configure(csi_dev);
> @@ -472,7 +459,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>  	if (ret && ret !=3D -ENOIOCTLCMD)
>  		goto disable;
> =20
> -	return 0;
> +	ret =3D 0;
> +	goto unlock;
> =20
>  disable:
>  	if (capture_streaming)
> @@ -482,6 +470,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
> =20
>  	pm_runtime_put(dev);
> =20
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
> =20
> @@ -504,21 +494,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mb=
us_framefmt *mbus_format)
>  static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
>  				       struct v4l2_subdev_state *state)
>  {
> -	struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -	unsigned int pad =3D SUN6I_CSI_BRIDGE_PAD_SINK;
> -	struct v4l2_mbus_framefmt *mbus_format =3D
> -		v4l2_subdev_state_get_format(state, pad);
> -	struct mutex *lock =3D &csi_dev->bridge.lock;
> +	unsigned int pad;
> =20
> -	mutex_lock(lock);
> +	/*
> +	 * This subdev does not perform format conversion,
> +	 * initialize both pads identically.
> +	 */
> +	for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +		struct v4l2_mbus_framefmt *mbus_format;
> =20
> -	mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_code;
> -	mbus_format->width =3D 1280;
> -	mbus_format->height =3D 720;
> +		mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> =20
> -	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +		mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_code;
> +		mbus_format->width =3D 1280;
> +		mbus_format->height =3D 720;
> =20
> -	mutex_unlock(lock);
> +		sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +	}
> =20
>  	return 0;
>  }
> @@ -536,53 +528,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev =
*subdev,
>  	return 0;
>  }
> =20
> -static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
> -				    struct v4l2_subdev_state *state,
> -				    struct v4l2_subdev_format *format)
> -{
> -	struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -	struct mutex *lock =3D &csi_dev->bridge.lock;
> -
> -	mutex_lock(lock);
> -
> -	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -		*mbus_format =3D *v4l2_subdev_state_get_format(state,
> -							     format->pad);
> -	else
> -		*mbus_format =3D csi_dev->bridge.mbus_format;
> -
> -	mutex_unlock(lock);
> -
> -	return 0;
> -}
> -
>  static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
>  				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_format *format)
>  {
> -	struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -	struct mutex *lock =3D &csi_dev->bridge.lock;
> +	struct v4l2_mbus_framefmt *fmt;
> =20
> -	mutex_lock(lock);
> +	/* The format on the source pad always matches the sink pad. */
> +	if (format->pad !=3D SUN6I_CSI_BRIDGE_PAD_SINK)
> +		return v4l2_subdev_get_fmt(subdev, state, format);
> =20
> -	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +	sun6i_csi_bridge_mbus_format_prepare(&format->format);
> =20
> -	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -		*v4l2_subdev_state_get_format(state, format->pad) =3D
> -			*mbus_format;
> -	else
> -		csi_dev->bridge.mbus_format =3D *mbus_format;
> +	/* Set the format on the sink pad. */
> +	fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> +	*fmt =3D format->format;
> =20
> -	mutex_unlock(lock);
> +	/* Propagate the format to the source pad. */
> +	fmt =3D v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE=
);
> +	*fmt =3D format->format;
> =20
>  	return 0;
>  }
> =20
>  static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops =3D {
>  	.enum_mbus_code	=3D sun6i_csi_bridge_enum_mbus_code,
> -	.get_fmt	=3D sun6i_csi_bridge_get_fmt,
> +	.get_fmt	=3D v4l2_subdev_get_fmt,
>  	.set_fmt	=3D sun6i_csi_bridge_set_fmt,
>  };
> =20
> @@ -780,8 +751,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>  	};
>  	int ret;
> =20
> -	mutex_init(&bridge->lock);
> -
>  	/* V4L2 Subdev */
> =20
>  	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
> @@ -809,6 +778,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *=
csi_dev)
>  	if (ret < 0)
>  		return ret;
> =20
> +	/* V4L2 Subdev finalize */
> +
> +	ret =3D v4l2_subdev_init_finalize(subdev);
> +	if (ret < 0)
> +		goto error_media_entity;
> +
>  	/* V4L2 Subdev */
> =20
>  	if (csi_dev->isp_available)
> @@ -818,7 +793,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
> =20
>  	if (ret) {
>  		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
> -		goto error_media_entity;
> +		goto error_subdev_finalize;
>  	}
> =20
>  	/* V4L2 Async */
> @@ -852,6 +827,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>  	else
>  		v4l2_device_unregister_subdev(subdev);
> =20
> +error_subdev_finalize:
> +	v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>  	media_entity_cleanup(&subdev->entity);
> =20
> @@ -868,5 +846,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	v4l2_device_unregister_subdev(subdev);
> =20
> +	v4l2_subdev_cleanup(subdev);
> +
>  	media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> index 44653b38f722..a5b0a6f064dd 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
>  	struct v4l2_subdev		subdev;
>  	struct v4l2_async_notifier	notifier;
>  	struct media_pad		pads[2];
> -	struct v4l2_mbus_framefmt	mbus_format;
> -	struct mutex			lock; /* Mbus format lock. */
> =20
>  	struct sun6i_csi_bridge_source	source_parallel;
>  	struct sun6i_csi_bridge_source	source_mipi_csi2;
>  };
> =20
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -				 unsigned int *width, unsigned int *height);
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -			     u32 *mbus_code, u32 *field);
> -
>  /* Format */
> =20
>  const struct sun6i_csi_bridge_format *
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 65879f4802c0..a21a146fb02a 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>  		media_entity_to_video_device(link->sink->entity);
>  	struct sun6i_csi_device *csi_dev =3D video_get_drvdata(video_dev);
>  	struct v4l2_device *v4l2_dev =3D csi_dev->v4l2_dev;
> +	struct v4l2_subdev *src_subdev =3D
> +		media_entity_to_v4l2_subdev(link->source->entity);
>  	const struct sun6i_csi_capture_format *capture_format;
>  	const struct sun6i_csi_bridge_format *bridge_format;
>  	unsigned int capture_width, capture_height;
> -	unsigned int bridge_width, bridge_height;
>  	const struct v4l2_format_info *format_info;
> +	struct v4l2_subdev_format src_fmt =3D {
> +		.which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad =3D link->source->index
> +	};
>  	u32 pixelformat, capture_field;
> -	u32 mbus_code, bridge_field;
>  	bool match;
> +	int ret;
> =20
>  	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
> =20
> @@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>  	if (WARN_ON(!capture_format))
>  		return -EINVAL;
> =20
> -	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
> +	/* Resolve csi bridge format. */
> +	ret =3D v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
> +	if (ret)
> +		return ret;
> =20
> -	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
> -	bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +	bridge_format =3D sun6i_csi_bridge_format_find(src_fmt.format.code);
>  	if (WARN_ON(!bridge_format))
>  		return -EINVAL;
> =20
>  	/* No cropping/scaling is supported. */
> -	if (capture_width !=3D bridge_width || capture_height !=3D bridge_heigh=
t) {
> +	if (capture_width !=3D src_fmt.format.width ||
> +		capture_height !=3D src_fmt.format.height) {
>  		v4l2_err(v4l2_dev,
>  			 "invalid input/output dimensions: %ux%u/%ux%u\n",
> -			 bridge_width, bridge_height, capture_width,
> -			 capture_height);
> +			 src_fmt.format.width, src_fmt.format.height,
> +			 capture_width, capture_height);
>  		return -EINVAL;
>  	}
> =20
> @@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct med=
ia_link *link)
>  	/* With raw input mode, we need a 1:1 match between input and output. */
>  	if (bridge_format->input_format =3D=3D SUN6I_CSI_INPUT_FMT_RAW ||
>  	    capture_format->input_format_raw) {
> -		match =3D sun6i_csi_capture_format_match(pixelformat, mbus_code);
> +		match =3D sun6i_csi_capture_format_match(pixelformat,
> +						       src_fmt.format.code);
>  		if (!match)
>  			goto invalid;
>  	}
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Uk7XHTKhtIa6n4gB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn8fcoACgkQhP3B6o/u
lQzwGA/+Paq959i9MhtQt7VotqcxhNyscRQZC08wiryuCo1qK60xseKCCi0O3SXp
50dAMOcUXWiv3Rpr66zdsxGwdrFKECD1eD8Pz6y+WH4MVvrRqS5YIjDDYLk2UMTw
MRXP2mo2pEXn0sW7/xAdEOQXDc+3Yfyq88VRV5156Wmp/DxKHTKqYPKqYwK42/1Z
0hD8ns2FmUlXN11/nEKE0ni1Kw58eOEKl6hDMbGpDrrvltINZBmkRtco+zf1TPg+
zd+7yTGRoWJ8bp+Iv8+uRbK57jfQEz3b4CR5cdqb++/uO9o+LdmaBz1f8pD6clm/
+FJZQqWyVq5H6PkJlGUUvQHAZ368hUvKju+6FSRhnBG748llOPYVCJZw1iBiKu9I
SarkU540lU4XKk9zRYt/dUIE4sSPj2KcNiOsa2SUUzhC6D0dgJh7BQcHYiaL+N/k
GNH9eUrIlMqEfdEdbrezOGFk4q0gno5wRjJWCOkw7cR+yKo0aqBv6yj3EXguPM3a
VEofpuoo5V0vfUV81zEte6V5msoN9OeV2tWTT5uq0RlmZb0h3gW8mlTORr63Ho1F
V4tW4DiJdoBoLTtR6squvQqe6LI837eW3FckJOYGb4ggqL2+54fbhgFnMNw9WH2G
fy6AKJrwdiCdR99qlxgepZwRTJXNP5C6uk4HCxAPtOjgJG0H9hI=
=TWZR
-----END PGP SIGNATURE-----

--Uk7XHTKhtIa6n4gB--

