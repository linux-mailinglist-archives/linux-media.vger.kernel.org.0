Return-Path: <linux-media+bounces-10926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5978BD6A0
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 23:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39C5BB22C1F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4233815B98F;
	Mon,  6 May 2024 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pj5biK3H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB3B15B55F
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 21:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029831; cv=none; b=dggaHpAhoGo/gz7o6++R653vQq4JZrUQkW9fGBBvug83DAwvRVcPA17yu0IsErL0FS4+H2t6uwkyGuZDuiC9lACkjNJqDmr1ZEHXtzDGgkasM/5lV/c5wCtqsuKAWDdgMpWZrPYDRaNI+mZ/+OuV7Ew8FVsrXvdFwerC5JdQexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029831; c=relaxed/simple;
	bh=onS8B0M5Jv8Adbn3ETYy2u3f71LcIIwxaG7egh3GMOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6qc27BL9SQX/w0v+PIAJO2cd8kZ1HKDDXdrt1hKZ6Z2Q0qE2WQwa7yuWB6Ht39CDrK1s4tfo/hi1LMGtAR+jZwUOd8wmi4eVAkdb3BKF4+DN34YWW1Hy0SYt4nynVtxmoMFmPTstx7AhewPimX53D358Yt7WDhmCA5LH/EgDdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pj5biK3H; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f0585edd8bso779536a34.2
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715029829; x=1715634629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtUlP6VM7qrXki+A4GKytcg5ATq7Ztpreg61VfyOW+M=;
        b=Pj5biK3Hq8ko7p5nG3kzeJ2i7QPZ2N2EZ3zrPitj3cDSf4XcQa2TvVhV99Zii1amFV
         NWN/7Bljo7C06yUa6J6n3XM2cFk/M6D3bYcHimByMxAnvYA6RVgC3RsnffmGEtwxpasN
         KLFC2hPVApiza4s0QPJmEs6j9D2ataalmC1LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715029829; x=1715634629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtUlP6VM7qrXki+A4GKytcg5ATq7Ztpreg61VfyOW+M=;
        b=LW76qtcZw+ZerYaERKJ5LKUe9BNQNf+BHUgJhBzpca7zRYW+hz6mVPY2L+3QYxS0Ig
         JW0vtO9GMkFgHsIBMak+eeL+ZMib2l8HxCCk1sYiQi/PpFAIQQVzAXRBUNi7PUztraat
         f0malYNVkRkx3/LK9HfVksMOVnlbCAqlIh+rqeXy/Me2gqzvz8A2SKTW9qRYiA0Bko9o
         P+ylKCEt6QNAY4p0mlrs30SpchKkXCUoc0UJMneJyKWf538qca3jHwQN3GUy07y+sw4e
         JwlzOw1GdiDumTTZRYAEHuiMPUn6nxKTkzwZSXF2eBM/5daiqpBpDtJmObu8yPkWjglD
         fGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUweyfoPW2Rq/Jj61DgRAa+xajqYrvF/7fFzKBuYltTIA1OTucAHn+PCZeGmZgX+iwnhFhzEJ9hBQ48/8e2cNXP+B5TI1Gfa9ld/tQ=
X-Gm-Message-State: AOJu0YzzoULqYLXfsiNx2e3gFcFnYPeuCVPWvS9MlNxxCkrai3jvnYm8
	s4QolOyvfEtAVBWaibbD6jfIkwXulfX/NL+/ORr7mFuPqoYRnQzewcQnQevPQA==
X-Google-Smtp-Source: AGHT+IF8Sz8E4E8aQminjkh9wNuTyPXbJEfh1IRvEaK9iGF6PZ9aIZftMbIJIZYtGTFlMIVQc4MDfA==
X-Received: by 2002:a9d:6943:0:b0:6f0:30b8:4f06 with SMTP id p3-20020a9d6943000000b006f030b84f06mr5974830oto.2.1715029829149;
        Mon, 06 May 2024 14:10:29 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id pa20-20020a05620a831400b0078f13e59dc9sm4224921qkn.102.2024.05.06.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:10:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 May 2024 21:10:26 +0000
Subject: [PATCH 1/5] media: ivtv: Factor out schedule functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-cocci-locks-v1-1-a67952fe5d19@chromium.org>
References: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
In-Reply-To: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, 
 Jarod Wilson <jarod@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Cocci is very confused by unlock-lock a mutex in the middle of a
function.

Factor the schedules out, avoid code duplication and make cocci a bit
happier.

Fix the following cocci warnings:
drivers/media/pci/ivtv/ivtv-fileops.c:223:4-10: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:230:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:236:4-10: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:245:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:251:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:257:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:272:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:692:4-10: preceding lock on line 689

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ivtv/ivtv-fileops.c | 66 +++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index 4202c3a47d33..cfa28d035586 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -21,6 +21,7 @@
 #include "ivtv-ioctl.h"
 #include "ivtv-cards.h"
 #include "ivtv-firmware.h"
+#include <linux/lockdep.h>
 #include <media/v4l2-event.h>
 #include <media/i2c/saa7115.h>
 
@@ -190,12 +191,27 @@ static void ivtv_update_pgm_info(struct ivtv *itv)
 	itv->pgm_info_write_idx = (itv->pgm_info_write_idx + i) % itv->pgm_info_num;
 }
 
+static void ivtv_schedule(struct ivtv_stream *s)
+{
+	struct ivtv *itv = s->itv;
+	DEFINE_WAIT(wait);
+
+	lockdep_assert_held(&itv->serialize_lock);
+
+	mutex_unlock(&itv->serialize_lock);
+	prepare_to_wait(&s->waitq, &wait, TASK_INTERRUPTIBLE);
+	/* New buffers might have become free before we were added to the waitqueue */
+	if (!s->q_free.buffers)
+		schedule();
+	finish_wait(&s->waitq, &wait);
+	mutex_lock(&itv->serialize_lock);
+}
+
 static struct ivtv_buffer *ivtv_get_buffer(struct ivtv_stream *s, int non_block, int *err)
 {
 	struct ivtv *itv = s->itv;
 	struct ivtv_stream *s_vbi = &itv->streams[IVTV_ENC_STREAM_TYPE_VBI];
 	struct ivtv_buffer *buf;
-	DEFINE_WAIT(wait);
 
 	*err = 0;
 	while (1) {
@@ -258,13 +274,7 @@ static struct ivtv_buffer *ivtv_get_buffer(struct ivtv_stream *s, int non_block,
 		}
 
 		/* wait for more data to arrive */
-		mutex_unlock(&itv->serialize_lock);
-		prepare_to_wait(&s->waitq, &wait, TASK_INTERRUPTIBLE);
-		/* New buffers might have become available before we were added to the waitqueue */
-		if (!s->q_full.buffers)
-			schedule();
-		finish_wait(&s->waitq, &wait);
-		mutex_lock(&itv->serialize_lock);
+		ivtv_schedule(s);
 		if (signal_pending(current)) {
 			/* return if a signal was received */
 			IVTV_DEBUG_INFO("User stopped %s\n", s->name);
@@ -533,6 +543,25 @@ int ivtv_start_decoding(struct ivtv_open_id *id, int speed)
 	return 0;
 }
 
+static int ivtv_schedule_dma(struct ivtv_stream *s)
+{
+	struct ivtv *itv = s->itv;
+	int got_sig;
+	DEFINE_WAIT(wait);
+
+	lockdep_assert_held(&itv->serialize_lock);
+
+	mutex_unlock(&itv->serialize_lock);
+	prepare_to_wait(&itv->dma_waitq, &wait, TASK_INTERRUPTIBLE);
+	while (!(got_sig = signal_pending(current)) &&
+	       test_bit(IVTV_F_S_DMA_PENDING, &s->s_flags))
+		schedule();
+	finish_wait(&itv->dma_waitq, &wait);
+	mutex_lock(&itv->serialize_lock);
+
+	return got_sig;
+}
+
 static ssize_t ivtv_write(struct file *filp, const char __user *user_buf, size_t count, loff_t *pos)
 {
 	struct ivtv_open_id *id = fh2id(filp->private_data);
@@ -544,7 +573,6 @@ static ssize_t ivtv_write(struct file *filp, const char __user *user_buf, size_t
 	int bytes_written = 0;
 	int mode;
 	int rc;
-	DEFINE_WAIT(wait);
 
 	IVTV_DEBUG_HI_FILE("write %zd bytes to %s\n", count, s->name);
 
@@ -618,13 +646,7 @@ static ssize_t ivtv_write(struct file *filp, const char __user *user_buf, size_t
 			break;
 		if (filp->f_flags & O_NONBLOCK)
 			return -EAGAIN;
-		mutex_unlock(&itv->serialize_lock);
-		prepare_to_wait(&s->waitq, &wait, TASK_INTERRUPTIBLE);
-		/* New buffers might have become free before we were added to the waitqueue */
-		if (!s->q_free.buffers)
-			schedule();
-		finish_wait(&s->waitq, &wait);
-		mutex_lock(&itv->serialize_lock);
+		ivtv_schedule(s);
 		if (signal_pending(current)) {
 			IVTV_DEBUG_INFO("User stopped %s\n", s->name);
 			return -EINTR;
@@ -674,20 +696,10 @@ static ssize_t ivtv_write(struct file *filp, const char __user *user_buf, size_t
 
 	if (test_bit(IVTV_F_S_NEEDS_DATA, &s->s_flags)) {
 		if (s->q_full.length >= itv->dma_data_req_size) {
-			int got_sig;
-
 			if (mode == OUT_YUV)
 				ivtv_yuv_setup_stream_frame(itv);
 
-			mutex_unlock(&itv->serialize_lock);
-			prepare_to_wait(&itv->dma_waitq, &wait, TASK_INTERRUPTIBLE);
-			while (!(got_sig = signal_pending(current)) &&
-					test_bit(IVTV_F_S_DMA_PENDING, &s->s_flags)) {
-				schedule();
-			}
-			finish_wait(&itv->dma_waitq, &wait);
-			mutex_lock(&itv->serialize_lock);
-			if (got_sig) {
+			if (ivtv_schedule_dma(s)) {
 				IVTV_DEBUG_INFO("User interrupted %s\n", s->name);
 				return -EINTR;
 			}

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


