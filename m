Return-Path: <linux-media+bounces-52922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIpOCK1Dk2kP3AEAu9opvQ
	(envelope-from <linux-media+bounces-52922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 17:19:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4C14607A
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 17:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F65030479F2
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84DF3321D8;
	Mon, 16 Feb 2026 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="hqAG6hO5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9021D3D6
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258656; cv=none; b=H7PqH6Csb/8BrEWqRM1c2zDBJRVWxZ2ADmyJbuRDluFpvszSmS21dl3Bl83bwAuJCO/KSoWSfaCoVKmKNqQ5fuF3Vek8rsyrfiiS4loBngEmRuY8/x12oFhpXESl498gEs0bBe86X98ql/VhdJY6BwLevSTG1DQ5ykGeyzbHtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258656; c=relaxed/simple;
	bh=PSTw93rEWxwyptbbknvkyoCYal5ZyikU+NB5M8sxwoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f2D+Ynw2I+gofiFjBKn1L2w7tza3ZT0l8hmKkZT22fi53pP0cABEx1O4LzqrwL+BcihFQGDpFaU3E2Eyzo6wM/D6dqONW7RC+ihSeflLORj2fQiGIyYnAdtYO1AglSyH7pcAla2iXgCG26i4XqYGF9x0QdAQt/C4NK0tA0Mtm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=hqAG6hO5; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c7146b0854so352205285a.2
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1771258654; x=1771863454; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=;
        b=hqAG6hO52CGpWacffxyIRK6i/lr/wOepkQUDz+TdlZAd4t88DZQNzFRLlZj6PLDMKK
         k+AicBWXhI8EvPw5IBl+88xNSL7koljuJwVKWe/uQX+HhnHOp/S/GEJ8XWm603bqAYeJ
         89R3Is6E6MedomSdiC0GfeeSslq664J5B1yMXQXqOuOkQ16X6tFLv305Szf1YRqYUB0C
         HGXbB0GLMECjUYt7kyZr0IH52ZtXhGu26CbXVPrY7C8DvuIU8gpAicKXKhSqMMgOwTel
         p5dhaxQtsBytoIXv+tiXaVcUVzjiHLVLPsRFaSIA9ow+ePsTgJvAkTvC7/HnPNG5ySFo
         ZeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258654; x=1771863454;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=;
        b=Hf90Vf8/e7yMIL8sYzO9+XrOZtrX1c44eF0iFo73rQgLggu+2xZXkZkvA9N22uqSEO
         YM9c785xRDsdDbREsJgGbSq4pkj4JMvhg1peYQBTuWmOzg0k5g3jf++CJFpxggp3XYX6
         pixuOKBdFwhEyXKBgUf4B5HgUqVCN/Bk52BjJYGwU45yh7BfBEiKLUfGYxkqTWjwH1XE
         e7BUEcq4X0q2l06TWu2xxI89phIBx8hMj9V36Q5amz32HBCGMHZEZeqNDaUmTvmW7eeX
         rRwaEQpvoYmISkOz+y1CdtRNh8Ju9G5gf2lh4kKFK+IaLquap5iLtXBERvXh0ABeVarX
         tZLg==
X-Forwarded-Encrypted: i=1; AJvYcCVdixiD4xMr2+3tzemMxAmyf5tpAsJcU2jDGSSw4BDMsEq2YsoWAnn5vOdNdDm5lb4lbBno4WFvvFVfCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZtNnnVvJxU4YHKE6ybAjr32SDy82GK45fIVzx4zPmAnl8Gll
	NBTy2p1MLfSZkFrRCCdd7pdyH88NsQxQUUc6eHh+HCpTd86WvB52DghGhugemtSxKbo=
X-Gm-Gg: AZuq6aKJLkESfmP7m6ZsXOtF1obFRlY16ICY2Pg/0Rd0LmW/uyVVNlETaynYiNqfzvk
	HKqtcnoooNJueq/f1dhTjO9VMaRmti10asNk9k5bSUkRaG/gNMCPXgpSqLz8qxxQRYbjcHyz9GT
	om+hhygyn+qbKwOiaPDhl14uZc5Rvp6H6svwRhPzbOIpPgLgphuLghkrEBMt0EyZIFOC7jPDcPo
	ARZr+wXZoXMzx5LIBgmIgCj2QeHSJp0E2FrakR3M2S7DfJ/9c7+LL8Alo73LkikowA3+m0YvN4c
	PwDHay4/ZdjqLh0m11ztqqcqQL3zWS+pDiCAT1qyfwDnDQ2fp5c3OIs+z6We2I8rIVYB05eIUI7
	l+NW0nn1MJrvTaJUwOLrw8y1EixHM4FI0MnlkQphft95H3DI/HMMwunPds1fMtSYTeT5SN5T3kK
	nu5u7CaXp9T9yi6tgGZmGa7BvosdL/
X-Received: by 2002:a05:620a:40c9:b0:8ca:105b:86b6 with SMTP id af79cd13be357-8cb409219e2mr1421526385a.88.1771258653567;
        Mon, 16 Feb 2026 08:17:33 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb4120f939sm883143485a.44.2026.02.16.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:17:32 -0800 (PST)
Message-ID: <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when
 compile testing for Hexagon
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Brian Cain <bcain@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	llvm@lists.linux.dev
Date: Mon, 16 Feb 2026 11:17:30 -0500
In-Reply-To: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
References: 
	<20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-g0IOH3/wXifty34RwVB5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52922-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 6CE4C14607A
X-Rspamd-Action: no action


--=-g0IOH3/wXifty34RwVB5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 15:10 -0500, Nathan Chancellor a =
=C3=A9crit=C2=A0:
> Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> is further investigated and understood on the LLVM side [1], disable
> CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
>=20
> Link: https://github.com/llvm/llvm-project/issues/178535=C2=A0[1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/med=
ia/platform/rockchip/rkvdec/Kconfig
> index 5f3bdd848a2c..d03689464206 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> @@ -1,7 +1,8 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0config VIDEO_ROCKCHIP_VDEC
> =C2=A0	tristate "Rockchip Video Decoder driver"
> -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)

This is clearly not a pleasing change to make. As this specific data struct=
ure
and usage of bitfield has been discussed (along with the numerous issues in
clang/llvm around these). We also agreed to move away from bitfield for thi=
s
data structure and use a bitwriter. I would favour delaying this change to =
give
devs the time to port instead. Ping again if nothing moves within few weeks=
.

best regards,
Nicolas

> =C2=A0	depends on VIDEO_DEV
> =C2=A0	select MEDIA_CONTROLLER
> =C2=A0	select VIDEOBUF2_DMA_CONTIG
>=20
> ---
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
>=20
> Best regards,
> --=C2=A0=20
> Nathan Chancellor <nathan@kernel.org>
>=20

--=-g0IOH3/wXifty34RwVB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZNDGwAKCRDZQZRRKWBy
9PhBAPwMxt2qHIuuv8Re3nGYyjxclF1akWrq8joXpNiryhAGZQD8DZ31iVeXv3Jn
qIdzhD88lbsc2tAt4dDx0Aynb0/hEQw=
=AYDo
-----END PGP SIGNATURE-----

--=-g0IOH3/wXifty34RwVB5--

