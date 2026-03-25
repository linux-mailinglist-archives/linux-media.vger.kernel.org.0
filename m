Return-Path: <linux-media+bounces-57040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DduO7Pjw2lvugQAu9opvQ
	(envelope-from <linux-media+bounces-57040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:31:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E2325CFC
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A7CA308B9D8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B213DA5DA;
	Wed, 25 Mar 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gsFNHXSp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744126CE39;
	Wed, 25 Mar 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444924; cv=none; b=C0jBLtYkP57VEk9HPdLjKv7L33WBW9nNaWqQtW2OZm2oVKO10gmcdQEheyvqn4uIGHhXTe35o4rgO75CxhcI3L2/WyQ904ghar5UhP92oQsi3DipNClzBc7cggZhsOMByzpl5v2g5oJEVrYNMmvK7EsjE3vm2M6IRNXcDTm/Wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444924; c=relaxed/simple;
	bh=HqTxj7sOEZALR2O8Su9EVAnQRSJaZUEJV8z1DX7d6tU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GB7Gr1fetjgODhwUV0wzg2cWtwaXnPvxHgXoRrqyCkwFzXWWn/fGiQlbA2ebINcWahRVEG6UkZsr9KESx1H7bxfLX9Xp3/wsGsWZS3LYArXrJeuNuQGi+6ZluyzEZYAZKQVRwiuqIHzLRs1nqbiKqZzXfo8uGoMcXpYO/i21T7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gsFNHXSp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774444921;
	bh=HqTxj7sOEZALR2O8Su9EVAnQRSJaZUEJV8z1DX7d6tU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gsFNHXSpZl/Q0vywoaL86ffWAwLADKAUOSCpoPze6z3shPbY8VToqRHU7PoxShcTA
	 R/GXBYkxTohDuYVVqlXzeYnOsxY+tdbBVl1kIUvM0Oz8bLiK/agTXlXtrPuFUhT8I5
	 VC+b1HC7ChWzeq1VMKxMIl65OteRS5QJ9dOoHAbVeRADfntQLEwdhC+2y8Ah2cJIni
	 xrgfNkARfBzCZ1ksKVfROCy9Mw9ZhQNweZI0UoaCpJIH36UU6dKgMLJF95eeaDG0UG
	 Bfel6zgkxJ80PImM/uoZTOvDHBFThXv4YjEAnfr80g6wpqz87NTlibrCQCzar0mAfT
	 8toa4C5pq+xLQ==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FA3417E5A46;
	Wed, 25 Mar 2026 14:22:00 +0100 (CET)
Message-ID: <c90e82bc630b54419d10ee6f179bc1239060a808.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Remove unnecessary memset() after
 dma_alloc_coherent
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Luo Qiu <luoqiu@kylinsec.com.cn>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 25 Mar 2026 09:21:57 -0400
In-Reply-To: <856D681C2A51EC65+20260325050055.1187863-1-luoqiu@kylinsec.com.cn>
References: 
	<856D681C2A51EC65+20260325050055.1187863-1-luoqiu@kylinsec.com.cn>
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
	protocol="application/pgp-signature"; boundary="=-k/642t1H1gbwycF4nsNk"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57040-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 950E2325CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-k/642t1H1gbwycF4nsNk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 mars 2026 =C3=A0 13:00 +0800, Luo Qiu a =C3=A9crit=C2=A0:
> dma_alloc_coherent() already returns zeroed memory, so the subsequent
> memset(0) calls are redundant.

I don't think this statement is actually true, or at least not for all
architectures, and not without an explicit GFP_ZERO flag.

Nicolas

>=20
> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_vp9.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/me=
dia/platform/verisilicon/hantro_vp9.c
> index 566cd376c097..607d618e8f4a 100644
> --- a/drivers/media/platform/verisilicon/hantro_vp9.c
> +++ b/drivers/media/platform/verisilicon/hantro_vp9.c
> @@ -187,7 +187,6 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	tile_edge->size =3D size;
> -	memset(tile_edge->cpu, 0, size);
> =C2=A0
> =C2=A0	size =3D hantro_vp9_segment_map_size(max_width, max_height);
> =C2=A0	vp9_dec->segment_map_size =3D size;
> @@ -198,7 +197,6 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
> =C2=A0		goto err_segment_map;
> =C2=A0
> =C2=A0	segment_map->size =3D size;
> -	memset(segment_map->cpu, 0, size);
> =C2=A0
> =C2=A0	size =3D hantro_vp9_prob_tab_size();
> =C2=A0	vp9_dec->ctx_counters_offset =3D size;
> @@ -211,7 +209,6 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
> =C2=A0		goto err_misc;
> =C2=A0
> =C2=A0	misc->size =3D size;
> -	memset(misc->cpu, 0, size);
> =C2=A0
> =C2=A0	init_v4l2_vp9_count_tbl(ctx);
> =C2=A0

--=-k/642t1H1gbwycF4nsNk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacPhdQAKCRDZQZRRKWBy
9N9UAQCpvI0nr3Xogq9gNsgNBd5xLG2EZEWGzahgs/ORXqFrZAD9ERe1zJxCX6Qh
BWSW91bYzrr5/ixlGp43idTR3Y/sWQw=
=niaU
-----END PGP SIGNATURE-----

--=-k/642t1H1gbwycF4nsNk--

