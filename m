Return-Path: <linux-media+bounces-32270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C7AB3224
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9166E17A97F
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D6259C9F;
	Mon, 12 May 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SZ/ros5q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G4AYecCo"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0824EF91;
	Mon, 12 May 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039730; cv=none; b=jN/XC8pVnhlPdN7V3DWpLU1t8gCkc1OkzNXJJV3P+nXtsXX1dF76smr3jknwDKZniI+so5wUWCwySsRKDlndTGduRPtfpAFBn1jNBsUQLvUbJyAxHA77M+yfl8woybJr8WjU5RKH/hL8+REpnMy3Zsee26/oF4/vvZb0mQ5TXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039730; c=relaxed/simple;
	bh=TohzoVoujj3wMO1syJQsU0HTdp5uSqFMNi4c3YnkYAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZqCKlzKZSSW1XhOAC2ilFS+Qn9xvnhbMEKNdAS7VE5b64N5W2C9aHy29Aq+ssScv/pSTr/NWFINsOEivYA3Wmm8/2/TmfM24LG//wnql5PwelzGp8E5uLV/AdlVw2yHbHf/HYESbsB2qawWIxbvdZIqwpJ+nObVWeT/LlvmkAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SZ/ros5q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G4AYecCo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4087C11400DE;
	Mon, 12 May 2025 04:48:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 12 May 2025 04:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747039727;
	 x=1747126127; bh=WULCfkAwHtfstIJSxGuUyz6cal8DdjdU6QnR2Oc3ZO8=; b=
	SZ/ros5qoewusSx7EovIhw2qsm3AWHttVtHKOypd/ijyzJcfhwdTikLrGNh9Ra2B
	/0fMSOYOuqk00zWK29iBBjzX1IBheEXSemXGTxY0HtMWZSaiMLjgqzdJU3jZccTk
	yw3OiE+6pky6fI5dwcz8xLKCaeR5iGL20y3M9YKuPCwgsMWCVn68DgC3HHYcDY5n
	fnVzp63R1PEjEZ2HNJiw9qeYepZ76ukT2NYsoSUEPi9Ms6eb72aAZLDAT4Tu95wn
	mWLy8mc1eUf01g7sDomtLtfY1QMW9oc7IYQza8YGvhE8PaXhiY3MMWRNFVkxKfni
	k2s1pkLSN4AqrEJhXY1Ofw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747039727; x=
	1747126127; bh=WULCfkAwHtfstIJSxGuUyz6cal8DdjdU6QnR2Oc3ZO8=; b=G
	4AYecCoowub7hP3lwF9PaaXo59rlP9OkUejaFtuMTDbN0twlVNRD35wdk/18CPYd
	T0msMRrX3or3eghk9byKJ3qiCnOcoB0AUwVMQEPQ49SClP//J1a5CS/NexO6W65a
	JWrZJ4hldSHr1aXoLJQOf+LyO3Ydo3W6mJtmkBBgjIFxeDbSJqJLA+SIR8c5c6fq
	HTeqxINZ/A913EAzn4Ztp3lqYTimE2zyqzR3jJ7lWVzXezyzrWCvQpl7YGzl8sT9
	JVAxIk2u0POulY0ZY3m9I+dsHIEX799LO9tiYULQ6WYdG2EthAUKVZYX5XpVxLsI
	Ttdhm13hwwPZs9398f9lw==
X-ME-Sender: <xms:7rUhaEygiFGvOS5a2_zINcfTajhFXKG1JguzTApfZqIaJR40qK3kNw>
    <xme:7rUhaISkNm2Wb5fhp3NaJtftjbRIkagk98t3S3n7D_7Hm4yjKYkCiHOLdlZlum2kP
    wmTKKgu-su-NgUu1lg>
X-ME-Received: <xmr:7rUhaGX8IrEYmYqkqJXQxLcD1Ei6-tF1zlR4CFWAWwET8coYm4h_U3dN7Wp7xjE7zsBok2lnPTNk2Rl19XS9RHIatx4aZVkUdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegrlhhokhdrrg
    drthhifigrrhhisehorhgrtghlvgdrtghomhdprhgtphhtthhopehmtghhvghhrggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7rUhaCihp2K7CZtHu3f_iD8IkvxAiWNjNUr7zbMbhwbDihNr9y5AMg>
    <xmx:7rUhaGBSTRkHsBFAG9WhigAvLz4hhL-xkaIRJoanZEk_9qrltUNzog>
    <xmx:7rUhaDLvVO8xFbI8_jbmA8KHPFJF8xj9y5P1IfH2ZuL2VaeA8zpzRQ>
    <xmx:7rUhaNBVxoamandMRYGWs5YrR_Ecki1Np2nAlr9NA2rTxg38D3FW_w>
    <xmx:77UhaE7-OnrfxsxKoJmQ8euqkCkF2M7sTllfdholHIUm3F0YYQQJJCnL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 04:48:46 -0400 (EDT)
Date: Mon, 12 May 2025 10:48:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ALOK TIWARI <alok.a.tiwari@oracle.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: rcar-csi2: Add D-PHY support for V4H
Message-ID: <20250512084843.GE2365307@ragnatech.se>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
 <10d2ae58-8da8-4802-95be-951d8b376551@oracle.com>
 <20250511200333.GA2365307@ragnatech.se>
 <CAMuHMdUbMRBFV-7hDMQ3-UKAhzfbGM5yZJz05aGAHpOKZ5eKcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUbMRBFV-7hDMQ3-UKAhzfbGM5yZJz05aGAHpOKZ5eKcQ@mail.gmail.com>

On 2025-05-12 09:37:48 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sun, 11 May 2025 at 22:03, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2025-05-12 00:37:09 +0530, ALOK TIWARI wrote:
> > > On 11-05-2025 23:17, Niklas Söderlund wrote:
> > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0404);
> > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x040c);
> > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0414);
> > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x041c);
> 
>  [...]
> 
> > > Instead of manually writing each call, it could use a loop ?
> > >
> > > for (int i = 0x0404; i <= 0x07fc; i += 0x08) {
> > >     rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, i);
> >
> > Unfortunately the values are not all sequential, see the progression
> > 0x061c -> 0x0623 and 0x071c -> 0x0723 for example.
> >
> > > or if values are not strictly sequential, iterating over the array.
> > > static const u16 register_values[]= {0x0404, 0x040c, 0x0414 etc,,}
> > > rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG,
> > > register_values[i]);
> >
> > I agree with you, a array of values would make this look a tad less
> > silly and would reduce the number of lines. I considered this while
> > writing it but opted for this. My reason was as most of the register
> > writes needed to setup the PHY are not documented in the docs I have and
> > I wanted to keep the driver as close to the table of magic values I have
> > to make it easy to compare driver and the limited documentation.
> >
> > I guess it's really a matter of style. I have no real strong opinion, if
> > people think an array would be nicer I have no issue switching to that.
> 
> Have you looked at the impact on kernel size?

That is a good point, I'm sure an array would reduce the kernel size. I 
could possibly even craft a few clever loops to to generate the values 
as they are almost sequential. As these are magic values I had opted to 
keep it close to the docs, but seems people prefere something else. Will 
change this and send new version.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

