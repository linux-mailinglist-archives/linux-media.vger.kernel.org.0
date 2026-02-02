Return-Path: <linux-media+bounces-52034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCMVKNfAgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:20:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4ECCE1D3
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4171B30BE699
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DC378D9D;
	Mon,  2 Feb 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KiALrxnp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B336CDE4;
	Mon,  2 Feb 2026 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045180; cv=none; b=esldhEBr+aerBk2gztuANpt4KX5UMRihPRiMaGbT5Qrh6VOO0l1/zwXWbUZmLiXmhvJAiItGPwkuKbSwuNVsgtOPBbmqwFYkL3GgD+EL7LJuWYenRo8ZWW4b2ki++H9GDSamvxQ0tYK4M3AV8sE2rbkrDUuwe88A+P5hw2CDqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045180; c=relaxed/simple;
	bh=fK0UNuTXnFjqKpqCbxl7apHrA2QHhXM8zAwjoqglbco=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YR3bo0La2bscel3AZnBMeWFCJSgWFOpk+xS0bSc/QEy9H9f6eLgXIjlzpLDtUQZ0ZyYaJf9kNzG2VDoK91gCPvsIKN6fQGbvQOqR4niE0/JmQXfn/GYlGkXQQ1kbPU7s7gpCeG/unwurmCjrx3sC6s98zYuruU7mPslsnbunXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KiALrxnp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770045177;
	bh=fK0UNuTXnFjqKpqCbxl7apHrA2QHhXM8zAwjoqglbco=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KiALrxnpXHJNOBviH4hrLAhS6g40n2NUloKgX4tpKeb/saL9oHnuoWZbyBS6VeRC5
	 or2D8fcLMlSDWHBeJdkvBT83cb/rY17oyzpyxn+OjtC2SQNkm3gyWgkBwXlos4J+Fs
	 vM+Tgb1DCy4bNdsp2MmUabrAQoQttJWuXBY+TdP3nC3LJXKE4UyyKKtfxKk47vKKEh
	 RoI2rSZxSzJTmfjVqn6jzgukaCzf4yQAJNsML5wz3Cte1GGfikbzVM1bvdAFgCgwEa
	 O2kkor0DIvKfAYRUF9DBUG2VO7OI3g0bsFg8p4LYuWKu9kLOl22b4mdZi0VegCTB7N
	 Sk6RV6uwW8t3g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F23E17E1274;
	Mon,  2 Feb 2026 16:12:55 +0100 (CET)
Message-ID: <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
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
Date: Mon, 02 Feb 2026 10:12:53 -0500
In-Reply-To: <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
	 <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
	 <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
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
	protocol="application/pgp-signature"; boundary="=-0n1upZ0VLiSy35LHgcM0"
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
	TAGGED_FROM(0.00)[bounces-52034-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 1B4ECCE1D3
X-Rspamd-Action: no action


--=-0n1upZ0VLiSy35LHgcM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 15:09 +0100, Arnd Bergmann a =C3=A9cri=
t=C2=A0:
> On Mon, Feb 2, 2026, at 14:42, Nicolas Dufresne wrote:
> > Le lundi 02 f=C3=A9vrier 2026 =C3=A0 10:47 +0100, Arnd Bergmann a =C3=
=A9crit=C2=A0:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >=20
> > > The rkvdec_pps had a large set of bitfields, all of which
> > > as misaligned. This causes clang-21 and likely other versions to
> > > produce absolutely awful object code and a warning about very
> > > large stack usage, on targets without unaligned access:
> > >=20
> > > drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: st=
ack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-=
Wframe-larger-than]
> >=20
> > We had already addressed and validated that on clang-21, which indicate=
s me that
> > we likely are missing an architecture (or a config) in our CI. Can you =
document
> > which architecture, configuration and flags was affected so we can add =
it on our
> > side ?
> >=20
> > Our media pipeline before sending to Linus and the clang builds trace a=
re in the
> > following link, in case it matters.
> >=20
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/pipelines=
/1588731
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/9160=
4655
>=20
> The configuration that hit this for me was an ARMv7-M NOMMU build. I'm
> doing 'randconfig' builds here, so I inevitably hit some corner cases
> that all deterministic CI systems miss. I don't think that you should
> add ARMv7-M here, since that would take up useful build resources
> from something more important. There are no drviers/media/ actual
> users on ARMv7-M, and next time it is going to be something else.
>=20
> > > Part of the problem here is how all the bitfield accesses are
> > > inlined into a function that already has large structures on
> > > the stack.
> >=20
> > Another observation is that you had to enable ASAN to make it miss-beha=
ve on for
> > loop unrolling (with complex bitfield writes).=C2=A0 All I've obtained =
by visiting
> > the Link: is that its armv7-a architecture.
>=20
> Right, this randconfig build likely got closer to the warning
> limit because of the inherent overhead in KASAN, but the problem
> with the unaligned bitfields was something that I could later
> reproduce without KASAN, on ARMv5 and MIPS32r2.
>=20
> This is something we should fix in clang.

All fair comments. I plan to take this into fixes (no changes needed), hope=
fully
for rc-2.

Performance wise, this code is to replace read/mask/write into hardware
registers which was significantly slower for this amount of registers (~200
32bit integers) and this type of IP (its not sram). This is run once per fr=
ame.
In practice, if we hand code the read/mask/write, the performance should
eventually converge to using bitfield and letting the compiler do this mask=
ing,
I was being optimistic on how the compiler would behave. If performance of =
that
is truly a problem, we can always just prepare the ram register ahead of th=
e
operation queue (instead of doing it in the executor).

One thing to remind, you can't optimize the data structure layout, since th=
ey
need to match the register layout. But while fixing some of the stack repor=
t
previously, I did endup up moving few things out of loops (which is not cle=
arly
feasible in this patch). I did not checked all the code (only the failing o=
ne).
One of the bad pattern which costed stack (and overhead probably) was the u=
se of
switch() statement to pick one of the unaligned register location, with tha=
t
switch being part of an unrolled loop. If you ever spot these, and have tim=
e,
please just manually unroll the switch out of the loop (its actually less c=
ode).

> =C2=A0
> > > Mark set_field_order_cnt() as noinline_for_stack, and split out
> > > the following accesses in assemble_hw_pps() into another noinline
> > > function, both of which now using around 800 bytes of stack in the
> > > same configuration.
> > >=20
> > > There is clearly still something wrong with clang here, but
> > > splitting it into multiple functions reduces the risk of stack
> > > overflow.
> >=20
> > We've tried really hard to avoid this noninline_for_stack just because =
compilers
> > are buggy. I'll have a look again in case I find some ideas, but meanwh=
ile, with
> > failing architecture in the commit message:
> >=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> Thanks!
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Arnd


thanks to you,
Nicolas

--=-0n1upZ0VLiSy35LHgcM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYC+9QAKCRDZQZRRKWBy
9GSlAP98wAwsGZINllsCHn4BZIWdyEFzPQNWZpW54689SrMU7QD9GzjnPH5SIbIo
XpCL/RFia9fph8ZEiB+jh8mL7sloZAc=
=zvGH
-----END PGP SIGNATURE-----

--=-0n1upZ0VLiSy35LHgcM0--

