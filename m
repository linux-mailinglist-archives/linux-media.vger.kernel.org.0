Return-Path: <linux-media+bounces-39505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 179EDB21DFA
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BCAC7A5AC8
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4E52E7192;
	Tue, 12 Aug 2025 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FRZTBQF+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h0/i/iqi"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBE311C31;
	Tue, 12 Aug 2025 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978900; cv=none; b=S5eZDbgiXyVXiGmJYrXMQWgXk2tmMhWnFkT3ZORxSYXIV4SH1J91iINNF04V6QvdO6P94lNsCWYS2FC2n3sRXexhOIYw02+swFiSYbD90XaNeOLar+mq0l2D1YK2pADW8nNBiQPub+CkVzo6AVD0Cy4X2Bq3IBewL48M1M5Ujs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978900; c=relaxed/simple;
	bh=weK04IPBuk7pXV71ZChC/ScFR/2UzE34NC1nf7qNcrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbRVsd7TnR3h8Pd19wfkyYWLBnZYLFZKg844n3pYXG8PqFSDBsFv7hv5GvrPp7CCsyPs8eyWdSkolpbMq5UCIsvDuL0MCZ5cA2F43DZZVI17UWw3NHsPvHda7b4JBWgi7aUpYvvxwGKKwwKwNZfl9MSt4d/Gg3UJ/ECeGrsDOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FRZTBQF+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h0/i/iqi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65XSwTq1lmsETNc/hSGvGZmapU2l8DMfuplQ8JTrt6k=;
	b=FRZTBQF+df4BzDvzQUdjnydvsZxB9/q4nUUf4COaxsbm+c4S85MQiOPSqnjSXN2Ym64u+g
	OTP3kNdJt7wztEAVQP2oeB9mKyFSmqf7li7iza9Wi4sDj5W0zohJhp8DsTO3MZVz5OpjNj
	ORtv2Ia7qqwZJLH2YVAXG4G3T0EixsMjFgs17nZUJ1zqTI1erQmZn/ce6Jqdpjk6q5fgey
	Gu+0GIhirYT6R1IMKU1Jo7eYqraueJWIZSMKRY9o7BMpIiyDkBEB+w2LYIqH+gmpKfm46U
	jEjtVmq/OTVzJp9WTdjW1MW6caqLNZxXxSBG75oGHIMjksie0xXZF3TxkeACQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65XSwTq1lmsETNc/hSGvGZmapU2l8DMfuplQ8JTrt6k=;
	b=h0/i/iqiNQBjXOPJ+MKq2R+oX8qCqKa0pMBL97g1tU0JE9Pr2ydHNm6tv6Hz/dMKXFYq32
	bh6HBAXg6YZH4cCQ==
Date: Tue, 12 Aug 2025 08:08:15 +0200
Subject: [PATCH 7/8] hrtimer: Use hrtimer_cb_get_time() helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-7-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=2174;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=weK04IPBuk7pXV71ZChC/ScFR/2UzE34NC1nf7qNcrA=;
 b=vLtHypcnvNvq0+i4aIgwtLNrK8vjQdJU9LDI90R/PvWs7ArTAwXeWu9g+2hsDdrjpusZTpJjc
 +Zezqr4NYxLDxvABEngkI+/FHlLEUHfyyxNQY/uAgXqzLOxKc4e0PyW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various other helpers contain open-coded implementations of
hrtimer_cb_get_time(). This prevents refactoring the implementation.

Reuse the existing helper.

For this to work, move hrtimer_cb_get_time() a bit up in the file and also
make its argument 'const'.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/hrtimer.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 1ef867bb8c44b06812d8552441d4092922bfe170..e655502b14e6c4b1a69b67c997132d628bd1470f 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -154,14 +154,14 @@ static inline s64 hrtimer_get_expires_ns(const struct hrtimer *timer)
 	return ktime_to_ns(timer->node.expires);
 }
 
-static inline ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
+static inline ktime_t hrtimer_cb_get_time(const struct hrtimer *timer)
 {
-	return ktime_sub(timer->node.expires, timer->base->get_time());
+	return timer->base->get_time();
 }
 
-static inline ktime_t hrtimer_cb_get_time(struct hrtimer *timer)
+static inline ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
 {
-	return timer->base->get_time();
+	return ktime_sub(timer->node.expires, hrtimer_cb_get_time(timer));
 }
 
 static inline int hrtimer_is_hres_active(struct hrtimer *timer)
@@ -200,8 +200,7 @@ __hrtimer_expires_remaining_adjusted(const struct hrtimer *timer, ktime_t now)
 static inline ktime_t
 hrtimer_expires_remaining_adjusted(const struct hrtimer *timer)
 {
-	return __hrtimer_expires_remaining_adjusted(timer,
-						    timer->base->get_time());
+	return __hrtimer_expires_remaining_adjusted(timer, hrtimer_cb_get_time(timer));
 }
 
 #ifdef CONFIG_TIMERFD
@@ -363,7 +362,7 @@ hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval);
 static inline u64 hrtimer_forward_now(struct hrtimer *timer,
 				      ktime_t interval)
 {
-	return hrtimer_forward(timer, timer->base->get_time(), interval);
+	return hrtimer_forward(timer, hrtimer_cb_get_time(timer), interval);
 }
 
 /* Precise sleep: */

-- 
2.50.1


