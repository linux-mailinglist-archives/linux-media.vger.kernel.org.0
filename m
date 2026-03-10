Return-Path: <linux-media+bounces-55233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLhLKAp7sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:11:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B9257672
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0DB4302E76A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087AC3E92AC;
	Tue, 10 Mar 2026 20:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iGsihBgg"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B83E9289;
	Tue, 10 Mar 2026 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173495; cv=none; b=NwaLLVB07JWJd3AdSfMBiCpO4p0ascOssKAY7z777Xc48bKzoz0YohRPwD8Qb83sNI/55tzt93vDTqqPZZDU9vbtZ1Ch8QxTLSxwcs2KDld2Rxk2RKKL3v9eolVGwjCcIJYN+tXTq3I58a7wD3MS9nyNOySHlqiaKin5Jz2bVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173495; c=relaxed/simple;
	bh=HDQEHdRTRAiovpWYsGndjhrTjQXOKFfgHN9OyG3cbZo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fTkAUzelT4CLeHY3HeKPfmL8vJB88hs3GgzZnE3wwK8XStYghse054j4WcthV3vQjPRcTOrqylMh07oQ+DX+x4ukc7qAYJv9TFbYrwX1JCSHKYzG/RyOLKEHQdDaeZH4gUnFK+nX8gjjl+XXHb3/SQ4j7I0phC9mjyc49zjqRlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iGsihBgg; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773173490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8UqpbDlSSXDhIL8nVLz9zuiJi6m2HGKgtp2ii+7wgg=;
	b=iGsihBggJ5MHkStzwYvO6sAw2yvWw9DIlYlsBq5F50hYJnHosp5cuh08tQtTb9t6rl5lPJ
	pQkgJGnsZotIUsn4WWg5GyMbDuXo8nxi4IQmLLLS0HZHMKsHlH59Sxov40lPodoh8IRWVF
	gNaU57yC5eXMb/kFj/h3SqGqyuinfwY=
Date: Tue, 10 Mar 2026 16:11:26 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] uvc_status_stop hangs if called from async_ctrl.work
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-usb@vger.kernel.org
References: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev>
Content-Language: en-US
In-Reply-To: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 866B9257672
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55233-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/10/26 15:57, Sean Anderson wrote:
> uvc_status_stop can be called from uvc_ctrl_status_event_work:
> 
> ============================================
> WARNING: possible recursive locking detected
> 6.19.6 #5 Not tainted
> --------------------------------------------
> kworker/3:1/59 is trying to acquire lock:
> ffff8b6685d71e28 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> 
> but task is already holding lock:
> ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
> 
> other info that might help us debug this:
> Possible unsafe locking scenario:
> CPU0
> ----
> lock((work_completion)(&dev->async_ctrl.work));
> lock((work_completion)(&dev->async_ctrl.work));
> 
> *** DEADLOCK ***
> May be due to missing lock nesting notation
> 5 locks held by kworker/3:1/59:
> #0: ffff8b668004fb48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3251 kernel/workqueue.c:3359)
> #1: ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
> #2: ffff8b66858524a0 (&chain->ctrl_mutex){+.+.}-{4:4}, at: uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1955) uvcvideo
> #3: ffff8b6685d71d90 (&dev->status_lock){+.+.}-{4:4}, at: uvc_status_put (drivers/media/usb/uvc/uvc_status.c:407) uvcvideo
> #4: ffffffff86cefac0 (rcu_read_lock){....}-{1:3}, at: __flush_work (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 kernel/workqueue.c:4213 kernel/workqueue.c:4271)
> 
> stack backtrace:
> CPU: 3 UID: 0 PID: 59 Comm: kworker/3:1 Not tainted 6.19.6 #5 PREEMPT(full)  4105649303813dfd90b7c3b8911a9bfd5ad160d7
> Hardware name: SECO S.p.A. C93/C93, BIOS 1.12.02 Corinne 04 07/03/2025
> Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
> Call Trace:
> <TASK>
> dump_stack_lvl (lib/dump_stack.c:124)
> print_deadlock_bug (kernel/locking/lockdep.c:3044)
> __lock_acquire (kernel/locking/lockdep.c:3897 kernel/locking/lockdep.c:5237)
> lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870 kernel/locking/lockdep.c:5825)
> ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> ? mark_held_locks (kernel/locking/lockdep.c:4325)
> ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> __flush_work (kernel/workqueue.c:3986 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> ? __pfx_wq_barrier_func (kernel/workqueue.c:3794)
> __cancel_work_sync (kernel/workqueue.c:4429)
>  uvc_status_stop (drivers/media/usb/uvc/uvc_status.c:343 drivers/media/usb/uvc/uvc_status.c:322) uvcvideo
>  uvc_status_put (drivers/media/usb/uvc/uvc_status.c:408) uvcvideo
>  uvc_pm_put (drivers/media/usb/uvc/uvc_v4l2.c:47) uvcvideo
>  uvc_ctrl_clear_handle.isra.0 (drivers/media/usb/uvc/uvc_ctrl.c:1939) uvcvideo
>  uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1959) uvcvideo
>  uvc_ctrl_status_event_work (drivers/media/usb/uvc/uvc_ctrl.c:1996) uvcvideo
> process_scheduled_works (arch/x86/include/asm/jump_label.h:37 include/trace/events/workqueue.h:110 kernel/workqueue.c:3281 kernel/workqueue.c:3359)
> worker_thread (kernel/workqueue.c:3440)
> ? __pfx_worker_thread (kernel/workqueue.c:3386)
> kthread (kernel/kthread.c:463)
> ? __pfx_kthread (kernel/kthread.c:412)
> ret_from_fork (arch/x86/kernel/process.c:164)
> ? __pfx_kthread (kernel/kthread.c:412)
> ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> </TASK>
> 
> The task will wait forever for itself. This causes all future UVC status
> accesses to block with TASK_UNINTERRUPTIBLE and will prevent removing
> the UVC device (and this a clean shutdown).
> 
> I can reliably induce a hang by running qv4l2 and changing any control
> (but guvcview seems fine).
> 
> --Sean

+CC Ricardo since he seems to have worked on this area in the past

