Return-Path: <linux-media+bounces-39585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F0B2274D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E05D1765F4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31AC243399;
	Tue, 12 Aug 2025 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A4PqcADt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C9AD51;
	Tue, 12 Aug 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002833; cv=none; b=JuvqWtFByS+mvEY5XRghxxEiZrztxJOOEND555oyeox+0GDqnBwG/kPssb4JoA8Qk6jwcNQT+M07LRKjcRxY2yrHUd+iohnmLsgscTEx6Id85E0wGeIpDJqJDAxvPdpCYGoZtDk6n6ZZkHzHKc424/yB4Fp1Md7G7v13vk3Tn3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002833; c=relaxed/simple;
	bh=ERWKORs2n46stDicTaXrMgAPtBSFdyQVArt3xOQkj04=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EpNX4qJvdnTmOBm3C4IFSUbP7Suj0Qg8PsXALPfF+VkB1gqt9++gYijdtfKfZf3NrERfGd/Y8NJ2Dat3PinilSbhQNolFCBLbnen4q98OnGWutIKONPzBof/eD4PO7vnGkbT2fiFdiHl/jK8Mal559t2hQNMkrRO76Rx35PuZE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A4PqcADt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755002829;
	bh=ERWKORs2n46stDicTaXrMgAPtBSFdyQVArt3xOQkj04=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=A4PqcADtUyRQOuNi7uq97iSKyBEk1BNe2ThYZkA4gDMwAAx0iWkRJg7KP5m9V9FHn
	 b0hdlt7cqYvGzeIQH7MDWEIvT003uysYrYPw42EMKMUksCkCeGhuAqCT9jgOV8v1Uh
	 4uwQIIOlGn+u1zu4py3/+ZfdM7lRXo4RWN7zt/hXgHEYNx2fa0fKrCkxsjYki7ZgVr
	 3IherwPBDosyzslFkHaHREZf2JvbZSVjxH/sWk4tLxelPIZzI157CxSMHf+pmBoc4H
	 ZnP9XoOSL457sxhsK/R/ziJQNGZiDTE/HTmYDMPJ5cAO+OQwL8VMgB6hnXZvYEUvpg
	 rXgU8bLGhfKgQ==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23E5A17E00AC;
	Tue, 12 Aug 2025 14:47:08 +0200 (CEST)
Message-ID: <dc95a2e6283badfd03bc9b0cb1b1f4ff2a0558dc.camel@collabora.com>
Subject: Re: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on
 RK3328
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Alex Bee
 <knaerzche@gmail.com>, Sebastian Fricke	 <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 08:47:07 -0400
In-Reply-To: <16b67aec-8675-45a2-b6df-380bd5f3bf4c@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-6-jonas@kwiboo.se>
	 <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
	 <16b67aec-8675-45a2-b6df-380bd5f3bf4c@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-JkhzomEQU9Ai9eDvywYJ"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-JkhzomEQU9Ai9eDvywYJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 ao=C3=BBt 2025 =C3=A0 00:22 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> > > =C2=A0#define RKVDEC_CAPABILITY_H264		BIT(1)
> > > =C2=A0#define RKVDEC_CAPABILITY_VP9		BIT(2)
> > > =C2=A0
> > > +#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
> >=20
> > Can you go back in the series, get H264 into bit 0, VP9 into bit 1, and=
 set
> > quirks from bit 16 ? Just worried the whole finding can becomes a mess =
in
> > many
> > years from now.
>=20
> The reason for HEVC in bit 0 is mainly because the first generation was
> HEVC only, this also matches the mode reg values (0=3Dhevc, 1=3Dh264, 2=
=3Dvp9).
>=20
> I can start quirk at bit 16 if you like, not really sure I understand
> why? Do you want to combine capabilities and quirks into one?

My bad, I miss-understood the code. The Quirk bits are seperate, not fillin=
g a
gap.

cheers,
Nicolas

--=-JkhzomEQU9Ai9eDvywYJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJs3ywAKCRBxUwItrAao
HOD9AJ9FLMLZr+wAyTdVnuLBxPgipVjrBgCeMkq4dW74TDzq3fyI7bQkjfme3Ug=
=uAZK
-----END PGP SIGNATURE-----

--=-JkhzomEQU9Ai9eDvywYJ--

