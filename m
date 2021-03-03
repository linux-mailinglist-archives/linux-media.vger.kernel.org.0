Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9832132C781
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355615AbhCDAcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386135AbhCCRqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 12:46:45 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26FAC0613D9
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 09:43:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id k9so18563532lfo.12
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 09:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1IcwK3DemopH0DjeG0nZJ6cnUVN6kwVF/dS7NnpgeP0=;
        b=tryws+fxiTO4g1MkSYeAg1x/Nyj4xoGpoTRjxq0mWszjuPMpVOAJXpvGxVi39b+AD9
         Q+16cwUjZ2gqT0ml0P9XvERDJiBm2oqyo+NAOXLOFvuaboATnex18STcyTobSmFGvkpv
         RRPIgofFn/hzlleW3mNbZJkDiJNd34xhFuAKPRrXZwG107cYo4Ll/AHgX/KXNM9RU4/+
         KXT3Hczm1L5VfY+n/xWlyzoceWpTSPT3tvmLu1oIZw6p3T6iREPo8qAyF90eQ4arsQ7W
         yy7UOxx7NzMOhRbwJ4RE4c4hidlpKilv/uGZCIR/kvGz6oCsKkewBq2PGUCFo9KtNZmv
         by0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1IcwK3DemopH0DjeG0nZJ6cnUVN6kwVF/dS7NnpgeP0=;
        b=OzrW4YC/Scv4WtCcCX3wCNMwbspp4uPvlGpwFbu9ZzJ6uewOaRj+qjupfRbbZkCIz8
         C1lJ+fc4bYM+a4TCbX79Q8t0JEa9L+G7QsgOKimPQqrqW/T5ZK2fue1BmS8O8REtVDEe
         WAKfH5Bm2RBXjpm4Z6qCJ7iOtUPjRCpj2k9TO2VjAjexh9dKPgh8zI+WpEVubLbDoPDy
         qNU9QbfcQ2BlZ9dWgIzIVYGJg/3VzOSppKXdn0YzTZLhwdYswiqqOW0AgMRixGrjeCyH
         7gkArjSvuqvjX/T5kSV1kwsMvm+zi683bYhYfeKWAvEUZNX6cusWvvluHoBuMV/nrs+w
         B9BA==
X-Gm-Message-State: AOAM530CzHP4FrLFACg5W8D0x7QyNhBKXq6Dglw5eNBDyQRosZInUC1V
        xXmhJpDZg7XMBRiyLrtheZlBFg==
X-Google-Smtp-Source: ABdhPJyoNPZvxOD+XWaq0dVJOVlpxRTA+J0yep5euw6rQIWrrAMSwe1NXCdP7UjZ4R/JGZfexX7t/Q==
X-Received: by 2002:a19:86c3:: with SMTP id i186mr14039688lfd.434.1614793405196;
        Wed, 03 Mar 2021 09:43:25 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id s7sm2101441lfi.140.2021.03.03.09.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:43:24 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 2/3] media: camss: use v4l2_get_link_freq() to calculate the relevant clocks
Date:   Wed,  3 Mar 2021 20:42:49 +0300
Message-Id: <20210303174250.11405-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303174250.11405-1-andrey.konovalov@linaro.org>
References: <20210303174250.11405-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are places in the camss driver where camss_get_pixel_clock() is
called to get the pixel rate (using V4L2_CID_PIXEL_RATE control) and to
calculate the link frequency from it. There is a case when this would
not work: when V4L2_CID_PIXEL_RATE gets the rate at which the pixels are
read (sampled) from the sensor's pixel array, and this rate is different
from the pixel transmission rate over the CSI link, the link frequency
value can't be calculated from the pixel rate. One needs to use
V4L2_CID_LINK_FREQ to get the link frequency in this case.

Replace such calls to camss_get_pixel_clock() with calls to a wrapper
around v4l2_get_link_freq(). v4l2_get_link_freq() tries V4L2_CID_LINK_FREQ
first, and if it is not implemented by the camera sensor driver, falls
back to V4L2_CID_PIXEL_RATE to calculate the link frequency value from.

Calls to camss_get_pixel_clock() from vfe_[check,set]_clock_rates()
are left intact as it looks like this VFE clock does depend on the
rate the pixel samples comes out of the camera sensor, not on the
frequency at which the link between the sensor and the CSI receiver
operates.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 20 +++++------
 .../qcom/camss/camss-csiphy-2ph-1-0.c         | 22 ++++++------
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 22 ++++++------
 .../media/platform/qcom/camss/camss-csiphy.c  | 36 +++++++++----------
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 +-
 drivers/media/platform/qcom/camss/camss.c     | 23 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  2 ++
 7 files changed, 71 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index be3fe76f3dc3..cff9759c9158 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -462,13 +462,17 @@ static irqreturn_t csid_isr(int irq, void *dev)
 static int csid_set_clock_rates(struct csid_device *csid)
 {
 	struct device *dev = csid->camss->dev;
-	u32 pixel_clock;
+	const struct csid_format *fmt;
+	s64 link_freq;
 	int i, j;
 	int ret;
 
-	ret = camss_get_pixel_clock(&csid->subdev.entity, &pixel_clock);
-	if (ret)
-		pixel_clock = 0;
+	fmt = csid_get_fmt_entry(csid->formats, csid->nformats,
+				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
+	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
+					csid->phy.lane_cnt);
+	if (link_freq < 0)
+		link_freq = 0;
 
 	for (i = 0; i < csid->nclocks; i++) {
 		struct camss_clock *clock = &csid->clock[i];
@@ -477,13 +481,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
 		    !strcmp(clock->name, "csi1") ||
 		    !strcmp(clock->name, "csi2") ||
 		    !strcmp(clock->name, "csi3")) {
-			const struct csid_format *f = csid_get_fmt_entry(
-				csid->formats,
-				csid->nformats,
-				csid->fmt[MSM_CSIPHY_PAD_SINK].code);
-			u8 num_lanes = csid->phy.lane_cnt;
-			u64 min_rate = pixel_clock * f->bpp /
-							(2 * num_lanes * 4);
+			u64 min_rate = link_freq / 4;
 			long rate;
 
 			camss_add_clock_margin(&min_rate);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 12bce391d71f..30b454c369ab 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -51,16 +51,13 @@ static void csiphy_reset(struct csiphy_device *csiphy)
  *
  * Helper function to calculate settle count value. This is
  * based on the CSI2 T_hs_settle parameter which in turn
- * is calculated based on the CSI2 transmitter pixel clock
- * frequency.
+ * is calculated based on the CSI2 transmitter link frequency.
  *
- * Return settle count value or 0 if the CSI2 pixel clock
- * frequency is not available
+ * Return settle count value or 0 if the CSI2 link frequency
+ * is not available
  */
-static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
-				 u32 timer_clk_rate)
+static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 {
-	u32 mipi_clock; /* Hz */
 	u32 ui; /* ps */
 	u32 timer_period; /* ps */
 	u32 t_hs_prepare_max; /* ps */
@@ -68,8 +65,10 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
 	u32 t_hs_settle; /* ps */
 	u8 settle_cnt;
 
-	mipi_clock = pixel_clock * bpp / (2 * num_lanes);
-	ui = div_u64(1000000000000LL, mipi_clock);
+	if (link_freq <= 0)
+		return 0;
+
+	ui = div_u64(1000000000000LL, link_freq);
 	ui /= 2;
 	t_hs_prepare_max = 85000 + 6 * ui;
 	t_hs_prepare_zero_min = 145000 + 10 * ui;
@@ -83,15 +82,14 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
 
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
-				u32 pixel_clock, u8 bpp, u8 lane_mask)
+				s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	u8 settle_cnt;
 	u8 val, l = 0;
 	int i = 0;
 
-	settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
-					    csiphy->timer_clk_rate);
+	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	writel_relaxed(0x1, csiphy->base +
 		       CAMSS_CSI_PHY_GLBL_T_INIT_CFG0);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 97cb9de85031..da7c3d3f9a10 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -107,24 +107,23 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
  *
  * Helper function to calculate settle count value. This is
  * based on the CSI2 T_hs_settle parameter which in turn
- * is calculated based on the CSI2 transmitter pixel clock
- * frequency.
+ * is calculated based on the CSI2 transmitter link frequency.
  *
- * Return settle count value or 0 if the CSI2 pixel clock
- * frequency is not available
+ * Return settle count value or 0 if the CSI2 link frequency
+ * is not available
  */
-static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
-				 u32 timer_clk_rate)
+static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 {
-	u32 mipi_clock; /* Hz */
 	u32 ui; /* ps */
 	u32 timer_period; /* ps */
 	u32 t_hs_prepare_max; /* ps */
 	u32 t_hs_settle; /* ps */
 	u8 settle_cnt;
 
-	mipi_clock = pixel_clock * bpp / (2 * num_lanes);
-	ui = div_u64(1000000000000LL, mipi_clock);
+	if (link_freq <= 0)
+		return 0;
+
+	ui = div_u64(1000000000000LL, link_freq);
 	ui /= 2;
 	t_hs_prepare_max = 85000 + 6 * ui;
 	t_hs_settle = t_hs_prepare_max;
@@ -137,15 +136,14 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
 
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
-				u32 pixel_clock, u8 bpp, u8 lane_mask)
+				s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	u8 settle_cnt;
 	u8 val, l = 0;
 	int i;
 
-	settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
-					    csiphy->timer_clk_rate);
+	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	val = BIT(c->clk.pos);
 	for (i = 0; i < c->num_data; i++)
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 509c9a59c09c..40384d7ca78c 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -102,23 +102,23 @@ static u8 csiphy_get_bpp(const struct csiphy_format *formats,
 static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 {
 	struct device *dev = csiphy->camss->dev;
-	u32 pixel_clock;
+	s64 link_freq;
 	int i, j;
 	int ret;
 
-	ret = camss_get_pixel_clock(&csiphy->subdev.entity, &pixel_clock);
-	if (ret)
-		pixel_clock = 0;
+	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
+				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
+	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	if (link_freq < 0)
+		link_freq  = 0;
 
 	for (i = 0; i < csiphy->nclocks; i++) {
 		struct camss_clock *clock = &csiphy->clock[i];
 
 		if (csiphy->rate_set[i]) {
-			u8 bpp = csiphy_get_bpp(csiphy->formats,
-					csiphy->nformats,
-					csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
-			u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
-			u64 min_rate = pixel_clock * bpp / (2 * num_lanes * 4);
+			u64 min_rate = link_freq / 4;
 			long round_rate;
 
 			camss_add_clock_margin(&min_rate);
@@ -238,22 +238,18 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
-	u32 pixel_clock;
+	s64 link_freq;
 	u8 lane_mask = csiphy_get_lane_mask(&cfg->csi2->lane_cfg);
 	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
+	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 	u8 val;
-	int ret;
 
-	ret = camss_get_pixel_clock(&csiphy->subdev.entity, &pixel_clock);
-	if (ret) {
-		dev_err(csiphy->camss->dev,
-			"Cannot get CSI2 transmitter's pixel clock\n");
-		return -EINVAL;
-	}
-	if (!pixel_clock) {
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+
+	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
-			"Got pixel clock == 0, cannot continue\n");
+			"Cannot get CSI2 transmitter's link frequency\n");
 		return -EINVAL;
 	}
 
@@ -268,7 +264,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	writel_relaxed(val, csiphy->base_clk_mux);
 	wmb();
 
-	csiphy->ops->lanes_enable(csiphy, cfg, pixel_clock, bpp, lane_mask);
+	csiphy->ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index f7967ef836dc..d71b8bc6ec00 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -50,7 +50,7 @@ struct csiphy_hw_ops {
 	void (*reset)(struct csiphy_device *csiphy);
 	void (*lanes_enable)(struct csiphy_device *csiphy,
 			     struct csiphy_config *cfg,
-			     u32 pixel_clock, u8 bpp, u8 lane_mask);
+			     s64 link_freq, u8 lane_mask);
 	void (*lanes_disable)(struct csiphy_device *csiphy,
 			      struct csiphy_config *cfg);
 	irqreturn_t (*isr)(int irq, void *dev);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7c0f669f8aa6..eb8fb8c34acd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -548,6 +548,29 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
 	}
 }
 
+/**
+ * camss_get_link_freq - Get link frequency from sensor
+ * @entity: Media entity in the current pipeline
+ * @bpp: Number of bits per pixel for the current format
+ * @lanes: Number of lanes in the link to the sensor
+ *
+ * Return link frequency on success or a negative error code otherwise
+ */
+s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
+			unsigned int lanes)
+{
+	struct media_entity *sensor;
+	struct v4l2_subdev *subdev;
+
+	sensor = camss_find_sensor(entity);
+	if (!sensor)
+		return -ENODEV;
+
+	subdev = media_entity_to_v4l2_subdev(sensor);
+
+	return v4l2_get_link_freq(subdev->ctrl_handler, bpp, 2 * lanes);
+}
+
 /*
  * camss_get_pixel_clock - Get pixel clock rate from sensor
  * @entity: Media entity in the current pipeline
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3a0484683cd6..86cdc25189eb 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -108,6 +108,8 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_entity *camss_find_sensor(struct media_entity *entity);
+s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
+			unsigned int lanes);
 int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
-- 
2.17.1

