Return-Path: <linux-media+bounces-27724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF76A54C23
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B802B3A3696
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0FB20E71C;
	Thu,  6 Mar 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hHzQQtIA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2522720297E
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267665; cv=none; b=tzGJ9+RSVbkh+CwxRB6WA7Ukgn/9YosupXFHZ/sa3/PG7PexT8+6via0eQ6DXHT83qcUmaa5TuzTjypNqvk9AAi0HuT09sMYfHFJUJmxhVxEAiAO5MwUyftzxjSTd01bdcaNV8YlwtFOjIKW5ZStjly4/lyJZOixWbuqFQjTjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267665; c=relaxed/simple;
	bh=M1vo6eIbJ4cdUhRmXLHhitPd8stcAIbGV1GDpMpmCbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxVfzsXdFptNZmRiXEFrurkyW8jsTV0/m9bCFVnLNimOFoKJB9RHtGFzJFmPe6ZdMAR9sjEEEH+mXxdgVDWud5oLB/Ymj2g1/M1LUHlFNeyDwrd5qiijnmxQY7+xBvW64dwOVzj4ieorHp9WhtyEE74SLoD3eb/iFKyB7jw4RT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hHzQQtIA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c3d1664ed5so74312585a.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 05:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741267663; x=1741872463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kus539I2CJtJ6uB69LisMl3/GCpWB9IVQ3KXxg+iETo=;
        b=hHzQQtIA0yY6wYdhrAsKUrSG4EOe+gSmNPnVs4WlW7SVzNfVZwK+6Kp6IxPpB9V+sy
         1g4IjywzSdmJfn+/Tn+sveqZSIIl9G5lUXnzV8TO6KWxqmI1BKEOuWSFSwpiUhYqYTwD
         8iIzC5p7dX7/ndJF8jAmas1ozOA4VmmC/A7k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267663; x=1741872463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kus539I2CJtJ6uB69LisMl3/GCpWB9IVQ3KXxg+iETo=;
        b=qx0xuKgz5vo+OeTFI3OC3xwle7RBciwzbm0SufpX7cNzXQDYNe11vU66ulBcvAeWoN
         iOYIfFb1ur+t+HkegqZhIn1jT1emvd9xVHUZAsitCaPlPRZJoQTm2tGLKM0fo/BbRkKT
         KdciNBRTlGyxJLNy96RD6TzPx+hlJj0siHgnfsuh7lHAZusBIrp4emYX/c3Y+5bUzxBO
         D7svL2Auq8tZvCqp5ld3HygdK1lGlVtxODqfQcL00mTj83M3+ESob+S2uYrds52VWW7w
         Ne3FKvHHcM0L2wPFoRkAOeN3f2GTNQ4dmp8NigFh/q6RgRferrKI1Lr4m2H0He2FqKfa
         VuYw==
X-Gm-Message-State: AOJu0YyaJbal7jnMNrVOVTLss/EvrkRYhSRKcWUleQ1EaxvTltASDVAC
	bV3q2chw+1UtSnM0N+GIRuBj5avhstQWALiH+gJixfRB/psqaDPPgoHbpEsDbjMB+NdvKBswJGy
	maQ==
X-Gm-Gg: ASbGncu9Ri/TlpFj+pVGlyYlkhxQIrmQjpdVLren/2ASHfJ6BfkOtxiroFLOg9I1BVC
	yp5OD4iN1Rp10jbg+ZOKqtarAjdJ3Y0e/VVU5LrCyP01+dC01cwFv1BDVNZFfpttGpeESA0XlDc
	S1wGe2m0NWhjX9kfl1nz69rnFALumEqBRKQ9pNtXoP1u1q9a+WE+rhNQwo2EekQge8EshGq/1xp
	3UPTB3OMxZzWomAa9tdGx0muvvQTK5pPtvqHYUGC2PlQRVflu4Ej+sOM9Tz4wcXBrkg5TQBVl1S
	bcMj+FGHltEaXq5A2YneyrOVjyH9E/BgLA9iDMfwWoYVno7cdbO+tN/nlxH4tEgHdlbfS2oJqpa
	KvtqyjxKzQhUnt/B/8Jn8qg==
X-Google-Smtp-Source: AGHT+IG3I4g3eGA6wCxh1KdiN/p34BEZ4+P/uc/fC39VdDt/4K47oAhpd1+urFScBYiCX7Zbn/ihZg==
X-Received: by 2002:a05:620a:2815:b0:7c0:9ac5:7f9a with SMTP id af79cd13be357-7c3d8e17302mr1299941185a.7.1741267662792;
        Thu, 06 Mar 2025 05:27:42 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e538448fsm91268685a.63.2025.03.06.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 05:27:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Mar 2025 13:27:30 +0000
Subject: [PATCH v2 1/2] media: vivid: Move all fb_info references into
 vivid-osd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-vivid-osd-v2-1-86db53ecb39c@chromium.org>
References: <20250306-vivid-osd-v2-0-86db53ecb39c@chromium.org>
In-Reply-To: <20250306-vivid-osd-v2-0-86db53ecb39c@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Slawomir Rosek <srosek@google.com>, 
 Hidenori Kobayashi <hidenorik@google.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Most references to fb_info are already within vivid-osd.c. This patch
moves the remaining references into vivid-osd.c.

We also take this opportunity to make the function names in vivid-osd
more consistent.

This is a preparation patch to make CONFIG_FB optional for vivid.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c    | 10 ++--------
 drivers/media/test-drivers/vivid/vivid-ctrls.c   |  2 +-
 drivers/media/test-drivers/vivid/vivid-osd.c     | 24 ++++++++++++++++++++----
 drivers/media/test-drivers/vivid/vivid-osd.h     |  5 +++--
 drivers/media/test-drivers/vivid/vivid-vid-out.c |  3 ++-
 5 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 7477ac8cb955647bfb713ef2b171e25ac5d39128..10f5bef3f49cca4c3a0ae62dd4704ac4180a7c43 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1410,8 +1410,6 @@ static int vivid_create_queues(struct vivid_dev *dev)
 		ret = vivid_fb_init(dev);
 		if (ret)
 			return ret;
-		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
-			  dev->fb_info.node);
 	}
 	return 0;
 }
@@ -2197,12 +2195,8 @@ static void vivid_remove(struct platform_device *pdev)
 				video_device_node_name(&dev->radio_tx_dev));
 			video_unregister_device(&dev->radio_tx_dev);
 		}
-		if (dev->has_fb) {
-			v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n",
-				dev->fb_info.node);
-			unregister_framebuffer(&dev->fb_info);
-			vivid_fb_release_buffers(dev);
-		}
+		if (dev->has_fb)
+			vivid_fb_deinit(dev);
 		if (dev->has_meta_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				  video_device_node_name(&dev->meta_cap_dev));
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 2b5c8fbcd0a27858f84c8e1135aeeac3cb5e2750..dc473175fd2b902f64f63d6c27e699547ea0be82 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -369,7 +369,7 @@ static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case VIVID_CID_CLEAR_FB:
-		vivid_clear_fb(dev);
+		vivid_fb_clear(dev);
 		break;
 	}
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
index 5c931b94a7b5e2fd4e50f8bc1b2767e5c927de2b..91ad9b314f2ec3a31cc339408db6db627007d1c5 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.c
+++ b/drivers/media/test-drivers/vivid/vivid-osd.c
@@ -45,13 +45,18 @@ static const u16 rgb565[16] = {
 	0xffff, 0xffe0, 0x07ff, 0x07e0, 0xf81f, 0xf800, 0x001f, 0x0000
 };
 
-void vivid_clear_fb(struct vivid_dev *dev)
+unsigned int vivid_fb_green_bits(struct vivid_dev *dev)
+{
+	return dev->fb_defined.green.length;
+}
+
+void vivid_fb_clear(struct vivid_dev *dev)
 {
 	void *p = dev->video_vbase;
 	const u16 *rgb = rgb555;
 	unsigned x, y;
 
-	if (dev->fb_defined.green.length == 6)
+	if (vivid_fb_green_bits(dev) == 6)
 		rgb = rgb565;
 
 	for (y = 0; y < dev->display_height; y++) {
@@ -333,7 +338,7 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
 }
 
 /* Release any memory we've grabbed */
-void vivid_fb_release_buffers(struct vivid_dev *dev)
+static void vivid_fb_release_buffers(struct vivid_dev *dev)
 {
 	if (dev->video_vbase == NULL)
 		return;
@@ -370,7 +375,7 @@ int vivid_fb_init(struct vivid_dev *dev)
 		return ret;
 	}
 
-	vivid_clear_fb(dev);
+	vivid_fb_clear(dev);
 
 	/* Register the framebuffer */
 	if (register_framebuffer(&dev->fb_info) < 0) {
@@ -380,6 +385,17 @@ int vivid_fb_init(struct vivid_dev *dev)
 
 	/* Set the card to the requested mode */
 	vivid_fb_set_par(&dev->fb_info);
+
+	v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
+		  dev->fb_info.node);
+
 	return 0;
 
 }
+
+void vivid_fb_deinit(struct vivid_dev *dev)
+{
+	v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n", dev->fb_info.node);
+	unregister_framebuffer(&dev->fb_info);
+	vivid_fb_release_buffers(dev);
+}
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.h b/drivers/media/test-drivers/vivid/vivid-osd.h
index f9ac1af25dd3adb86b2f9b2719c4e72eca419ca6..9a7ef83e6eb2e44e20d2a2e98303845703375bcb 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.h
+++ b/drivers/media/test-drivers/vivid/vivid-osd.h
@@ -9,7 +9,8 @@
 #define _VIVID_OSD_H_
 
 int vivid_fb_init(struct vivid_dev *dev);
-void vivid_fb_release_buffers(struct vivid_dev *dev);
-void vivid_clear_fb(struct vivid_dev *dev);
+void vivid_fb_deinit(struct vivid_dev *dev);
+void vivid_fb_clear(struct vivid_dev *dev);
+unsigned int vivid_fb_green_bits(struct vivid_dev *dev);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 5ec84db934d6b0fd9f659298f80cd59a25983a2c..c3398bce6c150dab4b76f5fbe8cb7420edbc0132 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-rect.h>
 
 #include "vivid-core.h"
+#include "vivid-osd.h"
 #include "vivid-vid-common.h"
 #include "vivid-kthread-out.h"
 #include "vivid-vid-out.h"
@@ -907,7 +908,7 @@ int vivid_vid_out_g_fbuf(struct file *file, void *fh,
 	a->base = (void *)dev->video_pbase;
 	a->fmt.width = dev->display_width;
 	a->fmt.height = dev->display_height;
-	if (dev->fb_defined.green.length == 5)
+	if (vivid_fb_green_bits(dev) == 5)
 		a->fmt.pixelformat = V4L2_PIX_FMT_ARGB555;
 	else
 		a->fmt.pixelformat = V4L2_PIX_FMT_RGB565;

-- 
2.48.1.711.g2feabab25a-goog


