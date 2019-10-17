Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7C9DAB16
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 13:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405872AbfJQLWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 07:22:17 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39730 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405680AbfJQLWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 07:22:17 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 7272D634C8C
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 14:21:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/7] smiapp: Use non-binned and binned limits correctly
Date:   Thu, 17 Oct 2019 14:18:53 +0300
Message-Id: <20191017111856.10270-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
References: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use non-binned limits when binning is disabled and binned when they're
enabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 27 +++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 5fc3bcc6def0..30830878d069 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -831,23 +831,36 @@ static void smiapp_update_blanking(struct smiapp_sensor *sensor)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
+	uint16_t min_fll, max_fll, min_llp, max_llp, min_lbp;
 	int min, max;
 
+	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
+		min_fll = sensor->limits[SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES_BIN];
+		max_fll = sensor->limits[SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES_BIN];
+		min_llp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN];
+		max_llp = sensor->limits[SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK_BIN];
+		min_lbp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN];
+	} else {
+		min_fll = sensor->limits[SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES];
+		max_fll = sensor->limits[SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES];
+		min_llp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK];
+		max_llp = sensor->limits[SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK];
+		min_lbp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK];
+	}
+
 	min = max_t(int,
 		    sensor->limits[SMIAPP_LIMIT_MIN_FRAME_BLANKING_LINES],
-		    sensor->limits[SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES_BIN] -
+		    min_fll -
 		    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height);
-	max = sensor->limits[SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES_BIN] -
-		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height;
+	max = max_fll -	sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height;
 
 	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
 
 	min = max_t(int,
-		    sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN] -
+		    min_llp -
 		    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width,
-		    sensor->limits[SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN]);
-	max = sensor->limits[SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK_BIN] -
-		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width;
+		    min_lbp);
+	max = max_llp - sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width;
 
 	__v4l2_ctrl_modify_range(hblank, min, max, hblank->step, min);
 
-- 
2.20.1

