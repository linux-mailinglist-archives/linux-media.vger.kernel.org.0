Return-Path: <linux-media+bounces-52047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD23JpLSgGlBBwMAu9opvQ
	(envelope-from <linux-media+bounces-52047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:36:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC6CF08B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF904306EC85
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 16:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD5737E316;
	Mon,  2 Feb 2026 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IFTbcwoQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2E37E2FC;
	Mon,  2 Feb 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049908; cv=none; b=Mimp2r1/s4XtTY1RIZgjEQ3rBAVkxBmxw6qTssC53rNv4Fzd+9j8pL3MNDm5TMthuPbT2xh2HoCSeWFHWUZTyZjQo1e+fBIU3zmwyKLm5dzkTDDWwRW/s/y1mhJdCMeugrbk8RLIR0VN8osxGcvccGHI8wWdMVPJy/njLFtUoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049908; c=relaxed/simple;
	bh=hYLkpRWaYV8x8z9MUU6UtC2OJd7fEAIyh74fGdqvB5o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hX+jjRSzcfL8H4ubun9mOP8snKtyT0KCuJQ7rq1rnlu2aoUspF6O6OkihkOoOKr7zpyaL8ohAXJpFcgJTevhbuGgt3cybI8nnV0iKmDggkCbbg9ZHSstHO4N+xAJeD2aTcqtA0pAOfpf3eh61k7gaQ1wtsivLiRWzTgQmLjkve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IFTbcwoQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770049904;
	bh=hYLkpRWaYV8x8z9MUU6UtC2OJd7fEAIyh74fGdqvB5o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IFTbcwoQUlzXLIER0BnmpPUbq5Ivhw4yhyeTrehH06PprPCTNA3FWQniH+f9QmVHA
	 Q8TnY2cHvfoGD5W5iZPYeU4MX8lYFoJtVzFHkhjcWlIiJNkgn+iFUZbPJRwbngxZk1
	 98G040CW+lorbnf09Q5g4hiB27Fd34MfQOIZVZxk9kc4Q2lDhr2YA5gh7Aq0RmOgjL
	 HtzqGFMYOsY44WD7NA8eqc/tXPfeDaqd4AsVEQsPdyuokyNC5ytkSFII4ARzKfOmFW
	 x3EaGol0df9Sloa+nJVQrg+N1GktyvSjjuc6ZtffHDhSp7lYl3OXU4zmNl6KGJ0rRE
	 kFLpgiKDxcE8w==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC77417E0182;
	Mon,  2 Feb 2026 17:31:42 +0100 (CET)
Message-ID: <5c1b6a5a5a10404e51bc281054d733dc78374994.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Detlev
 Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Nathan Chancellor	 <nathan@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Date: Mon, 02 Feb 2026 11:31:40 -0500
In-Reply-To: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
	 <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
	 <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
	 <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
	 <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
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
	protocol="application/pgp-signature"; boundary="=-a6XgCD27qq03YMrDQYTC"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52047-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EAC6CF08B
X-Rspamd-Action: no action


--=-a6XgCD27qq03YMrDQYTC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 16:59 +0100, Arnd Bergmann a =C3=A9cri=
t=C2=A0:
> On Mon, Feb 2, 2026, at 16:12, Nicolas Dufresne wrote:
> > Le lundi 02 f=C3=A9vrier 2026 =C3=A0 15:09 +0100, Arnd Bergmann a =C3=
=A9crit=C2=A0:
> > > On Mon, Feb 2, 2026, at 14:42, Nicolas Dufresne wrote:
>=20
> > > Right, this randconfig build likely got closer to the warning
> > > limit because of the inherent overhead in KASAN, but the problem
> > > with the unaligned bitfields was something that I could later
> > > reproduce without KASAN, on ARMv5 and MIPS32r2.
> > >=20
> > > This is something we should fix in clang.
> >=20
> > All fair comments. I plan to take this into fixes (no changes needed), =
hopefully
> > for rc-2.
> >=20
> > Performance wise, this code is to replace read/mask/write into hardware
> > registers which was significantly slower for this amount of registers (=
~200
> > 32bit integers) and this type of IP (its not sram). This is run once pe=
r frame.
> > In practice, if we hand code the read/mask/write, the performance shoul=
d
> > eventually converge to using bitfield and letting the compiler do this =
masking,
> > I was being optimistic on how the compiler would behave. If performance=
 of that
> > is truly a problem, we can always just prepare the ram register ahead o=
f the
> > operation queue (instead of doing it in the executor).
>=20
> I think there are multiple things going on here, some of which are
> more relevant than others:
>=20
> =C2=A0- The problem I'm addressing with my patch is purely a clang issue
> =C2=A0=C2=A0 for CPU architectures with high register pressure when assem=
bling
> =C2=A0=C2=A0 the structure in memory. As a first-order approximation, you=
 can
> =C2=A0=C2=A0 see the lines in the output being 12.000 with clang, but onl=
y
> =C2=A0=C2=A0 600 with gcc in the godbolt.org output. The gcc version isn'=
t that
> =C2=A0=C2=A0 great either, but it is orders of magnitude fewer instructio=
ns.
>=20
> -=C2=A0 MMIO reads are clearly a performance killer, so assembling the
> =C2=A0=C2=A0 structure in memory and using memcpy_toio() to access the
> =C2=A0=C2=A0 registers as you appear to=C2=A0 be doing is the right idea.
>=20
> =C2=A0- using bitfields for hardware structures is non-portable. In
> =C2=A0=C2=A0 particular, the order of the fields within a word depends on
> =C2=A0=C2=A0 byteorder (CONFIG_CPU_BIG_ENDIAN), and the alignment depends
> =C2=A0=C2=A0 on the architecture, e.g. 'struct { u32 a:16: u32 b: 32; u32=
 c:16};
> =C2=A0=C2=A0 has the second member cross a u32 boundary, which leads to
> =C2=A0=C2=A0 padding between a and b, as well as after c on some architec=
tures
> =C2=A0=C2=A0 but not others. I would always recommend splitting up bitfie=
lds
> =C2=A0=C2=A0 on word boundaries and adding explicit padding where necessa=
ry.

Ok, got it, clearly the registers bitfield (which is a set of 32bit bitfiel=
d) is
fine (appart from endian, but this is deliberatly ignored). These are the o=
ne I
had mind, and are optimized with copy_toio.

For the SPS/PPS bistream, which is shared memory with the IP, I tend to agr=
ee
this might not have been the ideal choice, though the author did verify
everything with pahole for the relevant architectures (in practice only two
ARM64 SoC use this bitstream format). I'm happy to revisit this eventually.=
 And
would not hurt to share a common bitstream writer, that works with both end=
ian
in V4L2 (or use one from the core if that already exist).

Nicolas

>=20
> =C2=A0- Since most of the fields are exactly 6 bits offset from a word
> =C2=A0=C2=A0 boundary, you can try assembling all the=C2=A0 *_field_order=
_cnt*
> =C2=A0=C2=A0 fields in an array first that has all the bits in the correc=
t
> =C2=A0=C2=A0 order, but then shift the entire array six bits.



>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arnd

--=-a6XgCD27qq03YMrDQYTC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYDRbAAKCRDZQZRRKWBy
9BmnAP4v0H9AIDOJwkSt5nsCy1gJSeMTLHMTmG01wySik1NyDQD+Oxp+8Jhu76y/
V7e6xCFUqnyj6/L/L8hQ8Ob/lQOZVgQ=
=PulB
-----END PGP SIGNATURE-----

--=-a6XgCD27qq03YMrDQYTC--

