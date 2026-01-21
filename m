Return-Path: <linux-media+bounces-51241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMxlI7rZcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:50:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A357ECA
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D63285EDED4
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71E53D332D;
	Wed, 21 Jan 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bHn6h8XL"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8744D6BE
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002943; cv=none; b=mjreF8p1r7AKwJGBGtko1GpZmCahD2KsyBsDN+UCJv6YdXNfTyrLtN/vPEZDkNwwN3a9o5Wvr6/d5Oci2ZSCNrpWLGH0KA/pUoXZO6OvP7OVkc4h/T7xyLurD2noM42xV4Bx7yIAJzwAGTpQ8NRrM++2x8S3V9YADQnIGV9uycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002943; c=relaxed/simple;
	bh=TZlSkkdvH4+JL9k4G69VlKeAfRaIOwT9m8hBRToqbow=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=bzV92CkW0wEDGlEbed73klTJWi3p6ZK6rms7sIA90DQV1WGWI8PhdTHA7uzVLO5QKOzWZ/qnhP/o1Y8eGnKPzHNvKGSNJ52X3yneaGj1xrh0wPWJmCr5xzPe0ij3A/3GB2zORygf32AdGxvFns1R+072INGeA1JtsNTZpk5QpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bHn6h8XL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769002938;
	bh=TZlSkkdvH4+JL9k4G69VlKeAfRaIOwT9m8hBRToqbow=;
	h=Subject:From:To:Date:From;
	b=bHn6h8XLaQbnehSrVq6Licq3eVNm8FX8MX/hJsMW4WhYH7ni1rCkbnOcibDqilXdc
	 XICBoD+nrpIkneMfx7im3kTsBn5IIKUhn2vhS9/5i1MtBNp2OuI7AFOp73PejESluz
	 F+gwijc/I+2wv1AnmfJR49bMbq6ebMzKQR2tqf27tn1r2vXSt+FReLIcmCu6fHhB4X
	 Kv0jmqxM+jrmUOGBZpW9+V0uquYhK0f6l6d2hyz3Ugv3rmG7iY5UzQuWE9m5YP9e5o
	 FTWDGgjFhh0BFZ6XVhtErhNTgN4ahqOusRlpkEXe4ohmcw1JnNGwKfDsBzUWDc98Eo
	 qwzGxtwwCns2Q==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E6A517E012E
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 14:42:18 +0100 (CET)
Message-ID: <379e2cfb0ac6640936446b5e76dd24f854e7800c.camel@collabora.com>
Subject: [GIT PULL FOR 6.20 v2] Media codec 2026-01-18
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 21 Jan 2026 08:42:15 -0500
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
	protocol="application/pgp-signature"; boundary="=-nX0mzlzeRJIVKw4GbEBU"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-51241-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,gitlab.freedesktop.org:url,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 082A357ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-nX0mzlzeRJIVKw4GbEBU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This is an update fixing the stack (requires clang 21 and up) and sparse er=
rors.
The cabac tables now have a header in which they are declared, and the stac=
k
size had been reduced. We had function that was called in a loop. That loop=
 was
being unrolled, and that function inlined. The common aspect of these funct=
ions
is that they were writing into bitfield, and with KASAN enabled, it causes =
a lot
of stack to be allocated. The solution was to move these out of the loop an=
d
manually unroll, which in the end required less code. Other then that, one
variable was renamed in the variant configuration.

I have kept tags/for-6.20-media-codecs-2026-01-18 from v1, so anyone can in=
spect
the changes (for those only watching the pull requests).

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

The following changes since commit dde659d37036c6edf5eeef81274b43fe12dfad53=
:

  media: iris: Introduce vpu ops for vpu4 with necessary hooks (2026-01-20 =
16:22:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.20-media-codecs-2026-01-20

for you to fetch changes up to 4479d56e34d8951111f0fd0966c76cc9ee2e2fe4:

  media: rkvdec: Add HEVC support for the VDPU383 variant (2026-01-20 20:15=
:08 -0500)

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
    | 120 +++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions          =
    |   2 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst                =
    |  12 +++
 drivers/media/platform/rockchip/rkvdec/Makefile                           =
    |  14 +++-
 drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c =3D> rkvdec-cab=
ac.c} | 506 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.h                     =
    |  21 +++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c               =
    | 258 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h               =
    |  85 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c                      =
    | 893 +++++++++++++++++------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c               =
    | 511 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h               =
    | 107 ++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c                      =
    | 282 +++++++++-----------------------------------------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c                       =
    | 179 ++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h                       =
    |  29 +++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h                      =
    | 586 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++------------------------------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c              =
    | 469 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c              =
    | 639 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h              =
    | 430 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c              =
    | 538 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c              =
    | 652 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h              =
    | 281 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c                       =
    | 232 ++++++++++++++++++++++-----------------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c                           =
    | 633 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h                           =
    |  50 +++++++++--
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c           =
    |   4 +-
 drivers/media/test-drivers/visl/visl-dec.c                                =
    |   7 ++
 drivers/media/test-drivers/visl/visl-dec.h                                =
    |   3 +
 drivers/media/test-drivers/visl/visl-trace-hevc.h                         =
    |  59 +++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                 =
    |  28 +++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                                 =
    |  10 +++
 include/uapi/linux/v4l2-controls.h                                        =
    |  61 ++++++++++++++
 include/uapi/linux/videodev2.h                                            =
    |   2 +
 32 files changed, 6237 insertions(+), 1466 deletions(-)
 rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c =3D> rkv=
dec-cabac.c} (86%)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.h
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

--=-nX0mzlzeRJIVKw4GbEBU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXDXtwAKCRDZQZRRKWBy
9Bg6AQDOXcOeZ9BV6Odu73D1vBfgOh2t8EfJ/ZtiLOWej1JxNgD/dodLLICOELxR
+BIlTH7g9YBnoxLAkicNn0Fk9bh+BQM=
=bcsH
-----END PGP SIGNATURE-----

--=-nX0mzlzeRJIVKw4GbEBU--

