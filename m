Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFADA42203F
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhJEINP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbhJEINF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:13:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5426CC061753
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:11:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id x7so72933049edd.6
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reI8ABKa2KHEbOGggLGunLye63rXdf1D0uQhMOxGYnY=;
        b=pGU9xu0PqdSMZwD3kdcpIhPxDzI/x4iZSEkBZc04MY/NVKHQMyu/q2A6QXug9Vsyy9
         hUZUbHRUtnyQVAlcjx/lilVe5C2vkBbJZKyi0F2joKJjrOUkNz1tuythCuj0X3M+JYDE
         o9dlKU0oet0xwKEb42nfm+5vwYKpwlFWlXTVeSMWfXy/l4xM+oAt/18Y4O8k4B27QwKt
         JyMBJDxU6Rc+L+N3R7xv4JtYuxDq0BQ+UgLUP873X0yf3yVkTczN3dLYdC/fgETAtiFt
         c0Sm+MECHNf8SKImScVpHl4IZema/iGVuxtuz8z3fff2hWLVQje9dnDlnJBLvWQwMuri
         uV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reI8ABKa2KHEbOGggLGunLye63rXdf1D0uQhMOxGYnY=;
        b=NOsQs73rEGnEZNLjEDo2lmXCQ5yYjme/3xxXOAHJscerguVgehmcx6eTb20OURJ3aL
         AZT1ouzHBs/KEf2T0McG7ctN4YlS2CZ/8w/mtwckG69q4Xfy1arGceLnNQktdwQIxDTE
         C2OBG83Onr8v/WgmmrOQ5mglZ2K0LU73fvwwIsZE+1yqHDBYw7ynFFdT13Yx4MmSF/hD
         k6UoNWAHNSpq5Qj1jxRrCBrfUEZRUrYES6StYfk6PRAZE2Zi4KkY1/9L2zUl08zZcMvS
         Y7Myl9Bo5yG3Q6e2f8isrxGq2wSuZquandwD7i/NAy3ejTnE7D8RoUdIkj3jMSrcddqA
         VFCQ==
X-Gm-Message-State: AOAM533KN4VTG1g4qDSc0ZQYMniiq/DhcWeAS0hIlAfUIuXz4MtzfqX9
        M/seQmuMHjJJOsMyicP4sqTU6P1vxEABmA==
X-Google-Smtp-Source: ABdhPJwEcX5Ebgfd6f2zznhuqDPUF/IzTPbNME5jqOmROJTWaH2/zbtZIFMFPICGjBUaMacPEKuPKA==
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr23920971edk.90.1633421467352;
        Tue, 05 Oct 2021 01:11:07 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 2/7] media: venus: core: Add sc7280 DT compatible and resource data
Date:   Tue,  5 Oct 2021 11:10:43 +0300
Message-Id: <20211005081048.3095252-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Adds a sm7280 compatible binding to the venus core.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

Added Mansur's Signed-off-by
Sort alphabetically the new compatible string

 drivers/media/platform/qcom/venus/core.c | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e54c5d571dc..e5af4d74e504 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -734,12 +734,64 @@ static const struct venus_resources sm8250_res = {
 	.fwname = "qcom/vpu-1.0/venus.mdt",
 };
 
+static const struct freq_tbl sc7280_freq_table[] = {
+	{ 0, 460000000 },
+	{ 0, 424000000 },
+	{ 0, 335000000 },
+	{ 0, 240000000 },
+	{ 0, 133333333 },
+};
+
+static const struct bw_tbl sc7280_bw_table_enc[] = {
+	{ 1944000, 1896000, 0, 3657000, 0 },	/* 3840x2160@60 */
+	{  972000,  968000, 0, 1848000, 0 },	/* 3840x2160@30 */
+	{  489600,  618000, 0,  941000, 0 },	/* 1920x1080@60 */
+	{  244800,  318000, 0,	480000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sc7280_bw_table_dec[] = {
+	{ 2073600, 2128000, 0, 3831000, 0 },	/* 4096x2160@60 */
+	{ 1036800, 1085000, 0, 1937000, 0 },	/* 4096x2160@30 */
+	{  489600,  779000, 0,  998000, 0 },	/* 1920x1080@60 */
+	{  244800,  400000, 0,  509000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct reg_val sm7280_reg_preset[] = {
+	{ 0xb0088, 0 },
+};
+
+static const struct venus_resources sc7280_res = {
+	.freq_tbl = sc7280_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sc7280_freq_table),
+	.reg_tbl = sm7280_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sm7280_reg_preset),
+	.bw_tbl_enc = sc7280_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sc7280_bw_table_enc),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.clks = {"core", "bus", "iface"},
+	.clks_num = 3,
+	.vcodec0_clks = {"vcodec_core", "vcodec_bus"},
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu-2.0/venus.mbn",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
 	{ }
 };
-- 
2.25.1

