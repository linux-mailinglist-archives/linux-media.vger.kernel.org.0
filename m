Return-Path: <linux-media+bounces-40595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6FB2FA98
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E2F5E54B1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44613341AA7;
	Thu, 21 Aug 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zg2u6smG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d/UR3WLH"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E233A038;
	Thu, 21 Aug 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782985; cv=none; b=HTOq6p52bJJ3Bo5bUtNHHLIjkxPB8sego87Qrq+GdeupoZ/i7duMJYots20M1Agw7oPvaLkLJ7pwl5xYf3JNQ2xthDDW/0ufA+xpeF8Ysz/WGQVYOsHSsGtAzWI889Ir45ZnUAqucnspOIp575wPR2Gfcnmjpdofs0hCdFNe7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782985; c=relaxed/simple;
	bh=wLZelQ/kpyT2kok+58F/HOuQPEnU0d4A0SZIJtDzQyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mh0+3GCSkUBfKoEfV4jUq4mEurRZlfnhLPmgR3Ob5pvC+FLGc2a4SqsmbL7wnVvJVYuEKEyIOKWGOxll85c2o5H5vpVYmKS8RQdxwao8Lbmmd0DZnXhKF39VjMn0ZLYk72KETDv+ypthaemsN90ifaum5b8HOAX/Vz1chR/TEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zg2u6smG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d/UR3WLH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xy+xanDMXLAdtPF9cZBAIngYoPdj6lAtF4kFv7uRHmk=;
	b=Zg2u6smGPql5fu5bTOW2/tA5AH+3Wuvpb++uiBrQGXSWOCQFKEGXcZQmiCAlsfoFn2YC4s
	wqC0vOPuO0ce+Gk3qNBSr/N5BGmcLEh++oCKxqSiN69oE6ZUiePsxu4bDY5FGWqBtAhKWE
	Dfg5Y/wrp9yexai4FzsO8nyEvZKzmG+/18xfafZhwdErtEH8P3Q3zYe37tgwXqAY0Ocdw6
	vKw0yl49JkMeaSJjuvbkiEPPIE+punrrgSImycMrHRoUZ64dQgGaLT4Z5tVprphhVGK42a
	eErfCqa0Ck4ZSZSJ2EALziBJCJ/jM2TJ9qrWI04imB08QkiKyBz35ASPnM1GxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xy+xanDMXLAdtPF9cZBAIngYoPdj6lAtF4kFv7uRHmk=;
	b=d/UR3WLHpxPuS3am5r7/f13uqhT0P53UGvg6nlcCxgxdiqKbqFpExKYskuaEA+oXYUtF8I
	hYyGzok9KvW+OHBg==
Date: Thu, 21 Aug 2025 15:28:12 +0200
Subject: [PATCH v2 5/9] ALSA: hrtimer: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-5-3ae822e5bfbd@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Takashi Iwai <tiwai@suse.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=984;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wLZelQ/kpyT2kok+58F/HOuQPEnU0d4A0SZIJtDzQyM=;
 b=iubOsRI+pclv7Fcvv18ANIPxP9smHk4Hx+X+rK5XGG0M6nu36EWPshrQTheZWqcVqIrv7TAH2
 X/SZ6vrXNArDmqJZwVstX2CRnWQbLrwIA35vMHZkQzY/S5mOdqQRF0N
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/hrtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index c364bd126ac8b311e3ce899e226ff9fd82c4485f..2d5f4d47071f79d7db24c8f004f0f4154808fdd8 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -44,7 +44,7 @@ static enum hrtimer_restart snd_hrtimer_callback(struct hrtimer *hrt)
 	}
 
 	/* calculate the drift */
-	delta = ktime_sub(hrt->base->get_time(), hrtimer_get_expires(hrt));
+	delta = ktime_sub(hrtimer_cb_get_time(hrt), hrtimer_get_expires(hrt));
 	if (delta > 0)
 		ticks += ktime_divns(delta, ticks * resolution);
 

-- 
2.50.1


