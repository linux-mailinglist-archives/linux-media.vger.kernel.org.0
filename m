Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CE341B908
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 23:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242907AbhI1VMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242875AbhI1VMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 17:12:21 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4B8C06174E
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v17so606877wrv.9
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ee4bLRHCActSIiJmtEQ013kV4IaUIvAfuXFIo3vyRAQ=;
        b=jKPJ3zt6wVGrAUajL27bVAPOPvdWO0q2J28ryCCJ4Qvi84YhU1cwKTTPIik1edMh4z
         UCW/d+RQ/xD6gApozEKLqOC4L9ROWxZJzZA9jz2gl1i9oewx/6JBmuHzvRtuS3HA1ryB
         2t5iXW0ySW/iNdYUfzbMci5BTVDoHDFpcD1+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ee4bLRHCActSIiJmtEQ013kV4IaUIvAfuXFIo3vyRAQ=;
        b=HQomt6rJ4JlhGab+A75vgocXwLyrTEqwL6epDd7yXR2vwgK3mSh1H/lo9HAhNDRY2X
         Cr/YqjpFvSgcYTeoODkqfd+gXsp+8hyjb4DbDvjdzcvR4XkAj1oiDFyJ7abtfeXN2Tes
         8PlkS2hYfTHjkaPRorJiZ7MOnAlQLhTQOp3Eyb3C2J8rKEEt6QbQ4V9+DPMq1movbHOQ
         5/TRiS01/yxFV2SUD9h6GCWYbjLPorNu900iqG4rG0D3693KuH+SjtUdwQJYwsPrtopN
         aN2nCAZ+s1XVlDEDTwUSrn1vxeri6CGRmh9OhwUIjNzPLFgeU/x9dYjBAWE7f0YeiKnO
         Od4A==
X-Gm-Message-State: AOAM532oHejJYdzH9ueiEHJ06kicW/UOJyk//YfplB1FaV4ZfW4cughh
        cNzOAyZt/TNcU63TJjRHf8kvhw==
X-Google-Smtp-Source: ABdhPJwWfn+CI31VOtRBlmfvBngZfk2e7+MOZfvjpSCEPatyIi1Gpz2LIxIkSm652p3Nlp5yM0FX3g==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr2641755wri.89.1632863439471;
        Tue, 28 Sep 2021 14:10:39 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id n68sm3885773wmn.13.2021.09.28.14.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 14:10:39 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 7/7] media: ov5670: Add implementation for events
Date:   Tue, 28 Sep 2021 21:10:33 +0000
Message-Id: <20210928211033.2415162-8-ribalda@chromium.org>
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
2.33.0.685.g46640cef36-goog

