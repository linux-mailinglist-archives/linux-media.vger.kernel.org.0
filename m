Return-Path: <linux-media+bounces-28396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667AA66D5C
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 09:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843F8166D5C
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5BB1EF362;
	Tue, 18 Mar 2025 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K4RI8TwP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="im9xccHR"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52519B3EE;
	Tue, 18 Mar 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742285123; cv=none; b=JVHGXeXfcNNDBk+xwxF+zMRCx9nV0e1pxIe7YzyGauqqpivYyLv+lbRxDYWMkIX1BWB8fn/5ftFXWFl/OkWz1VfvQCrKrMzNQ2D2v7si8ku9X7Hyl7c8TbUrOrf51QIYKD/x2ctuukLauDyPDl/zDSrSD3QqFO1dCdC7S7Lb9OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742285123; c=relaxed/simple;
	bh=fvnWIJcWsLw41BfTujWQ8XdX9pbp0HTXXIgPp6Y+VBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYxV6Qneqqucu9FLISyvIxuHooN01wfzULCTw/bFelAgAn7mdVDAZy55RcEirZB7HEZ7QPM5UZkiScf3xdUHKuhrRBYs96i292zLDycSxCIcOAxcj5KN16791hfJ7t9Qb3iJMckQHpJMS6Y2FeeRG9bn4r0E06V7L2vVESzuOhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K4RI8TwP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=im9xccHR; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AF66B254021E;
	Tue, 18 Mar 2025 04:05:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 18 Mar 2025 04:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742285120;
	 x=1742371520; bh=74g/oB9ioftEhl57dAe019LF5JHKZ33cWPRAt7l/Oz0=; b=
	K4RI8TwPyuJG0jIRfeJ5n/oZuy07YO2hZzkmK3dsYBf7exDkAcd3q0VdN0N7kL38
	UaPcHNuGRcSgiyqamfwSFGbky1lI3ItX3i3vfe9JxehMVnKfb7vb6Xahc3YJF02z
	Qx0TrztzKs7I8rHBBavayHj0AeQ7/9k8uN31sc4Zf7YPvfLdB61so8QUXTmwshNx
	ggSCmdUEf3WkBYKOt7pCBCjLwQqwrWzrguTu6tPPhhEeco4z71woGI03LxOTtSar
	bpMhqVEeF+xf2RAWftYmiqutBaj4ncuEbUO2/BdYIse06GT94jPJMV7sR1C+Fdft
	Aiv0uo4bxjyDnlWaFB9ubQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742285120; x=
	1742371520; bh=74g/oB9ioftEhl57dAe019LF5JHKZ33cWPRAt7l/Oz0=; b=i
	m9xccHRDzebkFGsBuf//soWr+Tt6Fq9Y4FZGhYIhmDYW0wdeOOxbXzTNrezTaOsM
	hZNeu41FALLiChFFpRK3j0arKburSrxwLCwUSUiB3ra5NCtyep86pHO6184mE1YM
	ClMZSwDTTUbK/bmGHdK/8p4UCuqdFq1ojpU6kFTOr3Dw6thrChN8avkcX3Ji40hx
	lrtQvX+1zziQ4rwsa4op3uFHu03LXD1ogd4AOWlps3LQR5Vu51MoSEO9iXGFpt2P
	dZvwdxJWqwoI60DxoWWOEiaKfXH01bHsEigmqkTWKdjV5szHrOUKYgpNgEjm4Nee
	NuGds9VsFCqrYiz1vcd6g==
X-ME-Sender: <xms:PinZZ3ohsL0itU43TisHc-0sd_KOChOv2MlEZD8KysFPWzy70XbY8Q>
    <xme:PinZZxr5f_KrMV5zeCu8Kf_mnoHTfvveFwjwPuWn1vLxeRTQx13NxF_Qg2KumDGuT
    Gb4qL_zuV7TL6puq1I>
X-ME-Received: <xmr:PinZZ0PEomHy_OXS1rsa3gwVOZUb2DBUsJl0ca_LlC_guO09qE6q1ZqSX8vbrODCA56pwRT9WL9BzowOfIKXe7x3uj4ebgFnjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeduleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghs
    sehglhhiuggvrhdrsggvpdhrtghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnh
    hlpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsg
    horghrugdrtghomh
X-ME-Proxy: <xmx:PinZZ64uSRsapBM2598HZk4ThfIbebXaVdOR9dcD-X4dOfkCVnmqeg>
    <xmx:PinZZ274xIbM9ua84JZEFIgFiWNkmjSP9Oi1A20jQleD6sUwd1TSIg>
    <xmx:PinZZyg3X0MeR7-MYWhgjyjCghiZ4rXlPO84_eB-_5S0MEDImqlIaA>
    <xmx:PinZZ479lTZ19lh2XjwwunROyAsblIA7FccJL0nWdos0K1uLqSNEQQ>
    <xmx:QCnZZ5LqWfo5M2a3srrtdM3azsOc3dU51ImpYFRzDWJHp-L0VNPRJUXJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Mar 2025 04:05:18 -0400 (EDT)
Date: Tue, 18 Mar 2025 09:05:17 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <20250318080517.GD949127@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin>
 <20250317114904.GA868399@ragnatech.se>
 <573bb90b-bada-4dde-b88a-f92db1d1a3d1@kernel.org>
 <20250317153406.GB919085@ragnatech.se>
 <4134b49c-f3f2-4b46-bf2c-52986fca265f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4134b49c-f3f2-4b46-bf2c-52986fca265f@kernel.org>

On 2025-03-18 08:27:36 +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 16:34, Niklas Söderlund wrote:
> > SoCs. I know it's confusing and not logical but that's how they are 
> > made.
> > 
> > - One part is the ISP Channel Selector, this is a function that sits on 
> >   the CIS-2 receiver data bus. It is responsible for selecting which 
> >   CSI-2 Virtual Channel is routed to which DMA capture engine.
> > 
> >   This part is what the rcar-isp.ko driver have always supported and 
> >   every instance of the ISP that is described in tree deals with just 
> >   this one function as this is the one we always had documentation for.
> > 
> >   This block is the one the reg-names and clock-names labels "cs".
> > 
> > - One part that we now wish to add is the ISP Core. This is a 
> >   traditional ISP that act on image data in different ways. This is what 
> >   I try to model with the reg-name and clock-name labeled "core".
> > 
> >   This is new and we have not had documentation for this until recently.  
> >   Unfortunately the "core" and "cs" functions is implemented in the same 
> >   IP block. And to operate the "core" one needs to also deal with "cs".  
> > 
> > To make it more interesting all ISP Channel Selectors (cs) do not have a 
> > companion ISP Core, but most do. The lack of a ISP core is OK, it just 
> > means that video capture path can't manipulate the image as much as 
> > paths that do.
> > 
> > It's not ideal but to support the ISP Core and ISP Channel Selecotr the 
> > rcar-isp.ko module needs both "core" and "cs" clocks and regs. And to 
> > support just the Channel Selector it only needs the "cs" resources.
> > 
> > 
> > Sorry if I have been confusing. A good example of this is patch 4/7 in 
> > this series. It shows the V4M board that have 2 ISP instances, one that 
> > have both cs and core functions, and one that only have cs function.
> 
> Based on this I think the instances with ISP core are not the same
> hardware as instances without. You have there different (new)
> programming model for entirely new part of hardware not present in "old"
> instances.
> 
> Different device means different compatible.
> 
> And judging by the address:
> reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> 1. 0xfec0 < 0xfed0
> 2. Huge address range
> 
> that's not "renesas,r8a779h0-isp" at all, but your old "ISP" device is
> actually a part of that 0xfec0_0000.
> 
> Probably the channel selector should have never been called "ISP"
> because it does not process images. :/

There are always room for improvement, but we can only try and create 
bindings that describe the hardware as it is documented.

In the block diagrams the channel selector and the core isp are in the 
same block.  And for better or worse to operate the ISP to process 
images the driver need to poke at the channel selector, even tho I fail 
to see why some of the core registers where put in the cs block.

On Gen3 an equally interesting hardware design can be found, the CSI-2 
channel selector was there placed together with the IP block for image 
capture DMA engines... Luckily that only created a mess in the driver 
and not in the bindings.

Thanks again for your feedback, I really learn a lot!

> 
> > 
> >>
> >> What is this ISP core responsible for inside Renesas ISP? How many ISPs
> >> are inside of SoC?
> > 
> > The ISP core is responsible for image manipulation. ISP Channel Selector 
> > for CSI-2 channel routing. The number of ISP varies between SoCs:
> > 
> > 
> > V3U: Have 4 ISP instances, all 4 have cs and core.
> > V4H: Have 2 ISP instances, both have cs and core.
> > V4M: Have 2 ISP instances, one have cs and core, one have only cs.
> 
> 
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

