Return-Path: <linux-media+bounces-26391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B4A3C207
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92250170D9F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A6C1EB1B8;
	Wed, 19 Feb 2025 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aZ9FX4v0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ybTO+Bz3"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A51EB5C1;
	Wed, 19 Feb 2025 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974984; cv=none; b=Qn2JLIdZgA591HL0ZENWJ8JtX+CRQbkK1YTIn1/DEC6Oz4j6ZTV30bPI6S0LLw0nRsuDJMbeNJ/55OXNlh052GJxDu1GMXiLS1s6ynPvextGQD0fyFmVDVFt5xTzTKKPeccX2WDPcQyPB/pBe27n5Q9+ARbvXFH3Kk8EU4HKTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974984; c=relaxed/simple;
	bh=GMhxOFVzGI4erLQXgw91divzo6a4uvOVK4Y5gsWBM54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DImGZd5pTd9sIg12UklZBDShTUb2ioUT6jShRmoz5vbtOgNQQWiRMfxE9TrYDA4fnYscX6xQj3H1thgKmCmIK00VeAKJNZ1jnsU4DyHYOBnIVVWc6QvbSW6n8y3eezR72pHeWUTasq1AUZ1I6yX4XRLRA7hgz9qrInCV/M73rf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aZ9FX4v0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ybTO+Bz3; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 27FE61140141;
	Wed, 19 Feb 2025 09:23:00 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 19 Feb 2025 09:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739974979;
	 x=1740061379; bh=tpPmE/RsTpp8jwsCCCg4q49jzsglo558wxYqwyWM3rE=; b=
	aZ9FX4v0ZbaC7HuxE3JEkTbEHor6CKY6a2cPvmRpEoO7+hu5a6DMW7IHtJL8klwO
	Tt7greGz4UHQypPMXAUmJcKuJkjownVJQK1qvRedyD1cMROI4qRi5BtifBEkyK2R
	mnoSZOptDi51Z1MZoZ59rjNneKBZ/9/sHqid8tFKT7DSBMtgEQt1yxP8edam84VC
	8tKcDtDwWrfvY6QqQxiN5i1flb74uO+zDzuDFsf4iT5Ort5pxJWNCcIK/XOLjAW7
	EG9o787PvVmPowGktdotL2U202AyJPFWZdUJQ/vEi9KyTFUmXGi+xScTgWAgus3w
	04dH+DNpr08tatdoUN2FNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739974979; x=
	1740061379; bh=tpPmE/RsTpp8jwsCCCg4q49jzsglo558wxYqwyWM3rE=; b=y
	bTO+Bz3f4UUCgvUENdu/JR4s1tQWnEp57ihiT7ADukM2oj7QIxWGq3WTvZ4bdxQ3
	tjJ17bj09pQZsJJ2oqH6vWtutcEWiLoWOASGLubVv8ttvJlMxSVaK9tsuSJlSvFs
	7WN5PnXPTYjMJ9skh9CkW5jS4Cy8frcPtiCEi+vX5dsK8qOAHD5IQXBJiVOjmRwU
	qFQkpnOz109aFzEZ2ONGs+mNe6/wM39sNFYI1Rs8oEm/6wm/DAHDBBmAYkWLsupu
	pV3+pj5Y/3nUcflenEG251/y0mxqBuM4Jm6uYR8+Cyp2vJfz3admxxkXHYHTx3Sy
	7Nhld7BKdqZZKc+/qiT0w==
X-ME-Sender: <xms:Q-m1Z8Crcx4Pn8AczcDYlAbejtC1qGgfXJMNUcY4DrzHuP9x1DTFaQ>
    <xme:Q-m1Z-i8hABRGXZzL2OpXkKwiYlYom0g5-FPt4H4bDSbMBm7PDiSwJ8ySP-T8pOGw
    0WMBNnCryY5_1m6Q_E>
X-ME-Received: <xmr:Q-m1Z_k2fcfu0jmoxkNkW6dmRH_JMe9oVg5WQou99FzAe9zzcUh6RnusgwrRh7Cg_EEsffaAoUFQLHqNqb-ltl_qTLvwgvuHuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeegkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Q-m1ZyyKI1AP20Qavr1jQFVTMgfzdxSzrfj1yqVAPgahkbpGLSwFUQ>
    <xmx:Q-m1ZxQhGdJirnfoYs0Qa_Od15govXdIHn2mLVj6BfQnBUvfPcZsPQ>
    <xmx:Q-m1Z9apwV-wX3-wrN0jFSWA4ZaNRDOfNiXQwvwrBOrFKmBE1b-Ndg>
    <xmx:Q-m1Z6Ql8Vv-aOIfukw6mRd9SQV0C5iCSXT4_EyZDhzu8TIIOPb20Q>
    <xmx:Q-m1Z--NH9n3y8nBnNq_jUOliDPCPqz8Fy0zXl77Vd32GoehN6MWCtuY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Feb 2025 09:22:59 -0500 (EST)
Date: Wed, 19 Feb 2025 15:22:56 +0100
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
Message-ID: <20250219142256.GA512344@ragnatech.se>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>

Hi Tomi,

I'm happy to see this, nice work.

Unfortunately it does not apply to the media-tree. As this series is a 
mix of fixes and new features as well as covering multiple drivers. Do 
you think it would make sens to break out the fixes per driver which we 
could review and apply ASAP and the new features which we can review but 
need to wait until the dependencies are meet?

If the new features depends on stuff that is hard to upport, maybe just 
focus on the fixes to get them out of the way?

On 2025-02-19 15:48:54 +0200, Tomi Valkeinen wrote:
> Add streams support to Renesas rcar platform driver.
> 
> The series attempts to keep compatibility with the current upstream.
> However, in upstream there's some kind of custom multi-stream support
> implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
> Simplify rcsi2_calc_mbps()".

I would not worry about breaking the make shift multi-stream, it was 
based on our first attempt to allow streams for GMSL many years ago and 
it was bonkers ;-) As long as it don't break a single streams, even from 
subdevs that do not themself support streams I'm happy.

> 
> The behavior should not change when using a single stream.
> 
> A problem with the series currently is that it has a lot of
> dependencies that are not in upstream yet.
> 
> Testing is even more problematic, as the only way currently for me to
> get multiple streams is by using the GMSL2 deserializer add-on board
> with GMSL2 serializers. These are not supported in upstream. If someone
> has the hardware and wants to test, I can share the very-WIP branch that
> contains the missing pieces.
> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Tomi Valkeinen (18):
>       media: rcar-vin: Add RCAR_GEN4 model value
>       media: rcar-vin: Fix RAW8
>       media: rcar-vin: Fix RAW10
>       media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
>       media: rcar-isp: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Fix typo
>       media: rcar-csi2: Move rcar2_calc_mbps()
>       media: rcar-csi2: Simplify rcsi2_calc_mbps()
>       media: rcar-csi2: Optimize rcsi2_calc_mbps()
>       media: rcar-csi2: Switch to Streams API
>       media: rcar-isp: Switch to Streams API
>       media: rcar-csi2: Add .get_frame_desc op
>       media: rcar-isp: Call get_frame_desc to find out VC & DT
>       media: rcar-csi2: Add more stream support to rcsi2_calc_mbps()
>       media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
>       media: rcar-csi2: Add full streams support
>       media: rcar-isp: Add full streams support
> 
>  drivers/media/platform/renesas/rcar-csi2.c         | 430 ++++++++++++++-------
>  drivers/media/platform/renesas/rcar-isp.c          | 228 ++++++++---
>  .../media/platform/renesas/rcar-vin/rcar-core.c    |   2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  20 +-
>  .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   8 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-vin.h |   1 +
>  6 files changed, 499 insertions(+), 190 deletions(-)
> ---
> base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
> change-id: 20250219-rcar-streams-1fdea8860e5e
> prerequisite-message-id: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
> prerequisite-patch-id: 23c9dfd64dd6176312d50191e60b0a92937c0051
> prerequisite-patch-id: c49831184e0a6ff063cadbc79381c0f68d5b0f63
> prerequisite-patch-id: 47104e797dfef692022a72cb62d7fad2fc44f0f5
> prerequisite-patch-id: c89cf1fd9e528e6685ba8ce1e93e94f019f43913
> prerequisite-patch-id: e096565500ed748974824328adf14905ae40bcaa
> prerequisite-patch-id: 87a61e2c15f59928a96e9213c338cc2a65344c58
> prerequisite-message-id: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
> prerequisite-patch-id: 748963119debbf990374b9eb06659381a3924824
> prerequisite-change-id: 20250120-rcar-media-impro-2c37c1036e19:v1
> prerequisite-patch-id: 3741e9cc665b78b56d18eee0041626d3c739dad5
> prerequisite-patch-id: 99a13857e0de3c1cadc7a971f6c3fb4449599313
> prerequisite-patch-id: a034cd446e21ba28273607f1d928c13739fb83f9
> prerequisite-patch-id: cdf480b4562e749c4190ceec50e78a8dac155bd5
> prerequisite-patch-id: 94c99ecd291d3d3f86b148406bbc383405016f2a
> prerequisite-patch-id: 690790ff01515aa452e73581c3ee4312246bfbc2
> prerequisite-patch-id: 74c5bed5396ef54ded950b9c449ea23b8f67636b
> prerequisite-patch-id: 3a6b197715760886ab383fefe1d5f95f40d8b063
> prerequisite-patch-id: e9f04f626ae08c981faa66de72663e8940a4f92e
> prerequisite-patch-id: 58b5dc8fd9026dcfede60b005294692964def2a1
> prerequisite-message-id: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
> prerequisite-patch-id: a4aa6a184c6a21fc4536c11e14d9b5cc61f13346
> prerequisite-patch-id: 1b0091875529d392b142814005baa38b2ef77f98
> prerequisite-patch-id: 4c960ae93b1e663b11194903ed1810e0ed1e4f59
> prerequisite-patch-id: a5641e1dcad0f39baef8996b6731a471046f18f9
> prerequisite-patch-id: 481317ba4b987cbb069c31f3372686a59c0fcb67
> prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v2
> prerequisite-patch-id: da0097f1a6c5b58f87210acd974d7eba0b721dc3
> prerequisite-patch-id: 7cc5997549353a7e300f4778fd883e900d2251b2
> prerequisite-patch-id: 57d4622505842a9c9b8cbedb49745a155826c464
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

