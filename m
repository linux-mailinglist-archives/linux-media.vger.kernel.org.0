Return-Path: <linux-media+bounces-62628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFQrBn1uEGqgXAYAu9opvQ
	(envelope-from <linux-media+bounces-62628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:55:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A01D35B68C5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B67FD301828C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9EA2E7165;
	Fri, 22 May 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZFWaCwcV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374634219E4;
	Fri, 22 May 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461279; cv=none; b=KuuPyJ0YDsYXqBfT92h9N9GYslOvOEmq9p9EzqM/MuTTYahBWMXR4Lkhc4hYMMt/y96JqQ7TuZg79G28uk0M6TLflh3XSRsU3/o/PGNTyuA+Al9052DGc11hH+/zpFKFJBk1xN/Vq8FAl339tuWBsISRJ9d7sFOwoyltsauGHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461279; c=relaxed/simple;
	bh=Ohgs1iVDINRnJHGU8dJ4OGndiqK/ImJ5U77RhKBgEuQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BOOBBrIDaYkUOvX93fWUCeKXPep+6IBoBdA9kf6CYrXn/+vDHIpVKBFjdQY0CRRt1Pd1iyBUi7/xJwI2nptHNiogkiqH6TtYkWh5EqrQOrzmIOMqxJrauS01WgoTLpsARa8594tA5TMae2MowkFpJHMSKMFmyvWcukuL1Xe4Gck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZFWaCwcV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779461273;
	bh=Ohgs1iVDINRnJHGU8dJ4OGndiqK/ImJ5U77RhKBgEuQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZFWaCwcVAvhZuTsFjf2NmvpWZaVMmQWx1858SJbOqatFxI4Jd6jN2SqDuEEG6oQ69
	 wEH6IufPkdFT9kDtJ6Heww5PEYKoUcGSQMt09SEh1Q9dXr6zZDohg9cD91WAYnD7AY
	 E3oG9WUSwRIwMVeOJqhIF5AfWQ/NY4HhiA2Kn1fqQl+sz48NCVYZF2tM/pSRv+87l8
	 /PZDujQAeZVU6YjABrGONqha4k6Yvris9tasn5Ay4NHOODIyre0Y9DXhEjqUk5rzVN
	 hkHarnrEd2g+n0hh6E2tRyJBN7qV5vm+YT3jP/GKywOvCFnl5jXDdOV9sqXBxVqED5
	 NwUxjYKTBRYqw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D563717E03B9;
	Fri, 22 May 2026 16:47:51 +0200 (CEST)
Message-ID: <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and
 VC8000E support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Fri, 22 May 2026 10:47:49 -0400
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-VKA4WxHE7ilxFEUvDLNz"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62628-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A01D35B68C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-VKA4WxHE7ilxFEUvDLNz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This series introduces support for the V4L2 H.264 stateless encode uAPI,
> core and support in the hantro driver for the Verisilicon VC8000E.
>=20
> While this is a first version that will likely need some level of rework,
> it is already usable for most common use-cases and supports constant
> bitrate rate-control.
>=20
> A GStreamer tree can be used to test the series at:
> https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
> And an example pipeline would look like:
> gst-launch-1.0 videotestsrc pattern=3Dsmpte num-buffers=3D25 ! video/x-ra=
w,width=3D640,height=3D480 ! v4l2slh264enc rate-control=3Dcbr bitrate=3D800=
0000 qp-min=3D8 qp-max=3D42 ! h264parse ! matroskamux ! filesink location=
=3Dencode.mkv
>=20
> Note that documentation for the new uAPI is intentionally left out of
> this series since it has not yet received approval.

The unfortunate part is that the spec is important for the actual review an=
d
interops analyses. That omission qualify this submission as RFC from my poi=
nt of
view. Any chances you can reply to this cover filling the blank for the few
important bit (something similar but non spec style of:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateles=
s-decoder.html#initialization

- Querying capabilities
- Initialization
- Encoding
- Dynamic Resolution Changes**

The other sections are just going to be the same imho. The ** for the DRC i=
s
because H.264 is not that complicated, its intra only, so you can reset the
encoder (use the drain flow). So that's probably something for future us
(VP9/AV1). Adding your view on these topics (or just matching what you have
implemented) will make review more constructive.

cheers,
Nicolas

>=20
> Marco Felsch (2):
> =C2=A0 media: hantro: use hantro_decoded_buffer only for dst_vq
> =C2=A0 arm64: dts: imx8mp: add VC8000E encoder node
>=20
> Paul Kocialkowski (12):
> =C2=A0 media: h264: Add a more generic reflist builder init
> =C2=A0 media: uapi: Add H.264 stateless encode support
> =C2=A0 media: h264: Add SPS video definitions
> =C2=A0 media: h264: Add stateless encode core
> =C2=A0 media: h264: Add stateless encode rbsp
> =C2=A0 media: h264: Add stateless encode reference management
> =C2=A0 media: h264: Add stateless encode rate control
> =C2=A0 media: verisilicon: Report default pixel coding for non-JPEG and f=
ix JPEG case
> =C2=A0 media: verisilicon: Cancel job with runtime pm put/clk disable on =
failure
> =C2=A0 media: verisilicon: Add common encoder parm and frameintervals ioc=
tls
> =C2=A0 media: verisilicon: Add support for the VC8000E H.264 encoder
> =C2=A0 media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
>=20
> =C2=A0arch/arm64/boot/dts/freescale/imx8mp.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 11 +
> =C2=A0drivers/media/platform/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/verisilicon/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 2 +
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 17 +
> =C2=A0.../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 |=C2=A0 180=
 +-
> =C2=A0.../media/platform/verisilicon/hantro_h264.c=C2=A0 |=C2=A0=C2=A0=C2=
=A0 6 +-
> =C2=A0.../media/platform/verisilicon/hantro_hw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 28 +
> =C2=A0.../media/platform/verisilicon/hantro_v4l2.c=C2=A0 |=C2=A0 123 +-
> =C2=A0.../platform/verisilicon/hantro_vc8000e.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 68 +
> =C2=A0.../verisilicon/hantro_vc8000e_h264_enc.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 883 +++++++
> =C2=A0.../verisilicon/hantro_vc8000e_regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2129 +++++++++++++++++
> =C2=A0.../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 113 +
> =C2=A0drivers/media/v4l2-core/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +
> =C2=A0drivers/media/v4l2-core/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 62 +
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 4 +
> =C2=A0drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c=C2=A0 | 1173 +++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-h264-enc-rc.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 558 +++++
> =C2=A0drivers/media/v4l2-core/v4l2-h264-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1322 ++++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-h264.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 69 +
> =C2=A0include/media/v4l2-ctrls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0include/media/v4l2-h264-enc-rbsp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 72 +
> =C2=A0include/media/v4l2-h264-enc-rc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 108 +
> =C2=A0include/media/v4l2-h264-enc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 135 ++
> =C2=A0include/media/v4l2-h264.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 146 ++
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 33 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
1 +
> =C2=A027 files changed, 7231 insertions(+), 21 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000=
e.c
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000=
e_h264_enc.c
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000=
e_regs.h
> =C2=A0create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
> =C2=A0create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
> =C2=A0create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
> =C2=A0create mode 100644 include/media/v4l2-h264-enc-rbsp.h
> =C2=A0create mode 100644 include/media/v4l2-h264-enc-rc.h
> =C2=A0create mode 100644 include/media/v4l2-h264-enc.h

--=-VKA4WxHE7ilxFEUvDLNz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCahBslQAKCRDZQZRRKWBy
9EIFAQD+XPK0eA31YLOxVvJFJOpY4eKow8Xu+wVO3cYAQikKIgEA1Z8vDV/a/lnN
lG6HQtcvTgrZ+ieQXdGd37oqqDEBRQA=
=7nBr
-----END PGP SIGNATURE-----

--=-VKA4WxHE7ilxFEUvDLNz--

