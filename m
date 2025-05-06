Return-Path: <linux-media+bounces-31868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C9AACC52
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 19:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A871B6350B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 17:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40814280CE5;
	Tue,  6 May 2025 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="yJ/bWfXd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gucv1YgT"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B76426FA5F;
	Tue,  6 May 2025 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553060; cv=none; b=NVwROsn9i/E4iCOZxYAM0sZCuRu2reuDIobT2yKRpsx/AJ9gnHAFRXGhQ69f3E7BPi7Ak+7B90Kv67u679ZOqcr1fwzNEW7ySIuHgeO6UQUjH/pgvGMOpz+hruxOTM9oRvdJfj8HDMgEhwnB1aEoE3El2Tx/w8rKZDF4t1cxldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553060; c=relaxed/simple;
	bh=ogEi7hS+D8hJNDV8/MhfDluo16Ght+yObn2mXYFoCBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRZDORkFB3lBqLi6lpV73IYFDxjBNEYp3bNp+Aqp8emscKf0M9XYGVavSrnrRSkU3+OEZJ2iLmjJ0qivwzHhSfieEDQqod7ymIzjDRpwQJVDjkxxdktnsmNVceZQWSg7XAaQvSUnGgPC2FRYnu0WKmCdIsa8e97sUrfe0ttI0fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=yJ/bWfXd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gucv1YgT; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 183D71140077;
	Tue,  6 May 2025 13:37:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 06 May 2025 13:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746553056;
	 x=1746639456; bh=dfn55ae+5Ovjzk48ambF6pveBrS5hPk8vNl9p4weUNc=; b=
	yJ/bWfXdo7HY27t0w7Got1yMwYdwRDpw55iL1BEm/5XK6yqhsCYrzlGEWDJBQb7c
	G30p/Zu9UPcvsIfStNL4to9L4cIBw7uk5Ai9kREq9ED5I4T/BUCbtfOAb8bXAchM
	b63YGNLzHX2J2FDmsse46xWTBRC4YBJRpsacjZBDUocGC7OlLSUpTuvJXvvPIlY0
	rJ8dIX5QI37NlMu+Fb2BkA61ZqqCprNvGZ8ByAEKFKQzYVT69yjBRhan5G/pvHAq
	wFbHDgZFnZRJ+PVdTEtDs5tb0a0JmTSCMD2VzijZzU+y3E0hn/Rny3kL03kj/DJP
	c+wNL1KcNYALmy2PoQrryQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746553056; x=
	1746639456; bh=dfn55ae+5Ovjzk48ambF6pveBrS5hPk8vNl9p4weUNc=; b=G
	ucv1YgTqWhgvPyI5Ny/X/WFGcQGfoSIzHM6YeJ86+tn+4oDbylNc7h+FP4vpTQDe
	hfEEXs4XdFISotSE3ed2X1eH1URrkqEy8ozGzUUAyfFtmMzp06ci6L29hX5ezD6u
	cQh6RXmWoEgv8d4/CSGRM9yEpdpnj6MArr3U14XtEGVllJSrJZ1teUTeHzPDbJG3
	OoWtL081H9ucvpPwFeORY5JepJyZ8klR1fDA2pzrBQrOh3pxFxRr0/U0aeVC82td
	a5jZFbLsRSFSIzEHzyoUXXHfcoyYl7bXtrw73kpQuA37+hHyX8M1J/xJZxP37pGZ
	xTrAKQdj/f8cid7v/RsIQ==
X-ME-Sender: <xms:30gaaEwY-0XbSw8rikSLNbtBaWIzmyKogU5c7s8C89l0uoGNVHdMnQ>
    <xme:30gaaIS8w_m5VeLbr4Bxa3G8YdXrcKZsWiAwwP8evZ8MmX_jglVIe9CJxtyGy_r7g
    CW9oWkIfqOLuv36rFg>
X-ME-Received: <xmr:30gaaGU0xmy-gKvD00B_9XJb-N1ORef7-aV5zqL7Aw1DF5ZBFLAQLUw6kkq6Ofxt2BIKN79IgFS2WGqtgPcQJTfPV8bBnWKn_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehkihgvrhgrnhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:30gaaCh5dovRQq07Wi3fASHyMDLyQP5zD6HPXfn6yHsdrujKGJACWg>
    <xmx:30gaaGBKb29-ZLXbH6L1Lp_mjr1AlitEkqkk607MLHk9GAIu5bo1vw>
    <xmx:30gaaDKHm8CaN-C9mMOmCykS3CEFOVF-AWG8i2S6E4-F6uXPe_OUNw>
    <xmx:30gaaNANZS7LJCr_WfarK5_nSiMDV8E4JoZ1xzIuAvqmX07CuxBEJw>
    <xmx:4EgaaAyYrgVla9Qh4lxFO0noqUuzNv4OIgwmOtKUFlKZFgsUL4uEBrOy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 13:37:35 -0400 (EDT)
Date: Tue, 6 May 2025 19:37:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9] media: vsp1: Add VSPX support
Message-ID: <20250506173733.GA539397@ragnatech.se>
References: <20250506-b4-vspx-v9-1-d7d50a01f7b6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506-b4-vspx-v9-1-d7d50a01f7b6@ideasonboard.com>

Hi Jacopo,

Thanks for this new version!

I will give this a good testing as soon as I have finished some 
refactoring of the user of this. I had a comment I wanted to send for 
v8, but seems I never did. So for now I will just post this incase you 
need to do a v10 before I had time.

On 2025-05-06 18:32:23 +0200, Jacopo Mondi wrote:

.. snip ..

> +struct vsp1_dl_list;
> +struct vsp1_isp_job_desc {
> +	struct {
> +		unsigned int pairs;
> +		dma_addr_t mem;
> +	} config;
> +	struct {
> +		struct v4l2_format fmt;

I'm very happy to see this is now the only location for the format, nice 
work! I wonder if we shall take it one step further and just record the 
fourcc, width, height and bytesperline here? Or at switch to a 
v4l2_pix_format struct?

The user of this field do not really support multi plane formats, nor do 
it validate fmt.type field.

I recently hit a snag in the ISP driver using this interface where I 
*think* the solution is to only allow single plane buffers to be used as 
input to the ISP (V4L2_CAP_VIDEO_OUTPUT_MPLANE vs 
V4L2_CAP_VIDEO_OUTPUT). While fixing the plumbing for this I ran across 
this, sorry for not noticing before.

> +		dma_addr_t mem;
> +	} img;
> +	struct vsp1_dl_list *dl;
> +};


-- 
Kind Regards,
Niklas Söderlund

