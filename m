Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD80641EBD3
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353888AbhJAL13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353852AbhJAL1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F00C06177D
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:29 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso6498057wmd.5
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VNaI9C5/qcGt+6XKfL8dD53jkaX+jHT8gS0DI0vOhMk=;
        b=fZ3cK5y8CtUA2QTCkJD4v42HS0fhzRpRuUiw0yPW50W42q6IZ558y2xg/OaJfu8Sz1
         5YXvROMkosDpzW4GE+Vrv6Sx7gb5Wr+0lpi005IfCHj0DRAJKyM6uB78ueSFgDJURdBb
         seSsEUjULHw4S+mQC66XvlKURIisXxBQQ6Gig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNaI9C5/qcGt+6XKfL8dD53jkaX+jHT8gS0DI0vOhMk=;
        b=xKRQPpOiy5G4PGcMnNArAqghdjM4a9LuQXM4HEwPawyRfwti3Ip+DIaKhZtWF9e8Fy
         gSbg/CHvHVtYx3dyuLrvyZTBjoe3W2TEBYjJ6sem31WhJr77VNlepJDRKuBRNOIf7yoD
         f1z4C912ABXrxuPBeMwwsxHZaQ8ZFqPwK2oFxR+5hcahP4HX4MEWWuzBxYqmL4MpAjop
         nwLXs4T9dXnM2cq+oMxccvZxovV3Svkwn619xWzD1tveIMdWI8Tm6wIGXMdYFCDn9Scy
         o0/kMJjcgLdUTMTtGAHlSDWRv5Rzq9gMA9IYPn80h6tybwBH81tCgoxn7cLD4slL8ph7
         A3Gg==
X-Gm-Message-State: AOAM533Vf8nQGqoNZqfAmHWCLfNfpUtuLcgw9OzSULzkBBVFdz+omlUH
        wDlMkVoSsk55ExX0byz37xLWTw==
X-Google-Smtp-Source: ABdhPJx3k528VbAOecSOVvxuMk/z+vJiK8J9dkH8vF3yiWTPPLsn7nH6xcSNRl6G3gBbbFP9HpKdZw==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id g19mr3815631wmq.195.1633087528626;
        Fri, 01 Oct 2021 04:25:28 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:28 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 8/8] media: ov5670: Add implementation for events
Date:   Fri,  1 Oct 2021 11:25:22 +0000
Message-Id: <20211001112522.2839602-9-ribalda@chromium.org>
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
 drivers/media/i2c/ov5670.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 49189926afd67..251f459ab484a 100644
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

