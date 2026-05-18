Return-Path: <linux-media+bounces-62004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCxxF30fC2reDgUAu9opvQ
	(envelope-from <linux-media+bounces-62004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:17:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E456E8DC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1193630A3915
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF4948AE06;
	Mon, 18 May 2026 14:09:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4933F8899;
	Mon, 18 May 2026 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113394; cv=none; b=lXvAKfoy+rFsPX+6C/CVdYo1UO13ZOySjUaaCcyDyH7JeYHQHhArZoTycKbg9x23LTFTkDDzVZcadBGxH9Sw1KCQNitLlkTTflyd6SCGx4HbZEdjavmWWzRStKOuNN1zx8ztzBswilT5OHW/CLmLESRjT/drfPX0pnuth3hcv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113394; c=relaxed/simple;
	bh=THJGQ+eQ19c1iPFtahMpjAefG/fJYGebs2EgmM4psOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCstvdYqTMWYy/m/ml1gfQMg4bv1Xbx65QpU89VfCX+G/iMsc2lgrjNbxZIHvEaC5qbmAzyvun1/T9BDniQLQLApY273NV0WBjE0twKNwluiLFpqlb/7fMMTYrytdaTRcnu0ZBMzxJt1VJpTd2AlvTam4y1id7OhT4+IxCbb26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5F4F21F8005C;
	Mon, 18 May 2026 14:09:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 35017B407F7; Mon, 18 May 2026 14:09:46 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 33A58B407F5;
	Mon, 18 May 2026 14:09:44 +0000 (UTC)
Date: Mon, 18 May 2026 16:09:41 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 04/16] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev
 active state
Message-ID: <agsdpcxifnFwaUu3@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-5-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SmpESyxiLXAcu4zS"
Content-Disposition: inline
In-Reply-To: <20260518102451.417971-5-paulk@sys-base.io>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62004-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paulk.fr:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sys-base.io:url,sys-base.io:email]
X-Rspamd-Queue-Id: B70E456E8DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--SmpESyxiLXAcu4zS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Mon 18 May 26, 12:24, Paul Kocialkowski a =C3=A9crit :
> From: Arash Golgol <arash.golgol@gmail.com>
>=20
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>=20
> The sun8i-a83t-mipi-csi2 hardware does not perform any format
> conversion. Enforce identical formats on the sink and source pads in
> the set_fmt() and init_state() callbacks.
>=20
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

I forgot to pick it up but this is already:

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>

Paul

> ---
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
> 2.54.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--SmpESyxiLXAcu4zS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLHaUACgkQhP3B6o/u
lQxtAg//S2QfTj832c+YdD3o+iJ3BWs9KibhqT9dGuWMlWVc/9HZIlEsqYfjH5x4
Bxvv9Uz2F46nRp3UB4H5aqDC0s1cp7h2T2vGfo/UIZ3QAKUSzuC3Kt/NUltvEC9z
/8XZGNj7Y5t5Op2lhlvsxMN8o3fB2blmd53xQjxSQKYuLK6jQwSmgo9LmGOcNgRu
yRw8+D9nm1f9MC2Tb1JMlKnNLnDPuFLhtscgwSzOw/vxSj1EkiXnDH8wiBerG0IR
375DfqmVwCmZfX0bjAeObTplFu5hzLDBZbHwBm9QxC6SBHEw9KeOC/4VJF9wApM4
foqMGlyHbjpZEv/b56hqwpD7LIfyk/7dprJDKvvGyurnRXyVJIkpAkPymAaPMlre
ik/2xFiorIjXjhbqEHndObXu5F7CxTVirQNbSFHtBr/KytuSZN/KFvu1PN75qrJl
lJDe57UVDA1h8q6GUjHd/cLnTZN4YZgOLOidjEYKi0JQd/am3nz8iRaVolzMK++p
8IhvjsnHYOemh8XsbQ9jGimWzrZqR1LnBc/kcpr0GCohmD7ttQQ50YK4CtYNXFip
qBuyLkQDfzfcyMMgXj00KbQbEwndjkF58In4kWwqpCrmmAET0U8/afswDv1+J7Qu
EwAdL0JFWWndXIYllxNVnzepuUdwbXov4HzLRMY1AfZr/ajf8Gk=
=vz53
-----END PGP SIGNATURE-----

--SmpESyxiLXAcu4zS--

