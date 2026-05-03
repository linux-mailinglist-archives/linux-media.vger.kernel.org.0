Return-Path: <linux-media+bounces-60196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP7GCPtu92kYhwIAu9opvQ
	(envelope-from <linux-media+bounces-60196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:51:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B14B653F
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E1EA3014655
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 15:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B0839A04A;
	Sun,  3 May 2026 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GmK0+HQs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C5397692
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823461; cv=none; b=EZV9MkQNRZahC66gHdv24BQV38G7T00DXCdtF04eqMewgE2BVZOAhYhzE4DZcAkAdfWcNtc5g/18PxrBwKUkg1cGn0Wd8AldcVTqt61G6wr1nvPbn+Zan/8c8MKK6yYOi0rjhVwlLwpMyQVPUoU5L1iajtszLtVcCjqq9TNETwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823461; c=relaxed/simple;
	bh=yViatMIoj/mcEK6FO/vLS37AXrQbb+0pK7bAX90zTQI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=gJAJW3xNAg8ECcPZyTIePpksNfX+7pOEkpekNwDCdGvXs5FY1YnjK42rB9WcdQcpHEudAIWNu3RW1fUmXPM2fsFVKmnkgt/pwIDx3ddq7BzXZnwg4AL8RZemcEwkXZYGLk+qvWt/vHCMoy/zL/MtWCxzaGQ8r5g1fE9KhKsvBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GmK0+HQs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777823452;
	bh=yViatMIoj/mcEK6FO/vLS37AXrQbb+0pK7bAX90zTQI=;
	h=Subject:From:To:Date:From;
	b=GmK0+HQsdKnluumuzMwUBPFE8RVKsONA9znu2h+mN9qjd6q9fTXz/Oxt5yEO56XUs
	 hpQsjnJh0Jc2HINSP0ycW89NJXzRlpSPWUrc6Id9ik3LGx4pnnAv8dCfse0i1+LMjB
	 doX4DnkZ73kdkQyloXHwcLoWr8jMRF+MvbFLo57K7QiMXTmJ1qgao5d1MUEVy8DvlO
	 8e9Jw5y8ewBPMb55MGHS0EJZZKB2dyXA5Za5ocMDRd9e2kATnVLUvQZ7zqh/yTYWOj
	 Ebh8ZZ+n/Ktv+Y/VwPbIkl7Mdu0U+DTyec8Ouq9ufsxljHr9aOmAIFD/DkwIzp95V4
	 pVNOhbPM2hZXA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BE6F17E1301
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 17:50:51 +0200 (CEST)
Message-ID: <06ca2e5f94b207d693e7959d8912cfb8694ce08f.camel@collabora.com>
Subject: [GIT PULL FOR 7.2] Media codec for 7.2 2026-05-03
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Sun, 03 May 2026 11:50:50 -0400
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
	protocol="application/pgp-signature"; boundary="=-vDPu0CnowqnthSMlCtfy"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 753B14B653F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-60196-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]


--=-vDPu0CnowqnthSMlCtfy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This contains several fixes and improvement in codec drivers. In Verisilico=
n
driver, an internal AV1 helper has been created in preparation of new chips
versions support and a fix around pixel format selection has been added to =
fix
possibly loosing film grain. In rkvdec, a minimal bitwriter has been genera=
lized
inside the driver and some of the bitfield have been ported to that. This s=
hould
help significantly reduce stack usage with clang and ASAN. The HEVC slice
compound controls have common validation and more validation specific to th=
e
cedrus driver was added. Chips&Media Wave5 drivers now supports constrained=
-
baseline profile and has a new control to enable background detection in th=
e
decoder. The rest is mostly cleanup and fixup of issues mostly found by sta=
tic
analyses.

cheers,
Nicolas

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-7=
.2-media-codecs-2026-05-03

for you to fetch changes up to 9f670b8e9507766a833bbf18c351a8155ab119ed:

  media: v4l2-common: Add YUV24 format info (2026-05-03 11:34:19 -0400)

----------------------------------------------------------------
Fixes across codec drivers and new wave5 features

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: verisilicon: Create AV1 helper library
      media: verisilicon: Export only needed pixels formats

Brandon Brnich (3):
      media: chips-media: wave5: Move src_buf Removal to finish_encode
      media: chips-media: wave5: Release m2m_ctx after Instance Removed fro=
m List
      media: chips-media: wave5: Fix Reports from Kernel Lock Validator

Chen-Yu Tsai (1):
      dt-bindings: media: sun4i-a10-video-engine: Add interconnect properti=
es

Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

Fritz Koenig (1):
      Documentation: media: Fix v4l2_vp9_segmentation

Jackson Lee (4):
      media: v4l2-controls: Add control for background detection
      media: chips-media: wave5: Add support for background detection
      media: chips-media: wave5: Support CBP profile
      media: chips-media: wave5: Add Support for Packed YUV422 Formats

Louis-Alexis Eyraud (1):
      media: mtk-jpeg: cancel workqueue on release for supported platforms =
only

Nas Chung (1):
      media: v4l2-common: Add YUV24 format info

Pengpeng Hou (2):
      media: v4l2-ctrls: validate HEVC active reference counts
      media: cedrus: skip invalid H.264 reference list entries

Rouven Czerwinski (1):
      media: verisilicon: remove hantro_run declaration

Samuel Holland (2):
      media: cedrus: Fix missing cleanup in error path
      media: cedrus: Fix failure to clean up hardware on probe failure

 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.y=
aml               |  10 ++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst       =
                  |   2 +-
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst                 =
                  |   6 ++
 drivers/media/platform/chips-media/wave5/wave5-helper.c                   =
                  |   4 +-
 drivers/media/platform/chips-media/wave5/wave5-helper.h                   =
                  |   2 +-
 drivers/media/platform/chips-media/wave5/wave5-hw.c                       =
                  |   7 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c                  =
                  |  47 +++++++---
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c                  =
                  |  73 +++++++++------
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h                   =
                  |   2 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                      =
                  |   3 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h                 =
                  |  39 ++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c               =
                  |  51 +---------
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h               =
                  |  40 ++------
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c                      =
                  | 109 +++++++++-------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c               =
                  |  93 ++++---------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h               =
                  |  57 +++---------
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c                      =
                  | 171 +++++++++++++++-------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c              =
                  | 351 +++++++++++++++++++++++++++------------------------=
------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c              =
                  | 502 ++++++++++++++++++++++++++++++++++++++++++++-------=
-----------------------------------------------
 drivers/media/platform/verisilicon/Makefile                               =
                  |   7 +-
 drivers/media/platform/verisilicon/hantro_av1.c                           =
                  | 780 +++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++
 drivers/media/platform/verisilicon/hantro_av1.h                           =
                  |  62 +++++++++++++
 drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c =3D> hantro=
_av1_entropymode.c} |  18 ++--
 drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h =3D> hantro=
_av1_entropymode.h} |  18 ++--
 drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c =3D> hantro_a=
v1_filmgrain.c}     |  82 ++++++++--------
 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h                 =
                  |  44 +++++++++
 drivers/media/platform/verisilicon/hantro_hw.h                            =
                  |   8 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c                          =
                  |   6 +-
 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h               =
                  |  36 --------
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c           =
                  | 935 +++++++++++++++++----------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c                      =
                  |   7 +-
 drivers/media/v4l2-core/v4l2-common.c                                     =
                  |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                 =
                  |  13 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                                 =
                  |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus.c                               =
                  |   5 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c                          =
                  |   3 +
 include/uapi/linux/v4l2-controls.h                                        =
                  |   2 +
 37 files changed, 1744 insertions(+), 1854 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter=
.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c =3D>=
 hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h =3D>=
 hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c =3D> h=
antro_av1_filmgrain.c} (92%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain=
.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgra=
in.h

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-vDPu0CnowqnthSMlCtfy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafdu2gAKCRDZQZRRKWBy
9MenAQDXHrPX+Bhjjcu/j0TlUFXa869Um9Ccl/0EtsQK5cTcUQEA6BjiaG7UvQOM
iCaeImvER01TsWbcPaSdbqy07yhtXQY=
=Hewx
-----END PGP SIGNATURE-----

--=-vDPu0CnowqnthSMlCtfy--

