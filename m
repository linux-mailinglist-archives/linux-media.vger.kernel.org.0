Return-Path: <linux-media+bounces-39497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68762B21DEE
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF5916610B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F172E092F;
	Tue, 12 Aug 2025 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2pJooUbg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ocR4OZM9"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7E2D3A68;
	Tue, 12 Aug 2025 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978894; cv=none; b=n4rwdqWDq0ZCJRD2tbgz9B3QkXlnGnceXAyewmoJ82i34J08Q4DY2w69kcHU3Xffg2XhPKh111dsUdPJZTRd++USXVNTtYfnthRJz5WrRL+tBsm8CbNQ3Y0daqu8if1HaPpZunqINC/gBftx189QjfiQ+9Dys6rYr5C5gyhjYaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978894; c=relaxed/simple;
	bh=v6PRUY/EWiM4Tr34JlSFzPEl3OtPAgSln11txRP3uNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZGjPB1jLQLCTfKY1m7W7gDEDVmB10sGOpSapq3akPJ3beI2G9phgYiiXEe+71C7QVwM8htLQtxqvYUkqYeh0OakZTeru2bP2W+K+sQ2Jljnejddd2iGHj/jb9nXk1w8jEMCq+UtC0vxS7625bDvSHfTZg9pIPmICqk8aAel0Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2pJooUbg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ocR4OZM9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Je8gkzG7Eor2r+8GZcQpEP39gztxfpRFZY2q3PykxXU=;
	b=2pJooUbg0oeOqo8QFmZaGYGVuNJsGzaWTYkCInAxeOWdh8vwz7xy4bpYWMDAo4Om5AGmuD
	i06yZo/ix5T5DHU4HUX1P7FX6HDuvRISn9BZhpzbAKr8BnVccau9YFUznEle/B3b8yuOAI
	sBL94R/ADQMVuOwYcLC4RMVHNKzEIMZ9AtIYJsdxeu4feITTf8QiiQsCT5mj0iDrLIZa02
	khwFP5zZ8V+zIPI1zRGM8/YEBVdR9fYbu8ADiD59uSK+PuZsByM2xgnoszUNImw4takeTB
	9zKKmP15nto4rTzog/JregF9iPCqeyn1UPn2FO2J2ASTE7IVRpC84QCQ2Q9noQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Je8gkzG7Eor2r+8GZcQpEP39gztxfpRFZY2q3PykxXU=;
	b=ocR4OZM9rec68zWYEFL9+TncK8avwTk7a7MRfyg42XtDWZrIy93QvgtIbny5RidJvOHfF1
	TP0kYWjqQ+jiqLCg==
Subject: [PATCH 0/8] hrtimer: Remove hrtimer_clock_base::get_time
Date: Tue, 12 Aug 2025 08:08:08 +0200
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEjammgC/x2M0QpAQBAAf0X7bIsr7vgVSddZbHG0h5T8u+Nxp
 mZuCCRMAerkBqGTA68+Qp4m4CbrR0LuI4PKVJFpZXCSnRcSdDNZf2w40t59Bo11Va8rbUtTQMw
 3oYGvf920z/MC5Vo0DmoAAAA=
X-Change-ID: 20250728-hrtimer-cleanup-get_time-8ac9d797a685
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=1479;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=v6PRUY/EWiM4Tr34JlSFzPEl3OtPAgSln11txRP3uNg=;
 b=3MnX7eG39ofA2sJ3hIr3xB1sTWMuQl6VLEZLaUfQJu8tSSf+K7geh/ALkwKVVjQaqEPPVOa97
 XQoe4HKD08zBMepYXq14wMZD8LUFrbbCyzIorXr+/8O7Qzekny1EnWa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The get_time() callbacks always need to match the bases clockid.
Instead of maintaining that association twice in hrtimer_bases,
use a helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (8):
      posix-timers: Avoid direct access to hrtimer clockbase
      timers/itimer: Avoid direct access to hrtimer clockbase
      sched/core: Avoid direct access to hrtimer clockbase
      lib: test_objpool: Avoid direct access to hrtimer clockbase
      ALSA: hrtimer: Avoid direct access to hrtimer clockbase
      media: pwm-ir-tx: Avoid direct access to hrtimer clockbase
      hrtimer: Use hrtimer_cb_get_time() helper
      hrtimer: Remove hrtimer_clock_base::get_time

 drivers/media/rc/pwm-ir-tx.c   |  5 +----
 include/linux/hrtimer.h        | 14 +++++---------
 include/linux/hrtimer_defs.h   |  2 --
 kernel/sched/core.c            |  2 +-
 kernel/time/hrtimer.c          | 34 +++++++++++++++++++++++++---------
 kernel/time/itimer.c           |  3 +--
 kernel/time/posix-timers.c     |  5 ++---
 kernel/time/timer_list.c       |  2 --
 lib/test_objpool.c             |  2 +-
 scripts/gdb/linux/timerlist.py |  2 --
 sound/core/hrtimer.c           |  2 +-
 11 files changed, 37 insertions(+), 36 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-hrtimer-cleanup-get_time-8ac9d797a685

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


