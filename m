Return-Path: <linux-media+bounces-50366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A47D0F83B
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 18:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18ADF300BFB6
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 17:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E4C34C13D;
	Sun, 11 Jan 2026 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="N4dZvehY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LH953geV"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DDE1E5B7A;
	Sun, 11 Jan 2026 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768152701; cv=none; b=Xw9xzz48puMEyI6f87q5NIvUp7/KWrnoA/3Im9pcxGzO5A5/icVBzrvLo92sT79mdFqOxGxRT8INpFjNbs3ujRoRR52jyB9oUvOyotlj54b3/yM2E5xNUDyY0MKiXzZRkd9t0LjnauFMyP7g6lcgw/Lsyvbv1HPWAJSV2h8VPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768152701; c=relaxed/simple;
	bh=ZT8uLZQDAjvMqGPrdDe7px8ZeL+mr8IJJMgva9956+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ed5lA9BSC9nJRnK8OJsZglScxB4nByFo5LxKrwt0Cy8xz+uBKNsK4FLR9VYAfSPyWBVYRXzZoAltSP6zg5VFavTy7/xfxd3ZUb5mphYiebJ4Atupat7rbq7FoGb6999aykxk8QUtkSb/4c+q3pgKFwVR1bTtNbb1sACkUTm/TDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=N4dZvehY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LH953geV; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E4E4F7A0112;
	Sun, 11 Jan 2026 12:31:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Jan 2026 12:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768152697;
	 x=1768239097; bh=nRVu18youNi7nMML+1XQEAl9sU3CM48tyZglDZT9HC0=; b=
	N4dZvehYWLbN3Acueutf803RKASGiJq3ko1+F0SMrobWkDIkIhs8BWZOeBajnGIf
	TnEpv7PtyCsUnjEpBRJwk2kmDRVxJe+e1yC6amJ5I3SIQHZqvbncdJFChm55dL23
	H24WLLbyBshJAHWeDHnTVeEn4K1BymOpKe1YvDhQgUXHK8qvJut2SmGyD+I8fhlx
	p+G3F9Dq6p2fW5XjoHCvQiOK5Ma1AAoPGpFRorJGGtQxJEp2bSR7WUn1hpEZlBuK
	mSLIOE9IwzAg4/oZ7q3dfP55WMhyDADaCCoM4ujKRKelIzjcFpijFk/+WlXU4GXC
	fCsT0F9BYSnHlwOLfg4A/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768152697; x=
	1768239097; bh=nRVu18youNi7nMML+1XQEAl9sU3CM48tyZglDZT9HC0=; b=L
	H953geV1OcXJ+3PuUAqlADvm2AZllC8NHpBg7A8tLYny2Mceq7xE3TweZIwq6n9o
	tdEkqR1vNs2OrGBCroTidjNxzBwHqkO0hEsXWIA75CikgiEmYgzbopDpNoCESt3Z
	bDdWv/WwFFhIVY7B0kT14qCrVUaDNeVfmqYJqWGYh5bAEr60iK8itfBhdGFN3uok
	S88DdFCD2YAWd20TWZYlMdyHPHHDvQfqlksIV/Db/uXQtJ2mv0LgzKA7IkWlGo1i
	Pzh9GJT8+hPtzBcYaoDIeHfxEPPWWZmbG42r6PSVd3Bx9/nQwoXKxJ7KBVUcNGZI
	q9mnmgUDpe0ElH/tFruRA==
X-ME-Sender: <xms:ed5jadfrQ3TCkD9WSJb0RT5kUadkuW0XqyVfUT2Ijvcn8Q0qA_CcDg>
    <xme:ed5jaTaldCV5vGno0eHO6WGwjQQ23UfQbdTu_hhhuFmUf6G6LYw2K_LaSgergF8L8
    gttzq0FuOwJ1u06jOgl7gyF47OSyzpJbbhfOkgUpGRG4ppIuVfDE2w>
X-ME-Received: <xmr:ed5jaSGeW2qJOpv3jAscOOJonO8jxXJiwqsjFHrHduu13WZmxi_2T6Vi-axy_EKtaA5ETegJI0_gtl_Rf16waA8LpB8AGDI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudehudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghs
    ohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiug
    gvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihes
    ihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:ed5jaRmA-F9YFPNGJMvReTPcj8jR9lBSRAHgumnA38TujAe8C-odsg>
    <xmx:ed5jaVdEP9wJu6wiYXNKTrZ7blqs9BbA_xICNl0YZfND_CQmzxKPSw>
    <xmx:ed5jafEVbwfwSJkwVgBEcsTTTaSa749TeYWdKedcAHqaB2js_eu1WQ>
    <xmx:ed5jabj4-f8SRZHChgmpe4QC3-Hblr7kkTkMjqHf-s0oloLRNeOsxA>
    <xmx:ed5jafSxEOyLGxlRtQcVAqoDkT2zL6oytwJKhF-34veKgwYwDieZ4wUu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 12:31:36 -0500 (EST)
Date: Sun, 11 Jan 2026 18:31:31 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 00/15] media: rcar: Streams support
Message-ID: <20260111173131.GD1275677@ragnatech.se>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
 <20251231095739.GA3091492@ragnatech.se>
 <459d26bc-f847-42cc-91fa-a939b6f205a8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <459d26bc-f847-42cc-91fa-a939b6f205a8@ideasonboard.com>

Hello Tomi,

Thanks again for your diligent work on this series!

On 2026-01-08 15:57:10 +0200, Tomi Valkeinen wrote:
> Hi Niklas,
> 
> On 31/12/2025 11:57, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > Thanks for your persistent work on this series!
> > 
> > On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
> >> Add streams support to Renesas rcar platform driver.
> >>
> >> The series keaps compatibility with the current upstream for a single
> >> stream use case. However, in upstream there's a limited custom
> >> multi-stream support implemented to the rcar driver, which will be
> >> replaced with the upstream's Streams API.
> >>
> >> I have tested this series on Sparrow-Hawk board, with a few different
> >> setups:
> >>
> >> IMX219 connected to the CSI0 connector
> >> - The following patches applied to my test branch in addition to this
> >>   series:
> >>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
> >>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
> >>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
> >>      breaks RAW8
> > 
> > That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
> > you see RAW8 breaking?
> 
> I also used V4H with IMX219. Let's compare our setups and results on irc
> and find out what's going on.

Sounds good.

> 
> >> - Tested with a single video stream
> >>
> >> IMX219 connected to the CSI0 connector
> >> - Plenty of other patches applied to enable full streams support and
> >>   embedded data support in imx219 and v4l2 framework
> >> - Tested with video and embedded data streams
> >>  
> >> Arducam FPD-Link board + 4 x IMX219 connected to the CSI0 connector
> >> - Plenty of other patches applied to enable full streams support and
> >>   embedded data support in imx219 and v4l2 framework, and TPG support in
> >>   ub953
> >> - Tested with video and embedded data streams from all four cameras (so
> >>   8 streams in total)
> >> - Also tested with ub953's TPG, combined with video & embedded streams
> >>   from other cameras.
> > 
> > As there are dependencies on patches that have been on the list for a 
> > long time that would block merging this work. Could we try and shift 
> > focus and get some of the nice fixups and cleanups merged first? IMHO we 
> > could even aim for merging the rework (reduction) of the ad-hoc VC 
> > support done in the graph ASAP to get it out of the way.
> > 
> > It would also be nice if we could sort the RAW8 issue separately to get 
> > it out of the way.
> 
> Sounds fine to me.
> 
> > I have other work touching these drivers I'm holding of on to not cause 
> > conflicts with your nice work, and it will make my work smaller/easier 
> > too!
> > 
> > Could we start by breaking this out into:
> > 
> > - A series that just removes the ad-hoc VC thru media graph in the R-Car 
> >   VIN and CSI-2 drivers.
> 
> That's just the patch 6, "media: rcar-vin: Link VINs on Gen3 to a single
> channel on each CSI-2" patch, isn't it?

If it do not depend on anything in 1-5, yes.

> 
> > - And then we can follow up with the cleanup of each of the drivers as 
> >   separate series.
> 
> How about merging 1-6 as a first step (assuming they pass reviews and
> tests =)? I'm not sure if there's any benefit in sending the above VIN
> patch alone, then the cleanups after that. Or perhaps patches 1-8.

See below,

> 
> > This would make it easier for everybody I think. Each series becomes 
> > smaller to review, we can get fixes and cleanup in now and not wait for 
> > all stream dependences to land first.
> 
> I'm fine with breaking it to smaller pieces than 1-8 if you want. I
> think the split could then be 1-5, 6-8, and the rest later. But I think
> 1-5 are quite small and straightforward, so I'm hoping we can work with
> smaller amount of patch sets.

I think we can go for 1-8, but I would split it into 3 series. One for 
rcar-isp, one for rcar-csi2 and one for rcar-vin. That way we can move 
forward more quickly IMHO as review and test of each in isolation will 
go quicker.

Does this sound OK to you?

> 
> >> I have observed one issue with the embedded data (i.e. requiring bunch
> >> of patches not in upstream): when stopping streaming, VIN says that it
> >> cannot stop the stream. I haven't debugged that, but a possible issue is
> >> that the if the video stream for the imx219 is stopped first, the
> >> embedded data stops also, and VIN does not get the frame-end it is
> >> waiting for.
> > 
> > I would not be comfortable merging with this regression. I have bad 
> > experiences when VIN report it can't stop the stream. More often then 
> > not it also means it then can't start streaming again...
> 
> It's not a regression, and on the "why it doesn't matter" side is that
> embedded data is not supported upstream, so the user cannot hit this
> issue. Also, I did not notice any issues in restarting the streaming again.

OK if you need more patches and the 'can't stop streaming' have only 
been observed for that it's OK. But I really don't want to merge 
anything that increases the likelyhood of this state to happen when 
stopping.

If it only happens with embedded data we should refuse to start 
streaming if embedded data is enabled and we still have not sorted this 
out.

> 
> That said, I agree that it must be sorted out.
> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

