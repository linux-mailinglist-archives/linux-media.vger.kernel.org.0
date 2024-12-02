Return-Path: <linux-media+bounces-22428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4189E01F5
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B7D16698F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7136820897F;
	Mon,  2 Dec 2024 12:09:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664BD1FCCFF;
	Mon,  2 Dec 2024 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141346; cv=none; b=oI6ucTDe5XDu93v/qBJe6dzNiRr5ciZ0DG8yfZtclu7GoaLTsLucPvnEFB8OfmNjeHkyzFruHCZUyf34jAHsVoKnZHyqU6wIW8bU6Wc410EN3TOc0yZsa8lbrFkWqn0X9cR5ygvymJAUiO9A4kPaArq5ajbKJoft/AuO+UHmsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141346; c=relaxed/simple;
	bh=mOi8W3wVsrQauILB4kas0jCG/bLdMysTBqVIe71yPP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW6wHZ3AdQ9j3D4vt/mh7CADmeqFVxDJFkys7pwrDCDKWbRQpwRzkIaBBahB4t+1jhN+UulhYYzBsFTuGfHeJSUGK0TTw6m/SHMkMM/NdpNIZL8v0gudGNqOdy7QqW9RyYasXGmDJDkGiUviCFPvaR8CGPROF61uowVS1zuaKVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id BDFCD1C00A0; Mon,  2 Dec 2024 13:09:02 +0100 (CET)
Date: Mon, 2 Dec 2024 13:09:02 +0100
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
	hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, naush@raspberrypi.com,
	jeanmichel.hautbois@ideasonboard.com,
	benjamin.gaignard@collabora.com, linux-media@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 1/6] media: v4l: Add luma 16-bit interlaced
 pixel format
Message-ID: <Z02jXu7dWhjSqX/G@duo.ucw.cz>
References: <20241124125742.3341086-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cw9RYO/zAzrcrqjt"
Content-Disposition: inline
In-Reply-To: <20241124125742.3341086-1-sashal@kernel.org>


--Cw9RYO/zAzrcrqjt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Dmitry Perchanov <dmitry.perchanov@intel.com>
>=20
> [ Upstream commit a8f2cdd27d114ed6c3354a0e39502e6d56215804 ]
>=20
> The formats added by this patch are:
>=20
>         V4L2_PIX_FMT_Y16I
>=20
> Interlaced lumina format primary use in RealSense Depth cameras with
> stereo stream for left and right image sensors.

This will add unneeded defines to -stable.

Best regards,
								Pavel
							=09
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> @@ -0,0 +1,73 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y16I:
> +
> +**************************
> +V4L2_PIX_FMT_Y16I ('Y16I')
> +**************************
> +
> +Interleaved grey-scale image, e.g. from a stereo-pair
> +
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is a grey-scale image with a depth of 16 bits per pixel, but with p=
ixels
> +from 2 sources interleaved and unpacked. Each pixel is stored in a 16-bi=
t word
> +in the little-endian order. The first pixel is from the left source.
> +
> +**Pixel unpacked representation.**
> +Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - Y'\ :sub:`0L[7:0]`
> +      - Y'\ :sub:`0L[15:8]`
> +      - Y'\ :sub:`0R[7:0]`
> +      - Y'\ :sub:`0R[15:8]`
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00Llow`
> +      - Y'\ :sub:`00Lhigh`
> +      - Y'\ :sub:`00Rlow`
> +      - Y'\ :sub:`00Rhigh`
> +      - Y'\ :sub:`01Llow`
> +      - Y'\ :sub:`01Lhigh`
> +      - Y'\ :sub:`01Rlow`
> +      - Y'\ :sub:`01Rhigh`
> +    * - start + 8:
> +      - Y'\ :sub:`10Llow`
> +      - Y'\ :sub:`10Lhigh`
> +      - Y'\ :sub:`10Rlow`
> +      - Y'\ :sub:`10Rhigh`
> +      - Y'\ :sub:`11Llow`
> +      - Y'\ :sub:`11Lhigh`
> +      - Y'\ :sub:`11Rlow`
> +      - Y'\ :sub:`11Rhigh`
> +    * - start + 16:
> +      - Y'\ :sub:`20Llow`
> +      - Y'\ :sub:`20Lhigh`
> +      - Y'\ :sub:`20Rlow`
> +      - Y'\ :sub:`20Rhigh`
> +      - Y'\ :sub:`21Llow`
> +      - Y'\ :sub:`21Lhigh`
> +      - Y'\ :sub:`21Rlow`
> +      - Y'\ :sub:`21Rhigh`
> +    * - start + 24:
> +      - Y'\ :sub:`30Llow`
> +      - Y'\ :sub:`30Lhigh`
> +      - Y'\ :sub:`30Rlow`
> +      - Y'\ :sub:`30Rhigh`
> +      - Y'\ :sub:`31Llow`
> +      - Y'\ :sub:`31Lhigh`
> +      - Y'\ :sub:`31Rlow`
> +      - Y'\ :sub:`31Rhigh`
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Docu=
mentation/userspace-api/media/v4l/yuv-formats.rst
> index 4a05a105a9e6c..d49e47137466b 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -35,6 +35,7 @@ to brightness information.
>      pixfmt-y16-be
>      pixfmt-y8i
>      pixfmt-y12i
> +    pixfmt-y16i
>      pixfmt-uv8
>      pixfmt-yuyv
>      pixfmt-uyvy
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 6d6d30dbbe68b..97f61e564babf 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1303,6 +1303,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_Y10P:		descr =3D "10-bit Greyscale (MIPI Packed)"; br=
eak;
>  	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; brea=
k;
> +	case V4L2_PIX_FMT_Y16I:		descr =3D "Interleaved 16-bit Greyscale"; brea=
k;
>  	case V4L2_PIX_FMT_Z16:		descr =3D "16-bit Depth"; break;
>  	case V4L2_PIX_FMT_INZI:		descr =3D "Planar 10:16 Greyscale Depth"; brea=
k;
>  	case V4L2_PIX_FMT_CNF4:		descr =3D "4-bit Depth Confidence (Packed)"; b=
reak;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 1bbd81f031fe0..579beac6f4754 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -735,6 +735,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C=
73M3 interleaved UYVY/JPEG */
>  #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greysca=
le 8-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greysca=
le 12-bit L/R interleaved */
> +#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greysca=
le 16-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth d=
ata 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediate=
k compressed block mode  */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel P=
lanar Greyscale 10-bit and Depth 16-bit */

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--Cw9RYO/zAzrcrqjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ02jXgAKCRAw5/Bqldv6
8pUFAKCv48+z3tVK9R9eGd7QZ8n9sPe2XACfZX2ddPCIUpo5OCwbX/ecqzBiwnA=
=ZHow
-----END PGP SIGNATURE-----

--Cw9RYO/zAzrcrqjt--

