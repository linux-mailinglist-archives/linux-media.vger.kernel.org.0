Return-Path: <linux-media+bounces-54671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOmaAwvPqWk+FgEAu9opvQ
	(envelope-from <linux-media+bounces-54671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 19:44:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB0E217158
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 19:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F13C3086064
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3601D3E9F81;
	Thu,  5 Mar 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FvICW1C+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985B3E7162;
	Thu,  5 Mar 2026 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772736196; cv=none; b=Y6QeQ8N2bapNy591PQD9wNJDrrqLU9aSY8xm2mF8A2aSDMPclwaNnXi5GAKZoCkz9vTMfjwyzeNy0t0Bj4IjL+x00Mmcqtj0ls5kYDk4dK9pPr0MJfmEQJKK1fX/0R0q49qcPMS381En1pOmRuWKjNklTEWMWE7Uz9rmz5/SjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772736196; c=relaxed/simple;
	bh=pnxoz4idCuWp1cjgR8NlXKfgMViTDq/5rJxjecRq6R4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOQ/F5/ib/QLtYXdLIOM7macFSV0oTChPljU4Szfbwd49bzvNn8e4EPXSNudjjTHbi5an/+Ll2pDWOnqaaNKFPAUXr+amfaeuejUlKaWCwQtGO8EG0RcvyNKAE+4mFlZFOm2enBgS/nv1gC4JYEPsDc1GWGJUfOMGFY8kGOQ+0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FvICW1C+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772736193;
	bh=pnxoz4idCuWp1cjgR8NlXKfgMViTDq/5rJxjecRq6R4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FvICW1C+Vlwk7C4+2b7hZrZ1qiKUEWLbPrLCzWapdyHqHilwja7f51Mk42/bd4IYS
	 46BIFvCXXiNaJ+Pja4y+Td9egZ0+ZSeEqthkmqAaA6UmT6YKxhSOOUAl5zJ+z0lf6L
	 +gNsej+g6pk4/aVVfERQGjaQDW6nYi4DP1BoZchf9c/ktfYhxP4IDNld2oUW2mwAje
	 4z4UBZdkfg2o4bnQPQSPmnvp7NKwbrYfQkybUPREENsRddcAfsHou8u37b2Y05X2Gu
	 Y6h1RKLmnJ/1GhWcvkZ+jgbJ5atxN4V5Sw9Hh1RH1DGMSmHwKTlZ/DWOTnUy4wEVzq
	 baOMHLDz9YL3g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB81F17E026C;
	Thu,  5 Mar 2026 19:43:11 +0100 (CET)
Message-ID: <5c8e5f38af10f44f366629e1e7c948ae9af2a196.camel@collabora.com>
Subject: Re: [PATCH 1/2] [RESEND] media: rkvdec: reduce excessive stack
 usage in assemble_hw_pps()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Detlev
 Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Nathan Chancellor	 <nathan@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook
	 <kees@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 05 Mar 2026 13:43:09 -0500
In-Reply-To: <e907e900-073f-4aa6-b4fe-36b87e312f62@app.fastmail.com>
References: <20260305152644.791897-1-arnd@kernel.org>
	 <1621b56864cb186f1e5433b73b56afc00aa83452.camel@collabora.com>
	 <e907e900-073f-4aa6-b4fe-36b87e312f62@app.fastmail.com>
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
	protocol="application/pgp-signature"; boundary="=-2kH2WREimXA5rID0isEA"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6BB0E217158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54671-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--=-2kH2WREimXA5rID0isEA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 05 mars 2026 =C3=A0 18:10 +0100, Arnd Bergmann a =C3=A9crit=C2=A0:
> On Thu, Mar 5, 2026, at 17:37, Nicolas Dufresne wrote:
> >=20
> > Le jeudi 05 mars 2026 =C3=A0 16:26 +0100, Arnd Bergmann a =C3=A9crit=C2=
=A0:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >=20
> > > The rkvdec_pps had a large set of bitfields, all of which
> > > as misaligned. This causes clang-21 and likely other versions to
> > > produce absolutely awful object code and a warning about very
> > > large stack usage, on targets without unaligned access:
> >=20
> > I'm a bit surprised you felt the need for resend. Perhaps you can help =
us
> > understand what made you think your patch wasn't being processed ?
>=20
> I updated the second patch today after I found a corner case that
> wasn't addressed by the first version. As I had sent both as a series
> a month ago, and neither was in linux-next yet, it seemed more helpful
> to send an updated series rather than replace only one of the two.

If you updated the code I'd prefer if it is sent as a new version, not a re=
send.
As for the media merge window, its been about a week since rc1 got merged i=
nto
media tree, with couple of weeks before that waiting for rc1 to land. I bel=
ieve
your month gap is there and accurate. I did also took a small break on revi=
ew
and PR concurrently.

>=20
> > My PR:
> > https://patchwork.linuxtv.org/project/linux-media/patch/2074ba5a5d05e23=
9f432d176eb051105f7e692f9.camel@collabora.com/
> >=20
> > And Hans/Mauro did logistic on the #linux-maint IRC channel this mornin=
g. I
> > believe I've marked all the relevant patches on patchwork our of "New" =
state
> > and
> > you have my Rb. What else would help you ?
>=20
> That's fine then, I did not mean to seem impatient. I assume
> the original patches will be in linux-next then, and [v2 2/2]
> will conflict. I'll let you review that one first, but can
> send a rebased version if you think we should merge it on top.

It will first reach media media-fixes (and not media-next, to avoid duplica=
ting
the patches), but I have no idea if someone picks from media-fixes into lin=
ux-
next. I recall there was a gap to be fixed in this "pre-integration" proces=
s.
Though, patch from fixes reaches RCs quickly, which are linux-next base.

Now, concurrently, Detlev is working on removing the bitfield for the RPS, =
and
the SPS will come later. Perhaps you want to sync to make sure we don't jus=
t
cancel out the work.

To solve the patch conflict issue, you can work on top of your existing ser=
ies
(just put a comment in the cover). I'll request a merge of rc2 / rc3 into m=
edia-
next, before I pick it up.

regards,
Nicolas

--=-2kH2WREimXA5rID0isEA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaanOvQAKCRDZQZRRKWBy
9HEEAP9SxgfNdzeWxoTFoO7BIW/dGlPesVcMOtlIL7jliydbcgD+IVKhK0U8Xtik
CKB7l0ZE/DrTnjCzPM7uHg1CaqNjXwM=
=SWbL
-----END PGP SIGNATURE-----

--=-2kH2WREimXA5rID0isEA--

