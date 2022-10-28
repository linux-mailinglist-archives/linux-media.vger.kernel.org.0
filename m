Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4FD611745
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiJ1QPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiJ1QOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:55 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7620026AF5
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:59 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id z14so7191166wrn.7
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD6YtWjHzYqdhBfSIlIPdI194KwUqnwFe0lqlTST5gU=;
        b=Ag4jHAVaRfqDyqOw21A4Ca2FBxO+CedejWEKNR9+IK4eho+34cGeDdsdOD0qXrgqaV
         vnFMd2lr77FA5btBf5WQe6IJEZBrST5xuF4Iuo3UVLnIvSBoR6vVoBw3EdAiVaIXcGJL
         8M5xK3vhDaYlU3gIoVFiZA60OjEmb/tye8sfAKr6BNH6L68xrUjgtODc042ieF85wGps
         S7/xofLkusZ6peanxdn5Pvk+EKfc8pBMfbVxfuDlZk7/7sJwP/S1C62VxXw/ysPuNk6o
         V6P0ElutMhacnxalVJ4sowYQzmf63WohNEZ6EhNMvuUQwA6c9Z99yyTzAWcrNqJsrnDU
         nYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UD6YtWjHzYqdhBfSIlIPdI194KwUqnwFe0lqlTST5gU=;
        b=dB69rDv/tmk5gw/cNNL8YmxeDla/9HYqjDI+FNGIog1aHgUlb9d+CkUkqdEfBQCETb
         KTs+/eP/pcjynWPyx3WKWAE0//ROx4+vF5vryeMnHzZtzEBclZ8Ac9xQpJynNk6XG05f
         1ffmapdo4XrsZGwRsjrbooL0QiGB1QlxFgA32UqkcGHVzSFeMdfzz8fV4ziB63AUWkGA
         OuONr+w4tzJ/Fgt/xPnVTecK3KfcDnhARNYPHY6Kg2I6fxHvXOfAax3C9IesKRk0DEl+
         qrPp6euqVGsdr765en55A39hJOZDkqWaVQuhAbb/+aCTcFmfi8nj0V4GMQClQxtl8lCq
         243g==
X-Gm-Message-State: ACrzQf079XhgON585uHJ0j1Ln81P1w8XWCmESiRr8FDIoVM4TB0ORMFi
        RbUQTW3qcen1/zeGvrfnHoGvqw==
X-Google-Smtp-Source: AMsMyM681y1B5mol+HsAtdmY/u18EwwLDbfbWbBWsjJv8mmHLXibL/WMIS/LJmd4U7gisZ3JYkQ5Lw==
X-Received: by 2002:a05:6000:2ae:b0:231:86ac:979a with SMTP id l14-20020a05600002ae00b0023186ac979amr55897wry.611.1666973578062;
        Fri, 28 Oct 2022 09:12:58 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:57 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 16/16] media: i2c: ov9282: Support event handlers
Date:   Fri, 28 Oct 2022 17:09:02 +0100
Message-Id: <20221028160902.2696973-17-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
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
index e2a98f480b58..f2ec92deb5ec 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1161,6 +1162,11 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
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
@@ -1175,6 +1181,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
+	.core = &ov9282_core_ops,
 	.video = &ov9282_video_ops,
 	.pad = &ov9282_pad_ops,
 };
@@ -1389,7 +1396,8 @@ static int ov9282_probe(struct i2c_client *client)
 	}
 
 	/* Initialize subdev */
-	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov9282->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
-- 
2.34.1

