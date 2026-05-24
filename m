Return-Path: <linux-media+bounces-62692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBe5Ca5jE2r+/QYAu9opvQ
	(envelope-from <linux-media+bounces-62692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E555C43A0
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35FC13004075
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 20:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5CB337BAB;
	Sun, 24 May 2026 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jmp3uHrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FFF3195FB
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655581; cv=none; b=OxJ4h0htZdP3t3fkAoWZkXYUu7zOYg9ZzvIIEXbChmvH46t06fBZqejqbaXnJ5eXyVcjlSG1nCv1swpjuTV9eTlcJvyuLbraAUqVS9qmtRGQQj89sYfHABobY27EcOkP8Q2rkPo3zJGnvaNz81psAz0iROCep0DiCVGDdyprksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655581; c=relaxed/simple;
	bh=z916saKk+Bibhk8li2KvcNhAv1Ate3JvIJh3qFvDy4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Urtc6x76WZ3Kz248H/hBCeh1Upy9AXN6rTBEBwDxPTBhPZhr/Iv7JpOuvMFiKhbT6WpMTwugBOtHplCruVlgpmgzyugOndCtken8sLp92lL8IggCuEgP/WR0Sc+kxkXISMfOobzKC8km/ASg4HDSZRyZkhxZZzj0HanUx3+at5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jmp3uHrJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3911F000E9
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779655578;
	bh=XdF14EN2gaQGUPUIlCL2/+2xdkR1iD92W761e0Tt4JU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Jmp3uHrJalMuK97geIL59g/5n7B65j4S+VeBKj4DmDnWAQAOqouhdvFbo252rKe1N
	 EUpcyyD86pld7FFWuHYj2qi8ttslywQ2YFv76xk/LlUttVGuoD9e4xgAb2hVLHFodp
	 u6Q1IXTDm6SolrO1KWjZicEZWW5RynXVu/f7bW8JdKQU1niaxHUcErr+5GtJ0J//7M
	 tS3zfKpjQBSUnWPA00aobrjTTMyxvZ/TVTOv9zHAI180OLjHC+Dvj5SdsgPFJNu5mY
	 JaZH7oDTDHlAfcxE3VboyLjNP0h0O1pur4E3J7GfrvSc94tGzLkq5ydvaUoftCMZrX
	 zBlUfe1hiS8dg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39397d63804so38780901fa.2
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 13:46:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zC6CLiCgIHcEW7J3AZYX2QbZ9Haer93eFZJCWDfODOG65lRS9G14UlviiQPsMvk/JXbMVizcQ6/HfwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOVfZYoIEv1mDz5+prBOLoUxPD+CU3gSSRUl8Wj1c5lsEco8DC
	pq6XX12m6K/7jb9bLIO/YbqLme7iw5A88fAWqEO1M+edvh+xqVTgYVK6jWo2Tp4WJPe+1V5r0pf
	4yM5MEPqHTkcQ7BzuZMaiNA8JW6a+dI0=
X-Received: by 2002:a05:651c:222c:b0:394:942:9bb6 with SMTP id
 38308e7fff4ca-395d8c129fbmr37366311fa.6.1779655576527; Sun, 24 May 2026
 13:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <20260505134812.408316-6-wens@kernel.org>
 <afpUiupOgPhLksM8@shepard>
In-Reply-To: <afpUiupOgPhLksM8@shepard>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 23:46:04 +0300
X-Gmail-Original-Message-ID: <CAGb2v64Ln=2RnOf_WKHJTGphofe-+iUddenu7H4FNFx03tJoOw@mail.gmail.com>
X-Gm-Features: AVHnY4LzB_OhmZqGSHcQSdeKCJP6XONAvy9GHgQqfzYfXCQHIhPSMFyqiHhyTFc
Message-ID: <CAGb2v64Ln=2RnOf_WKHJTGphofe-+iUddenu7H4FNFx03tJoOw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM
 region for video engine
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62692-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paulk.fr:url,mail.gmail.com:mid,sys-base.io:url,sys-base.io:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,1c0e000:email]
X-Rspamd-Queue-Id: 22E555C43A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 5, 2026 at 10:35=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Chen-Yu,
>
> On Tue 05 May 26, 21:48, Chen-Yu Tsai wrote:
> > The SRAM C region contains a partial alias to the VE SRAM already
> > referenced by the video engine. To avoid access through this alias
> > window, the region should also be claimed by the video engine.
> >
> > Add a reference to the SRAM C region to the video engine node.
>
> It feels very weird to have a reference to the DE2 SRAM region in the
> VE node. It seems unlikely that the same region would be used by both DE2=
 and
> VE and I am pretty sure can have both running at the same time without
> overstepping.
>
> From what I can see we have so far assumed that the SRAM C and SRAM C1
> are two different physical SRAM areas, but this is most likely not the ca=
se.
> My guess would be that SRAM C1 is actually a part of SRAM C and the DE2 i=
s

No. It's the opposite. 0x28000 maps to the same SRAM block at 0x1a00000.
If you write to one, you see the results in both. However the alias at
028000 can be disabled while retaining access to 0x1a00000. I don't
remember how much of the alias points to VE SRAM (0x1a00000). Maybe it
was the whole alias on the H6.

Also, I can't remember if this was tested on the H6 or H616, but the
VE indeed writes to VE SRAM (0x1a00000), so that part is indeed used
by the video engine.

> using another part of it. The syscon block probably allows switching acce=
ss
> to these different parts of SRAM C.

From what I've seen in the vendor BSP, both drivers toggle the switch.
I believe the goal is to prevent the CPU from having access, rather than
either peripheral claiming it as its own. And that is also what our SRAM
driver does. It claims the SRAM from the CPU. That's all. The toggle bit
pattern used by both drivers is the same.

> Also the sram_c1 node implies it's 2 MiB, which sounds quite unlikely.

That is what the memory map says. Calling it SRAM C1 is probably wrong.


ChenYu

> All the best,
>
> Paul
>
> >
> > Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node"=
)
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 72ce1a75647b..88c6e3e105c0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -205,7 +205,7 @@ video-codec@1c0e000 {
> >                       clock-names =3D "ahb", "mod", "ram";
> >                       resets =3D <&ccu RST_BUS_VE>;
> >                       interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > -                     allwinner,sram =3D <&ve_sram 1>;
> > +                     allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;
> >                       iommus =3D <&iommu 3>;
> >               };
> >
> > --
> > 2.47.3
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

