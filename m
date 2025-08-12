Return-Path: <linux-media+bounces-39632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E44B23A63
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FC1B7A8287
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD572BDC1B;
	Tue, 12 Aug 2025 21:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iPMgSUEk"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE2197A76;
	Tue, 12 Aug 2025 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033079; cv=none; b=tvtFLDxN+KOalvXA/SHjCYkFu3FMDlNLYjlBmHdGa3dBL1Xvm36nH/ReoiZWXkg8tVJq+ROJcvlXMW/wZv4TMFRa0Vjdbahu6Zg0MAMQDhikh0jl3M5uodXZA2xJkfvHzn8j1NPnK7F1bCbSAZ5tTZICq5AiCe+/e0krynuZZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033079; c=relaxed/simple;
	bh=ptw9LWjwcshgBavY2yDU/Ee+H+KyvQTD0coZYZFxVfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ULmDe/Bzm/M1UBRgPmwPE049MDBJmQLcBowAYMqjp+7AP1VLOVf6J9MUI02NDzm/1atlmJ1EbyGStqsG/+9sbhIh/bdA7JS5HOI7mnzkZEy56FedcTaZL6NoAYaoI7ur40aszCqg9Tq59EBavEPIx6NTBIS4ZG5MWzUsmXYY2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iPMgSUEk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755033076;
	bh=ptw9LWjwcshgBavY2yDU/Ee+H+KyvQTD0coZYZFxVfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iPMgSUEkfNJiAjaNCg4fHebUfF9p4iwEMZYSQwgT3Wag8oCvrrorR82Bq+flfOcAA
	 tJE/Yoicrzw8NxpJCIWPPwA8lhSY3QDThCFfZS0af2JKOocxNwJNPGGFvi52DpWIPR
	 rfp96b9bk+frqd/JoscI7HeslPOnw24WS16oaArSS9knnpRp6StIjNe34jMttiQ/N2
	 PwrCFWxH28cc2bJhESkMhUuieD/1bwztCE2rL1oY3n/B+JDdgpUVuXdnVPPctJe1Nr
	 ggH7Sftmy6AqFFgE9khGPbHMDitLVejnKoL1yJUUDLXdN1bGzQpQ754p+334Mxdt/W
	 JLqzujFi6Sk4A==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A839717E0237;
	Tue, 12 Aug 2025 23:11:14 +0200 (CEST)
Message-ID: <d4f53de2dabce333e9f24fe0036d91b8d60af628.camel@collabora.com>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Jonas Karlman
	 <jonas@kwiboo.se>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 17:11:12 -0400
In-Reply-To: <3547812.44csPzL39Z@earth>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
	 <3547812.44csPzL39Z@earth>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoiZBBMWCgBBAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmgssvgFCQll93U
 ACgkQ2UGUUSlgcvRSeQEAjcvEl/A6R2y2nMufL4A8MiKQfPZqJPXlhhno2PZqqUcBAIR87Pv5+cZV
 ZTN26stch5wMyalcKgRNQ9IxtGvVelUCtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc
 25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZsmBU
 pkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHCAAS0
 LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBFiEE7
 w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAwECHg
 cCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8bRLv
 9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3mQpTUvxe3+s5ASJnZMy"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-3mQpTUvxe3+s5ASJnZMy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 12 ao=C3=BBt 2025 =C3=A0 15:57 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> > Detlev reports 146/147 on newer hardware using GStreamer, failing
> > TSUNEQBD_A_MAIN10_Technicolor_2 (9bit chroma) only. On Detlev side, it =
will
> > we important to check why 8K videos (PICSIZE*) passes with a single cor=
e,
> > perhaps we accidently use both cores ?
>=20
> 1 core can do 8K. In theory, it can do up to close to 65535x65535... It i=
s=20
> only a speed issue, so you can do 8K but you won't be able to get to 8K@6=
0=20
> with only one core on rk3588.

now that makes me wonder if that means we can reach speed such as 240Hz 4K =
by
slaving the cores, of if that only works for 8K. If this is the case, perha=
ps
the decoder will need to be target performance aware to make the best
scheduling.

Nicolas

--=-3mQpTUvxe3+s5ASJnZMy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaJut8AAKCRDZQZRRKWBy
9Ih8AQDKyfk0G5x1w5UjIb06h+rwgbK7YR0Lu+0CgbaCFrUrCwEAtl6TV9GOaFhe
Ubqzqi3x44DC0qxKWNjsJ9wdHUCpbAM=
=ANNJ
-----END PGP SIGNATURE-----

--=-3mQpTUvxe3+s5ASJnZMy--

