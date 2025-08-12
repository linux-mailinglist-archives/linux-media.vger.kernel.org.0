Return-Path: <linux-media+bounces-39597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAEB228B3
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0AF11882E74
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146FB286887;
	Tue, 12 Aug 2025 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DkSpnPUo"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EDA27FB2D;
	Tue, 12 Aug 2025 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005285; cv=none; b=eUWAF7iE82x6aiPYKaUc+TWyeAZwwgKR12yuaGRo+bvG0eZHC55IcXNnmhPlwtsHNhMKAjwO9VhlXMLbIrdf4Ddngib+OHjWhDDo8vqf0X0irYUCihRsPUCEU6RIr8+bClVB8ttzx4k53N+8KsUB8d7seWapnig0kBflm4sBrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005285; c=relaxed/simple;
	bh=g3otUup9kO008DlL0tacLfTuaxcw61h+bB/1db3wKbg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rwx8JTzWgmdiJSU8jXQiQVtppRLlaM3DwsaGLxOcAIdiFC8rF4q44ho04m+UQR/MNAqH0rYhv77+sFTgkBcnudpS94oxAFcHm0R2eDcJ1JNu2F6HtbRI8bFZqT4hz8YxWb/ua1fzBZYHp9JyJVVJ+cRdpiZ+75i4W9Ek76sTwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DkSpnPUo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755005281;
	bh=g3otUup9kO008DlL0tacLfTuaxcw61h+bB/1db3wKbg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DkSpnPUoDCdco5aUhPsyAHYZsWtqpTCCBerRVa4n9Cm1LUl/7KoG+6tLw0c8HnXta
	 Krma+SYAcgt/Rj/xNPEamTNF3J9xyCJFK1fC/DTo8WOmayG6o0+JFwVCye7qXpejAU
	 8EbgURrdjek3FqpOExmpczXWW6Ibqx9ybrIHSBdUBAHWMNI4myLBfAMTfaI6otuiGV
	 toR28gcJz68wWlxtucbhNuLe6JV5ni94LD/ip5h1rdbRKMZY5zcxC6jUjXAE5uFCax
	 NYH3ykz0O3/QpklHGf8PVcu6SdwDaL+v4Vn6aR0CtH4R+yLlJiG9HN8gak3cD1bB/H
	 A3aSrk+gTcxBg==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34F4617E00AC;
	Tue, 12 Aug 2025 15:28:00 +0200 (CEST)
Message-ID: <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>, Jonas Karlman
 <jonas@kwiboo.se>,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev
 Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 09:27:58 -0400
In-Reply-To: <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
	 <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
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
	boundary="=-M1vrzmGsMYWQLNfBKIxn"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-M1vrzmGsMYWQLNfBKIxn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 ao=C3=BBt 2025 =C3=A0 14:55 +0200, Diederik de Haas a =C3=A9cri=
t=C2=A0:
> Hi again,
>=20
> On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
> > On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
> > > This series add a HEVC backend to the Rockchip Video Decoder driver.
> > >=20
> > > Patch 1 add the new HEVC backend.
> > > Patch 2-3 add variants support to the driver.
> > > Patch 4 add support for a rk3288 variant.
> > > Patch 5 add a rk3328 variant to work around hw quirks.
> > > Patch 6-7 add device tree node for rk3288.
> >=20
> > It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
> > locally and that also had this commit:
> > - media: rkvdec: Keep decoder clocks gated
> >=20
> > Is that one no longer needed/useful/etc ?
> >=20
> > And 'chewitt' also had a commit to fix 8/10-bit selection:
> > https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df9=
26d435c7c
> > "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
> >=20
> > I haven't tried that one (yet), but did=C2=A0 try an other variant with
> > changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
> > in my tests. (Can ofc be PEBKAC)
> >=20
> > Would that be useful? I do/did have consistent problems with playing
> > 10-bit encoded video files.
>=20
> nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
> as it also exists with with H.264 files.

The referred patch is against some out-dated kernel. In mainline linux with
have:

	if (sps->bit_depth_luma_minus8 =3D=3D 0) {
		if (sps->chroma_format_idc =3D=3D 2)
			return RKVDEC_IMG_FMT_422_8BIT;
		else
			return RKVDEC_IMG_FMT_420_8BIT;
	} else if (sps->bit_depth_luma_minus8 =3D=3D 2) {
		if (sps->chroma_format_idc =3D=3D 2)
			return RKVDEC_IMG_FMT_422_10BIT;
		else
			return RKVDEC_IMG_FMT_420_10BIT;
	}

Which covers all cases supporte by the hardware. Chewitt seem to add a
previously missing 10bit case, and forcing downconversion from 422 to 420. =
A
downconversion is something to be chosen and applied by userspace, the kern=
el
should pick a non-destructive format by default.

Nicolas

>=20
> Cheers,
> =C2=A0 Diederik

--=-M1vrzmGsMYWQLNfBKIxn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJtBXgAKCRBxUwItrAao
HGf2AKClbtPSLT0SZplwD51rU8+FwEw49gCgmVjM5AXAgVHmxBV92M/L0ury2nA=
=+GGj
-----END PGP SIGNATURE-----

--=-M1vrzmGsMYWQLNfBKIxn--

