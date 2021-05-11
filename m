Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447E637ADE4
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhEKSJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbhEKSJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:18 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9FEC061760
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:11 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id v8so1723599qkv.1
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8gpmvvsEAGbAuWEtaT2oyW5FywpRSYGxdHkKylh6J3k=;
        b=kPMFiuLVT8us7h+f4IRw6WzyyLBbYlexbg/dSHfQaFYYD9WlrnpVCj1QBCWBiCXB2m
         En8TspC8lqUCCA1uGL1djR6LMuh5EMW3/4LMIPoTSY551FxNTH06oYFIfBUG36a1/uYi
         SFqizrMSWx8lRJXLhjAM4IWVetvYoEFwSWvphetHAyZUhw9YZwaDg98hUNbBPGqzhM47
         sy/iYv0RnxiW4ZLxEFVpXfRvbO6WHicGpQY8v8D9HzfW898eccZgADa5+IP/M6YvdBSF
         /DdUlCo65urc+39fIm177sm0L7AdhWIpg0CAATxi9i+kscKe5ITgJP/l2tEoV2l/tvdT
         pXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8gpmvvsEAGbAuWEtaT2oyW5FywpRSYGxdHkKylh6J3k=;
        b=LnvKu3VVJfdRpLUBqRO9E6XG0ChelF6v22jPFZ3n/oSlbn7RInynhvwx78kSC1QaT8
         gFE9Za1aU3j18QFU4x9NVpKRuuYJDGaBA4+Xk7E0tywSozw36V7QXc6ysMELyW4YczC0
         3Xheum+S3Z5AaXGic0gakMQ5jushXRXnxJGg1a27dIb1YslCVvJvsEoFMfr6MbvyfAjx
         baEu8/bR4E48+VKSlHQ2rdzMh+w18SkbfOB1Q9+acavbCMvFm32qCKcZ5LwMvPPC+w0k
         2SH2jJj4Bq6nt811rNR5hFMMIHTiE5aWVv05KPMdyFkOo1+oTGuouoxSNzCNUzmtoJB8
         d3oA==
X-Gm-Message-State: AOAM5336irsqRU/Cu+lAOeGtEYsXbNNmWzRbIGRS3x8gKvpTzqF4P8v1
        BQpUr6UmTmldxtHPrp027LvQ7Q==
X-Google-Smtp-Source: ABdhPJzTueObjNzZo5Oxlcetz3I4204T083Vw0GkOxnZL6Ch/OF/0fzhHJ9ds/+lYrvGXldb+VciGg==
X-Received: by 2002:ae9:edcd:: with SMTP id c196mr28393358qkg.441.1620756490290;
        Tue, 11 May 2021 11:08:10 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:09 -0700 (PDT)
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
Date:   Tue, 11 May 2021 14:07:10 -0400
Message-Id: <20210511180728.23781-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for CSIPHY (2PH/DPHY mode) found on SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 144 +++++++++++++++++-
 1 file changed, 137 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 783b65295d20..61947576ddfb 100644
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
@@ -298,13 +414,23 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
-	int i, l;
-	u32 val;
+	const struct csiphy_reg_t *r;
+	int i, l, array_size;
+	u32 val, lane_enable;
+
+	switch (csiphy->camss->version) {
+	case CAMSS_845:
+		r = &lane_regs_sdm845[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
+		break;
+	case CAMSS_8250:
+		r = &lane_regs_sm8250[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
+		break;
+	}
 
 	for (l = 0; l < 5; l++) {
-		for (i = 0; i < 14; i++) {
-			const struct csiphy_reg_t *r = &lane_regs_sdm845[l][i];
-
+		for (i = 0; i < array_size; i++, r++) {
 			switch (r->csiphy_param_type) {
 			case CSIPHY_SETTLE_CNT_LOWER_BYTE:
 				val = settle_cnt & 0xff;
@@ -331,7 +457,10 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = BIT(c->clk.pos);
+	if (csiphy->camss->version == CAMSS_8250)
+		val = BIT(7);
+	else
+		val = BIT(c->clk.pos);
 	for (i = 0; i < c->num_data; i++)
 		val |= BIT(c->data[i].pos * 2);
 
@@ -349,7 +478,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	if (csiphy->camss->version == CAMSS_8x16 ||
 	    csiphy->camss->version == CAMSS_8x96)
 		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
-	else if (csiphy->camss->version == CAMSS_845)
+	else if (csiphy->camss->version == CAMSS_845 ||
+		 csiphy->camss->version == CAMSS_8250)
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 
 	/* IRQ_MASK registers - disable all interrupts */
-- 
2.26.1

