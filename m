Return-Path: <linux-media+bounces-40594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F99B2FA97
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D686717F7C7
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022BA34166D;
	Thu, 21 Aug 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JIaqbQ2y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2d1/NdDI"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621D33A017;
	Thu, 21 Aug 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782985; cv=none; b=HoIRDLdoO2vM8rO67JjqaaEMoTAwuEH0BsgZNWvpRUelfb8TZtJzaVLNRK1OWpR7UCDtzK9FL7qRU7uHQ7I2s5XtQnvMOb+vyOaXhYYPlR7chOdBg9dFwWEEsWAIKEG+XaBTUz23LXARd4YSYvLrb9Db1ev94cuSnv4mbMWvedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782985; c=relaxed/simple;
	bh=RPFsLa3yQ2QgDbviDAxjqf/hGOj6JYSwyyBya7kgUUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSZ7FyV72e+6pWaFsxN2Jn24yhneiQaQ0l82RvBJ7jVnH0dUEPML4XLfJnWxCjVDytph6ifgKYNHagKNQwQd6BTd8dJyDV0UrC/KUsvHjSGVwltScng20ubWgauAK8pF3X59YX+PWAQS2oqhCzcr23mHe/XoYOA7Om18oWeUiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JIaqbQ2y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2d1/NdDI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyHeBhASay/ARiVrkliySf60pZbwbK5kiO8ZEYitBJo=;
	b=JIaqbQ2yRAcj8cKQfvhnxYdm+2kjLDIiF1vj6ZYbfL1xed4nd3gXOmzrEjTAaF/RND7MoW
	A5m5rA/prVperuaid+9YrR/apOE7z7Z5rd58fuuhTZ+2e2zVK6gE4Ilb8i6nDDJpqMLiQP
	g7gj5rt6xGFHcuo2g1jI8lgCxTULHbNQr0B593Z46hdFXMAzxmY3nG8Y46viTsv/t9zNEH
	NSLoC6kD4JNt48VJ//k2z9WhNkKaFsAngIv7EvmnqvXPFHXJSTA76YYAVXuU7rG18r/fcX
	pMcvjtzcdQLhE2oEA6I8TA+VrAxYxdMFlETWyhPOdVtTgtJkar0QaY8B4ZYUkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyHeBhASay/ARiVrkliySf60pZbwbK5kiO8ZEYitBJo=;
	b=2d1/NdDIxIhSkgZcdJ6ZVM/qbHtYgbmy5GQ3CWgon0UJirT1Ie9M95S1j0VhbfphB3pZdw
	KXGQQACNTQcpOBAw==
Date: Thu, 21 Aug 2025 15:28:13 +0200
Subject: [PATCH v2 6/9] media: pwm-ir-tx: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-6-3ae822e5bfbd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=1342;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RPFsLa3yQ2QgDbviDAxjqf/hGOj6JYSwyyBya7kgUUE=;
 b=M9m9J1m9cAiXYY+tJTQcRJPFbIxtKaBHotv/I2t0CESbO0pHAdKJ8HNrViemFmYmf9jdWBxVu
 nyQkSA+PlVMDeM0egZXEUOBH83YohlGexhFaPhPofVbT283WrCdHUyQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to an equivalent higher-level helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/pwm-ir-tx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index 84533fdd61aa6ce3c0f8593aaefe5919fd05c7f9..047472dc9244afe0e56e505be20f36fd7d9c449a 100644
--- a/drivers/media/rc/pwm-ir-tx.c
+++ b/drivers/media/rc/pwm-ir-tx.c
@@ -117,7 +117,6 @@ static int pwm_ir_tx_atomic(struct rc_dev *dev, unsigned int *txbuf,
 static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
 {
 	struct pwm_ir *pwm_ir = container_of(timer, struct pwm_ir, timer);
-	ktime_t now;
 
 	/*
 	 * If we happen to hit an odd latency spike, loop through the
@@ -139,9 +138,7 @@ static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
 		hrtimer_add_expires_ns(timer, ns);
 
 		pwm_ir->txbuf_index++;
-
-		now = timer->base->get_time();
-	} while (hrtimer_get_expires_tv64(timer) < now);
+	} while (hrtimer_expires_remaining(timer) > 0);
 
 	return HRTIMER_RESTART;
 }

-- 
2.50.1


