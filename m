Return-Path: <linux-media+bounces-13852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C06910E5F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 19:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0178D1C21C2E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53141B3F0A;
	Thu, 20 Jun 2024 17:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="l2uvP6jJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DvYoYla7"
X-Original-To: linux-media@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E541A4F1D;
	Thu, 20 Jun 2024 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904165; cv=none; b=adzZZqBYWwBwXN7BxSn94sVJBVAJiIR0VUU16U6z+6lKGg6tfE591mrRh0j4l3PTmApJm4P3gxppg9i63VP0J6XCoLUTDwdo2ebG/xhbz6xMPfVSJhCdZtIIWUXPLOrLb6g5tMyLacb52rgYX61iVheDHLHFkE98RP9tb9bJbec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904165; c=relaxed/simple;
	bh=4GZytodNabpBpQfHkn0vHgr7691PnQZlRpPCrb0qEqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFzj3NMHBr2j85dwUBWpBwj8UikszfauEt4csE0g6KeZAsyP4nGhOJdpopFItLsctsu7B0gh5ZQ07FWso5Ey5i0pyYAsFaEPUWdI4lFS2+z8HflMOuFETjaSSRcd0NduDmTxpDHVKM5+7rBqTxmicGgHJ+jl7TT+mmg4jc60liI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=l2uvP6jJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DvYoYla7; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id C168C1380120;
	Thu, 20 Jun 2024 13:22:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 20 Jun 2024 13:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718904160;
	 x=1718990560; bh=VkdvAqCpdBsmsMXIeyPYcuMengxQ+03Ye9lgxOnYspo=; b=
	l2uvP6jJgtazJl1/LHGOyjytI4yw23c1JKu+eYqiuAGGyPrfcgxpkFLCyavavPvA
	NEY6wD0J+aI3/Fm2Fmj/guEbP7fNXEB/ciPTjHurucfWXcg0Qp6hSCMynZoPiG99
	1/R2kxWpcX05X250hMjOONM3INBIMpTlIk7Une3FGezvvyTh2LNgAgwNZ6Wxphe6
	BxDAGoW84isIlS/kUKxz098jn3ZWngyyq1AK+3BAV67GC1WRAOLArRaR24zd8LD2
	zd8pqdwEP/q4lmZIX/W38d48o7QB9XahPjVKX3mNw4IhNvXk82DaRTNoewYXdOrf
	RDxC40ZXKRMitWBeLLM8Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718904160; x=
	1718990560; bh=VkdvAqCpdBsmsMXIeyPYcuMengxQ+03Ye9lgxOnYspo=; b=D
	vYoYla7f++xU6eEop8yMmQ1ZENaPvxwCfvx7DvvmKxeaunbTWa7Z6Q1C2vDGWUgd
	57C7Q+WGLMwv17UTj3tyonW7x4akbCmn0yDtfM+w5rTvspa3N3oatI+SnLnh5BZ1
	A0oYnU9V5DZMNBBUpesG/6nlJL/oN52D43+7K+yyShsMavn+aVmihFeg/G0O0nXN
	+9GHNLRDLPMYCvq4EBiEj/toWz5Tj6Ro5eR3uGI/hZ/fPXgCvMlACxKFjph0ltMh
	Dp5gQI1T3S6bT6pxwtby9rVztFWLnns3PzSSZmsfLyRSVAka5a1arhzBF/8c6FrS
	HhHz+zCy7tRY6SZCBOJgg==
X-ME-Sender: <xms:YGV0ZlOjDjgf04O_hIYTe6zWg457CXOoooZdNhDMVD0w1SVZ28hnzQ>
    <xme:YGV0Zn84ctcLTQgmnTeF-Yy2AuumR5O5F49nvKgmWvpx_pkxbO6HT4bEkuqPAzbqz
    6CGXSyyOrzrXK9N1MU>
X-ME-Received: <xmr:YGV0ZkSA2IhUonAuzcSEwqF7nwf-OHVInrk1Z24vGSVY5BLmneVR6E58vi8RfUFqwUfxYQp4tW4oGgKhmen-zzg9sXzLZdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:YGV0Zhsh_0L12XeIliRQc2oHYHdqMITreXLfkr4012lohOwhWiMpnQ>
    <xmx:YGV0Ztceh-lwKjjwun-aBN8MkCe_2AVVQDM011Bj1xFo0aVnzgzYJg>
    <xmx:YGV0Zt3nVzVMs5j-LcxFuUA-Mx-86vAmtpStTNolAGRiZfL0AH65uA>
    <xmx:YGV0Zp_YF4nXohgcJ2b2nHNo5o541nytiBpfyoiOeJUvAsG1HP85hg>
    <xmx:YGV0ZuUUX4OU7tUBIiFqfSM4W2105h_QqdRNjndE1X7_R4ZtS9YVnHsX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 13:22:40 -0400 (EDT)
Date: Thu, 20 Jun 2024 19:22:37 +0200
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
Message-ID: <20240620172237.GA3623951@ragnatech.se>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se>
 <20240620-gating-coherent-af984389b2d7@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-gating-coherent-af984389b2d7@spud>

On 2024-06-20 17:27:00 +0100, Conor Dooley wrote:

> > +      - items:
> > +          - enum:
> >                - renesas,vin-r8a779g0 # R-Car V4H
> > +              - renesas,vin-r8a779h0 # R-Car V4M
> > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> > 
> > If so I can see that working as I could still fix any issues that come 
> > from differences between V4H and V4M if needed. If so do you think it 
> > best to add this in two different patches? One to add the 
> > renesas,rcar-gen4-vin fallback (which will also need DTS updates to fix 
> > warnings from exciting users of V4H not listing the gen4 fallback) and 
> > one to add V4M?
> 
> 
> I would just do:
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 5539d0f8e74d..22bbad42fc03 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -54,6 +54,9 @@ properties:
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U
>                - renesas,vin-r8a779g0 # R-Car V4H
> +      - items:
> +          - const: renesas,vin-r8a779h0 # R-Car V4L2
> +          - const: renesas,vin-r8a779g0 # R-Car V4H

@Geert: What do you think about this? This would be a first use-case for 
compatibles crossing SoC DTS files that I know of. I'm a bit uneasy 
going down this road.

Would this not also effect the existing users of renesas,vin-r8a779g0 
which would now need something similar to what you propose below with a 
list of SoC compatibles and a fallback.

>  
>    reg:
>      maxItems: 1
> 
> Which requires no driver or dts changes. That could become:
>       - items:
>           - enum:
>               - renesas,vin-r8a779h0 # R-Car V4L2
>               - renesas,vin-r8a779i0 # R-Car R4P17
>           - const: renesas,vin-r8a779g0 # R-Car V4H

FWIW, on Gen2 where fallback es where useful compared to Gen3 we did 
this with "renesas,rcar-gen2-vin".

> 
> if there's another compatible device in the future.
> 
> > Apologies again for the confusion.
> 
> dw about it



-- 
Kind Regards,
Niklas Söderlund

