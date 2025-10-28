Return-Path: <linux-media+bounces-45911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61829C189CC
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 08:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C721C84121
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 07:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0619830CD91;
	Wed, 29 Oct 2025 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RYucon6r"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA130DEC0;
	Wed, 29 Oct 2025 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722007; cv=none; b=ofN6j9kEYpv/JeQRuzfGaK/PrZ9pCXetKh+V8pHWaqDz25SFiGS5wFGMHYAK4DQEN5kFp6znp1bCy9UIwR/LbwNLhcA36dGsUt/dm71XoApW7lt9n/W2SF6hAaE+ZOBh3a+baLVcj1+whT06wxZqhsNVtX+Vs1QIBnaQs+KqObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722007; c=relaxed/simple;
	bh=ukb8+zQXgoIv/RxchmgxmWgDizmIF+87yEdWqKqnMm0=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=Q+gdH5SToTLfjJvGJqebuiuz5Bt/EYhTRHpUH2F5FTN5xn+LzY7b8uBeiWnU8RoFu/Nl9vJPz830QB7LVUw0VYcdPh881vQUssSDj7xHcIcLPL2aZ36gQ/xQRjVk8V2zgaDWuqOX9hPubdWHZKdVTYQhky3rfi4bemBW/4BXk7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RYucon6r; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761722003;
	bh=ukb8+zQXgoIv/RxchmgxmWgDizmIF+87yEdWqKqnMm0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=RYucon6rtt1nM9lh6pAygFlWvSeUYhrdQ0qa0QkI4UX63ahJAX52EbW1EI7yhJffh
	 ozhiAmimg3yoJ/IXSmztPtT1fVr2D5apaKuulfnpM7NRLoRKKYTED67k6nO6jMI85K
	 ckEDWygEZkbLgPjd9ifPDTtJCoScXt8wD6+wkxRUUf+4zMuUzIUfA0Uc4yGeH7KWxO
	 iGenvFd9FOmM1li1yiaVolBKruV1iIEALqwNKEzyxHxO/rohdTYuEvWjCibXqOJT5c
	 lBYcNoNI8N3OHJuPu2xBJPhrdbt7la5XFoMQMubuh6HedQaFoVAy+msZFDsEEfp4Lg
	 LZyRSSIpoaf6Q==
Received: from [10.43.10.217] (cust-east-lon-46-193-228-77.cust.wifirst.net [46.193.228.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 535F317E013C;
	Wed, 29 Oct 2025 08:13:19 +0100 (CET)
Message-ID: <420ba3c838b7fe2a6f2414d09fe1226c581ca09d.camel@collabora.com>
Subject: Re: [PATCH v2 1/2] media: chips-media: wave5: Fix conditional in
 start_streaming
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung
 <nas.chung@chipsnmedia.com>,  Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Darren Etheridge <detheridge@ti.com>
In-Reply-To: <20251021204618.2441939-1-b-brnich@ti.com>
References: <20251021204618.2441939-1-b-brnich@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-ya/lnR4dF2hqC45jLuRZ"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Oct 2025 16:42:12 +0000
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 


--=-ya/lnR4dF2hqC45jLuRZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 21 octobre 2025 =C3=A0 15:46 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> When STREAMON(CAP) is called after STREAMON(OUT), the driver was failing =
to
> switch states from VPU_INST_STATE_OPEN to VPU_INST_STATE_INIT_SEQ and
> VPU_INST_STATE_PIC_RUN because the capture queue streaming boolean had no=
t
> yet been set to true. This led to a hang in the encoder since the state
> was stuck in VPU_INST_STATE_OPEN. During the second call to
> start_streaming, the sequence initialization and frame buffer allocation
> should occur.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 1978551a28fa..0a2eab372913 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1367,7 +1367,8 @@ static int wave5_vpu_enc_start_streaming(struct
> vb2_queue *q, unsigned int count
> =C2=A0		if (ret)
> =C2=A0			goto return_buffers;
> =C2=A0	}
> -	if (inst->state =3D=3D VPU_INST_STATE_OPEN && m2m_ctx-
> >cap_q_ctx.q.streaming) {
> +	if (inst->state =3D=3D VPU_INST_STATE_OPEN && (m2m_ctx-
> >cap_q_ctx.q.streaming ||
> +		q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {
> =C2=A0		ret =3D initialize_sequence(inst);
> =C2=A0		if (ret) {
> =C2=A0			dev_warn(inst->dev->dev, "Sequence not found: %d\n",
> ret);

--=-ya/lnR4dF2hqC45jLuRZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQDyVwAKCRDZQZRRKWBy
9Hi0AQDWWJIcFjRcJHYOVGM/K10PrfhqA3vCjVUEU66BEELihQD+Jv1PZSvragkO
BhWOf5ZvgiHAtsE4im22SJg17TC+oQc=
=6FGj
-----END PGP SIGNATURE-----

--=-ya/lnR4dF2hqC45jLuRZ--

