Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D202131671E
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 13:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhBJMvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 07:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhBJMvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 07:51:42 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBE0C061574;
        Wed, 10 Feb 2021 04:51:01 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id x7so833218ljc.5;
        Wed, 10 Feb 2021 04:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ro3BKKFjsV5+bDQPg1YW+54jgkKBfKS3SSCmUlA3e48=;
        b=WJTXpb9Hxynkp47Ga3ZhP7ffedvg0ou3UwKUj/HbypujG4U4UWK0FgYJVZaMpltWzL
         zm5u1Nd8No2W/Zf+X9P9DJcXA/sivWYfhTprwYlThc09HB0mx5mhH9bmDzKpOPHijUuZ
         rBdIGAT3eF24+IZ3y1wLbVQmqWHnMMv77kIA/ojDX7Z153ZWcKSgcWcPhjl9kw48Ep99
         CVvFLhoV0vNLGKEWZbJvLF+mcLg9wkdkh+nL3mkMR/SsTT3m2mNk/hMtIw3B+YcpsL9q
         iOLNtfoR7Ot4vWrnT+zqkttmOe2mnTrC22NhGpxeC+bPOodLXzQxopouiEtxoc0cWeH9
         rh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ro3BKKFjsV5+bDQPg1YW+54jgkKBfKS3SSCmUlA3e48=;
        b=NHriSiQPmqhjPZYICOOo3l00fQF8UeLpQJD2PuUNmBifjmKZxK1+uL18ujxRKi4Pg4
         MRXvdjQEl/MjJSm72ZbcZc9q25oKjRx/UYa14y/D+3OrBMARut4/+1qtlOkBUsZ07fiy
         JXqsYbvx2DczIhoBxVOF8u6R5N1djwil230/4Ph04CaipZ0+DJWAh1+5QhR0ywWp0CoQ
         kmpfGA1jFpgE3w6vhjZg11bspLEM2vqLJwThLRSJk6LmmMXTGvziddveGmlUXQzVGMPw
         QFbzr4iz7qGy83EA2nzVqxvlcmMe4b6ohYyoJClfm4qcJ5picBWCbKvpGDuYGvUPFmrP
         Wjkg==
X-Gm-Message-State: AOAM533+Krlc0vfiDxmLfOGYVohdPNyMWfMQWWD9MVjdYerbttzz0JSH
        +eII0vxV6mFyNGUjxxNRJpQ=
X-Google-Smtp-Source: ABdhPJwGFE0wbHroFLz+JiT4wI5+n+tKcHd3+Y8lzfCO4yELFJsBKbs8yQwXCItgnhS/LC401Np8Eg==
X-Received: by 2002:a05:651c:552:: with SMTP id q18mr1941142ljp.278.1612961460330;
        Wed, 10 Feb 2021 04:51:00 -0800 (PST)
Received: from localhost.localdomain (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id w10sm463595ljm.133.2021.02.10.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:50:59 -0800 (PST)
From:   Vladimir Lypak <junak.pub@gmail.com>
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Fix overflows in clock rate calculations
Date:   Wed, 10 Feb 2021 15:29:02 +0300
Message-Id: <20210210122906.3037085-1-junak.pub@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Because of u32 type being used to store pixel clock rate, expression used
to calculate pipeline clocks (pixel_clock * bpp) produces wrong value due
to integer overflow. This patch changes data type used to store, pass and
retrieve pixel_clock from u32 to u64 to make this mistake less likely to
be repeated in the future.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c           | 2 +-
 drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-csiphy.c         | 4 ++--
 drivers/media/platform/qcom/camss/camss-csiphy.h         | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c            | 4 ++--
 drivers/media/platform/qcom/camss/camss.c                | 2 +-
 drivers/media/platform/qcom/camss/camss.h                | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index be3fe76f3dc30..6307b889baa69 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -462,7 +462,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 static int csid_set_clock_rates(struct csid_device *csid)
 {
 	struct device *dev = csid->camss->dev;
-	u32 pixel_clock;
+	u64 pixel_clock;
 	int i, j;
 	int ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 12bce391d71fd..ec66d1557b8b1 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -57,7 +57,7 @@ static void csiphy_reset(struct csiphy_device *csiphy)
  * Return settle count value or 0 if the CSI2 pixel clock
  * frequency is not available
  */
-static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
+static u8 csiphy_settle_cnt_calc(u64 pixel_clock, u8 bpp, u8 num_lanes,
 				 u32 timer_clk_rate)
 {
 	u32 mipi_clock; /* Hz */
@@ -83,7 +83,7 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
 
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
-				u32 pixel_clock, u8 bpp, u8 lane_mask)
+				u64 pixel_clock, u8 bpp, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	u8 settle_cnt;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 97cb9de850315..cd6eb88a7c153 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -113,7 +113,7 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
  * Return settle count value or 0 if the CSI2 pixel clock
  * frequency is not available
  */
-static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
+static u8 csiphy_settle_cnt_calc(u64 pixel_clock, u8 bpp, u8 num_lanes,
 				 u32 timer_clk_rate)
 {
 	u32 mipi_clock; /* Hz */
@@ -137,7 +137,7 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
 
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
-				u32 pixel_clock, u8 bpp, u8 lane_mask)
+				u64 pixel_clock, u8 bpp, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	u8 settle_cnt;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 509c9a59c09cd..61628f55c4f63 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -102,7 +102,7 @@ static u8 csiphy_get_bpp(const struct csiphy_format *formats,
 static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 {
 	struct device *dev = csiphy->camss->dev;
-	u32 pixel_clock;
+	u64 pixel_clock;
 	int i, j;
 	int ret;
 
@@ -238,7 +238,7 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
-	u32 pixel_clock;
+	u64 pixel_clock;
 	u8 lane_mask = csiphy_get_lane_mask(&cfg->csi2->lane_cfg);
 	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index f7967ef836dcc..450c8247bd533 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -50,7 +50,7 @@ struct csiphy_hw_ops {
 	void (*reset)(struct csiphy_device *csiphy);
 	void (*lanes_enable)(struct csiphy_device *csiphy,
 			     struct csiphy_config *cfg,
-			     u32 pixel_clock, u8 bpp, u8 lane_mask);
+			     u64 pixel_clock, u8 bpp, u8 lane_mask);
 	void (*lanes_disable)(struct csiphy_device *csiphy,
 			      struct csiphy_config *cfg);
 	irqreturn_t (*isr)(int irq, void *dev);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9d..b2c95b46ce661 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1112,7 +1112,7 @@ static inline void vfe_isr_halt_ack(struct vfe_device *vfe)
 static int vfe_set_clock_rates(struct vfe_device *vfe)
 {
 	struct device *dev = vfe->camss->dev;
-	u32 pixel_clock[MSM_VFE_LINE_NUM];
+	u64 pixel_clock[MSM_VFE_LINE_NUM];
 	int i, j;
 	int ret;
 
@@ -1194,7 +1194,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u32 pixel_clock[MSM_VFE_LINE_NUM];
+	u64 pixel_clock[MSM_VFE_LINE_NUM];
 	int i, j;
 	int ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8fefce57bc49f..eb55cf436b717 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -555,7 +555,7 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
  *
  * Return 0 on success or a negative error code otherwise
  */
-int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
+int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 {
 	struct media_entity *sensor;
 	struct v4l2_subdev *subdev;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3a0484683cd6e..fabfce9a3496c 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -108,7 +108,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_entity *camss_find_sensor(struct media_entity *entity);
-int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
+int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
-- 
2.30.0

