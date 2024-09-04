Return-Path: <linux-media+bounces-17502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C771C96AD54
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 02:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5BCAB23B4E
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 00:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470F9256E;
	Wed,  4 Sep 2024 00:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="I1VurvpW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T1yfThjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555AA391;
	Wed,  4 Sep 2024 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725409830; cv=none; b=HnZImP0j3rapGtPASHiaZwIaL4WYLzLTCfhGBSvGKECbc0pj3kQVDXCJaJeKFzBwTniuzCrj+Vdbl74Eh6Q35O6BFhHpVOS1/CHf/8ArTqWHhDCmilQrFDgJAE5ZClEngwpOvNg/eX/FH6uccbIKKW+5i+4F7DgBAzumn7mOGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725409830; c=relaxed/simple;
	bh=hGmo0WNuS757TdfmGfpzHV8y4j/AC/7g1GSfO+Prb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhT64KTMe//qCIk92zXpqcCel3gb2MVOZXdqEiFe1+YT9LGzKHBEeGqApoKkVMXIC6gSXB3tFAtuONsNWkt+eQ7KAVBRigRKsp5hXDrHBVQRTyEp4HtBHafq8KMzvNpB2LzW1qmkIy0Gd9a5ywu7++dHa3uXY0iNIW5mIGvsTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=I1VurvpW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T1yfThjZ; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 4EAC9138023D;
	Tue,  3 Sep 2024 20:30:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 03 Sep 2024 20:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725409826; x=
	1725496226; bh=8piwn31ZqXZogp3zBpb74/a7XmbRS2i2JWJumbJdJWQ=; b=I
	1VurvpWYC+8KV1TDmLQuOYnHL4meZFlxOVgThutq38fHvf5RGLGVu6rYXQqLmfAp
	TkYpf3WBSdxoseD1SvAZN5iYcp5013GNN7/VOlUwQ5vHjzgMHjHIPg6XM6Y0WhSy
	DKzwHHMRIzzHMcN3dlAXUzJatqTN2OhzEcXccaknsJp0q0djAsRV/YaMXOH/LXyj
	MNyfXAZ2KGahnFOsHTMH9fWqC3YsAjWPvSH8OZZWpCBoLpkDilonGCOQHCVY2nvL
	ki+fTELyDIRVttbbZDnD8CfxDFw3eXP9hdynNo13X7B5MuW0mAiTFQrF95AeL/dU
	sLUv/3HPEuWGMRbvWiU8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725409826; x=1725496226; bh=8piwn31ZqXZogp3zBpb74/a7XmbR
	S2i2JWJumbJdJWQ=; b=T1yfThjZGXyHN4Jd7MY/d3NOaBItLSxrp0CUZIdQjNLb
	Lfyl9VChWswyBuqTXmSQUcYjYCaHO44YJmdjTT2gsRyWz+jaQMjDjH5EkQcwwEiH
	/3BIhGiPbfVL2wrdvhD3zFsAqNzicg8gJVZc+vwxSx8SQ2EgFO1FY2ZJJ7TjRCRu
	nZZVqYNSqSn4cZl+ftwRJ2EfmnJRiB03Ghnrp2CAgOFxZt2LNoAXNVlVIZfvGaiY
	0Px08/Q0UfM1gdiJKm6U7Q7Uxz3gUv4YX6ntPFtIWJhrsw1Rf7MXxYYEooqnzkNE
	YyXXJR6RLsdz4U0ut9w8w08vBlqoLOgvlzM6mSROLQ==
X-ME-Sender: <xms:IqrXZlUdiDpTUveRLF9mh2GRNNtnlLuwueE08ylJNqz8gT6FRKPbkw>
    <xme:IqrXZln3oD7lD8KJmZITrk4HGKc7XTIFihmSUx9zdxfQL_Aog1DhRC-mXl6VRSWeh
    pQgChnWC_xCaSl1OMo>
X-ME-Received: <xmr:IqrXZhafL3Q7kNAxUg-uQTebtUiQLg9tWM7zkSvUjhFJa02z95kEcRW7SNXDoAKm6XZjrHWjhNtpsxNiG90qg-hrR-stE2Ztulc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehiedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihessh
    grkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepueeiueevleefvedttefg
    vdeutdekveduheevffdvhfeluefhgfdtgeeutedtudejnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjphdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    rghprghisheslhhinhhugidrmhhitghrohhsohhfthdrtghomhdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvg
    gumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    gvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IqrXZoXsX0L8g1PNLT2QNjUsW0zpGxJFodkWEaf9p0cg6GPPvBPPyg>
    <xmx:IqrXZvn2Ng5_MoIacaUNfkwNcK6MVp-Tq34E8U5sR7xw_lL3E66-TQ>
    <xmx:IqrXZld6vYstL7XtgWt07gZ9m7AClS9WELDBL9vCPKeN7aTxH3tbnQ>
    <xmx:IqrXZpHSaGiDtV-ETuyyO3FIodqpGsFoLLlbpW0vSSkgvNqHeVV8gQ>
    <xmx:IqrXZtaBu8Lvwx87zWwNSsufpaLH8icR7jrWiTyybME-P70PC5mr5eNT>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 20:30:24 -0400 (EDT)
Date: Wed, 4 Sep 2024 09:30:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Allen Pais <apais@linux.microsoft.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org, edmund.raile@protonmail.com,
	linux-media@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [RFT][PATCH 0/5] firewire: use sleepable workqueue to handle
 1394 OHCI IT/IR context events
Message-ID: <20240904003022.GA347045@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Allen Pais <apais@linux.microsoft.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org, edmund.raile@protonmail.com,
	linux-media@vger.kernel.org, netdev@vger.kernel.org
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
 <EB8EC5FD-AB6C-48C3-8980-65E8CB444BDF@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EB8EC5FD-AB6C-48C3-8980-65E8CB444BDF@linux.microsoft.com>

HI,

On Tue, Sep 03, 2024 at 11:06:53AM -0700, Allen Pais wrote:
> 
> 
> >This series of change is inspired by BH workqueue available in recent
> >kernel.
> 
> >In Linux FireWire subsystem, tasklet softIRQ context has been utilized to
> >operate 1394 OHCI Isochronous Transmit (IT) and Isochronous Receive (IR)
> >contexts. The tasklet context is not preferable, as you know.
> 
> >I have already received a proposal[1][2] to replace the usage of tasklet
> >with BH workqueue. However, the proposal includes bare replacement for 1394
> >OHCI IT, IR, Asynchronous Transmit (AT), and Asynchronous Receive (AR)
> >contexts with neither any care of actual usage for each context nor
> >practical test reports. In theory, this kind of change should be done by
> >step by step with enough amount of evaluation over software design to avoid
> >any disorder.
> 
> >In this series of changes, the usage of tasklet for 1394 OHCI IT/IR
> >contexts is just replaced, as a first step. In 1394 OHCI IR/IT events,
> >software is expected to process the content of page dedicated to DMA
> >transmission for each isochronous context. It means that the content can be
> >processed concurrently per isochronous context. Additionally, the content
> >of page is immutable as long as the software schedules the transmission
> >again for the page. It means that the task to process the content can sleep
> >or be preempted. Due to the characteristics, BH workqueue is _not_ used.
> 
> >At present, 1394 OHCI driver is responsible for the maintenance of tasklet
> >context, while in this series of change the core function is responsible
> >for the maintenance of workqueue and work items. This change is an attempt
> >to let each implementation focus on own task.
> 
> >The change affects the following implementations of unit protocols which
> >operate isochronous contexts:
> 
> >- firewire-net for IP over 1394 (RFC 2734/3146)
> >- firedtv
> >- drivers in ALSA firewire stack for IEC 61883-1/6
> >- user space applications
> 
> >As long as reading their codes, the first two drivers look to require no
> >change. While the drivers in ALSA firewire stack require change to switch
> >the type of context in which callback is executed. The series of change
> >includes a patch for them to adapt to work process context.
> 
> >Finally, these changes are tested by devices supported by ALSA firewire
> >stack with/without no-period-wakeup runtime of PCM substream. I also tested
> >examples in libhinoko[3] as samples of user space applications. Currently I
> >face no issue.
> 
> >On the other hand, I have neither tested for firewire-net nor firedtv,
> >since I have never used these functions. If someone has any experience to
> >use them, I would request to test the change.
> 
> >[1] https://lore.kernel.org/lkml/20240403144558.13398-1-apais@linux.microsoft.com/
> >[2] https://github.com/allenpais/for-6.9-bh-conversions/issues/1
> >[3] https://git.kernel.org/pub/scm/libs/ieee1394/libhinoko.git/
> 
> 
> >Regards
> 
> Thank you for doing this work. You will probably need to send out a v2
> As most of you patches have single line comment instead of Block style
> Commnents (/* ..*/). Please have it fixed.
 
Thanks for your comment. However, I think we have a need to update kernel
documentation.

As long as I know, Mr. Linus has few oposition to C99-style comment[1].
In recent kernel development process, C11 is widely accepted. Actually, we
can see many lines with C99-style comment in source tree.

For the kernel API documentation, we still need to use Doxygen-like block
comment since documentation generator requires it. Additionally we can also
see C90 comment is mandatory for UAPI since 'scripts/check-uapi.sh'
hard-codes it. For the other part, C99-style comment brings no issue, as
long as I know.

> - Allen
> 
> >Takashi Sakamoto (5):
> > firewire: core: allocate workqueue to handle isochronous contexts in
> >   card
> > firewire: core: add local API for work items scheduled to workqueue
> >   specific to isochronous contexts
> > firewire: ohci: process IT/IR events in sleepable work process to
> >   obsolete tasklet softIRQ
> > firewire: core: non-atomic memory allocation for isochronous event to
> >   user client
> > ALSA: firewire: use nonatomic PCM operation

[1] https://lore.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/


Thanks

Takashi Sakamoto

