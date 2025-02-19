Return-Path: <linux-media+bounces-26399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8689A3C2C7
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 892AD7A2A4E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26351F30BE;
	Wed, 19 Feb 2025 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JiDQbEx9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u/C2NemX"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85C1B983E;
	Wed, 19 Feb 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976987; cv=none; b=B4YpJOyQJjC9yTnJZ0sqX8JYjVHQHz6/+t5wCw4LvW/aiZ84awTEfTgvlwv5FZavABqf70rh46rKXf1SaPfPQitipc038Vx8T/jDXOORSTEDPdUs8+87HJr/sg6IepGxVg+cHoFV65WeQJdq63EdNyi9yIfs6cRgnwSNUoaEjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976987; c=relaxed/simple;
	bh=hR3pO6KTteWkTo9C497TPWT6ySgwTGHJOqundddEj3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRfA98xl6z/YlXjDY83J25cuMZS0C8sDm6cRsmpi6G62gnO56+4xP5w3X90EpsE6npGA/mSMFjNTGfr7rkmt+nK3Pr5CToyBmCZw2yP/pwg0XanM2SKI0oq6Au35pNgqmAwVW3lmTY3kx5JR2ZG7SMQa+Cjx9DoIwoCgZfB+AIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JiDQbEx9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u/C2NemX; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CD293114010E;
	Wed, 19 Feb 2025 09:56:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 19 Feb 2025 09:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739976983;
	 x=1740063383; bh=P6i6jY4QW85OEFrlOLbVW616jftQqlo8JpydnCZnZu4=; b=
	JiDQbEx9Hby5iwPE7St7dyppXw0T9m17PG4IQo7+d1ja5E6kKwrLyM2fkrBZy4pp
	tuyeObVy7REtziyV9BCJOG6KJ+eNpZnJVT0H22KsARf/XzHlQxWLbAt2ZmE8LRbt
	HXgWFyP+CDK69GF2pc37CYBXixJ6oNGzIwXEpqY8lt0i8F/6rjCmVgGY9YHQcYe2
	RiUvesslUpmU/NMb7e+Efun0V14cyVtYpZ+Sp+vsYnCsHcbHEtH4Wu0M3al1dbco
	zbQ+pY2vBYf+SScXMNHI9wLK2UC1ALCyPpn207FjQj+9JuWZpywFRDoqAShmgwLE
	UHkSDhqdBfWfVxqayYU8vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739976983; x=
	1740063383; bh=P6i6jY4QW85OEFrlOLbVW616jftQqlo8JpydnCZnZu4=; b=u
	/C2NemXGDCSG73LZZWkHp1g0uTO3PgRyLFCnxBInzJc92foqZzS44tm3JgWDg2nG
	Oza75t8icnQKSe1zP8gnntVsb5NQ1kbxupxABpkYtwztm+rIY/+EqiXQHGjLDxnQ
	Apj/+6EpaB/O8Sxuz7L8utKzbK3g8jwffGuxAXICLbZgIm8AIvDSMq+tbN8lddnn
	IBiOWzJ60oRKE4yWg4GJU7aAdgcEJFfw6gjoBsElzYY/H5gLipxwXYQo59HXYjTv
	i8oltXkQTL9nnOcYNKDfkgLaQhtprheYrWJU2j9u1XXijCFAPxR/3mamvzCmF+fY
	haYezdUrYb+t5sszeU/Yg==
X-ME-Sender: <xms:F_G1Z-S_tAYD_Jaf2afpRZpM0Q2tAjk4wdgKFf3oHdNeCYBMx6l-9w>
    <xme:F_G1ZzyogiW0j2tqgVyJx1A-NXYsxjiWmMYW3EdBS6oBWPnCp7BwagXWGdQD1Q00v
    39-j9vXHqH-YMa1v8M>
X-ME-Received: <xmr:F_G1Z73hd3JIS3KrdtIwu13rhdUJ9wJuipt_4WDMI1x3MhCS8zc-eSn2DKlTBYO0VhNsQikVqG2djTWlKAIUpbBwy_jx6LQVLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvg
    hhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhushes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghh
    rggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehj
    rggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:F_G1Z6BX-rbQrIA_xv0cquHCLkK6ZeXpjLNf3X8oGwmVNOdoXF61dg>
    <xmx:F_G1Z3jTFJehWNHOGUFYfsYR-7BVSMv3OaVOr93NeRNtpP22OCOlZQ>
    <xmx:F_G1Z2p2Yo2vRj8P4p7AU-FK8WpkIhBVUpoFxEBPi7ALIDJMah3Z9w>
    <xmx:F_G1Z6g4pTEYgm7FF_5M6-cux-MiFNuV9mqV_TCqNx4-5XkAbpyvlw>
    <xmx:F_G1Z2Og1DtaBKxCngzjq0qPmhAa8dqQSHDhkFuyWqGkXx-SRw71C-Qt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Feb 2025 09:56:22 -0500 (EST)
Date: Wed, 19 Feb 2025 15:56:20 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 00/18] media: rcar: Streams support
Message-ID: <20250219145620.GB515486@ragnatech.se>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
 <20250219142256.GA512344@ragnatech.se>
 <f3795f3b-8d38-40cd-abcc-723b18d6dc70@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3795f3b-8d38-40cd-abcc-723b18d6dc70@ideasonboard.com>

On 2025-02-19 16:41:24 +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/02/2025 16:22, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > I'm happy to see this, nice work.
> > 
> > Unfortunately it does not apply to the media-tree. As this series is a
> 
> It should, if you apply the dependencies first. But one of the dependencies
> from you is a bit old and that doesn't apply without some conflicts
> resolved. So... Yes, doesn't apply =).

:-)

> 
> > mix of fixes and new features as well as covering multiple drivers. Do
> > you think it would make sens to break out the fixes per driver which we
> > could review and apply ASAP and the new features which we can review but
> > need to wait until the dependencies are meet?
> 
> Yes. I think that's the RAW8 and RAW10 fixes. However, I can't test them
> without streams and GMSL2, so...

Sure but the fixes for the format setup registers don't depend on 
streams support, right? The fixes are properly tested but depend on new 
features to enable hardware to produce the test environment. It's miles 
better then the BSP testing done when these things where first 
written...

> 
> > If the new features depends on stuff that is hard to upport, maybe just
> > focus on the fixes to get them out of the way?
> > 
> > On 2025-02-19 15:48:54 +0200, Tomi Valkeinen wrote:
> > > Add streams support to Renesas rcar platform driver.
> > > 
> > > The series attempts to keep compatibility with the current upstream.
> > > However, in upstream there's some kind of custom multi-stream support
> > > implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
> > > Simplify rcsi2_calc_mbps()".
> > 
> > I would not worry about breaking the make shift multi-stream, it was
> > based on our first attempt to allow streams for GMSL many years ago and
> > it was bonkers ;-) As long as it don't break a single streams, even from
> > subdevs that do not themself support streams I'm happy.
> 
> Alright. Then you're happy with this series. I hope =). I don't have
> anything to test this with, and only the v4h board.

You can test single stream on V4H using the staging GMSL2 driver and the 
TPG. I will ofc also test it so no need if it's troublesome for you to 
rewire the V4H you have to this configuration.

-- 
Kind Regards,
Niklas Söderlund

