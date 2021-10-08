Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D7E4267A2
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239837AbhJHKXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239741AbhJHKXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:23:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F99C061755;
        Fri,  8 Oct 2021 03:21:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id CC1B61F4575E
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, stanimir.varbanov@linaro.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] media: venus: core: Add sdm660 DT compatible and resource struct
Date:   Fri,  8 Oct 2021 12:21:18 +0200
Message-Id: <20211008102119.268869-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008102119.268869-1-angelogioacchino.delregno@collabora.com>
References: <20211008102119.268869-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the SDM660 DT compatible and its resource structure in order
to support the Venus IP in SDM630, SDM636, SDM660 and SDA variants.

This SoC features Venus 4.4 (HFI3XX) with only one subcore, used
for both encoding and decoding, and switched on with one main and
one subcore dedicated GDSC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/qcom/venus/core.c | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e54c5d571dc..97574f4a1084 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -565,6 +565,69 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mdt",
 };
 
+static const struct freq_tbl sdm660_freq_table[] = {
+	{ 979200, 518400000 },
+	{ 489600, 441600000 },
+	{ 432000, 404000000 },
+	{ 244800, 320000000 },
+	{ 216000, 269330000 },
+	{ 108000, 133330000 },
+};
+
+static const struct reg_val sdm660_reg_preset[] = {
+	{ 0x80010, 0x001f001f },
+	{ 0x80018, 0x00000156 },
+	{ 0x8001c, 0x00000156 },
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
+	.clks = {"core", "iface", "bus", "bus_throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core" },
+	.vcodec1_clks = { "vcodec0_core" },
+	.vcodec_clks_num = 1,
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
 static const struct freq_tbl sdm845_freq_table[] = {
 	{ 3110400, 533000000 },	/* 4096x2160@90 */
 	{ 2073600, 444000000 },	/* 4096x2160@60 */
@@ -737,6 +800,7 @@ static const struct venus_resources sm8250_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-- 
2.33.0

