Return-Path: <linux-media+bounces-35930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC7AE9857
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 10:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD614189FB2F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 08:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E9A28FABC;
	Thu, 26 Jun 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q8grUMFn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C21728C5D2;
	Thu, 26 Jun 2025 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926650; cv=none; b=WICgnalW5x0t7gsgaqQGil5mXbOvNqdySsJ4rZACDWDWfISosMqk3IXzdHSCVkP5Yp8+4u4Y8/RlBEIk26v6KhEZWIsSgxAl6WBztMIpHdr+LklqChDz3ckKKEbJlloIrGHXIOzpDezKKZw0+4k98m7UJLsY9oP6BDmvmEGO25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926650; c=relaxed/simple;
	bh=AjazNlGQRyJ8vN0ubuJ6K3w2xxQtuQyHx81PNoQHYcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpNKyTJGkw41GW5RdQ/Gq/V9mZ9ixqhJombig+4Xq6mhxtqUSqJP0adwiiB0n2SI6xxAOHQTgxHeMUxEfs/WaHyqf7Fd7KVqTH8LY8W0ONqkQGb7sHdZ/GJSGQT55dTNHnT38RIJme5+XyYVR/GDpVQqeemcFSfXWrCJJ4bV7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q8grUMFn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 693B6EBA;
	Thu, 26 Jun 2025 10:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750926628;
	bh=AjazNlGQRyJ8vN0ubuJ6K3w2xxQtuQyHx81PNoQHYcU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q8grUMFnTHvGC/9bgypn3eP3ZYvNp04iPBDwZkXxNecUNWmy2p7jfWpefqzUII5kO
	 mvHsSMW4HDAYWPgozT5mwVd2RLAm+fldD3Q0xppWCWqlnEYYAlnGmjgOU4NKOYwEoe
	 dc5xfnfNBhM7jW+WqQjntaR/k3jEcvuDgnWvMYd4=
Message-ID: <6e299f94-bf50-48c0-b9ec-5d02eccfdfac@ideasonboard.com>
Date: Thu, 26 Jun 2025 11:30:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/19] media: renesas: vsp1: Conversion to subdev
 active state
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 19/06/2024 03:17, Laurent Pinchart wrote:
> Hello,
> 
> This patch series is the second version of the vsp1 driver conversion to
> using the subdev active state. This version suffers from the same main
> lockdep issue as v1 (see below), but I decided to still repost it as the
> first 17 patches can go in already while we figure out how to handle the
> lockdep issue.
> 
> The driver is fairly complex and creates many subdevs, exposing them to
> userspace through subdev nodes but also controlling them from within the
> kernel when acting as a backend for the R-Car DU display driver. It is
> thus a good testing ground to validate the subdev active state API.
> 
> The first 17 patches are miscellaneous refactoring and cleanups to
> prepare for the actual conversion. In the middle of that is patch 11/19,
> which adds a function to dump a pipeline to the kernel log, which came
> very handy for debugging.
> 
> Patch 18/19 is the actual conversion to the active state API. While I
> tried to keep it as small as possible by handling all the refactoring in
> separate patches, it's still the largest one in the series, mostly due
> to the fact that the drivers creates many subdevs. If that's any
> consolation, the diffstat is nice (net removal of 261 lines). Patch
> 19/19 is then an additional cleanup on top.
> 
> The good news is that both the VSP test suite ([1]) and the display test
> suite ([2]) pass. The bad news is that lockdep complains quite heavily:
> 
> [  276.810170] ============================================
> [  276.815489] WARNING: possible recursive locking detected
> [  276.820813] 6.10.0-rc3-00175-g639ee34a20f1 #803 Not tainted
> [  276.826401] --------------------------------------------
> [  276.831724] yavta/1481 is trying to acquire lock:
> [  276.836442] ffff00000ff26868 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x140/0x308
> [  276.847736] 
> [  276.847736] but task is already holding lock:
> [  276.853581] ffff00000ff27c68 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x118/0x308
> [  276.864856] 
> [  276.864856] other info that might help us debug this:
> [  276.871396]  Possible unsafe locking scenario:
> [  276.871396] 
> [  276.877326]        CPU0
> [  276.879779]        ----
> [  276.882232]   lock(vsp1_entity:531:sd->active_state->lock);
> [  276.887827]   lock(vsp1_entity:531:sd->active_state->lock);
> [  276.893422] 
> [  276.893422]  *** DEADLOCK ***
> [  276.893422] 
> [  276.899349]  May be due to missing lock nesting notation
> [  276.899349] 
> [  276.906145] 3 locks held by yavta/1481:
> [  276.909996]  #0: ffff00000fcaa7a0 (&video->lock){+.+.}-{3:3}, at: __video_do_ioctl+0x19c/0x5b0
> [  276.918666]  #1: ffff00000fc9f418 (&mdev->graph_mutex){+.+.}-{3:3}, at: vsp1_video_streamon+0xec/0x4e8
> [  276.928031]  #2: ffff00000ff27c68 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x118/0x308
> [  276.939744] 
> [  276.939744] stack backtrace:
> [  276.944114] CPU: 1 PID: 1481 Comm: yavta Not tainted 6.10.0-rc3-00175-g639ee34a20f1 #803
> [  276.952225] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
> [  276.960157] Call trace:
> [  276.962616]  dump_backtrace+0xa0/0x128
> [  276.966391]  show_stack+0x20/0x38
> [  276.969723]  dump_stack_lvl+0x8c/0xd0
> [  276.973412]  dump_stack+0x1c/0x28
> [  276.976747]  print_deadlock_bug+0x29c/0x3b0
> [  276.980950]  __lock_acquire+0x165c/0x1b80
> [  276.984978]  lock_acquire.part.0+0x168/0x310
> [  276.989265]  lock_acquire+0x70/0x90
> [  276.992772]  __mutex_lock+0x10c/0x4b8
> [  276.996458]  mutex_lock_nested+0x2c/0x40
> [  277.000396]  v4l2_subdev_link_validate+0x140/0x308
> [  277.005213]  __media_pipeline_start+0x880/0xc30
> [  277.009763]  __video_device_pipeline_start+0x48/0x68
> [  277.014750]  vsp1_video_streamon+0x148/0x4e8
> [  277.019044]  v4l_streamon+0x50/0x70
> [  277.022553]  __video_do_ioctl+0x4cc/0x5b0
> [  277.026583]  video_usercopy+0x3c4/0xb90
> [  277.030438]  video_ioctl2+0x20/0x48
> [  277.033942]  v4l2_ioctl+0xa4/0xc8
> [  277.037278]  __arm64_sys_ioctl+0xec/0x118
> [  277.041310]  invoke_syscall+0x68/0x198
> [  277.045084]  el0_svc_common.constprop.0+0x80/0x150
> [  277.049900]  do_el0_svc+0x38/0x50
> [  277.053237]  el0_svc+0x4c/0xc0
> [  277.056309]  el0t_64_sync_handler+0x120/0x130
> [  277.060685]  el0t_64_sync+0x190/0x198
> 
> There is no actual deadlock situation caused by the tests, but a lockdep
> class deadlock detection.
> 
> Subdev initialization is handled in one helper function for all subdevs
> created by the driver. This causes all locks for the active state being
> created with the same lock class. As a result, when validating links and
> trying to lock both the sink and source states, lockdep complains of
> recursive locking, even if the two locks are different mutex instances.

Sounds familiar =).

> Working around the issue is likely possible. The
> v4l2_subdev_init_finalize() function is actually a macro calling
> __v4l2_subdev_init_finalize() with an explicit lock class. The VSP1
> driver could do the same and push the lock class one layer up, to the
> callers of vsp1_entity_init(). This would solve part of the problem
> only, as the driver creates multiple subdevs of the same type, so
> dynamic allocation of the lock class may be required. That would however
> be a bad solution, or rather not a solution to the actual problem. There
> is a reason why lockdep groups locks in classes, beside just saving
> memory. When locks belonging to different instances of the same object
> type are taken recursively, it is often the sign of a bad design.
> 
> Even if we worked around this problem, lockdep would later complain
> about AB-BA locking at link validation time. The VSP1 entities can be
> assembled in a pipeline in any order, so even if the link validation
> helpers are careful to always lock in the sink-source order, the sink
> and source could get swapped.
> 
> I believe this calls for a rework of locking for subdev states. The
> option I'm envisioning is to lock all subdevs in a pipeline when
> starting the pipeline, with a new media_pipeline_lock() call just before
> media_pipeline_start(). The link validation helpers would then be called
> with all locks taken, and so would the .s_stream() subdev operations.
> This would simplify locking in drivers as a result, which I think is a
> very desirable side effect. Then, after starting the pipeline, the
> top-level driver would call media_pipeline_unlock(). Similar locking
> would be performed at pipeline stop time, to ensure that the .s_stream()
> operations would also be called with the locks held. Obviously, just
> moving locking around won't fix the lockdep issues, and the second part
> of the fix would be to use ww-mutexes instead of regular mutexes. The
> result would be similar to the implementation of the KMS atomic API,
> giving me some confidence that it goes in the right direction. An
> additional difficulty, however, is that we need to lock both the subdev
> active state and the control handler with the same lock.

This has been the long term plan, but perhaps it's not so far off in the
future, then...

But should the control state be merged to the active state first? I fear
that's a large amount of work in itself, though, but managing the active
state and control state locking separately with the scheme you outline
sounds complex.

Or can we do a new requirement for active-state-enabled subdevs: the
control handler _must_ use the same lock as the active state (which, I
think, is often done already). Would that help?

Or as a temporary solution... If there's a central place in the vsp1
infrastructure, can we have a single (shared) state lock for all the
vsp1 subdevs? That would mean taking the same lock multiple times, but
somehow I recall that a similar thing was already done in some of the
drivers.

So I agree with the goal. But it would be nice to not block this series
until all the work is done. Or can we annotate the locking for this
particular case so that lockdep doesn't care about vsp1 locks?

 Tomi


