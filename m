Return-Path: <linux-media+bounces-56356-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBdBIWo2vGl3uwIAu9opvQ
	(envelope-from <linux-media+bounces-56356-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:46:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E46AE2D03AB
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8735C3041145
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A39390C99;
	Thu, 19 Mar 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="heflX5Ez"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C7733D4FD;
	Thu, 19 Mar 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942252; cv=none; b=QjcgMLoQCWoEBmu7AQurnrp1PnibXCCL6Zr7/5rhTj5A0vvZ5txFp6t0oHc95tk9C2TZ2PlTTQ7wWnmgHV+sgSV6i1KGAw3LUSFfZ4osx+0eq7N+yjT98rNw8CkyYlEFPaDAxlJwyPiz2hDyxuDGiMA92YDgX5KCiK/pEKPC9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942252; c=relaxed/simple;
	bh=FkqtlqpSBsb7Jecesoe+31n0p+bGU/I2tfLI4fkFkqE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pl2og4uFsy/KAJ8B/5yhZd8HzVZRrhrMO6FHG2yo7680td71xwQPqLklNABVnMG8OYH7+Z1qaBAcKxMSwOCnAgXchxsb+PM8jXTY/vBuPmda74kFnL1qm/BiQYS9O3jOQJ9Xb5sMD9B57folhzQza08G/Xyz+c2OAnugLll9ATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=heflX5Ez; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773942241;
	bh=FkqtlqpSBsb7Jecesoe+31n0p+bGU/I2tfLI4fkFkqE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=heflX5Ez99yGWxeqWqrLZMem7oUc1F6UpGronFGni+DvKLgY7LY90DZWLxWNUo7D8
	 5SbMctifDPAEMTPStBY+cWZ9B5gJVj6vV3CnuPWMg8xf2E7/TJer2JDgeJOsZAuIJL
	 EIESoM9JV30BZmCD4k9IxXWZmTW8p+zRzpPvh/+KxlHHvNVEYfvEIfLXk7lAXjsxml
	 V4odOtEFUGZuHZao1R3bwNcvtJtkAZeEamMOUzUqGMn1M0DJkpMmV/iQwDqRAlKGk8
	 fBEdsQyddgr2qrqELMgDG1ywsg0tD160+0M3Zh2SQPiBVelxYP/52dA0fa0olO1NtR
	 hhq4uaHjY2w9w==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 514E317E127A;
	Thu, 19 Mar 2026 18:44:00 +0100 (CET)
Message-ID: <604f619585e0c99e0d73a978260e053f3cd68b44.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: fix a potential memory leak
 in wave5_vdi_init()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, jackson.lee@chipsnmedia.com, 
	mchehab@kernel.org, bob.beckett@collabora.com,
 sebastian.fricke@collabora.com, 	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Thu, 19 Mar 2026 13:43:58 -0400
In-Reply-To: <20260125141915.2088123-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260125141915.2088123-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-A0olpGo3fNrEJ1Hb0gjg"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56356-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: E46AE2D03AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-A0olpGo3fNrEJ1Hb0gjg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 25 janvier 2026 =C3=A0 22:19 +0800, Haoxiang Li a =C3=A9crit=C2=
=A0:
> Add wave5_vdi_free_dma_memory() in the error path of
> wave5_vdi_init() to prevent a potential memory leak.
>=20
> Fixes: 45d1a2b93277 ("media: chips-media: wave5: Add vpuapi layer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

It would have been nice to reply to Greg, that being said, I carefully revi=
ewed
and this effectively fix a leak in an error path. Description is brief but
sufficient in my opinion.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vdi.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vdi.c b/drive=
rs/media/platform/chips-media/wave5/wave5-vdi.c
> index bb13267ced38..8f71920a8a35 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vdi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
> @@ -49,6 +49,7 @@ int wave5_vdi_init(struct device *dev)
> =C2=A0
> =C2=A0	if (!PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> =C2=A0		WARN_ONCE(1, "unsupported product code: 0x%x\n", vpu_dev->product=
_code);
> +		wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
> =C2=A0		return -EOPNOTSUPP;
> =C2=A0	}
> =C2=A0

--=-A0olpGo3fNrEJ1Hb0gjg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw13gAKCRDZQZRRKWBy
9JoZAQDPY69GNyGynTtKcnKcpHRR/29nmIqdd1/f+CKSzuggGwEA23ZG1oFru/g6
+MAkiTdMKzAMvdEvmxmjSdkG3ggbVgc=
=cmQz
-----END PGP SIGNATURE-----

--=-A0olpGo3fNrEJ1Hb0gjg--

