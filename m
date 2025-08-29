Return-Path: <linux-media+bounces-41353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06472B3C24C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 781B47AB740
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB8D338F5C;
	Fri, 29 Aug 2025 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FwcoItfW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE0625;
	Fri, 29 Aug 2025 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756491350; cv=none; b=Mmz3BmvdxtQA2291p4696GvvPprgLJneHxgZezyfVWwagSA44FXlJ8w5tP18Bxeyim6vN0b2sqv1hiTE8vOZ/5198Pj+JnviBS0YWypbBLq8fyaUrEZs4dPooCM3myfVfgmfFlGUV+MkL0Npxk4OG5NuyNXceKfaS2TRlGwAQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756491350; c=relaxed/simple;
	bh=1Jf8b9GL3uqx2IKuSIUNbhQaMTb4+dyoDcBhSljsSPk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RUCY+6s5vJcY2lIJjThCTc+1x6RqeKLaOCNfVm37PTwdyUR9PbEalciBex6FxxZ/loKV2UHmaw2ro7j/zzUnkYMSYE3XoljFz1k2y+xZIM+UPiwoOZvec+3tRxYu6pg2Egm1ISZ0sLqK4I0QF+/RctImCAgU+LF2Qq6oeS+9f3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FwcoItfW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756491343;
	bh=1Jf8b9GL3uqx2IKuSIUNbhQaMTb4+dyoDcBhSljsSPk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FwcoItfWwici07H2uY2FEPLrw4Ppa67OAmNcytiLllA/lWrOJj+lHzblvZtbdx5f3
	 DuTBgqKgTg+ELodI70QUk3wTgi7Ma2MhIMtKVHPtbjV8sF6eR7P6P5DjBCCZmZVeo3
	 fqFXRjxCVxjFDDeXCA3ZuFR0hA53Rjm+s28dPuywFgI7sFWwf7kb+KNZVHm4FAXGH5
	 Y5obQ7yGMmW523oAMj1dT5FrVtTMinTPU87dozGMCMU6rWCXvb/pXdyf33Y4ukE+fJ
	 1P4A2llzlPTJyeuvY/imJkjTA21EFMvqWHMIVt4cUuMcy2QqL5oh8sdTEnKif109IN
	 7qU2ccEyrfeMw==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C021B17E01F5;
	Fri, 29 Aug 2025 20:15:41 +0200 (CEST)
Message-ID: <88fc40c386f2609584df72cf4951972b07f20e72.camel@collabora.com>
Subject: Re: [PATCH v3 3/4] media: chips-media: wave5: Add WARN_ON to check
 if dec_output_info is NULL
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 29 Aug 2025 14:15:40 -0400
In-Reply-To: <20250623002153.51-4-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <20250623002153.51-4-jackson.lee@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-1KJsHPFrOmo8O4PcAsju"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-1KJsHPFrOmo8O4PcAsju
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 09:21 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> The dec_output_info could be a null pointer, so WARN_ON around it
> was added.

I think to warrant a WARN_ON, its should be that the info should NOT be nul=
l.
WARN_ON should be used for driver programming issues. If this is what you m=
ean,
I would reword:


   The dec_output_info should not be a null pointer, WARN_ON around it to
   indicates a driver issue.


cheers,
Nicolas

>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index e94d6ebc9f81..5b10f9f49b9f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -485,7 +485,7 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance=
 *inst, struct dec_output_i
> =C2=A0	struct vpu_device *vpu_dev =3D inst->dev;
> =C2=A0	struct dec_output_info *disp_info;
> =C2=A0
> -	if (!info)
> +	if (WARN_ON(!info))
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	p_dec_info =3D &inst->codec_info->dec_info;

--=-1KJsHPFrOmo8O4PcAsju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLHuTQAKCRDZQZRRKWBy
9GzpAP4tgapGO4VZ2WT7cG88+GXpDaxwLGNmCEgoDyFDCHAKvQD/YHTcTotIX2tX
HTbdx0bR1LxxjotFYNpXcgShSpaGEgU=
=vn4C
-----END PGP SIGNATURE-----

--=-1KJsHPFrOmo8O4PcAsju--

