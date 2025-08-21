Return-Path: <linux-media+bounces-40593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D14B2FAA4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FEEAC4E84
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CB1340D95;
	Thu, 21 Aug 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DJOsFZQH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bNSPFT5W"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C1338F32;
	Thu, 21 Aug 2025 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782984; cv=none; b=KFhABzgw8f+JKUUVRZwxnHg3s+2va49pSMOv9TgfcRyQ9o3y0vpJHEsxUwVL3PnsRNnvOvjsOjNWwq+wq/MsD+HLatIG1F8AbwA6xK6CtHxxq38v3OpRtciQT7LtKkd0rh0LhVbRf0mEhXEL1k94QyIOwm7HHh6mgqvaZMuIsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782984; c=relaxed/simple;
	bh=WDy/YS4aTPBNNBNBVBxwStADqkF5AS/Xq3IlcmAmOUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALxBT6PIjKC7u7JENvU5KTIYfGgPavUvdF4eDr6E8iJKBKqdQC8QLFeDU3RAjr2RkjFzkggwV3yLYEgAXhXCikXOQO8IeT1Yaq3rsqZfq6e5iXeTr3VkLKOJoFG0MzaCY1TIDbzrDDPY43A/D8KUaBKW6kbhrWy9kMnzByaKf3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DJOsFZQH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bNSPFT5W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6/471kOwUnsmFC+IohXvES4JYDDxtnSEA2zaEPJpzM=;
	b=DJOsFZQH0sLqHBwG2NXJrHbfzgvvYjuHJTw19Tg3c1qI+Utk6oB4VKXzrs7McSXJhcI59j
	jIQJrcX5hlmBcSHz1WSWLS4OVv4d1UN8B+ZH1cQoW4R/h7vLbdrPuLFZcx0zIbTRrbds7E
	wOZ+IZLIb6RDJDHiczp4sTMC5XKOcSBksF6t0vA9BIbw0rF3CTaLoKlg5qWboG1GkLJ/tU
	EiGk+ogHXrk8l4ISKAj+JHlkGZA5mvpTDXnzPAgvyn4qGjWP89hP3lsUNsgIzg5US6Rji4
	4TRG8t+0/5f9pCBcbJ+I1blmuVbYFXZWvxN81JFZ2f34w6stki15R06elfqWrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6/471kOwUnsmFC+IohXvES4JYDDxtnSEA2zaEPJpzM=;
	b=bNSPFT5Wi8mGdfLEbSihSUF5OI9xcBSzrnFvd+kGieViywfB8qznSqgjCenwb5PKmWbjb4
	mvptAdYhvIiL2SDA==
Date: Thu, 21 Aug 2025 15:28:11 +0200
Subject: [PATCH v2 4/9] lib: test_objpool: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-4-3ae822e5bfbd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=897;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WDy/YS4aTPBNNBNBVBxwStADqkF5AS/Xq3IlcmAmOUQ=;
 b=uMhd1ujE2E8eS4470OZtIe/Qe0kH48x99QuO4oCa0sf9Iq9K2hImkfPEU1Iuq1rB+OqmUtGmL
 F2rZi/0v7m2BdIJapy9s0J1ZCNmIege9fRH/XpLSF6OzyObb/0DAj5C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 lib/test_objpool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_objpool.c b/lib/test_objpool.c
index 8f688187fa8727e26d2d065c46e789ee15fd55b5..6a34a7582fdbf50b5632043ec19e77c8fd4dad78 100644
--- a/lib/test_objpool.c
+++ b/lib/test_objpool.c
@@ -164,7 +164,7 @@ static enum hrtimer_restart ot_hrtimer_handler(struct hrtimer *hrt)
 	/* do bulk-testings for objects pop/push */
 	item->worker(item, 1);
 
-	hrtimer_forward(hrt, hrt->base->get_time(), item->hrtcycle);
+	hrtimer_forward_now(hrt, item->hrtcycle);
 	return HRTIMER_RESTART;
 }
 

-- 
2.50.1


