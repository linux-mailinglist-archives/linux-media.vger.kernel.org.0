Return-Path: <linux-media+bounces-55224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBO1F9N3sGmtjgIAu9opvQ
	(envelope-from <linux-media+bounces-55224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:58:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2325743B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23DFC30F834A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 19:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C1A3E1D15;
	Tue, 10 Mar 2026 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AG6N4XTI"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23973E1CFF
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 19:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172650; cv=none; b=qjAm8WU9MRp9hrdkr/ZJFXhNeHbLZnllFEEidXo++fMXZbYEBMzWWK5OFdyN2JYo2BoOFn+cgmc8kMfe5Dj2S/gPdq5sBZ9xNGLrJd65PhF8K8n03a9r6jSlVWVtS6Ni2xxDo0GAUVRrZsemGukT0XzKKSITB5prsEeGjaGmsfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172650; c=relaxed/simple;
	bh=e9bODuqlaG2Xter97XZxGXh7jNw9Nf4LhxmxOtgb0b8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cm244lvexQDr7l/0CWBwLzbEyLmyWpGxvOCmYv+3P9JvBdDv2AnSjAOdJylCbZWjLtQyYhH9DNGNYYE4Z9IF/xz6c59yYr+a9XvQdV6xTbWYIHuDIeAA7iCJn5DrJprULU224JOFJ3UbJA6m/QHC7eCmoC7FlxxOxzlJWpGhBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AG6N4XTI; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773172635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YTesWbyvhtesq292IMR55jTYbbL/0wBB1QE/c5ZWt5o=;
	b=AG6N4XTIHgXgQinA7CP/GicX1EosH/zeGe84CWsXWkWh+FZX3iBNSzqFNQjQvJ1H7qqfJD
	ITJHryg7O03HEUWvTIw8whBqD+7QNO894o38++W2lE/ZqAajfyzUNTNUyb49jE73SsY9DX
	/SLW/0b+xdCsLM1lbGEdzZw4VRbzTDg=
Date: Tue, 10 Mar 2026 15:57:11 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
Subject: [BUG] uvc_status_stop hangs if called from async_ctrl.work
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: BDD2325743B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_FROM(0.00)[bounces-55224-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Action: no action

uvc_status_stop can be called from uvc_ctrl_status_event_work:

============================================
WARNING: possible recursive locking detected
6.19.6 #5 Not tainted
--------------------------------------------
kworker/3:1/59 is trying to acquire lock:
ffff8b6685d71e28 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)

but task is already holding lock:
ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)

other info that might help us debug this:
Possible unsafe locking scenario:
CPU0
----
lock((work_completion)(&dev->async_ctrl.work));
lock((work_completion)(&dev->async_ctrl.work));

*** DEADLOCK ***
May be due to missing lock nesting notation
5 locks held by kworker/3:1/59:
#0: ffff8b668004fb48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3251 kernel/workqueue.c:3359)
#1: ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
#2: ffff8b66858524a0 (&chain->ctrl_mutex){+.+.}-{4:4}, at: uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1955) uvcvideo
#3: ffff8b6685d71d90 (&dev->status_lock){+.+.}-{4:4}, at: uvc_status_put (drivers/media/usb/uvc/uvc_status.c:407) uvcvideo
#4: ffffffff86cefac0 (rcu_read_lock){....}-{1:3}, at: __flush_work (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 kernel/workqueue.c:4213 kernel/workqueue.c:4271)

stack backtrace:
CPU: 3 UID: 0 PID: 59 Comm: kworker/3:1 Not tainted 6.19.6 #5 PREEMPT(full)  4105649303813dfd90b7c3b8911a9bfd5ad160d7
Hardware name: SECO S.p.A. C93/C93, BIOS 1.12.02 Corinne 04 07/03/2025
Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
Call Trace:
<TASK>
dump_stack_lvl (lib/dump_stack.c:124)
print_deadlock_bug (kernel/locking/lockdep.c:3044)
__lock_acquire (kernel/locking/lockdep.c:3897 kernel/locking/lockdep.c:5237)
lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870 kernel/locking/lockdep.c:5825)
? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
? mark_held_locks (kernel/locking/lockdep.c:4325)
? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
__flush_work (kernel/workqueue.c:3986 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
? __pfx_wq_barrier_func (kernel/workqueue.c:3794)
__cancel_work_sync (kernel/workqueue.c:4429)
 uvc_status_stop (drivers/media/usb/uvc/uvc_status.c:343 drivers/media/usb/uvc/uvc_status.c:322) uvcvideo
 uvc_status_put (drivers/media/usb/uvc/uvc_status.c:408) uvcvideo
 uvc_pm_put (drivers/media/usb/uvc/uvc_v4l2.c:47) uvcvideo
 uvc_ctrl_clear_handle.isra.0 (drivers/media/usb/uvc/uvc_ctrl.c:1939) uvcvideo
 uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1959) uvcvideo
 uvc_ctrl_status_event_work (drivers/media/usb/uvc/uvc_ctrl.c:1996) uvcvideo
process_scheduled_works (arch/x86/include/asm/jump_label.h:37 include/trace/events/workqueue.h:110 kernel/workqueue.c:3281 kernel/workqueue.c:3359)
worker_thread (kernel/workqueue.c:3440)
? __pfx_worker_thread (kernel/workqueue.c:3386)
kthread (kernel/kthread.c:463)
? __pfx_kthread (kernel/kthread.c:412)
ret_from_fork (arch/x86/kernel/process.c:164)
? __pfx_kthread (kernel/kthread.c:412)
ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
</TASK>

The task will wait forever for itself. This causes all future UVC status
accesses to block with TASK_UNINTERRUPTIBLE and will prevent removing
the UVC device (and this a clean shutdown).

I can reliably induce a hang by running qv4l2 and changing any control
(but guvcview seems fine).

--Sean

