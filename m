Return-Path: <linux-media+bounces-12506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FE8FAE9A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 11:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E910B23906
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 09:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E57F143879;
	Tue,  4 Jun 2024 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OmdB2KY5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OUbuC0Fn"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD241411F2;
	Tue,  4 Jun 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492753; cv=none; b=gN+a/ScJnMrJQ3R+hpUgsyH1UgrWV8wR8i/PzXdQQSRlCrrHPGrNd5aERwTbeTcNlVYy605jbiWHU4GyeLJ0ZfT7BPgnqzRaAKfWAlgtZr7RNtydxLawoTeSN6dnWA/NOEkttNBdYsMIqt2ZPIWgEXG3j3kiBFubEn0aI3xMSLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492753; c=relaxed/simple;
	bh=1dtSDC6IVRyLJXaLa0p1D17Sv3InX1VPmrBpgtN1a5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSegD0LncPhYwWpQIpdUp4SezoAbuuzPO07q0QU2HWu2bbZUNr1DxPj0zozyS3t7bstldEXBHaOIxwgUoR7/LBEpomqdnHp4MrbLRpS9c/R9YNT1yyqxHAliYpyOGXCSMnaxz/DMw1uTp4Qpr+INO+SRk9iS68Jn5kI6Ep5Iko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OmdB2KY5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OUbuC0Fn; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 932911380130;
	Tue,  4 Jun 2024 05:19:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 04 Jun 2024 05:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1717492748;
	 x=1717579148; bh=yzBOJSCnFXilIXLVMSmUj0oGiiczp/E3l4ZVzl2SFRU=; b=
	OmdB2KY5l0PMb5CrgmWIYaIsOCciPmZ4DZzY142x4S33JUIMUohqvKCtmXr+fs8G
	qy6GlYGRgbGcozl0PnDFyPdWwW36z+USHwq4eDi+yluz7rA+AZRkXN6Qx/WCMj95
	yFUOvC67r3a0i+maeJznkAXt2KHXU+Ou0VeT4jEnVODVGR3geKlWgzgsDfH49y0G
	LYi7i9LgIJ3THwnGCz5TaD3RKjTEwESsoUGQ4tlTyYPRgnQ5ngxtH5ZQ3ssP0Wdb
	owPcXU8hi1n5TFdcRW2KSoZ7KLJExo+qc5SbWUSX8EWPemqo0KRKyCbG5a/FJ581
	ygWbodgRs1Ed5nbq+O4w8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717492748; x=
	1717579148; bh=yzBOJSCnFXilIXLVMSmUj0oGiiczp/E3l4ZVzl2SFRU=; b=O
	UbuC0FnU6jOOVXmzrKbUg5E0J/WNtu9T5efPlO25/9Pj+tZfIj1SoOyGbaELVxt8
	ao6zbuAqZp0NDlkYv+FwF+ClSxPZn4IKpiF6D5VbWWz9IE1K92c7OiraP8TYqL65
	+HRt3uQt3Y+b4/XEppjoxri6vkVFpniK6l17v6GAeAxSTRvS5Z6qavs690u+90CR
	3i9garlrMqTl8eDNPfSe46ErtAmH4jI/oEZW8R/soGcmJMQU+Sf1hwiICsJ6QcXo
	dHUsail33CFmJ+OPRDpBUTPPQADAl7q4TmXeG/Sng8MeA7u4fcv5rkQs03tdq0zk
	7gMI2tSVxuxgI8ZdkwB+Q==
X-ME-Sender: <xms:DNxeZpoKGEX6RJnxMxP5QC4R-3AdNeJtvNdJHK6I-xqPfiyvbzEgsw>
    <xme:DNxeZrr7sJ4UmUmWNI6SSs-sRqNsaU89_M-8dxyOhbMZGKjfJgu7Y0uJDUnBq9Hxp
    UuPf3ajsd1Z9EgN2sI>
X-ME-Received: <xmr:DNxeZmOiXObEYJkL-Q5TrHxforzpI5_lo9cxvQXiz3ZKl-oWhgP4Bp9dhLZRdIx2vlG3qsUZvhUCpDpCyeF3hoXTvnfh50A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:DNxeZk6CfSHFVDLb0MFLDaR2QPwBdaAFm2hY5Sf46SX7PsLfsCFFFw>
    <xmx:DNxeZo5TrgVXQlDbr-OZl6v34Asl1xQ6saqWanj4vBiVFlr3upECww>
    <xmx:DNxeZsjDGbYX_kmt_W41V9pc8U-nU92KTwHqArx5_JXH3XlukOMXrg>
    <xmx:DNxeZq6d2w3Yn4yPSE9UuzvcDStf8zRRWA5p_yWDINBKdvTbP8T08g>
    <xmx:DNxeZpHST-SpIbM3zAS_oYtk6nKj1uw2zKL6oyhU5q5R0z9Qhk8dr_HP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jun 2024 05:19:07 -0400 (EDT)
Date: Tue, 4 Jun 2024 11:18:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,isp: Add binding for V4M
Message-ID: <20240604091859.GD710180@ragnatech.se>
References: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWRwRq-CzT5v1h6W31q_0RR4UvTpJAVVS73vrEbrxFmBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWRwRq-CzT5v1h6W31q_0RR4UvTpJAVVS73vrEbrxFmBg@mail.gmail.com>

Hi Geert,

Thanks for your review.

On 2024-06-04 09:38:04 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, May 27, 2024 at 3:20 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > @@ -22,6 +22,7 @@ properties:
> >        - enum:
> >            - renesas,r8a779a0-isp # V3U
> >            - renesas,r8a779g0-isp # V4H
> > +          - renesas,r8a779h0-isp # V4M
> >    reg:
> >      maxItems: 1
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> BTW, this binding only describes a single register block, while the
> ISP seems to have two: CS and CORE (the second one is optional, as it
> does not exist for the second instance of R-Car V4M)?

Yes. The R-Car ISP have two different functions, CSI-2 Channel Selection 
(CS) and a more traditional ISP block to do cool stuff to image data 
(core).  We only have documentation for the CS, and only that which is 
needed to setup CSI-2 reception and forward data to a capture engine 
(VIN), so this is all the rcar-isp driver deals with.

For the interested, difference between generations,

On Gen3 the capture pipeline is $source -> rcar-csi2 -> rcar-vin. The 
CSI-2 channel selection is done from registers on the VIN master 
instances but effect other VIN instances, this is one reason the 
rcar-vin driver is so ugly as each VIN instance is not self contained.  
While the CSI-2 VC/DT filtering is done in the rcar-csi2 driver.

On Gen4 the capture pipeline is $source -> rcar-csi2 -> rcar-isp -> 
rcar-vin. And both the channel selection and VC/DT filtering is done in 
the rcar-isp. IMHO this is slightly better design then on Gen3 but 
created yet another ugliness in the pipeline as now Gen{1,2}, Gen3 and 
Gen4 are all supported by the same set of drivers but the same function 
is served by different IP blocks depending on which generation, this 
makes for somewhat ugly driver code.

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

