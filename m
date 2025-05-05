Return-Path: <linux-media+bounces-31801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56AAAB471
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A26C64A060D
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 05:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E2B2F10A4;
	Tue,  6 May 2025 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyUuOUnz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E602F0B89;
	Mon,  5 May 2025 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486690; cv=none; b=kiXDE3yocsPL7qg560idZjmHxMuA0O5+/zz/mdwnD6D1zxGYB97jLBXc4CNKXHUUdIeAYr/4BuFk3oEUXpw0wGqE9Sz4t5BKHkss5s0PE2oA8qknP0eTdUqkoZTNUUg0CAHFFEu7GuJRGCSBEohW+GTtoDadbnn3G9H/DUn4VoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486690; c=relaxed/simple;
	bh=F7wlOSoyZJPNbhzzfvtwOOj3HiP7SzYrJM37PZhVR5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GHlGQFB/yQqUDqe1ISOz1QXz7qxu7Sdzxg+DB2pw2+99Vggm1Tgc5QJeF/ofLElsMLDgbNiQ+78/8GdxUPdCkrOgDGTq2S/+AdJvfaFyrpNNQ9LonuQPAAStUxU8ck1UB6ZkQi3XTj4e8vbMcnCFaHOCmbLvrEMtzISLwVGva4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyUuOUnz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0943EC4CEE4;
	Mon,  5 May 2025 23:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486689;
	bh=F7wlOSoyZJPNbhzzfvtwOOj3HiP7SzYrJM37PZhVR5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyUuOUnzrVRdFpzyaqMvNjfQVgqe2AD4tqvvuHaAlZeOzABt4bES5X7bwpzXoUxhK
	 tm514Qz25kriJy1cWjboZGqLTCzABXLAxgJoIE8aR7juno0vi7sGr5KhtCW/p7s/Ea
	 wwoerLF4cHdOKuGQacCgxcXPu7HcAynAlCSiN2ovBoOWHPYAFLL5fUF+ptS5BN/3j0
	 5jsc0klj0e1TQgjBZtXQz4R16EPWOMAF0GeMCb6HmobSoodpIIwZdcdhMJmT7HGMEN
	 GTaVRZfjuDR7nGrnSj13sg3hMBHZ8X0ugCeapfkMi+AyyaiiJFX7UIRldUDiCmoBE6
	 wggzWkTfYVOyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	"Artem S . Tashkinov" <aros@gmx.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 152/212] media: test-drivers: vivid: don't call schedule in loop
Date: Mon,  5 May 2025 19:05:24 -0400
Message-Id: <20250505230624.2692522-152-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit e4740118b752005cbed339aec9a1d1c43620e0b9 ]

Artem reported that the CPU load was 100% when capturing from
vivid at low resolution with ffmpeg.

This was caused by:

while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
       !kthread_should_stop())
        schedule();

If there are no other processes running that can be scheduled,
then this is basically a busy-loop.

Change it to wait_event_interruptible_timeout() which doesn't
have that problem.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Reported-by: Artem S. Tashkinov <aros@gmx.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219570
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c  | 11 ++++++++---
 drivers/media/test-drivers/vivid/vivid-kthread-out.c  | 11 ++++++++---
 .../media/test-drivers/vivid/vivid-kthread-touch.c    | 11 ++++++++---
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c      | 11 ++++++++---
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 690daada7db4f..54e6a6772035f 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -894,9 +894,14 @@ static int vivid_thread_vid_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
-		       !kthread_should_stop())
-			schedule();
+		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
+			continue;
+
+		wait_queue_head_t wait;
+
+		init_waitqueue_head(&wait);
+		wait_event_interruptible_timeout(wait, kthread_should_stop(),
+					cur_jiffies + wait_jiffies - jiffies);
 	}
 	dprintk(dev, 1, "Video Capture Thread End\n");
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index 0833e021bb11d..8a17a01e6e426 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -235,9 +235,14 @@ static int vivid_thread_vid_out(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
-		       !kthread_should_stop())
-			schedule();
+		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
+			continue;
+
+		wait_queue_head_t wait;
+
+		init_waitqueue_head(&wait);
+		wait_event_interruptible_timeout(wait, kthread_should_stop(),
+					cur_jiffies + wait_jiffies - jiffies);
 	}
 	dprintk(dev, 1, "Video Output Thread End\n");
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
index fa711ee36a3fb..c862689786b69 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
@@ -135,9 +135,14 @@ static int vivid_thread_touch_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
-		       !kthread_should_stop())
-			schedule();
+		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
+			continue;
+
+		wait_queue_head_t wait;
+
+		init_waitqueue_head(&wait);
+		wait_event_interruptible_timeout(wait, kthread_should_stop(),
+					cur_jiffies + wait_jiffies - jiffies);
 	}
 	dprintk(dev, 1, "Touch Capture Thread End\n");
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 0ae5628b86c95..abccd1d0109ec 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -206,9 +206,14 @@ static int vivid_thread_sdr_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
-		       !kthread_should_stop())
-			schedule();
+		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
+			continue;
+
+		wait_queue_head_t wait;
+
+		init_waitqueue_head(&wait);
+		wait_event_interruptible_timeout(wait, kthread_should_stop(),
+					cur_jiffies + wait_jiffies - jiffies);
 	}
 	dprintk(dev, 1, "SDR Capture Thread End\n");
 	return 0;
-- 
2.39.5


