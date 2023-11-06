Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED7D7E216D
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjKFM0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbjKFM03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:29 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC1797
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273586; x=1730809586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cYAvv1Nys5uEOYKAL0Y7VUVGVqMcnfvVEFuzydXtLsc=;
  b=lP4xRKkpDJ7e+Mx/DRkBdlWppjeQfAk1FGlIyld1N8JK9hZgn1Novxty
   XyULDCZ1Q3OHSyvA4+CAzfYZSIAamAStBeFnto7nG/R1EQENywxEzM2x1
   sGV9XTL58FG6DlxlghxzncIRB6Cy6yadu2kh2lL4DL21ML8wG8G9hQ8m7
   AB6RT6RKR2hb4LBvky82oBjnzzgBhYbl5MfZsD5Ao7r/kywWK6+YBHqoc
   cpJBH6RDpyuTT00+D1ONV37A0TAgYCXdX/SwqCatM7xNb53m7cH+kozYR
   0GODX8yaVrbcNu6DX+CEqYFfKvaDnhYxgG5eoHOARdSDdS0P5n+kVQwq+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369469736"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369469736"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879427767"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="879427767"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:23 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1A2FF11FBBC;
        Mon,  6 Nov 2023 14:26:20 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 27/31] media: ccs: Compute binning configuration from sub-device state
Date:   Mon,  6 Nov 2023 14:25:35 +0200
Message-Id: <20231106122539.1268265-28-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calculate binning configuration from sub-device state so the state related
configuration can be removed from the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 72 ++++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1d1a157aec09..8a47440a2456 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -501,13 +501,52 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
 	return ccs_pll_calculate(&client->dev, &lim, pll);
 }
 
+static void
+ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
+{
+	struct v4l2_subdev_state *binner_state =
+		v4l2_subdev_get_locked_active_state(&sensor->binner->sd);
+	struct v4l2_rect *binner_sink_crop =
+		v4l2_subdev_state_get_crop(binner_state, CCS_PAD_SINK,
+					   CCS_STREAM_PIXEL);
+	struct v4l2_rect *binner_sink_comp =
+		v4l2_subdev_state_get_compose(binner_state, CCS_PAD_SINK,
+					      CCS_STREAM_PIXEL);
+
+	if (binner_sink_crop->width == binner_sink_comp->width &&
+	    binner_sink_crop->height == binner_sink_comp->height) {
+		if (binning_mode)
+			*binning_mode = 0;
+
+		if (binh)
+			*binh = 1;
+
+		if (binv)
+			*binv = 1;
+
+		return;
+	}
+
+	if (binning_mode)
+		*binning_mode = 1;
+
+	if (binh)
+		*binh = binner_sink_crop->width / binner_sink_comp->width;
+
+	if (binv)
+		*binv = binner_sink_crop->height / binner_sink_comp->height;
+}
+
 static int ccs_pll_update(struct ccs_sensor *sensor)
 {
 	struct ccs_pll *pll = &sensor->pll;
+	u8 binh, binv;
 	int rval;
 
-	pll->binning_horizontal = sensor->binning_horizontal;
-	pll->binning_vertical = sensor->binning_vertical;
+	ccs_get_binning(sensor, NULL, &binh, &binv);
+
+	pll->binning_horizontal = binh;
+	pll->binning_vertical = binv;
 	pll->link_freq =
 		sensor->link_freq->qmenu_int[sensor->link_freq->val];
 	pll->scale_m = sensor->scale_m;
@@ -1231,8 +1270,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
 	struct v4l2_ctrl *hblank = sensor->hblank;
 	u16 min_fll, max_fll, min_llp, max_llp, min_lbp;
 	int min, max;
+	u8 binh, binv;
+
+	ccs_get_binning(sensor, NULL, &binh, &binv);
 
-	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
+	if (binv > 1 || binh > 1) {
 		min_fll = CCS_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
 		max_fll = CCS_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
 		min_llp = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
@@ -1801,7 +1843,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
 					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	unsigned int binning_mode;
+	u8 binning_mode, binh, binv;
 	int rval;
 
 	if (pad != CCS_PAD_SRC)
@@ -1823,19 +1865,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 		goto err_pm_put;
 
 	/* Binning configuration */
-	if (sensor->binning_horizontal == 1 &&
-	    sensor->binning_vertical == 1) {
-		binning_mode = 0;
-	} else {
-		u8 binning_type =
-			(sensor->binning_horizontal << 4)
-			| sensor->binning_vertical;
+	ccs_get_binning(sensor,	&binning_mode, &binh, &binv);
 
-		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
+	if (binning_mode) {
+		rval = ccs_write(sensor, BINNING_TYPE, (binh << 4) | binv);
 		if (rval < 0)
 			goto err_pm_put;
-
-		binning_mode = 1;
 	}
 	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
 	if (rval < 0)
@@ -2241,9 +2276,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-			} else if (ssd == sensor->binner) {
-				sensor->binning_horizontal = 1;
-				sensor->binning_vertical = 1;
 			}
 		}
 		fallthrough;
@@ -2517,10 +2549,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 			best = this;
 		}
 	}
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sensor->binning_vertical = binv;
-		sensor->binning_horizontal = binh;
-	}
 
 	sel->r.width = (sink_crop->width / binh) & ~1;
 	sel->r.height = (sink_crop->height / binv) & ~1;
@@ -3707,8 +3735,6 @@ static int ccs_probe(struct i2c_client *client)
 				sensor->binning_subtypes[i].vertical);
 		}
 	}
-	sensor->binning_horizontal = 1;
-	sensor->binning_vertical = 1;
 
 	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
 		dev_err(&client->dev, "sysfs ident entry creation failed\n");
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 47c77f3284c8..3d9001925634 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -235,9 +235,6 @@ struct ccs_sensor {
 	u32 embedded_mbus_code;
 	u8 emb_data_ctrl;
 
-	u8 binning_horizontal;
-	u8 binning_vertical;
-
 	u8 scale_m;
 	u8 scaling_mode;
 
-- 
2.39.2

