Return-Path: <linux-media+bounces-29575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E2A7F428
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 07:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A257173A77
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB13204583;
	Tue,  8 Apr 2025 05:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Pq4sp7BE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UtweT6Hi"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC0E188587
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 05:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090284; cv=none; b=twCWGo+kpjZkoNbcPSN2m5MgeE1T3pVjVXm0PIFltW/Jr6muyAb4RRpjDKmqvJc+JhKeAAUgbbTMpekvqPTO81UVtzpt+R/umj1cFXphldKsJtrzIzZyB9TdHJtFrWXatt+Fa+5bj3+M8lqXq9HvIngAxcfAgWJ0zYwWCx8sIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090284; c=relaxed/simple;
	bh=23L0OtVZSIOtKaSiMfUEPnEXxROSB88X8cKWP8/xjdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPtyqdRSV7THk5GUqawJk6++Yx3iqfFrSjCbNeml/PTLGDmB8+Y471XomHA++H1rGtZf2/wVoVWU+qHf2fYkSBuETItlFyEdkbW7RUWaZCSjxECB7rTYgDb0vGQZ9uxfI00AWGHX0h0Jz74x2i3Oxzik75EskrBmqGqUSVIpTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Pq4sp7BE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UtweT6Hi; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id ACD3013800DC;
	Tue,  8 Apr 2025 01:31:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 08 Apr 2025 01:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744090278;
	 x=1744176678; bh=s2JgpUWybszUKKzoYZUcXJfBulmKrzd4sthQgJn43us=; b=
	Pq4sp7BERVig3VZYCB+AG5adjt2jpDVq+ea/CM4iHnscGIlDnRF1ITNPesKq606V
	h5O9KnPeUDRSs7isATJiTSUhbYp3xl306SKjqPhhIveFtQrlsdgnB/Op0DOXS562
	let/MgsYJXBD490+3AI0KGhz9FqXHKmVj0k6ud+OhQUT76atOU8KN4htjt0m9xWm
	6VZrL2kBfPwAhsBbxXLMyKzUKL869VgFtkpGeRQY5lwgnKoQ2eHh4ngOckCV73FD
	+bp3zUUAPTHQQG3vmFekHVVDU4I36BiKj7XtrCijUH2Es5HsWixedGv0LbiRE93c
	T2CeBuT1VUw5YTsMSU8P9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744090278; x=
	1744176678; bh=s2JgpUWybszUKKzoYZUcXJfBulmKrzd4sthQgJn43us=; b=U
	tweT6Hii15/4T3TnY4FEyHA9iYq19c/pjcr2cbfp27m4INxGMZ3uTYPN3Ryv/wjB
	XbIFIme+Hx3DMDhPYvF/H206DQ/kBxut7uUwAd8JvrsKlqN6LqRfMOaT5Tat9Kya
	P4SCXPEgNOjCItquyBvR0aO7V9kfzCFvF4aXctMb9JVLkKeU0lnVCVzwp6RriAwS
	b0R2U0eoouoOrzHZ3HeHhXmwfEZu8l7p6gp+IAsHm84plnxjhcrPpCf5vq2QgHo8
	vlwcWFIUu8LLklyU5t2E7ziM6gRc11FYY4d29dZ/L8SQ+EXl/S1B/6nQUTpQzaDy
	Fdtv9IaChJaJq9pN52ZEQ==
X-ME-Sender: <xms:prT0Z9IzY1FFsSA_lk6_dXlC7B5iZY2yteRR888ZCyOuqOukAiZ0mw>
    <xme:prT0Z5LYWfE2TfaTe2emXREN9QtOzZHdUED3JDU1T7OO49bKiL5j1zxKmEULDnn4p
    nIpkId8EXt3DGif428>
X-ME-Received: <xmr:prT0Z1u6zLUPh14yL_MvcHWb8ys0rczGMRt4UpY3toWIC-XF21bBROQxjFnjrcl1JOJOA6_b0nKAfQ-8Oui5vgtfp79mooa9Sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedu
    hedtkeefjeetffehteegtefflefgudeuhffggeegieetffdtvefhjedthfefudenucffoh
    hmrghinhepvghmsggvugguvgguqdhrvggtihhpvghsrdhorhhgpdhkvghrnhgvlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnih
    hklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphht
    thhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlrghurhgvnhhtrdhpih
    hntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhisggt
    rghmvghrrgdquggvvhgvlheslhhishhtshdrlhhisggtrghmvghrrgdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhivghrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:prT0Z-aGYFKvOqIFpNAGATpzYQbruHU6eUe3bZ2RzNLf2-l52k-AIw>
    <xmx:prT0Z0bYl9iYP_Veq46JY34fxLbGxTpuJ2rT5pn-7qDnYWG0Euay8w>
    <xmx:prT0ZyCWZDrN7fQtI_ensNPIslXFNJGFjVeqFrzFyPw_WeEI2JhsgA>
    <xmx:prT0ZyY90tMkDffMyQvWziUvOaAQjqkND__nPSxjDnoL1rUt6HoQAA>
    <xmx:prT0ZwLm3jbvf2mkWflSFVgqL5dSPLw2TCK1tTb21GzobRQg-1vdjiUc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Apr 2025 01:31:17 -0400 (EDT)
Date: Tue, 8 Apr 2025 07:31:14 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250408053114.GA3734987@ragnatech.se>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>

Hi,

On 2025-03-25 12:27:50 +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> Another year, another libcamera workshop. After the previous editions in
> Paris, Brussels and Vienna, we will organize the next workshop in Nice
> on Friday the 16th of May. The event will be hosted by Embedded Recipes
> ([1]) as part of their workshops day ([2]).
> 
> This year, our workshop will be colocated with the Pipewire workshop on
> the same day and at the same venue (but a different room), to facilitate
> discussions about topics that span libcamera and Pipewire. The Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 13th ([3]).
> 
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> in the next few weeks after receiving topic proposals. If registrations
> exceed our capacity, priority will be given based on topic submissions.

If there are still seats available I would like to attend.

> 
> The event will be free of charge for attendees.
> 
> [1] https://embedded-recipes.org/2025/
> [2] https://embedded-recipes.org/2025/workshops/
> [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

