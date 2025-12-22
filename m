Return-Path: <linux-media+bounces-49376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDECD7758
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 00:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FDD6301A713
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 23:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED0B31282B;
	Mon, 22 Dec 2025 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GxKIT5jn"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9530BF5C
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 23:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766446632; cv=none; b=eL2itQ0YG0Ud04PcMLXsokJbuoG44qr8S/iFGVV7AG6MFODB73pF5KMElHyA5AqvrrdZJVQkHYCt1YrTLgCcqJ/naJc2hc9keQnsjOT83DK53Ml/k7hQlgIqQtZuz12mvyc4HbF/a2vkljUaBloQiz3wPxxTSYe0/aAYXs3SkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766446632; c=relaxed/simple;
	bh=/IMYltEpTF8br/YyPeiQ5JgoGn27GJTZ8HV0/Mr8kG8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=LV1eOoTf42QCxUVfeXAZFxfc6+ppXWv6NRmxRlYOfM6OEib7LwPTwpuPBaUXXP3pXI+iAmYSwZAS5M7BabVC1t4htsldukXznLIL9MBV+2QrkOHLWqa+ol5FayLtspt9d6iIT7k3mTgLEedD8evCOP0LmlvYS9S91zCYQAuwoyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GxKIT5jn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766446626;
	bh=/IMYltEpTF8br/YyPeiQ5JgoGn27GJTZ8HV0/Mr8kG8=;
	h=Subject:From:To:Date:From;
	b=GxKIT5jn34NIxJJpPU8jOHktJv0l5Ea11WxdXhKtInTCGtfOQ+aVhvMtAAVAmu65a
	 wDdTOjqZUQQmD6HCMAslh5WCa/sj2DstcS9wjEnqO+6rTSI/RQHf+673FU0vrvvxMd
	 HAgnanX3RkyPYrZDayJ6eG1XW4LpLsAPkD88SYmLf5w4RZAZj4M+PqOSYzWUub5PHI
	 49O/Sb5RC0/P0ovGy62y+e04lDSWokQh9+GvD2W6q6kh4teQF2AzP8Yh7bgGF1Wwe/
	 dRByoeac+YysDSFqEp7a0EE8r84xBs4XLhBhgHDnQ7Bmm/54ZidCrI1H+cQ68+/jaY
	 GqgkF8eDULFkg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 825A617E0330
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 00:37:06 +0100 (CET)
Message-ID: <2855238cb1863a2db7bd87d2de3486e9dc85707a.camel@collabora.com>
Subject: [GIT PULL FOR 6.20] Media codec 2025-12-22
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Mon, 22 Dec 2025 18:37:04 -0500
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
	protocol="application/pgp-signature"; boundary="=-tcxhWU69lGi63MvzsBT/"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-tcxhWU69lGi63MvzsBT/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

Here's a collection of fixes for multiple codec drivers and a fix for Media=
tek
MDP converter. This series include the manual request completion internal A=
PI,
which is used to fix issue in Mediatek multicore decoder handling. There is=
 also
a fix to prevent running the Hantro G1 and G2 cores on IMX8MQ concurrently.=
 This
change introduce a kref to the v4l2_m2m_dev structure. In the long run, I w=
ill
eventually propose a new name to this structure as its miss-leading, but as=
 its
an important fix for this SoC, I liked that the changes were minimal with n=
o
side effect on other drivers. The rest is either bug fixes or performance
enhancement.

cheers,
Nicolas

---

The following changes since commit b70886ff5833cf499e77af77d2324ce8f68b60ce=
:

  media: vb2: drop wait_prepare/finish callbacks (2025-12-18 11:14:57 +0100=
)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.20-media-codecs-2025-12-22

for you to fetch changes up to da9380193679a9aa4a4e9b64467c436325ba740c:

  media: chips-media: wave5: Fix Potential Probe Resource Leak (2025-12-22 =
17:38:33 -0500)

----------------------------------------------------------------
Media codec fixes and enhancements

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: verisilicon: AV1: Fix enable cdef computation
      media: verisilicon: AV1: Fix tx mode bit setting

Brandon Brnich (3):
      media: chips-media: wave5: Fix conditional in start_streaming
      media: chips-media: wave5: Process ready frames when CMD_STOP sent to=
 Encoder
      media: chips-media: wave5: Fix Potential Probe Resource Leak

Hans Verkuil (3):
      media: mc: add manual request completion
      media: vicodec: add support for manual completion
      media: mc: add debugfs node to keep track of requests

Haoxiang Li (2):
      media: mtk-mdp: Fix error handling in probe function
      media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()

Irui Wang (1):
      media: mediatek: encoder: Fix uninitialized scalar variable issue

Jackson Lee (4):
      media: chips-media: wave5: Fix SError of kernel panic when closed
      media: chips-media: wave5: Fix Null reference while testing fluster
      media: chips-media: wave5: Add WARN_ON to check if dec_output_info is=
 NULL
      media: chips-media: wave5: Improve performance of decoder

Johan Hovold (1):
      media: mediatek: amend vpu_get_plat_device() documentation

Marco Crivellari (1):
      media: platform: mtk-mdp3: add WQ_PERCPU to alloc_workqueue users

Marek Vasut (2):
      media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
      media: imx-jpeg: Add support for descriptor allocation from SRAM

Ming Qian (2):
      pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vp=
u
      media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC

Nicolas Dufresne (2):
      media: mediatek: vcodec: Don't try to decode 422/444 VP9
      media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure

Qianfeng Rong (1):
      media: mediatek: vcodec: use =3D { } instead of memset()

Sebastian Fricke (1):
      media: mediatek: vcodec: Implement manual request completion

Xulin Sun (3):
      media: chips-media: wave5: Fix PM runtime usage count underflow
      media: chips-media: wave5: Fix kthread worker destruction in polling =
mode
      media: chips-media: wave5: Fix device cleanup order to prevent kernel=
 panic

Zilin Guan (1):
      media: chips-media: wave5: Fix memory leak on codec_info allocation f=
ailure

 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml                =
|   6 ++++++
 drivers/media/mc/mc-device.c                                              =
|  30 ++++++++++++++++++++++++++++++
 drivers/media/mc/mc-devnode.c                                             =
|   5 +++++
 drivers/media/mc/mc-request.c                                             =
|  47 +++++++++++++++++++++++++++++++++++++++++++++--
 drivers/media/platform/chips-media/wave5/wave5-helper.c                   =
|  28 +++++++++++++++++++++++++++-
 drivers/media/platform/chips-media/wave5/wave5-helper.h                   =
|   1 +
 drivers/media/platform/chips-media/wave5/wave5-hw.c                       =
|   2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c                  =
| 194 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----=
--------------------------------------------------
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c                  =
|  17 ++++++++++++-----
 drivers/media/platform/chips-media/wave5/wave5-vpu.c                      =
| 121 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++-----------------
 drivers/media/platform/chips-media/wave5/wave5-vpu.h                      =
|   2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c                   =
|  68 +++++++++++++++++++++++++++++++++++++++-----------------------------
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h                   =
|  12 ++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h                =
|   1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c                        =
|  17 +++++++++++++++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c                      =
|   6 ++++--
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c           =
|   4 +++-
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h       =
|  17 +++++++++++++++++
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c =
| 115 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++---------------------------------
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c         =
|   3 +--
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c              =
|  12 ++++--------
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c           =
|  12 +++++-------
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c              =
|  15 +++++----------
 drivers/media/platform/mediatek/vpu/mtk_vpu.h                             =
|   3 +--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                            =
|  70 ++++++++++++++++++++++++++++++++++++++++++---------------------------=
-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                            =
|   1 +
 drivers/media/platform/verisilicon/hantro.h                               =
|   2 ++
 drivers/media/platform/verisilicon/hantro_drv.c                           =
|  42 +++++++++++++++++++++++++++++++++++++++---
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c                         =
|   8 ++++++++
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c           =
|  37 ++++++++++++++++++++++++++++++++++---
 drivers/media/test-drivers/vicodec/vicodec-core.c                         =
|  21 +++++++++++++++++----
 drivers/media/v4l2-core/v4l2-mem2mem.c                                    =
|  23 +++++++++++++++++++++++
 drivers/pmdomain/imx/imx8m-blk-ctrl.c                                     =
|  11 +++++++----
 include/media/media-device.h                                              =
|   9 +++++++++
 include/media/media-devnode.h                                             =
|   4 ++++
 include/media/media-request.h                                             =
|  40 +++++++++++++++++++++++++++++++++++++++-
 include/media/v4l2-mem2mem.h                                              =
|  21 +++++++++++++++++++++
 37 files changed, 807 insertions(+), 220 deletions(-)


--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-tcxhWU69lGi63MvzsBT/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUnWIAAKCRDZQZRRKWBy
9OfgAP0fx128D/4fZopNdQg/+AsFZwCABKRI34fEghnjJN3KMAD/QobpJpmQ9lM+
qXTMpqlMTfcA/e+L+dYxuQo5o506ggE=
=RkMJ
-----END PGP SIGNATURE-----

--=-tcxhWU69lGi63MvzsBT/--

