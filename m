Return-Path: <linux-media+bounces-17753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F1F96F122
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9297B2870FB
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B117E1C9DDB;
	Fri,  6 Sep 2024 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CPI6bKqj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RLImi0KR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4515530C
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725617692; cv=none; b=uvl/SBTbvxnQA3W2Hc0qiqI3+6nTTV3ayEkHI8XL6Tyallk3mrjchjVvn32qGKY/eDsQiOECsOeGithji5fjnmLpAiBonbGUXFTIxsWywvaF4Ic/RmcSKlJWpbJgF5D59MA0FbZWNYYtIrz8+CQeHkaS8ODMw5QEkh6EGk/p38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725617692; c=relaxed/simple;
	bh=z9/Z7a8lrg8rl8XonX1CvoqcmhggY/mmYW6gEys1JMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHuIQ1U5nCMq2Z18qwbGdbDjoIY6DVxPrrpmv7p25NAkyb3QMlgDE5LN/twn6Ic8ZUakqHMs2qqZnjTxqWTgFt1FuXdzjp1hX4j8xNwzWPWSDQZrJvyXtCorRGE6QN7qn9sCW7qfUxjbW00DLe+JoypU05zCeiNXnArUfwx/fJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CPI6bKqj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RLImi0KR; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 2154513803B9;
	Fri,  6 Sep 2024 06:14:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 06 Sep 2024 06:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725617689;
	 x=1725704089; bh=yw/HyJ3ljAnDTPvI2/DKTBf7wyhieyg7wMJl6Fyi8ZI=; b=
	CPI6bKqjNbFRr5IaXhUaBiMZygujV5S503uB3nozA00qgSWv8z6j0xd680j03MU2
	wP7fGvQq4uSl0nePK9iAnpJyuWyx3+rAN/ynKWGGq2mpQiVibJI/RinkwjCvlS0u
	QyAfM4eyABu3fbt2iuK6kspb1K0ESs63vP7qNmydf04pjPIhjql+a94lgFJ3TNW4
	uL2NCWM/d+lD4hLUx88JnQLB/dMR+nNGlFfjP3B6FDL90LZFR4M3NDXLnttMv4fX
	mHTQSylrbWxDDmZXqlSj7vOSEZoPN573vyc1s1Mvlxh9kL4VYrXrEFwaJI8d3XLq
	8vnGJO5pl6jd75K9TI666g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725617689; x=
	1725704089; bh=yw/HyJ3ljAnDTPvI2/DKTBf7wyhieyg7wMJl6Fyi8ZI=; b=R
	LImi0KRBveBNR0Co/q1EyrIPAzfpn62C/9XLKu81B5b8QKlREtv0+6XXfE2HpC72
	Q9tpwpZvEIALcs6dC48YEfbgPbzbbT7MUqh06j5FOPEFFiuNv5SVGB8z0utjIYzM
	2HtJ1VZ8JbxqaIjNYB6qHmTCmZd1/8SWJMHVX7OCakdfpXfCFRgacYhwqTvOenAz
	EuwNTu8os1mmimzIi1/flPgDcoVLu5Zc6hGBDMCoUBjpuo9uW81rqw/r9t448Ro+
	42hW1vZG7fN8p0lj8430zPnBuwZsdY6ZzCmw2uErTiJh1DnQbNf0IDRK4NoxECmv
	ijMw02509iOYiIodBezmw==
X-ME-Sender: <xms:GNbaZgbGXZplBgxIm6_gmSYAkfv6rNbEy7dhkdS9OpUiWtYUBZFQ7w>
    <xme:GNbaZrbQVANnuzervUv15GI02jtfcNkLZxEpgJPHT7IF30OqPTFO31hrjqlUmftE2
    nnfymJlSnFUpm6f1qk>
X-ME-Received: <xmr:GNbaZq-5yNEhiy84WYCk2Cie0OVkuTPtJRgn7DyFDwaWR2eEHF55ENlMZDBiBwqdwbRydjrlUGtcnMU563Ivmow3C3mQ5ehxTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdeg
    feevfefguedtveevlefgleekuedvfeeggfefheefieejhedulefhjeekgfenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtg
    hhrdhsvgdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:GdbaZqq1gd2RUtk7kJ8qrVUY50vaj93JXZjXn09KOmT-4s3er9zg4g>
    <xmx:GdbaZrrZbPp-aw7o90A0FUADZwT2qau6-pAMpuDfU2ITsP04jiXKQA>
    <xmx:GdbaZoRsVPBHwr4t5BacpMLbq19nFQkMkQqV2ulKzPr60zEZvnUsNw>
    <xmx:GdbaZrpdviE7YSXlrI1bmpQgQAmYPcvoQdH0-oxhemsL5ZA9FDn28g>
    <xmx:GdbaZi2k753Ng439_sI9fiZv6Z0jmJX6EVrzZl9Pyjg9Lzr9Wzc615wy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 06:14:48 -0400 (EDT)
Date: Fri, 6 Sep 2024 12:14:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: Race in rcar-v4l2.c
Message-ID: <20240906101446.GS3708622@fsdn.se>
References: <af3f0b7c-d184-4b2e-bb75-6349ef32e4c3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af3f0b7c-d184-4b2e-bb75-6349ef32e4c3@ideasonboard.com>

Hi Tomi,

Thanks for your report.

I have an on-going series trying to clean this all up [1]. The one 
change in the v4l-async core I proposed was however rejected and I have 
yet to circle back to figure out a different solution.

Could you give it a try and see if it also solves this issue?

1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async
   https://lore.kernel.org/linux-renesas-soc/20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se/

On 2024-09-06 12:57:50 +0300, Tomi Valkeinen wrote:
> Hi Niklas,
> 
> There seems to be a race in rcar-v4l2.c, causing
> WARN_ON(entity->use_count < 0) in pipeline_pm_power_one().
> 
> If my understanding is correct, the VIN v4l2 nodes are being created
> (rvin_v4l2_register), meaning they are userspace accessible, but the media
> pipeline as a whole is not ready yet (e.g. media links).
> 
> So what happens is that after some video nodes have been created, the
> userspace opens them (I think it's udevd checking the new device nodes),
> causing rvin_open(). rvin_open() goes through the media graph and does some
> PM enabling (I'm not familiar with the legacy v4l2_pipeline_pm_get()).
> However, as the links are not there, it doesn't really enable much at all.
> 
> Then the driver goes forward and finishes with the media graph.
> 
> Then the userspace closes the opened video nodes, rvin_release() gets called
> and it goes through the media graph, which now contains all the entities,
> and powers them down. As the entities were never powered up, we hit the
> use_count warning.
> 
> This happens quite often to me when loading the modules, but I think it can
> be made to happen more often by adding msleep(1000) to the beginning of
> rvin_release(), thus ensuring that the graph setup is finished before the
> rvin_release() proceeds (and hoping that the graph setup was not ready when
> rvin_open() was called).
> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

