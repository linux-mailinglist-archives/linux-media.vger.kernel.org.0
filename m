Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF83F321C16
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhBVQDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhBVQDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:03 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D678C061794
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:41 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d11so267974wrj.7
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ErKCae4Tp8qdcGM2iealLG5f+8x/qdHX40aRXZSrhDs=;
        b=agZmFAxaUYJLjp0pNyLoC42AwJeSI8xBbH/bZo9MP9XWgmW/gojX1BvFvIs+9BgjVI
         Q4bDkLooTyhSK2DWI8HElgK20bvCv9D+lh2ZT0aZHPv66f8uCZ861aFa/ifXCY/D0+rf
         08Lz5DKwG0HjiIw8fbwlta0oby8x8JkQ9QHho0CYSgZaPPrpF8GaObivPRp4cJS4o0fb
         A3wrQ4EJUFO3HbmqAfwyCsAkuVG2rGgZPm7F7I3jiV5W362o8iZKoKlO50P4O0JqCe6o
         9c7SUvYWkRDFTpt6h/s6iXUJtkaI0dNCnzjWAeMNg5wZmLFP07sUio4fbV3DFIfpnIPU
         T6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ErKCae4Tp8qdcGM2iealLG5f+8x/qdHX40aRXZSrhDs=;
        b=RdnX6sBktQk5vxhAMWZVhka4FuOBdq8VspCLcq2ky1KlhTjXltGo/CTcwC8ppFXAmw
         h6khDYfx6Ww2EOO4hSi4FGrVkX1VkJoNPPOVnCYuXpSAJWlpF8IlEZDbP0wYTEHD5vg4
         jKazcf5T5EF/F2LTANxp9oqwUusW4bsm0q3eJDcqzelV/9iY6nIqh6JOfKdd+Mo/Xuqq
         1vW1oeGsDRhDS/VnVbGqNzcjGIXg9XU+tWRnuMUSXPxNjlhYUdSG0zrF9pJa4OOAynXJ
         xKn82HJbIn4HcToqOhV4Wam9bDEDSHNuYS5Vq5D+geSJRnxAJ+WTnR9F25Fo8YXYMbSo
         /iDA==
X-Gm-Message-State: AOAM532oIEGCuz32ueC3GM4kBpRmql3Bv1d7Z9vk0DSvWIp2HUSoJWUA
        ruiGjRt2Agvjk4MjSrF1vDBhyg==
X-Google-Smtp-Source: ABdhPJzluM/VsGE6ZlwMuRiuGTVJBnqRNCGA1+eTQETbDTDypELHXlCIK3TecqnwWSfu7YwY6qUR8A==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr22030953wrm.355.1614009699972;
        Mon, 22 Feb 2021 08:01:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:39 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 03/25] media: venus: core: add sm8250 DT compatible and resource data
Date:   Mon, 22 Feb 2021 16:02:38 +0000
Message-Id: <20210222160300.1811121-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
---
 drivers/media/platform/qcom/venus/core.c | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 61a245b4db68..67676f1632ab 100644
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
2.29.2

