Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2C9352950
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbhDBKF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBKF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:27 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397B2C061797
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:21 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v4so4284134wrp.13
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=baSMqShP5W3Zw4aCNa6SmZHYgWuL3HOZVO7fD1Vf2tE=;
        b=IAJ0j9xoidGT7X+eYT9122hmZsO7UM3ShiMGETqd6mQe2MfrOP952P92lOr/Jdesk2
         2HEy2gx+UFDCbu2QgYFWoYG6vdM4OQLlq96Ru03udlVVYGS6M4up3QnoObnW6LCtY46+
         MYAhU2yLE052wIiPM6c5QP7mkd51BLzZF46mT/CzT/CwwUE8QKFaxXi8x4BubZwLUUAF
         fY9NN6FJOpm/rMW8Aud9NHJELT5VGBiXmoiBEFBjCI8Ajm3x5BVSOgZzAw6j7Xk/mcNz
         Daw8A/rSfrHf+hHD9lKVDebDuxiicPCbLaImJxK8M3P5edjl15aGaXCS2ocu/UcAkcjN
         KLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=baSMqShP5W3Zw4aCNa6SmZHYgWuL3HOZVO7fD1Vf2tE=;
        b=uCdrvTXKA4SNSBHvx/LQ4nzxyFSEqD9gFVUCZNr8yH0NEnVgJRKXUC62pB73E1ROxp
         27eOp5UmnlHR24WaEdNOpYGnAzY1rH3BXMiBEIEP/TWUpl2pcbMNEWTkTPfF7OHW+sUJ
         SAWA4PIiher9jxmwgpFl4UXmz77WrfbjYwMKMgCJ/qTlYwKWIu2xiSWWi7lHpT3nWw70
         1NtBUwAqucyZY95AdxqlcnAvAFrdi9X2+FLJqjhq/CzYpbJ4aJpaV1K1XTRvFVwiKVee
         eFbtzR4ZtBYhO4sUxp/MFR7YhrH7LL/PpKxS/NzdTt3EanltdR81gyBTdyTWWs4Pkt00
         fn1Q==
X-Gm-Message-State: AOAM5314o/dkTXfOYp3h0UQG0X344V/4ZlKeopk3Nqqrsp/gKuaqPhJW
        eGy/mz6nprCh39FpGr0wsxqy8tdW/YHUxZtM
X-Google-Smtp-Source: ABdhPJyGNHN8yKXmSCFPQl0rc7nkd0AGHq6GyCf9+6zcr6X53LAhUKACmSCHMHUS+lDITNIf8/Xhhw==
X-Received: by 2002:a5d:6cd2:: with SMTP id c18mr14497543wrc.330.1617357919949;
        Fri, 02 Apr 2021 03:05:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:19 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 03/25] media: venus: core: add sm8250 DT compatible and resource data
Date:   Fri,  2 Apr 2021 11:06:26 +0100
Message-Id: <20210402100648.1815854-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds an sm8250 compatible binding to the venus core.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 00d6883d3859..68358a9f3cda 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -627,12 +627,66 @@ static const struct venus_resources sc7180_res = {
 	.fwname = "qcom/venus-5.4/venus.mdt",
 };
 
+static const struct freq_tbl sm8250_freq_table[] = {
+	{ 0, 444000000 },
+	{ 0, 366000000 },
+	{ 0, 338000000 },
+	{ 0, 240000000 },
+};
+
+static const struct bw_tbl sm8250_bw_table_enc[] = {
+	{ 1944000, 1954000, 0, 3711000, 0 },	/* 3840x2160@60 */
+	{  972000,  996000, 0, 1905000, 0 },	/* 3840x2160@30 */
+	{  489600,  645000, 0,  977000, 0 },	/* 1920x1080@60 */
+	{  244800,  332000, 0,	498000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sm8250_bw_table_dec[] = {
+	{ 2073600, 2403000, 0, 4113000, 0 },	/* 4096x2160@60 */
+	{ 1036800, 1224000, 0, 2079000, 0 },	/* 4096x2160@30 */
+	{  489600,  812000, 0,  998000, 0 },	/* 1920x1080@60 */
+	{  244800,  416000, 0,  509000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct reg_val sm8250_reg_preset[] = {
+	{ 0xb0088, 0 },
+};
+
+static const struct venus_resources sm8250_res = {
+	.freq_tbl = sm8250_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sm8250_freq_table),
+	.reg_tbl = sm8250_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sm8250_reg_preset),
+	.bw_tbl_enc = sm8250_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sm8250_bw_table_enc),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.clks = {"core", "iface"},
+	.clks_num = 2,
+	.resets = { "bus", "core" },
+	.resets_num = 2,
+	.vcodec0_clks = { "vcodec0_core" },
+	.vcodec_clks_num = 1,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "mx", NULL },
+	.vcodec_num = 1,
+	.max_load = 7833600,
+	.hfi_version = HFI_VERSION_6XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/sm8250/venus.mdt",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.30.1

