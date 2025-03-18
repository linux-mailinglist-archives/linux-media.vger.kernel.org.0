Return-Path: <linux-media+bounces-28395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461FA66CF1
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59C2C3B25C9
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 07:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9385C1F8726;
	Tue, 18 Mar 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GvlFd/xw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="msULrlwh"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196491F099B;
	Tue, 18 Mar 2025 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284603; cv=none; b=sc8puWm31Hmog/1qc3zOKjlpLDC8rOnXzE6xgsSNa+9UUIleJrF67vjxG1hnyl01vgVkmgMxYZmYipxhOxGHaJ8fuHNLRFopF+DXRu9Ws9bUVHvu5frHqoH/LzxOdhznDLYNn8Fh+QZArbwhF3/5D2e+JxgEo/Eg2cOEOQpNrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284603; c=relaxed/simple;
	bh=Qu0RxwTmriHLLmZj5Sr5BuDOlZkn9hsztkpv5rF4si8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4LHDrlRT5RewV4K/7is+c833Xn/x+s0H9kX6VTS5efedP7vyFxXKR1XhNfhwtnIe2f0BmPSjKbYMxR8JVuRXTn+MCNEGK9emCh43JygfhWTRi0h2yvkP4iASDUPUyL7ng36UsnQVN4mxE/GxVP2Mwr6VAoEd45Cj96lNHXmXpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GvlFd/xw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=msULrlwh; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id C59C3114013C;
	Tue, 18 Mar 2025 03:56:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 18 Mar 2025 03:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742284599;
	 x=1742370999; bh=9j8dDv/hXRVUaalp75TjOwyV79uRIC8GpbaNmL/HwZ0=; b=
	GvlFd/xwHB1KpnmoZbBlcoin/bCXTOhIv5qJu42Jze0ZkCuu1aLym0sQVPKevPL8
	tAVJnByhpqDfN1irgb9segS2o9BpG/KYZZsfw4/96Oa1BL+nouDRg7N4JG9xhIcw
	7BwcJB7IhRqxAZkcAHxjEPXtPzEks3PtOxwOKRFiGWjbkRmhgVUYpgaSX7M480hV
	FrurmipGCSe188+RQi+IIIZ7gfdUL+Z7fpQUafjH7PC6vXkDQU+pFqSJsVjz0v6i
	qo/LunLd9SHrwtyDdDRs4BbePBPrk7g1Zx0KaU5u961mFmYX3r05CW0xiwVy4vi9
	Lkf12KqFHmpTdGmMBteo5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742284599; x=
	1742370999; bh=9j8dDv/hXRVUaalp75TjOwyV79uRIC8GpbaNmL/HwZ0=; b=m
	sULrlwhucdWrB7WRGF+3/X9h0uWEOPq4N9F8Bc5vCGKkBxMVj+ftoYlQBsD1oPE/
	zzGY8ovpmYvvnpwO1vvFpW5VPzsxCo8+czj8be7TFaFcnp1ns+eTvn50228KK9ZZ
	tkGX7gDa6ItEN13rTc5NwUt1gFQccJ9vVuk8r0MRhOfRIu8GBx7HNj+CEOlLGOEL
	aamp67MUIb1/R32bw+sw6cQPOY3DA3O7IQVnW9YEHLuqzcgFaIJrtBVxexqxMetc
	AcufdwxRsqZQh/p/3ZcJV1CPvUWvqa1m3hZkIZNE5BJAbs17NkSeol+NyiI+egM0
	ZwRXyHoQBCv/6dEhkRH/g==
X-ME-Sender: <xms:NyfZZ8UOX6JUSp-8kVs8ir4spHzPhfXDYOG5l6LhqbOtIfEJ5SgW3A>
    <xme:NyfZZwlkUEUwmv5A9cI2tFW0QSFoUg1cbSLaDqKbxCNPwlKmdJam-XOhQ7CIJ_4Je
    HlmkdAVcjQgD390OKA>
X-ME-Received: <xmr:NyfZZwYGx7peK-QJoLZHr_PA62gPeUcjmI9OW_qR6o8ABgSTQwMOXJut_mCx7F2tsmE8SjnmGH1iuCAvvitxkZGDM0SFE__bSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedukeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuh
    igqdhmieekkhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrh
    drsggvpdhrtghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnhhlpdhrtghpthht
    ohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:NyfZZ7Vgklz3jQ5hhiLAx6HsSql96NbiL1o8HUqW-DmkM1xIYS0T1A>
    <xmx:NyfZZ2mPVUYM4SaW7SzcWRxLzluXF08WaqQI4dl8mSNUPectYyVrAA>
    <xmx:NyfZZwcC-ZTkdr7RUCiL7Wc1i5S5hg3M7aEjFwoqFGOj-Jg-yZHAiw>
    <xmx:NyfZZ4G46YioT8OV3inXqH7gt4JdgN3iHX4W-ej-t7iCy9uXV6XMtA>
    <xmx:NyfZZ7_5FOywupFZCPDuDRN9kznIwarLsdNMT51ole0w7F11tjjJVZg->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Mar 2025 03:56:38 -0400 (EDT)
Date: Tue, 18 Mar 2025 08:56:36 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <20250318075636.GC949127@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-furry-independent-clam-33db01@krzk-bin>
 <20250317115006.GB868399@ragnatech.se>
 <5876368b-1549-4ce0-af43-80f712f457c8@kernel.org>
 <20250317153726.GC919085@ragnatech.se>
 <CAMuHMdXU4JxDe-L+UcUwzndariz=mfed7UyVXW2Mv0yggXZw4w@mail.gmail.com>
 <20250317194419.GB949127@ragnatech.se>
 <200a47e6-3898-428d-88fd-aa4f87db656e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200a47e6-3898-428d-88fd-aa4f87db656e@kernel.org>

On 2025-03-18 08:29:17 +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 20:44, Niklas Söderlund wrote:
> >>> Ahh I see. But I would like to have names if possible.
> >>>
> >>> The driver is backward compatible with the old bindings, and going
> >>> forward we have better bindings with names. All users are updated in the
> >>> next commits in this series so the warnings will go way rather quickly.
> >>
> >> Note that the driver does not _have_ to obtain the "cs" clock by name,
> >> as it will always be the first clock anyway ("make dtbs_check" will
> >> sort-of enforce that).  So you can simplify the code by obtaining
> >> the first clock without specifying a name, and the second (optional)
> >> clock with a name.
> > 
> > I understand that, and for this fix this would be acceptable. I'm just 
> > trying to think a head, something I should have done when first writing 
> > these bindings...
> > 
> > I'm fearing a scenario where we will need to add a 3rd reg region or 
> > clock. I don't think we will need that for the compatible values we have 
> 
> Bindings should be complete, so add 3rd clock now.
> 
> If you need to add it later, what's the problem? The position or order
> is strictly fixed, so at 3rd place you will always have new foo-clock.

I agree, bindings should be complete. But it's hard to create complete 
bindings from incomplete documentation. There is no 3rd clock or memory 
region that can be added now, at lest not one in the documentation I 
have access too. I was only trying to make the point that I do want to 
add *-names properties now and not only depend on argument position.

Sorry if I have misunderstood you.

> 
> > here, but then I never though we get the documentation that now allows 
> > us to describe the second region...
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

