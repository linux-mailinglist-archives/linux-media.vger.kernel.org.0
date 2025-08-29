Return-Path: <linux-media+bounces-41360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E43FB3C3DF
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 22:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6B9B1754D4
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CD6345749;
	Fri, 29 Aug 2025 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gNqd7I3V"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB5D26AA98;
	Fri, 29 Aug 2025 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500050; cv=none; b=SpqRuKYkqQRY89W8EmEnu1dynu5t1FYYuA7K7YX8DppmjETG2Mk83hSiU1pQCHmTtIAWJp2S5alFVYTelZmeTe/cFAwQ0UuiMfraSbleGSr4YBObGZx964vxw8rbKVO8ozl5QD/OArkt/IYOK2lhxHL1byQMXrL03Fz4cW1dkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500050; c=relaxed/simple;
	bh=I8CwlXSBTwgwxu3TxfNEG1tZAhbaXk/EtR4fZjfV3QE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EJGaXiGyEVFQvmvkk53mSOJ89Ht5g2Vxjwt4n+Pp9AzzAqMJzZKmagwaRmTju/60RyAFpjC5G6vsmVU+Ht762hWmtawUur0J2+yUPKRMy6etvaVi+G39Q1BwQGIIjDQ97CY7B65EbkwH7rWjql25tJvbvBKvBkssfBf6T1FrzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gNqd7I3V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756500046;
	bh=I8CwlXSBTwgwxu3TxfNEG1tZAhbaXk/EtR4fZjfV3QE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gNqd7I3V2kK8F+jN/7krj/ToX/1tp49RtLkemehAJGrUsAiUB7U/oncyuzqO9Xc/U
	 gWl8XhtYQgaLY8mMWD/713WJs8tP0k9XY6as4FarG2BfMtBuQ/JH4VmU4M/ZqmnOkM
	 mLQ008O+XGWSvfvwO/Sym778TAYz0r/ZnDE1cHjBPYGz7nzvXUjAREyzJWmwXR38Uz
	 rBWSmmWVOYmPsKqfx7RY99oAOusPV7O6WSDy1+Sf7OG3oxWR70rQBQeVJvCbXqHXS+
	 g8AJNvulcA6zkxSFgnU+/2L4z+XkHdHrWhEK7meJmmzy/kD4bD0FPw+ErBdu4J9wUJ
	 wOT7I3tpqbyJg==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFCA817E011A;
	Fri, 29 Aug 2025 22:40:45 +0200 (CEST)
Message-ID: <f1ed610c7f92505182ab6210f9781cc8c24cf672.camel@collabora.com>
Subject: Re: [PATCH v2 0/4] Minor V4L2 Headers and Codec Doc Cleanups
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 29 Aug 2025 16:40:43 -0400
In-Reply-To: <20250824180735.765587-1-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-2dqrxcSrrxjdJtGEUXhK"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-2dqrxcSrrxjdJtGEUXhK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 ao=C3=BBt 2025 =C3=A0 20:07 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> Changes since v1:
> - Added minor codec control cleanups;
> - Added documentation about h.264 frame-wide type flags
>=20
> Paul Kocialkowski (4):
> =C2=A0 media: uapi: Move colorimetry controls at the end of the file
> =C2=A0 media: uapi: Cleanup tab after define in headers
> =C2=A0 media: uapi: v4l2-controls: Cleanup codec definitions

I've picked the 3 above.

> =C2=A0 Documentation: media: Document
> =C2=A0=C2=A0=C2=A0 V4L2_H264_DECODE_PARAM_FLAG_PFRAME/BFRAME

So you will only have to update this one.

cheers,
Nicolas

>=20
> =C2=A0.../media/v4l/ext-ctrls-codec-stateless.rst=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 +-
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 121 +++++++++---------
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +--
> =C2=A03 files changed, 75 insertions(+), 72 deletions(-)

--=-2dqrxcSrrxjdJtGEUXhK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLIQSwAKCRDZQZRRKWBy
9AMlAQDQpPKcQtWxjQLN3URtowrCD5QKm7eEuGwcXsis/7zP7wEA/2c71KaaLzpO
PqhRllgKVWZgntEBFqJWTdGMweltYw0=
=ag87
-----END PGP SIGNATURE-----

--=-2dqrxcSrrxjdJtGEUXhK--

