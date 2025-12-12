Return-Path: <linux-media+bounces-48720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E95CB9994
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 19:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 385AD300AFE8
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 18:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC0A30AAD8;
	Fri, 12 Dec 2025 18:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jHyRn2Qb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2834277011;
	Fri, 12 Dec 2025 18:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765565159; cv=none; b=Lg/r6gkCxyvSgushKUQ2HCzdZfM4FXv5h0JX8glgRHVEduUXOZ5EiUjy7eJT8QQ+FrtnCOeggS/G2l0tMcWZoOHdWeMQ/DdaLQnYf7vF3a1yIucBFWR1bH4vG8Rv2bkuYsgfLMOOju6qPq7WWh0x7F17Owcdq2SwNm9atq5Fl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765565159; c=relaxed/simple;
	bh=ry5upCu6sImJyvpBdsRHrwsdIRdM8Q9U+hsEz/JOm+0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B1PDFeXFXSMKjf+MxAMPIfhSJTs9ARA5FzRri/Efzx3X8WxGeCA4ftYe4fL+FWvrVEuPVaOAdERYWuExUMcymOY3aNhlxJT6gG/jYLppmbjXidBEWafLZjsJ/O2P0wMrnEiFYWjat/rCK9xKWThc0PQnjBWEvzVNAOlmGWwSDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jHyRn2Qb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765565152;
	bh=ry5upCu6sImJyvpBdsRHrwsdIRdM8Q9U+hsEz/JOm+0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jHyRn2QbNfYAagQLO1Es0vKEdklQiL6Kra9hCqpLbShDNOuJ2DILt8MvFXSQsn9Bo
	 Psf8+HUrUxX+2uA6O6q7Jp5Jan8BwzzEtaCvfIpZuk5aZyY3oVRX90nBdaa5bylGJb
	 6PKPcyyluCRMsPZnYHiu2MTD3R1+yYD3sR2Ow+CNZRwZ9vYTN3tkXzYH8kwzmdjDin
	 j8J6r4DvFFOGn7u8RA/aEF9sNaGgSidMa2F52Pe1jEdZrjw4a950HUTBiiA4NOB4Gg
	 dUBsbhc15TRlMMz/G54Ky2i3myIj3Yb0Y6y5OfXIomH98qE9fshkGe1uz4JsBiVEPg
	 +QJ/NHyZXj0cQ==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A274117E0458;
	Fri, 12 Dec 2025 19:45:51 +0100 (CET)
Message-ID: <0f697c71f73e54a5a9e1306a06ed883e56d8bc89.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, kernel test
 robot	 <lkp@intel.com>
Date: Fri, 12 Dec 2025 13:45:49 -0500
In-Reply-To: <20251212160101.146684-1-detlev.casanova@collabora.com>
References: <20251212160101.146684-1-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-v3ENlB5ZsArKoVTuSSTw"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-v3ENlB5ZsArKoVTuSSTw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 11:01 -0500, Detlev Casanova a =C3=
=A9crit=C2=A0:
> When building for arm 32 bits, the struct alignment changes and the compi=
ler

Reported by checkpatch [0], this needs a reflow, it exceeds 75 chars.

> adds 3 padding bits to the anonymous mv struct in
> rkvdec_vp9_inter_frame_probs.
>=20
> Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
> to 128 bits (hardware requirement) fails.
>=20
> As that mv struct is at the end of the global rkvdec_vp9_probs struct
> and is followed by 11 padding bits, the 3 padding bits can be explicitely

Also from checkpatch:

explicitely -> explicitly


> set in the mv struct and removed from the 11 following it.
>=20
> This makes sure that the mv struct is 32 bits aligned.

Unless someone request a change, I will be able to apply these fixes while
picking it up.

cheers,
Nicolas


[0]https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/89677=
987/artifacts/junit/0001-media-rkvdec-vp9-Fix-probs-struct-alignment.patch%=
20checkpatch.err.txt

>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@i=
ntel.com/
> Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index b4bf01e839ef..23c733ca2e8e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -66,6 +66,8 @@ struct rkvdec_vp9_inter_frame_probs {
> =C2=A0		u8 fr[2][3];
> =C2=A0		u8 class0_hp[2];
> =C2=A0		u8 hp[2];
> +		/* 32 bit alignment */
> +		u8 padding6[3];
> =C2=A0	} mv;
> =C2=A0};
> =C2=A0
> @@ -85,7 +87,7 @@ struct rkvdec_vp9_probs {
> =C2=A0		struct rkvdec_vp9_intra_only_frame_probs intra_only;
> =C2=A0	};
> =C2=A0	/* 128 bit alignment */
> -	u8 padding1[11];
> +	u8 padding1[8];
> =C2=A0};
> =C2=A0
> =C2=A0/* Data structure describing auxiliary buffer format. */

--=-v3ENlB5ZsArKoVTuSSTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTxi3QAKCRDZQZRRKWBy
9D9TAP9Rg/1BlXZVvLFqQ+qVsoSdshEjyLf5j10caSZcDsATKAD/beT+Jc2J2IbK
px7A3XalvmwjjtoZS5wEx6RBRW+b+wY=
=V59C
-----END PGP SIGNATURE-----

--=-v3ENlB5ZsArKoVTuSSTw--

