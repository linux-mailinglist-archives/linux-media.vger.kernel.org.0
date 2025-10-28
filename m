Return-Path: <linux-media+bounces-45848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC69C15F2D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C31A4234B0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C62344053;
	Tue, 28 Oct 2025 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZZ5UCe1I"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC133F8A3;
	Tue, 28 Oct 2025 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669880; cv=none; b=qLbMsET11dUHvToc93xWpog+AtJ1rx1Q9F3H9BXAxe+J678Q+n9UnBzXmpU9m1n9KvoSzxgZABluf9YTQz97j9uFuN0xf2PHesYEnli54p9pq4mVk5uiH5N37+ZTq1ZLi24Q0gGZrmAudnzLCnuIWdGfyE4UYJcCorcFcvInges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669880; c=relaxed/simple;
	bh=+zDR3syKjBS2kd+OGgcF0id7D9QlT0C1fTMMcdbDDkc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsC/MrF2FMie1W5rtSrl+swNS8F4TwbrfBVTB0M5aigh4TDVqjMLy5vX4jzmtwdXDdBChXZlz3Pf+bCu+Di1+yEuAf5/8woR66HGxbv1LKOPpDYLx0jnNgWUSHnD2Sb2cCdmcUx/W96WFTYJw2qSljKrUsadl5O3zR1nZlGi8Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZZ5UCe1I; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761669876;
	bh=+zDR3syKjBS2kd+OGgcF0id7D9QlT0C1fTMMcdbDDkc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZZ5UCe1I+VEvGaETBjkABXqceD+4vP3AKUIGnEYq4VzFXR51M623FLgS/kA8qv4O3
	 d/8ZpREhi2GnKYvdHwIvsixY9jMgira2oG+o/a2FjYacLib+u/dkfexby2xqWbDV28
	 5QzbOfb+qj7hZ4jKImLRWcwJM4GwOJGJR4gcDCFn0+EwG0DIR2/48vwePA1MocWXc/
	 FFgKn53F+k0LZRhqNrCMsUaKTPQ5GMB95jXROOIIcUVh/ruC6B0V2GAxQzww6tzuY3
	 2jAY642APV2A2elQEOe5AbBYneeBjNv43SuRuB7B6ThqM6Y600X57An+wVIy7hySst
	 WXTLkhbCmPYdw==
Received: from [192.168.11.9] (ip-217-65-134-16.ptr.icomera.net [217.65.134.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 985C317E1278;
	Tue, 28 Oct 2025 17:44:32 +0100 (CET)
Message-ID: <c5d17fc824ac7091e63f9d1d9ed7c0666994089e.camel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: chips-media: wave5: Process ready frames
 when CMD_STOP sent to Encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
  Jackson Lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Darren Etheridge <detheridge@ti.com>
Date: Tue, 28 Oct 2025 16:42:28 +0000
In-Reply-To: <20251021204618.2441939-2-b-brnich@ti.com>
References: <20251021204618.2441939-1-b-brnich@ti.com>
	 <20251021204618.2441939-2-b-brnich@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-fnIbwzv7kVFXSPSi8gAo"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-fnIbwzv7kVFXSPSi8gAo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 21 octobre 2025 =C3=A0 15:46 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> CMD_STOP being sent to encoder before last job is executed by device_run
> can lead to an occasional dropped frame. Ensure that remaining ready
> buffers are drained by making a call to v4l2_m2m_try_schedule.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 0a2eab372913..7ee77c9a30c0 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -649,6 +649,8 @@ static int wave5_vpu_enc_encoder_cmd(struct file *fil=
e,
> void *fh, struct v4l2_en
> =C2=A0
> =C2=A0		m2m_ctx->last_src_buf =3D v4l2_m2m_last_src_buf(m2m_ctx);
> =C2=A0		m2m_ctx->is_draining =3D true;
> +
> +		v4l2_m2m_try_schedule(m2m_ctx);
> =C2=A0		break;
> =C2=A0	case V4L2_ENC_CMD_START:
> =C2=A0		break;

--=-fnIbwzv7kVFXSPSi8gAo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQDydAAKCRDZQZRRKWBy
9H/SAPwI3yGHldwe6ZRqSHBVKktYayRKH5TXay0xDmFAHPHduQEApiUurKdcqoNF
tgZCbD4Ej3iJr5/MKVWXBh9J3XOZ2wI=
=IH2a
-----END PGP SIGNATURE-----

--=-fnIbwzv7kVFXSPSi8gAo--

