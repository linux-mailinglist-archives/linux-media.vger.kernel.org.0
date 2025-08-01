Return-Path: <linux-media+bounces-46119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E167C28808
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 22:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0312A4E2472
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 21:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F1028853E;
	Sat,  1 Nov 2025 21:27:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E085184;
	Sat,  1 Nov 2025 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762032460; cv=none; b=kZJGKgEmSSDis511gh1XhfANdnLO1tcQVbaUx0TGeQbzkZtt821VOiUZ4Di2p1HWUTBxITsyr/PtczTqzJSC/1BR0UN4TEZ9jf2dXU6abM9Ig4eHHp/dAszONNPBfRLmHMvd7xyXeaVgBqQob5BoMX2piR0x87OpftLbfoCCZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762032460; c=relaxed/simple;
	bh=IyMOrE3IZXQkr57uglInK4/AoFrP2M5HRazI6poDrPc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tcs4yGbl+1MO4vslLpkBpoYY9+ryJVlqRy/5MF5dddwp10xPYuvIxA2yfwK+QcWTAx+qXaOUpfL0PZ9KgvQYKSeAqYsF/rWxIBDm4xOQFoiZNfzqq5ECGPXndTJZGQWL0nXFtWMPevlJhCaRO070WDvMnSXsFsHFW29Dn/NCTks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ndufresne.ca; spf=fail smtp.mailfrom=ndufresne.ca; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ndufresne.ca
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1674F17E13F9;
	Sat,  1 Nov 2025 22:27:28 +0100 (CET)
Message-ID: <4d1260be46be22d7b40fab9788763af796d118dc.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/4] media: docs: dev-decoder: Trigger dynamic
 source change for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250418085422.193-2-ming.qian@oss.nxp.com>
References: <20250418085422.193-1-ming.qian@oss.nxp.com>
	 <20250418085422.193-2-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7roVwGdgaHQCxf+hVe0E"
Date: Fri, 01 Aug 2025 11:23:35 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 


--=-7roVwGdgaHQCxf+hVe0E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Le vendredi 18 avril 2025 =C3=A0 16:54 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> When a colorspace change in the stream, the decoder sends a
> V4L2_EVENT_SOURCE_CHANGE event with changes set to
> V4L2_EVENT_SRC_CH_COLORSPACE. After client receive this source change
> event, then client can switch to the correct stream setting. And each
> frame can be displayed properly.

sorry for the long delay. While reading this, in any case userspace have to=
 read
the new format. Why can't userspace compare the old and new v4l2_format and
decide to avoid re-allocation that way ?

There is also backward compatbility issues for driver that was sending
V4L2_EVENT_SRC_CH_RESOLUTION for colorspace change before. Despite the cost=
ly
re-allocation, userspace only watching for V4L2_EVENT_SRC_CH_RESOLUTION wou=
ld
endup not updating the colorspace anymore.

Combining both would be an option, but then V4L2_EVENT_SRC_CH_RESOLUTION me=
ans
any v4l2_format changes, which is awkward. What do you think of leaving to
userspace the task of comparing the old and new v4l2_format ?

Nicolas

>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v2
> - Add V4L2_EVENT_SRC_CH_COLORSPACE for colorspace source change event
>=20
> =C2=A0.../userspace-api/media/v4l/dev-decoder.rst=C2=A0=C2=A0=C2=A0=C2=A0=
 | 17 +++++++++++++----
> =C2=A01 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index ef8e8cf31f90..51d6da3eea4a 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -784,8 +784,8 @@ before the sequence started. Last of the buffers will=
 have
> the
> =C2=A0must check if there is any pending event and:
> =C2=A0
> =C2=A0* if a ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
> -=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION`` is pending, the `Dynamic Resolut=
ion
> -=C2=A0 Change` sequence needs to be followed,
> +=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION`` or ``V4L2_EVENT_SRC_CH_COLORSPAC=
E`` is
> pending,
> +=C2=A0 the `Dynamic Resolution Change` sequence needs to be followed,
> =C2=A0
> =C2=A0* if a ``V4L2_EVENT_EOS`` event is pending, the `End of Stream` seq=
uence
> needs
> =C2=A0=C2=A0 to be followed.
> @@ -932,13 +932,17 @@ reflected by corresponding queries):
> =C2=A0
> =C2=A0* the minimum number of buffers needed for decoding,
> =C2=A0
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed.
> =C2=A0
> =C2=A0Whenever that happens, the decoder must proceed as follows:
> =C2=A0
> =C2=A01.=C2=A0 After encountering a resolution change in the stream, the =
decoder sends a
> =C2=A0=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SOURCE_CHANGE`` event with ``change=
s`` set to
> -=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> +=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION``, or a colorspace cha=
nge in the stream,
> the
> +=C2=A0=C2=A0=C2=A0 decoder sends a ``V4L2_EVENT_SOURCE_CHANGE`` event wi=
th ``changes`` set
> to
> +=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_COLORSPACE``.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 .. important::
> =C2=A0
> @@ -946,6 +950,11 @@ Whenever that happens, the decoder must proceed as
> follows:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 values applying to the stream =
after the resolution change, including
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue formats, selection recta=
ngles and controls.
> =C2=A0
> +.. note::
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A ``V4L2_EVENT_SOURCE_CHANGE`=
` event with ``changes`` set to
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTIO=
N`` will affect the allocation, but
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_COLORSPAC=
E`` won't.
> +
> =C2=A02.=C2=A0 The decoder will then process and decode all remaining buf=
fers from
> before
> =C2=A0=C2=A0=C2=A0=C2=A0 the resolution change point.
> =C2=A0

--=-7roVwGdgaHQCxf+hVe0E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaIzb9AAKCRDZQZRRKWBy
9J4AAPsHUIFEn3VY8agsSDDBhYSCgjQgdq6VCsTIZOI/onEoFwD/eMf1L5FSeA/7
DuR3YPAOrYGgjgJ5M4KhzEvWSIq08ws=
=mLm3
-----END PGP SIGNATURE-----

--=-7roVwGdgaHQCxf+hVe0E--

