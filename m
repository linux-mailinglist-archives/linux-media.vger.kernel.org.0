Return-Path: <linux-media+bounces-44930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC7BEAF78
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 19:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59390744740
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7CF2ECD28;
	Fri, 17 Oct 2025 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KRaj5tm9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545882D7DCE
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720166; cv=none; b=fnvD4406k7Usjs+50/fGYIeutigcCt1wi+OsBKsSFMpgszlCU+B6gkd+3Dsb1OT50n5erQn+G/4pCAFJNE0SfZRuTBMfmZU2e4BcgQM5+7K1e0V4f71YJ8Y4owAh13biRDSwRQJi+fNbAPfwFnlAQWJu3qsZ/AIxDMkLrdp1SiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720166; c=relaxed/simple;
	bh=SgDXVXTlvwz1ckdkfQFdEAB+Hh3IaVKux7HrbYLr8IE=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=j8PwHeOkFp5RFClgj495Fum1RoikcPgUwpZfl5afU/Z7BoDs9JkGgQJjAZwuryf32+LaToUrlHgZpd+9ZRpZfk0gAsDS4q8BvG7Idhh6BCeMpfm8msE8+sHWv6W3cX5BvFzHDjQOp/yGDChZvJodd7KYOfhNCi7wtsq5Ic7r4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KRaj5tm9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760720160;
	bh=SgDXVXTlvwz1ckdkfQFdEAB+Hh3IaVKux7HrbYLr8IE=;
	h=Subject:From:To:Date:From;
	b=KRaj5tm9ggeefv9TTfr3w3cfl2oIprmCufbJ33NiRxEPSYi6WrKoXy6fajaasjZl4
	 zLj96BrQPW3G8WHM4ERxLzuTEinme03Fn8m6bVABsYH8VWj41oy7YM4gXX/vmCuQHJ
	 tFK77qSJfwpc/3V3X5UBokECBV37n6lKOgQt1nEYouoRwd083Yqka1rzLG20UEHGls
	 W8hmc0bGuB04kyPaoe0bTZi7EUesLipfRLrsblu/yth5WcPpjep/iRWUv9ZP5h+B/D
	 ooaghdpTvWlsdtFjNVlp1l0W9B7X5FY2z6A+WgsyTSs7dVmy7yPC8ipLCFHp+3uP5g
	 VR1DLm88JYbUw==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DE3717E1267
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:56:00 +0200 (CEST)
Message-ID: <dbccf041ba384d61d9a7f048d7eaab111af85dbb.camel@collabora.com>
Subject: [GIT PULL v2 FOR 6.19] Media CODEC Fixes 2025-10-17
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Fri, 17 Oct 2025 12:55:58 -0400
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
	protocol="application/pgp-signature"; boundary="=-72ALCt6cW4dZs/R7UGOa"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-72ALCt6cW4dZs/R7UGOa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This pull request contains a collection of bug fixes in various codec drive=
rs
and an improved validation of AV1 sequence parameters.

cheers,
Nicolas

p.s. sorry for the previous empty subject request.

---

The following changes since commit 082b86919b7a94de01d849021b4da820a6cb89dc=
:

  media: v4l2-mem2mem: Fix outdated documentation (2025-10-14 15:07:37 +020=
0)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.19-media-codec-fixes-2025-10-17

for you to fetch changes up to 60d4fac49415810bd4d07b18570065999e318a7b:

  media: allegro: fix race conditions in channel handling (2025-10-16 09:32=
:55 -0400)

----------------------------------------------------------------
Various CODEC bug fixes

----------------------------------------------------------------
Chen-Yu Tsai (1):
      media: mediatek: vcodec: Use spinlock for context list protection loc=
k

Haoxiang Li (1):
      media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_in=
it()

Johan Hovold (1):
      media: platform: mtk-mdp3: fix device leaks at probe

Matthias Fend (3):
      media: allegro: print warning if channel creation timeout occurs
      media: allegro: process all pending status mbox messages
      media: allegro: fix race conditions in channel handling

Ming Qian (2):
      media: amphion: Remove vpu_vb_is_codecconfig
      media: amphion: Cancel message work before releasing the VPU core

Nicolas Dufresne (2):
      media: verisilicon: Fix CPU stalls on G2 bus error
      media: verisilicon: Protect G2 HEVC decoder against invalid DPB index

Pavan Bobba (1):
      media: v4l2-ctrls: add full AV1 profile validation in validate_av1_se=
quence()

 drivers/media/platform/allegro-dvt/allegro-core.c                   | 114 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++-----------------------
 drivers/media/platform/amphion/vpu_malone.c                         |  23 =
+++--------------------
 drivers/media/platform/amphion/vpu_v4l2.c                           |  16 =
+++-------------
 drivers/media/platform/amphion/vpu_v4l2.h                           |  10 =
----------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c                |  14 =
++++++++++++++
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c   |  14 =
+++++++++-----
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c |  12 =
+++++++-----
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h |   2 =
+-
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c        |   5 =
+++--
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c |  12 =
+++++++-----
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h |   2 =
+-
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c        |   5 =
+++--
 drivers/media/platform/verisilicon/hantro_g2.c                      |  88 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------=
-------------
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c             |  17 =
+++++++++++++----
 drivers/media/platform/verisilicon/hantro_g2_regs.h                 |  13 =
+++++++++++++
 drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c              |   2 =
--
 drivers/media/platform/verisilicon/hantro_hw.h                      |   1 =
+
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c                   |   2 =
++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                           | 125 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++-------------------------
 19 files changed, 340 insertions(+), 137 deletions(-)

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-72ALCt6cW4dZs/R7UGOa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPJ1HgAKCRDZQZRRKWBy
9HU2AP9J+CpIwG+UST52dqg7weiM7f8WsVKl16dbF/VBlt3HKgD/Tr9K20ji5/Fo
B7zc2erb359ePBT6nadpyzem9GvMEQA=
=WUjo
-----END PGP SIGNATURE-----

--=-72ALCt6cW4dZs/R7UGOa--

