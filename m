Return-Path: <linux-media+bounces-12006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB9B8D0991
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 19:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76ACF1F21BA6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 17:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A757015F330;
	Mon, 27 May 2024 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TKZJv1QS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dFSEMYa7"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB2155C8D;
	Mon, 27 May 2024 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716832450; cv=none; b=LxSsIaTKPLoiYXbY+X95IExIMUwgW4yqj/nFzPfU+Ihf8VOiVHzQ5eCK8rdXEIXyMHnHF1+rSl5E+P/BbB3o1JARp4sWDaVXBLUfqnJ9X9yYDwDdkh404bViN3dP4V0i4bivPaAYqxZXgNf3uxW2WN/5KD60cdGw1GW4RLffGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716832450; c=relaxed/simple;
	bh=fPWenfo+U38jaagHHWM8b2q1AgrEX6WrkLJJVIupgQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3zHRbd7ThEcrzrqN0JQJAEGEKSm6Vhq+Ki8ormyOsevmjczItUJSAZTXsh4ERs/R5dE2biH+IMmdIIyn5SJxssT85HYVjiAZCFJD32VAyEcq2pfwUYb6N2v/ehJupxkEHmEYnndCA7nbGw9Emgq79qh0UpCsnn04wst2C7pLp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TKZJv1QS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dFSEMYa7; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id D9B551C0010D;
	Mon, 27 May 2024 13:54:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 27 May 2024 13:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716832445;
	 x=1716918845; bh=G0NAta/lh9onOsL1EDtQB+THN92GtsjAVH1XbX5tt3E=; b=
	TKZJv1QSLQND6DfaWa1C2pgSS22QDAmOUhie8eB9CikIInaj9uoMhfau0qdqdJQ2
	ozBc8/lYF1kW6zL9XP2iR2Y6qerob+ZqltT1Q7/UPtEg+fa/8+HsspHr2GWtVN8a
	OAuEHI1b3DEbn+ocXqtewpBOR1yyhDStB1VkQ4C0G1lhH1fl5HfjnFlVm9lQU60s
	mUGBkbC62PerjrrzeiRpT9427WyEY8/lzdy3mr63EPBN0x1VzZmimliNf0X+A1VT
	C8RrNOulX61GOuux2JBL/GAHB0vjRtBOcvWN9EEgufqV+hHeuEK6E0NLT6qiTZZp
	k+iX+pEJ0+UBcYuY2jyYiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716832445; x=
	1716918845; bh=G0NAta/lh9onOsL1EDtQB+THN92GtsjAVH1XbX5tt3E=; b=d
	FSEMYa7lqfIMEbFbPmvUFlpEwXjGUs7cCsDuwq0D3B2TpqllvZJQopdUQK4IRutb
	FrzOC14XK/qsyu459aN9WrvF6LhJ80UEO0jh0oFJxTbAw0GPWvX0W9TkTc1pNMTa
	+Da/A4eON2iFOGa+jSIKQ0xuFUClONX+apdHDDPHMeURqhAnM97PVsk1lGZSFtvH
	sxhxZnMdqAAOiNt5HAGaM9T7b9uT59eR2gHd8rsz+We2Qf4poV9Dzpfys8I5xTvb
	mgC9hA/TV90hxHxDKxh/I1MSZjFo2LdSlpHVW2Pj2rx7dRmbXE2cba4nglW34zZI
	GnDeGymjvyCrQUAazv7MQ==
X-ME-Sender: <xms:vchUZsK4mr0qG38fORdL_K8rL8PD0i4AhknvGiz565Cz6TGTaQh_9A>
    <xme:vchUZsISrZO6ztxVXrIiMkxDx7sjCjrzN6qFziwUqv6oH7CZTK9OWYgM5OstLJE15
    yJlegMWzhV6uycfhdU>
X-ME-Received: <xmr:vchUZsugw91shEmpLTkdJfYto3ZKLLFcOOZVU0c6QdQEG0Fy4viHC0G6DrpX2R5y4x6peSFTKhc29TjzMi9I94pSTWdW1YU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffekgfdu
    keeghffhjeetvdeitdegteeikeffieduhfegveetjeevtdffvdekffdtnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:vchUZpZEybioqxMNa7ov9FxDwik2LyP4VbaapBguPnnhUmcp2ZL6SA>
    <xmx:vchUZja83AvLV13OzmSUHBqZPwM91ua2x0aPVVIlydSTJOTxNFBxcQ>
    <xmx:vchUZlBDwzT6dPstGK2TFeLCfANG5hcHbmlj321n4lyijJxnikU_5A>
    <xmx:vchUZpYa-8UuGNKIdLfTHz77i8gtnZDAuf2sXB8E8_PVzWGtZ8tJNw>
    <xmx:vchUZtm2sO5Iww14mDV2-eI7prAwpSsr_vlO6Ba3e7bgh4IjmosPeGZw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 13:54:04 -0400 (EDT)
Date: Mon, 27 May 2024 19:54:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,isp: Add binding for V4M
Message-ID: <20240527175402.GI1900917@fsdn.se>
References: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527-causal-flyable-c34004c298bf@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527-causal-flyable-c34004c298bf@spud>

Hi Conor,

Thanks for your feedback.

On 2024-05-27 17:36:23 +0100, Conor Dooley wrote:
> On Mon, May 27, 2024 at 03:19:45PM +0200, Niklas Söderlund wrote:
> > Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Should be with:
> https://lore.kernel.org/all/20240527132513.1684232-1-niklas.soderlund+renesas@ragnatech.se/

I posted the bindings separate from the driver with the intention that 
once they are accepted I can upstream the driver and the DT for the 
device using it in parallel. The V4L2 subsystem is at times overloaded 
and in the past waiting for both driver and binding to be accepted as a 
whole unit have delayed entablement of SoC features unneeded for one or 
more releases.

> 
> No mention of why this can't just fall back to an existing device here
> or in the driver. Why not?

For better or worse that is how all Renesas devices are handled, one new 
device compatible for each device. This have worked well as each device 
usually have a quirk or extra future that is enabled later.

> 
> > ---
> >  Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > index 33650a1ea034..d335d5595429 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > @@ -22,6 +22,7 @@ properties:
> >        - enum:
> >            - renesas,r8a779a0-isp # V3U
> >            - renesas,r8a779g0-isp # V4H
> > +          - renesas,r8a779h0-isp # V4M
> >    reg:
> >      maxItems: 1
> >  
> > -- 
> > 2.45.1
> > 



-- 
Kind Regards,
Niklas Söderlund

