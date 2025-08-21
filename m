Return-Path: <linux-media+bounces-40596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B3B2FA99
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD8E600804
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41923431E5;
	Thu, 21 Aug 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g4mNJ5Hs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qXUa5MRv"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7319133EAE8;
	Thu, 21 Aug 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782986; cv=none; b=eYmBCQISgqBDobUtwYxK4e1RWD/JoQ7NrTI2i+G+nS1mQ3gtBcbyHNz4uvsEXAo3TsNv82/BqdPtTuv8b0+WJFRimlyJG1fZVAvbKpsQVYv3d0MNPyPvEu5kGy/WEYjm5k72kMhGMYO3+ylIpTNqT1f79kz/J3udr6t2Jxr7Sj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782986; c=relaxed/simple;
	bh=C8HA7MAat4CTutH8Ds7RWrlApJ2Ch9U6nnOVfDGpy68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWV52B2jXsG5/O+EMjadISypZjNtgSNqFCrviz99hXl3bAyZn4UmlHgzqSYiIKSxR8CenImrUG4hyLwXpbhmLOL5yK4aGwW2NSB3iMmQzKfP3RNWpucOhBGizYLRSbk3jCOeRhNOgM2AarLRoIVxTwXPs4fs3Q3yNJMx774whvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g4mNJ5Hs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qXUa5MRv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUo2PCWANZGhiqLojJUR13Al4FbX97gqpA4dHy48tgI=;
	b=g4mNJ5HsLTqMTEuEc/HtY3ZTgIIldiQqasLr4KHJ3bdJoewEBRSxNOu2imOHPdPOvbP8VQ
	st7PUcP9zG4P+qmGSNw2pFuAHz79F+qiuiTuMIE/ZKgUB/oS2tg1m2d9vshzePw2fwoKYy
	ShgbNfRYNGfry6fAGMB1XflMmJbRsFpVzwCkfv5qCSbXd7sbjmq+eMbCh2MdzdKB9WLQrq
	RZ4+dMFYD3VVXO9ewnR6Qjr3vxWTBc4qSlvPBtnwhZNeo8HDuJuvmnW21GqfpO7e/Ennsq
	elbbE1AhK8ZPielhXeznao1IHfXqk6XSM8jBznKebUcO9ERL9iXl9HI73axW+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUo2PCWANZGhiqLojJUR13Al4FbX97gqpA4dHy48tgI=;
	b=qXUa5MRv05RQCq/DTM8Ys1TTTMzy+xMDiZuups3a+Ja7RBFgQfTEofl7WgAlpai6SCk24T
	d7gW0box2K9ypODw==
Date: Thu, 21 Aug 2025 15:28:14 +0200
Subject: [PATCH v2 7/9] hrtimer: Use hrtimer_cb_get_time() helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-7-3ae822e5bfbd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=2231;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C8HA7MAat4CTutH8Ds7RWrlApJ2Ch9U6nnOVfDGpy68=;
 b=yrC8+fcvi8DFRKTnM0JwV0p4diWr20wIl1Tw904Ggedv7T0ZYK9puC8PVJjg3UzOT5V7oIILL
 LUvkbiD6X4WCX6UA9Qr7JT0oc5W9IE8AIyuMp8nUHgyT/4OGMCr/1xy
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various other helpers contain open-coded implementations of
hrtimer_cb_get_time(). This prevents refactoring the implementation.

Reuse the existing helper.

For this to work, move hrtimer_cb_get_time() a bit up in the file and also
make its argument 'const'.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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


