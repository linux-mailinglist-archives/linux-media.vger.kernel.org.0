Return-Path: <linux-media+bounces-61868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dgvgNJ0wCmo+xgQAu9opvQ
	(envelope-from <linux-media+bounces-61868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:18:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33C563F94
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F6EE300F9F1
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 21:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48E82DF6E9;
	Sun, 17 May 2026 21:18:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F8548EE
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779052695; cv=none; b=Fk4+gsNGCxdBMhxIc8b/oaqmH5SIbcb5MlUTJLC2Fr1H5CxjCn42lF6XLPA7kCGTknmybc2ICO10bdwiI/1Tocx9OOzYnfjMD70hS7KQRCDhDevh6c4O88ItEZBSQvRXvZbxGcZwyoUDzTeru1ZOekc9U6g0DQ2UmrlsTDRBkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779052695; c=relaxed/simple;
	bh=gblGyBH6yDYjqnxJnKSm4FihAe+/V66x6J886Jr6KlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6/jVqociFGpwwXft0yd+tGazi3H+z7GH9KOwX0Zl+lN6md0aDeAOe/VzFH3xisfPJ5U0kvR/zNL5U5CFyJiDZrDclKHBHaqSjXNQz3CGKCKKDdkgRE/UBucETTweCGKSkOuqsve8shnKuYCybdDjZGiKscc0cMjQc6jTuC7USI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9751A1F8005A
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 21:18:08 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 12302B407A8; Sun, 17 May 2026 21:18:07 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id A28F4B4079C;
	Sun, 17 May 2026 21:18:05 +0000 (UTC)
Date: Sun, 17 May 2026 23:18:03 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active
 state
Message-ID: <agowixYIRIB7D3J3@collins>
References: <20260515173101.8978-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XGZqOrNyWuP5I4V2"
Content-Disposition: inline
In-Reply-To: <20260515173101.8978-1-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: 2D33C563F94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-61868-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:email,sys-base.io:url]
X-Rspamd-Action: no action


--XGZqOrNyWuP5I4V2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Fri 15 May 26, 21:01, Arash Golgol a =C3=A9crit :
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>=20
> The sun8i-a83t-mipi-csi2 hardware does not perform any format
> conversion. Enforce identical formats on the sink and source pads in
> the set_fmt() and init_state() callbacks.

Looks good to me and works well on the hardware!
Thanks again for your work.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> ---
> Changes in v3:
>  - Fix active state lock leak on runtime PM error path
>=20
> Changes in v2:
>  - Initialize active state before calling v4l2_subdev_state_get_format()
>  - Fix line wrapping reported by checkpatch
>  - Link to media-ci report: https://linux-media.pages.freedesktop.org/-/u=
sers/patchwork/-/jobs/99865145/artifacts/report.htm
>=20
>  .../sun8i_a83t_mipi_csi2.c                    | 113 +++++++++---------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  2 files changed, 56 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c
> index dbc51daa4fe3..2b7635f3952d 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> @@ -144,12 +144,12 @@ sun8i_a83t_mipi_csi2_disable(struct sun8i_a83t_mipi=
_csi2_device *csi2_dev)
>  }
> =20
>  static void
> -sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi2_=
dev)
> +sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi2_=
dev,
> +			       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap =3D csi2_dev->regmap;
>  	unsigned int lanes_count =3D
>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> -	struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus_forma=
t;
>  	const struct sun8i_a83t_mipi_csi2_format *format;
>  	struct device *dev =3D csi2_dev->dev;
>  	u32 version =3D 0;
> @@ -205,7 +205,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  	struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_subdev;
>  	union phy_configure_opts dphy_opts =3D { 0 };
>  	struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi_dphy;
> -	struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus_forma=
t;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *mbus_format;
>  	const struct sun8i_a83t_mipi_csi2_format *format;
>  	struct phy *dphy =3D csi2_dev->dphy;
>  	struct device *dev =3D csi2_dev->dev;
> @@ -215,8 +216,12 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2=
_subdev *subdev, int on)
>  	unsigned long pixel_rate;
>  	int ret;
> =20
> -	if (!source_subdev)
> -		return -ENODEV;
> +	state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
> +	if (!source_subdev) {
> +		ret =3D -ENODEV;
> +		goto unlock;
> +	}
> =20
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> @@ -228,7 +233,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
> =20
>  	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	/* Sensor pixel rate */
> =20
> @@ -254,6 +259,9 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  		goto error_pm;
>  	}
> =20
> +	mbus_format =3D
> +		v4l2_subdev_state_get_format(state,
> +					     SUN8I_A83T_MIPI_CSI2_PAD_SINK);
>  	format =3D sun8i_a83t_mipi_csi2_format_find(mbus_format->code);
>  	if (WARN_ON(!format)) {
>  		ret =3D -ENODEV;
> @@ -292,7 +300,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
> =20
>  	/* Controller */
> =20
> -	sun8i_a83t_mipi_csi2_configure(csi2_dev);
> +	sun8i_a83t_mipi_csi2_configure(csi2_dev, mbus_format);
>  	sun8i_a83t_mipi_csi2_enable(csi2_dev);
> =20
>  	/* D-PHY */
> @@ -309,7 +317,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  	if (ret && ret !=3D -ENOIOCTLCMD)
>  		goto disable;
> =20
> -	return 0;
> +	ret =3D 0;
> +	goto unlock;
> =20
>  disable:
>  	phy_power_off(dphy);
> @@ -318,6 +327,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  error_pm:
>  	pm_runtime_put(dev);
> =20
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
> =20
> @@ -341,22 +352,24 @@ sun8i_a83t_mipi_csi2_mbus_format_prepare(struct v4l=
2_mbus_framefmt *mbus_format)
>  static int sun8i_a83t_mipi_csi2_init_state(struct v4l2_subdev *subdev,
>  					   struct v4l2_subdev_state *state)
>  {
> -	struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> -		v4l2_get_subdevdata(subdev);
> -	unsigned int pad =3D SUN8I_A83T_MIPI_CSI2_PAD_SINK;
> -	struct v4l2_mbus_framefmt *mbus_format =3D
> -		v4l2_subdev_state_get_format(state, pad);
> -	struct mutex *lock =3D &csi2_dev->bridge.lock;
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
> -	mbus_format->code =3D sun8i_a83t_mipi_csi2_formats[0].mbus_code;
> -	mbus_format->width =3D 640;
> -	mbus_format->height =3D 480;
> +		mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> +
> +		mbus_format->code =3D sun8i_a83t_mipi_csi2_formats[0].mbus_code;
> +		mbus_format->width =3D 640;
> +		mbus_format->height =3D 480;
> =20
> -	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> +		sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> +	}
> =20
> -	mutex_unlock(lock);
> =20
>  	return 0;
>  }
> @@ -375,55 +388,33 @@ sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_sub=
dev *subdev,
>  	return 0;
>  }
> =20
> -static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> -					struct v4l2_subdev_state *state,
> -					struct v4l2_subdev_format *format)
> -{
> -	struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> -		v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -	struct mutex *lock =3D &csi2_dev->bridge.lock;
> -
> -	mutex_lock(lock);
> -
> -	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -		*mbus_format =3D *v4l2_subdev_state_get_format(state,
> -							     format->pad);
> -	else
> -		*mbus_format =3D csi2_dev->bridge.mbus_format;
> -
> -	mutex_unlock(lock);
> -
> -	return 0;
> -}
> -
>  static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
>  					struct v4l2_subdev_state *state,
>  					struct v4l2_subdev_format *format)
>  {
> -	struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> -		v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -	struct mutex *lock =3D &csi2_dev->bridge.lock;
> +	struct v4l2_mbus_framefmt *fmt;
> =20
> -	mutex_lock(lock);
> +	/* The format on the source pad always matches the sink pad. */
> +	if (format->pad !=3D SUN8I_A83T_MIPI_CSI2_PAD_SINK)
> +		return v4l2_subdev_get_fmt(subdev, state, format);
> =20
> -	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> +	sun8i_a83t_mipi_csi2_mbus_format_prepare(&format->format);
> =20
> -	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -		*v4l2_subdev_state_get_format(state, format->pad) =3D
> -			*mbus_format;
> -	else
> -		csi2_dev->bridge.mbus_format =3D *mbus_format;
> +	/* Set the format on the sink pad. */
> +	fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> +	*fmt =3D format->format;
> =20
> -	mutex_unlock(lock);
> +	/* Propagate the format to the source pad. */
> +	fmt =3D v4l2_subdev_state_get_format(state,
> +					   SUN8I_A83T_MIPI_CSI2_PAD_SOURCE);
> +	*fmt =3D format->format;
> =20
>  	return 0;
>  }
> =20
>  static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_pad_ops =3D=
 {
>  	.enum_mbus_code	=3D sun8i_a83t_mipi_csi2_enum_mbus_code,
> -	.get_fmt	=3D sun8i_a83t_mipi_csi2_get_fmt,
> +	.get_fmt	=3D v4l2_subdev_get_fmt,
>  	.set_fmt	=3D sun8i_a83t_mipi_csi2_set_fmt,
>  };
> =20
> @@ -540,8 +531,6 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_m=
ipi_csi2_device *csi2_dev)
>  	bool notifier_registered =3D false;
>  	int ret;
> =20
> -	mutex_init(&bridge->lock);
> -
>  	/* V4L2 Subdev */
> =20
>  	v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
> @@ -570,6 +559,12 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_=
mipi_csi2_device *csi2_dev)
>  	if (ret)
>  		return ret;
> =20
> +	/* V4L2 Subdev finalize */
> +
> +	ret =3D v4l2_subdev_init_finalize(subdev);
> +	if (ret < 0)
> +		goto error_media_entity_cleanup;
> +
>  	/* V4L2 Async */
> =20
>  	v4l2_async_subdev_nf_init(notifier, subdev);
> @@ -603,6 +598,9 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_m=
ipi_csi2_device *csi2_dev)
>  error_v4l2_notifier_cleanup:
>  	v4l2_async_nf_cleanup(notifier);
> =20
> +	v4l2_subdev_cleanup(subdev);
> +
> +error_media_entity_cleanup:
>  	media_entity_cleanup(&subdev->entity);
> =20
>  	return ret;
> @@ -617,6 +615,7 @@ sun8i_a83t_mipi_csi2_bridge_cleanup(struct sun8i_a83t=
_mipi_csi2_device *csi2_dev
>  	v4l2_async_unregister_subdev(subdev);
>  	v4l2_async_nf_unregister(notifier);
>  	v4l2_async_nf_cleanup(notifier);
> +	v4l2_subdev_cleanup(subdev);
>  	media_entity_cleanup(&subdev->entity);
>  }
> =20
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.h
> index f1e64c53434c..819527bcd64d 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.h
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.h
> @@ -33,8 +33,6 @@ struct sun8i_a83t_mipi_csi2_bridge {
>  	struct media_pad		pads[SUN8I_A83T_MIPI_CSI2_PAD_COUNT];
>  	struct v4l2_fwnode_endpoint	endpoint;
>  	struct v4l2_async_notifier	notifier;
> -	struct v4l2_mbus_framefmt	mbus_format;
> -	struct mutex			lock; /* Mbus format lock. */
> =20
>  	struct v4l2_subdev		*source_subdev;
>  };
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--XGZqOrNyWuP5I4V2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoKMIoACgkQhP3B6o/u
lQxynQ/8DT/tQQXwb/4gFVBlINqCHLS8RkyMQe1PdHZS/V6xRk5O7Psn478GUo/4
+92AXqt1QJXVxm++1uFFq+/PNu3MhAIcdJhLKhLJ7Vv6gmPEEAMF1Q0Gua+/E/Ri
OdOethJDxFTl4FaincOeZ02VFcDtpdaTFRK9Rf9oQ2VbbLt6R9ULATvK9jfDGSlT
n1IvmBswOYABEHTjku5Tcx5pXVXoOwrs3hgd2uQuvWEfB9H9YdOfx1MXQtzjh1A6
wM0V6afe/MKtriiHj6C54OupXBPloLwRYrWjtVfAQtL+6YtAib839Q/KOV5ke9jy
GTLd1lTud5pF7rhgB5vIjlNgpiNOR5/IQyWZDXjs4EqZ+LD3pWcu59OeNPch/5jM
e3a6JO0pwDnfNMuDjUYz9D2+Pavpg1N2bMYDo4MxKrVta7Lqdx1wEOZRG391P2Kg
JDSMUwUuHwXFJrf1Fh74wLGlROK2TFXWXuxuvtk0//KH09/us4LfJGlNKvgYva93
1CBbNa1fnc+88+Y0p++LcM/6jMWTsZyOBvI9Oh6PlbB7xsTGKO7yJxIf2BRRfZeh
mdvFh+7YQMhLI4sB87TK7R6kw+mkg08lr0E2923Jn6MmE7oWQD1Rx4TEWM8I4RQs
wJ53Z/r9W9gZwBQxQ+HLxi/KKweh1nZRRP/9Z3BzeVmK8zk4ihM=
=T5j2
-----END PGP SIGNATURE-----

--XGZqOrNyWuP5I4V2--

