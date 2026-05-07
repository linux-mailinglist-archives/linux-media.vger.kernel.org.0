Return-Path: <linux-media+bounces-60788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LXBFxJ//GnXQgAAu9opvQ
	(envelope-from <linux-media+bounces-60788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:01:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AA4E7E7D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE880302E7AB
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30902318BB8;
	Thu,  7 May 2026 12:00:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139053C4540
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155222; cv=none; b=BPBXuoR8sp5wcSqgaO7PFSbjkN5nXwcg1PYJa81p3tfjKRVfcdVAzZ2sw2tQH7slehLsNOvJBVYy/rEMEOUghcFsgsFT8OSRczFdfBlbXvygOh8aA+8hscFhAFb9tupl+44DYdzdcJfIaEr+3tpchGw6rDXfy4L8HxXE3VbQZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155222; c=relaxed/simple;
	bh=ATMWnb6Grkm0Gbu46ELO+Q0N2C0naX1pLR0YbAHR3l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS9zGl3wT0LUcT2S17bxvAsbfM1JgkR+0+nTJXAZr1x8ed+hnESsUC43NVrh+hhedphtKTPNpB0saPLP0OzdjMtHdZS9faaZDhaZ4FBpxRPAd5ZT2TT3wpKkvo9+bbjGE8eby3inG0kwOdJefG2SImQp1fZ/E3RY2+jOmDBWqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id CC1AB1F8005A
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 12:00:13 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9E447B405F4; Thu,  7 May 2026 12:00:12 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 0E42EB405F5;
	Thu,  7 May 2026 12:00:11 +0000 (UTC)
Date: Thu, 7 May 2026 14:00:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Message-ID: <afx-yCUZAvWfMNEe@collins>
References: <20260214050943.6306-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jAK7OkBdi7oBD3We"
Content-Disposition: inline
In-Reply-To: <20260214050943.6306-1-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: AB3AA4E7E7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,sholland.org,lists.linux.dev,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-60788-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:email,sys-base.io:url,paulk.fr:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action


--jAK7OkBdi7oBD3We
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Sat 14 Feb 26, 08:39, Arash Golgol a =C3=A9crit :
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>=20
> The sun6i-mipi-csi2 hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
>=20
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Looks very good. Feel free to let me know if you'd like to do the same
with A83T (I could test it on my side), otherwise I will take a look at
it later. The driver has essentially exactly the same structure.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
> Changes in v3:
>     - link to v2: https://patchwork.kernel.org/project/linux-media/patch/=
20260209055529.16644-1-arash.golgol@gmail.com/
>     - Keep error path jumping to error_v4l2_notifier_cleanup on=20
>     bridge setup failure
>=20
> Changes in v2:
>     - link to v1: https://patchwork.kernel.org/project/linux-media/patch/=
20260206123455.46476-1-arash.golgol@gmail.com/
>     - Simplify control flow by dropping the else at end of s_stream()
>     - Call v4l2_subdev_cleanup() on bridge setup failure before=20
>     notifier registration
>=20
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  2 files changed, 53 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
=2Ec b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> index b06cb73015cd..682bdd82098c 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi=
_csi2_device *csi2_dev)
>  			   SUN6I_MIPI_CSI2_CTL_EN, 0);
>  }
> =20
> -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi=
2_dev)
> +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi=
2_dev,
> +				       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap =3D csi2_dev->regmap;
>  	unsigned int lanes_count =3D
>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> -	struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus_forma=
t;
>  	const struct sun6i_mipi_csi2_format *format;
>  	struct device *dev =3D csi2_dev->dev;
>  	u32 version =3D 0;
> @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>  	struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_subdev;
>  	union phy_configure_opts dphy_opts =3D { 0 };
>  	struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi_dphy;
> -	struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus_forma=
t;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *mbus_format;
>  	const struct sun6i_mipi_csi2_format *format;
>  	struct phy *dphy =3D csi2_dev->dphy;
>  	struct device *dev =3D csi2_dev->dev;
> @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subd=
ev *subdev, int on)
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
> @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
> =20
>  	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	/* Sensor Pixel Rate */
> =20
> @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>  		goto error_pm;
>  	}
> =20
> +	mbus_format =3D v4l2_subdev_state_get_format(state,
> +						   SUN6I_MIPI_CSI2_PAD_SINK);
>  	format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
>  	if (WARN_ON(!format)) {
>  		ret =3D -ENODEV;
> @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
> =20
>  	/* Controller */
> =20
> -	sun6i_mipi_csi2_configure(csi2_dev);
> +	sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
>  	sun6i_mipi_csi2_enable(csi2_dev);
> =20
>  	/* D-PHY */
> @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>  	if (ret && ret !=3D -ENOIOCTLCMD)
>  		goto disable;
> =20
> -	return 0;
> +	ret =3D 0;
> +	goto unlock;
> =20
>  disable:
>  	phy_power_off(dphy);
> @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>  error_pm:
>  	pm_runtime_put(dev);
> =20
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
> =20
> @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbu=
s_framefmt *mbus_format)
>  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
>  				      struct v4l2_subdev_state *state)
>  {
> -	struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(subdev);
> -	unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
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
> -	mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> -	mbus_format->width =3D 640;
> -	mbus_format->height =3D 480;
> +		mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> =20
> -	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +		mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> +		mbus_format->width =3D 640;
> +		mbus_format->height =3D 480;
> =20
> -	mutex_unlock(lock);
> +		sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +	}
> =20
>  	return 0;
>  }
> @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *=
subdev,
>  	return 0;
>  }
> =20
> -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> -				   struct v4l2_subdev_state *state,
> -				   struct v4l2_subdev_format *format)
> -{
> -	struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(subdev);
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
>  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_format *format)
>  {
> -	struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -	struct mutex *lock =3D &csi2_dev->bridge.lock;
> +	struct v4l2_mbus_framefmt *fmt;
> =20
> -	mutex_lock(lock);
> +	/* The format on the source pad always matches the sink pad. */
> +	if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> +		return v4l2_subdev_get_fmt(subdev, state, format);
> =20
> -	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +	sun6i_mipi_csi2_mbus_format_prepare(&format->format);
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
> +	fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
> +	*fmt =3D format->format;
> =20
>  	return 0;
>  }
> =20
>  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D {
>  	.enum_mbus_code	=3D sun6i_mipi_csi2_enum_mbus_code,
> -	.get_fmt	=3D sun6i_mipi_csi2_get_fmt,
> +	.get_fmt	=3D v4l2_subdev_get_fmt,
>  	.set_fmt	=3D sun6i_mipi_csi2_set_fmt,
>  };
> =20
> @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_=
mipi_csi2_device *csi2_dev)
>  	bool notifier_registered =3D false;
>  	int ret;
> =20
> -	mutex_init(&bridge->lock);
> -
>  	/* V4L2 Subdev */
> =20
>  	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i=
_mipi_csi2_device *csi2_dev)
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
> @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_=
mipi_csi2_device *csi2_dev)
>  error_v4l2_notifier_cleanup:
>  	v4l2_async_nf_cleanup(notifier);
> =20
> +	v4l2_subdev_cleanup(subdev);
> +
> +error_media_entity_cleanup:
>  	media_entity_cleanup(&subdev->entity);
> =20
>  	return ret;
> @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2=
_device *csi2_dev)
>  	v4l2_async_unregister_subdev(subdev);
>  	v4l2_async_nf_unregister(notifier);
>  	v4l2_async_nf_cleanup(notifier);
> +	v4l2_subdev_cleanup(subdev);
>  	media_entity_cleanup(&subdev->entity);
>  }
> =20
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
=2Eh b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> index 24b15e34b5e8..d72dfbd6a993 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
>  	struct media_pad		pads[SUN6I_MIPI_CSI2_PAD_COUNT];
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

--jAK7OkBdi7oBD3We
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn8fsgACgkQhP3B6o/u
lQyq+A//S/KyWcOYNInrRYaSKqYBTbjnC6kP6lVRNISd311gvCyMWBTI/k2n1eHd
aU9vOxYbASPp1EsnmYrPTR1OKWQvzrS2IDKO0YiQYU8WkAEZIDMNZZ1qZMsjoilQ
kej2v8+a6XZwchDZn+D7NJrvo1tbjzFGudtedQJKhpC1cHXkPWYHZYf0BNoP9Yr5
dWR7pKfTHidDhY8BsZHRDjTad/Sq1OG9SXzGuACJVZPiDir5b214wYxZNJlFexAq
EB4hYO8xFtxUeOyhYvfNgqfN3dAu/1oibPbB/30a3D/kWW5LwAPL1HOVXN7ZxGOn
qAZvjZrWJGpNH1gZCPe5b1Egf/Iu3Tez2/45ODbh5/w/JYpcoOZaeuB/SZfffBOV
29V3Zt3yYggIzPVg+J9CJHKyUPd+B/G1Cup8zVySO5wROzEc+sGIsO3hMYmXha7U
ikSpJj4CY4mUec6ek02ORq/e909qmKYkVoGaio/62jbUxAftl1SHQ6zhTJra/FFZ
K17CMOzsuKQpARJbAOhDE+ZmuSwcaC1zHNkkFjU5p6wVWSdifhPLwxoEZ/5Qa1QB
ZniZq1hsI26ZXTMQSsRuRhT93os5UsZ9PLKJwJspPuaJJPr4jjYIOQxJXntnp54K
zT00C5ypxXu2kgW+4MQq3whhT9+avr5VEtyJjWuau9jfTYwKunw=
=k7Mu
-----END PGP SIGNATURE-----

--jAK7OkBdi7oBD3We--

