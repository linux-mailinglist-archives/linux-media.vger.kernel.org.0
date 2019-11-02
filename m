Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754E3ED053
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2019 20:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfKBTDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Nov 2019 15:03:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36822 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfKBTDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Nov 2019 15:03:43 -0400
Received: by mail-lf1-f67.google.com with SMTP id a6so6053396lfo.3;
        Sat, 02 Nov 2019 12:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OwXkGlWC6FY9JCKWqS9fhbxPEPEvk7bQIiDtUDxVeTs=;
        b=O1Yz+RC1ehoKp70tqg6wqH1fSa6eyUIOrof1nvCJ9y/LZkPhD/rS8QGJHmkKsXsIhS
         59gIRb3K95NrVGUpCnoHgV+NlBQCP4VaMwyztFh0Ev+wvBlJTyvchkZI4SNzv3ZdGamp
         WrwJES+qhnfCUcNctyvDR5C72Yn0SQeL3HnWqK8jK5taGZVUzKogtA04PPt6B7gAQKAZ
         gIZMjebysofhKV3iF+7PpF/TlQ02exGC8KB11az9G0UQnCzxHZeiKKKWckOUjGcdowEe
         NMSt5etbqyFAI6ChIraWL5pvIchNZdO1rzTGjlhYdGoRAKYNLjBjIXQPyJkCDzQJ17X+
         nlXQ==
X-Gm-Message-State: APjAAAU6Q7etxEC1gZQh/haxWjejOMUOtscZ4+/ZkXRsVof1lMtnKfMY
        CHxetH1eAc+3WSb/879RIDA=
X-Google-Smtp-Source: APXvYqxoXDEgxHyApwxHiv/FJz2JyDq5/2hgWj23wncfFQR+APHe6LpBkzVfuWzfxqx8LfwSBsCYhA==
X-Received: by 2002:a19:41c8:: with SMTP id o191mr11564028lfa.101.1572721421272;
        Sat, 02 Nov 2019 12:03:41 -0700 (PDT)
Received: from hackbase.lan ([213.234.229.88])
        by smtp.gmail.com with ESMTPSA id c3sm3989149lfi.32.2019.11.02.12.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 12:03:40 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Security Officers <security@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Popov <alex.popov@linux.com>
Subject: [PATCH v3 1/1] media: vivid: Fix wrong locking that causes race conditions on streaming stop
Date:   Sat,  2 Nov 2019 22:03:27 +0300
Message-Id: <20191102190327.24903-1-alex.popov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is the same incorrect approach to locking implemented in
vivid_stop_generating_vid_cap(), vivid_stop_generating_vid_out() and
sdr_cap_stop_streaming().

These functions are called during streaming stopping with vivid_dev.mutex
locked. And they all do the same mistake while stopping their kthreads,
which need to lock this mutex as well. See the example from
vivid_stop_generating_vid_cap():
  /* shutdown control thread */
  vivid_grab_controls(dev, false);
  mutex_unlock(&dev->mutex);
  kthread_stop(dev->kthread_vid_cap);
  dev->kthread_vid_cap = NULL;
  mutex_lock(&dev->mutex);

But when this mutex is unlocked, another vb2_fop_read() can lock it
instead of vivid_thread_vid_cap() and manipulate the buffer queue.
That causes a use-after-free access later.

To fix those issues let's:
  1. avoid unlocking the mutex in vivid_stop_generating_vid_cap(),
vivid_stop_generating_vid_out() and sdr_cap_stop_streaming();
  2. use mutex_trylock() with schedule_timeout() in the loops
of the vivid kthread handlers.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 drivers/media/platform/vivid/vivid-kthread-cap.c | 8 +++++---
 drivers/media/platform/vivid/vivid-kthread-out.c | 8 +++++---
 drivers/media/platform/vivid/vivid-sdr-cap.c     | 8 +++++---
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index 003319d7816d..27b9c78d2d05 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -796,7 +796,11 @@ static int vivid_thread_vid_cap(void *data)
 		if (kthread_should_stop())
 			break;
 
-		mutex_lock(&dev->mutex);
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout(1);
+			continue;
+		}
+
 		cur_jiffies = jiffies;
 		if (dev->cap_seq_resync) {
 			dev->jiffies_vid_cap = cur_jiffies;
@@ -956,8 +960,6 @@ void vivid_stop_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
 
 	/* shutdown control thread */
 	vivid_grab_controls(dev, false);
-	mutex_unlock(&dev->mutex);
 	kthread_stop(dev->kthread_vid_cap);
 	dev->kthread_vid_cap = NULL;
-	mutex_lock(&dev->mutex);
 }
diff --git a/drivers/media/platform/vivid/vivid-kthread-out.c b/drivers/media/platform/vivid/vivid-kthread-out.c
index ce5bcda2348c..a657b0d20e2f 100644
--- a/drivers/media/platform/vivid/vivid-kthread-out.c
+++ b/drivers/media/platform/vivid/vivid-kthread-out.c
@@ -143,7 +143,11 @@ static int vivid_thread_vid_out(void *data)
 		if (kthread_should_stop())
 			break;
 
-		mutex_lock(&dev->mutex);
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout(1);
+			continue;
+		}
+
 		cur_jiffies = jiffies;
 		if (dev->out_seq_resync) {
 			dev->jiffies_vid_out = cur_jiffies;
@@ -301,8 +305,6 @@ void vivid_stop_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
 
 	/* shutdown control thread */
 	vivid_grab_controls(dev, false);
-	mutex_unlock(&dev->mutex);
 	kthread_stop(dev->kthread_vid_out);
 	dev->kthread_vid_out = NULL;
-	mutex_lock(&dev->mutex);
 }
diff --git a/drivers/media/platform/vivid/vivid-sdr-cap.c b/drivers/media/platform/vivid/vivid-sdr-cap.c
index 9acc709b0740..590080716962 100644
--- a/drivers/media/platform/vivid/vivid-sdr-cap.c
+++ b/drivers/media/platform/vivid/vivid-sdr-cap.c
@@ -141,7 +141,11 @@ static int vivid_thread_sdr_cap(void *data)
 		if (kthread_should_stop())
 			break;
 
-		mutex_lock(&dev->mutex);
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout(1);
+			continue;
+		}
+
 		cur_jiffies = jiffies;
 		if (dev->sdr_cap_seq_resync) {
 			dev->jiffies_sdr_cap = cur_jiffies;
@@ -303,10 +307,8 @@ static void sdr_cap_stop_streaming(struct vb2_queue *vq)
 	}
 
 	/* shutdown control thread */
-	mutex_unlock(&dev->mutex);
 	kthread_stop(dev->kthread_sdr_cap);
 	dev->kthread_sdr_cap = NULL;
-	mutex_lock(&dev->mutex);
 }
 
 static void sdr_cap_buf_request_complete(struct vb2_buffer *vb)
-- 
2.21.0

