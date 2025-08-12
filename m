Return-Path: <linux-media+bounces-39498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CBDB21DEF
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87001904834
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8B92E2843;
	Tue, 12 Aug 2025 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q8rxycew";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WhpyvOLk"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5572D3A86;
	Tue, 12 Aug 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978894; cv=none; b=Dz94AAqvdSwsbjUXysYIE1mMD1ZrZDVc5ihRQk8yIG07M0a+BtdNp7ium1vg3coe1JPEJPaleqpD7MdLjYu0WaTIc/pZ2ItZw49u11Mt7LykifSSxqup1zD80FhfHSr+CC9LLtYYSlYEmOzOKskS0H4Erex97Ued0TMJa3iTxM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978894; c=relaxed/simple;
	bh=cDdskTeMBjfT40lnoI/1lGcD63X/oAcaF7nr3454EvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlZOCykZajMBHUUSaa3TgDEBEZ+hr9pG5S4s2fxp4Faxt07yARR5ehFZo2ZJOUBdU70P2pnTarX9Q6/S/UdrIvPhAGfbrMpWzfoiHCcreMUbdvWlS7zjcGkzmQnXPilVppKuh2eUx6F/zYSfG6Yrlt4thhFB5a4jkoPJX/4yRHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q8rxycew; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WhpyvOLk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AY1zmrXMJNlJnrT+Ag2GsBTSwHxd8YFxQV7SfjD3qQE=;
	b=Q8rxycew8680SdoSUJGV7yloR1XlugUm6B02ZWT6rlGh6sPZPF9ksfUYlgs9DsNXuP8yaE
	uk1w7UGAUTKFXhSCyQl2Kg4ypeupOkFMcSQsbXTve+9JOf3bZVfCu/nW2tvZY05QD7bG9/
	5UBxpAU14+fkgRqT3rZPU4wFvI7wIGd4/Pt1ccMI3Dye055fc2paz0cQ7DeRgaIvIQXkD7
	nD3bLUwAz/Xn3lPyFfNCteEHNzLjbG8Uq7rR6+oode/h/h/Cq6sIyX3UuFkaHnl10Ii6Rh
	oQ0er7NMwykyqN7mPsUuyDpZF3CD/qKJS9K2jMUwCE4+MPR5OOG7IzFjwrTmQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AY1zmrXMJNlJnrT+Ag2GsBTSwHxd8YFxQV7SfjD3qQE=;
	b=WhpyvOLkNJer5E9P40aO2PPg2IjEu07jVRKXmaZudiDm2CgJUinN+J7xxvXiA+HuwpRNt/
	MYYNgTxeu01e8fBA==
Date: Tue, 12 Aug 2025 08:08:09 +0200
Subject: [PATCH 1/8] posix-timers: Avoid direct access to hrtimer clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-1-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=1302;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cDdskTeMBjfT40lnoI/1lGcD63X/oAcaF7nr3454EvY=;
 b=s6H2qGIOSHXhMzrMEftAl5LtWNVTZAORhp9JJiXyNqxAzTGNBqaJzHeQTvCN6yUIPq4+QGLwz
 IxkG+vRhPQuDMpMqDNWI4dPjO7rq6Gv81s20zv/nszNdW+ioStBialZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helpers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/posix-timers.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 8b582174b1f9498a548fc1c214185577f994a647..2741f3725de48ea8f73cc279287631f9d5a6e960 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -299,8 +299,7 @@ static void common_hrtimer_rearm(struct k_itimer *timr)
 {
 	struct hrtimer *timer = &timr->it.real.timer;
 
-	timr->it_overrun += hrtimer_forward(timer, timer->base->get_time(),
-					    timr->it_interval);
+	timr->it_overrun += hrtimer_forward_now(timer, timr->it_interval);
 	hrtimer_restart(timer);
 }
 
@@ -825,7 +824,7 @@ static void common_hrtimer_arm(struct k_itimer *timr, ktime_t expires,
 	hrtimer_setup(&timr->it.real.timer, posix_timer_fn, timr->it_clock, mode);
 
 	if (!absolute)
-		expires = ktime_add_safe(expires, timer->base->get_time());
+		expires = ktime_add_safe(expires, hrtimer_cb_get_time(timer));
 	hrtimer_set_expires(timer, expires);
 
 	if (!sigev_none)

-- 
2.50.1


