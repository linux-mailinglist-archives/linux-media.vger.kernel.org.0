Return-Path: <linux-media+bounces-48736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7FDCBB07A
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 15:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16E713075660
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 14:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4243930AACD;
	Sat, 13 Dec 2025 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k9GIAFCL"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8519E82A;
	Sat, 13 Dec 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765636047; cv=none; b=Xn94z/0k+sOisI31GTmrnlgfQrgHUD1UAaqV0j6FLOqWBhpPjMrCD1s734VQ+MlteGSPxWBre4E8Ss0mmtSASBLb3L3G7DegxxDdISk2H5QxHNq+5qNmUEqPP+mtoeWTIb+BbKmjo1SpsQzWRjyG+ofJHkN3HEUi9ErufGtMb1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765636047; c=relaxed/simple;
	bh=mpVof7Odug9SAbcKmOJ7g5O7rAAVK/6mGp9tsqPmEDs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qkGO6kw/MuTOD0HOM1aOo48S6bthxELpRKW29/f0mvWONa6Ks5skZDe0WiQ32BMzCpY0S+r8veg0+x13+rFt9RDA4Hqo35042VOHrFj2esbxeJfSeDQQ2ZeEubz74Shj8FZH7cyriFoJVOKfKW/WGZHLSmkrhv7uKsFn7U7DDG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k9GIAFCL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765636043;
	bh=mpVof7Odug9SAbcKmOJ7g5O7rAAVK/6mGp9tsqPmEDs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=k9GIAFCLi6SOWBkvA5dekLeBmr/k3lpvQaumsL9oXYph17moLnM/X4nzmNBiBJExI
	 K/fJuS90+GpTnal7bjf3dDOmkWx6v1c8+1VSjAtk6M3v1gETVBWKI2ccv1OQc1cyHM
	 xa4jQGsWIdbTQ3N5RvAQ0wnHGgHq++gkMn8RMznsvh1z4lbW5OKZ2d0N6bHa2Ke6VF
	 RCuHnScsqWER7sIfhZmP9K58XOB6BQjFxv7HGPDpXKTJOtQMQgKRbPG9VaR0eT5OI1
	 8kXo0HPrTfnmzd8MMntrtWIuIHxoXNoNmmXq5chgjzdYoc7vCLNR+D17fJj2cWXMas
	 b3bRb+c4gKe8g==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A199617E110D;
	Sat, 13 Dec 2025 15:27:22 +0100 (CET)
Message-ID: <6810b2c54369a7941d4f01d1013a641412743b62.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in
 rkvdec_s_capture_fmt
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: detlev.casanova@collabora.com, ezequiel@vanguardiasur.com.ar, 
	heiko@sntech.de, hverkuil@kernel.org, jonas@kwiboo.se, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	mchehab@kernel.org
Date: Sat, 13 Dec 2025 09:27:20 -0500
In-Reply-To: <20251213055942.3046647-1-liujianfeng1994@gmail.com>
References: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
	 <20251213055942.3046647-1-liujianfeng1994@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-UIrld9YNkFZl6dp2g3nc"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-UIrld9YNkFZl6dp2g3nc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 13 d=C3=A9cembre 2025 =C3=A0 13:59 +0800, Jianfeng Liu a =C3=A9cr=
it=C2=A0:
> Chromium does follow the spec when decoding 10bit videos[1], but that is
> still limited to hevc and vp9. For h264 and 8bit video chromium thinks
> this is unnecessary.

thanks for the pointer, that explains a lot my surprise and slight confusio=
n.
Now that you mention, on relevant chromebooks, 10bit is only supported with
HEVC/VP9 (perhaps AV1 too, not sure).

Nicolas

--=-UIrld9YNkFZl6dp2g3nc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaT13yAAKCRDZQZRRKWBy
9LN6AP9kt3JQwQSKEoywb4Qg0hb+LD5J49Oz477ei/ms73TjPAEAnpO8MiNpguWf
xh3DAL1jT5QsvfC8HyM/OGNutc5hKgM=
=HAJY
-----END PGP SIGNATURE-----

--=-UIrld9YNkFZl6dp2g3nc--

