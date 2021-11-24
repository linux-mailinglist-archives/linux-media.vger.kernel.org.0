Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDB945CB86
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350002AbhKXSAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349984AbhKXSAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:34 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F648C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:24 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a9so5701427wrr.8
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1occ+YxWobTOQeDHNZOx6/aK1PtJKqKPzKV90Yjfblo=;
        b=y+9wk23plAXNQX9q+qNjByx3f8H+/gRNPLyQwW+N+gh+eFhJdFchyMXAmDPtTySrP1
         jXHi0csO4nnsd/jJ0N9qI2CQ5iXHxb0oWtokkEMmxQvPTea9PlPS5n7kCFJ4oxnW0r9Q
         AIjut58dpkMqPwOWcl/NBPshcAeq8Om/s84NYu1YC7oDf3TP5Z72Bnu4hZNFXATyyBG5
         uW5FDnty2w1ACm/fZibcVY7EEy/fXHfBM1ESkJB3Jzb4kcGkrpFTXZqesTgkdbLHojI3
         xVo4cdLIL2kFeEiN5l0s57fjMhKSi+5ghOocR8lGR4ODRCl8vQ/MF4yV6LrN57jIIH7Z
         gPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1occ+YxWobTOQeDHNZOx6/aK1PtJKqKPzKV90Yjfblo=;
        b=zJpCAw+M5Vr8BQ2fla4yFGeUBOUeQz3e8NZKS0mYtUxemlOWDxGY7WIUfN/66bkf60
         UrgYca9drVu5y7RiUK0VoEc0tQkEU4SQ1S9AlIqX7Y/KL7AGW835fWImMQCPhFhPZCu7
         HAMUbyYlnc9pDNlEbGuGRokP7FYn9712BviSP4H6O8h28x1sVBw1eQVUCOVg6eCezIJz
         wCu/UHZWs94Q3gHjI7a/jNxM1rRFw0i5yDHjsooQuqC7rvRx0ZLEMIv2hR+4nCERmyU5
         8IMjZHuFqzeJC/WWz7pd0X7qalRU/kLGB0odI7RwifZ/yp0DTCQoWapM0vS5Z6Ft5vrG
         3/vQ==
X-Gm-Message-State: AOAM532zhr70NxGz00aFc3wgv2Q5ne8WPx3sLoUU7DcdUgRxrsUJpuWT
        +pWSSmeck1Gk+m082prp8VAbeA==
X-Google-Smtp-Source: ABdhPJyOAl9Q+lip1TsO9jqSokbrNzmusFuZECrjgnVibYgvxjhxWi9+kpj2p4pQ7Io3hiNMGz4llw==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr20589423wrr.53.1637776643099;
        Wed, 24 Nov 2021 09:57:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:22 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 04/19] media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
Date:   Wed, 24 Nov 2021 17:59:06 +0000
Message-Id: <20211124175921.1048375-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add support for CSIPHY (2PH/DPHY mode) found on SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 147 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 2 files changed, 139 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 783b65295d20..c5b0a91b36f8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -62,6 +62,7 @@ struct csiphy_reg_t {
 	u32 csiphy_param_type;
 };
 
+/* GEN2 1.0 2PH */
 static const struct
 csiphy_reg_t lane_regs_sdm845[5][14] = {
 	{
@@ -146,6 +147,121 @@ csiphy_reg_t lane_regs_sdm845[5][14] = {
 	},
 };
 
+/* GEN2 1.2.1 2PH */
+static const struct
+csiphy_reg_t lane_regs_sm8250[5][20] = {
+	{
+		{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0900, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0908, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0034, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0010, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x001C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0024, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C80, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C88, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0734, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0710, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x071C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x070c, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0724, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0A00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0A08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0234, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0210, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x021C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x020c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0224, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0B00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0B08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0434, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0410, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x041C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x040c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0424, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0634, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0610, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x061C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x060c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0624, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+};
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -298,13 +414,25 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
-	int i, l;
+	const struct csiphy_reg_t *r;
+	int i, l, array_size;
 	u32 val;
 
-	for (l = 0; l < 5; l++) {
-		for (i = 0; i < 14; i++) {
-			const struct csiphy_reg_t *r = &lane_regs_sdm845[l][i];
+	switch (csiphy->camss->version) {
+	case CAMSS_845:
+		r = &lane_regs_sdm845[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
+		break;
+	case CAMSS_8250:
+		r = &lane_regs_sm8250[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
+		break;
+	default:
+		unreachable();
+	}
 
+	for (l = 0; l < 5; l++) {
+		for (i = 0; i < array_size; i++, r++) {
 			switch (r->csiphy_param_type) {
 			case CSIPHY_SETTLE_CNT_LOWER_BYTE:
 				val = settle_cnt & 0xff;
@@ -325,13 +453,15 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	bool is_gen2 = (csiphy->camss->version == CAMSS_845 ||
+			csiphy->camss->version == CAMSS_8250);
 	u8 settle_cnt;
 	u8 val;
 	int i;
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = BIT(c->clk.pos);
+	val = is_gen2 ? BIT(7) : BIT(c->clk.pos);
 	for (i = 0; i < c->num_data; i++)
 		val |= BIT(c->data[i].pos * 2);
 
@@ -346,11 +476,10 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	val = 0x00;
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
 
-	if (csiphy->camss->version == CAMSS_8x16 ||
-	    csiphy->camss->version == CAMSS_8x96)
-		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
-	else if (csiphy->camss->version == CAMSS_845)
+	if (is_gen2)
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
+	else
+		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
 
 	/* IRQ_MASK registers - disable all interrupts */
 	for (i = 11; i < 22; i++)
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index dc8b4154f92b..377e2474a485 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -69,6 +69,7 @@ enum camss_version {
 	CAMSS_8x96,
 	CAMSS_660,
 	CAMSS_845,
+	CAMSS_8250,
 };
 
 struct camss {
-- 
2.33.0

