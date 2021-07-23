Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F6D3D35C3
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbhGWHQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:16:48 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:35801 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhGWHQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:16:48 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 80AA040005;
        Fri, 23 Jul 2021 07:57:19 +0000 (UTC)
Date:   Fri, 23 Jul 2021 09:57:19 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 06/13] media: i2c: Switch control to
 V4L2_CID_ANALOGUE_GAIN
Message-ID: <YPp2X71VoMV4O+io@aptenodytes>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GdqoQrFo9RXxs74D"
Content-Disposition: inline
In-Reply-To: <20210722203407.3588046-7-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--GdqoQrFo9RXxs74D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 22 Jul 21, 21:34, Daniel Scally wrote:
> The V4L2_CID_GAIN control for this driver configures registers that
> the datasheet specifies as analogue gain. Switch the control's ID
> to V4L2_CID_ANALOGUE_GAIN.

I had some doubts about this when writing the driver because it's called
"AEC gain" but it seems that you're right. The datasheet also defines
0x350a and 0x350b as digital gain (which are unused by the driver).

This is:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index c012f5cb11ab..09558a3342dd 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2137,7 +2137,7 @@ static int ov8865_exposure_configure(struct ov8865_=
sensor *sensor, u32 exposure)
> =20
>  /* Gain */
> =20
> -static int ov8865_gain_configure(struct ov8865_sensor *sensor, u32 gain)
> +static int ov8865_analog_gain_configure(struct ov8865_sensor *sensor, u3=
2 gain)
>  {
>  	int ret;
> =20
> @@ -2447,8 +2447,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
>  		if (ret)
>  			return ret;
>  		break;
> -	case V4L2_CID_GAIN:
> -		ret =3D ov8865_gain_configure(sensor, ctrl->val);
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D ov8865_analog_gain_configure(sensor, ctrl->val);
>  		if (ret)
>  			return ret;
>  		break;
> @@ -2493,7 +2493,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *=
sensor)
> =20
>  	/* Gain */
> =20
> -	v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 128, 8191, 128, 128);
> +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 8191, 128,=
 128);
> =20
>  	/* White Balance */
> =20
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--GdqoQrFo9RXxs74D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmD6dl8ACgkQ3cLmz3+f
v9EqeggAhd74OeKQ9EfYhrxk87Xwbzv4vpC7IgT75yC2Wgtz7cXH1+ZwbrUlRMxS
vUZGvrbKcaWZTskIsHSSZXyKDvfe3QzC4YSierJNGAQ1uoZa+db+dVrUqlBTXWE/
8F70MBOdOjMkOkJpMYDZ/TN6vn/x1831rdEwYddjGxwK0Tv9YuNochPWYGTB6QPF
7NAsbzl216bim1hcq5lsku6sKqHEfMtOZ+gwRqhj8L5Nu6Zh6hFrSMJo7fwHxy3g
HOWUiQhO96U1GD9XZr87m2CneWJ1OSKqmy6cobrYriG3iMv86pc204xV4kv+jzNV
QYAOwbpDIIr53ANW2qv/HgVae3f18Q==
=WUlq
-----END PGP SIGNATURE-----

--GdqoQrFo9RXxs74D--
