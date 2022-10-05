Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91F7C5F577F
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiJEP3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiJEP3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:29:05 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1335247F
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:29:03 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id iv17so11003011wmb.4
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6z3eOipP9uSMzPeU3wBGzwLbTfap33BpuIjU1zg0tEk=;
        b=qQzZRbGT2wTwhRLH83pIdLCNg8GKK5mI8Py7DLK0afe6y02JwMwZcVmfzn44zDkeaO
         4nJ38tSXc9JvikrKB1IT62mbZm9Z8n7KaURxABhAgmnDJASzWM1KrlI6MDIXKuhroJTu
         /+hMocPK3vfC7kNJ4XOl1tTN1WOSQ22vS5B7vqzDdoL4NcYaWP06ZUBT3+RFAa8Q7Hju
         e0kSLkH1Z6Q+raSQrTVKMhJC1TSIKaoOp/ZHiqx0JRBB6yaCXknnoKQkrVy0WkPUL7yH
         Km44bAh5MJ6IVxtJOCyYKAzPUerqwCHDmeFsP6Dkj/a0aASQ7LGbOYakQe+ohvi2nP22
         XIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6z3eOipP9uSMzPeU3wBGzwLbTfap33BpuIjU1zg0tEk=;
        b=Xz77JBpBBtmYy+DaC5ChUoqeSoUWx4jYCsefivjnGU8B4OlW86nRQmW8r6W19eFfXT
         +YQMnryyXgO7he+CJLq97kpD4g3iwiu71vbN7yj0WiC8VQoP22Fz0x9DcyrBwZ7WFMZ7
         c757em0cwfj5o3IgrpP0XaRQYro73L7BqpnxpUMyw0sEIGHzRq5z7XvlV0tPQtIeGA01
         1NMgwhpGxvZTePMZLgG6lMHktBcc2eDs1wgcDuhzTNHBRy0QU6r95NyQTt1IN+byQyGt
         S9KD6Bbrw6bDRovp3vpzQ91iaaU/Ok9NzAacagxWVJVXLo7WjYd/cYYWipTlZh8kJLTb
         CqfA==
X-Gm-Message-State: ACrzQf2hd/DgkvmDQgohPyVJf4eer/k4FEfJ1r5bda4KsmxygnixBITY
        3cT2XkCP2XMcx8SrZoLXpQzxw+EmO+wipw==
X-Google-Smtp-Source: AMsMyM4R7vCfmdzS3F312wf/F0RNQlnMxcY1A91cTiRl9ZV0cTTTp4t5QdZQ8kxlIzecRtH2q9KU1A==
X-Received: by 2002:a05:600c:1c89:b0:3b4:a612:c3e0 with SMTP id k9-20020a05600c1c8900b003b4a612c3e0mr113983wms.20.1664983742070;
        Wed, 05 Oct 2022 08:29:02 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:29:01 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 16/16] media: i2c: ov9282: Support event handlers
Date:   Wed,  5 Oct 2022 16:28:09 +0100
Message-Id: <20221005152809.3785786-17-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As noted in the headers for V4L2_SUBDEV_FL_HAS_EVENTS,
"controls can send events, thus drivers exposing controls
should set this flag".

This driver exposes controls, but didn't reflect that it
could generate events. Correct this, and add the default
event handler functions.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index bc429455421e..416c9656e3ac 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1189,6 +1190,11 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 }
 
 /* V4l2 subdevice ops */
+static const struct v4l2_subdev_core_ops ov9282_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops ov9282_video_ops = {
 	.s_stream = ov9282_set_stream,
 };
@@ -1203,6 +1209,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
+	.core = &ov9282_core_ops,
 	.video = &ov9282_video_ops,
 	.pad = &ov9282_pad_ops,
 };
@@ -1419,7 +1426,8 @@ static int ov9282_probe(struct i2c_client *client)
 	}
 
 	/* Initialize subdev */
-	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov9282->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
-- 
2.34.1

