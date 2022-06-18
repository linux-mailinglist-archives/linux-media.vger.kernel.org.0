Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD1A550749
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiFRWWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiFRWWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:22:09 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27E110FFB
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:22:08 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3D25283F6A;
        Sun, 19 Jun 2022 00:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655590927;
        bh=5RJpA/V9RDWG+NeSYBr9VeHyvi9H/mKV+yz1ztk4Zlo=;
        h=From:To:Cc:Subject:Date:From;
        b=Ra9JXcI7r5Xf0+w2EPb2CCPhOvNxPddsN6jdp4rCa1jee/zWIyKpxUwLFypaNwi78
         gXYh89yk2JRFdvwdtYKphJDaJQPS3QIBj5IuHv13VTabPxKMSfqckmxKcYoAOh69uc
         0fdvg/JXaePR/OPeb+GfK0iT2SsUnDjqRqFD/Ox2WuyhH7KEri6uxka+uUVMmpGC5q
         EYuLg2TvQEQe6uwhI3MNKiJ4VeFiMzcel9SRob/xmcTNV4O1VG5ALGf+5IrQh7DKCR
         BOy4rHHH0WzKDo1UhlB++d8t+7ocOfQMsokaIn0FamhGUzSiaguvBHdGZ+IicyfeON
         ZtYVdTy7lox7A==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] media: mt9p031: Move open subdev op init code into init_cfg
Date:   Sun, 19 Jun 2022 00:21:51 +0200
Message-Id: <20220618222151.478111-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .open subdev op is not always called soon enough to initialize
the default crop settings. Move all this initialization into .init_cfg
op instead.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 51 +++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index e73e814c60207..e0f0d87d4cfe9 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -505,6 +505,34 @@ static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
 	return mt9p031_pll_enable(mt9p031);
 }
 
+static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
+			    struct v4l2_subdev_state *sd_state)
+{
+	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+
+	crop = v4l2_subdev_get_try_crop(subdev, sd_state, 0);
+	crop->left = MT9P031_COLUMN_START_DEF;
+	crop->top = MT9P031_ROW_START_DEF;
+	crop->width = MT9P031_WINDOW_WIDTH_DEF;
+	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
+
+	format = v4l2_subdev_get_try_format(subdev, sd_state, 0);
+
+	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
+		format->code = MEDIA_BUS_FMT_Y12_1X12;
+	else
+		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
+
+	format->width = MT9P031_WINDOW_WIDTH_DEF;
+	format->height = MT9P031_WINDOW_HEIGHT_DEF;
+	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_SRGB;
+
+	return 0;
+}
+
 static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -988,28 +1016,6 @@ static int mt9p031_registered(struct v4l2_subdev *subdev)
 
 static int mt9p031_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 {
-	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
-	struct v4l2_mbus_framefmt *format;
-	struct v4l2_rect *crop;
-
-	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
-	crop->left = MT9P031_COLUMN_START_DEF;
-	crop->top = MT9P031_ROW_START_DEF;
-	crop->width = MT9P031_WINDOW_WIDTH_DEF;
-	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
-
-	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
-
-	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
-		format->code = MEDIA_BUS_FMT_Y12_1X12;
-	else
-		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
-
-	format->width = MT9P031_WINDOW_WIDTH_DEF;
-	format->height = MT9P031_WINDOW_HEIGHT_DEF;
-	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
-
 	return mt9p031_set_power(subdev, 1);
 }
 
@@ -1027,6 +1033,7 @@ static const struct v4l2_subdev_video_ops mt9p031_subdev_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9p031_subdev_pad_ops = {
+	.init_cfg = mt9p031_init_cfg,
 	.enum_mbus_code = mt9p031_enum_mbus_code,
 	.enum_frame_size = mt9p031_enum_frame_size,
 	.get_fmt = mt9p031_get_format,
-- 
2.35.1

