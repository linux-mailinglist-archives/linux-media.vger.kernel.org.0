Return-Path: <linux-media+bounces-57088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KkOM0IuxGmZwgQAu9opvQ
	(envelope-from <linux-media+bounces-57088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:49:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA46532ACA5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E167300E196
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3893321A3;
	Wed, 25 Mar 2026 18:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GF6X0/cY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96D31AA87;
	Wed, 25 Mar 2026 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464415; cv=none; b=XELb09+xYUYxPYbp9aqgAEnbLJGM5lXRlkz+ZEzgVGdCxu47sD8fjcikyEeyDbx+GEwh6vbJXL4LD9FbpDOQ3s3pcTTcoVF2ljfmHsPd53vdIwGIqq1ymBgzh3c0PhpKriu6UoG0z3W5DMDvWXmCx3O0hZiOmqCRmvHex2Q+xwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464415; c=relaxed/simple;
	bh=4BhKnDHxlKSMru2h+OBmbdE9nJuAzrXPd4R2KPATfNA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e65TYV9ePcuOnqtwIAC+AnUtw2n6yzuJiuWdG+1GR2kNITNSn8JaLZg49g+IxW3/1PVtJZdKmDiknizubfq/vnqIDqN4/ruge3GHyCLD7ZQhxpCEcamiXdli7zlnuXAWoq2KPnEUWTIovvUru+Bj3Zf+945AkswQS7D8I6AKvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GF6X0/cY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774464412;
	bh=4BhKnDHxlKSMru2h+OBmbdE9nJuAzrXPd4R2KPATfNA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GF6X0/cY68U7TcAA+jc86lgp+tJTdbOmYWAykONCLEOKDH3m1FbW0NVFAK8DfeNkk
	 fWvPmJslpjaU9Buu53ZxlXmW/z4V8bR1GeMz7rxUufvJ9KRsIOy5wD4/ivcnRMpm0U
	 5QqFdXGYl/GCr0FS3Rk7vEDWrlgT3GBlWPjHKuRg2zByCVhfzbyMHA/zEbFQ/k2S2P
	 aRJeIMYweKB9Lv64uxT8xNH0PdZ0CCCVWrUIBqIY2ae4bM3GPRptCD+MWQP47/Hg/x
	 pL/kKF5YTm5Qwrjuz0zec//cv4EOrh5jZgQPmiQch6D6x7/8u/yRfFk/6sGpSoRuJO
	 +qkJpE3qTBBSQ==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BA3917E5CBA;
	Wed, 25 Mar 2026 19:46:51 +0100 (CET)
Message-ID: <a9931f6b0568fa8c21b53a5c8ca93a9a90fed25d.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Discard none supported profiles
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Wed, 25 Mar 2026 14:46:49 -0400
In-Reply-To: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
References: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-5z62E6Ku7U3JD7cZZml0"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57088-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DA46532ACA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-5z62E6Ku7U3JD7cZZml0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 mars 2026 =C3=A0 14:19 +0100, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> AV1 hardware can only decode YUV420 pixel format. That means
> that only profile 0 is supported. Discard all other profiles
> when receiving AV1 sequence control.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_drv.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..12f98e7e7994 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -283,6 +283,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0
> =C2=A0		if (sequence->bit_depth !=3D 8 && sequence->bit_depth !=3D 10)
> =C2=A0			return -EINVAL;
> +		if (sequence->seq_profile !=3D 0)
> +			return -EINVAL;

You should also add the missing control to better tell userspace what it ca=
n and
cannot do. Check MTK driver for reference, I think the same config can be u=
sed:

drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
...
		.cfg =3D {
			.id =3D V4L2_CID_MPEG_VIDEO_AV1_PROFILE,
			.min =3D V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
			.def =3D V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
			.max =3D V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
		},
...

Nicolas

> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;

--=-5z62E6Ku7U3JD7cZZml0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacQtmQAKCRDZQZRRKWBy
9Cy+AP4lqq9BCcDZOqXjBZ3yYGOfcfoXWeWE2KU70uAXcKsbpQD/bUl+RdDxPIY7
yPwo6Fq713yfESsmKcVnHwPn9Tht5As=
=z+Ou
-----END PGP SIGNATURE-----

--=-5z62E6Ku7U3JD7cZZml0--

