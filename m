Return-Path: <linux-media+bounces-16567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E7959B49
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C371B2AB0A
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB521D1308;
	Wed, 21 Aug 2024 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fAGHkkGK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YuNf+M55"
X-Original-To: linux-media@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C4A1D12E6;
	Wed, 21 Aug 2024 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241100; cv=none; b=Bwpjk5fS9FZHJI5TwaXVQO8Q830fciea2LTKgukUZOuj1oaR5SGgu6FgQC29RXty7tsILhchv6yuWQfHSJ3XZSoZLrzkered004W3esZi5bs2JGL9Ns8thezTDJypgk1dRA9o+v/RcaaOjHJrUEElT2hihNdzTGSgxda/3qWxo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241100; c=relaxed/simple;
	bh=0UK31o1lPTclQh4XjmuhN4ibwaeePcy96OGXKKxnS84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeCpwgHX2Spp8JlJ5dig98R5jrleBSDVQVLvkD2S2KIhsZRciChOVLrte4b83lFPY/hf14dQyIEjbXZs5NjX63NL6mFPNivzQ2aRwzr4CHaExGEuR+vHWEq9b4LEZOXoiz8qA3aL6ypw4SIFIjF3FGCQ4Sx9+o5YA+D2p/FGRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fAGHkkGK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YuNf+M55; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 61E4B138FFBD;
	Wed, 21 Aug 2024 07:51:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 21 Aug 2024 07:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724241095;
	 x=1724327495; bh=StJwzV3uCLvKYfEuI2zCRuLS4R5ndcSpt0JLtJRrcGI=; b=
	fAGHkkGKJcDqWX7ov9ROzG6Dwu7XKoyXSV4Tp+7liPQ1R8OH7Q7fNiLP+5h5wern
	PhX4myMc8s71RlOIdW/NZocGmgWOad2cHmvuktAJUAIQ7E4SttK0GlDnHHo/Eg9W
	GqvP1sNVEXsOQx0qiT80Qhiw7tm08t5+FptbvTKTRWO0MLrpzGi9VQGqJz65EO5+
	xneDVrvnu7ckO/reGlsZisdr6kBjF6DjgogsyWKX4Hf+P8W4xcgkv6/vGJtHMS5S
	EkJ0G7WF/qgb0eTNj7iLgyVghgalxFDPXPqE0c1u1mPL2cXCfhFhcisF4dGuWng1
	TP1HY+srKNd/oncZrQRqig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724241095; x=
	1724327495; bh=StJwzV3uCLvKYfEuI2zCRuLS4R5ndcSpt0JLtJRrcGI=; b=Y
	uNf+M55WhIWCo6kpLRYXHcndkzx4C/3+zX0katlL4juFAAiSLJk0FI4iIzV4cIJK
	0dDn+E9Aojl8Hy2oK2CmM1BzrbI/LO4ZhCkOnOVeencBzhj1OYsN3ZiS2V99Bg+M
	IkWGNza1dN1TSD+xFMEeGF83oJK3UVzsu+jKtlGM8h3SkDRNvu+3LonXXu/NyOKZ
	VqcGgxTtnAcn0rSu6ypcx8ObMgWaF4Cddseg0uQQsFgXumt8ptFKnRnc49HVDcm9
	8hw4igpKJSaQ46IKO8OOITLrA23P1iVRP5KWvZ4FrvM/RQcEFWJzYHcs6qkWX87j
	Vkj/qvAW0iPTKk8D5IsYA==
X-ME-Sender: <xms:x9TFZhzEILsgrmZLDrOABeMguED0yg1RPWVs-oUcLCo2hPNZ5YwRwQ>
    <xme:x9TFZhTE6naaEeH8ZvoplTKpwfI51VgpHy-2nF5oFPBKIRVVKbh8AfOFkGASyCMqb
    d2ORFT8Io0jstgm4bg>
X-ME-Received: <xmr:x9TFZrXM75_KqKt8q1ji4AjsJTCiPP1CFGp2QA6nF-VuAR-DkWDuxJHj8NpcXaYLrw-Qh7h_wkCJILnE_3GoCQjfKl30zGHaGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddukedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeffkefgudekgefhhfejtedviedtgeetieekffeiudfhgeevteejvedtffdvke
    fftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtoh
    hmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhii
    hihsiihtohhfrdhkohiilhhofihskhhiodgutheslhhinhgrrhhordhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhht
    odhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqmhgvug
    hirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgv
    vgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:x9TFZjgzxHzdubc8H678Fy4clI8mdnZmeHtFgtD-kxYBsBtNykVB4A>
    <xmx:x9TFZjDjcWluRve_X2X7J7kmc_ShDAduin1GUxEk4BqG3lKAv_1CwQ>
    <xmx:x9TFZsJ3wcge_oI2dyq1gZkr7znRdTYzP7FC4jxuf_FIlnxb3djNGA>
    <xmx:x9TFZiDbbWHrpAXkDo-7O-3D6jJGHFiZ1Wxhc8fHXOG9oWCwSMbNvQ>
    <xmx:x9TFZgL_jL5DbnAopho9GTRZu9fsaOQvwgcLcqRNISHpkeDMgz-aJUFm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Aug 2024 07:51:34 -0400 (EDT)
Date: Wed, 21 Aug 2024 13:51:32 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, helpdesk <helpdesk@kernel.org>
Subject: Re: [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
Message-ID: <20240821115132.GA901567@ragnatech.se>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUjSquBji5+UVACLaWdMhbq5EEkiUANc9LeR5d_1BvkFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUjSquBji5+UVACLaWdMhbq5EEkiUANc9LeR5d_1BvkFw@mail.gmail.com>

Hello,

On 2024-08-20 09:34:55 +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 4, 2024 at 6:16 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > This series adds bindings and support to rcar-vin for R-Car V4M by the
> > means of adding a Gen4 family fallback compatible.
> >
> > Previous versions of this series added V4M support like done for VIN
> > since the first Gen3 device, by the use of only a single SoC specific
> > compatible value. This was done as in Gen3 almost every new device
> > differed from the others and a family fallback was not very useful.
> >
> > For the Gen4 devices with a video capture pipeline currently documented
> > the VIN instances are very similar and a family fallback can be used.
> > This however requires updating existing DTS files to add this new family
> > fallback. This is done in a backward compatible way and the driver
> > retains the compatible values.
> >
> > See individual patches for changes since previous versions.
> >
> > Niklas Söderlund (6):
> >   dt-bindings: media: renesas,vin: Add Gen4 family fallback
> >   arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
> >   arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
> >   media: rcar-vin: Add family compatible for R-Car Gen4 family
> >   dt-bindings: media: renesas,vin: Add binding for V4M
> >   arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
> 
> Any chance the media parts can be accepted, so I can take the DTS
> patches through the Renesas tree?

I would be happy to have some feedback on the media parts as well as I 
will need to send a very similar series for the rcar-isp driver to add a 
family fallback for Gen4. But I have hold of on posting them until I 
knew this is the correct path forward.

> 
> BTW, running b4 seems to add two bogus Acked-by tags from Conor:
> 
> $ b4 am 20240704161620.1425409-3-niklas.soderlund+renesas@ragnatech.se
> Analyzing 7 messages in the thread
> Analyzing 14 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✗ [PATCH v5 1/6] dt-bindings: media: renesas,vin: Add Gen4 family fallback
>   ✗ [PATCH v5 2/6] arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
>     + Acked-by: Conor Dooley <conor.dooley@microchip.com> (✓ DKIM/kernel.org)
>   ✗ [PATCH v5 3/6] arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
>   ✗ [PATCH v5 4/6] media: rcar-vin: Add family compatible for R-Car Gen4 family
>   ✗ [PATCH v5 5/6] dt-bindings: media: renesas,vin: Add binding for V4M
>   ✗ [PATCH v5 6/6] arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
>     + Acked-by: Conor Dooley <conor.dooley@microchip.com> (✓ DKIM/kernel.org)
> 
> I cannot find these Acks in my inbox or on lore.
> What's happening?

No idea, I can't find any Acks from Conner in my inbox neither. Both 
patches in question where new in v4 of the series.

-- 
Kind Regards,
Niklas Söderlund

