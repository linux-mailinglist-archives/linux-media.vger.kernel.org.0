Return-Path: <linux-media+bounces-12007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACECA8D09B3
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07941C20908
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F915F3F3;
	Mon, 27 May 2024 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kXkkwWGH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AUsuKECK"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59761FE9;
	Mon, 27 May 2024 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716832998; cv=none; b=SymUs/rnVUksXaXkCnGGi//Vq3f0MlpEz8EChYo5u7F9mBeBGLhrw+4moEmWMYim/KCdNVpjQUSG0fkxj3ucl6iyW8Mn691t1T0zd0ItyGAQtyGVzgvEKFb3FgG5+pTswG0JecF0Vr2FQzBhe51HhWpLTyOuFkC+RAdj5O+lZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716832998; c=relaxed/simple;
	bh=Gij2SXdHB2l3sqivc5i7TaNn9/BKYVFYIgFDx6y6WiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd0xSnPvAtrIX6ORy843Ey3mC6lMIcIJQn/7ByMzciHIscX53EHlgsMMCD0nMcUd/Bou3/s8qi1vOg5/2NUvlv3YLvzXeLpgG5k+/zuSkDHwWvLsl0P0weOOVJYT4em01ML3sbi/RsOtWSOtvjHpBhehVBmlXBB1C+KHvmfm1Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kXkkwWGH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AUsuKECK; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 324AE18000F0;
	Mon, 27 May 2024 14:03:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 14:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716832994;
	 x=1716919394; bh=2n6AVHqDSQch5st1ep4vz0PYL3OeAAZ7tpvPAc6MR68=; b=
	kXkkwWGHdEg/kQ8fOis+S04UKn2fDz6X0GksKgNF46ubDMbVWi5A+aUQeWsfJNwD
	kef2Mdq4kAH46mXmb8UIT9QwcOt5JKgJr1zIsIuaKkOaaougIHJ4r3NkwYzpUH+A
	nrDLG45CyIVGNNjdz0kCKkUZ1MhU/MHFWoM5tf7Kur01SIZzyZRfXTT/EewGWxA6
	5fc42w6h/8VADx2Jh852OiXKBWe6L07/m8vpjJr1ytjsF2Fi04Q3ILs5A0lUbHQE
	4DcOrh9kPU3ZbFHuHMyb9pTSGJEbzookNZ8nIeXPeMa/MzgpZk+uCaOzNMOGsLpP
	HocMhWxzVuQd9B0KBWMPIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716832994; x=
	1716919394; bh=2n6AVHqDSQch5st1ep4vz0PYL3OeAAZ7tpvPAc6MR68=; b=A
	UsuKECKXJ7ZDqFn9rRBQ1QPJOHN8cU4qPpfOJqy13VB2/jjRLkp4RkbgG2mj6wYd
	b0lVJUmemgbkqSUdYifCcLLUqA0OLe3aKX/lxwJpT1nnqHuH3K72becDvDQMkDIL
	YFHuAzcb8Cc7cvI2qINtvG8WGoItiJeEz8Y/BWO97H1tM1jmsLvC/qjMKidyOsNZ
	5abId9JUQXEYgtY0FJA5voQHi4hVsaN6GVz7xumx2W3s2Wet39rDOUqp+Px15/nw
	qNfflUG5XO+hKDqGT0mH4r0RQb694rpaTQxptyeaqpqpDdpMBALOGUAbKGnyYl3j
	SMwv1RuYs41LJE3uxw2/g==
X-ME-Sender: <xms:4spUZvk52BdvK5Fushhyo59_Xqu_x1ON70nMPEbFJlCloUJ2514EeQ>
    <xme:4spUZi2BqBLnIfhTguLAYrFyGayiy7ft6qGF9PApa1W3oC_0BpyQcV2UFAQfVd94T
    04g-DlMW9oJ2D_xmtY>
X-ME-Received: <xmr:4spUZlrGqWhahRLCYE-RzV7OYQT35H1jUewSvvsIOqzIowXlTNvKBQLQwYjxkJEVsD5ikj2ICFT3UgagG9PZW22QdHDfFaU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffekgfdu
    keeghffhjeetvdeitdegteeikeffieduhfegveetjeevtdffvdekffdtnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:4spUZnm8WUTcOuetX21ONkldHZlLjj_CWyxNnro_Zzuw9Gcl0HIGWw>
    <xmx:4spUZt25WaOnmq_VrygUGHsSQCNYbxeiUsxrAyJNauTUq6YTTNZiKA>
    <xmx:4spUZmtN06gcJZuhyW5uiggQGc0lH5d6fz6AGgpbehBH2NHkWOEBTw>
    <xmx:4spUZhWqx1Q1GSQ2soY8-0ZzmDdDx6VhAane-FIAqTlEsdlJqQw8ZA>
    <xmx:4spUZnztKvJ5HdK7OciwFcOYMCKrb2K0DQkWk03zVJRQxxMHDQDTnpRV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 14:03:14 -0400 (EDT)
Date: Mon, 27 May 2024 20:03:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Add binding for V4M
Message-ID: <20240527180312.GA226593@ragnatech.se>
References: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527-replica-mace-2306a85ad5d7@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527-replica-mace-2306a85ad5d7@spud>

Hi Conor,

Thanks for your feedback.

On 2024-05-27 17:37:21 +0100, Conor Dooley wrote:
> On Mon, May 27, 2024 at 03:18:49PM +0200, Niklas Söderlund wrote:
> > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> 
> Which is different from the other devices how?

Compared to the other Gen4 SoC supported it only supports D-PHY. I will 
add this to next version, thanks for spotting it.

> Should be with the driver:
> https://lore.kernel.org/all/20240527132429.1683547-1-niklas.soderlund+renesas@ragnatech.se/

As I mentioned in the other thread about the ISPCS bindings, I 
intentionally posted the bindings separately to allow parallel 
upstreaming of driver and DT users.

Is it really a bad idea to do it this way? For other work I have done 
that involves more complex DT changes then adding a compatible, such as 
adding a new device or adding more properties to cover more features 
only available in a later version of a device. I always post the DT 
parts first as this can spur discussions about the design and only after 
they are agreed upon do I post the driver parts that make use of them.

Seems like this would consume less review resources as the bindings can 
be agreed upon first, before anyone have to spend time reviewing a 
driver that might need to be redesigned as the bindings could be 
improved.

> 
> Thanks,
> Conor.
> 
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > index 5539d0f8e74d..168cb02f8abe 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -54,6 +54,7 @@ properties:
> >                - renesas,vin-r8a77995 # R-Car D3
> >                - renesas,vin-r8a779a0 # R-Car V3U
> >                - renesas,vin-r8a779g0 # R-Car V4H
> > +              - renesas,vin-r8a779h0 # R-Car V4M
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.45.1
> > 



-- 
Kind Regards,
Niklas Söderlund

