Return-Path: <linux-media+bounces-62397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFlJFzRrDmob+gUAu9opvQ
	(envelope-from <linux-media+bounces-62397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 04:17:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CFA59DF9C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 04:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC7EF3012574
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 02:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E934C3382FC;
	Thu, 21 May 2026 02:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mv47QTw/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8C33ADA9
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779329838; cv=none; b=ehsCnBjlDtRVzOMPEQOfCcSGcnXuJFZUc+QB2W4E2j+oPLlXbRSrld0shPeAigCBiQChFJ8yxEuM9r1JX9aqtr5OASD6nZXxE6nYqJSAIS25o9TT5FQIxCuuFDGvCe28QsBVrgqAn0peRzDDGcdyLtbw4HrtymGnS+jnwxG7sEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779329838; c=relaxed/simple;
	bh=RiBbZF9C/MTE/igFAO0m7ONSPHQ3DovNinURHfNRBgQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=Omqmlsfs5ImP8PXy9gJfzYA7lEUVaS84PbHtPYaejbLeZGY2oJUQC3H9GTbKg5CNmqgwEk5PNJfCRNat/uOm0qdWl/974VNOkXDmqKEmBApgK4Q1RhvkOFXyf4Vz0DdQf4+SEAvG+/+yvrtTJnnD+O1CxqtgXsLjGUj1jwpqb7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mv47QTw/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779329833;
	bh=RiBbZF9C/MTE/igFAO0m7ONSPHQ3DovNinURHfNRBgQ=;
	h=Subject:From:To:Date:From;
	b=mv47QTw/o8J0eI54nRSYdCAiyABRpWgRBWUTzYZ5YulN+6oFg/jUN04q/7SJmBbPF
	 fa0wesonBGqIWJWMvkbCHbPhswzx7sK+lsrLfT5+6sQNIU0fShFiOb0fSSQJ3x5DFM
	 hqbfRtRTD9bto5hHKnCrQuKcJZECjgBn6SBpm3TVCQFBt3erZX6se2w/q8drP01oW1
	 DmalYJ7X5LOIkpvy/VWmOnGPrL/Amb0KdEtGe0i6QBOEs5VZySqNKIbDqcNGTu+iDu
	 MPrWzHEZiZyoFyVwaw/67In58rXQLkSXVmYJIhAmArR+s2ocBzZ/2F5+8eUaX8WBv/
	 FOAoLNdV+mlxQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4064717E124B
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 04:17:13 +0200 (CEST)
Message-ID: <3ce08e4dc6101edbb30a6824d8ec08fe41f56431.camel@collabora.com>
Subject: [GIT PULL FOR 7.2] Media codec for 7.2 2026-05-20
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 20 May 2026 22:17:11 -0400
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
	protocol="application/pgp-signature"; boundary="=-1CuWczP/a45He72wn/At"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-62397-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gitlab.freedesktop.org:url,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: F1CFA59DF9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-1CuWczP/a45He72wn/At
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This PR adds support for RGA3, which is part of the existing RGA driver. It=
 is
similar to RGA2 hardware, but capable of 10bit processing (but not HDR). On=
ly
one of the two cores have been enabled for now, other cores will be enabled=
 once
the rkvdec multi-core series lands. A lot of cleanup took place, which came=
 with
introduction of new v4l2-common helpers. It was notably extended so that dr=
ivers
can request specific stride alignment in bytes, rather then strictly depend=
ing
on the width/height alignment. An extra bit of information was added to
v4l2_format_info, has_alpha, which simply mark format that includes an alph=
a
component. On top of that series, I included simple fixes for meson vdec an=
d
cedrus.=20

cheers,
Nicolas

The following changes since commit c2d1a2130c93f6d758af58590b86b2254c7a1dec=
:

  media: vivid: check for vb2_is_busy() when toggling caps (2026-05-20 16:0=
0:40 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-7=
.2-media-codecs-2026-05-20

for you to fetch changes up to 4db4c5cee0871b64682945f7c426fa633b5ae1e1:

  media: meson: vdec: Fix memory leak in error path of vdec_open (2026-05-2=
0 21:41:20 -0400)

----------------------------------------------------------------
Add support for RGA3 and misc fixes

----------------------------------------------------------------
Anand Moon (1):
      media: meson: vdec: Fix memory leak in error path of vdec_open

Maha Maryam Javaid (1):
      staging: media: meson: fix typo in codec files

Michael Olbrich (1):
      media: rockchip: rga: share the interrupt when an external iommu is u=
sed

Myeonghun Pak (1):
      media: cedrus: clean up media device on probe failure

Sven P=C3=BCschel (26):
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
      media: v4l2-common: sort RGB formats in v4l2_format_info
      media: v4l2-common: add missing 1 and 2 byte RGB formats to v4l2_form=
at_info
      media: v4l2-common: add has_alpha to v4l2_format_info
      media: v4l2-common: add v4l2_fill_pixfmt_mp_aligned helper
      media: rockchip: rga: fix too small buffer size
      media: rockchip: rga: use clk_bulk api
      media: rockchip: rga: use stride for offset calculation
      media: rockchip: rga: remove redundant rga_frame variables
      media: rockchip: rga: announce and sync colorimetry
      media: rockchip: rga: move hw specific parts to a dedicated struct
      media: rockchip: rga: avoid odd frame sizes for YUV formats
      media: rockchip: rga: calculate x_div/y_div using v4l2_format_info
      media: rockchip: rga: move cmdbuf to rga_ctx
      media: rockchip: rga: align stride to 4 bytes
      media: rockchip: rga: reuse cmdbuf contents
      media: rockchip: rga: check scaling factor
      media: rockchip: rga: use card type to specify rga type
      media: rockchip: rga: change offset to dma_addresses
      media: rockchip: rga: support external iommus
      media: rockchip: rga: remove size from rga_frame
      media: rockchip: rga: remove stride from rga_frame
      media: rockchip: rga: move rga_fmt to rga-hw.h
      media: rockchip: rga: add feature flags
      media: rockchip: rga: disable multi-core support
      media: rockchip: rga: add rga3 support

 Documentation/devicetree/bindings/media/rockchip-rga.yaml |  10 +++-
 drivers/media/platform/rockchip/rga/Kconfig               |   1 +
 drivers/media/platform/rockchip/rga/Makefile              |   2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c             |  89 ++++++++++=
++++++++++++++++--------
 drivers/media/platform/rockchip/rga/rga-hw.c              | 357 ++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++-------------------------------------
 drivers/media/platform/rockchip/rga/rga-hw.h              |  16 +++++--
 drivers/media/platform/rockchip/rga/rga.c                 | 576 ++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++-----------------------------------------------------------=
---------------------------------------------------------
 drivers/media/platform/rockchip/rga/rga.h                 |  88 ++++++++++=
+++++++++++-------------
 drivers/media/platform/rockchip/rga/rga3-hw.c             | 507 ++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga3-hw.h             | 192 ++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c                     | 133 ++++++++++=
++++++++++++++++++++++++++--------------
 drivers/staging/media/meson/vdec/codec_h264.c             |   2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c           |   2 +-
 drivers/staging/media/meson/vdec/vdec.c                   |   4 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c               |   5 +-
 include/media/v4l2-common.h                               |   6 +++
 16 files changed, 1482 insertions(+), 508 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rga/rga3-hw.c
 create mode 100644 drivers/media/platform/rockchip/rga/rga3-hw.h

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-1CuWczP/a45He72wn/At
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5rJwAKCRDZQZRRKWBy
9IX9AQCg0NBNf9R67bF3KgP9euRL6ztWEpcOphqkdjeexk8i4gD/eu0waxBi0HeM
a+xY6beRD0Mh6yDYVxAIGCkere7A6A8=
=UGKd
-----END PGP SIGNATURE-----

--=-1CuWczP/a45He72wn/At--

