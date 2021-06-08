Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474173A072B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbhFHWlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:41:04 -0400
Received: from mail-qv1-f44.google.com ([209.85.219.44]:45635 "EHLO
        mail-qv1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235335AbhFHWky (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:40:54 -0400
Received: by mail-qv1-f44.google.com with SMTP id g12so11737215qvx.12
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h7Ze/0FZcrCZ8/ohSgsWEa3JmZJ0LCpIBTZQMUOgUhU=;
        b=eamqO/u0HsdTmoA2C+587eGJ/oIlmXzpEBuM4yEYfeq/+5KIr54POJmXjSNQihc0xo
         FvRcPA7xjYbdstnOkPYSq+ZSg9Zhn9JuBwifgaM99JZHmXVwL/flBt9Hwh/lp53Nz4PE
         kbmslmWXvmuMZyLYqzCphXQ8ZJoHDNvk5r+QFfE7D1uI7gPntADS6j+Qn4VRJomaG6ZP
         AqAtOtq1sOEX4vvZzCCMyYP5YHK3INw/4z01UGpgpgetwUjZL5wtj3cgERYHJs3aS4a1
         5w33tilvCQwscRsrHM2Qk8TxLfow0LAKbVE0R0ZKqpNE+hLDbpIoM2YEHdtsS2mq+A47
         JOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h7Ze/0FZcrCZ8/ohSgsWEa3JmZJ0LCpIBTZQMUOgUhU=;
        b=a+m/PMN+7NQ673Vpm0mBBYb5wVwGWt5+KzNqqKJS934gMmHXoF/xHrv7QputpgqHEo
         9uqZERIrruwAIpoMSDdwS4ZhiyeTkkk2xJX71Mh422hAWHbqrVfesVhCRDTZBqIChxDq
         Ekd0faAMLRgOoIjEmzwdBaoV1t1ZnUrb/FxWw4/+4jI6qPbYdoOMy3/lGrr2bdl0XzQ3
         xv2rinMh5mh72etyhub8kuTfvDlGTQWSc3+sho+MkiVO7smihCIahxGfN5Sk4PNRubjJ
         pBoPGf7unnHM+RF17H9qtzl83h7aed9d3T+dmmkx9HzKM3FY8QYhCs/ifu+13e4b8rSk
         RHfQ==
X-Gm-Message-State: AOAM531Qc0kO2+Fm/TMnU4K1XYDpTafCRKkThjqRsLz3DenhCLlWGakO
        uOA8KwNX55j5MteKt3J3cn8UcQ==
X-Google-Smtp-Source: ABdhPJzDHkTFsvO+r15hgBa0ALf0Crvy2Ll+TqLfx+jjBK9zYG3L2pU67agXtLjgoW5GtSl4ohzU6A==
X-Received: by 2002:a05:6214:240b:: with SMTP id fv11mr2695139qvb.23.1623191869113;
        Tue, 08 Jun 2021 15:37:49 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:48 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 03/17] media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
Date:   Tue,  8 Jun 2021 18:34:52 -0400
Message-Id: <20210608223513.23193-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for CSIPHY (2PH/DPHY mode) found on SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 147 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 2 files changed, 139 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 783b65295d20b..c5b0a91b36f88 100644
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
index dc8b4154f92b3..377e2474a485f 100644
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
2.26.1

