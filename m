Return-Path: <linux-media+bounces-39504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA0B21E01
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DEE61882E5D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304A72E62B5;
	Tue, 12 Aug 2025 06:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="15SfcBTq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lx741Oho"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DB62E542E;
	Tue, 12 Aug 2025 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978898; cv=none; b=jO3ggQOzs7KdyBXp29BaktcmclovJ38mxIVaM2ZmSPaqAxvAL6YMcSku7OIYu5kJCEMOfXulTnubNlafdOxdXDDtSKrp4l99mTjvO5PWpzRhSIr1PACJv/A08xTJyDmXyyCnVfu3urlGEDCZaAOMKxggJqCOq8cxT9uJgXpWPDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978898; c=relaxed/simple;
	bh=ZlPbVpsXMz8iOW0v9Pz4dNmeBtsR1+46wB+hYErYmyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhutpuCQrD1Ac8axubANiZHzcWsKAVk5Za8E1TcDvv2sAvwOh1xlYGQCBJpoAoWcjWeEbJO2QEe8X/OLE2nRYWoAhCLV1tXFq0PJSo+eAxgh4A+gcXIbyYPNqZJcfpfJFhLQfpzBZJaJm96h3qdm3DVlwZkCYVAJniD2jryCrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=15SfcBTq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lx741Oho; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=II3r8cLl5IwN5vLIOUrsTh7U9/SK4dZQ+7W5BsTTCsc=;
	b=15SfcBTqE8tuTphV8Iunai6oR2crtp/BhzvA0Ka2w8VuSSWdjtjwLDgj9vUeeidnOO3CDK
	BscuHPQ1TcGMteUSD4FvoA2H+pi98LPjFujdv2RpoIcUZtAdaM+5fKVO4ymBXneTdnUu/y
	9LJogf1rs0tpLtM1qciNq/5Mi0cguN/m3bfspM6P9AgaKjiLjWVr0fQEQN0h59hmz7gJuS
	Y2dRK2ZBzIcZXc5p4g3HXQEKKyCw+2TSu902bz+O1Nrsfc0OUStrwzWE5h4x8HB03wFDSC
	ahagoWJWMFaku0f8ok1oiYYVvUDaCsLAYNIb6WVOoDodOlWnK0PPIRorty/bmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=II3r8cLl5IwN5vLIOUrsTh7U9/SK4dZQ+7W5BsTTCsc=;
	b=lx741Oho5kdPGJs/QbjI0psHdGiQIRPkh4Mk/xS4oD9XixNjxMCvS5CigRbqxYSPEcGNMC
	b7bb4Jlc/QMuDSAA==
Date: Tue, 12 Aug 2025 08:08:16 +0200
Subject: [PATCH 8/8] hrtimer: Remove hrtimer_clock_base::get_time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-8-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=5973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZlPbVpsXMz8iOW0v9Pz4dNmeBtsR1+46wB+hYErYmyA=;
 b=idL6FNTvTClf7v06AUO6+QglbARnxz6J0YmbV7ivG5dOF33b3ePS4lBwtwxzYZVMV/EzmKszo
 Lx97cSPdQK1DxjtEcGgGdRCMXxEsre8vDeTTHcoIy1dLRLcOm0BdUfo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The get_time() callbacks always need to match the bases clockid.
Instead of maintaining that association twice in hrtimer_bases,
use a helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/hrtimer.h        |  5 +----
 include/linux/hrtimer_defs.h   |  2 --
 kernel/time/hrtimer.c          | 34 +++++++++++++++++++++++++---------
 kernel/time/timer_list.c       |  2 --
 scripts/gdb/linux/timerlist.py |  2 --
 5 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index e655502b14e6c4b1a69b67c997132d628bd1470f..2cf1bf65b22578499e7de5417dbda1d34cf12fce 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -154,10 +154,7 @@ static inline s64 hrtimer_get_expires_ns(const struct hrtimer *timer)
 	return ktime_to_ns(timer->node.expires);
 }
 
-static inline ktime_t hrtimer_cb_get_time(const struct hrtimer *timer)
-{
-	return timer->base->get_time();
-}
+ktime_t hrtimer_cb_get_time(const struct hrtimer *timer);
 
 static inline ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
 {
diff --git a/include/linux/hrtimer_defs.h b/include/linux/hrtimer_defs.h
index 84a5045f80f36f88cb47bf23a62a4d0afbd1a2c6..aa49ffa130e57f7278a7d9f96a6d86e6630c69de 100644
--- a/include/linux/hrtimer_defs.h
+++ b/include/linux/hrtimer_defs.h
@@ -41,7 +41,6 @@
  * @seq:		seqcount around __run_hrtimer
  * @running:		pointer to the currently running hrtimer
  * @active:		red black tree root node for the active timers
- * @get_time:		function to retrieve the current time of the clock
  * @offset:		offset of this clock to the monotonic base
  */
 struct hrtimer_clock_base {
@@ -51,7 +50,6 @@ struct hrtimer_clock_base {
 	seqcount_raw_spinlock_t	seq;
 	struct hrtimer		*running;
 	struct timerqueue_head	active;
-	ktime_t			(*get_time)(void);
 	ktime_t			offset;
 } __hrtimer_clock_base_align;
 
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 30899a8cc52c0a9203ce0216fe47f5f19a7bf6ec..4ce754a76ece537570a9a569dbdd95f51b575d78 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -59,6 +59,7 @@
 #define HRTIMER_ACTIVE_ALL	(HRTIMER_ACTIVE_SOFT | HRTIMER_ACTIVE_HARD)
 
 static void retrigger_next_event(void *arg);
+static ktime_t __hrtimer_cb_get_time(clockid_t clock_id);
 
 /*
  * The timer bases:
@@ -76,42 +77,34 @@ DEFINE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases) =
 		{
 			.index = HRTIMER_BASE_MONOTONIC,
 			.clockid = CLOCK_MONOTONIC,
-			.get_time = &ktime_get,
 		},
 		{
 			.index = HRTIMER_BASE_REALTIME,
 			.clockid = CLOCK_REALTIME,
-			.get_time = &ktime_get_real,
 		},
 		{
 			.index = HRTIMER_BASE_BOOTTIME,
 			.clockid = CLOCK_BOOTTIME,
-			.get_time = &ktime_get_boottime,
 		},
 		{
 			.index = HRTIMER_BASE_TAI,
 			.clockid = CLOCK_TAI,
-			.get_time = &ktime_get_clocktai,
 		},
 		{
 			.index = HRTIMER_BASE_MONOTONIC_SOFT,
 			.clockid = CLOCK_MONOTONIC,
-			.get_time = &ktime_get,
 		},
 		{
 			.index = HRTIMER_BASE_REALTIME_SOFT,
 			.clockid = CLOCK_REALTIME,
-			.get_time = &ktime_get_real,
 		},
 		{
 			.index = HRTIMER_BASE_BOOTTIME_SOFT,
 			.clockid = CLOCK_BOOTTIME,
-			.get_time = &ktime_get_boottime,
 		},
 		{
 			.index = HRTIMER_BASE_TAI_SOFT,
 			.clockid = CLOCK_TAI,
-			.get_time = &ktime_get_clocktai,
 		},
 	},
 	.csd = CSD_INIT(retrigger_next_event, NULL)
@@ -1253,7 +1246,7 @@ static int __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
 	remove_hrtimer(timer, base, true, force_local);
 
 	if (mode & HRTIMER_MODE_REL)
-		tim = ktime_add_safe(tim, base->get_time());
+		tim = ktime_add_safe(tim, __hrtimer_cb_get_time(base->clockid));
 
 	tim = hrtimer_update_lowres(timer, tim, mode);
 
@@ -1588,6 +1581,29 @@ static inline int hrtimer_clockid_to_base(clockid_t clock_id)
 	}
 }
 
+static ktime_t __hrtimer_cb_get_time(clockid_t clock_id)
+{
+	switch (clock_id) {
+	case CLOCK_REALTIME:
+		return ktime_get_real();
+	case CLOCK_MONOTONIC:
+		return ktime_get();
+	case CLOCK_BOOTTIME:
+		return ktime_get_boottime();
+	case CLOCK_TAI:
+		return ktime_get_clocktai();
+	default:
+		WARN(1, "Invalid clockid %d. Using MONOTONIC\n", clock_id);
+		return ktime_get();
+	}
+}
+
+ktime_t hrtimer_cb_get_time(const struct hrtimer *timer)
+{
+	return __hrtimer_cb_get_time(timer->base->clockid);
+}
+EXPORT_SYMBOL_GPL(hrtimer_cb_get_time);
+
 static void __hrtimer_setup(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
 			    clockid_t clock_id, enum hrtimer_mode mode)
diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index b03d0ada64695058d4c57f3e29d546ba18bff591..488e47e96e93f96a5a18c0f72b8f4df36270943f 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -102,8 +102,6 @@ print_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
 	SEQ_printf(m, "  .index:      %d\n", base->index);
 
 	SEQ_printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
-
-	SEQ_printf(m,   "  .get_time:   %ps\n", base->get_time);
 #ifdef CONFIG_HIGH_RES_TIMERS
 	SEQ_printf(m, "  .offset:     %Lu nsecs\n",
 		   (unsigned long long) ktime_to_ns(base->offset));
diff --git a/scripts/gdb/linux/timerlist.py b/scripts/gdb/linux/timerlist.py
index 98445671fe83897d50187f302f844919729388dc..ccc24d30de8063b28e0a3068416af341f8951876 100644
--- a/scripts/gdb/linux/timerlist.py
+++ b/scripts/gdb/linux/timerlist.py
@@ -56,8 +56,6 @@ def print_base(base):
     text += " .index:      {}\n".format(base['index'])
 
     text += " .resolution: {} nsecs\n".format(constants.LX_hrtimer_resolution)
-
-    text += " .get_time:   {}\n".format(base['get_time'])
     if constants.LX_CONFIG_HIGH_RES_TIMERS:
         text += "  .offset:     {} nsecs\n".format(base['offset'])
     text += "active timers:\n"

-- 
2.50.1


