Return-Path: <linux-media+bounces-39499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD624B21DF2
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5DE02A2E74
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66E92E3384;
	Tue, 12 Aug 2025 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o3CoT/WL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yi+EyDT5"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A16311C31;
	Tue, 12 Aug 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978895; cv=none; b=tR3DYV9ZUHhOOj+jZiBK4Fl7Ko2XdDj+q1McQl8Bsg87KvfOoWaOZYP6LcJheBUpdyoeFIxSWRAVAlUstL10CVfweuO7K0B7lznn+YLux7E/E2CVMLJqazj5GJU+QxKllMOySlUMNTh3DviIl37NbdsCTWZDbtHRJtceWWb1Z88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978895; c=relaxed/simple;
	bh=P/mg/4ffu8Rs3cqai0IgxXOlh0xHW/h5Hvab6hH4Sx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhEOLzcR4eD9s9doC430N/E3Um4aUHKlBGxAenGDSVcKB6/xWHsddsF0NrJd+134mYeYnrdH+tBwVReNiXhhC83isQLX0+k0NKHtzVAhO1fD/u2DrHUES3I+ttiyaJ07FYiEEyNIYW2w8ClVlZWDSB10FOxIS4gMhGs/6hyEnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o3CoT/WL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yi+EyDT5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0iMxYdw8C0HtEhISgP4y62XdqD1olCpYK33WTJjb8g=;
	b=o3CoT/WLWZMrlRJJzRVZtu+8QTF66lfKeeMwXCo1r1JTrRHi26zBCkqllLFHTN5yx+vQcq
	TeEWRnzwzcfz4YqSUhulIdLPSKniTkk2A6iX5FORbt2/CkPsDjzKg5u9sKrCo9Rt6OUG0M
	1AZQ8Uvly8NylYE5kB0Ehd7WrAmrOK45qiTpx2gWeTkg97O59nIbiKczmVdc4rTtc/oeEo
	B/jBF8Tw+bLghNNblojVdmf2Jbj/XYD2vl2sInjqRX0ykO1L53aJIV02xIBeh4yto52trw
	yaIYnt1oJk5IkT46rMjc/sOr2Mztu4jznSF3LBMC3Na2p1ZVWNRLQQk+lbqN4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0iMxYdw8C0HtEhISgP4y62XdqD1olCpYK33WTJjb8g=;
	b=Yi+EyDT5jwK+r+Bl9kuOskYEnRrHIGTATbMpiDjdkj6me7Ol28gcc3FW+3jhShwpUn4TSC
	rCWxen/SR5i4ibAA==
Date: Tue, 12 Aug 2025 08:08:10 +0200
Subject: [PATCH 2/8] timers/itimer: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-2-b962cd9d9385@linutronix.de>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
In-Reply-To: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=915;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=P/mg/4ffu8Rs3cqai0IgxXOlh0xHW/h5Hvab6hH4Sx8=;
 b=DyIUhu8mN+/71fv6hW+hJ/t3PpDZ0TXs7GxnecKN9EabUhLjLNuDp2q5rulxJi6xi+otSCFlC
 52ao7KpOXhaAVGtsiWRnf8dBD+u9cTr9zfM+2KIhkvdi+V0GEmgKgGr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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


