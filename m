Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E60341EBD2
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353795AbhJAL11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353843AbhJAL1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:13 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9150CC06177B
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d21so14908531wra.12
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8Q4M1c6rtKlhDbTm4SP6AjT7wFHFdr0/UPMGdfiE9w=;
        b=D2YDnOLtNk2sn6VS7rFCjyaNCgy2tZd0WKvieR9SNTn228NJwgZVu5tJ/2r9meGAGw
         sprXQYIL62HmzK3SSHku5v7Pj/HA7AkrlbRCVn9KixbSeB4uyBMq+hJj2SUeBwaTVq67
         igSEVtTps+63s9KN8gbW7M8B41v2zZZIApFiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8Q4M1c6rtKlhDbTm4SP6AjT7wFHFdr0/UPMGdfiE9w=;
        b=Fod+PzvA6+vwiyD5s/5HmvJnCsrzw2UQkw3lkO8R9mkdY6QdjVoQHMZdewQ78P1uXb
         ZnLvSe9FRD/8LpGrZ82nk7/raX3YtPKhlvnQQmW8+JjZV6tg/Vnnz6KJYEE+S6XaJbt6
         fWOOYpC1JrhuGcFc35S9EocVyNn6pMNehtvvWsME+32pQ7OXfujXLfuDKQrw3hAvrzUs
         aYRyzyOqEedaEmI0X/n3jz/Nm4CJLhx2FMzef9/m9Bx3tDjxHeMLt3/CPB9G3awJWJLR
         P8MDI+YA/sC1M1MUXYfVadWNbg6oZL9VKNAPwTGwyyC4SrXs9mMQ9fKezvbY8RksZivR
         m//Q==
X-Gm-Message-State: AOAM532HC+4K09hNWmUDtY86ro0RZTCwbo6xXlFaC4NMS3zD9zD6/uZT
        LtIyHbjbRV03uBHLaKMMZFcw9w==
X-Google-Smtp-Source: ABdhPJzqFhNWLoIh7LInBDTcY3F4ZpWiczAGiQxWRUkbDjlDWoqd1oN3Igz4hjUuRxm3gAm3b+VPRQ==
X-Received: by 2002:a5d:54c5:: with SMTP id x5mr11563653wrv.47.1633087528200;
        Fri, 01 Oct 2021 04:25:28 -0700 (PDT)
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
Subject: [PATCH v3 7/8] media: ov13858: Add implementation for events
Date:   Fri,  1 Oct 2021 11:25:21 +0000
Message-Id: <20211001112522.2839602-8-ribalda@chromium.org>
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
 drivers/media/i2c/ov13858.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 7fc70af53e45d..b4d22f5d99337 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
 #define OV13858_REG_VALUE_08BIT		1
@@ -1553,6 +1554,12 @@ static int ov13858_identify_module(struct ov13858 *ov13858)
 	return 0;
 }
 
+static const struct v4l2_subdev_core_ops ov13858_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops ov13858_video_ops = {
 	.s_stream = ov13858_set_stream,
 };
@@ -1569,6 +1576,7 @@ static const struct v4l2_subdev_sensor_ops ov13858_sensor_ops = {
 };
 
 static const struct v4l2_subdev_ops ov13858_subdev_ops = {
+	.core = &ov13858_core_ops,
 	.video = &ov13858_video_ops,
 	.pad = &ov13858_pad_ops,
 	.sensor = &ov13858_sensor_ops,
@@ -1724,7 +1732,8 @@ static int ov13858_probe(struct i2c_client *client,
 
 	/* Initialize subdev */
 	ov13858->sd.internal_ops = &ov13858_internal_ops;
-	ov13858->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov13858->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov13858->sd.entity.ops = &ov13858_subdev_entity_ops;
 	ov13858->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-- 
2.33.0.800.g4c38ced690-goog

