Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363461C1EB2
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 22:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgEAUff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 16:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgEAUfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 16:35:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A47C061A0C;
        Fri,  1 May 2020 13:35:34 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h9so2566283wrt.0;
        Fri, 01 May 2020 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2jbjKpiLuW8C9Df3qn3Yi0fFmfGmKUbsyy8So15/ZHA=;
        b=O8lOsLcOi+I/G/TaTcDzAv0Q7WpBaa7BM3FW40aLRFSXPVQzhu6+BfIFAzWxOuyFxc
         vq/DHvndbK0xPv2Hthpp3ljhdQg2Lqm/QUclhj3fuzewsidoOK0FzQ0NzueCHJoqZIKE
         RR2ILY6qt0YQytX8cDPpgozmrmGjKqpG4oEnNBEuQVDtsX2iqVLEt5ldHzcXnBt+iMnv
         jh7I4VvKMDLtCtL+LrSHQIE+yzZ72hdK+j33j71B06XvqrH/w9xuP6vwaAP2hVQrMy9a
         LpSVwM5Ud6FNoCggDlnVDqYWwZf7AbaumskRl5oPbi5ogIhpNsOHzOjTWfArpukoG2aI
         xgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jbjKpiLuW8C9Df3qn3Yi0fFmfGmKUbsyy8So15/ZHA=;
        b=EEu+CdNQwJk0tvtsLkCVMefPwM+6ozUsCwPa4IwUKTEhp7ZFlf4L3AogmewHqZjmgV
         dFKBmWCvJojuJd1eL7tJhJhF/qPxXFMZiJ3Mp78WxXcS1rQiPmvV7sLFqrs4uBNNFCe1
         SmW7zlxoZjb+b9fDYXaB+0eysPtQ/HP2SzdlI8K8yV+KWdRiAg/ohsTfgMQBMoupzm4i
         sflUc+njD4uBrmvSIXh59GfkrN/+uuFY4XGiBMfDLJwvhGHrkeiRdKz/jcSoynvS0qBw
         LOyzkHxBzED80VgsmD4GAUz91k2RrAc4YL6PH0FKk67pbfrC4/StF7G34N9of7NsLjJ0
         RV2Q==
X-Gm-Message-State: AGi0Pua3Kg7BuZV7BdU4/DRyrlilXAkIZpfJWpwdxcNTOlWh4T0oMd8E
        TuxkzpbQq2bHABY1jHj1qWI=
X-Google-Smtp-Source: APiQypKY3uxA/v45wSk1cgjs3sbXvBwxrlXGwNnvMwC1F7Ck0MgaAa/yKe7n9eQVC9rZjvsFRXNbSw==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr5818692wrn.364.1588365333338;
        Fri, 01 May 2020 13:35:33 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id s12sm1021981wmc.7.2020.05.01.13.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:35:32 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: venus: Add support for MSM8939
Date:   Fri,  1 May 2020 22:35:02 +0200
Message-Id: <20200501203505.144362-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501203505.144362-1-konradybcio@gmail.com>
References: <20200501203505.144362-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 194b10b987672..f3a15991ac763 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -405,6 +405,38 @@ static const struct venus_resources msm8916_res = {
 	.fwname = "qcom/venus-1.8/venus.mdt",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 244800, 133330000 },	/* 1080p @ 30 (decode only) */
+	{ 220800, 133330000 },  /* 720p @ 60 (decode only?) */
+	{ 108000, 133330000 },  /* 720p @ 30*/
+	{ 72000, 133330000 },  /* VGA @ 60 */
+	{ 36000, 133330000 },  /* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.max_load = 489600, /* 1080p @ 60 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mdt",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -567,6 +599,7 @@ static const struct venus_resources sc7180_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.26.1

