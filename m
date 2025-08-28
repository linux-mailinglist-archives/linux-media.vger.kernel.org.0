Return-Path: <linux-media+bounces-41286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7E5B3ABD7
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 22:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D0E3AAEA2
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 20:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFE529BD82;
	Thu, 28 Aug 2025 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UAHRav38"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC3284B27;
	Thu, 28 Aug 2025 20:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413760; cv=none; b=oz0Fwsr/JI+umV6O/fUmGfpSkBZ+dDEpXfQlujUyZMulhL3TEAyLQGbRpB0l7IRpP1e2dkuIl2PBKLxSRFxpcVKEk9p1AwhPeb+w3wnaCf0P1j5V5Kf9pMzqW34QTweNSLBD9Ag8oIJmquUpxbBlfFS9iSX6ncQh5Z4yszWb0xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413760; c=relaxed/simple;
	bh=4L7eKGL54LP7Lf3fSBhvcekiiQKwAWjLf8ThdR3NxB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6EKtGtDJYZpctN4xn08wzmvxxEXcdDlU8zQBHppiMj7u9jyzTEULHX+jVg8wjjcIrF7QI3QEAzTQyRR4JC8R81SNXbIRHq7wegZdPewA5K79t2DxtzFN7JsVdNDy7Mdq5uj5hFDOjy3dFjklCfhqcOPTQGZ+zpX0Bt0pEKwKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UAHRav38; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756413756;
	bh=4L7eKGL54LP7Lf3fSBhvcekiiQKwAWjLf8ThdR3NxB0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UAHRav38wbcZEZOREgrZ5rzOOynsg2Vk5lhGRCLQLXfw4cKFFib2uHc/oG8V+aKIx
	 fbqvIL5NLJF3Gpw5/vSvi24tuxbonGn4PY2Kkqp/H8cFIMn4s26MlDYPPaskhClafb
	 a+oMDF5yJghYCGEfycqLDxVPdQeFoIcmQjdlpaluhc9vX6zwHDxlUjFhqieRg00taU
	 B8VogDMz/KgyLzCq1w4ZEYYKUSA3Z9gmDYMpPuS569McgvX07Lwkf1h5jUHaaU8bk0
	 q8IZWHJK8V6cRY53IVlDrLEDmfmm8gSFYVfbaIhTtN058H0uKtvYmBSYRk/QVlm+q2
	 YBE38sd+4L6Zw==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64B2117E0CF8;
	Thu, 28 Aug 2025 22:42:35 +0200 (CEST)
Message-ID: <5065e67544ae9255b2136a6cd73cbb9ffd08e3fb.camel@collabora.com>
Subject: Re: [PATCH v2 4/4] Documentation: media: Document
 V4L2_H264_DECODE_PARAM_FLAG_PFRAME/BFRAME
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 28 Aug 2025 16:42:32 -0400
In-Reply-To: <20250824180735.765587-5-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
	 <20250824180735.765587-5-paulk@sys-base.io>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lValZJkHsUrv43G3L0AC"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-lValZJkHsUrv43G3L0AC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 ao=C3=BBt 2025 =C3=A0 20:07 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> These flags are meant for a very specific use-case, add a mention of it.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0.../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 8 +++++=
+--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 0da635691fdc..de1e3873385c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -618,10 +618,14 @@ Stateless Codec Control ID
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000008
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - All submitted slices for the frame are =
P slices. This is a compability
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flag required for decoders th=
at only support decoding such frames, but
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should not be required for sl=
ice-based decoders.

Seems to match the comment in Tegra driver, and related to a hardware
limitation. Shall we also recommend not to use this unless similar limitati=
on
exists ?

Note that mix of P and I, or, B and I, should still work on Tegra, its mixi=
ng P
and B that will fail since one of the reference list will be missing. At le=
ast,
this is my understanding.

Nicolas

> =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000010
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - All submitted slices for the frame are =
B slices. This is a compability
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flag required for decoders th=
at only support decoding such frames, but
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should not be required for sl=
ice-based decoders.
> =C2=A0
> =C2=A0.. raw:: latex
> =C2=A0

--=-lValZJkHsUrv43G3L0AC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLC/OQAKCRDZQZRRKWBy
9JjtAQCT0AE/Vs9U8O+KaUh1qw6aB8BbYFDjkxOlrZZk25FPpQD/XVEZOc1kVdFy
NsYX7DCRZJ7PzA3mkDkhUEzEMotq5gw=
=4NKf
-----END PGP SIGNATURE-----

--=-lValZJkHsUrv43G3L0AC--

