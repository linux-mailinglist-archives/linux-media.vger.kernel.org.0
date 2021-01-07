Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CA42ED208
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 15:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbhAGOW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 09:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727292AbhAGOWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 09:22:25 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD9AC0612F6
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 06:21:44 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id d17so9864256ejy.9
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9XphW4qRvsvPkDpcKFQBM3ZMGk3H03d/R4eSCmWd/3I=;
        b=xO8iNhuBKIX4hsI2v/zY7BHU7bJx8icJXoZ/Vhr3PwDP94WtktHjZjrzj127Wl7JyQ
         b0Mj4s6MzC526rXro8ZOXNF+0T7IHNNJ8km7cNLY8WadedNFgin36fEaHIaUvB5glPBs
         IM6oGdTqkMFGkqSTu3Mhda6RH6ti5ee8cE/UXqI6Vse8G4bRomSJ8CuQ59YpLlbgAPc+
         P9bOvisnlz3+rSAhts+GdQzjOoWrq4/nvufoL3SmZrCJkvgs41yO8rP+1KRq16ggAdCY
         lBNaycH6OfEC0YN2qnwgV9V+y/Yk/Zn8TSsSi2ML9SVmfD+0qCHZiwIYtW+cS5W52dt9
         4XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9XphW4qRvsvPkDpcKFQBM3ZMGk3H03d/R4eSCmWd/3I=;
        b=g1K2DIqRCggqApUrFEF1sgCA0vu+vR9hJDaY6tkrRtj5FeUcc+LmOsOZV2Ju++dn/b
         m/RFfP/lceckZnQ9WydGSCDdTODqWR37HWFz0WQTgdLe9wg4sOUMuJAAPtCkWgyllsbz
         yuNd3y7T7FYTTI5NaOJMyPQn4ngUpCNwOg7+1gvoxOcvh4PMFps/ekP37rtZ6i89+yFS
         ZMG2/eedOeYcHOLnrdQTebb1089MIdlW99EHMJL0PJhhempKg7h139p06ze7tIvYzPEO
         bySgKfBiBKdFr9nqm/IGWOtQbA9BRIQqjePam3XHeRGUBiDk0xC2D5afNt8J4TkyJSqg
         iW2Q==
X-Gm-Message-State: AOAM531CN+klOq3S/+AwEiWmVXBbvLYKf5u5FKMSS+jXF+XbXtcRl/lq
        yQyN7/CpN9X9O9+ZnSVtQCSghA==
X-Google-Smtp-Source: ABdhPJygBz1SpT4Q0wFwMTmvFz3T1BZuqYVJ3MJGw+K9ePNmvj0yFA8aIlbR8AxHnBs3YyQhB/CiUg==
X-Received: by 2002:a17:906:e247:: with SMTP id gq7mr6745586ejb.27.1610029303591;
        Thu, 07 Jan 2021 06:21:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:a3f6:c728:8a3d:e3e4])
        by smtp.gmail.com with ESMTPSA id gl23sm2498177ejb.87.2021.01.07.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 06:21:42 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dongchun Zhu <Dongchun.Zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@google.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] media: ov8856: Fix Bayer format dependance on mode
Date:   Thu,  7 Jan 2021 15:21:23 +0100
Message-Id: <20210107142123.639477-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Bayer GRBG10 mode used for earlier modes 3280x2460 and
1640x1232 isn't the mode output by the sensor for the
3264x2448 and 1632x1224 modes.

Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
for 3264x2448 & 1632x1224 modes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Sakari: Added mode information to ov8856_mode struct
 - Sakari: enum_mbus_code updated

 drivers/media/i2c/ov8856.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 2f4ceaa80593..7cd83564585c 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -126,6 +126,9 @@ struct ov8856_mode {
 
 	/* Sensor register settings for this resolution */
 	const struct ov8856_reg_list reg_list;
+
+	/* MEDIA_BUS_FMT for this mode */
+	u32 code;
 };
 
 static const struct ov8856_reg mipi_data_rate_720mbps[] = {
@@ -942,6 +945,11 @@ static const char * const ov8856_test_pattern_menu[] = {
 	"Bottom-Top Darker Color Bar"
 };
 
+static const u32 ov8856_formats[] = {
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+};
+
 static const s64 link_freq_menu_items[] = {
 	OV8856_LINK_FREQ_360MHZ,
 	OV8856_LINK_FREQ_180MHZ
@@ -974,6 +982,7 @@ static const struct ov8856_mode supported_modes[] = {
 			.regs = mode_3280x2464_regs,
 		},
 		.link_freq_index = OV8856_LINK_FREQ_720MBPS,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 	},
 	{
 		.width = 3264,
@@ -986,6 +995,7 @@ static const struct ov8856_mode supported_modes[] = {
 			.regs = mode_3264x2448_regs,
 		},
 		.link_freq_index = OV8856_LINK_FREQ_720MBPS,
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 	},
 	{
 		.width = 1640,
@@ -998,6 +1008,7 @@ static const struct ov8856_mode supported_modes[] = {
 			.regs = mode_1640x1232_regs,
 		},
 		.link_freq_index = OV8856_LINK_FREQ_360MBPS,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 	},
 	{
 		.width = 1632,
@@ -1010,6 +1021,7 @@ static const struct ov8856_mode supported_modes[] = {
 			.regs = mode_1632x1224_regs,
 		},
 		.link_freq_index = OV8856_LINK_FREQ_360MBPS,
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 	}
 };
 
@@ -1281,8 +1293,8 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = mode->code;
 }
 
 static int ov8856_start_streaming(struct ov8856 *ov8856)
@@ -1519,11 +1531,10 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	/* Only one bayer order GRBG is supported */
-	if (code->index > 0)
+	if (code->index >= ARRAY_SIZE(ov8856_formats))
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = ov8856_formats[code->index];
 
 	return 0;
 }
@@ -1532,10 +1543,11 @@ static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_pad_config *cfg,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	if ((fse->code != ov8856_formats[0]) &&
+	    (fse->code != ov8856_formats[1]))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.27.0

