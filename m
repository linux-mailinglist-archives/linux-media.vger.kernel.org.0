Return-Path: <linux-media+bounces-13755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B033490F7B3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 22:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F65AB22FE6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 20:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BC615990E;
	Wed, 19 Jun 2024 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="P2Qph7s9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WuTkAUrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67E46426;
	Wed, 19 Jun 2024 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718829808; cv=none; b=rnBgRHs4Wk3uYtIwxxDCaa0R9rcSw2+ldBv1aPWO9oCfJ11E+LQ0YB0QqR/NkFTjz8rjHrRYwcOmts/UASGn5aXpzJ/3GDCKHMEavvHpZkgcEihzL74Houi0b784dnVdgaL9FU2iQGtLzsOaTGclNcXPTR7l3+OmwXWlTg6imUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718829808; c=relaxed/simple;
	bh=yKZChgvB9dkxH6TlnwyE5Xofu5kOSaiiy/Ug0SshQDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbQhaEBfX8PL3J7i7lBTWffBtcS17hN8Trjb9/wMWggvsvJ86CcwEkDycJYCVFwBeXK5HUFIqBYDBlQ0OXG78tyy97PeDKRyDQTI3PBLPCgmPp4yR8jtGpV1tE5sAB0u7mNa0SunpeNVIhpQR20RDwKbp1zz8mf8rafYqlBjNac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=P2Qph7s9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WuTkAUrJ; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id F117711401D2;
	Wed, 19 Jun 2024 16:43:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 19 Jun 2024 16:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718829803;
	 x=1718916203; bh=4+nZ3Of7awLs1nsdV0WyTaF/HUwXKfz5RuglzQQXT9o=; b=
	P2Qph7s97oRIsLy8vn2OveZStijxtNPwc91dZV3Io5uKgBoEoykikC6FkP/tNA/7
	O7h94XKVuMr5LL8Z2upfvr7lwSXOVOujwdp9cdGmW55c6496y/4D18vGab9ro7Z7
	H60juput0sP3TSs3Rhjo6rmUVfISm+FO+b4QTZmlvmxTNEMDsFN7l/byfBn5yWL+
	j0QklfJ9RvXEbzMZ7me3rjVdzdBUlGdkWDoXCZgla50iYrLeLUPl1ytXgzZanfuY
	/b/e5vU3ARf3mNQMk3mUl2pg5vn6wKb39u6sA46VwlgJzSh++v7foC6FUEUmTkn3
	YLWuafebgXLXWYmKUjbhkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718829803; x=
	1718916203; bh=4+nZ3Of7awLs1nsdV0WyTaF/HUwXKfz5RuglzQQXT9o=; b=W
	uTkAUrJc7NF/kM8pBgYsVWhADFZqQkQ2c4OCNPA2VSdh+6d6tLbztZWxFoFXP0Te
	Gy7idJszNSQ8JpJCweh100e4qoH2QoQ+aZeRc9/XA4O+rUlfOQxe9K4sJvhLbt3Y
	YsPVMPjcrt3DYDI8tdLJjvNdRSLpkonYZuiuWLykTZbb0SguI8AVKH8aWmVZgb/r
	GhpLs6Sa8rPesDAanLvaxXWUzsiNNj9Y4DpGQT3W8zIUJ7orkRHvEu60dI+gT7BN
	t1hsNjQZKZ/sguQ2ZsYEcLtxrFG0Hr/VlGSvXFoAJ0r38t39SFD6uhrjNMdwN/XK
	XrU0l9gg8SJJ7VFEVjdlg==
X-ME-Sender: <xms:60JzZnqSuLMJKD_c8bBfflefaK5vA9FUEf-qC97uRiWOugaAv_zN6A>
    <xme:60JzZhoWnnXA0tWbu7JGP1T0BgyozD6q-AzHNRSGtJL3FPJyrmt10DqrxaE25maNw
    jNWg1G0YG7oTra-6Vc>
X-ME-Received: <xmr:60JzZkMdg_8jc1cCME9eRPatNjKwBF-UkC2Jt0K-p8Jh3o7VzTtWoG5jAgjteBc6ORzTBfu6whN9Ivt3-alycGRLoMn61nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:60JzZq4Txe_Ki5h8f3m2mvTWIcowbFo4wZZF1Eu2vLTv_Oz7UOJLNQ>
    <xmx:60JzZm55Q2sj2kMh1C1a5UdLIm3oftQ-HQSoPc7DH7hbDMsg4TNlzw>
    <xmx:60JzZigkIiHmlKRZlFKiL3SH8oowwdZrsXgO5QA5yfOP4zJoSaug5Q>
    <xmx:60JzZo7mgj8hVUe5a7G3z8j4wBtFMDMFC2mSEtWOQQtp8ST7jYO-5g>
    <xmx:60JzZjxDU5nnv_Usq8Mb52QspOUXWfeuJ0cy6voD4CAEc5PDHkImvob2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jun 2024 16:43:23 -0400 (EDT)
Date: Wed, 19 Jun 2024 22:43:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240619204321.GU382677@ragnatech.se>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619185607.GT382677@ragnatech.se>

Hello again.

On 2024-06-19 20:56:11 +0200, Niklas Söderlund wrote:
> Hi Conor,
> 
> On 2024-06-19 18:33:37 +0100, Conor Dooley wrote:
> > On Wed, Jun 19, 2024 at 05:35:58PM +0200, Niklas Söderlund wrote:
> > > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Didn't we just have a conversation about this, yet nothing has changed?
> > NAK. Either you need a fallback or to explain why a fallback is not
> > suitable _in this patch_.
> 
> Sorry, I'm confused from the conclusion of our conversation in v2. I did 
> add an explanation to why not fallback is used, but I added it to patch 
> 2/2 which adds the compatible to the driver.
> 
> It was my understanding that a SoC specific compatible was needed in 
> either case so, at lest to me, made more sens to explain why in the 
> driver patch the reason go into detail about the register differences 
> between the two. Sorry if I misunderstood. I can add the same 
> explanation to both patches, would this help explain why only a SoC 
> specific value is added?
> 
>   The datasheet for the two SoCs have small nuances around the Pre-Clip
>   registers ELPrC and EPPrC in three use-cases, interlaced images,
>   embedded data and RAW8 input. On V4H the values written to the registers
>   are based on odd numbers while on V4M they are even numbers, based on
>   the input image size.
> 
>   No board that uses these SoCs which also have the external peripherals
>   to test these nuances exists. Most likely this is an issue in the
>   datasheet, but to make this easy to address in the future do not add a
>   common Gen4 fallback compatible. Instead uses SoC specific compatibles
>   for both SoCs. This is what was done for Gen3 SoCs, which also had
>   similar nuances in the register documentation.

After have read thru v1 and v2 comments a few more times I think I might 
have spotted what I got wrong. If so I apologies for wasting your time 
reviewing this. I'm really trying to understand what I got wrong and 
address the review feedback.

Is what you are asking for with a fallback something like this?

--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -53,7 +53,11 @@ properties:
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
               - renesas,vin-r8a779a0 # R-Car V3U
+      - items:
+          - enum:
               - renesas,vin-r8a779g0 # R-Car V4H
+              - renesas,vin-r8a779h0 # R-Car V4M
+          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4

If so I can see that working as I could still fix any issues that come 
from differences between V4H and V4M if needed. If so do you think it 
best to add this in two different patches? One to add the 
renesas,rcar-gen4-vin fallback (which will also need DTS updates to fix 
warnings from exciting users of V4H not listing the gen4 fallback) and 
one to add V4M?

Apologies again for the confusion.

> 
> > 
> > Thanks,
> > Conor.
> > 
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > index 5539d0f8e74d..168cb02f8abe 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > @@ -54,6 +54,7 @@ properties:
> > >                - renesas,vin-r8a77995 # R-Car D3
> > >                - renesas,vin-r8a779a0 # R-Car V3U
> > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > >  
> > >    reg:
> > >      maxItems: 1
> > > -- 
> > > 2.45.2
> > > 
> 
> 
> 
> -- 
> Kind Regards,
> Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

