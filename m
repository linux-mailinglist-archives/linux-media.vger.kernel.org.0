Return-Path: <linux-media+bounces-50330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A644AD0C6EE
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 23:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E10E03016AC9
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 22:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABCE34252C;
	Fri,  9 Jan 2026 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dsh3RzNB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF63019A4
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996881; cv=none; b=uklO2JAtboZoRjpfR2IlONyHpQ7hgC2f/UbvFmwJGXciLfSPzgwJudmGyh7bwHZZua5g+NHP738u++HaV0dL5AHkH7htb5tvQsi62frO1BfXzsx9Xu2lH0Rl2fMnDNChjbOp7nU9RwnfDIO9sN7qP1xUVyLJBMmckO7cVHK7vh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996881; c=relaxed/simple;
	bh=3UrPH7c23PwLOEJQH/PMBXfdSjds+08uJuyJsFFyzzg=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=sIgBaLd17cNyqQrPu2WXEGOsHE9WiZVFcLj8wZ/ts7+K/syrU+5CcCkuReP7cvkVOVOmLjhGoOIwMe9Z8pk/GyPuFctlbbYlGqVFhBUEZ2ZoMRGoDbT8H6lgF5ReSoUYdP3fUGesRn7MPgmOQuoLJ5APxjbbmdO1/rdyDq1qLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dsh3RzNB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767996878;
	bh=3UrPH7c23PwLOEJQH/PMBXfdSjds+08uJuyJsFFyzzg=;
	h=Subject:From:To:Date:From;
	b=dsh3RzNB87suMzD+odScT7JMIt7W8hbBbLo9fLIiI6jS6SbhnXipBkJn46kA2KqUj
	 X3aDhiCvYgxyWHFnsfggqA4Q+jonWhCEJ0M7lGVrIFpWSz01wn/CwGRPpVSxkRNzdT
	 fHLZClfg6iHEGCZ1TjgObiPr6B7DzljLfMfzRnYNsV0M/YmR3N1C1WqBvGjJPZkNDH
	 tvbfffERbT8ESdcBjQCasgaBIg9pJdc+zWmF9B/rE03RxzbWLUCcGmiTDiru8JQzE6
	 7I+lvdfblkxFy+OdeH6BWzQg4c7aiOrWRrqdmnNISF+MBx73THUmss81g6KRXXA7Zg
	 9ZA9hJ+yQIz9w==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99EE717E1404
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 23:14:37 +0100 (CET)
Message-ID: <a2fd1988da766722c3fdb9fe069c04beebc2f169.camel@collabora.com>
Subject: [GIT PULL FOR 6.20] Media codec 2026-01-09
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Fri, 09 Jan 2026 17:14:35 -0500
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
	protocol="application/pgp-signature"; boundary="=-1qo+4r3nbRy/NlSwZaSV"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-1qo+4r3nbRy/NlSwZaSV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This is a small PR which include mostly bug fixes in Mediatek, Amphion and
Verisilicon codec driver and Rockchip RGA 2D m2m driver. The Amphion fixes =
comes
with documentation for the case where the decoder colorspace changes at run=
-
time, which was not clearly documented.

cheers,
Nicolas

---

The following changes since commit 336367fab9b96db7b0ee174443c426fc6c53b912=
:

  media: chips-media: wave5: Fix Potential Probe Resource Leak (2026-01-05 =
15:56:32 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.2.20-media-codecs-2026-01-09

for you to fetch changes up to f3267bbadecd3cad2a1187332c49c7dda1433f38:

  media: verisilicon: AV1: Set IDR flag for intra_only frame type (2026-01-=
09 16:42:27 -0500)

----------------------------------------------------------------
Media Codec Fixes

----------------------------------------------------------------
Alper Ak (1):
      media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_ini=
t()

Benjamin Gaignard (1):
      media: verisilicon: AV1: Set IDR flag for intra_only frame type

Ming Qian (5):
      media: docs: dev-decoder: Trigger dynamic source change for colorspac=
e
      media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
      media: amphion: Trigger source change if colorspace changed
      media: amphion: Use kmalloc instead of vmalloc
      media: amphion: Drop min_queued_buffers assignment

Rafael J. Wysocki (1):
      media: mediatek: vcodec: Discard pm_runtime_put() return value

 Documentation/userspace-api/media/v4l/dev-decoder.rst              |  5 ++=
++-
 drivers/media/platform/amphion/vdec.c                              | 78 ++=
++++++++++++++++++++++++++++++++++++++++++++++-----------------------------=
-
 drivers/media/platform/amphion/venc.c                              | 20 ++=
+++++++-----------
 drivers/media/platform/amphion/vpu_cmds.c                          | 15 ++=
+++++--------
 drivers/media/platform/amphion/vpu_core.c                          | 11 ++=
++-------
 drivers/media/platform/amphion/vpu_v4l2.c                          |  3 --=
-
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c |  6 +-=
----
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c |  6 +-=
----
 drivers/media/platform/rockchip/rga/rga-buf.c                      |  3 ++=
+
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    |  2 +-
 10 files changed, 78 insertions(+), 71 deletions(-)

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-1qo+4r3nbRy/NlSwZaSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWF9ywAKCRDZQZRRKWBy
9L4jAP0R4UECCk5r207cGUgd/zSYb8ug+/sVWPaW3pTIuBEfMgD/SYmPAQ77LdPS
Crdtoja4oKf9lxOOEE/ouSiMbSCYVw8=
=CsUQ
-----END PGP SIGNATURE-----

--=-1qo+4r3nbRy/NlSwZaSV--

