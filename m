Return-Path: <linux-media+bounces-26562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D5A3F289
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D980817A0AA
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618002080F3;
	Fri, 21 Feb 2025 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oUyT6HG1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA382080EB;
	Fri, 21 Feb 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135175; cv=none; b=kWPoMeseKtZqQndg1cubbOgJtGR/BkwnZSLasw4nTsfpGdz0tcqTJk7gVn+0aK+Jpi80Pm4Do7xcZRy7BNKmXcuDQfH0PDIlIpjakIqQBiQ98Ct9UJBFAtPHhlKdmBBuMOjKt3k4xqjn15FHCfCGdHsSFpY7G30wh6513U6ZXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135175; c=relaxed/simple;
	bh=+gXyMKP4eqelr1/DZw83xU4JeHFeZslRcR2URBsx/s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtnOtbAOL34F90PoHVlsDN+/v4yaUQ7acVJZULBrCTJRkvlSOhu/h0TAAfrVgHCxRIsfw5lcEpccK9RNA4s900sJ/EoG90gaKEWHWTUEtA4t/TAqx6hp5b5VutpTHNRjhMTtbIU7Qk2N/Tg9d+RnqHiTtZLwkTzBGdemTKhIZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oUyT6HG1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CCAC2EC;
	Fri, 21 Feb 2025 11:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740135088;
	bh=+gXyMKP4eqelr1/DZw83xU4JeHFeZslRcR2URBsx/s4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oUyT6HG1lFdbZAkvGkYmnJ3D6UYOW9rnlOfAv9gjYiQaM0aa1V1H+aA00fHojFlJa
	 2M4jL29v6FK2y5xDpWO8BZlUPxV2TWprrq8mFS8RPJNHtumPKCqIdGHSdOPv1hk+MQ
	 1/Ft2Gz8KO0kaCJBQ1gT7suXq+Eh1w24IYJ64cAk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 21 Feb 2025 16:22:15 +0530
Subject: [PATCH v2 3/3] media: i2c: imx219: Only use higher LLP_MIN for
 binned resolutions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-imx219_fixes_v2-v2-3-a72154c7c267@ideasonboard.com>
References: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
In-Reply-To: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3695;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+gXyMKP4eqelr1/DZw83xU4JeHFeZslRcR2URBsx/s4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnuFrh7GtYwEG0TFfU/M83dvMDvJZUtPfVEMqtc
 Flm5AQmK9aJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7ha4QAKCRBD3pH5JJpx
 RanrD/90AtR5Sx32KLuJBVzCGpjYHYdiomkRcqBgQNEEUk3cTYrY/OsTY8GxAIg9yrnyBvREvrM
 8Z/BTPXEFexHrAMpuADugaPzSGUbJIsrksZoSnM+aSdbkIUVoMOOY5OCAjrk4+F8knHhvLKO1iZ
 THUBAabXF9aW6YRiUwor4mXzsBMIj6RFT9vILkR+dfujggKsJka45MpHPNi9V6dJX6FNoFEWGwR
 uHWJD8yZOJifZGfI7c1wWuv5Xuzt0aj5dHM3DlVD+ASC338O1EQHKy7ey2b+Iak98hJkU0AIK8g
 CBcmi1V9DtvCgoipLYuHxui+9xyDeZvYoi+tbl1BKPRlvGsuU9/i7mSx5c4NjVtY/JhY7VWS91w
 MVx4ShOgzcLkOs2yj1Igq4GUM7A/eGcybDqtusP3nhYk292HSIKy0Fdxv+0huu3IbQVePwx2AV0
 X7bTz2Re72b6Y18PxuBu/aCExKKySRvBbI6V+IN1jZhlXbpGcGJeVogmaZE9y4uoem1/c1hQUvj
 cnS/RMCrg+iU6gejptuejtpdQgxuNhmnA8bB3f9ChH+39/DQkB3cwtipGOrxpzLAjV2U2R+6Lst
 raxO4Drgl4oBg/B9w9YXIywnbU1L8JgNXpbNiSQZKxEGN25OlySGMqeAahMIRoLGzXKZrD7pdLd
 8AZvLPMhFkGzhOg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The LLP_MIN of 3560 is only needed to fix artefacts seen with binned
resolutions. As increasing the LLP reduces the highest possible
framerate by ~3%, use the old default minimum of 3448 if we are not
doing 2x2 analog binning.

Also restore the fll_def value for non-binned modes in the modes
definition to restore the default mode framerate to 30fps.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Link: https://lore.kernel.org/linux-media/CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
    - Fix the binning check, and only update the LLP minimum if we are
      doing analog binning
    - Add a note in the commit message for the fll_def value reverts
---
 drivers/media/i2c/imx219.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2081822533f9dff0a1ca93a09dd8333ec4043645..ec8d32b0f9e75b4b14d905b1e6b85180e5697ce1 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,8 @@
 #define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
-#define IMX219_LLP_MIN			0x0de8
+#define IMX219_LLP_MIN			0x0d78
+#define IMX219_BINNED_LLP_MIN		0x0de8
 #define IMX219_LLP_MAX			0x7ff0
 
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -311,13 +312,13 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
-		.fll_def = 3415,
+		.fll_def = 3526,
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
-		.fll_def = 1707,
+		.fll_def = 1763,
 	},
 	{
 		/* 2x2 binned 60fps mode */
@@ -865,7 +866,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	unsigned int bin_h, bin_v;
+	u8 bin_h, bin_v;
 	u32 prev_line_len;
 
 	format = v4l2_subdev_state_get_format(state, 0);
@@ -895,7 +896,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
 		int exposure_def;
-		int hblank;
+		int hblank, llp_min;
 		int pixel_rate;
 
 		/* Update limits and set FPS to default */
@@ -912,6 +913,19 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 imx219->exposure->minimum,
 					 exposure_max, imx219->exposure->step,
 					 exposure_def);
+
+		/*
+		 * With analog binning the default minimum line length of 3448
+		 * can cause artefacts with RAW10 formats, because the ADC
+		 * operates on two lines together. So we switch to a higher
+		 * minimum of 3560.
+		 */
+		imx219_get_binning(state, &bin_h, &bin_v);
+		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
+				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
+		__v4l2_ctrl_modify_range(imx219->hblank, llp_min - mode->width,
+					 IMX219_LLP_MAX - mode->width, 1,
+					 llp_min - mode->width);
 		/*
 		 * Retain PPL setting from previous mode so that the
 		 * line time does not change on a mode change.
@@ -920,10 +934,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		 * mode width subtracted.
 		 */
 		hblank = prev_line_len - mode->width;
-		__v4l2_ctrl_modify_range(imx219->hblank,
-					 IMX219_LLP_MIN - mode->width,
-					 IMX219_LLP_MAX - mode->width, 1,
-					 IMX219_LLP_MIN - mode->width);
 		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 
 		/* Scale the pixel rate based on the mode specific factor */

-- 
2.48.1


