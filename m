Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2580127992A
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 14:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729443AbgIZMyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 08:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbgIZMyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 08:54:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F2FC0613CE;
        Sat, 26 Sep 2020 05:54:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d4so1920374wmd.5;
        Sat, 26 Sep 2020 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kWsUesnEsCGfJPNAUt25q34Ftzxt5X985lckcjMGnVU=;
        b=MC2VzQw4GL7E8Vh053dNjTO07PsCvXGZoOidFjd0kaE79PY668Bgj3A6a/EorKsa3x
         FfcKTltkx5LqY4gn0BMkYf2NDZJ8Bkxsm9K8MtkNNrWpjMszjYYzKxauXtxYc0P7ciAE
         UULf5xm9gNMJrwqQKuCr4lS9Qa/KZnhVWnAfZ2tZcCKv0/v4F4GQwd2Lc44r04OWrTtL
         +9t7K1IAlokVl3shLCKocH6iEGRJmXhaSNsyN2XpsBpb+ehpLH+M7lVMOStKp1UAQC6s
         iqEVB+j9BHCSRfWKHl1WqjVeSDZmLuzUWgVinznkNCtRjKJ2e+JPQ3jWbL9EOrAQ1Aih
         +2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kWsUesnEsCGfJPNAUt25q34Ftzxt5X985lckcjMGnVU=;
        b=MLVPliOjek7J1scOaUGTILQwqfO4bEE+UmKJuqAdihQMa6jc4gOjivh4xjdFIIaRDo
         fTqZzBy2oRN5hJuR9c6ir5LB6WNU6sNUtPE6TzZE6KwsA+FDGys5DG+xuC56WbSx1iuR
         TEjBqPZgdA0Rz3sNcVHE0Y9TprweUwfohzqfUlGlBeEO8hC6TBwWV1sQC4MRuMFW/Zam
         9tMg5G0D+Zip9KntAa5/u428duh7869d1XfiKVo/yheaRyKHVij3nSYjhkjicuzQ7hH2
         broVCqnEytqZF0v8pYDdqx0CWkB68dXiNFkykxC/BbgFvYibJPwI7H98SaHqjcZi7vKP
         DjbQ==
X-Gm-Message-State: AOAM532fNRIYIcTszcCh6lfkaLmObvHgO/Nc7EzVSuQWVotuZqp+gDwU
        ubZhXMT4vh5yWeiyvZMjcoM=
X-Google-Smtp-Source: ABdhPJzATCDEhmUU5e/s1/sTBD7fxVLyLOo2X7sVbsIIopmNfwLAbTjh5qJ+tya171ghAu8Hxlb1Eg==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr2438576wmd.7.1601124863912;
        Sat, 26 Sep 2020 05:54:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 70sm2617707wmb.41.2020.09.26.05.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:54:23 -0700 (PDT)
From:   kholk11@gmail.com
To:     stanimir.varbanov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-media@vger.kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: venus: core: Add sdm660 DT compatible and resource struct
Date:   Sat, 26 Sep 2020 14:54:11 +0200
Message-Id: <20200926125412.13024-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125412.13024-1-kholk11@gmail.com>
References: <20200926125412.13024-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the SDM660 DT compatible and its resource structure, also
including support for the Venus pmdomains, in order to support
the Venus block in SDM630, SDM636, SDM660 and SDA variants.

This SoC features Venus 4.4 (HFI3XX), with one vcodec used for
both encoding and decoding, switched on through two GDSCs.
The core clock for this Venus chip is powered by the RPM VDD_CX
power domain.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6103aaf43987..c5fccafcf656 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -539,6 +539,73 @@ static const struct venus_resources sdm845_res_v2 = {
 	.fwname = "qcom/venus-5.2/venus.mdt",
 };
 
+static const struct freq_tbl sdm660_freq_table[] = {
+	{ 0, 518400000 },
+	{ 0, 441600000 },
+	{ 0, 404000000 },
+	{ 0, 320000000 },
+	{ 0, 269330000 },
+	{ 0, 133330000 },
+};
+
+static const struct reg_val sdm660_reg_preset[] = {
+	{ 0x80010, 0x001f001f },
+	{ 0x80018, 0x00000156 },
+	{ 0x8001C, 0x00000156 },
+};
+
+static const struct bw_tbl sdm660_bw_table_enc[] = {
+	{  979200,  1044000, 0, 2446336, 0 },	/* 4k UHD @ 30 */
+	{  864000,   887000, 0, 2108416, 0 },	/* 720p @ 240 */
+	{  489600,   666000, 0, 1207296, 0 },	/* 1080p @ 60 */
+	{  432000,   578000, 0, 1058816, 0 },	/* 720p @ 120 */
+	{  244800,   346000, 0,  616448, 0 },	/* 1080p @ 30 */
+	{  216000,   293000, 0,  534528, 0 },	/* 720p @ 60 */
+	{  108000,   151000, 0,  271360, 0 },	/* 720p @ 30 */
+};
+
+static const struct bw_tbl sdm660_bw_table_dec[] = {
+	{  979200,  2365000, 0, 1892000, 0 },	/* 4k UHD @ 30 */
+	{  864000,  1978000, 0, 1554000, 0 },	/* 720p @ 240 */
+	{  489600,  1133000, 0,  895000, 0 },	/* 1080p @ 60 */
+	{  432000,   994000, 0,  781000, 0 },	/* 720p @ 120 */
+	{  244800,   580000, 0,  460000, 0 },	/* 1080p @ 30 */
+	{  216000,   501000, 0,  301000, 0 },	/* 720p @ 60 */
+	{  108000,   255000, 0,  202000, 0 },	/* 720p @ 30 */
+};
+
+static const struct venus_resources sdm660_res = {
+	.freq_tbl = sdm660_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sdm660_freq_table),
+	.reg_tbl = sdm660_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sdm660_reg_preset),
+	.bw_tbl_enc = sdm660_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sdm660_bw_table_enc),
+	.bw_tbl_dec = sdm660_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sdm660_bw_table_dec),
+	.codec_freq_data = sdm845_codec_freq_data,
+	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
+	.clks = {"core", "iface", "bus_throttle", "bus" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core" },
+	.vcodec_clks_num = 1,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.vcodec_num = 1,
+	.max_load = 1036800,
+	.hfi_version = HFI_VERSION_3XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x79000000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x28000000,
+	.dma_mask = 0xd9000000 - 1,
+	.fwname = "qcom/venus-4.4/venus.mdt",
+};
+
 static const struct freq_tbl sc7180_freq_table[] = {
 	{  0, 500000000 },
 	{  0, 434000000 },
@@ -587,6 +654,7 @@ static const struct venus_resources sc7180_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-- 
2.28.0

