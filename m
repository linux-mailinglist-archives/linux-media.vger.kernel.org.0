Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD274249A6
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 00:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239847AbhJFW2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 18:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239834AbhJFW20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 18:28:26 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F98AC061755
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 15:26:33 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id dj4so15409089edb.5
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 15:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y+waaZuGQbx9FXfWaK7Bagt4ZcjH2y3LRocwRra4Vv4=;
        b=hg3j9pCO9yP3IjAJojTHtkeAEkY9LeJ/wXM5CwVpBSynXiA+dR+6st3AVoOe/n2tgQ
         wRHZZQAzG/FcIcG0MRN6ECWgl4EWgf1QnQy/Zc3M7LjhHE5rP0fjTl2RtPO9thfdAmW3
         1BdsSNIzzPkik+2Qzvr7WWrRL9wZLiUQFw/QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+waaZuGQbx9FXfWaK7Bagt4ZcjH2y3LRocwRra4Vv4=;
        b=wb+MNtMUy/k8SxR0vXwf9UEma0DKWe41QuyuncJ0H/y8JMl7aMfg4Vu18n9aEI46Cr
         mNpGFELepAaB2h8j+QOLzSEe6IIEJwRDQ5zfgKHhI+wsAYGqy7ji0SptLAGiwjRkWuCJ
         o0H9Uas+PzB3a2cGkMFOczGsNG6Oj/KVws5h0leVOWg5RYOTzCCzELEla/KgbHr1ChPh
         frxFQHxX3S668v89k5J/Itm3LAqYymWw/Jqp78jb3fEjgBRdzTxlo9scCTayPJdJ02ik
         gTK96lA1lYAqvRrUeSk7HQF0QvjxEzOyvsT9w8tMu/S4k/nePR3uNMB9bPCOU+qV1/zi
         PR6g==
X-Gm-Message-State: AOAM5320DZ/+5QsnANDfeDsJW+NADDvkPYLozpRwg3Jk41fxMeRK+P0L
        LiUVJlgwlgCPoEGSZrK+cFgYVg==
X-Google-Smtp-Source: ABdhPJz2v5fteipXCveHJNnpJTYmGqE3VPdWnlue8RDHx2ZDaXzDYFPyuMdb05P7313ZJJrjz/A0+Q==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr1159591edj.298.1633559191858;
        Wed, 06 Oct 2021 15:26:31 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h7sm10557906edt.37.2021.10.06.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:26:31 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 8/8] media: ov5670: Add implementation for events
Date:   Thu,  7 Oct 2021 00:26:25 +0200
Message-Id: <20211006222625.401122-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006222625.401122-1-ribalda@chromium.org>
References: <20211006222625.401122-1-ribalda@chromium.org>
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
 drivers/media/i2c/ov5670.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 49189926afd6..251f459ab484 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
 #define OV5670_REG_CHIP_ID		0x300a
@@ -2420,6 +2421,12 @@ static int ov5670_identify_module(struct ov5670 *ov5670)
 	return 0;
 }
 
+static const struct v4l2_subdev_core_ops ov5670_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 	.s_stream = ov5670_set_stream,
 };
@@ -2436,6 +2443,7 @@ static const struct v4l2_subdev_sensor_ops ov5670_sensor_ops = {
 };
 
 static const struct v4l2_subdev_ops ov5670_subdev_ops = {
+	.core = &ov5670_core_ops,
 	.video = &ov5670_video_ops,
 	.pad = &ov5670_pad_ops,
 	.sensor = &ov5670_sensor_ops,
@@ -2489,7 +2497,8 @@ static int ov5670_probe(struct i2c_client *client)
 	}
 
 	ov5670->sd.internal_ops = &ov5670_internal_ops;
-	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5670->sd.entity.ops = &ov5670_subdev_entity_ops;
 	ov5670->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-- 
2.33.0.800.g4c38ced690-goog

