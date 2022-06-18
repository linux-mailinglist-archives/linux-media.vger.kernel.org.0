Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DD8550797
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbiFRXzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiFRXy7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:54:59 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E784BC17
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:54:57 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8442783C0C;
        Sun, 19 Jun 2022 01:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655596495;
        bh=eywHRQqGTkR8sHk3BVNAb/jdcBK06EVHw1R6yE+6Pok=;
        h=From:To:Cc:Subject:Date:From;
        b=sZ5svJ4CehX8Si9+OINncO81CuGu6NZylptfPM2SRh143IetztXKBcx2p4dVBYufw
         yLu594aQyc3T3bjcbiPDDhTxakqRNJaymbhTqyMVW+nVBnuBRk1mvQMpDM+YYWJkwE
         1O81FzHt/S/bplXxV6GUScIsuFYpE6bWoBF2G9pRIiKzHMj/IDFQRYVY/8fm9Rr79e
         5Ub/JWy9Lrc2S6yIX4ERKFqqMwLvWKgR1Xp2M1eWR1I3oDy7kMO/xV1RU2vFqrg/uq
         lTGa8kGyFB8HEZ/LI2AcOaEeeLoiFZZO3wE+dBBZXsfPII/sU8ydKbwsILG1IikXcR
         Q7JTk4knE7Png==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2] media: mt9p031: Move open subdev op init code into init_cfg
Date:   Sun, 19 Jun 2022 01:54:43 +0200
Message-Id: <20220618235443.611141-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
V2: Replace another copy of mt9p031_init_cfg() in probe
---
 drivers/media/i2c/mt9p031.c | 71 ++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index e73e814c60207..ac79bd3ff032d 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -690,6 +690,37 @@ static int mt9p031_set_selection(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
+			    struct v4l2_subdev_state *sd_state)
+{
+	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	const int which = sd_state == NULL ? V4L2_SUBDEV_FORMAT_ACTIVE :
+					     V4L2_SUBDEV_FORMAT_TRY;
+
+	crop = __mt9p031_get_pad_crop(mt9p031, sd_state, 0, which);
+	v4l2_subdev_get_try_crop(subdev, sd_state, 0);
+	crop->left = MT9P031_COLUMN_START_DEF;
+	crop->top = MT9P031_ROW_START_DEF;
+	crop->width = MT9P031_WINDOW_WIDTH_DEF;
+	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
+
+	format = __mt9p031_get_pad_format(mt9p031, sd_state, 0, which);
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
 /* -----------------------------------------------------------------------------
  * V4L2 subdev control operations
  */
@@ -988,28 +1019,6 @@ static int mt9p031_registered(struct v4l2_subdev *subdev)
 
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
 
@@ -1027,6 +1036,7 @@ static const struct v4l2_subdev_video_ops mt9p031_subdev_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9p031_subdev_pad_ops = {
+	.init_cfg = mt9p031_init_cfg,
 	.enum_mbus_code = mt9p031_enum_mbus_code,
 	.enum_frame_size = mt9p031_enum_frame_size,
 	.get_fmt = mt9p031_get_format,
@@ -1174,20 +1184,9 @@ static int mt9p031_probe(struct i2c_client *client,
 
 	mt9p031->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-	mt9p031->crop.width = MT9P031_WINDOW_WIDTH_DEF;
-	mt9p031->crop.height = MT9P031_WINDOW_HEIGHT_DEF;
-	mt9p031->crop.left = MT9P031_COLUMN_START_DEF;
-	mt9p031->crop.top = MT9P031_ROW_START_DEF;
-
-	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
-		mt9p031->format.code = MEDIA_BUS_FMT_Y12_1X12;
-	else
-		mt9p031->format.code = MEDIA_BUS_FMT_SGRBG12_1X12;
-
-	mt9p031->format.width = MT9P031_WINDOW_WIDTH_DEF;
-	mt9p031->format.height = MT9P031_WINDOW_HEIGHT_DEF;
-	mt9p031->format.field = V4L2_FIELD_NONE;
-	mt9p031->format.colorspace = V4L2_COLORSPACE_SRGB;
+	ret = mt9p031_init_cfg(&mt9p031->subdev, NULL);
+	if (ret)
+		goto done;
 
 	mt9p031->reset = devm_gpiod_get_optional(&client->dev, "reset",
 						 GPIOD_OUT_HIGH);
-- 
2.35.1

