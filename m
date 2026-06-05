Return-Path: <linux-media+bounces-63953-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id loydH/ATI2olhwEAu9opvQ
	(envelope-from <linux-media+bounces-63953-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:22:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C164A8EB
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:22:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=d7ObBYTC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63953-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63953-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07938303BB10
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 18:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6353D3B27FB;
	Fri,  5 Jun 2026 18:15:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6333ADB1
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 18:15:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683353; cv=none; b=OuPiBrKfJEzxnEIl1J0cZqWbPu4zy6Vrp3bGycg9+gcgHlMZ6EwxKylapje7dtdiYnux6iXBGWo4+7J4iS657++Bu8yVdVmOYZHdllyp1ytGJESMc0CF3bGiIIsCR+kKH1GC8if2I7GMnYegZjdmnLe5LagEMxn/MwXsAFRzL70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683353; c=relaxed/simple;
	bh=5ft45m5a4lONpYqQc6oeoMr7gs+UQO9E5MGP6LanRgg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WaU1/i8Gof497uAx8CPhn+E8cRunctHSLFKV7ygK5UoQ41jT15SFGYR8PPZc+sWyu1uq1tp7An8ToSgs1IRbFvN7S7PRx/lzEGbUI9e08fb8p+q1DuBv29HTEhvyyRvnTQ7Qsn8Ld+wc81Z/bvSDDZh34e4ELS5b+gOJeuXq8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=d7ObBYTC; arc=none smtp.client-ip=209.85.222.171
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9157d3f2098so287347285a.3
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1780683351; x=1781288151; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WCi/80JQIOb8iSao69qqSHkkC6Mgsbnj9aEfTNXdGgI=;
        b=d7ObBYTCfappcYNQCMJHAG/sNKfPEUglqYQBKOcqqyzrSwS5LiER/IYyJbkO/Mauoo
         /T8c6hCY/KC9Gt9YhPxJhfhZ2SWX8muNZHgiK2Iaqpqrc/vcP90l0U2H4VtESm9CWjLh
         YK+gsm6zZ8udOs2z4+BtVgtC72+D4yt23dywjkyb87lUKTxWJuXadMA25AvrLHGKo7nt
         F4VObWcfwDofqQzrqU4otd8mSaiH7Cmy6FNzZGhmQWeUpTnPMmSDDbgy6HQV4m/mXYnA
         DFOhZOQA8Whs4HnAmGCPslxdAyA5vGPeZPSEUrQI9HDmlTXBQ0auzpyvMrempNqreaQM
         E9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683351; x=1781288151;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCi/80JQIOb8iSao69qqSHkkC6Mgsbnj9aEfTNXdGgI=;
        b=O+n+6ZmDi7hXQfAUT2mUm9cvDbfDQs+XVCbdkGAiUb5FKAjILBDDh0fgAD7SGjM4GJ
         1CkMeNi4whaDJYODmfJji1BJOoSNo8B3hObZ0+zI5lc4JJyCLOTzz98ClQGPbWCYz0/L
         cmlo2dwxPBCPppmyXfLf4/iyOFtoC/+ianBshH5gByALh1AhtoL5w4MSsRHLZsGrEc0M
         BRbWLR8k/Bft1od8Tpndy5lvBalEFJT/hfTYoRMQ1wmb8+z1Vxb/JychdSPMxe9uBG+k
         gINOIPWZOF4GbqS4gd714iqs5DDRgsQeyNnkKSzYCGMzHKhjmrA4phNR0nBREhVD6Jvt
         QCgA==
X-Forwarded-Encrypted: i=1; AFNElJ+YUxUr8XmcybSEpYfKdauLEYbue9vthHPUvzjs/Cqqh4B+bSjZ3ItNHxXUQi7LjQi0LjfCDArLFu+zoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4WiG7QQQdg6oECSB+0t40eD3H/VEcDpXJn33+ZUMSb7oeH9i
	nM73nFUIH2XAZJVPc7FupYcKz1HZn2m9zMkXtJCAG+aX563JyTx+lkmo0OAqNyLJO3M3WkcQTYn
	q+hlMvjBJOA==
X-Gm-Gg: Acq92OGxdbNDHE2ov/w9l0AH2wfMBK7WWpeqICq2uLOijdmCk7rT/VCmMhINLwwsRzw
	hLmH6/4m9sWVZ62LODa1tk0bFp/0/NtFX9XoIIUIQ9WaCjN2s5V2qDt9nZll7x+1liJbqLXqLEH
	hVM3Y7GTWkECN43Zz6l+M5vfA229CEuwqg/Jaheg06+/AoTMx1zOiLW5gZmWrVv6ngGHuk2mc3c
	WpfmYJrWPnWAa57dsPOeHC/8Plbb1OZXkVNPwAhWFnQfamHQ6bQrl8/cOnCzYMRJACU5KkDnUO2
	WDQPpVZ6uCWUFgchCzMNJcHd7xD2WNfIQWOKEBLESWUVjCFhAqwGdv8Qk2qp8dcHGkQ6XDd4ufs
	zLlgm9KCwU+GlX0bm7UvEFId77y1L779ht5aa9B0/tS4mJZtxzVgWFDnBLBGuky83d3fVNF8rTp
	NXKBwWl09F9Fz8uAR3TkhllzXZDRoVkbxttGQjF/mVzPVkXYngRzSoaZ/f3t+XWnkhoOhNjEQY1
	aoA8abgvA6DkDl22g==
X-Received: by 2002:a05:620a:3714:b0:913:e5bb:3dce with SMTP id af79cd13be357-915a9dee0bbmr885636485a.55.1780683351027;
        Fri, 05 Jun 2026 11:15:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a21f871sm972938785a.12.2026.06.05.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:15:50 -0700 (PDT)
Message-ID: <2b1f2f4281778f21a626d857c3197b8796630fd8.camel@ndufresne.ca>
Subject: Re: [patch 1/1] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org, 
	mchehab@kernel.org
Date: Fri, 05 Jun 2026 14:15:48 -0400
In-Reply-To: <20260526222709.608471F000E9@smtp.kernel.org>
References: <20260526222709.608471F000E9@smtp.kernel.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-g9KVlv5Zfs1ffnUzo6Lj"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-63953-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:email,ndufresne.ca:from_mime,ndufresne.ca:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 730C164A8EB


--=-g9KVlv5Zfs1ffnUzo6Lj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Le mardi 26 mai 2026 =C3=A0 15:27 -0700, Andrew Morton a =C3=A9crit=C2=A0:
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining

Any reason this patch does not follow any of the rules in place in term of
subject and commit message formatting ?

> Date: Tue May 26 03:14:09 PM PDT 2026
>=20
> csky allmodconfig, gcc-15.2.0:
>=20
> drivers/media/v4l2-core/v4l2-vp9.c: In function 'v4l2_vp9_adapt_noncoef_p=
robs':
> drivers/media/v4l2-core/v4l2-vp9.c:1834:1: error: the frame size of 1436 =
bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
>=20
> The amount of inlining in there is simply nuts.=C2=A0 This patch semi-ran=
domly
> uninlines various things and fixes the above.

Similar to all other defconfig issue reported before, can you provide us ac=
cess
with the problematic config. Despite your strong opinion, we are still
interested to know why this popped for you so many years later after that c=
ode
got introduce.

>=20
> Ad the .text size reduction is tremendous:
>=20
> ts:/usr/src/25> size drivers/media/v4l2-core/v4l2-vp9.o
> =C2=A0=C2=A0 text	=C2=A0=C2=A0 data	=C2=A0=C2=A0=C2=A0 bss	=C2=A0=C2=A0=
=C2=A0 dec	=C2=A0=C2=A0=C2=A0 hex	filename
> =C2=A0 22450	=C2=A0=C2=A0=C2=A0=C2=A0 36	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
	=C2=A0 22486	=C2=A0=C2=A0 57d6	drivers/media/v4l2-core/v4l2-vp9.o-before
> =C2=A0 16144	=C2=A0=C2=A0=C2=A0=C2=A0 36	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
	=C2=A0 16180	=C2=A0=C2=A0 3f34	drivers/media/v4l2-core/v4l2-vp9.o-after

While this is nice optimization data, we would need to know if that agressi=
ve
de-inlining did affect the performance. In absence of that data, I would ra=
ther
prefer see a more conservative approach with the clear goal to de-inline en=
ough
to fix the issue, or simply refactor the code.

Nicolas

>=20
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>=20
> =C2=A0drivers/media/v4l2-core/v4l2-vp9.c |=C2=A0=C2=A0 30 +++++++++++++--=
------------
> =C2=A01 file changed, 15 insertions(+), 15 deletions(-)
>=20
> --- a/drivers/media/v4l2-core/v4l2-vp9.c~drivers-media-v4l2-core-v4l2-vp9=
c-reduce-inlining
> +++ a/drivers/media/v4l2-core/v4l2-vp9.c
> @@ -1582,25 +1582,25 @@ static inline u8 noncoef_merge_prob(u8 p
> =C2=A0 *	merge_prob(p[9], c[9], [10])
> =C2=A0 */
> =C2=A0
> -static inline void merge_probs_variant_a(u8 *p, const u32 *c, u16 count_=
sat, u32 update_factor)
> +static noinline_for_stack void merge_probs_variant_a(u8 *p, const u32 *c=
, u16 count_sat, u32 update_factor)
> =C2=A0{
> =C2=A0	p[1] =3D merge_prob(p[1], c[0], c[1] + c[2], count_sat, update_fac=
tor);
> =C2=A0	p[2] =3D merge_prob(p[2], c[1], c[2], count_sat, update_factor);
> =C2=A0}
> =C2=A0
> -static inline void merge_probs_variant_b(u8 *p, const u32 *c, u16 count_=
sat, u32 update_factor)
> +static noinline_for_stack void merge_probs_variant_b(u8 *p, const u32 *c=
, u16 count_sat, u32 update_factor)
> =C2=A0{
> =C2=A0	p[0] =3D merge_prob(p[0], c[0], c[1], count_sat, update_factor);
> =C2=A0}
> =C2=A0
> -static inline void merge_probs_variant_c(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_c(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	p[0] =3D noncoef_merge_prob(p[0], c[2], c[1] + c[0] + c[3]);
> =C2=A0	p[1] =3D noncoef_merge_prob(p[1], c[0], c[1] + c[3]);
> =C2=A0	p[2] =3D noncoef_merge_prob(p[2], c[1], c[3]);
> =C2=A0}
> =C2=A0
> -static void merge_probs_variant_d(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_d(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	u32 sum =3D 0, s2;
> =C2=A0
> @@ -1624,20 +1624,20 @@ static void merge_probs_variant_d(u8 *p,
> =C2=A0	p[8] =3D noncoef_merge_prob(p[8], c[6], c[7]);
> =C2=A0}
> =C2=A0
> -static inline void merge_probs_variant_e(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_e(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	p[0] =3D noncoef_merge_prob(p[0], c[0], c[1] + c[2] + c[3]);
> =C2=A0	p[1] =3D noncoef_merge_prob(p[1], c[1], c[2] + c[3]);
> =C2=A0	p[2] =3D noncoef_merge_prob(p[2], c[2], c[3]);
> =C2=A0}
> =C2=A0
> -static inline void merge_probs_variant_f(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_f(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	p[0] =3D noncoef_merge_prob(p[0], c[0], c[1] + c[2]);
> =C2=A0	p[1] =3D noncoef_merge_prob(p[1], c[1], c[2]);
> =C2=A0}
> =C2=A0
> -static void merge_probs_variant_g(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_g(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	u32 sum;
> =C2=A0
> @@ -1659,12 +1659,12 @@ static void merge_probs_variant_g(u8 *p,
> =C2=A0}
> =C2=A0
> =C2=A0/* 8.4.3 Coefficient probability adaptation process */
> -static inline void adapt_probs_variant_a_coef(u8 *p, const u32 *c, u32 u=
pdate_factor)
> +static noinline_for_stack void adapt_probs_variant_a_coef(u8 *p, const u=
32 *c, u32 update_factor)
> =C2=A0{
> =C2=A0	merge_probs_variant_a(p, c, 24, update_factor);
> =C2=A0}
> =C2=A0
> -static inline void adapt_probs_variant_b_coef(u8 *p, const u32 *c, u32 u=
pdate_factor)
> +static noinline_for_stack void adapt_probs_variant_b_coef(u8 *p, const u=
32 *c, u32 update_factor)
> =C2=A0{
> =C2=A0	merge_probs_variant_b(p, c, 24, update_factor);
> =C2=A0}
> @@ -1724,33 +1724,33 @@ static inline void adapt_probs_variant_b
> =C2=A0	merge_probs_variant_b(p, c, 20, 128);
> =C2=A0}
> =C2=A0
> -static inline void adapt_probs_variant_c(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_c(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	merge_probs_variant_c(p, c);
> =C2=A0}
> =C2=A0
> -static inline void adapt_probs_variant_d(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_d(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	merge_probs_variant_d(p, c);
> =C2=A0}
> =C2=A0
> -static inline void adapt_probs_variant_e(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_e(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	merge_probs_variant_e(p, c);
> =C2=A0}
> =C2=A0
> -static inline void adapt_probs_variant_f(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_f(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	merge_probs_variant_f(p, c);
> =C2=A0}
> =C2=A0
> -static inline void adapt_probs_variant_g(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_g(u8 *p, const u32 *c=
)
> =C2=A0{
> =C2=A0	merge_probs_variant_g(p, c);
> =C2=A0}
> =C2=A0
> =C2=A0/* 8.4.4 Non coefficient probability adaptation process, adapt_prob=
() */
> -static inline u8 adapt_prob(u8 prob, const u32 counts[2])
> +static noinline_for_stack u8 adapt_prob(u8 prob, const u32 counts[2])
> =C2=A0{
> =C2=A0	return noncoef_merge_prob(prob, counts[0], counts[1]);
> =C2=A0}
> _

--=-g9KVlv5Zfs1ffnUzo6Lj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaiMSVAAKCRDZQZRRKWBy
9K3SAP9xAFrNk4aaMkdxemFVzle9wpSWNQzjNnumqiaLgMKDpgEA4+Oo8XVkjluJ
OUqBGu7pqcsStjLnFpGFVf3hvEu/XA0=
=E8nW
-----END PGP SIGNATURE-----

--=-g9KVlv5Zfs1ffnUzo6Lj--

