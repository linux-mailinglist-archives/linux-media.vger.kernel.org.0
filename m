Return-Path: <linux-media+bounces-56374-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDm7OMhXvGkUxQIAu9opvQ
	(envelope-from <linux-media+bounces-56374-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:08:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94D2D1EE2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D609306B2DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7042C38B157;
	Thu, 19 Mar 2026 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="M6B1+mgw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F2A3451CF
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950913; cv=none; b=pJjZte7Kth+izGe0/4G/kl2mkbN1I8zLwhWrDjiSuTGXxp/EBTaYbx8IRTa9kwLdWb2CDx1ryOyBfYjOOYmIYzraeL/FxnRF+IOFCNOryl3aACKa6fFPP+quX/DagMlUDhW5tnWJtDk5QYKLMqnxa+nWBSBIOIT2G4F5QvzC5PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950913; c=relaxed/simple;
	bh=0HYoiBf4UwYb5v2F+P/TMj6GeYjUxJ9OrBOsmkAK+k8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XQa338fWKTVj52d+Rtc82FELheFIzSEEMG3CyHW46uBFRNog9FRn6k3gwlIalhhGaWgJSuQYjxXo+tt6DDfCoaIpVp3NEVMrc4qBMDtJ9ZlwCW3GvKJN4WouUBdTS+4IJGqKvoTfCLtz6oV6OjMkOUBi+acVY5FADre2tMDp7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=M6B1+mgw; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-89c52db6231so12975406d6.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773950912; x=1774555712; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ByHAIq8SKqFDrHlL2iXnLmh/0Lqol60jmXl6QH+csvw=;
        b=M6B1+mgwLx44+8MRQUDN2govSw8bYgGh1NkmHBfsrDp8s+iPDYOU1Mroi25p/0ku5U
         a6VHGYlG/vkBy4tl5POkzz/y09uYikE7tJ5c3X4tnU0VCivRQ6+rCoq/Zw8M0FeC+f+q
         pJU4O7UiaS7/iFHWi/yFXcVnbcgyMyY6qz9mm+o/3tyiap7NnaQ8QsFoMpp3rZAlykP+
         RiBn1+pYTIxSS4f4o+Et5ZUvXr59e0wnTkZyGl43c22DBmlC5g5i9dHH+INb5IMv8pHa
         09GyD78goyCuilgnJUIMLHMm8Ik05VY4UPA3Ij0NrFjzIARHqy7WhyxacqnoJ0qlaRFW
         JtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950912; x=1774555712;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByHAIq8SKqFDrHlL2iXnLmh/0Lqol60jmXl6QH+csvw=;
        b=jVLvQCXEPQ/pktm61S6lGAmZTAXpxXSgNhChCm92fxzwHCklN+ROKGNOwvkbfoxvXv
         BD7xnE/n25RCqykD7iFBNSsSOVhJfWGwu9xpEmFxcAxYcz58AbJb0x3/MyE7zZpVXWUK
         CyuE7Vh5R8d+BzcfCSijbPMDhzzn89E3zljSxYd447Nx2Z/ZXlg/ecTTmJkK3pXK13cf
         syTx171xBKe5De7LtAChkliXe+kvK553PDu4nZ01F3qLCp3nu9hHmyVEmW3jWpdW2B69
         1C910ZQQmAi4XoKOFeAc2AHpDwUdFgkrqaDoq5GrDMDWIo6FOsc0MoSpYvWz8SRWw9/4
         J2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpvo7dgqFTwMmcnZB7U7yOv3NBoGm4aWO+Mai0kJarB+1xxun5ZO+IriSiLEngw9BSLAdxkC8s8SlIGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySXl4EfzZ7B8F4xOp6eFuY0s7pcLA4cz7YaRtpdbBgqSy8FINm
	Tsrda1WAcbMP2jbrmw178A6Rh5jX5shmCWzNQJDPRqTinSFQDNZaH5hNvTbEPbZN6Fc=
X-Gm-Gg: ATEYQzxn+KoWUouxWeJjzXFnTEdDD/CdlTZSZ6lMA+4wZtbLV/dBS+2WsyZdti57nxO
	41gSxcg20y69FCXyYykERnbZu1i7t8o1BIIyPU/U1/pWNY7wk3q2HunegF0H84GfM2thb+fmWun
	Re5xHlZd+WhFJq3Ao7NYS/R5EQKrU+bweQFDo/D2UJiZQ/bOhED1OI5YeLfe5blMM2y3AhLWfOR
	DmTcr3kEE8icZTKDn4b2YDygD2pbBG4uYCFFQ70e8+JxFPY+3yUsjxIg8rNgh91CM4sC/aLWFVk
	9nQ6jZeVWYyw2xocpyuuphBadOs/quAPsXJzT226+96NCLvUTjL8phVvQPWqjkAxebiz7t/bGof
	DDR51nNGTFTBhlCWbx0fKw06MHRN1y2cHbKibe1A31c7DQU43s8zoefDqJ9gMHE+qV4Qs2dNgS3
	s3jgcG9U+oesSv4RryRGK3IkNgZeo3
X-Received: by 2002:ad4:5749:0:b0:89c:4c6b:4615 with SMTP id 6a1803df08f44-89c859b56b1mr7040446d6.8.1773950911430;
        Thu, 19 Mar 2026 13:08:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85334b61sm4468026d6.26.2026.03.19.13.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:08:30 -0700 (PDT)
Message-ID: <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
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
Date: Thu, 19 Mar 2026 16:08:29 -0400
In-Reply-To: <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
References: 
	<20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
	 <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-aLX8AP+3kvv0mY+uT9HF"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56374-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,ndufresne-ca.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D94D2D1EE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-aLX8AP+3kvv0mY+uT9HF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 16 f=C3=A9vrier 2026 =C3=A0 11:17 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> Hi Nathan,
>=20
> Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 15:10 -0500, Nathan Chancellor a =
=C3=A9crit=C2=A0:
> > Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> > with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> > is further investigated and understood on the LLVM side [1], disable
> > CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
> >=20
> > Link: https://github.com/llvm/llvm-project/issues/178535=C2=A0[1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > =C2=A0drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > index 5f3bdd848a2c..d03689464206 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > @@ -1,7 +1,8 @@
> > =C2=A0# SPDX-License-Identifier: GPL-2.0
> > =C2=A0config VIDEO_ROCKCHIP_VDEC
> > =C2=A0	tristate "Rockchip Video Decoder driver"
> > -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> > +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)
>=20
> This is clearly not a pleasing change to make. As this specific data stru=
cture
> and usage of bitfield has been discussed (along with the numerous issues =
in
> clang/llvm around these). We also agreed to move away from bitfield for t=
his
> data structure and use a bitwriter. I would favour delaying this change t=
o
> give
> devs the time to port instead. Ping again if nothing moves within few wee=
ks.
>=20
> best regards,
> Nicolas

I haven't heard back about the port to plain bitwriter. I guess I have to p=
ick
this patch, but I really don't want to have to maintain too many of these h=
acks.
Anyone else with an opinion on the topic ? Or a better idea how this can be
workaround differently ?

Nicolas

>=20
> > =C2=A0	depends on VIDEO_DEV
> > =C2=A0	select MEDIA_CONTROLLER
> > =C2=A0	select VIDEOBUF2_DMA_CONTIG
> >=20
> > ---
> > base-commit: c824345288d11e269ce41b36c105715bc2286050
> > change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
> >=20
> > Best regards,
> > --=C2=A0=20
> > Nathan Chancellor <nathan@kernel.org>
> >=20

--=-aLX8AP+3kvv0mY+uT9HF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxXvQAKCRDZQZRRKWBy
9LPWAQDjmQG+J8NCldLkt5e0YHN+eY/oOMY+4gtMMaOv1QmtXgEA2xvzyNJj6OQ1
hF9ceJ9F7RRvzrexm9h/QWzmjT6UUwM=
=rPsi
-----END PGP SIGNATURE-----

--=-aLX8AP+3kvv0mY+uT9HF--

