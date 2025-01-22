Return-Path: <linux-media+bounces-25167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA076A1972D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 18:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC8C3ACF07
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1452153ED;
	Wed, 22 Jan 2025 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BoikYN7Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SkEp//De"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4ED215197;
	Wed, 22 Jan 2025 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737565635; cv=none; b=gYSH0M04W5bvl/cS/9HKtNTrbn/JT8ppwH3wgpWVRaaYYccpZgnCpdJ4BLqvR0zWn7J1w9MrQvkts5cczslXIaGFWBH7s1AkLXwwqWt6R5ydvJIrt1sH+C8oTM9l6CK39CLhzyzYj4kulZQ2vuCwzBu/tiS3ZPP53Oi6bK2Oxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737565635; c=relaxed/simple;
	bh=BPS/WHVw6XnlaIQJJMVijubIWTthg1nUlBDru1jNfuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFrpba12vgafnji+7RgBd8ggP6OPDYQOUwfkik77mB9ZS84KOyyE79JUMJmWLW+8lqzQpBBJMvvMa6HZeTzQdnekJ9yiU8ErMMj5RtcoBPqQyWFksGhmBJALYhTxMAT+9iqCVKznIXD6XjpXDPyOHb99RW/pBlZTITR/ENwneDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BoikYN7Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SkEp//De; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9296E114017D;
	Wed, 22 Jan 2025 12:07:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jan 2025 12:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737565632;
	 x=1737652032; bh=dhG6OgUvX3DXd7FLwr0E4WVbsVb3b0T3URJtuE8prZk=; b=
	BoikYN7Zh/s9Sz5o21qxIOAor/FI2ooQHvJhpI4gz2YQPPwF2G7Nq60HYI+ZRcdV
	ZaWao2htLqg8IjPTeuFg+kH8qJufRo/11MSUZLwNfJNHFJ9BF99uuLFkZKBDNOVe
	Rs+R6gBGI1twpcKBu6x3ceSfCqViThH4E3iZFIcj1iHZInHQkt0JvuU7hoUySNQV
	qQCHOrazZK/B///HWYnQ1t3tKoZ07zQN+vADZxWlPLkG28xjJi3nKsEd+UlOKQZv
	yjTINaACYZkLiwvgbf1HemU9xy3x4yoKaO+cmqBw4Cj3EHV4a6AyFuQ4VoLKtmeb
	ebdynvthtPa/xhYemJxxtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737565632; x=
	1737652032; bh=dhG6OgUvX3DXd7FLwr0E4WVbsVb3b0T3URJtuE8prZk=; b=S
	kEp//DeoFTu46HlznlKGL9hUIc4mttbFZt03tw1fU3PYTBAAmx9e9i71JL0ROv0J
	1g7ZagkeJnpoN24oAmDVH8psYP5lAlOROsJBLqB5Cibfsrk12qdstketOOX8BySN
	D7gLbqfvrlyhjpRuYm67pAqeTM200CjWUDk3fc/H9+95HUlI0/6ZPiVcfyS5EPD5
	G7hZe0DR8KE/iVmSrultRwMLRRDknyM6o2v1OvoDG6rMHSJKwXk3ZurJhSlp4t+H
	YlDy0wjxaLynww2W/LElkEeyE3VwhIFjOqp1wukvXDSW5F5hC7RtdBYjgg2MPVaz
	OODrPb9oCERlDD2hflQeQ==
X-ME-Sender: <xms:wCWRZ_cdQdyWlIpQWkKOzHkj7NHKAMDDdYjfcPNfnzt6u8v0xmllVA>
    <xme:wCWRZ1PIT2IUYi0OI4uJDc_wta6UuIGNabVowK3LggpVOngy0iR7dHQeLfw1Iytgh
    1kiFHALQtSBWSQyrb0>
X-ME-Received: <xmr:wCWRZ4g11yd2YiFu3UluUujfvsiFm0Ula0BVeWn59qR4RJ9t9AwCtjyq-ufquQj7E24MwL-UU4AWCTHip0EnbbZFX3Wunz0QzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdt
    geefveefgfeutdevveelgfelkeeuvdefgefgfeehfeeijeehudelhfejkefgnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:wCWRZw9n_d6UM_fCpBHgu_YoQMNGugCyTO2WuTifeOsYQtxgZmDeTA>
    <xmx:wCWRZ7sflNynSNMYVIjplGl8hVt1QJgGZcDM9-rYke9UJScOnJwqlQ>
    <xmx:wCWRZ_Eg3uqYawqQFEqUbxpWhvwol1FLczTQLr8jIne05WjuTlqQCg>
    <xmx:wCWRZyMe9mDQs1M6Zn6ASGSQteR9U4aoO4hQjGt2iclYM2rOCYXUnw>
    <xmx:wCWRZ_juHU6knDeF_gLOgUpgO5KzcR-mPOBaVCp7G1WLeIsCV1BSniyC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 12:07:11 -0500 (EST)
Date: Wed, 22 Jan 2025 18:07:08 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] media: rcar: Minor cleanups and improvements
Message-ID: <20250122170708.GD3436806@ragnatech.se>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
 <20250121212448.GA3302176@ragnatech.se>
 <a0e38115-87c7-4145-b9d0-fb8f8ea1fcf7@ideasonboard.com>
 <20250122092128.GB3436806@ragnatech.se>
 <p2f3d5tm4ufax2ubgrsfm75c754mu2pdnkzmtopzwwebyuhcjf@i3dttqpg5myu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p2f3d5tm4ufax2ubgrsfm75c754mu2pdnkzmtopzwwebyuhcjf@i3dttqpg5myu>

Hello Jacopo,

On 2025-01-22 12:57:13 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Wed, Jan 22, 2025 at 10:21:28AM +0100, Niklas Söderlund wrote:
> > On 2025-01-22 10:02:59 +0200, Tomi Valkeinen wrote:
> > > Hi,
> > >
> > > On 21/01/2025 23:24, Niklas Söderlund wrote:
> > > > Hi Tomi,
> > > >
> > > > Thanks for a great cleanup series!
> > > >
> > > > On 2025-01-20 15:10:33 +0200, Tomi Valkeinen wrote:
> > > > > I've started looking at multi-stream support, and came up with these
> > > > > while working towards streams.
> > > > >
> > > > >   Tomi
> > > > >
> > > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > >
> > > > I have tested this in Gen2, Gen3 and Gen4 without noticing any
> > > > regressions. The log is now spammed with the helpful suggestion that the
> > > > CSI-2 TX subdevices shall implement V4L2_CID_LINK_FREQ control. This is
> > > > annoying but out of scope for this series, but would be nice at some
> > > > point.
> > > >
> > > >    [   37.421531] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
> > > >    [   37.430991] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> > >
> > > Which drivers need fixing? The staging max96712 is one (there seems to be a
> > > TODO there about it), and adv748x? I'm not going to work on that right now,
> > > but just collecting the details.
> >
> > Indeed adv748x is the other driver needing work here. The problem as I
> > recall it is that V4L2_CID_LINK_FREQ is a menu control, and adv748x
> > selects it link freq based on what it is outputting. But it's been some
> > time since I looked at this, maybe I recall incorrectly.
> >
> 
> Would this series help ?
> https://patchwork.kernel.org/project/linux-media/list/?series=926905

I think it would, it seems to perfectly fit the adv748x situation, 
awesome!

> 
> > >
> > > > For the whole series,
> > > >
> > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >
> > > Thanks!
> > >
> > >  Tomi
> > >
> >
> > --
> > Kind Regards,
> > Niklas Söderlund
> >

-- 
Kind Regards,
Niklas Söderlund

