Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EF341B90D
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 23:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242882AbhI1VMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 17:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242873AbhI1VMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 17:12:21 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D47C061745
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:40 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x20so600739wrg.10
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cpcqu0FkNTnMhJYqoU4g7szXMeK3djvSORY3n20CFi0=;
        b=HePQXKj1+2kXp82Ph9zNesBpPyBovgyVZJMe7rB1go/cq4Bp9NCDAYJPsNSYy0O8VQ
         P5lO+Zddns/7Qnqq4BnjAlQXbUW9MgFtrgiOef88uZPqqafLaCROIauPwnYC9ZosGRrH
         cWgYXoSJHhPF6u6EeLHj0DegyYhB863/Zx/F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cpcqu0FkNTnMhJYqoU4g7szXMeK3djvSORY3n20CFi0=;
        b=YLRbfJfBqdjW3NzPN0ZPYJ79vFS/81uWRjAA8YEXg9YamWSHi7thj71qW9ieDlpkg4
         RxowCGzxoK6MDK7qq68z9vjsSi0irzJ4I8kgqsLgBigI9giTlGJET/jm7i8QZg/Iy3Sa
         SuYuKNQ0mu9TFgKROpgS73Paf3jX7Zcfd3GozPc5QlB/Na4j35Au8RQa6Bl6yMa/qoOb
         a4GNo+7/Bc7QFPgszfnDhuJuvN5GP6NSJLeHpiHYqbgw9ELpM9ZLFyAGKCoJy93d3k8N
         T8FrLKRmGsTeImOFlLvK+bjb7tVCNw5AE4AHGucdfTvPbtbsVCCVABbwbpDO/dEAnRGe
         wZUA==
X-Gm-Message-State: AOAM530SpH2/jWLpp5Radn+v6DkAQfYNmd839mv7yZrFF5zjReIW2lg+
        hg1/mEdBKb3CANx+JsQ7KpeNOg==
X-Google-Smtp-Source: ABdhPJyXOGhKoQaZpY5XHcybETMLriDRNljwHciQ1EPMr2BtUHML5ZmEYAQfyk6cdAAdAfFRt+1jSQ==
X-Received: by 2002:a05:6000:1569:: with SMTP id 9mr2624681wrz.337.1632863438884;
        Tue, 28 Sep 2021 14:10:38 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id n68sm3885773wmn.13.2021.09.28.14.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 14:10:38 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 6/7] media: ov13858: Add implementation for events
Date:   Tue, 28 Sep 2021 21:10:32 +0000
Message-Id: <20210928211033.2415162-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210928211033.2415162-1-ribalda@chromium.org>
References: <20210928211033.2415162-1-ribalda@chromium.org>
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
2.33.0.685.g46640cef36-goog

