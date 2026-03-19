Return-Path: <linux-media+bounces-56382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBjKHhFgvGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:44:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B82D253E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B32030387CB
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AF43F7E9B;
	Thu, 19 Mar 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n2EVMZyH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A192322A1F;
	Thu, 19 Mar 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952912; cv=none; b=fqJ843pjJ3emqS0SStm0l//PjRUVAENM37CoaSzvyr39JBWyQIf3KKTNXHV1fSqubtHG+/Yllf6eaw0p/gDztBnKdNOxVqWTzfYQFzxSemYfPn8zmAezhjkizirkK2GnzkdSzznlYl/LyHxzZlNZiKt0grfqfnr8QoxJyPYmsng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952912; c=relaxed/simple;
	bh=2nYp2Iy/5l+M3knMvF7NKwjP9yv333TJvK0rI736oQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pZzU9XpcRoxYFrNFm4Zela3UeOuEYafBAmxOyhfhsRVnW09oXcr0qdZil9X94FQWkDkybtPXMoZVwheJ3FDE7esnBY2BGX9eNc2uzNrHyE0+RnuQRrPZoVEERijN6PkxoUQ9M9OKq+w4mUNxbDi/sy1/Jdq9scSPN63sX77ujwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n2EVMZyH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773952909;
	bh=2nYp2Iy/5l+M3knMvF7NKwjP9yv333TJvK0rI736oQM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=n2EVMZyHMqHfN4m1F3N0YDPL8+UNBEFGUXnXuXi79y4OD+66E+w6FdF9U51S1QQHt
	 Ovw6bamEf2XL/B+Et7b4bDM6aDILluE7QgHi2h8Vhz/qQomxvjKhF64JMN7g4sim9Y
	 vp9xc+N/ScwrNuhHobBE8ICYTv+Wc3SgHD7fczDLVLtietw15glAPJwkJqbGx5bW8W
	 Tq8YXjOK2YAWaySHTYFabD3H/svzbtcg/lrxr50IYKH/9m3bXwC4D9bxdAXUKWFBmX
	 hJrYk6g38k+1XnmpaK/42MCk32jq4EnJ3+zK2uxRwusog0s+e884zUzRuC6aLHwHu2
	 QuWBPM3Q2ksDA==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A233A17E0ED6;
	Thu, 19 Mar 2026 21:41:46 +0100 (CET)
Message-ID: <c91cbec7266aea6dec3f66e9ebce7406281b66bd.camel@collabora.com>
Subject: Re: [PATCH v5 1/4] media: dt-bindings: rockchip,vdec: Mark
 reg-names required for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>
Date: Thu, 19 Mar 2026 16:41:42 -0400
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
	 <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-QKja3Cualm9wLtqX3oRC"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56382-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C27B82D253E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-QKja3Cualm9wLtqX3oRC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 mars 2026 =C3=A0 23:00 +0200, Cristian Ciocaltea a =C3=A9cri=
t=C2=A0:
> The Rockchip Video Decoder driver expects reg-names to be mandatory for
> RK3576 and RK3588 SoCs, however the binding does not currently require
> the use of them.
>=20
> As a consequence, driver would fail to probe with a hypothetical
> devicetree that doesn't provide the reg-names for these SoCs, but which
> is otherwise a perfectly valid DT from the binding perspective.
>=20
> Update the binding and make reg-names required for the aforementioned
> SoCs.=C2=A0 While this change introduces an ABI break, the expected impac=
t on
> potential users would be minimal, if any, since the old SoCs are
> unaffected, while the video decoder support for these newer variants in
> mainline driver and devicetrees hasn't been released yet.
>=20
> Moreover, this is also a prerequisite for a subsequent binding update
> introducing an alternative reg-names order, according to the
> address-based listing in the vendor's datasheet.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260227-urologist-gratitude-7984733f=
2d41@spud/
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video=
 Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Deco=
der bindings")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

To Heiko, I'm picking this for 7.1, along with the order changes, which are=
 more
or less cosmetic considering that names are required by this patch. At leas=
t it
show that driver cannot do anything else then picking these by name for
compatibility reason.

Nicolas

> ---
> =C2=A0Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..dc4ebb50b316 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -123,6 +123,8 @@ allOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg-names
> =C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg:

--=-QKja3Cualm9wLtqX3oRC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxfhwAKCRDZQZRRKWBy
9EDKAQDZQTlJPwnkKi/xjIAq4hmNEUlZDufgrxQLFh12i0Hp+gEAtig2V2/waIFs
huravIxFyGxxr7cgF/YZtTqnKOWl3wY=
=Npfi
-----END PGP SIGNATURE-----

--=-QKja3Cualm9wLtqX3oRC--

