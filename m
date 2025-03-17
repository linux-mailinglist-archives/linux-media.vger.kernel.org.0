Return-Path: <linux-media+bounces-28370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8036A655DA
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 16:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE3C189988D
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 15:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D714B24886D;
	Mon, 17 Mar 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Xa47/526";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rnmvc02n"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A5C8EB;
	Mon, 17 Mar 2025 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225853; cv=none; b=HxgA2OxcDbTJSDnDVISZXz9bOstqXs7r0hIN0e1jec2X8or505jIgHL/4RoGV4yKGug5R5euj+7UAqf/K/f29EBwaPC4HnRNIAlTsmefz3d4uWpKHDMFqF9WhexTKLU1kVdrlF5xOoFsQ2sDpjBsHeVacEp24nHoGFQq0n8UjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225853; c=relaxed/simple;
	bh=ePsbbPzTGTEu9ReUa4nADwB4J6virDQwQMNaocmwkj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dL9kYGt7SAV9rQDj5jjE25du37tRRCQhvjONtYzjjjob8WGIhLiEurfewjAdGpjeKvPjAtuNdf5muP+lLztwShqwMZaeCk4JK0Bh7+sl6G/HkL9m5rtVSieXkkddV+YgpUutgXa2Zd9qaxi6NbvWrLUPZiXibqTnCG5Ll6PWFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Xa47/526; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rnmvc02n; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C80DA25400AB;
	Mon, 17 Mar 2025 11:37:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 17 Mar 2025 11:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742225849;
	 x=1742312249; bh=OC7b8F1JGGiZv+V/7RdNM0w3+neIkrXwDsDaNmkNc9A=; b=
	Xa47/526KbJXGhW5wK29mBIeDPqEguubGKlGHhc89pZ/8WbempXqliWMFpO5r1bk
	zGMDmOIlkDHM9q+G339sIQUavhozh6gWzZsIs6LC1Ns00EVH1UXLQ4u6vnvUp9kF
	X1HwapnxkmH7rR0zYzPI7gvuEYrJ1A3LM7KyQV/ZYUxdDmxW5FYdwjVwHcGphoVu
	KnHbmKbcDO6pr8cfbXiSl7DgVl5N8H9rMLlpPlqK0f5xY6Q8fEKKOF7R4hajdncs
	CEHsowcU3K6lGefFDZ0Jw2JP3rUeZHlMT+0cmRNXBTHJe5chIOCrR4bm7N7KwLWH
	QpzfTA8C3ACWIUJBrX/Wsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742225849; x=
	1742312249; bh=OC7b8F1JGGiZv+V/7RdNM0w3+neIkrXwDsDaNmkNc9A=; b=R
	nmvc02nRlnhGEQLsOafOORUQQlG+g86TiJcbylyqI8+qCy0U76ZjYjEax0J08Lyp
	8WVNSSGOpM3J9u3LroVtpnBRf1zFSaPmuP9E84dPADRV6F86cIwmobcU6gSJxg3b
	mHyKKtwrg5vbWFonJD42/CYYbaZY5znZTXB53A/Si8jzMrPoRYbZAytXlbZ5XWzl
	WyNrtfJy+FVAEm2lUYBrw8c1BXf78v5aVtZLjrXSS6j+Y56oKlfBP2tBrmGGWqJ8
	vk0kFnPaheaO9yImYLEWxos/tHMM91i2jkHLedRAZLdXVTLWwsND8NZFUkr/tDmh
	ZL/xiWuwNMcHsvXuTbsxA==
X-ME-Sender: <xms:uUHYZ1Ma-88yeSnzBSupvRHtQv9YUmbT_4Sl8qW3pjIWCgBEbtak2Q>
    <xme:uUHYZ3_jCq7Ejdc5Mq5mOXoGzwaub3ARuyONTDaNJzeporZHktAm74-JbCtfnyGlx
    mF1v1d2Pe9538-e5fg>
X-ME-Received: <xmr:uUHYZ0RPe7VtWyYoFbHdpJJitRR4PB9goRpbFb9qRfQx0z3NXn3RGe0zfrgtRu_z3PoNEgxiE44iOCSjcRQTythaLf_HyIwaAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:uUHYZxtES14AKDcTxsrb7PxkEUWVmtc90w97Q6BuSEz8H8GXKo61OQ>
    <xmx:uUHYZ9cFZDQDz0JSYghhoe6HaGBZX1NWduxZTA_wftjg-QY3ZS0WBw>
    <xmx:uUHYZ91C8IDxUK-3lvZsa6e2Ft5DmhD4sp6bAX97YBo0qTPbM-G4cw>
    <xmx:uUHYZ5-XuH40KpzbigClXgzy3XJ3vKi0mJc_RHOP_xeqNb_0RebJdQ>
    <xmx:uUHYZw8TR-8Nqhcxs_ib4KGu1gPQjf958upPafq650W_oPigeqjGxQIZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 11:37:28 -0400 (EDT)
Date: Mon, 17 Mar 2025 16:37:26 +0100
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
Message-ID: <20250317153726.GC919085@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-furry-independent-clam-33db01@krzk-bin>
 <20250317115006.GB868399@ragnatech.se>
 <5876368b-1549-4ce0-af43-80f712f457c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5876368b-1549-4ce0-af43-80f712f457c8@kernel.org>

On 2025-03-17 15:57:31 +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 12:50, Niklas Söderlund wrote:
> > On 2025-03-17 12:33:07 +0100, Krzysztof Kozlowski wrote:
> >> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas Söderlund wrote:
> >>>    ports:
> >>>      $ref: /schemas/graph.yaml#/properties/ports
> >>> @@ -103,10 +138,14 @@ properties:
> >>>  required:
> >>>    - compatible
> >>>    - reg
> >>> +  - reg-names
> >>>    - interrupts
> >>> +  - interrupt-names
> >>>    - clocks
> >>> +  - clock-names
> >>>    - power-domains
> >>>    - resets
> >>> +  - reset-names
> >>
> >> Another point, this will spawn bunch of warnings for no real reason.
> >> Just drop all the xxx-names from properties and from here.
> > 
> > I'm sorry maybe I'm missing something, but if I drop them from 
> > properties how can I add checks to makesure the names are either "cs" or 
> 
> Why do you need to check for the names? There will be no names, so
> nothing to check for.

Ahh I see. But I would like to have names if possible.

The driver is backward compatible with the old bindings, and going 
forward we have better bindings with names. All users are updated in the 
next commits in this series so the warnings will go way rather quickly.

> > "core"?
> 
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

