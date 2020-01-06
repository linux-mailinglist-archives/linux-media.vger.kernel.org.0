Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E507B131559
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 16:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgAFPun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 10:50:43 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46505 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbgAFPuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 10:50:25 -0500
Received: by mail-lj1-f194.google.com with SMTP id m26so48937717ljc.13
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 07:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BGNJV+T/A2yMDmvoIRAZ3Ql5cKw3jiqTHheiep1uASM=;
        b=SbKDbi4H0AXMk/VMgh+kHK4NZuJBIxX334QO7e/+w9pYxtARgYqif5gu74r8M+ISLK
         ryQN7+WuCIkeXAD9NstbEiT8jy0Xb/FeMzBVWM1Lgxs8Wyi5XJXnHVallVbGWhnYHFDw
         bqiySDlFIXeP1Zdr1KQqZditUVDtJC7W1jWlX1/toY+b/e6PPlBMRVS85DaFgcz1rrV5
         FYCeGBYbR8JLkZSfPD/X0Uqau5EQTncANGu16dkdsAyYGzTkVpHOxlQhRxsk4E1jXp/W
         dpTrfwRUskQ92Hft25+i4Gneimxj4Yl31AiaY1L4ammBTkJEXUebfOWuhqHET9kHuuej
         l56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BGNJV+T/A2yMDmvoIRAZ3Ql5cKw3jiqTHheiep1uASM=;
        b=RPhvLJcr3lXndAbvw8MsiDQo7c3UoAdiRMaGR6eZC4uDVxFS08lvjvFXuZkm2yB6iU
         KCFPgkDAjflNIQM0exglUzMCph5fY5V8clahpM2Mt9vRi24T+5iAYSxTapoDmWDpokCJ
         ejlx+l9dcC2HIJ/VZRg1D6F7O2ekM05WElpdmoyaOpGoU5amcw9wKHdUVES7BWRVcBAe
         WPYEnHauIby0nYtGPKXBzAbewx77gBB9v+rgrDKhqF7l8paoCWZy8Zb9rRGy2ajm+fz4
         d4AL/+9+a2NQQCOiuH/X5Xxv9vIgRqvbhli/JY0lw/snonltmILvH4msat487sSIcwvu
         yzbg==
X-Gm-Message-State: APjAAAXJQXXfiZumk1tfia/TEtwojc7ta8/0zrE09MlmN8Kxo4VjUyxG
        6/M+k6jgSOzVt+whBnm70iQtcQ==
X-Google-Smtp-Source: APXvYqx8EiFqr9oVEr2tK/TUXU6n3zuupSQlIhSG6KWVH+yTLTXk/9UU9jgciAoDRQg+erUcyhFJzg==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr62497740ljf.12.1578325822739;
        Mon, 06 Jan 2020 07:50:22 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:22 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 10/12] venus: core: add sdm845-v2 DT compatible and resource struct
Date:   Mon,  6 Jan 2020 17:49:27 +0200
Message-Id: <20200106154929.4331-11-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to use dynamic video codec assignment add a new sdm845-v2
DT compatible and new venus_resource structure to cover the binding
where all pmdomains and clocks are under the venus_core control.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a20ab00a8068..c7525d951e92 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -495,10 +495,37 @@ static const struct venus_resources sdm845_res = {
 	.fwname = "qcom/venus-5.2/venus.mdt",
 };
 
+static const struct venus_resources sdm845_res_v2 = {
+	.freq_tbl = sdm845_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
+	.bw_tbl_enc = sdm845_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
+	.bw_tbl_dec = sdm845_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
+	.codec_freq_data = sdm845_codec_freq_data,
+	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
+	.clks = {"core", "iface", "bus" },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec1_clks = { "vcodec1_core", "vcodec1_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.vcodec_num = 2,
+	.max_load = 3110400,	/* 4096x2160@90 */
+	.hfi_version = HFI_VERSION_4XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-5.2/venus.mdt",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
+	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.17.1

