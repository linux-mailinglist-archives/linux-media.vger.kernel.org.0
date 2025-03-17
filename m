Return-Path: <linux-media+bounces-28353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F50A64D45
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E05B41896053
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6532D230BC7;
	Mon, 17 Mar 2025 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vXjW0ONF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jUZxojme"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0017D346;
	Mon, 17 Mar 2025 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212211; cv=none; b=JWXoDVRoDMUK52gx+Be6Hfg3+MuHg+g/0FSXB7LhPjKri9gwizosxH+qwvxJPuP6ZMzjhYYbkh4EUs2vDJG8h/yie+hbHLqbR1sWQq3YK4dYxNDEs2Y6I7Spp9DLSMMM2ap9HvTDE/+K5iTI/S607cDb8vN9jemzogl7BuGNsHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212211; c=relaxed/simple;
	bh=CVKfYDRgCnRlRQLAwffZrQk4HTLDuraJRKsyRUEn2zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdtgIrTgnSNcgqfOur7uDE/qt3Pjywi3kMQO9RFQ9Tqmcuek2v0X82wEvnEE3F1IS+/h1ZiNHhiYbn1/ZYHf5GxMeDdqJF5gB///2SEHGPlo6ADZDXldYDledh76Xy34rIs92pisVdudakMZ8ro+GGT0RnAov/6YuybwTZmqNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vXjW0ONF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jUZxojme; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 8725B1140186;
	Mon, 17 Mar 2025 07:50:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 17 Mar 2025 07:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742212208;
	 x=1742298608; bh=9i7rKMcJkYraRPkp7wcprgDtKykaWiXN2c6sWJxGjX4=; b=
	vXjW0ONFexFiQ49U9ZA3JEht9h+daHGKdIE28w/+DYf5iMO6fJFabOztMyzyz6vX
	UFJdhB9iXXbNpeZu0pr7NSzRbN/aHxAH01chmJGP0+Bc5luYOGRCYKcTHjyya43E
	DF7GzY95GW2prrjUT0MtvseqLPTOlbAoXKkcyhGF6VOUkegyqYn8SJcunMnk3HmT
	8QA0vmmaG/KdyN+OyfjzQ0F2Y74CpBROFgXpAYscWmTcE7xt3Jxhgv2D/oKMTYef
	TgQEhc6Cs73y7RrY2/tA5wk++ArHpJGU2Bo1WvNx30+Iw0UcpKX279aeT3E1SC+V
	D0UHmbrwM+FwSQqxvN/94w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742212208; x=
	1742298608; bh=9i7rKMcJkYraRPkp7wcprgDtKykaWiXN2c6sWJxGjX4=; b=j
	UZxojmeiiz8ae/W1o9x3TGgMrYOuNr1f5J8tJnDE0tru1ZhhfsWjyCO5UC7hshCJ
	t+k4KUO++IBeDHIhkGMBUqm8144AqjLE5neSnBCLGIPdc3Irxmguz8gU25n+Ou6P
	1sl8AEUOlI+mFEEOhiNljqdAIEU10CVMHUdQ7KyHz25qOv7wFxM9sgp7YwqdBHTV
	7y6rgnpE4qTv+QCon/Xga0ewRw5a+DCTLOX0LyhlUDxKDQe7wjDh2NjZTuOrZ4mf
	2BvFgJt50yyLfgGX6zpb8O0SFTVLs1f0lC5EWht3OszoO01SmMH6qg72skmw0oGg
	rAw9msNuBgcjwfKs/YSig==
X-ME-Sender: <xms:cAzYZ6IEaDk_YIz161E15CM-WJd2y_meYQK3-MrNnJbEY4Os28sWHw>
    <xme:cAzYZyKhwe7iaAKTKRGCt69c4HKf814QerbN5UH1tu0brHj4tCZuqtYF6urqGUvXF
    AUgmvohc3DDB7UMMLg>
X-ME-Received: <xmr:cAzYZ6t_7p044PFZOSnGdX-W6PKfFezkNyxjOFiX5b3E_eUSBOn0Cg6B75dvQMf8ZnvBfOYhpyiB_cVrNspYLkCjSjJAmPfC6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhm
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
X-ME-Proxy: <xmx:cAzYZ_Zpx8XsbioYo0wq1QUjq0WEa8jjEk5wizFymZneN8EdSZpw-A>
    <xmx:cAzYZxbmJp6MuA0J0ePYB4rHr0FlHr-0q_Ci-EMbSUD_LVlf5YPGBg>
    <xmx:cAzYZ7BXdvo_lGifRPsrxTioXchDcFmG8Cxf_847AxXYr78I6uwgsA>
    <xmx:cAzYZ3YHCeBqQwl64huwX27CD4DEP3Y0mLXcSax2CsT3O-nKBdAz2g>
    <xmx:cAzYZ1oUdQdwrNbEpwOs10wC4kJpVi7g-rzARqMINbVAE4Bx8he7oAim>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 07:50:07 -0400 (EDT)
Date: Mon, 17 Mar 2025 12:50:06 +0100
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
Message-ID: <20250317115006.GB868399@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-furry-independent-clam-33db01@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317-furry-independent-clam-33db01@krzk-bin>

On 2025-03-17 12:33:07 +0100, Krzysztof Kozlowski wrote:
> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas Söderlund wrote:
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
> 
> Another point, this will spawn bunch of warnings for no real reason.
> Just drop all the xxx-names from properties and from here.

I'm sorry maybe I'm missing something, but if I drop them from 
properties how can I add checks to makesure the names are either "cs" or 
"core"?

> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Niklas Söderlund

