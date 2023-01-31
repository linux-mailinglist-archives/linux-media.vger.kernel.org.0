Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C2F68365B
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjAaTVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjAaTU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:20:57 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71557CA06
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:54 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r2so15206595wrv.7
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwvmcpgfyBG0Ign+mwoPJyQbUloHHhl8dlCljhw7ZAs=;
        b=JF1paWrIDc3DXJmrcybMwQyNMg/jsxkjLSSwXtEmGLXQUIPNs4nvRjA7KiU4g7xdbO
         nYhSt6PYt73PeGOI1T2e34sU8RRmdxt5i/XANUPsF5ImZ2Zp51dnm398Siq0cBofQqdw
         GNOSdSgDwVmm5wpwA7jh90wAaXn0sFRKH2TTniSyUgaVIMZDOGxogTkA+K9uFqoVJ135
         i+N0HxWuC/SmE2yGoeUTgb43nwIwYp375S/kD5Nd8n9C0Pot+fZccorkyqgZwuja/GNe
         HhE1xspaz0O+kx2FO1ocvVq5mXxYAmcbIKlWut4FqZ5D+KBpVq9mO3jCBR4bsw3xaNUk
         BrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwvmcpgfyBG0Ign+mwoPJyQbUloHHhl8dlCljhw7ZAs=;
        b=nF56x3GmapJb3EWnD9e27vwKByobAInJHOETE0QUvMt3/dBXcIRwQXFMdCXFiSGX6j
         2LJqSfh40jZTb04qSSDRjwpRbRuF8rxirlNOHLWgc/74l3AmOjYeVlosSGdgLQME4ST8
         Bp+1SBijTm4akwYyLDdF9a9JxiaG1x+S/LiizsLzt34J7rgEa0xAD4XCRcWgeUPZ5D4x
         XaMZvFaUCXQxJTCHk7DYXv1ht26WvNP/PQ0VuE3JGqVFyilBO7e4UMe6P+FPZhDs8n3b
         hfnZ6TKRRpt2GJqR8vBmAtwCQWazGmOhe4/lIdJuwOf4f2m5L73mzL/H8f7WKzcbPol0
         Fvyw==
X-Gm-Message-State: AO0yUKXg7dC2+ctKOf9t/ChvbEXY7VMrAStQe4q7CAS4GgrMcuFo5mBc
        HRgq3msi/gn5LBRknvmSFDpubw==
X-Google-Smtp-Source: AK7set/ObbtUvqhRs/9VRjiOm/XjJyVmURj0erY6aU0O6UBWKan2FcbgL36jbrB9jgeQLfGvwRh3TQ==
X-Received: by 2002:a5d:5958:0:b0:2bf:ee58:72ae with SMTP id e24-20020a5d5958000000b002bfee5872aemr91504wri.50.1675192852960;
        Tue, 31 Jan 2023 11:20:52 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:52 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 03/11] media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Date:   Tue, 31 Jan 2023 19:20:08 +0000
Message-Id: <20230131192016.3476937-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
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
---
 drivers/media/i2c/imx290.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index bf96fd914303..12946ca9d8d2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -20,6 +20,7 @@
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -977,6 +978,11 @@ static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
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
@@ -991,6 +997,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops imx290_subdev_ops = {
+	.core = &imx290_core_ops,
 	.video = &imx290_video_ops,
 	.pad = &imx290_pad_ops,
 };
@@ -1009,7 +1016,8 @@ static int imx290_subdev_init(struct imx290 *imx290)
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

