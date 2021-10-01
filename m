Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C6D41EBD4
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353883AbhJAL12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353832AbhJAL1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:13 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F84C06177F
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d6so14881594wrc.11
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tmEJ9vFpZDT8h8HObohmRstQUsecSrrPbxIcYXjIt14=;
        b=mlg6xJ+z/3D7g/FEIfOjSYDGmoYGEGbs98RXwl4s5paFKGPmigUvG/2nYEGgD9thTj
         I2tDZ1k2GTp9CLR1RqsUqrxzo/cqp8PeYQpAffEBC3gRdS6Lczgb4epuL/xwZ074SiEN
         OT3eTRdSrHMpGtSvUhsgQtm8TJwCPtipKqBgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tmEJ9vFpZDT8h8HObohmRstQUsecSrrPbxIcYXjIt14=;
        b=oeOMxyzLcS+mkUGL3/hI3mTTdvkR5u36cHwDEPt+t3vRrl73zz1PsdgpBiYgcBs0fo
         0JgBV4yyzthYasE7a8X/A6gavbXc26GOXNZP+B6Xh0ZK8e+9fLpDHbozZdvLuPpA9TmD
         mrEJ6jH3L0jVl1BN2IHo6Kl8TVsyotgtWmkAKSTedVsPkLAW1542Nou0yb96h1Lequry
         N38B2sTTZxg02JcrWCrCYzGHyjjVnyjhSxDMzx8nGzLMhGbDK5W8A0HFyrgsx9k2A/Qd
         YqBZhCTxHTpyeb/l0BSkNqNGFdMsP4DxogAz7kLlHDVHPkkgmr2BpP5ksN00VP8jC/ce
         EBSA==
X-Gm-Message-State: AOAM532IIwTWrqtobgZFi1cVXlttmyJn6f0oepcOwEnFfC2Pln4xucHe
        BpaQi9dt7TpXrow11TIDP24wSQ==
X-Google-Smtp-Source: ABdhPJyVdC2NJRWi5/UJGa4RdI2Y7in5qLDFCkrNEpR3UXiq/NHEZJoZrxDysLDhtEHVdn019GeKAA==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr11779105wrw.226.1633087527757;
        Fri, 01 Oct 2021 04:25:27 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:27 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 6/8] media: dw9714: Add implementation for events
Date:   Fri,  1 Oct 2021 11:25:20 +0000
Message-Id: <20211001112522.2839602-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211001112522.2839602-1-ribalda@chromium.org>
References: <20211001112522.2839602-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2 control API helpers to support the events.

Fixes v4l2-compliance:

test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/dw9714.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index c8b4292512dca..3863dfeb82934 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 
 #define DW9714_NAME		"dw9714"
 #define DW9714_MAX_FOCUS_POS	1023
@@ -100,7 +101,15 @@ static const struct v4l2_subdev_internal_ops dw9714_int_ops = {
 	.close = dw9714_close,
 };
 
-static const struct v4l2_subdev_ops dw9714_ops = { };
+static const struct v4l2_subdev_core_ops dw9714_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops dw9714_ops = {
+	.core = &dw9714_core_ops,
+};
 
 static void dw9714_subdev_cleanup(struct dw9714_device *dw9714_dev)
 {
@@ -137,7 +146,8 @@ static int dw9714_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	v4l2_i2c_subdev_init(&dw9714_dev->sd, client, &dw9714_ops);
-	dw9714_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	dw9714_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+				V4L2_SUBDEV_FL_HAS_EVENTS;
 	dw9714_dev->sd.internal_ops = &dw9714_int_ops;
 
 	rval = dw9714_init_controls(dw9714_dev);
-- 
2.33.0.800.g4c38ced690-goog

