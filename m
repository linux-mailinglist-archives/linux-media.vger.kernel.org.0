Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91ABE32C78F
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348233AbhCDAcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243239AbhCCSJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 13:09:41 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988F5C061760
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 10:08:56 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id n16so21664971lfb.4
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 10:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1IYGjcV64ZDmP6/oFTMyIZJ2q3HMCbj9wNdpmV4JDRE=;
        b=VQ/YuyhIZqmF1yC8GPojGmr9NebO70jd2OK0VyIxjrG3rLVITW+Zfkx7tKCB96x2nF
         e5SKdQX+3IVNh4LMsXs5o15PZKOChmr/yM9fKIx3iefGrIAXI5afFNas4ZQ71NY0rC5N
         9v+drrLoEiVoVOICt3FPW7PMBe96YfbZsNBtw6fw0oYlcmqb38piC8y81HwaJ58vqD9N
         PB93/qqBC9Ar8Vh6TiekXSFkT8/vRhJIGtP7fgWc+WF3bppNHwZ56Uvy0W8Pe4BOx5lG
         j/tU9t8+JR7XIZ5qwkrCHqYouMNzBuIPPDLmbNHdMndm93Lvj2Bo7AYH6qiXq/Tp09Pa
         zjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1IYGjcV64ZDmP6/oFTMyIZJ2q3HMCbj9wNdpmV4JDRE=;
        b=OQGxYf++6m+Nn0XBAi3w+3tcKyVZzc1WehkJUGJ0u5nCSWlAGnkm7npCm5HdlRqEUp
         UmVZpFCMSgbwnfNM7v+4LFPZiizKROm/PFlc2XwN3/nOpAtecGBhjHvhsRxTO4fHPGg+
         KdNypyRTSGlZyamz0LykxVmQOhRMMomAcQAXHldKe51GWOgrrbyqCDLO/I0uwfYg4lyu
         sjLn5UhLqHiHT5809cdcLqMLa732jnZS9toEiMHueEYZGm4je6ij7hUqZsjL6AnQlo+Y
         3Su7BwQcxbtJCJEc/XkNsBVam2peSMApgVQODaQrPe3F8Ef68Bwot50ebuspDZaGO5eS
         Z19Q==
X-Gm-Message-State: AOAM531gC0+vh881245SrLfPBqBUHQXK32d3/nLRzSmf/U9MPIzDbi0P
        5XZPA4vWVG/j5uTl4jPRSfPmaA==
X-Google-Smtp-Source: ABdhPJx5Ws/0LXMqkGyu6MSVlqs46UwMtx7hO3jPKnkhPXrM3hYnc9iNJ56M6CyyrDilMOhw6yXfQg==
X-Received: by 2002:a05:6512:3188:: with SMTP id i8mr15911438lfe.121.1614794935020;
        Wed, 03 Mar 2021 10:08:55 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id j15sm2220990lfm.138.2021.03.03.10.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:08:54 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC PATCH 2/4] media: ti-vpe: cal: use v4l2_get_link_freq() for DPHY timing configuration
Date:   Wed,  3 Mar 2021 21:08:15 +0300
Message-Id: <20210303180817.12285-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303180817.12285-1-andrey.konovalov@linaro.org>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To configure DPHY properly the driver needs to know CSI-2 link frequency.
Instead of calculating it from the value of V4L2_CID_PIXEL_RATE control
(which can give wrong link frequency value for some sensors) call
v4l2_get_link_freq(). It uses V4L2_CID_LINK_FREQ if this control is
implemented in the sensor driver, and falls back to calculating it from
V4L2_CID_PIXEL_RATE otherwise.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 47 +++++++-------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index dd48017859cd..0c1046a1fea4 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -45,22 +45,20 @@ static inline void camerarx_write(struct cal_camerarx *phy, u32 offset, u32 val)
  * ------------------------------------------------------------------
  */
 
-static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
+static s64 cal_camerarx_get_link_freq(struct cal_camerarx *phy)
 {
-	struct v4l2_ctrl *ctrl;
-	s64 rate;
+	u32 num_lanes = phy->endpoint.bus.mipi_csi2.num_data_lanes;
+	s64 freq;
 
-	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		phy_err(phy, "no pixel rate control in subdev: %s\n",
+	freq = v4l2_get_link_freq(phy->sensor->ctrl_handler, phy->fmtinfo->bpp,
+				  num_lanes * 2);
+	if (freq < 0)
+		phy_err(phy, "failed to get link frequency from subdev: %s\n",
 			phy->sensor->name);
-		return -EPIPE;
-	}
-
-	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
+	else
+		phy_dbg(3, phy, "sensor link frequency: %lld\n", freq);
 
-	return rate;
+	return freq;
 }
 
 static void cal_camerarx_lane_config(struct cal_camerarx *phy)
@@ -116,25 +114,14 @@ void cal_camerarx_disable(struct cal_camerarx *phy)
 #define TCLK_MISS	1
 #define TCLK_SETTLE	14
 
-static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate)
+static void cal_camerarx_config(struct cal_camerarx *phy, s64 link_freq)
 {
 	unsigned int reg0, reg1;
 	unsigned int ths_term, ths_settle;
 	unsigned int csi2_ddrclk_khz;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-			&phy->endpoint.bus.mipi_csi2;
-	u32 num_lanes = mipi_csi2->num_data_lanes;
 
 	/* DPHY timing configuration */
-
-	/*
-	 * CSI-2 is DDR and we only count used lanes.
-	 *
-	 * csi2_ddrclk_khz = external_rate / 1000
-	 *		   / (2 * num_lanes) * phy->fmtinfo->bpp;
-	 */
-	csi2_ddrclk_khz = div_s64(external_rate * phy->fmtinfo->bpp,
-				  2 * num_lanes * 1000);
+	csi2_ddrclk_khz = div_s64(link_freq, 1000);
 
 	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
 
@@ -270,14 +257,14 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 
 static int cal_camerarx_start(struct cal_camerarx *phy)
 {
-	s64 external_rate;
+	s64 link_freq;
 	u32 sscounter;
 	u32 val;
 	int ret;
 
-	external_rate = cal_camerarx_get_external_rate(phy);
-	if (external_rate < 0)
-		return external_rate;
+	link_freq = cal_camerarx_get_link_freq(phy);
+	if (link_freq < 0)
+		return link_freq;
 
 	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
@@ -325,7 +312,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	camerarx_read(phy, CAL_CSI2_PHY_REG0);
 
 	/* Program the PHY timing parameters. */
-	cal_camerarx_config(phy, external_rate);
+	cal_camerarx_config(phy, link_freq);
 
 	/*
 	 *    b. Assert the FORCERXMODE signal.
-- 
2.17.1

