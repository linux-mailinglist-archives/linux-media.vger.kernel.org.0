Return-Path: <linux-media+bounces-51060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F062D3AAAA
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F9BC3011008
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 13:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9391D22258C;
	Mon, 19 Jan 2026 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FX+5dyer"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8533D6E2
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830474; cv=none; b=ptCIuJiBPjWPuHsPJRpXQhObXOdv7WS5+g26N02oQ9W+a56o8sFuUR+dNZTz+6MA77VoexU+6xF/knWDBaT4GTI04+He7ABiv/Tc90Fpq1sLBG8pXsAp2mql8oR9dbegh28C1cldRO4B87Tq8le2vSd9i42IhBytp8NOI78VKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830474; c=relaxed/simple;
	bh=GFCY9etWfPcT1I6QZ09JkdCQVN2PzBPiJvf4GzW28ag=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=s4wiRBMfuV6NXN/Q1oipDN0suEj8JT+NLZzlGyuwNRNvobOGESE8H3t+5jfzSoVwu2mAMpRfkla9qc6QwuUTpPquWW0vmCXJKTwTs3DudmmN/Vadimn6vK234+rThCaIMR221zFUL/q+zM4+2ZfzMTByXmrPYkWPCZ74Qgf1Ofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FX+5dyer; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768830470;
	bh=GFCY9etWfPcT1I6QZ09JkdCQVN2PzBPiJvf4GzW28ag=;
	h=Subject:From:To:Date:From;
	b=FX+5dyerLRGgkAk3z7CRm4wezAlWrYk4t/X1h1bLTk9ibZyuzmYGW+OwYuKNgUHza
	 TAELepJL4vL8R42AZGFp/3taAJHW/8JhKXVsGHzEt7qAmWZBOG6ZEE1xG5tgicnU6y
	 IJbK3MW1FE5FV4vdXlmp2+NTqeY6L99a+BwlR3Dxi6xP2HRRYL1BXt/0Xm7IO3qcAb
	 LIqwMXCFU3F+gn098h2FE6eNMKbpSuE35XEWy/5TpYE6qvnuca3RV2vkoj9RxKzz9g
	 T/dVyLsHfzy2td5gTuNLEak/iyqOX7y8+sG6bnTU5zxpwNl18vDGdVTnaM2HoLbamE
	 8xhcFCao8aG3w==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7097B17E07FA
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 14:47:50 +0100 (CET)
Message-ID: <3582f3e8c9acd88ecdece91bb216715c7f17a78e.camel@collabora.com>
Subject: [GIT PULL FOR 6.20] Media codec 2026-01-09
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Mon, 19 Jan 2026 08:47:47 -0500
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
	protocol="application/pgp-signature"; boundary="=-h/DBCJjFIWQIae/PHxBJ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-h/DBCJjFIWQIae/PHxBJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This PR introduce support for H.264 and HEVC decoding on Rockchip RK3588 an=
d
RK3576 SoC. Unlike other HEVC drivers, the hardware implements complete sli=
ce
header parsing instead of using skip parameters. Two new compound controls =
are
added to extend the SPS control with the missing information. Additionally,
buffer size calculation is added for Hantro AV1 decoder, fixing support for
decoding more then 8 tiles.

You will notice few checkpatch warning, I've looked through them, some are
complaining about already in the tree, but moved, or asking to make the cod=
e
unreadable, so I decided to ignore. The sparse check complains about
rkvdec_h26{4,5}_cabac_table missing declaration. Both are declared, but I a=
gree
with the code author that including the header that declares it is not usef=
ul in
this specific case, making this a false positive. Let me know if you prefer=
 to
workaround any of these, I can respin quickly.

cheers,
Nicolas

---

The following changes since commit eb4ee870747c3a77a9c3c84d84efb64bd481013a=
:

  Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modules i=
nfo (2026-01-17 09:08:02 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.20-media-codecs-2026-01-18

for you to fetch changes up to 9a92af47becc137d9dab290fd70b5e38f345a3a6:

  media: verisilicon: AV1: Fix tile info buffer size (2026-01-18 19:38:01 -=
0500)

----------------------------------------------------------------
Media Codec Fixes

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: verisilicon: AV1: Fix tile info buffer size

Detlev Casanova (17):
      media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
      media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
      media: visl: Add HEVC short and long term RPS sets
      media: rkvdec: Switch to using structs instead of writel
      media: rkvdec: Move cabac tables to their own source file
      media: rkvdec: Use structs to represent the HW RPS
      media: rkvdec: Move h264 functions to common file
      media: rkvdec: Move hevc functions to common file
      media: rkvdec: Add variant specific coded formats list
      media: rkvdec: Add RCB and SRAM support
      media: rkvdec: Support per-variant interrupt handler
      media: rkvdec: Enable all clocks without naming them
      media: rkvdec: Disable multicore support
      media: rkvdec: Add H264 support for the VDPU381 variant
      media: rkvdec: Add H264 support for the VDPU383 variant
      media: rkvdec: Add HEVC support for the VDPU381 variant
      media: rkvdec: Add HEVC support for the VDPU383 variant

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst       =
    | 120 +++++++++++++
 Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions          =
    |   2 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst                =
    |  12 ++
 drivers/media/platform/rockchip/rkvdec/Makefile                           =
    |  14 +-
 drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c =3D> rkvdec-cab=
ac.c} | 506 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c               =
    | 258 ++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h               =
    |  89 ++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c                      =
    | 892 ++++++++---------------------------------------------------------=
------------------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c               =
    | 511 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h               =
    | 109 ++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c                      =
    | 281 ++++--------------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c                       =
    | 179 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h                       =
    |  29 ++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h                      =
    | 586 +++++++++++++++++++++++++++++++++++++++++---------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c              =
    | 468 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c              =
    | 638 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h              =
    | 430 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c              =
    | 572 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c              =
    | 710 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h              =
    | 281 ++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c                       =
    | 232 +++++++++++--------------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c                           =
    | 586 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h                           =
    |  50 +++++-
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c           =
    |   4 +-
 drivers/media/test-drivers/visl/visl-dec.c                                =
    |   7 +
 drivers/media/test-drivers/visl/visl-dec.h                                =
    |   3 +
 drivers/media/test-drivers/visl/visl-trace-hevc.h                         =
    |  59 +++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                 =
    |  28 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                                 =
    |  10 ++
 include/uapi/linux/v4l2-controls.h                                        =
    |  61 +++++++
 include/uapi/linux/videodev2.h                                            =
    |   2 +
 31 files changed, 6264 insertions(+), 1465 deletions(-)
 rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c =3D> rkv=
dec-cabac.c} (86%)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-comm=
on.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-comm=
on.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-comm=
on.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-comm=
on.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h=
264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h=
evc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-r=
egs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h=
264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h=
evc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-r=
egs.h

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-h/DBCJjFIWQIae/PHxBJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW42AwAKCRDZQZRRKWBy
9G19AQCdqwPn/hDmQmtKv49FFpHbTROpGyDBoSRmkZ7tE618dwEAh39BO9KxWx/S
J8mJ9NZAXZAULSK+vxDbJ+Qaj2qOyAk=
=OR2f
-----END PGP SIGNATURE-----

--=-h/DBCJjFIWQIae/PHxBJ--

