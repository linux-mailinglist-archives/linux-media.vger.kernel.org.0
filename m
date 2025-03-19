Return-Path: <linux-media+bounces-28500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA8A69315
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19624261D3
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD141CCB4B;
	Wed, 19 Mar 2025 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="zD6wC2KV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="62ykFpYV"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2681A4F0A;
	Wed, 19 Mar 2025 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396873; cv=none; b=NPIydzgnGdhxeWA59NoYY2ATHA3QDmU1Fgx8Qv5dS0u5J49mgRh/TobdIVidpvnGuegI/bMNu9Su//ypGVV3jKQ/ElKpRn2kCwstcIC12hQV4xXa+M16nZ16EFEEZvx24MeeY9ilX/MO0iC15RP8UbC1x9PE70uyzcHkWoAiRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396873; c=relaxed/simple;
	bh=sejEb1ymOKn3UQElCjIArq21+MBAEBSD579oJKzYKho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwaZ3aRDY8DN+fEpqQGuOM53uSI/QrilSzFHXag7pm997Y0tgSX/4obuXsIyd1PR9PLWZSennQImn0tB9p9BSCj5qNtVuO8szf9EKbnycBSZ7VEacvaFrR9k024BCNi1Um+5VMDQ3ZHJ6b0h/IpApLmCBltnAalhGkP4qHZMGlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=zD6wC2KV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=62ykFpYV; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 21D282540223;
	Wed, 19 Mar 2025 11:07:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 11:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742396868;
	 x=1742483268; bh=OFem1S2fafkmevswHgaSAN0Iz2pEzjs7TuHY9LHZw5Q=; b=
	zD6wC2KV8TSFpqbT44GVB9ElGOLEfTTsJgshQqDZiMNJO4QWTyz2QS/bfvYHvYKS
	pjNxOi0YEbfruG5wtFD7einhZUEecnCpUmjwD44a+m7Ta/SJugqZg4IWQ6MvjgfZ
	mOB3bUhx2cV/djddb+mDf4m9UIyCG6qvD6zwYCsOAKxCimY2EeW/yTCgzUMaGm6z
	ueiLNkq/cf3li/99NRY8eRKtQ52bzqWBGe8OXlLcfWkXasNkzbWurYk6kVTPdDEl
	5RrO4eByXyf2H2i6S3qqSdkDfPBwNGVRfpoS2LzfkfByYUHJWVaRg3EBIXOrd1QN
	/kZnRBUlT/xIdKnWVDKfuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742396868; x=
	1742483268; bh=OFem1S2fafkmevswHgaSAN0Iz2pEzjs7TuHY9LHZw5Q=; b=6
	2ykFpYVcX8ZFqW4oIfGr7ssj/inEV0EhQnXYIxdR0xVn+nV1aktstIMO5O6tlfs8
	eu2z+l2LFLg/HRz3BO5/+daNTy0sGOUfD2GGqdwQe7JCsyuSzqqRlcXKUoQH5W4+
	7PkvdEcxXoeimOKC6+vnnIsvEjGxvkxRCZrrVLuti3iNs9ZcYA+UhLQz4dF99X/Q
	iDhsit1L89YKEhTPeWWDonxZNgZlE7sgW6XDHb79/k6Pi2AT4foVkv3heDgXaC6C
	YHl/7TpZGZilIfNliZQ4djQWPolIkJe/mmTB9QC+7C7AL3xyUbNVdMxmr1jcR1tw
	55fCwtWmSgrg7li1v9Fhw==
X-ME-Sender: <xms:xN3aZ__-a14j6IN40xJ7fVRkv83HnHsPBn9mk2yw_X4O2xqLbL4pMA>
    <xme:xN3aZ7vIHrhJzNIMip842O6B_BjrpVjA1JMjHhF2Egr67Kh7E6RE0MF4J1KDIuKkY
    h-fPyYx1dsHbSt31Rg>
X-ME-Received: <xmr:xN3aZ9DRNzsKwGAan7NFWeuX2fSit_gaWx8lAFW3H18YEowoK0TWCDOgPc3czgj3UIy2AIw0JkEnoo3WJzpxIJ_fm5vptXwehA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtph
    htthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohephhhvvg
    hrkhhuihhlseigshegrghllhdrnhhlpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinh
    gthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:xN3aZ7eh6G1yQDeGzNlSiIIhvF9U8MDb1oPQ93FrNnukgM5jJblygw>
    <xmx:xN3aZ0MJT9BwEoF3qdxM6sSfzZF_CPN4bYDhzA-yIeB-m2JuWqU5Yw>
    <xmx:xN3aZ9m_o9g8BAEiGGL8iLhUVlR78Mkc5szdQH5aHojb48C9H-GsBQ>
    <xmx:xN3aZ-s2v9iVSfdtUX4NlNAcMBlU6kigYBiDWZzNzPksqhRYk4zEJg>
    <xmx:xN3aZwnIIjAR3sUUPKNnvhEzzDamgpf91ZXP-sRK4APztvG386Wm9czg>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Mar 2025 11:07:47 -0400 (EDT)
Date: Wed, 19 Mar 2025 16:07:45 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function
 block
Message-ID: <20250319150745.GE949127@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
 <hwj6d3ll75magopi5oak4zmboy5dol3ztv3isd6wvrxmvbkx4b@ayjumbqmuk3l>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hwj6d3ll75magopi5oak4zmboy5dol3ztv3isd6wvrxmvbkx4b@ayjumbqmuk3l>

Hi Jacopo,

Thanks for your feedback.

On 2025-03-19 15:50:00 +0100, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Sat, Mar 15, 2025 at 04:27:03PM +0100, Niklas Söderlund wrote:
> > All ISP instances on V3U have both a channel select and core function
> > block, describe the core region in addition to the existing cs region.
> >
> > The interrupt number already described intended to reflect the cs
> > function but did incorrectly describe the core block. This was not
> 
> I can't find the interrupt mapping table for V3U, so this is the only
> thing I can't check

Page number 820, or search for "SPI 152" (fist one).

> 
> > noticed until now as the driver do not make use of the interrupt for the
> > cs block.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> The rest looks good
> 
> > ---
> >  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 60 +++++++++++++++++------
> >  1 file changed, 44 insertions(+), 16 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > index f1613bfd1632..95ff69339991 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -2588,13 +2588,20 @@ du_out_dsi1: endpoint {
> >  		isp0: isp@fed00000 {
> >  			compatible = "renesas,r8a779a0-isp",
> >  				     "renesas,rcar-gen4-isp";
> > -			reg = <0 0xfed00000 0 0x10000>;
> > -			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks = <&cpg CPG_MOD 612>;
> > +			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> > +			reg-names = "cs", "core";
> 
> However, won't the presence of a "core" part trigger the probing of
> the forthcoming RPP core support, which should not support V3U as far
> I understood ?


Correct the RPPX1 library will be given the change to probe on V3U, it 
will detect it's not an RPPX1 gracefully not create an ISPCORE on V3U.  
This describes the hardware, and there is an ISP core mapped at this 
address, not just the same as on the others ;-) The driver is prepared 
for this.

> 
> > +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "cs", "core";
> > +			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
> > +			clock-names = "cs", "core";
> >  			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> > -			resets = <&cpg 612>;
> > +			resets = <&cpg 612>, <&cpg 16>;
> > +			reset-names = "cs", "core";
> >  			status = "disabled";
> >
> > +			renesas,vspx = <&vspx0>;
> > +
> >  			ports {
> >  				#address-cells = <1>;
> >  				#size-cells = <0>;
> > @@ -2672,13 +2679,20 @@ isp0vin07: endpoint {
> >  		isp1: isp@fed20000 {
> >  			compatible = "renesas,r8a779a0-isp",
> >  				     "renesas,rcar-gen4-isp";
> > -			reg = <0 0xfed20000 0 0x10000>;
> > -			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks = <&cpg CPG_MOD 613>;
> > +			reg = <0 0xfed20000 0 0x10000>, <0 0xfee00000 0 0x100000>;
> > +			reg-names = "cs", "core";
> > +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "cs", "core";
> > +			clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> > +			clock-names = "cs", "core";
> >  			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> > -			resets = <&cpg 613>;
> > +			resets = <&cpg 613>, <&cpg 17>;
> > +			reset-names = "cs", "core";
> >  			status = "disabled";
> >
> > +			renesas,vspx = <&vspx1>;
> > +
> >  			ports {
> >  				#address-cells = <1>;
> >  				#size-cells = <0>;
> > @@ -2756,13 +2770,20 @@ isp1vin15: endpoint {
> >  		isp2: isp@fed30000 {
> >  			compatible = "renesas,r8a779a0-isp",
> >  				     "renesas,rcar-gen4-isp";
> > -			reg = <0 0xfed30000 0 0x10000>;
> > -			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks = <&cpg CPG_MOD 614>;
> > +			reg = <0 0xfed30000 0 0x10000>, <0 0xfef00000 0 0x100000>;
> > +			reg-names = "cs", "core";
> > +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "cs", "core";
> > +			clocks = <&cpg CPG_MOD 614>, <&cpg CPG_MOD 18>;
> > +			clock-names = "cs", "core";
> >  			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
> > -			resets = <&cpg 614>;
> > +			resets = <&cpg 614>, <&cpg 18>;
> > +			reset-names = "cs", "core";
> >  			status = "disabled";
> >
> > +			renesas,vspx = <&vspx2>;
> > +
> >  			ports {
> >  				#address-cells = <1>;
> >  				#size-cells = <0>;
> > @@ -2840,13 +2861,20 @@ isp2vin23: endpoint {
> >  		isp3: isp@fed40000 {
> >  			compatible = "renesas,r8a779a0-isp",
> >  				     "renesas,rcar-gen4-isp";
> > -			reg = <0 0xfed40000 0 0x10000>;
> > -			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks = <&cpg CPG_MOD 615>;
> > +			reg = <0 0xfed40000 0 0x10000>, <0 0xfe400000 0 0x100000>;
> > +			reg-names = "cs", "core";
> > +			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "cs", "core";
> > +			clocks = <&cpg CPG_MOD 615>, <&cpg CPG_MOD 19>;
> > +			clock-names = "cs", "core";
> >  			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
> > -			resets = <&cpg 615>;
> > +			resets = <&cpg 615>, <&cpg 19>;
> > +			reset-names = "cs", "core";
> >  			status = "disabled";
> >
> > +			renesas,vspx = <&vspx3>;
> > +
> >  			ports {
> >  				#address-cells = <1>;
> >  				#size-cells = <0>;
> > --
> > 2.48.1
> >

-- 
Kind Regards,
Niklas Söderlund

