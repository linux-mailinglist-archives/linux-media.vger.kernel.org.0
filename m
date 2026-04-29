Return-Path: <linux-media+bounces-60017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JWJJq5V8mnGpgEAu9opvQ
	(envelope-from <linux-media+bounces-60017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:02:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D50499744
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCBF2305FC28
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36D7423162;
	Wed, 29 Apr 2026 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AA+rOBl3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B92C158E;
	Wed, 29 Apr 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489313; cv=none; b=oo8uHhURXqqVEKRAdT+5G9Y5Xqe73E3GbucZPh5ncxTmIpIpcX+kcV4qKi7YH+SwajE0gRfBpk3GNaISqvZdE/whCfdZvw9Y0LynUVo63VcODyV0yjbrER9d3Kf12mBUneV1hjGBMH5MJkUtHlmFL7mdRKVqiTFjED7oGAFjbs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489313; c=relaxed/simple;
	bh=J7PdNiwIPUKegtuBjW/8ymNKrW3mJ9pZw8XhWaEC2SE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DCF6xFaWWRgcU6e0YT0M1yYCYDKbK92907JqLcBHpzy+JafcHtM6/a4Ihg/qAmW7cJbCVJzlcGaYVh4BF8OBHj80rAE8K7IILg7yVAyy4MSh+4yHivH1+8ace/HkWwpPxuGs7/B5HhwS0PAxBb1uTbE3qd5Bi2UdqIvMsQamhYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AA+rOBl3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777489310;
	bh=J7PdNiwIPUKegtuBjW/8ymNKrW3mJ9pZw8XhWaEC2SE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AA+rOBl3Ghr9XnJU2HTzc2RgGWcMh/ih6Wv7+ChHYmGM4vuAO8VDEJiobcTBlxnf+
	 yiZolhak9f3WFDJPulC0x2yS9H0zEKe3SQCY8E/5WIBMtq/zyse9KBMYIvMgzTCoTc
	 rvEFXzk1Ozeosg4v/cYwylzJ277TtoAtv09nvZgFy919kmXMUOk8uUX9uFCuag/Chs
	 GRaIgayt/UxdRWjAZKqJfRMStjVjFkoPVAnVkIn8jeuY4zfz5eMgMd9SVa46+eYigS
	 odWj13PAAxoyn2niS4IjA4lj5Z2+AQZSZrjknhXnBy4gO23PP9FMdHSdIOGkpcLXtH
	 0NFPmLTLNc8Lw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C70217E1227;
	Wed, 29 Apr 2026 21:01:49 +0200 (CEST)
Message-ID: <6dfaacd9cd8d3acb9335618f14acdb8f4a42e5c8.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: remove hantro_run declaration
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: rouven.czerwinski@linaro.org, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2026 15:01:47 -0400
In-Reply-To: <20260410-hantro-dangling-declaration-v1-1-9a5cd401e1e8@linaro.org>
References: 
	<20260410-hantro-dangling-declaration-v1-1-9a5cd401e1e8@linaro.org>
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
	protocol="application/pgp-signature"; boundary="=-5KnV11OLe/HX2VBpCREI"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 52D50499744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60017-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--=-5KnV11OLe/HX2VBpCREI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 avril 2026 =C3=A0 08:15 +0200, Rouven Czerwinski via B4 Rela=
y a
=C3=A9crit=C2=A0:
> From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
>=20
> The function hantro_run() is declared but never defined nor used, remove
> the dangling declaration.
>=20
> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_hw.h | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h
> b/drivers/media/platform/verisilicon/hantro_hw.h
> index 5f2011529f02..13e573f1f19d 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -427,7 +427,6 @@ extern const struct hantro_postproc_ops
> rockchip_vpu981_postproc_ops;
> =C2=A0extern const u32 hantro_vp8_dec_mc_filter[8][6];
> =C2=A0
> =C2=A0void hantro_watchdog(struct work_struct *work);
> -void hantro_run(struct hantro_ctx *ctx);
> =C2=A0void hantro_irq_done(struct hantro_dev *vpu,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state result);
> =C2=A0void hantro_start_prepare_run(struct hantro_ctx *ctx);
>=20
> ---
> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
> change-id: 20260409-hantro-dangling-declaration-a337df1daf42
>=20
> Best regards,
> --=C2=A0=20
> Rouven Czerwinski <rouven.czerwinski@linaro.org>
>=20
>=20

--=-5KnV11OLe/HX2VBpCREI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJVmwAKCRDZQZRRKWBy
9AaaAP4/nKZ3N3Vtv0Uk7w6G/QWSLMwKs8GWbNheKpLnGqQDEQEA9Ta0sSFC0eGG
0LLdaROPTWWJVa1UuXZD3bXrsP8mVQs=
=pNW/
-----END PGP SIGNATURE-----

--=-5KnV11OLe/HX2VBpCREI--

