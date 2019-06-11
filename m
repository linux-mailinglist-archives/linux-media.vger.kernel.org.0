Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2353C3C4
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 08:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403957AbfFKGF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 02:05:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45374 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403883AbfFKGF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 02:05:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6357E6087F; Tue, 11 Jun 2019 06:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560233157;
        bh=D/EH2y0gVBeS1ubTxUjOUlf2/jF+uHINM9b6RRuVqlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TtKXi7PVcuL8HFLNJJe6+MNBGXHK8LbYcvqJoDUmg2jEQi+lbq3G28PNB74cR7+y3
         AoewhgOfWcopQvGJigzyll2F3CQNwNH2nqM6hhrtfkkXiV3lkKl6oeLBL4O80Okqwr
         TgVcdSk602U0DPYj4UP3vuuENfm8KWdu4vOdjzc8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E76D5605A5;
        Tue, 11 Jun 2019 06:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560233156;
        bh=D/EH2y0gVBeS1ubTxUjOUlf2/jF+uHINM9b6RRuVqlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mJI/5WKrHlWwHs+KnLW08nWVqyrPxV0O02PX+vJ3xWpsa+Hr/g1MadLeGtxmYyyeN
         bj97l/O68vg3K4ZCnRypC0BOT26ZFDzXPPf8AdnwIJ6wuvD03DgAEUwTSjQtuBR3zA
         luSO8t80CZZ5NBlosG/OyNroomeJBFcIhT9szbiQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E76D5605A5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 1/5] media: venus: Add codec data table
Date:   Tue, 11 Jun 2019 11:35:26 +0530
Message-Id: <1560233130-27264-2-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add vpp cycles for for different types of codec
It indicates the cycles required by video hardware
to process each macroblock.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 13 +++++++++++++
 drivers/media/platform/qcom/venus/core.h | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7393667..43eb446 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -473,9 +473,22 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
+static struct codec_data sdm845_codec_data[] =  {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
+	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
+};
+
 static const struct venus_resources sdm845_res = {
 	.freq_tbl = sdm845_freq_table,
 	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
+	.codec_data = sdm845_codec_data,
+	.codec_data_size = ARRAY_SIZE(sdm845_codec_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.max_load = 2563200,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7a3feb5..b1a9b43 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -35,12 +35,20 @@ struct reg_val {
 	u32 value;
 };
 
+struct codec_data {
+u32 pixfmt;
+u32 session_type;
+int vpp_cycles;
+};
+
 struct venus_resources {
 	u64 dma_mask;
 	const struct freq_tbl *freq_tbl;
 	unsigned int freq_tbl_size;
 	const struct reg_val *reg_tbl;
 	unsigned int reg_tbl_size;
+	const struct codec_data *codec_data;
+	unsigned int codec_data_size;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
 	enum hfi_version hfi_version;
@@ -216,6 +224,12 @@ struct venus_buffer {
 	struct list_head ref_list;
 };
 
+struct clock_data {
+	u32 core_id;
+	unsigned long freq;
+	struct codec_data *codec_data;
+};
+
 #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
 
 /**
@@ -275,6 +289,7 @@ struct venus_inst {
 	struct list_head list;
 	struct mutex lock;
 	struct venus_core *core;
+	struct clock_data clk_data;
 	struct list_head dpbbufs;
 	struct list_head internalbufs;
 	struct list_head registeredbufs;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

