Return-Path: <linux-media+bounces-17783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5396F5BA
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147AD2848D6
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E511CF2AD;
	Fri,  6 Sep 2024 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LebcE+ps";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dO9wTL5M"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD51CE707
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630370; cv=none; b=o10tEYcM7KwJkcF5Y74aHFzpLy2TUbVtcJQ/K3C43pxYEr36SBnb3HWgpVqb2UpT8arcQKjoS4NxBu3x2IeSlJAjZ+QDKz2jGmUcPteexneTEYEhxLfURILPD7ZgK8pWUh9KXHgTlSAbqE4u2AC5d8d1UI2CXGPfe2XFPv4718g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630370; c=relaxed/simple;
	bh=AwWfQXpDuNGCzLUXoFogBBMLzgRdxA2B4Nf2PxIDQp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUsCHPXuWheO7KGJXGsg9m86nzX3DfHsnenzYBh9GhzNDPflhkcuzA/u4p8wQj6GQ65whNlLWoULVaIc1CmlPinN/ZRoh0r+bNEleRy92YZRHDIo1Mri97EgWbfMEeH6w12KGjRJFf3B0ggmv67I7/VPsONINPe9U4E3HKMeCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LebcE+ps; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dO9wTL5M; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C00F61140189;
	Fri,  6 Sep 2024 09:46:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 06 Sep 2024 09:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725630367;
	 x=1725716767; bh=LnO99+xTr+ojlEnyP/pIGrnA0+ndfDyEdXUoQlF+8aE=; b=
	LebcE+psMxPj1cQMLrVm5MciyD610Rb32EHYT5wm3qg5Kj8TpSyh0feneeW0s+aa
	i/gLop08RUW6vXP6jmlPz14IrBGEeMeingMNe/V5Y2sSwCE0M8V+xC/XrgGJHGFE
	oWYNFsUP1oBAvqk6zO0Nnss5q7q7u76m/CmYxEqtFIiKC4h3BJQyJmhoXLZOI5sh
	IahDjAdkJaHyMZAzq0Kk6pnymKK8gS/MEqjbFLHxLxTt+RebEanOWH66Hfj9M+9W
	9SGHzP5cUnl7vZ45T2olb5Scd9hHNqRWBn5RdPa9VQMAYXWtdRopL8S6Z3/GJYpw
	L51DPcBGhxcICjiHa3D1Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725630367; x=
	1725716767; bh=LnO99+xTr+ojlEnyP/pIGrnA0+ndfDyEdXUoQlF+8aE=; b=d
	O9wTL5M9UM021mNRWh0mSqOY1NzC+q0FlaeqEY+c0u9gLN80aJfGzPS2xZXJ1Y8X
	WBxbvlZI2sS6Vdc3SIde/H78DBmTeH7eslj4SBXT8NCNHulAXAXtAPTUhEXiIs+F
	I6eZW5OF4bB+LckwQmtK6zDIvci29YUSHVQ3Qi7VA1lwtq3psZ0qRVOyyuq2MNWX
	xwiKbiHPFGM6IrtbiN/ndu9Yyae7iqJjyS41VxTsh31e52e1eMKZUIDfEQDS1ykB
	MmgdhxGQjRFE92cbzaUBDDPry9vQm/cnDHJL3zdQpX0OjbT+70V78WeDU1fko6wo
	WKsZ07onpt8Xv6Z6SeuUQ==
X-ME-Sender: <xms:nwfbZtqhVCODUZxETdd7tAiLUL_wO2mN6xT8aP6KxRIOtvURX0NtAg>
    <xme:nwfbZvrhYJ1as6ked5sf8nNGE9M7O3drbCNao2a_SoKn198DrRE4tDJvqiOEgIC-c
    YAmpBdYCqM62dw481Q>
X-ME-Received: <xmr:nwfbZqMrHyNHKfE9CxV4xdgfivxO64_w9yFF7_9jbFa5ib_UCRAiVJ4QjsnpN9pGalStlt4PLv4ctjGgNr7VR0oFnV7HazvKfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgieelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:nwfbZo5yoc4zHb5SV8lIk1Tx211kqb21JbRr_lWDDP3TtRn30ljC2w>
    <xmx:nwfbZs4e1QIJzxV2kH_axiEow0yecTusojYcnLFpVeF5vZa7OLlNNw>
    <xmx:nwfbZgjOOTm__PlGoW86w6zd4hgr8SeN8T2gl2faso7JM-lX_9X60Q>
    <xmx:nwfbZu56tZ5pv7VD56ZMovJlGp3KKajccf4KJHouP3yD46uRrtqwjg>
    <xmx:nwfbZsH3K94o5D9AVbEtxh9mA1l-EchTTDmjMZ1n4-b3pM_mIIhReYQ7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 09:46:07 -0400 (EDT)
Date: Fri, 6 Sep 2024 15:46:04 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: Race in rcar-v4l2.c
Message-ID: <20240906134604.GT3708622@fsdn.se>
References: <af3f0b7c-d184-4b2e-bb75-6349ef32e4c3@ideasonboard.com>
 <20240906101446.GS3708622@fsdn.se>
 <fbb2f448-c253-44b0-82ae-e9d751b469e2@ideasonboard.com>
 <c8feb1c4-ec6a-4ea9-b8cd-cb10d99e09ca@ideasonboard.com>
 <ff998461-29fc-4e8c-8a59-dadbe971bf63@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff998461-29fc-4e8c-8a59-dadbe971bf63@ideasonboard.com>

Hello Tomi,

Thanks for testing that series.

On 2024-09-06 15:28:21 +0300, Tomi Valkeinen wrote:
> On 06/09/2024 14:27, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 06/09/2024 14:14, Tomi Valkeinen wrote:
> > > Hi Niklas,
> > > 
> > > On 06/09/2024 13:14, Niklas Söderlund wrote:
> > > > Hi Tomi,
> > > > 
> > > > Thanks for your report.
> > > > 
> > > > I have an on-going series trying to clean this all up [1]. The one
> > > > change in the v4l-async core I proposed was however rejected and I have
> > > > yet to circle back to figure out a different solution.
> > > > 
> > > > Could you give it a try and see if it also solves this issue?
> > > > 
> > > > 1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections
> > > > in v4l-async
> > > >     https://lore.kernel.org/linux-renesas-
> > > > soc/20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se/
> > > 
> > > The compilation fails (broken in media: rcar-vin: Simplify remote
> > > source type detection) with:
> > > 
> > > drivers/media/platform/renesas/rcar-vin/rcar-dma.c:767:24: error:
> > > ‘struct rvin_dev’ has no member named ‘is_csi’
> > > 
> > > If I hack past that, I don't see the warnings anymore. But if I'm
> > > not mistaken, rvin_release() is not called at all anymore. I can
> > > also see plenty of leaks with kmemleak. Those seem to originate from
> > > max96712, but... I don't see max96712's remove() getting called
> > > either when I remove the module.

FWIW module unloading is tricky and AFIK not supported upstream. There 
is a reason the VIN capture pipeline have .suppress_bind_attrs = true 
;-)

> > 
> > Sorry, never mind that. I had the debug print in max96714... =). So
> > max96712 remove() gets called, but it's missing:
> > 
> > +       v4l2_subdev_cleanup(&priv->sd);
> > +       media_entity_cleanup(&priv->sd.entity);
> > +       v4l2_ctrl_handler_free(&priv->ctrl_handler);
> > 
> > But now I'm seeing rvin_release() getting called (no warnings). I'm not
> > sure what changed. Maybe I had some extra changes lying around. Let me
> > test the series a bit more...
> 
> I haven't seen the warning anymore, so I believe your series indeed fixes
> the issue.

Awesome! I will try to find some time soon and rebase that series, I 
think I have an idea on how to avoid having to mock around in the 
v4l-async core and still achieve the same thing.

> 
>  Tomi
> 
> > 
> >   Tomi
> > 
> > > I'm testing on Renesas' whitehawk board, with max96712 TPG. If you
> > > have that board, and want to try module loading & unloading, you
> > > also need to fix the max96712 remove function:
> > > 
> > > -       struct max96712_priv *priv = i2c_get_clientdata(client);
> > > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +       struct max96712_priv *priv = v4l2_get_subdevdata(sd);
> > > 
> > >   Tomi
> > > 
> > > > On 2024-09-06 12:57:50 +0300, Tomi Valkeinen wrote:
> > > > > Hi Niklas,
> > > > > 
> > > > > There seems to be a race in rcar-v4l2.c, causing
> > > > > WARN_ON(entity->use_count < 0) in pipeline_pm_power_one().
> > > > > 
> > > > > If my understanding is correct, the VIN v4l2 nodes are being created
> > > > > (rvin_v4l2_register), meaning they are userspace accessible,
> > > > > but the media
> > > > > pipeline as a whole is not ready yet (e.g. media links).
> > > > > 
> > > > > So what happens is that after some video nodes have been created, the
> > > > > userspace opens them (I think it's udevd checking the new
> > > > > device nodes),
> > > > > causing rvin_open(). rvin_open() goes through the media
> > > > > graph and does some
> > > > > PM enabling (I'm not familiar with the legacy v4l2_pipeline_pm_get()).
> > > > > However, as the links are not there, it doesn't really
> > > > > enable much at all.
> > > > > 
> > > > > Then the driver goes forward and finishes with the media graph.
> > > > > 
> > > > > Then the userspace closes the opened video nodes,
> > > > > rvin_release() gets called
> > > > > and it goes through the media graph, which now contains all
> > > > > the entities,
> > > > > and powers them down. As the entities were never powered up, we hit the
> > > > > use_count warning.
> > > > > 
> > > > > This happens quite often to me when loading the modules, but
> > > > > I think it can
> > > > > be made to happen more often by adding msleep(1000) to the beginning of
> > > > > rvin_release(), thus ensuring that the graph setup is
> > > > > finished before the
> > > > > rvin_release() proceeds (and hoping that the graph setup was
> > > > > not ready when
> > > > > rvin_open() was called).
> > > > > 
> > > > >   Tomi
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

