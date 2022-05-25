Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0E6533C73
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 14:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237700AbiEYMNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 08:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241062AbiEYMNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 08:13:12 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EB22873F;
        Wed, 25 May 2022 05:13:10 -0700 (PDT)
Received: (Authenticated sender: foss@0leil.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 31EBD240008;
        Wed, 25 May 2022 12:13:04 +0000 (UTC)
From:   Quentin Schulz <foss+kernel@0leil.net>
Cc:     shawnx.tu@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        foss+kernel@0leil.net,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v4 4/4] media: i2c: ov5675: add .get_selection support
Date:   Wed, 25 May 2022 14:12:40 +0200
Message-Id: <20220525121240.1094792-4-foss+kernel@0leil.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525121240.1094792-1-foss+kernel@0leil.net>
References: <20220525121240.1094792-1-foss+kernel@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The sensor has 2592*1944 active pixels, surrounded by 16 active dummy
pixels and there are an additional 24 black rows "at the bottom".

                     [2624]
        +-----+------------------+-----+
        |     |     16 dummy     |     |
        +-----+------------------+-----+
        |     |                  |     |
        |     |     [2592]       |     |
        |     |                  |     |
        |16   |      valid       | 16  |[2000]
        |dummy|                  |dummy|
        |     |            [1944]|     |
        |     |                  |     |
        +-----+------------------+-----+
        |     |     16 dummy     |     |
        +-----+------------------+-----+
        |     |  24 black lines  |     |
        +-----+------------------+-----+

The top-left coordinate is gotten from the registers specified in the
modes which are identical for both currently supported modes.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v4:
 - explicit a bit more the commit log,
 - added drawing in the commit log,
 - fixed reporting for V4L2_SEL_TGT_CROP_* thanks to Jacopo's help,

added in v3

 drivers/media/i2c/ov5675.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 86f7a308c0844..d86b699d24c18 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1123,6 +1123,38 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5675_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5675 *ov5675 = to_ov5675(sd);
+
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = 2624;
+		sel->r.height = 2000;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+		sel->r.top = 16;
+		sel->r.left = 16;
+		sel->r.width = ov5675->cur_mode->width;
+		sel->r.height = ov5675->cur_mode->height;
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = 16;
+		sel->r.left = 16;
+		sel->r.width = supported_modes[0].width;
+		sel->r.height = supported_modes[0].height;
+		return 0;
+	}
+	return -EINVAL;
+}
+
 static int ov5675_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1172,6 +1204,7 @@ static const struct v4l2_subdev_video_ops ov5675_video_ops = {
 static const struct v4l2_subdev_pad_ops ov5675_pad_ops = {
 	.set_fmt = ov5675_set_format,
 	.get_fmt = ov5675_get_format,
+	.get_selection = ov5675_get_selection,
 	.enum_mbus_code = ov5675_enum_mbus_code,
 	.enum_frame_size = ov5675_enum_frame_size,
 };
-- 
2.36.1

