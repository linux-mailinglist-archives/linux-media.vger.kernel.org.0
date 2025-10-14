Return-Path: <linux-media+bounces-44464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82ABDAD12
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AA64355AC4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6673530BB8B;
	Tue, 14 Oct 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjtggNmN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E973019DF
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463669; cv=none; b=PQ0T1OdbmaMtNU1UYU564S6EZERUoGTkdwAnDfKj4JFF9orNVTim2va/YpSKvDVOwV/+nTfJAn9xfgSr8UHoh8WFcD5Vn13ajAW9tZNj1YG2DQLITXiGMt9iSJEqHNBPjnMNTGQYMz50Eq/UpY+ZNJRTpCIIuwsu5dCnYGO4i5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463669; c=relaxed/simple;
	bh=uQQfjzEYY3qGt32NpNMk407m0tDRx4Rzj5nlU1c3vNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bygrnu5A9FyR8UHdgQOKqB12lsqJMgejOT322oENiFMXfE8AAaac+5wiFEwjkn/y+iKwPChHZbMkyr0OGt3aSrSkYlvQSQAbdOdSsztBsoLBUlwXuiX/nZ/bBgTs1vxMiRiWwGfay84fB9KbLSZWjSuEbWIp4ea9BuyrXt8b3tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjtggNmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17128C4CEF9;
	Tue, 14 Oct 2025 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463668;
	bh=uQQfjzEYY3qGt32NpNMk407m0tDRx4Rzj5nlU1c3vNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjtggNmNyL2cPktJwNGterntdztLmvWUS/tfEFSdoEucUdHq0TZ+mnnZ7skVg/boi
	 FGdobhYq7WMxpdyMlX7QL5PDOI5CrRIj2kGdefYypKpLYP6Gcid3KHH0rJeLmcEdYt
	 C+K6IfTiXA6cx/i9hoKX2kxVteYA2b+790NkOZ6tk9zpM2H6QWvOWGxtsCEGOQimOA
	 Jk+uWUunH3ZRxUJsI7M9xu7IdR2AWcjI32izgH5jLjiRN7PLwnvI1pN52tdWY+5FNl
	 JTBtgeMAu9el3lfgkRHJfGndqhX4XOqdewA0k7qHRVDsAG7nuAKf2q5dMhZGVnyLX2
	 suDyvI807W7wA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 17/25] media: i2c: ov01a10: Remove struct ov01a10_reg_list
Date: Tue, 14 Oct 2025 19:40:25 +0200
Message-ID: <20251014174033.20534-18-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the conversion to the CCI register access helpers, struct
ov01a10_reg_list is only used inside struct ov01a10_link_freq_config.

Simplify things by embedding the ov01a10_reg_list members directly into
struct ov01a10_link_freq_config.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index e8ccb295fdc9..805ed42d86f9 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -98,13 +98,9 @@
 #define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
 #define OV01A10_BAYER_PATTERN_SIZE	2 /* 2x2 */
 
-struct ov01a10_reg_list {
-	u32 num_of_regs;
-	const struct reg_sequence *regs;
-};
-
 struct ov01a10_link_freq_config {
-	const struct ov01a10_reg_list reg_list;
+	const struct reg_sequence *regs;
+	int regs_len;
 };
 
 static const struct reg_sequence mipi_data_rate_720mbps[] = {
@@ -238,10 +234,8 @@ static const s64 link_freq_menu_items[] = {
 
 static const struct ov01a10_link_freq_config link_freq_configs[] = {
 	{
-		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_data_rate_720mbps),
-			.regs = mipi_data_rate_720mbps,
-		}
+		.regs = mipi_data_rate_720mbps,
+		.regs_len = ARRAY_SIZE(mipi_data_rate_720mbps),
 	},
 };
 
@@ -551,12 +545,12 @@ static int ov01a10_set_mode(struct ov01a10 *ov01a10)
 
 static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 {
-	const struct ov01a10_reg_list *reg_list;
+	const struct ov01a10_link_freq_config *freq_cfg;
 	int ret;
 
-	reg_list = &link_freq_configs[ov01a10->link_freq_index].reg_list;
-	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
-				     reg_list->num_of_regs);
+	freq_cfg = &link_freq_configs[ov01a10->link_freq_index];
+	ret = regmap_multi_reg_write(ov01a10->regmap, freq_cfg->regs,
+				     freq_cfg->regs_len);
 	if (ret) {
 		dev_err(ov01a10->dev, "failed to set plls\n");
 		return ret;
-- 
2.51.0


