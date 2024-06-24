Return-Path: <linux-media+bounces-14028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F9914632
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 682B4B211EE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D47136643;
	Mon, 24 Jun 2024 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fTTnRYee";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KcZWrq+x"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A2135A51;
	Mon, 24 Jun 2024 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719220839; cv=none; b=VGqftYiJeiCyMj1M+NjCZbLxj4PhWnOmxMptXlZiUFRUxNaTVXsOti+T/o7c+FYfKvsZhQ6ZAd7rRB/Q5NKYsiafAWMlOzLEoKfxXak48858KKyFAiOz5fV4d8YlVs+Gx5FVCYkNgl32SqzL7rZ1XcV5KXQmWdXyoFXkru2bvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719220839; c=relaxed/simple;
	bh=sW9SQrbW5JnZk06M/S+/X1T80z64+P3/2u2YWrpgdCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG8gKgbDmufZdfQZx6ptbV8rUCadbNyXWFIV+Skk4UPaxfvJvISlXCQ684gP+BViMcEgX3//EsJM0cpxJDlTWz0IHVJUH95tk46JniSbtrg1HbitYOr8toR/J6lolmq24UorqjniN7eCzaqYBKlWeVPQTOP/J+qOwiUX7HBTloc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fTTnRYee; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KcZWrq+x; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id B76D71C000AF;
	Mon, 24 Jun 2024 05:20:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 24 Jun 2024 05:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719220833;
	 x=1719307233; bh=37OfLm6VCPnaJmLAriLSXlifTiuF5IemwSKkKUym/Yc=; b=
	fTTnRYee86mIIVMb69V9OiiihYcZXxZjHkavUHsk3hC2AaSlOuaBGaN++DDnLZrS
	1SfuJvX0R1w7CpM2AI88qfRZi4+vm+28bjsbqAvaXScOymWyGfiM7YuSK2CYO9KD
	K5LCX23rGhR8IR/iMUpA9UUYKq/zW4IlQ+01DpjkJ6kjvbOocRLgeBnwRIfNQ3ac
	RPmp+xZUOqV+xs3NgnsqwWBibr6EEGLbirXTWZJRTivW2EYzMQ7neV963U0KiVr8
	RMC7CqxQSPCnYx8OlHgCH1zjjBUVmhCQKLgcI51Lg39oz2sbWQC2jBQcTqIqW1HZ
	46Lp23DLDHn7oZxNitZcDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719220833; x=
	1719307233; bh=37OfLm6VCPnaJmLAriLSXlifTiuF5IemwSKkKUym/Yc=; b=K
	cZWrq+x9ukc3Orf64Ssa1ERXAWKD7zTR/NGvO57tL/D0Qg5tk1LXypz/Q24ktwZy
	mWBaeCCYqJavk3P6tD924emUZG0K8gZJwTOLZ1qVmi2gyCKizdfFGVAFJsO8AgF0
	FKtNa7EEjdSVXh8HqyGIt1Ac8wb4UUeB7iVsmG5ihwFNdNpGdjXiSPEAO0VnKahe
	pSnL3x3LLdHlmq0pEZHmPwTZAZBaycnfhScb8JKo9z5bKsqiDC742bpCcUntrYqX
	8SJHOYs+0ULA/XTP27ba8lGsP1KAHLA1QslkN7Zdw8WoLFrC17lgrRQ+KFJHWdzr
	gfdmannJHWTN7ZCGpCeog==
X-ME-Sender: <xms:YTp5ZoUAkSA35KaF1upLfdjVjJ5gOlSydCbhZlIgL1WE_bEMG6BKAg>
    <xme:YTp5ZsnSxjy0bKCDcTphXjfNyJHmAZFX-YKp8cCF3e4_waOn5FX42AIZtxjQkcRoC
    W46yF48PYLKiHlmUdE>
X-ME-Received: <xmr:YTp5ZsattBis6e-8pmpcko0n7KzBF46UFX6AuAEZl1i7rG46UzZ0sc_xaQ15B2Yh9orGJPBpmoGBH5S8EesgIf2YRblevDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeektedvvdev
    jeeijeduffetjeffueeufffffeejfedvffetueevtdfffeetheektdenucffohhmrghinh
    epvghmsggvugguvgguqdhrvggtihhpvghsrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:YTp5ZnVNeQReKgUpoWjV8o_aSbPqkqnAPWUD04ss2z0khs3oIUccXw>
    <xmx:YTp5ZindXP3j54d_Pxo4DwOd8ev2kF0pebTJZf3IYf5LGLT8ZROJlg>
    <xmx:YTp5Zsec7z8FYuyvyooCm3ASFRufMMDcMzXFofvLkHtCJytPRNG1xg>
    <xmx:YTp5ZkEc8gu4ch7b13PrKDcAVUv-rIU1PF2j9erT9ObRcV-jrJ-nZg>
    <xmx:YTp5Zkdv0gOAlfZwvTw0-wAv2kO-i8g4lGw1hEQlETOT-YhIBXHWZyJ8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 05:20:32 -0400 (EDT)
Date: Mon, 24 Jun 2024 11:20:29 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240624092029.GB3655345@ragnatech.se>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se>
 <20240620-gating-coherent-af984389b2d7@spud>
 <20240620172237.GA3623951@ragnatech.se>
 <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>

Hi Conor,

On 2024-06-21 09:21:24 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Jun 20, 2024 at 7:22 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2024-06-20 17:27:00 +0100, Conor Dooley wrote:
> > > > +      - items:
> > > > +          - enum:
> > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> > > >
> > > > If so I can see that working as I could still fix any issues that come
> > > > from differences between V4H and V4M if needed. If so do you think it
> > > > best to add this in two different patches? One to add the
> > > > renesas,rcar-gen4-vin fallback (which will also need DTS updates to fix
> > > > warnings from exciting users of V4H not listing the gen4 fallback) and
> > > > one to add V4M?
> > >
> > >
> > > I would just do:
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > index 5539d0f8e74d..22bbad42fc03 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > @@ -54,6 +54,9 @@ properties:
> > >                - renesas,vin-r8a77995 # R-Car D3
> > >                - renesas,vin-r8a779a0 # R-Car V3U
> > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > +      - items:
> > > +          - const: renesas,vin-r8a779h0 # R-Car V4L2
> > > +          - const: renesas,vin-r8a779g0 # R-Car V4H
> >
> > @Geert: What do you think about this? This would be a first use-case for
> > compatibles crossing SoC DTS files that I know of. I'm a bit uneasy
> > going down this road.
> 
> Me too ;-)
> 
> > Would this not also effect the existing users of renesas,vin-r8a779g0
> > which would now need something similar to what you propose below with a
> > list of SoC compatibles and a fallback.
> >
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > > Which requires no driver or dts changes. That could become:
> > >       - items:
> > >           - enum:
> > >               - renesas,vin-r8a779h0 # R-Car V4L2
> > >               - renesas,vin-r8a779i0 # R-Car R4P17
> > >           - const: renesas,vin-r8a779g0 # R-Car V4H
> >
> > FWIW, on Gen2 where fallback es where useful compared to Gen3 we did
> > this with "renesas,rcar-gen2-vin".
> 
> We do know there are differences (albeit probably small) among the R-Car
> Gen4 VIN implementations, so I am reluctant to add a family-specific
> compatible value.  Typically we only use a family-specific compatible
> value if the IP cores are known (or better, assumed ;-) to be identical.
> 
> And sometimes our assumptions turn out to be wrong...
> See slides 25-33 (last two for the numbers) of my talk at ER2019
> https://embedded-recipes.org/2019/talks/herd-your-socs-become-a-matchmaker/

Do Geert's slides help to explain the R-Car perspective on why a 
family-specific fallback compatible might not be desirable, and why the 
SoC specific one is proposed? 

-- 
Kind Regards,
Niklas Söderlund

