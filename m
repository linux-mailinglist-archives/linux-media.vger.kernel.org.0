Return-Path: <linux-media+bounces-55236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLCQMcqFsGk5kQIAu9opvQ
	(envelope-from <linux-media+bounces-55236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:57:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2B2580EB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4037B3076787
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A7E3B4E80;
	Tue, 10 Mar 2026 20:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FEiEFbT8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9F3AE70E
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773176232; cv=none; b=IRXPLT+L6zcI7ZipwuxybErrsHPEkx0kUmY6pwjzXEPY2UNJE3CUkieJLnfrdOngaIqi0+/PTXY/Dg1IO6rNjzHJW2cUB+2YxEQXpkgnapgXAu7syCW9L3SgLQTEFL+FUsTQeM3X87+apo5NAIn/P90jl0GefsslvhFFHEwF3tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773176232; c=relaxed/simple;
	bh=4cT/jwrcV8LVG6OSlx6IfVMiTJ6TX4BNoiyNTzoyBkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llsXQbIuiNS9nppMhOzjMJma7/W+3xzl0J6Ejo0pMBtKD7WbYMzIcLsPsJeGXJ8ZjWO76c8VpzDbH7sWcaq1TmK1r9jm4MXEXsr2C+3LZxKayOS9rRft6ZVGf/csInfBsJZKvTg49LZQcrXxKeuA1iTbQi78vlvWGZ4KoN+treI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FEiEFbT8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so609683a12.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773176228; x=1773781028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSc4dq5MUmqJ3d2P0LjD1A3NlZrm65flx5lzHj2Pir4=;
        b=FEiEFbT8Np9s/mzL/h8h9KkhEqL0tOPUqlAjxmfPL7YpQxk5qqsBDfHI6gnyYAtZFK
         0MYMf0GXBC40n9mDdu0tQzWRSwis55wPzAKrAs6PI7N69Q8gkbkbdQ70lrAmjIgCpqQ+
         JwF2uRTBcnM2lhAxJL8WrCyaVAm+kwYbqMcWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773176228; x=1773781028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSc4dq5MUmqJ3d2P0LjD1A3NlZrm65flx5lzHj2Pir4=;
        b=OhLt1zfrYky3fMCR1ULouHAyd5pqYlKZCdnfqAYSIelTWGSijgudLU14ii/I+tnuc5
         XHgtGQy5V8LG0zYrkfAS0s2Mbn/lXJgxpO/OBo1uyqljIjAzPTFKrUG3w5CYldCYB2TY
         TUYH7idYLmdZkm10m3G2Svr9pKCUo3yJz7EcXsAd/O6qvJFkenhMEXgwrQND5LehLC3j
         8DGbG0KcVhiimlR/vDvN3KTGGBMhUHH3/QDJ1vyK5h5q+bRqhzYXJ0iX7zoQukLGqihz
         JnWdopEXRYfJmYoMpVR71cOqyV5NniQZRMO0qDJQNc2/QIgtwJ5pU+Pobp+1YhPBwhia
         hWnw==
X-Forwarded-Encrypted: i=1; AJvYcCXNTL3Jhxk8ZLlvnBGLxset1IK4yutsSvzvO9VMARDb+E42u9fSKWLEWqVpt8lUOcg+yzUE1ffSi2zj4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cRp8SLCj80oaAyyMk7HnHPTxfC9drxH7nStPXcOFqU4oYan4
	NdgQITYD2MaDbfISYzgroLARgPaJhj78hllhgHiPuwCZlyLNe9/wlt4ZYY2GfE94jl8Ad0CjsCW
	AmjkFGA==
X-Gm-Gg: ATEYQzx2y7tIUt4L9RR3RiyQf1QlU9KBBUpKJZqqjtmfbEVFKUgkXN/GLqspbED3tpv
	m/ZCb0fKrKLe18EKFZz03w3USVHmhzTmQHgmBYo3MVXFUCF1ssXC+EWttMm7fuCYhMtnrn7ybs+
	LU+Y6ZrwnpfNJIQj9Wo3I56MihSFh5lSWd17v6tqurSr4QsjwwrPOLXNKnOkAZwrgiOYZUzjjWP
	Bbw4bmycvcAogZAlgZN5y4lbPHfiXtavrW7RYTfFdrQhlf+PyT0oMRXkCDe9jJYUg8Zvc75MAV9
	zi+xnS3/4Hsrbm8yUiBvJFzGArGXN3jL4q5RBngGOK6SIKmBy1uf8XzoXAHaJ5mOMt/gTCpMTY6
	d7cIKcdUl7pOzgI0ZnGUw96EWR64rA1/uLFtSlbHHbBgfwgvKCG1zKboKeygi9OmfXqG56Iw58n
	Lo5mfsc7oeVtLcDPD1Ov5TebXnbekMX5iEbJrr/yhmksxcjvKexlP8JFbhcAVDY6k8N4/7Az0=
X-Received: by 2002:a05:6402:5355:20b0:65f:73b0:8c87 with SMTP id 4fb4d7f45d1cf-662ba63dea1mr2098983a12.9.1773176228026;
        Tue, 10 Mar 2026 13:57:08 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66314482d9asm65616a12.11.2026.03.10.13.57.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 13:57:07 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b96dc65b886so52968566b.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNg8o/R8968vjlWufAJTIWn2QVJ1jnogY14BpiiTU5SEEWHWYq885gY5RSV/ZE/Mp/qQ6aUBSxsgj+Rg==@vger.kernel.org
X-Received: by 2002:a17:907:d0a:b0:b8a:e013:9c5b with SMTP id
 a640c23a62f3a-b972d3d0198mr7390166b.4.1773176226334; Tue, 10 Mar 2026
 13:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev> <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev>
In-Reply-To: <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Mar 2026 21:56:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
X-Gm-Features: AaiRm52L-3CdDUlW4ddDCKvcPAUyRlLkRbbVnGwrXwgSb9y1qKmzj0cwSOaFOSk
Message-ID: <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
Subject: Re: [BUG] uvc_status_stop hangs if called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 32A2B2580EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55236-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,linux.dev:email]
X-Rspamd-Action: no action

Hi Sean

Thanks for the report.

I have not been able to repro with qv4l2 on my computer :(.

Could you try if this patch works for you? Not saying that it is
beautiful patch, or the way to do it.... but it will let me know if I
am looking in the right place.


diff --git a/drivers/media/usb/uvc/uvc_status.c
b/drivers/media/usb/uvc/uvc_status.c
index 231cfee8e7c2..cca2aed162c3 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -340,7 +340,9 @@ static void uvc_status_stop(struct uvc_device *dev)
         * Cancel any pending asynchronous work. If any status event was queued,
         * process it synchronously.
         */
-       if (cancel_work_sync(&w->work))
+       if (&w->work == current_work())
+               cancel_work(&w->work);
+       else if (cancel_work_sync(&w->work))
                uvc_ctrl_status_event(w->chain, w->ctrl, w->data);

        /* Kill the urb. */
@@ -352,7 +354,7 @@ static void uvc_status_stop(struct uvc_device *dev)
         * cancelled before returning or it could then race with a future
         * uvc_status_start() call.
         */
-       if (cancel_work_sync(&w->work))
+       if (&w->work != current_work() && cancel_work_sync(&w->work))
                uvc_ctrl_status_event(w->chain, w->ctrl, w->data);

        /*

On Tue, 10 Mar 2026 at 21:11, Sean Anderson <sean.anderson@linux.dev> wrote:
>
> On 3/10/26 15:57, Sean Anderson wrote:
> > uvc_status_stop can be called from uvc_ctrl_status_event_work:
> >
> > ============================================
> > WARNING: possible recursive locking detected
> > 6.19.6 #5 Not tainted
> > --------------------------------------------
> > kworker/3:1/59 is trying to acquire lock:
> > ffff8b6685d71e28 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> >
> > but task is already holding lock:
> > ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
> >
> > other info that might help us debug this:
> > Possible unsafe locking scenario:
> > CPU0
> > ----
> > lock((work_completion)(&dev->async_ctrl.work));
> > lock((work_completion)(&dev->async_ctrl.work));
> >
> > *** DEADLOCK ***
> > May be due to missing lock nesting notation
> > 5 locks held by kworker/3:1/59:
> > #0: ffff8b668004fb48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3251 kernel/workqueue.c:3359)
> > #1: ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
> > #2: ffff8b66858524a0 (&chain->ctrl_mutex){+.+.}-{4:4}, at: uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1955) uvcvideo
> > #3: ffff8b6685d71d90 (&dev->status_lock){+.+.}-{4:4}, at: uvc_status_put (drivers/media/usb/uvc/uvc_status.c:407) uvcvideo
> > #4: ffffffff86cefac0 (rcu_read_lock){....}-{1:3}, at: __flush_work (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 kernel/workqueue.c:4213 kernel/workqueue.c:4271)
> >
> > stack backtrace:
> > CPU: 3 UID: 0 PID: 59 Comm: kworker/3:1 Not tainted 6.19.6 #5 PREEMPT(full)  4105649303813dfd90b7c3b8911a9bfd5ad160d7
> > Hardware name: SECO S.p.A. C93/C93, BIOS 1.12.02 Corinne 04 07/03/2025
> > Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
> > Call Trace:
> > <TASK>
> > dump_stack_lvl (lib/dump_stack.c:124)
> > print_deadlock_bug (kernel/locking/lockdep.c:3044)
> > __lock_acquire (kernel/locking/lockdep.c:3897 kernel/locking/lockdep.c:5237)
> > lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870 kernel/locking/lockdep.c:5825)
> > ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > ? mark_held_locks (kernel/locking/lockdep.c:4325)
> > ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > __flush_work (kernel/workqueue.c:3986 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > ? __pfx_wq_barrier_func (kernel/workqueue.c:3794)
> > __cancel_work_sync (kernel/workqueue.c:4429)
> >  uvc_status_stop (drivers/media/usb/uvc/uvc_status.c:343 drivers/media/usb/uvc/uvc_status.c:322) uvcvideo
> >  uvc_status_put (drivers/media/usb/uvc/uvc_status.c:408) uvcvideo
> >  uvc_pm_put (drivers/media/usb/uvc/uvc_v4l2.c:47) uvcvideo
> >  uvc_ctrl_clear_handle.isra.0 (drivers/media/usb/uvc/uvc_ctrl.c:1939) uvcvideo
> >  uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1959) uvcvideo
> >  uvc_ctrl_status_event_work (drivers/media/usb/uvc/uvc_ctrl.c:1996) uvcvideo
> > process_scheduled_works (arch/x86/include/asm/jump_label.h:37 include/trace/events/workqueue.h:110 kernel/workqueue.c:3281 kernel/workqueue.c:3359)
> > worker_thread (kernel/workqueue.c:3440)
> > ? __pfx_worker_thread (kernel/workqueue.c:3386)
> > kthread (kernel/kthread.c:463)
> > ? __pfx_kthread (kernel/kthread.c:412)
> > ret_from_fork (arch/x86/kernel/process.c:164)
> > ? __pfx_kthread (kernel/kthread.c:412)
> > ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > </TASK>
> >
> > The task will wait forever for itself. This causes all future UVC status
> > accesses to block with TASK_UNINTERRUPTIBLE and will prevent removing
> > the UVC device (and this a clean shutdown).
> >
> > I can reliably induce a hang by running qv4l2 and changing any control
> > (but guvcview seems fine).
> >
> > --Sean
>
> +CC Ricardo since he seems to have worked on this area in the past



-- 
Ricardo Ribalda

