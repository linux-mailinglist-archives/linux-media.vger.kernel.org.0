Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF566ED611
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 23:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfKCWRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 17:17:40 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39362 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfKCWRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Nov 2019 17:17:40 -0500
Received: by mail-lf1-f66.google.com with SMTP id 195so10766778lfj.6;
        Sun, 03 Nov 2019 14:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5P6x4fcjhCNPz0bYZMr2G+onFRZjnWkYqyaikTzDXQI=;
        b=bt9YS41fJQw/LjOlLbXgRg8jGz+03C0ARULPhrI962E6iTXFwCzh9QM6QBQ9MVMvfc
         ilAsuL0pZDmKFoqdGBRsPP+7d4G7q4ABeJGrDIYWruYczQ+1fwNG9AeIJqWY7hrwTPTX
         MwWgWvGP39NicvgQapyeLKmcjsvfNPmGZVSSBrLLrP258vXxLGAs+KHdT1gCJHQgyPRd
         Lnpclgp609SBRE19/ayw/0l+dI07GSWag73+k7DI4s28Dategagfb0xTorHcDQh6cO8t
         gpOYiH7eBgBAgFwawUoCAu408ZY4UXR+igRUr3dXdmGtBhzJWIBpfFxGZ9Iwm6OC2A6H
         yBAg==
X-Gm-Message-State: APjAAAX0GOD33te9/7G0i9UagIJh/f9LVf6enixkwNM6b5JofL8ASNIY
        Jtvjd6rORq8t/qye8yImE8w=
X-Google-Smtp-Source: APXvYqxSmjg6gFmy1E2pl250WjWYTqSfdYWrKEQ2vSeGKReEMOKFuAcxDt6zFJO0HBatLUMoS5gTMQ==
X-Received: by 2002:a19:c790:: with SMTP id x138mr14538989lff.61.1572819456145;
        Sun, 03 Nov 2019 14:17:36 -0800 (PST)
Received: from hackbase.lan (128-68-70-109.broadband.corbina.ru. [128.68.70.109])
        by smtp.gmail.com with ESMTPSA id g26sm5961766lfh.1.2019.11.03.14.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 14:17:35 -0800 (PST)
From:   Alexander Popov <alex.popov@linux.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Security Officers <security@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Popov <alex.popov@linux.com>
Subject: [PATCH v4 1/1] media: vivid: Fix wrong locking that causes race conditions on streaming stop
Date:   Mon,  4 Nov 2019 01:17:19 +0300
Message-Id: <20191103221719.27118-1-alex.popov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <7ec33848-67a6-069a-132c-f8550f6e090f@linux.com>
References: <7ec33848-67a6-069a-132c-f8550f6e090f@linux.com>
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
  2. use mutex_trylock() with schedule_timeout_uninterruptible() in
the loops of the vivid kthread handlers.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 drivers/media/platform/vivid/vivid-kthread-cap.c | 8 +++++---
 drivers/media/platform/vivid/vivid-kthread-out.c | 8 +++++---
 drivers/media/platform/vivid/vivid-sdr-cap.c     | 8 +++++---
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index 003319d7816d..31f78d6a05a4 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -796,7 +796,11 @@ static int vivid_thread_vid_cap(void *data)
 		if (kthread_should_stop())
 			break;
 
-		mutex_lock(&dev->mutex);
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout_uninterruptible(1);
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
index ce5bcda2348c..1e165a6a2207 100644
--- a/drivers/media/platform/vivid/vivid-kthread-out.c
+++ b/drivers/media/platform/vivid/vivid-kthread-out.c
@@ -143,7 +143,11 @@ static int vivid_thread_vid_out(void *data)
 		if (kthread_should_stop())
 			break;
 
-		mutex_lock(&dev->mutex);
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout_uninterruptible(1);
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
index 9acc709b0740..2b7522e16efc 100644
--- a/drivers/media/platform/vivid/vivid-sdr-cap.c
+++ b/drivers/media/platform/vivid/vivid-sdr-cap.c
@@ -141,7 +141,11 @@ static int vivid_thread_sdr_cap(void *data)
 		if (kthread_should_stop())
 			break;
 
-		mutex_lock(&dev->mutex);
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout_uninterruptible(1);
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

