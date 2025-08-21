Return-Path: <linux-media+bounces-40590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA3B2FA9D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68CB56879C0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64387338F54;
	Thu, 21 Aug 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JOwT72+f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SOT7LMa/"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009E3376B2;
	Thu, 21 Aug 2025 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782982; cv=none; b=XlYTq8p/PCJHHJRKXfaTzPCWIGLMitIoEFMDhcpCSy/9o71Eyv5Q/PWT+3sb2KWANf3IygRRvt8ZuS9jJjg4Ud6n71BXP3H3Oj0vwgD6aChePx2SHl0DcBGDaYzK0td9FsijZMcInhiLYwCdGgeN/lD3RyG3QOn1TCvCL1GPDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782982; c=relaxed/simple;
	bh=R99664LLCcZJl6Qz3rbhs4Lz9ZnyWhsrUx+hOEuxb9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayjKK9D5vfW5Eay429AGYy218cH79HkHK/ikUhibv9SvZL/wQsCvHw8Y15MsuSP8Csp0UCHeCTE6XmLRj8In8i35swm7inQxU3IwVYQPysGabLUk5ySBsC+liHKS8EN2W+GHNz8prLIGe2aB2S32IksXIhP6FjZkRfwkfE65/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JOwT72+f; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SOT7LMa/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d98YrRaD6ZBonCTSAveiD2NgcBz4Lno//N+VhhhS+z4=;
	b=JOwT72+fkJ+YSdBJAQxBPH/cT4fV0s6ukMjz4LPhtJhxStWxoHOuGiMgdKJaknDMv4leVJ
	Zj28wHmcXb7LFoClhu3PUOnd0pRgt/CSL4JPGbqhIDuUbZ+z2ag1mBfLlx3c/g39b4AggF
	F5IzufuysLy4q/q1iqLsQDXNHWZfHnQ3AAnWVxCIdVl+6qZ1KyANlDEKNtbsldZ6vN5+gU
	6gML8tqZJMxkeP7xV3Cl/hsHltEJiSfQI8Gy8pdS1iiLo04WGoL7/Z94U3/7sQ1EE4m7jI
	IXWpNIb95zy7aPududcR9jkg3wI1qaO8YPgbNk3r5j24GYOMklvvOikGpJLS5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d98YrRaD6ZBonCTSAveiD2NgcBz4Lno//N+VhhhS+z4=;
	b=SOT7LMa/FysiKypRUv2iEW2gXx7CyKkMKohDWUTdmrbH1RHGLlBOUqCCGMZHdBp5K5cM2w
	q2lRJo6d6VpNA4AQ==
Date: Thu, 21 Aug 2025 15:28:08 +0200
Subject: [PATCH v2 1/9] posix-timers: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-1-3ae822e5bfbd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=1359;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=R99664LLCcZJl6Qz3rbhs4Lz9ZnyWhsrUx+hOEuxb9M=;
 b=I7tZZwqdGqbhXx6yqnjYphyXgfeMQUUpxeo4unscIZHNMMtJEv8+N4I2MpyigoWVHLqDxKr60
 C3PrK8QBhmXC+VkMpJEcv0M3CZF8zi+Hjy6zTfZIvLEeBXuskVw319T
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helpers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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


