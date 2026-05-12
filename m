Return-Path: <linux-media+bounces-61283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFKONypQA2pQ4QEAu9opvQ
	(envelope-from <linux-media+bounces-61283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:07:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4B52457C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8979A3322ABF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBF93C37B4;
	Tue, 12 May 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nWDGNL8C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ElqfBvzM"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534236A378;
	Tue, 12 May 2026 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600164; cv=none; b=plZueAKicQb4MSFqfU2uxIZTAsoZ7hf+pVdSJWF62pmN2Gt3Y7rFVzunWy5EpgDAvaKEQnHWiDFkLFL29v25SsG/+cracWKbf06tlnY/7JjMwG3x2j6Dhbi6cndv07OS2mzlTpVApF1tzgd+QWDUjFk65VlcwVAiWBa+ExhWKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600164; c=relaxed/simple;
	bh=6Ujr02ucvXmgqWCaAYF+mB6g2iiW/V7jiYvFX0g4QJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsS2FMH6WCV0TUcidvzCKBGnSuEcI7kH1HEgIKLeAyva+82hKZR6isN8ST5TWZJVIycJ+JGjYXLlzFCBY4bgX0OjPt90pCE7ybQ6HcuwtQBMfRajDBrmiw2ubevHhNoz+6YO4IsDSQXvNcNn/VJRqFBN7fxm5glepjAVgTR26xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nWDGNL8C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ElqfBvzM; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 0F0751D0006D;
	Tue, 12 May 2026 11:36:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 12 May 2026 11:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778600160;
	 x=1778686560; bh=0f08Jnqjb77XcnxJsM7tn2V0e1ARESiUYXybt5uVIlM=; b=
	nWDGNL8CbUe56yJy1RK/Efp00Wj5RRvWGzJEewAUZQwJVQsStojxAdyuEdb1zadH
	0Eh84zRo/zldSKPZ8JBLqNBUSJAtOvHrG9UbeY6ld169lBTjwBJGAz/i+y6klvI6
	ww+F3kv9gbNQx1HxsDjHBkCYv0/AO9ZxRfI3sFJLt+exMAJchUmt3b7AVpDKZwwR
	D3fEbepz05+g/hzEV8gXgjl8sjkzZ35SuWlVVzRvoNqevSvy/URk5aQzSyFrDBTN
	UB3U18Ml/2mPGO4jAxawAlkFi742nsmLRFAm5VV1ibHJhUzCC4Fzej5IdNrUiMPZ
	Ni6l6XLDNWiUFQeJ11/HpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778600160; x=
	1778686560; bh=0f08Jnqjb77XcnxJsM7tn2V0e1ARESiUYXybt5uVIlM=; b=E
	lqfBvzM/v3o++2DPx/loaxYfm8ZSImZ7MRSPtRUTAZkLerSRfxix7lQNG16MevgW
	HZrobTfqAW8gTGJC8VcocfGk6Ds6nEHdbdvRvMxvpdUinK5Fti7Bxp8FMZBJA+DW
	PzGDhS47rs2cpEmNjIYkjiEPu3IWWD2cgZYxIXwMTJY7/Tdbf3Lbukbn1n2oEk5J
	iPhNvtkpawGy320INFb0arHC4iiejbLhNKYxV449Ibf6hrWD8CriiCskTf4czuzV
	6VPzGdRyV8qBnXxPbn9pZIb8UEtmK70XKqZ22hgCXIT0rj2p6HLyfFl1dFGbxdjZ
	aMe5PZD2N98y1slmEwYCA==
X-ME-Sender: <xms:4EgDasgOJPMO6MKPydeIyInhGetILqyaJroDqBrHyfi5P8VGQEGMmw>
    <xme:4EgDav8ZMotbjWvvtiVii6oL_J9ShR9xiuM6FRgzh5IsHiDg-KeIktMyV_kjWvPSm
    UHzc4AZ1vzO00lj0irHT0BNeCOb644iP3qO7KFSRGQCrGoQENQr-A>
X-ME-Received: <xmr:4EgDajGizG7tyLIgI3KfFoIVmXYDenjuLhMxXsqBFuNV9F6PxVW7ULM0eg_MCamVznnR-gJGp4yB9tCMXt9ce2Z-uryz3hOF1oDy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvddvudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdorhgvnhgvshgrshesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhs
    ohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhivghrrghnrdgsih
    hnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhp
    ohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshhtrg
    gslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4EgDaikZ0wiZyASke2XNr-SbDtRAuhVSASI1t7SVthG4Yx3Qg5ctpA>
    <xmx:4EgDanZojBWnAURB_DrQLzB5T7ndqMRcLj6EAFgCzsGoIGGoGbXyJw>
    <xmx:4EgDanHsGYJukGzhwQNs5DTPaOKq_ODXhdTBicsg6xHWY4at91-cgQ>
    <xmx:4EgDaoIGWO1wDLEqKoz1JrJ7ThkdXHysXSg-K6nVKi8qOe60GPUh2Q>
    <xmx:4EgDagH4WZc16gswsxCaf9TCLk8ekZrPSDcn4Ak0Y4hM1u_7D_s5SNUc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 May 2026 11:35:59 -0400 (EDT)
Date: Tue, 12 May 2026 17:35:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Fix race condition when stopping
 display pipeline
Message-ID: <20260512153557.GA332351@ragnatech.se>
References: <20260511223832.3385049-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511223832.3385049-1-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 3EA4B52457C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61283-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:mid,ragnatech.se:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your work.

On 2026-05-12 01:38:32 +0300, Laurent Pinchart wrote:
> When stopping a display pipeline, the vsp1_du_setup_lif() function first
> stops the hardware by calling vsp1_pipeline_stop(), and then resets
> drm_pipe->du_complete to NULL. Stopping the hardware ensures no new
> interrupt is generated, but does not wait for completion of any running
> interrupt handler. This creates a race with vsp1_du_pipeline_frame_end()
> which tests drm_pipe->du_complete before calling the function pointer.
> If the drm_pipe->du_complete pointer is reset to NULL between those two
> operations, a NULL pointer derefence will occur.
> 
> Fix this by setting pipe->state to STOPPING before stopping the
> hardware, and avoid calling the frame end handler if the state is not
> RUNNING. Condition the latter to the display pipeline, as the other
> pipeline use a different stop procedure that waits for the frame end
> handler to set the state to STOPPED.
> 
> The state check needs to be protected by the pipe->irqlock. The lock is
> used by the video and vspx completion handlers already, so move it one
> level up to vsp1_pipeline_frame_end().

Running with this and the still out-of-tree ISP driver I hit a splat. It 
might be an issue in the ISP driver, I will dig some more. But for 
reference I log the splat here. My stress test also seems to trigger the 
deadlock.

[   32.111727] ======================================================
[   32.112507] WARNING: possible circular locking dependency detected
[   32.113287] 7.1.0-rc1-arm64-renesas-02551-g0fc35b78411a #17 Not tainted
[   32.114122] ------------------------------------------------------
[   32.114900] swapper/0/0 is trying to acquire lock:
[   32.115506] ffff000442e1ef30 (&core->lock){-...}-{3:3}, at: risp_core_svspx_frame_end+0x24/0x60
[   32.116624]
               but task is already holding lock:
[   32.117358] ffff000442e16cc8 (&pipe->irqlock){-...}-{3:3}, at: vsp1_pipeline_frame_end+0x4c/0xc0
[   32.118478]
               which lock already depends on the new lock.

[   32.119511]
               the existing dependency chain (in reverse order) is:
[   32.120457]
               -> #1 (&pipe->irqlock){-...}-{3:3}:
[   32.121223]        lock_acquire+0x27c/0x3fc
[   32.121764]        _raw_spin_lock_irqsave+0x58/0x80
[   32.122392]        vsp1_isp_job_run+0x84/0xf8
[   32.122952]        risp_core_job_run+0x1e4/0x2a4
[   32.123540]        risp_core_start_streaming+0x3d8/0x440
[   32.124215]        risp_io_start_streaming+0x64/0xe0
[   32.124846]        vb2_start_streaming+0x64/0x168
[   32.125449]        vb2_core_streamon+0xd0/0x1b8
[   32.126028]        vb2_ioctl_streamon+0x50/0x8c
[   32.126606]        v4l_streamon+0x20/0x28
[   32.127120]        __video_do_ioctl+0x344/0x3f0
[   32.127698]        video_usercopy+0x2e8/0x9f0
[   32.128254]        video_ioctl2+0x14/0x80
[   32.128766]        v4l2_ioctl+0x3c/0x60
[   32.129254]        __arm64_sys_ioctl+0x88/0xe0
[   32.129825]        invoke_syscall.constprop.0+0x3c/0x100
[   32.130504]        el0_svc_common.constprop.0+0x34/0xcc
[   32.131170]        do_el0_svc+0x18/0x20
[   32.131661]        el0_svc+0x3c/0x2b8
[   32.132131]        el0t_64_sync_handler+0x98/0xe0
[   32.132731]        el0t_64_sync+0x154/0x158
[   32.133265]
               -> #0 (&core->lock){-...}-{3:3}:
[   32.133999]        check_prev_add+0x10c/0xda0
[   32.134554]        __lock_acquire+0x129c/0x1584
[   32.135131]        lock_acquire+0x27c/0x3fc
[   32.135665]        _raw_spin_lock_irqsave+0x58/0x80
[   32.136286]        risp_core_svspx_frame_end+0x24/0x60
[   32.136939]        vsp1_vspx_pipeline_frame_end+0x1c/0x28
[   32.137626]        vsp1_pipeline_frame_end+0xa8/0xc0
[   32.138260]        vsp1_irq_handler+0xfc/0x12c
[   32.138828]        __handle_irq_event_percpu+0xa8/0x4cc
[   32.139497]        handle_irq_event+0x40/0x100
[   32.140065]        handle_fasteoi_irq+0xe8/0x210
[   32.140655]        handle_irq_desc+0x30/0x58
[   32.141202]        generic_handle_domain_irq+0x14/0x1c
[   32.141857]        gic_handle_irq+0x50/0xe0
[   32.142389]        call_on_irq_stack+0x30/0x60
[   32.142955]        do_interrupt_handler+0x78/0x7c
[   32.143555]        el1_interrupt+0x34/0x50
[   32.144079]        el1h_64_irq_handler+0x14/0x1c
[   32.144668]        el1h_64_irq+0x6c/0x70
[   32.145168]        cpuidle_enter_state+0xf4/0x440
[   32.145769]        cpuidle_enter+0x30/0x40
[   32.146295]        do_idle+0x16c/0x2d0
[   32.146776]        cpu_startup_entry+0x30/0x40
[   32.147342]        kernel_init+0x0/0x130
[   32.147842]        do_one_initcall+0x0/0x248
[   32.148392]        __primary_switched+0x88/0x90
[   32.148970]
               other info that might help us debug this:

[   32.149983]  Possible unsafe locking scenario:

[   32.150741]        CPU0                    CPU1
[   32.151325]        ----                    ----
[   32.151908]   lock(&pipe->irqlock);
[   32.152366]                                lock(&core->lock);
[   32.153110]                                lock(&pipe->irqlock);
[   32.153886]   lock(&core->lock);
[   32.154311]
                *** DEADLOCK ***

[   32.155073] 1 lock held by swapper/0/0:
[   32.155572]  #0: ffff000442e16cc8 (&pipe->irqlock){-...}-{3:3}, at: vsp1_pipeline_frame_end+0x4c/0xc0
[   32.156780]
               stack backtrace:
[   32.157347] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.1.0-rc1-arm64-renesas-02551-g0fc35b78411a #17 PREEMPT
[   32.157359] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   32.157365] Call trace:
[   32.157369]  show_stack+0x14/0x1c (C)
[   32.157388]  dump_stack_lvl+0x6c/0x90
[   32.157396]  dump_stack+0x14/0x1c
[   32.157404]  print_circular_bug+0x254/0x2a0
[   32.157413]  check_noncircular+0x170/0x190
[   32.157422]  check_prev_add+0x10c/0xda0
[   32.157431]  __lock_acquire+0x129c/0x1584
[   32.157440]  lock_acquire+0x27c/0x3fc
[   32.157449]  _raw_spin_lock_irqsave+0x58/0x80
[   32.157460]  risp_core_svspx_frame_end+0x24/0x60
[   32.157468]  vsp1_vspx_pipeline_frame_end+0x1c/0x28
[   32.157480]  vsp1_pipeline_frame_end+0xa8/0xc0
[   32.157494]  vsp1_irq_handler+0xfc/0x12c
[   32.157507]  __handle_irq_event_percpu+0xa8/0x4cc
[   32.157522]  handle_irq_event+0x40/0x100
[   32.157537]  handle_fasteoi_irq+0xe8/0x210
[   32.157547]  handle_irq_desc+0x30/0x58
[   32.157560]  generic_handle_domain_irq+0x14/0x1c
[   32.157574]  gic_handle_irq+0x50/0xe0
[   32.157581]  call_on_irq_stack+0x30/0x60
[   32.157590]  do_interrupt_handler+0x78/0x7c
[   32.157600]  el1_interrupt+0x34/0x50
[   32.157611]  el1h_64_irq_handler+0x14/0x1c
[   32.157623]  el1h_64_irq+0x6c/0x70
[   32.157630]  cpuidle_enter_state+0xf4/0x440 (P)
[   32.157645]  cpuidle_enter+0x30/0x40
[   32.157655]  do_idle+0x16c/0x2d0
[   32.157665]  cpu_startup_entry+0x30/0x40
[   32.157675]  kernel_init+0x0/0x130
[   32.157682]  do_one_initcall+0x0/0x248
[   32.157694]  __primary_switched+0x88/0x90

> 
> Fixes: d7ade201ae7f ("v4l: vsp1: Extend VSP1 module API to allow DRM callbacks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> 
> I have noticed this race condition while debugging a separate issue and
> adding printk() statements in the display pipeline frame end. I have
> tested the fix with the DU test suite and VSP test suite, exercising
> both the display and video pipelines. I'm fairly confident that the VSPX
> pipeline won't be negatively affected, but it would be good to
> double-check that. Jacopo, Niklas, would you be able to give test it ?
> 
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c  | 12 ++++++++++--
>  drivers/media/platform/renesas/vsp1/vsp1_video.c |  5 -----
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c  | 13 +++++--------
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index 5d769cc42fe1..aaec1aa15091 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -509,6 +509,10 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  		 * When using display lists in continuous frame mode the only
>  		 * way to stop the pipeline is to reset the hardware.
>  		 */
> +		scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +			pipe->state = VSP1_PIPELINE_STOPPING;
> +		}
> +
>  		ret = vsp1_reset_wpf(vsp1, pipe->output->entity.index);
>  		if (ret == 0) {
>  			spin_lock_irqsave(&pipe->irqlock, flags);
> @@ -583,8 +587,12 @@ void vsp1_pipeline_frame_end(struct vsp1_pipeline *pipe)
>  	 * Regardless of frame completion we still need to notify the pipe
>  	 * frame_end to account for vblank events.
>  	 */
> -	if (pipe->frame_end)
> -		pipe->frame_end(pipe, flags);
> +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +		if (pipe->state == VSP1_PIPELINE_RUNNING || !pipe->lif) {
> +			if (pipe->frame_end)
> +				pipe->frame_end(pipe, flags);
> +		}
> +	}
>  
>  	pipe->sequence++;
>  }
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index fe1dac11d4ae..a8db94bdb670 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -325,14 +325,11 @@ static void vsp1_video_pipeline_frame_end(struct vsp1_pipeline *pipe,
>  {
>  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
>  	enum vsp1_pipeline_state state;
> -	unsigned long flags;
>  	unsigned int i;
>  
>  	/* M2M Pipelines should never call here with an incomplete frame. */
>  	WARN_ON_ONCE(!(completion & VSP1_DL_FRAME_END_COMPLETED));
>  
> -	spin_lock_irqsave(&pipe->irqlock, flags);
> -
>  	/* Complete buffers on all video nodes. */
>  	for (i = 0; i < vsp1->info->rpf_count; ++i) {
>  		if (!pipe->inputs[i])
> @@ -354,8 +351,6 @@ static void vsp1_video_pipeline_frame_end(struct vsp1_pipeline *pipe,
>  		wake_up(&pipe->wq);
>  	else if (vsp1_pipeline_ready(pipe))
>  		vsp1_video_pipeline_run(pipe);
> -
> -	spin_unlock_irqrestore(&pipe->irqlock, flags);
>  }
>  
>  static int vsp1_video_pipeline_build_branch(struct vsp1_pipeline *pipe,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> index 1673479be0ff..26c477708858 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> @@ -176,14 +176,11 @@ static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
>  {
>  	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
>  
> -	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> -		/*
> -		 * Operating the vsp1_pipe in singleshot mode requires to
> -		 * manually set the pipeline state to stopped when a transfer
> -		 * is completed.
> -		 */
> -		pipe->state = VSP1_PIPELINE_STOPPED;
> -	}
> +	/*
> +	 * Operating the vsp1_pipe in singleshot mode requires to manually set
> +	 * the pipeline state to stopped when a transfer is completed.
> +	 */
> +	pipe->state = VSP1_PIPELINE_STOPPED;
>  
>  	if (vspx_pipe->vspx_frame_end)
>  		vspx_pipe->vspx_frame_end(vspx_pipe->frame_end_data);
> 
> base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund

