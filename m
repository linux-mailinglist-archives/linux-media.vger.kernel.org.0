Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EAA68A2C8
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbjBCTSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbjBCTSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:33 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0898371985
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:32 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a2so5267156wrd.6
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6/i585QuyYiT5AbB1cETNkPYf1BhpBh6CXnJ02051s=;
        b=QJB/VvJYX7e7y7n3xvXNg7zRrnK3hv5FoecfWSMKXdg3G+qGHxtvzmuDObYhWRiFpg
         8JDiToRJOACGJuecJMAICFYBFxx3Y5FqS3FSXLAln/oHrjim8AnEnF6XkoBFhbCKm9bp
         bFp8eNYaBrc4RNaEGvSsbEbLuMJghRHsnXYbqMlC/kyqOCyj1OVUW7fuM3lesL5LgYBr
         dnYv6Gg92qTu5nvNYcunMo4B6isI+GbdnB15NKlC++m5fmbMMov2/dbVSn6DcSv/wymL
         JSsGlHQS1TDN7LD7vdNfJZxuvN6uMlZFMgjR+PWJXSlFcOz0IBtQm/nctmdcn2xY0b8Y
         xlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6/i585QuyYiT5AbB1cETNkPYf1BhpBh6CXnJ02051s=;
        b=Qop5zfuOR5MvKvDdiaJlGaokLe5Gm3B8/ImTHTFDbY0NyyObVgSK9aB5RAgOw2zEr4
         +Csms+P4KHWYs7E8B5ZQ17P4CoPmbkwOU5vpBh7KpSuyCk4yFcS95gD7OYpo0tG+vnKp
         kDNoKshgBmW3ZT9lLWOSJrG0QVJuHYmNqeHy8nAC4P7D+awi+THaUFzgQlV0KwTrdHrY
         n7f1A2HTWHl9GD+hs3SMJGogck4Qll8JJKeZ6HCmWaRc5ld0r8hXQk+4lw4vIuRnvFgh
         JTzpa7P7GMFzLxwN5x00zcEd5zcQzd/A683JvDPOfpJ7xtZNqUiDrgHH+nQvN8CWM1Hs
         FPKg==
X-Gm-Message-State: AO0yUKUXm6IS2O/eSAJ+hiNYnF+RLLgA4vvbKcWuymeSb8Y26Rb45ezR
        dw/LMY5RIg1XvN7IsgO/um1gXQ==
X-Google-Smtp-Source: AK7set+w7YVquF3njKgZ2Djh0iZxcCw437cyZ9nyNz69iIALE4jRMNw5f0p68EemiqeVnQfNlqSwUw==
X-Received: by 2002:adf:e0c3:0:b0:2c3:d808:e82f with SMTP id m3-20020adfe0c3000000b002c3d808e82fmr2837948wri.17.1675451910539;
        Fri, 03 Feb 2023 11:18:30 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:23 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 03/13] media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Date:   Fri,  3 Feb 2023 19:18:01 +0000
Message-Id: <20230203191811.947697-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
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

Any V4L2 subdevice that implements controls and declares
V4L2_SUBDEV_FL_HAS_DEVNODE should also declare V4L2_SUBDEV_FL_HAS_EVENTS
and implement subscribe_event and unsubscribe_event hooks.

This driver didn't and would therefore fail v4l2-compliance
testing.

Add the relevant hooks.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 827c0804792f..22faa9b54810 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -20,6 +20,7 @@
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -993,6 +994,11 @@ static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static const struct v4l2_subdev_core_ops imx290_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops imx290_video_ops = {
 	.s_stream = imx290_set_stream,
 };
@@ -1007,6 +1013,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops imx290_subdev_ops = {
+	.core = &imx290_core_ops,
 	.video = &imx290_video_ops,
 	.pad = &imx290_pad_ops,
 };
@@ -1025,7 +1032,8 @@ static int imx290_subdev_init(struct imx290 *imx290)
 	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
 
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
-	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	imx290->sd.dev = imx290->dev;
 	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
 	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.34.1

