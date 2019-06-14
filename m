Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E7E46018
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 16:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfFNOJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 10:09:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41498 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfFNOJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 10:09:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so1526916pff.8
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2019 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5jmyraFK+HefmSK/NzfY8rdu3D1WF3ChnNGRHtN7efw=;
        b=b5zqLTqgnXaBkqzL8AeP2uTKHudm0JqxQf/fSE5u7YkjThPp7SeJ4oYbdq+bolWdAa
         576U4jHd1wMqQxUFId6OIwmTRCFIYGLloGMDx5H/2SUP5IHPWDcB9BkhhfuXfpiMJ9gw
         S0ArMiDRlIxez63HL/jU/ye+5JnpoeMVkvj9AUAd2Wopnh2il9fmLkGbsH0CQ+ZQfrW/
         MpY1dV7XyKdTVWUz8vd2Efd/SuYbSm38hCujG7xKGJ0mgSsO8NJ7yU7JLf5q8EFZvkDS
         rzKMRBJQ7G6xChikscci0Y1xrsEzUwZ8+wVgpL3JjOMLCBQg0fTqZmuz7NZTec1qqZ1d
         dfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5jmyraFK+HefmSK/NzfY8rdu3D1WF3ChnNGRHtN7efw=;
        b=PLiMxK+9zKHyhr54Jdpo8swg9q6OW1fPdlYxiSQCSdGVqXaknt1NDJzx41eioSqFQt
         2dr9vC55zih6mL6jfglwYNBvICVi298bpKr+aYmoo5R7UxnHEiOac4Dgsfj5fgvm/wg/
         iqtJ9RMiGpWsAoexAyDaijzcn6qt7YO8MRFRrkLgH6Ow34oCxq1skCaiW3k9cMCqNkUx
         8w9WkGDNBGDiQK2acclQI4Fb51qTGbYy4baCMuzrX4Aw1Ey1AqzGetOxyoNZvuLOkENd
         +RAsPRcXrMIMorz0CbYnjpFeyvvh+8jiiFcxrMp17cldmTdUKe85g7GA9q0qMVvDvH8A
         3O+g==
X-Gm-Message-State: APjAAAWVkQ7ztVFY2UdKjib6A1ocCoppATZ3F9q1z0iOLzzJWLvgCKYz
        hij0gn4Y4vDF8AZkXwAXZrTLL6GPRqA=
X-Google-Smtp-Source: APXvYqyXrFTCef/9QY8493OWXjMYtSF0X1Vv4kTLJLsHS/AmXzLTAraFZVZbI2dzrWEk7xhiTKJ40A==
X-Received: by 2002:a63:1622:: with SMTP id w34mr36211600pgl.45.1560521362642;
        Fri, 14 Jun 2019 07:09:22 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:1b24:991b:df50:ea3f])
        by smtp.gmail.com with ESMTPSA id i25sm3040932pfr.73.2019.06.14.07.09.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 14 Jun 2019 07:09:21 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: vivid: remove unnecessary min and max timeperframe constants
Date:   Fri, 14 Jun 2019 23:09:06 +0900
Message-Id: <1560521346-24668-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tpf_min (1/100) and tpf_max (100/1) are used as the lowest and the
highest allowable value for the desired frame period in
vivid_vid_cap_s_parm().

But the comparison between these values is unnecessary because the compared
value is already chosen from webcam_intervals[] (from 1/60 to 1/1).

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.h    | 12 ------------
 drivers/media/platform/vivid/vivid-vid-cap.c |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 6697c70..18a9ba9 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -22,18 +22,6 @@
 #define dprintk(dev, level, fmt, arg...) \
 	v4l2_dbg(level, vivid_debug, &dev->v4l2_dev, fmt, ## arg)
 
-/* Maximum allowed frame rate
- *
- * vivid will allow setting timeperframe in [1/FPS_MAX - FPS_MAX/1] range.
- *
- * Ideally FPS_MAX should be infinity, i.e. practically UINT_MAX, but that
- * might hit application errors when they manipulate these values.
- *
- * Besides, for tpf < 10ms image-generation logic should be changed, to avoid
- * producing frames with equal content.
- */
-#define FPS_MAX 100
-
 /* The maximum number of clip rectangles */
 #define MAX_CLIPS  16
 /* The maximum number of inputs */
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index 530ac8d..6e8c6de 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -21,11 +21,6 @@
 #include "vivid-kthread-cap.h"
 #include "vivid-vid-cap.h"
 
-/* timeperframe: min/max and default */
-static const struct v4l2_fract
-	tpf_min     = {.numerator = 1,		.denominator = FPS_MAX},
-	tpf_max     = {.numerator = FPS_MAX,	.denominator = 1};
-
 static const struct vivid_fmt formats_ovl[] = {
 	{
 		.fourcc   = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
@@ -1865,8 +1860,6 @@ int vivid_vid_cap_s_parm(struct file *file, void *priv,
 		i = ival_sz - 1;
 	dev->webcam_ival_idx = i;
 	tpf = webcam_intervals[dev->webcam_ival_idx];
-	tpf = V4L2_FRACT_COMPARE(tpf, <, tpf_min) ? tpf_min : tpf;
-	tpf = V4L2_FRACT_COMPARE(tpf, >, tpf_max) ? tpf_max : tpf;
 
 	/* resync the thread's timings */
 	dev->cap_seq_resync = true;
-- 
2.7.4

