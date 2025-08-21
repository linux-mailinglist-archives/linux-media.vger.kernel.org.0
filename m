Return-Path: <linux-media+bounces-40592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BDDB2FAA7
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288A0AC3E9E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEFA33CE8E;
	Thu, 21 Aug 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3XWxarWQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sq0RBBHI"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BBD338F24;
	Thu, 21 Aug 2025 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782983; cv=none; b=dkwMBtMUkHS7cvWyCgn7MNEzaZO5RfZqEXUEymNwCVfxnkpY5ckyOMt9CxLCgMBH8DTvpT4l0QRE64+64zPZXdRoUsmTjPyPuo04rYGD5wZa/S5RcVIMc2gl0zsNPRyOTG4Ryk0aLFSKz6aaof+vFquB0fI9asP8/wDtXK6Lc9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782983; c=relaxed/simple;
	bh=8TdD8g20S+E5Y37FMBzmqxDaVE1/HseBQcU5bJAZLz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMvmLz1i9m7k6oKwa4Iuck1t7BmMMoEVcPOE4cZkuj/5szyaStdA0KseqAehT6AQCjqCBQY0Df7f+Ekh1ANlbIsGXAXbOhz0qtNDOYcsWNN2jKyO56SM7ztxN50IGZ79yz284MPI7ThRiIL+d2fFwR9N44HHpbAWkeP8qnEPoPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3XWxarWQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sq0RBBHI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QGiYiB/8xesJY5UShVLUELwHvGdA3oC793UzeHmwuo=;
	b=3XWxarWQoENVP8OCLcWj0/Crei7qSWdLNYIcn0dGHmIdDUrqDB2e6U99zSAXRMDuL2BJCj
	/I4VM+J9fJtmF8DoIIHeYs6IG2yxeP7h6qPwwLxOcdtUdgXHc0+fy07afXGYzVy8/6slsJ
	wsF6+fv8K5rgE+9cTAz+xkzm0sc2NV9Nqc2jdFuQ7V7pCRk6PDMFaS4KP3MHf47LYbd1eY
	MLkKFtLfxgMTWM2r6vp4L9CQZEDLhU2SoKl2j4U6i9x55XEyR4UFXGHrizRJ9Ob0my0B0T
	dm1/DdSID1RIN6FuoIMLTeA8/F9lrUQqzEJvqTYdcr/SiuuE3YCP7muARY1bGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QGiYiB/8xesJY5UShVLUELwHvGdA3oC793UzeHmwuo=;
	b=sq0RBBHIkKHAeEipIsx3aAg0tzkudUpGESzK+I2SQfQSVwqkXa8GhcRcUxXshuW49wt18o
	Ussfi79tUmPmBxDA==
Date: Thu, 21 Aug 2025 15:28:09 +0200
Subject: [PATCH v2 2/9] timers/itimer: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-2-3ae822e5bfbd@linutronix.de>
References: <20250821-hrtimer-cleanup-get_time-v2-0-3ae822e5bfbd@linutronix.de>
In-Reply-To: <20250821-hrtimer-cleanup-get_time-v2-0-3ae822e5bfbd@linutronix.de>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Matt Wu <wuqiang.matt@bytedance.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Sean Young <sean@mess.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-media@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=972;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8TdD8g20S+E5Y37FMBzmqxDaVE1/HseBQcU5bJAZLz0=;
 b=Nc166gJVmv8rJFcUpugL59JW4rwXuyTnchlIxNKaSNks3ChoED/HfbMYnqO7qXBtyalEHmKtH
 SmzLDJuPYxoDDBKAvzfMOOqBNp1vfz3H15WLdjrkJWSBGWykdqsu+9y
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/time/itimer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index 876d389b2e219a10c0dbddb6a06dd3252c502e99..7c6110e964e7ecd19ab8c5c9b81f1b113c1ae7bd 100644
--- a/kernel/time/itimer.c
+++ b/kernel/time/itimer.c
@@ -163,8 +163,7 @@ void posixtimer_rearm_itimer(struct task_struct *tsk)
 	struct hrtimer *tmr = &tsk->signal->real_timer;
 
 	if (!hrtimer_is_queued(tmr) && tsk->signal->it_real_incr != 0) {
-		hrtimer_forward(tmr, tmr->base->get_time(),
-				tsk->signal->it_real_incr);
+		hrtimer_forward_now(tmr, tsk->signal->it_real_incr);
 		hrtimer_restart(tmr);
 	}
 }

-- 
2.50.1


