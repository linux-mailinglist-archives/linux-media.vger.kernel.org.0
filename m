Return-Path: <linux-media+bounces-46064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 485D9C246EB
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 11:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4F6B1A668C5
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6707333F8BD;
	Fri, 31 Oct 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gpmC05Tw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6E33EB01
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906060; cv=none; b=U7BvBegwnw6QKlErXMeDhZgQvmG6JaUa7eJ3BnHaf11cnFmOmWIj2LpuMJniifnBy8s7ZETo3uzbnQMCuga/DEXg/FAqrgk1mcnwt9lLCDInwTyX4TSwHUJ8Q4TL0I1L0H/trl4fIclxLQQP02QO0Ap1vmFYNJax5O2INbesBbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906060; c=relaxed/simple;
	bh=l1B6TuOYrSwKUZPphX0maYNqpZnL2xsN3i/UuUl8eRM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=YqtSZWE27HDBugvHFWvsGQhulznQSkrFY5WnwtmvJ1D/uONCZC8tQSIlU7Rmj2XZIB1ZBvq9Uf7/ZSf+EaQ08IyCkDRi6k0P9fR+iOhTt5nRRqX7S5r720xreLF+p9BUdM+rY71W3nO9ccES+ZVITjETDeuMF//pLtxmnM++Zqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gpmC05Tw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761906056;
	bh=l1B6TuOYrSwKUZPphX0maYNqpZnL2xsN3i/UuUl8eRM=;
	h=Subject:From:To:Date:From;
	b=gpmC05Tw8oCXkv6mw3flho7Ve6HOjHpQ0r/aFZxyJYcTbXppZcoc2EQsc0L3pcIzu
	 EuCt6SOvwhL4QMJohanQmcsizfuSebMLZ4dDyq24DAQbsH4XmCyu92tB63VMpis7Oz
	 zW/naDrpeaAmFlNoo3C3pqmnPENxPnBHJeuiFlBzOC1rCvO970Sr94uzwjOeFUl/QQ
	 qsnQhe4CCW/BWbUuTghtJ4GSCiHnIVe0hb1BUaz4sQWuLUZGvmkWZH3AO6tjZExfL3
	 hl7NpjWiE9AKEJ87hbRkJ/Y8FRWNWvkNsmA4/klH8fk49fU0pwRPtOpEwzrBRWAgdd
	 u9KV1vHdNShJQ==
Received: from [192.168.50.47] (unknown [157.125.35.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77D3017E127F
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 11:20:56 +0100 (CET)
Message-ID: <c49179857e95007bb8f69e4cb3b894b4fffaeadd.camel@collabora.com>
Subject: [GIT PULL FOR 6.19] Media CODEC RKVDEC HEVC 2025-10-31
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Fri, 31 Oct 2025 10:20:55 +0000
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
	protocol="application/pgp-signature"; boundary="=-mTm36vLX7OIcmSvvFxF8"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mTm36vLX7OIcmSvvFxF8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This set has been in the making for many years now and I think they are rea=
dy to
be merged. I hoped to bundle these with more of the newer Rockchip decoder =
work,
but it turns out these will need perhaps few more days or week.

cheers,
Nicolas

---

The following changes since commit 163917839c0eea3bdfe3620f27f617a55fd76302=
:

  MAINTAINERS: Update Daniel Scally's email address (2025-10-29 14:07:02 +0=
100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.19-rkvdec-2025-10-31

for you to fetch changes up to ead77fc69f088d294511c8d66f959e00a692c71c:

  media: dt-bindings: rockchip,vdec: Add RK3288 compatible (2025-10-31 10:1=
0:42 +0000)

----------------------------------------------------------------
Rockchip HEVC decode

----------------------------------------------------------------
Alex Bee (3):
      media: rkvdec: Add variants support
      media: rkvdec: Add RK3288 variant
      media: rkvdec: Disable QoS for HEVC and VP9 on RK3328

Jonas Karlman (3):
      media: rkvdec: Add HEVC backend
      media: rkvdec: Implement capability filtering
      media: dt-bindings: rockchip,vdec: Add RK3288 compatible

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml |    1 +
 drivers/media/platform/rockchip/rkvdec/Makefile            |    2 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c  | 1848 ++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c       |  820 ++++++++=
++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h       |    4 +
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c        |    4 +
 drivers/media/platform/rockchip/rkvdec/rkvdec.c            |  198 ++++++++=
+++--
 drivers/media/platform/rockchip/rkvdec/rkvdec.h            |   17 ++
 8 files changed, 2874 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data=
.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-mTm36vLX7OIcmSvvFxF8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQSNhwAKCRDZQZRRKWBy
9AWmAP420eDyClx7wFCxdCpdKRb28iFTJflDV7NDLqRcmJvFxAEAizVV3XSLGBHc
8/FWuxvhPRGS4NsgSNsA69PknFlQoAo=
=jcU0
-----END PGP SIGNATURE-----

--=-mTm36vLX7OIcmSvvFxF8--

