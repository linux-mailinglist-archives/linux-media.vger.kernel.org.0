Return-Path: <linux-media+bounces-37536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F3B025CD
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 22:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46BD316E386
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 20:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869A71F8690;
	Fri, 11 Jul 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gJE+2zMm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17B1E1A3F
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752265994; cv=none; b=USI9fWOmfBGprsYmz+lPTyReHtnS0WwMZYda4dHhii465h8n+ngx6a8xlwWwK0RyXMFx46dLg/2gZOQC4WJyWmW7ALKlSmacUWbDTjCQNAY1zhjo8tZBzXvarHUXfgFWMgDUMH6xsXxGka1jdmebrKBxfUD9yECA3lhRW6tk5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752265994; c=relaxed/simple;
	bh=OdiElYks1GHNQePEqSHVYrcj3Tlmfx0QzlkNCJuCu3s=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=Tgpi+HV5HYYcRnMOuLcPOvkydpYHpfK73bQAskadNEC6KHjByjTj1Nw/BLskT8Jc0z2f5TEsn+cSE5gqLLKmU8aPtQ7QjQARuccwC4+UUL+W8znAgeITCvNEfhwkLJ6bCtt60ok48X7sWg1gZEdqBFLf4AaMAHPG8aUuJx5LbNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gJE+2zMm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752265983;
	bh=OdiElYks1GHNQePEqSHVYrcj3Tlmfx0QzlkNCJuCu3s=;
	h=Subject:From:To:Date:From;
	b=gJE+2zMmKvvMglChfcqumydQ9m4p3t3Ncesc/rddUf47VlGyvqYhvmxlpNdkBeQkL
	 zUC2EDgYFQ31dgc2pvdOiW0MIHTP8i1ag17uJ9blcgiL1WcSEV2xhXT6ofx6mqzXIY
	 YLWJE+9GH+PSYoYl7yzzvq8vZg84gdtnxjpj/n5ZQ+HEMlpvM8sH6tOe/+7JWy9Haz
	 dbEVxEQe3aYljS4RO2FdUDWz9ES1PwZzalfrn01IXtBh6mKuTBOySABb4yTHR7GByh
	 DuzjE2lvAfTYDa+SsGPS29aM0rrcKAAkZS0ZUWleAPFirOE0LauYS8KrvIHaCtXOXo
	 vZ/4Q9wZfDnjw==
Received: from [IPv6:2606:6d00:17:b699::5ac] (unknown [IPv6:2606:6d00:17:b699::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2C2417E0FB8
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 22:33:02 +0200 (CEST)
Message-ID: <ba69c23a599194caa0cc4fd682f21a21eb42c5f0.camel@collabora.com>
Subject: [GIT PULL FOR 6.16]  Media Codec Changes 2025-06-19
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Fri, 11 Jul 2025 16:33:00 -0400
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-NMiDiATBRIHkfhhIct/9"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-NMiDiATBRIHkfhhIct/9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Hans & Mauro,

In this request, I've fixes for which I didn't find any issues, or my revie=
w
comment have been resolved. A little bigger, I've picked RKVDEC de-staging,
which I had promised to take care of, but Detlev took care for me. I've als=
o
picked the reviewed DT bindings for the next generation of RKVDEC. This is =
a
little early to pick, but I've tested all the upcoming related patches alre=
ady
plus the DT maintainers are happy with it. There is nothing controversial t=
here
anyway.

My queue is a bit big atm, most of it will have changes requested, its code
review time that is the bottleneck atm (for everyone I believe). From here,=
 it
will sits for the next two weeks, which I indent to spend in the woods, awa=
y
from computers.

best regards,
Nicolas

---

The following changes since commit cee06ca7a6748f7d5d7ea40876dcbc0af26bf34e=
:

  media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt() (20=
25-07-10 13:44:58 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.17-media-codecs-2025-07-11

for you to fetch changes up to 8a79dedf43ea990ed35aef44592ed4a435936564:

  media: rkvdec: Unstage the driver (2025-07-11 16:12:08 -0400)

----------------------------------------------------------------
RKVDEC unstaged, new bindings and minor fixes

----------------------------------------------------------------
Detlev Casanova (4):
      media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
      media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings
      media: rkvdec: Remove TODO file
      media: rkvdec: Unstage the driver

Hugues Fruchet (1):
      media: verisilicon: postproc: 4K support

Marek Szyprowski (1):
      media: v4l2: Add support for NV12M tiled variants to v4l2_format_info=
()

Ming Qian (1):
      media: amphion: Support dmabuf and v4l2 buffer without binding

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml              | =
 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 MAINTAINERS                                                             | =
  8 +++++++
 drivers/media/platform/amphion/vdec.c                                   | =
235 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++---------------------------------------
 drivers/media/platform/amphion/vpu.h                                    | =
  7 +++++--
 drivers/media/platform/amphion/vpu_dbg.c                                | =
 15 ++++++++++++-
 drivers/media/platform/amphion/vpu_v4l2.c                               | =
 11 ++++++++++
 drivers/media/platform/rockchip/Kconfig                                 | =
  1 +
 drivers/media/platform/rockchip/Makefile                                | =
  1 +
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Kconfig       =
|   0
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Makefile      =
|   0
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-h264.c =
|   0
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-regs.h =
|   0
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-vp9.c  =
|   0
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec.c      =
|   0
 drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec.h      =
|   0
 drivers/media/platform/verisilicon/hantro.h                             | =
  2 ++
 drivers/media/platform/verisilicon/hantro_g1_regs.h                     | =
  2 +-
 drivers/media/platform/verisilicon/hantro_postproc.c                    | =
  6 +++++-
 drivers/media/v4l2-core/v4l2-common.c                                   | =
  6 ++++++
 drivers/staging/media/Kconfig                                           | =
  2 --
 drivers/staging/media/Makefile                                          | =
  1 -
 drivers/staging/media/rkvdec/TODO                                       | =
 11 ----------
 22 files changed, 321 insertions(+), 67 deletions(-)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Kconfig=
 (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Makefil=
e (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-=
h264.c (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-=
regs.h (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-=
vp9.c (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec.=
c (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec.=
h (100%)
 delete mode 100644 drivers/staging/media/rkvdec/TODO

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-NMiDiATBRIHkfhhIct/9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaHF0/AAKCRBxUwItrAao
HAuNAJ0cqZCl+O3+olwcG4uRoHpHb3iMawCeMoGz+tBd719JXlH+VmIKzsrpk58=
=60mi
-----END PGP SIGNATURE-----

--=-NMiDiATBRIHkfhhIct/9--

