Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8289124842
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfLRNYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:24:34 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34639 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfLRNYR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:24:17 -0500
Received: by mail-lj1-f194.google.com with SMTP id k1so1477525ljg.1
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 05:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BGNJV+T/A2yMDmvoIRAZ3Ql5cKw3jiqTHheiep1uASM=;
        b=J38NAh8cLjcopCFZceQKVt6FktIHUfe2ZgUof7WZnrMfuI60kCOnjz3yElmRclfKZG
         vZgYh6wiz+yZ9ftGZJ7D8xag4F0Al6nVr7ypbuG2BvMkAZhayhLv2wozZDTY2CLXN+FR
         xLduJlNN93xj8AlmVAc+xMaPFNtnSUBmNHX3Rv1+ah+QFSfe42AG41hV8leAWSoBpbQf
         1ZWhDgy412o8AOIDXNlQkpHsLa9CgvIM9YVjTieApipdS0+fimKwzfyNS6vn6hgCaJHx
         AwXXjctUO7QuMh91fgZYWsSgsvju4nD+ReOdZ9iNjaud/vuVzchkpuDY9sz6dh4HveeR
         eMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BGNJV+T/A2yMDmvoIRAZ3Ql5cKw3jiqTHheiep1uASM=;
        b=bCVcLmitzAUAnBkAwYt4a0IW/UlOSxrG0+op1Jx4BmlrVIzs1aU09J5WAf7NM3Gwqz
         C5bhxgpr83Ct8WjiRvLrgnJRG0GKGWtISgzhfhKsuG2H07bNw/oR7aEOc0EZtorcQNcz
         aJWEcBIPJKqxWpwL+RmgHvEmuyxF1CaIqYPPw9M0RhYTQ6jTUm7yl7teM8qXmxJqHQL/
         T9nCYzYw+Hu+vbdJ1t576ljSl7e4X8ID6g+EtdY1eZvnO42r25Pi9BC0ixc0zxMoXX4k
         CinKtxAc23Nli15cXw9vl98YptWhHziZKUD3VoeXqXFEoQ6s9KnRYvI9f6k63BPn5j8g
         gK+Q==
X-Gm-Message-State: APjAAAVZmJZeufXS7gzcO6wxrXXPrqYAT4FOU97AOEfxNa98YNhdbXGC
        IYpxr+vzkqGpF/u0hGvgxP8VBw==
X-Google-Smtp-Source: APXvYqxR8dG8Oow0sqsrHTiVn8+zDqVkI5iMEQZEi+GKC5GveHHgpoiuRnrlzyVJDyn3ZZvzzQihUw==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr1613563ljg.126.1576675455853;
        Wed, 18 Dec 2019 05:24:15 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:15 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 10/12] venus: core: add sdm845-v2 DT compatible and resource struct
Date:   Wed, 18 Dec 2019 15:22:49 +0200
Message-Id: <20191218132251.24161-11-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
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

