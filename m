Return-Path: <linux-media+bounces-28369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B6A655CF
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 16:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FFB116B624
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231602475C3;
	Mon, 17 Mar 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UZS9BoPW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xu5dSa01"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6C155A4D;
	Mon, 17 Mar 2025 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225653; cv=none; b=FIxNfcKTApHnvf6RFQ9yrQloSJToUzk2DbOY+uSylWh6lIbxN4+lnmsdrnonpUWy3to/xnsa6YPAoxuubPVBGz4iAmTn1z0hBvNmegCiDYn0oEH253kKnkP9xsMPCyGx6DCBMleExYwxsyAl8BAEHo+cRpIP4r5Jv38JMKDV4hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225653; c=relaxed/simple;
	bh=fRZwhrJ2pgBmVwr6Mo9Sg4wK++x6a5qVhMl8r+dyf3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMk8tYZL4p4zDc8Cl8sXtHifDNOuHHGXQYxlOThlMqtMXfwOhJGaG+50HOZee+f7wGs1fk+uopX7ZNtpjRAsyue23/QKD0FKl9ZCzH/o8qp6OO0Gn1OJrNlXkeedCKE/w9BlFp2Yr+oJqifmIll7ywePTdaIdC3Xw+VNaC+O9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UZS9BoPW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xu5dSa01; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2B1372540185;
	Mon, 17 Mar 2025 11:34:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-13.internal (MEProxy); Mon, 17 Mar 2025 11:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742225650;
	 x=1742312050; bh=d3MdEOp885vWWG3VIVdeEouBeT28sMeSfk0so6WLe34=; b=
	UZS9BoPWB6ko4zqwQIMEBruaoU7AwlLqUOcAvjEusnhTY2bEP+HVAGV/Eay2CpfL
	Z4M6/Rk4JgY0zlnmGGMejJI9lCfavFy4B3/5vx9RtyqeC1lSrOXJxQrUFqgSSnjW
	QaD/lIAYDbhgvZlsBeoveYqCJaRrWZegKtwjiuSlS/dIgeC0Z67nf4qkkGZDt652
	qSvel+7bJQ6MNLy9xMnMnwhh6QOabGtwfkIWACto22F+ecn21evt+XoncjIKc4/B
	HV7NhSoV+OrbF9nUkFRAaHXdtPSo7g48Fdle7t296JRaIeBTEfVonQ7G3WBlLbZv
	VNL51wbT45U31BJHJTrREA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742225650; x=
	1742312050; bh=d3MdEOp885vWWG3VIVdeEouBeT28sMeSfk0so6WLe34=; b=x
	u5dSa01p6DENAQ4IpfIxuZXMJYehTHAV4t9xGoS18Hvgsdmzf6JHiAiEAO0UKAZN
	+W+x2ogdNzeXuQL+Cfc5UOsYD3CF/DHexTvddDDW8c1KxT+yHPrx5o5byN7GPUCZ
	4ntfV9efhH3z4+Ld7SfiKvecpRz4NAK4Y9bovqc4o7vsUCry1qRPSFwaxLSq6zfg
	NgMiqB7EdcVIbYHhoPwGgzSLsSLozsm8KdTDpkQcVvyh2/s1kPRPxZVMJIv+wpwj
	8fapWPp04vqcv1zRzIfv3ft0pdTOhLlXp/+/knfKISO84SjY6haqoLbqOvOYAUsn
	J5btii39u88anNnR5ABBQ==
X-ME-Sender: <xms:8UDYZ9dtcr7SFs0mN1DUw3-QaV9r8jKkFysLViBV5C98WBx08dNpBg>
    <xme:8UDYZ7MKkuHlaheciLQcyA3B4eEZJprVdowPZQH27_4vTsMIIsNG5g8V6ZuIhPQxH
    wUPbdH5cGWxE61vuGA>
X-ME-Received: <xmr:8UDYZ2i4L09IDzh4CuxT5uOi2pFofxnsCK7H_uyaD1iejNawNWgfRFSHg_hSl34cbWT7qHXUuzFBKy7ijZ6OQKKBBgr6elNdhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:8UDYZ29gwgvfYkd6AyEtK6OVrNzu7GyAt2ppOz64wu-VJ6siFnpOzA>
    <xmx:8UDYZ5uN_ghoSDm4_wflCmxs_J1S8a_2cIj0kzUf96X75517XvIUDw>
    <xmx:8UDYZ1EpZv2yUJNO-DdaitjNxwZ4nwqrKsaiUMrXx15zMHoKS3A8_Q>
    <xmx:8UDYZwPv53R7RlIcLsfGAS4aVDk2QEvdVi-x9DxlAOI0imh5lLrKkQ>
    <xmx:8kDYZ6OtUahSFic_XVCS1aEVQeomVnzeW7i7srqQNj32vZxLXPDfMxXy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 11:34:08 -0400 (EDT)
Date: Mon, 17 Mar 2025 16:34:06 +0100
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
Message-ID: <20250317153406.GB919085@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin>
 <20250317114904.GA868399@ragnatech.se>
 <573bb90b-bada-4dde-b88a-f92db1d1a3d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <573bb90b-bada-4dde-b88a-f92db1d1a3d1@kernel.org>

On 2025-03-17 16:02:34 +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 12:49, Niklas Söderlund wrote:
> > Hi Krzysztof,
> > 
> > Thanks for your feedback.
> > 
> > On 2025-03-17 12:31:51 +0100, Krzysztof Kozlowski wrote:
> >> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas Söderlund wrote:
> >>> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>> index c4de4555b753..de9bc739e084 100644
> >>> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>> @@ -25,19 +25,54 @@ properties:
> >>>            - renesas,r8a779h0-isp # V4M
> >>>        - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> >>>    reg:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  reg-names:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - const: cs
> >>> +      - const: core
> >>
> >> All of this and further must be restricted per compatible. Otherwise
> >> commit msg should explain why one SoC can have it different on different
> >> boards.
> > 
> > I will expand the commit message. In short this can't be restricted per 
> > compatible, different instances of the IP on the same board can and can 
> > not have a core part.
> 
> s/Same board/same SoC/? Or you really meant that same SoC on different
> boards will have or have not that ISP core?
> 
> Both are odd, first even weirder.
> 
> I wonder if some other difference is not the documented. E.g. same IP
> blocks are not exactly the same, but have different programming model.

The IP block named "ISP" is in fact two different things on R-Car Gen4 
SoCs. I know it's confusing and not logical but that's how they are 
made.

- One part is the ISP Channel Selector, this is a function that sits on 
  the CIS-2 receiver data bus. It is responsible for selecting which 
  CSI-2 Virtual Channel is routed to which DMA capture engine.

  This part is what the rcar-isp.ko driver have always supported and 
  every instance of the ISP that is described in tree deals with just 
  this one function as this is the one we always had documentation for.

  This block is the one the reg-names and clock-names labels "cs".

- One part that we now wish to add is the ISP Core. This is a 
  traditional ISP that act on image data in different ways. This is what 
  I try to model with the reg-name and clock-name labeled "core".

  This is new and we have not had documentation for this until recently.  
  Unfortunately the "core" and "cs" functions is implemented in the same 
  IP block. And to operate the "core" one needs to also deal with "cs".  

To make it more interesting all ISP Channel Selectors (cs) do not have a 
companion ISP Core, but most do. The lack of a ISP core is OK, it just 
means that video capture path can't manipulate the image as much as 
paths that do.

It's not ideal but to support the ISP Core and ISP Channel Selecotr the 
rcar-isp.ko module needs both "core" and "cs" clocks and regs. And to 
support just the Channel Selector it only needs the "cs" resources.


Sorry if I have been confusing. A good example of this is patch 4/7 in 
this series. It shows the V4M board that have 2 ISP instances, one that 
have both cs and core functions, and one that only have cs function.

> 
> What is this ISP core responsible for inside Renesas ISP? How many ISPs
> are inside of SoC?

The ISP core is responsible for image manipulation. ISP Channel Selector 
for CSI-2 channel routing. The number of ISP varies between SoCs:


V3U: Have 4 ISP instances, all 4 have cs and core.
V4H: Have 2 ISP instances, both have cs and core.
V4M: Have 2 ISP instances, one have cs and core, one have only cs.

> 
> And how would it work? You have two exactly the same IP blocks in the
> SoC, but one you program differently than other. How do you know which one?

All cs blocks are the same on all SoCs. The core block is the same on 
V4H and V4M, and different on V3U.

> 
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

