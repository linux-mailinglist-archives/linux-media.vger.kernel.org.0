Return-Path: <linux-media+bounces-28352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF6A64D31
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248E71744AE
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E100238174;
	Mon, 17 Mar 2025 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dtiiGWTG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EacIow/u"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55BF221562;
	Mon, 17 Mar 2025 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212153; cv=none; b=P79lNsDkaa2cwSxyDQGBMCTAXlmsLbQkS9uJ//wTGGv12qRxbZQ7A0tnI8kBz97Db/71rjJ3OnVDgTHT9MjudQYJHNRB37cejEOli66SWNHfXS/gPGw0bQlFxyxqVKnQyijY8zkerJmQVTFWd+1sZaDGiVOrFkL8X3kr2rtFS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212153; c=relaxed/simple;
	bh=daOgWK8wDRwH3lBL3pTF/r3MaVw5aDXzS5YA3UJ2KRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9X4V6V4nH9DUNNYcs2NNQPgcaBqay4ve3vCeMHZbeg0Hex3a4MpHwHw+vaopZRdZpKFBjhGgkU01vI4HoIMRd5RKAeHNOHbU2vIVSUviJ/7V3NkrOm+eGJeqjoVTYoXmsKD0vlC4Ci605Hwqjwdb/nKszse0ql0BHG7rF8UAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dtiiGWTG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EacIow/u; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 8B211114016C;
	Mon, 17 Mar 2025 07:49:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 17 Mar 2025 07:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742212149;
	 x=1742298549; bh=HkZ/fBxvV+CGWA4EN4OGXn35SYeFMmJN8n/czDP5ypk=; b=
	dtiiGWTGKX22tZIGYxL7fanv+u7BEJUNDxP/TQt530IiRU4N81ENkbLdStU89eN3
	XxMVpvy7a8XeAPP9Ixn6eVhGOADT6Z9F2TKLIbkrFjhYpfZetQ4idVBuUk+/VAoL
	VEDofOo4wcyUHh58lZHb6Q8PuRilDeVO8dVhrF4c/kc+GwVc3azg3XQMeBq7h+UQ
	g6xkv3icyCbjHE1VufiGahYhHxsE5Z1V1scDlbPxv+fT29WhIIRzIT5spMa99Y2F
	8RvO5FdPS8qpEqfcodOMUs1P9XAWll308feXPUGZF7jUTt3mreLwFGWR7KM72iul
	yM+rfAwo0G4fagxJIeVhdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742212149; x=
	1742298549; bh=HkZ/fBxvV+CGWA4EN4OGXn35SYeFMmJN8n/czDP5ypk=; b=E
	acIow/u0WlObnU6qhss03xMvth8PnB/dAgBQunFOVRp+CXeyt898G+Z5hU2lcxy+
	g20fkz6U+emMWIo19FEjRFpnoCxVheGvXOK2oTBe46xalrSzRmvUNNxVTO7SUo//
	Dun2ZWOwAL9GR/rUPNWZRsMMCUUa6ge51fLQTexQm+4buQwHfyAPwEeI+vcN+Ej7
	QoAbwNiTOYSNVkxKnRPpuLxFvCUlAEqiwczIpVtfBL+3e2hEyPCI3lhk5M0IUtfy
	rnS6aujTk7/KlRx9ld7iE9KY931/MpAw7VMzbKKUy8Dw/fncMiIRRNuhFIHTQu98
	ULwdIJL5TFoCtTS7SKKwQ==
X-ME-Sender: <xms:NAzYZ7UqTzWcHyaSNQNuS2bRsFgoYymven7Mswi4K33SyOn609ax0w>
    <xme:NAzYZznp5W8EFiU7yjrEhq7SaQqhhX95UPZqLGcu9JEooAReBoP6ZFRL-5VPbEKNm
    iczwoUFLviFQd2tyKU>
X-ME-Received: <xmr:NAzYZ3bbWZoY82npEIELXMfhhzP2VgCtW1rq8pIVe8pGR3DVjAWkmUwOo2iAlZqPoUs-Z1wu_vZcmBFgwqzBqTZBGBKt5XV_qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelgeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NAzYZ2XhGV22PegUNmQOzhWClFph7ybaY-TgiAK6Pt9cNK3bhBeHBA>
    <xmx:NAzYZ1l65X-Q5cwwL8wlhX7cyGR2e7O_YxR4lCIqa9zh7YnNBxVyGA>
    <xmx:NAzYZzeqkxn8pxqSMWJ0ZotJCY6wY1PmsfaGoFbLCvJuEyAiikVYLQ>
    <xmx:NAzYZ_F0Hp5ubg0xlhxWt1DuUQUkXK-KDpN9ymr5gKQndkDX0mjlsA>
    <xmx:NQzYZ3nJpx2Tfkgz8NngpIClyLSUvCbch0uv-ZWBPPmksvH5xEiU69YT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 07:49:07 -0400 (EDT)
Date: Mon, 17 Mar 2025 12:49:04 +0100
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
Message-ID: <20250317114904.GA868399@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin>

Hi Krzysztof,

Thanks for your feedback.

On 2025-03-17 12:31:51 +0100, Krzysztof Kozlowski wrote:
> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas Söderlund wrote:
> > diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > index c4de4555b753..de9bc739e084 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > @@ -25,19 +25,54 @@ properties:
> >            - renesas,r8a779h0-isp # V4M
> >        - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: cs
> > +      - const: core
> 
> All of this and further must be restricted per compatible. Otherwise
> commit msg should explain why one SoC can have it different on different
> boards.

I will expand the commit message. In short this can't be restricted per 
compatible, different instances of the IP on the same board can and can 
not have a core part.

> 
> >  
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - const: cs
> > +      - const: core
> >  
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: cs
> > +      - const: core
> >  
> >    power-domains:
> >      maxItems: 1
> >  
> >    resets:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    items:
> > +      - const: cs
> > +      - const: core
> > +
> > +  renesas,vspx:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to the companion VSPX responsible for the Streaming Bridge
> 
> But what does this device needs it for?

It's the external IP that controls the DMA of data to the ISP. I will 
expand this description.

> 
> > +      functionality. This property is not mandatory and not all ISP devices
> > +      have one attached.
> 
> Drop last sentence, redundant. Instead disallow it (renesas,vspx: false)
> for all the variants not having VSPX.

I can't do that as all variants can possibly have one attached to it.  
All instances of the ISP that have a core part have a VSPX. And on the 
same SoC different instances of the IP can have and can not have a core 
part.

> 
> >  
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> > @@ -103,10 +138,14 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - reg-names
> >    - interrupts
> > +  - interrupt-names
> >    - clocks
> > +  - clock-names
> >    - power-domains
> >    - resets
> > +  - reset-names
> >    - ports
> >  
> >  additionalProperties: false
> > @@ -119,11 +158,16 @@ examples:
> >  
> >      isp1: isp@fed20000 {
> >              compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
> > -            reg = <0xfed20000 0x10000>;
> > -            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > +            reg = <0xfed20000 0x10000>, <0xfee00000 0x10000>;
> > +            reg-names = "cs", "core";
> > +            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "cs", "core";
> >              clocks = <&cpg CPG_MOD 613>;
> > +            clock-names = "cs";
> 
> Why no core? The names feel inconsistent. If your block has "core" reg
> for the "ISP core" sublock, why there is no "ISP core" clock for that
> subblock?

Indeed this is wrong, there should be a core clock added here too, 
thanks for catching this.

> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Niklas Söderlund

