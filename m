Return-Path: <linux-media+bounces-17008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23399625CC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F3C1C21FDC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 11:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E55816CD2D;
	Wed, 28 Aug 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nj4hPg8I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B7ExTBe6"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D882916BE3A;
	Wed, 28 Aug 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843858; cv=none; b=nohbqhM7WA7F1WxMXQdenhVwhCZDkhHFiRgdZjSWJxEdyOUTcUF4Z6WvmL6euEgRxUk5VcfQ+ANlWmCM1ZtST0UQDUnbWnI6kutDiPDOHIM+DB3rbq+MEu2jNZkKPRQJAl3ZT0PV0qdpusu53hjRkTdsqcOx/FVDMRrra446ttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843858; c=relaxed/simple;
	bh=nTRvWJgqZ6/EHKfWrmauBXzVGDNVw1+v6YgspqoeBcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUyJPyLau6OhAlybRXFs2zUbZWiUzNspdeRrPTbiL6Lqnjd23bYmvyN2Plf0ATS3/XC7fMYABNMoOYi3Opn9/p62Y0uzSxHSmYO71L/9KTAfIiFjYniCiu61Dxc7GKIBgMumPaF+2Rz5P3GPiy5XY45dOnAk3wO+ZcZ4zs20R7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nj4hPg8I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B7ExTBe6; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 92F4B1151B6A;
	Wed, 28 Aug 2024 07:17:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 28 Aug 2024 07:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724843854;
	 x=1724930254; bh=jMS01jI9CnnK7GbjPdJZhm36vbTQVCLC4OIv0ehgmYo=; b=
	nj4hPg8ITsrNQs+pv2VszREanuFisCdQiKbcbzuRNFBf5s0JCGOf4upWBlK108Gr
	Sx9z1Sd3usKX7nCevva8ivwf47GMt962g/jJmAyF3K+DhV/DEbGQjkMRl8WrRwaA
	UhG5QnTx45GNTfRgY2Ath6UmsA/i6s9VcILTzbX0doj2ybLdeonNl+zhKD4uwthd
	CuDm+h/TCLLIkBiVakSS3pgWtGITBJDjarcgLbXg3fvKRzLkJLfvOMhYbHlsBjsr
	gvnAQ5cfJs63t9911i6npALDJHZgXmUVLLhxh+IB6WcSJ2WVvKxQmMqlj91pIyOT
	X8pPF8Yee91flPhJBO/3Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724843854; x=
	1724930254; bh=jMS01jI9CnnK7GbjPdJZhm36vbTQVCLC4OIv0ehgmYo=; b=B
	7ExTBe6A+tnuNiJM/9QwaAPkDM618xSAP1aQPIBV5VpMPrX6N3dSfg6YBvhY+LLn
	YMoKAsTO3KzFIqqj4wShj0Lw6Om3/p+McRKc9BfLV2hkEEUNuorQE+/MRW05NT/b
	W2glQx6GYNPFI+QK2oRA+5sYUlJIAq9VNmzTgWgBlGi32/yFKUtsuHGZ/UYVr5x6
	IyA9dxRq+eCM6wSSvaUqsbIGIzSdDxAbf0dhCClvl9GZWmoYhPLif9QSicQSI5NQ
	vUhzY/LhX1fYLcCIMZIEICYpU8CDCLmNOnz9cRDtRAPjJHvMiIMnUuIzTFaa1+r7
	5NQ5sSC7pKXo+e31bMf/A==
X-ME-Sender: <xms:TgfPZpm9K1yUVwzwmYx_wM57XKnWTvJiSD-2ZKIJ7f4QmZpkTPyqHw>
    <xme:TgfPZk1M-Ul_TFfTEJZjx8__gU4TRJlxhbWBs-4imPrKmnIHlNS0OwlpVn6uvpR54
    BpWfKeYnbrJ4jVw8o0>
X-ME-Received: <xmr:TgfPZvoCD47734FPxmnhfdlObLXmQ7OBiJi3bkGUxLhKI-6oQiD_EMhb3ULhuiw5OLgaFmmft8fj9IijegZ_or_LpV8TaGBI9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefvddgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehj
    uhhlihgvnhdrmhgrshhsohhtsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepmh
    gthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhi
    nhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrhgvnh
    gvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TgfPZplMbMiynIuFnWZiGz2NfPQnnh8aO14IAK4rKJCN7C2BWlxqaA>
    <xmx:TgfPZn3XPSpeH8xQA2SKesUH0zUPAyAxyzb4QOFB3lqf-LLn5obQlg>
    <xmx:TgfPZouqERo-vC1MpRbqSI9QYLK_Q7-cdvjaA8Zh3_JJ0sHHgjJqkg>
    <xmx:TgfPZrUQgC1Z0acYru9bqlDlN8fBDwE15XZpdRGG03U7wkMLtUW9-Q>
    <xmx:TgfPZhq7V7MGQ_MHXMoTTXj6QUs0gadozu7s0VDrlWSqfNDGEd2j55Oc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Aug 2024 07:17:33 -0400 (EDT)
Date: Wed, 28 Aug 2024 13:17:31 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for MAX96724
Message-ID: <20240828111731.GK2636928@fsdn.se>
References: <20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se>
 <4f3ea360-f17f-4a91-bbdc-08caebb977a7@collabora.com>
 <20240528093750.GA420934@ragnatech.se>
 <0a3c796c-2149-42a3-92d6-d45a0ccc78f0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a3c796c-2149-42a3-92d6-d45a0ccc78f0@collabora.com>

Hello Julien,

Sorry that I missed your later comments before sending out v2.

On 2024-05-28 14:04:03 +0200, Julien Massot wrote:

> > > > diff --git a/drivers/staging/media/max96712/max96712.c 
> > > > b/drivers/staging/media/max96712/max96712.c
> > > > index ea67bcf69c9d..69a0a6a16cf9 100644
> > > > --- a/drivers/staging/media/max96712/max96712.c
> > > > +++ b/drivers/staging/media/max96712/max96712.c
> > > > @@ -17,8 +17,10 @@
> > > >    #include <media/v4l2-subdev.h>
> > > >    #define MAX96712_ID 0x20
> > > > +#define MAX96724_ID 0xA7
> These identifiers seems incorrect
> #define MAX96712_ID 0xA0 (also valid for MAX96712B)
> #define MAX96724_ID 0xA2
> #define MAX96724F_ID 0xA3
> #define MAX96724R_ID 0xA4

> > > > @@ -419,8 +427,15 @@ static int max96712_probe(struct i2c_client 
> > > > *client)
> > > >    	if (priv->gpiod_pwdn)
> > > >    		usleep_range(4000, 5000);
> > > > -	if (max96712_read(priv, 0x4a) != MAX96712_ID)
> > > > +	switch (max96712_read(priv, 0x4a)) {
> 0x4a is a VDDCMP register you should read 0xd instead (DEV_ID)
> switch (max96712_read(priv, 0xd)) {

The datasheet I have for max96712 do unfortunately not document the 0x0d
register.

As Sakari suggested in the review of v2 the usage of device data and 
of_device_get_match_data() to store and fetch device specific 
differences this switch will not be needed. Instead I think I will drop 
trying to read the device id all together, it was left in since early 
development to make sure the driver could talk to the device and then I 
never remove it. Would this be OK for you?

-- 
Kind Regards,
Niklas Söderlund

