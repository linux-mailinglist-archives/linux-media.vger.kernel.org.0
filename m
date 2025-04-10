Return-Path: <linux-media+bounces-29968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F17A84A42
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AC5D1890431
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEEE1DFE0A;
	Thu, 10 Apr 2025 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Fmf//sE3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oU8ToU5e"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B61DF73A;
	Thu, 10 Apr 2025 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303267; cv=none; b=MR9clVc7Ag/0QHTuyqCWqRjwl495fMSN2jjjaLmmzWZFqf4daAPda5cVRNoXApP+Ded7vTPsIVQEDdSEOuYqcRpvYcHQbBfotMVn2XpXCewFRbpvp9kRdmVoFp7fMQk164AHinYuvwC4XzsS4JcRL56IFaNAppnWlsCHbzETHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303267; c=relaxed/simple;
	bh=KKUAC0r/gPym5dtn4mAKTqqf3QcWgBmB3QKesCnSCbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGFQFYAlzUfeCsTSEA/lhiVkKd682qsMSaDzCzvBJixDgoxj/jarhvPaH48s4ihfFEGWULGe52mIuuqEZojMIS0ge2BsWYxjCLeAU31u80p1J3oKufw/oc0Wsqk1y7cTR5vWTrWqjftpIXkUVIYh8qbdUIhKC9TVGwzr6C/P6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Fmf//sE3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oU8ToU5e; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7BACD25401AC;
	Thu, 10 Apr 2025 12:41:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 10 Apr 2025 12:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744303260;
	 x=1744389660; bh=rt65cHcbQzrTXnga1fM9WZtMZgWbrqK/Rj8B1eto+UI=; b=
	Fmf//sE3eaNOwNXM5xFa7zaLDP9XDqJh026B86rVjyigGXg1OuTFXP5GjIOpBc/m
	A1cdOHoK+Uc1tbd/FhI76M1LIvFxnK7v1AnFfZ9DzjeXEB0ChgFC6xy20hUgzb97
	L8aVr+CmZlpMmC6TmkwTXz98P7FozIp4w3+k7NdPcDYoXMXQjEBlIPcwlP148Hwa
	1XLidcGT/qu2jenBoyEAKmN2XH5vDp3k8jMksNsx5rVw69SDPbogHLeCji0OVMfb
	Z28wQ4IIWclCgXo7HnA9b1PE61Y1u6PKVZ5owW/xC6LQCTGrW+1yEha2Zo5PJoff
	Vzv8TlMDpOOArLwx+cZwaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744303260; x=
	1744389660; bh=rt65cHcbQzrTXnga1fM9WZtMZgWbrqK/Rj8B1eto+UI=; b=o
	U8ToU5excXz1DZzKUYzQ71PdbqhCXnUxK+GK90hqf5T1HldT27ogbKDscPAbsfaQ
	IHCQpArcUSfNspXWQ7EsRN7JFm94K0mAV1TxxxEsyWO7ZkMMMxorldv0S97mrRBX
	wU2wigc8Sos1pm/8au5A6vwm3aJ2f9ABUQc2+KOM8v4Yp2T6UyiiHOibj4amoE6v
	5Mnsd/2AYV+/fd2Vg6X7vmwDNWKG8ad6cx4XvgNIcvhm1+JDp1+pYqG4/EBh+4Ki
	7bScMtKuuRfZdoACOlKKRxGMdBjuWcdlgS+kC5zfcvaL/1iAS7N7rw3tZjmR+BK0
	7tSgDimQ+Xbgqbw8UmIQA==
X-ME-Sender: <xms:m_T3Z1vb2CkjfEC-rDZeZQuOuIVvLyIsTPCkMQOpjFoy6On_2Z0dwQ>
    <xme:m_T3Z-dDQxAGlrEmETV8KR6ZPnb5Sqi64LxSU-RgmorMmF5PbN6jBiaiqZUobvc-m
    2fEn687buNjRRrNCfA>
X-ME-Received: <xmr:m_T3Z4zL-T3cN7bq2tTc0Un2JKCeD9Gbni6tm7sd8bq_2zN22hSdQ5rvkS0z5dvgMV5Xaw_hJxkfOZeqhUR3iXztqzgV4YrOVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhl
    seigshegrghllhdrnhhlpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonh
    guihesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:m_T3Z8PeLiJ7va-vUuzCs0DcZTO8361aeHr3E41hxR68yt5DZFs88Q>
    <xmx:m_T3Z1_PH1yVKCGL5-EEit_jPgZ1f5p2vEHbtstu3IyDa3rts5TA_w>
    <xmx:m_T3Z8VBVdxQz-pACNTISn7XSuztyoeXBE9ddMsuuxmbgTbUzBQiVA>
    <xmx:m_T3Z2eQnVMQV7TamNH793lJwBUB9MKG7YdQSFMWLkVlEJrBXndy9Q>
    <xmx:nPT3Z0qTpsnp8-zsGQQATIRTl6tyxrYl0Ch_BRNZsCDZi8NzUuv82llN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 12:40:59 -0400 (EDT)
Date: Thu, 10 Apr 2025 18:40:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function
 block
Message-ID: <20250410164057.GB3736289@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXsU7uJVTM=U66pSO+wWLQWXkjxyvu572D+gSd6cyd2eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXsU7uJVTM=U66pSO+wWLQWXkjxyvu572D+gSd6cyd2eg@mail.gmail.com>

Hi Geert,

Thanks for your feedback.

On 2025-04-10 17:54:25 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, 15 Mar 2025 at 16:28, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > All ISP instances on V3U have both a channel select and core function
> > block, describe the core region in addition to the existing cs region.
> >
> > The interrupt number already described intended to reflect the cs
> > function but did incorrectly describe the core block. This was not
> > noticed until now as the driver do not make use of the interrupt for the
> > cs block.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -2588,13 +2588,20 @@ du_out_dsi1: endpoint {
> >                 isp0: isp@fed00000 {
> >                         compatible = "renesas,r8a779a0-isp",
> >                                      "renesas,rcar-gen4-isp";
> > -                       reg = <0 0xfed00000 0 0x10000>;
> > -                       interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > -                       clocks = <&cpg CPG_MOD 612>;
> > +                       reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> > +                       reg-names = "cs", "core";
> > +                       interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> 
> So we used to describe the "wrong" interrupt before, but it didn't hurt,
> as the driver doesn't use it anyway?

Correct.

> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Queuing in renesas-devel is postponed, pending acceptance of the DT
> binding changes.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

