Return-Path: <linux-media+bounces-31759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0331AAA5D7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91B21884AD5
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBCA319416;
	Mon,  5 May 2025 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+PVU3wO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117531940A;
	Mon,  5 May 2025 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484278; cv=none; b=U+1KPIkWtaKJY7hx+ggvWeD4zhQOt18+9jACQCPqmE1yF+Czd0oLAmEWUIccnlUp33ywf57rYylOiB2tP41YKbz5L1Gt89C+lz9iR3CZ+6vjHAJg+/5JQunhsSK+0mHo7MmLzicCwVWylJ7u1KFFWY0sP97vL7hTuxui5kNScko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484278; c=relaxed/simple;
	bh=g2l8e60TVojOygbW8eyFICSVVjr2ivWSE2C2kKPrgXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nVictS9q7NzACs6QIgzzneGW56wrWtPjZ6kJ3xh9AZDTXgm70wPKro+yxnBpfIMu4zhpW1GXiVqCYVVkrvykfDIVpgJQUm2x9i9886EAojaDhttCQivq5ye9hs2RQnGpnsNaIZGS/B1h6oeR/VEtGJI7BSOWkBv/drZNIoG+BhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+PVU3wO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D396FC4CEF1;
	Mon,  5 May 2025 22:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484278;
	bh=g2l8e60TVojOygbW8eyFICSVVjr2ivWSE2C2kKPrgXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+PVU3wOOnnG2vNPqWGD826DoZkO5grGoRuoYr6IfWAZ9giht0tk5t82IKBFLUHcS
	 TQ+uiJEIO50u73K2MhmubaQ0OgugMnl97RHhaZLi6DmlqGI8k1TuyjVEJEwuRs6n9B
	 4tY1T9PjSw5Q8zE3F4g8G4EsNp/v3tue1KVs68SxOk4NCaoCaO73ghTLaKQYBqhL2l
	 VNBt0bUj1q7RTU/tSI6kwtM0FFIbhdsOpc5OJSdjR75OGlNorwWPqxFi7XBUqX/3R7
	 c8uoRsqXIAU/il6Oqm96UMnrpcgkw4DGseMcAjSdL7qfEbqW9ccFk7wnIhX4ApvMjm
	 MI5735vo4r7XA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 430/642] media: stm32: csi: use ARRAY_SIZE to search D-PHY table
Date: Mon,  5 May 2025 18:10:46 -0400
Message-Id: <20250505221419.2672473-430-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit a3a91b6e62be24c5df47a800c367504cb41e502b ]

Within stm32_csi_start, use ARRAY_SIZE loop in order to search
for the right setting.
Avoid useless init of lanes_ie / lanes_en.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 48941aae8c9b8..a4f8db608cedd 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -325,7 +325,6 @@ static const struct stm32_csi_mbps_phy_reg snps_stm32mp25[] = {
 	{ .mbps = 2400, .hsfreqrange = 0x47,	.osc_freq_target = 442 },
 	{ .mbps = 2450, .hsfreqrange = 0x48,	.osc_freq_target = 451 },
 	{ .mbps = 2500, .hsfreqrange = 0x49,	.osc_freq_target = 460 },
-	{ /* sentinel */ }
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -444,13 +443,13 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	const struct stm32_csi_mbps_phy_reg *phy_regs;
+	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
 	unsigned long phy_clk_frate;
+	u32 lanes_ie, lanes_en;
 	unsigned int mbps;
-	u32 lanes_ie = 0;
-	u32 lanes_en = 0;
+	unsigned int i;
 	s64 link_freq;
 	int ret;
 	u32 ccfr;
@@ -474,11 +473,14 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	mbps = div_s64(link_freq, 500000);
 	dev_dbg(csidev->dev, "Computed Mbps: %u\n", mbps);
 
-	for (phy_regs = snps_stm32mp25; phy_regs->mbps != 0; phy_regs++)
-		if (phy_regs->mbps >= mbps)
+	for (i = 0; i < ARRAY_SIZE(snps_stm32mp25); i++) {
+		if (snps_stm32mp25[i].mbps >= mbps) {
+			phy_regs = &snps_stm32mp25[i];
 			break;
+		}
+	}
 
-	if (!phy_regs->mbps) {
+	if (!phy_regs) {
 		dev_err(csidev->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
@@ -488,8 +490,8 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 		phy_regs->osc_freq_target);
 
 	/* Prepare lanes related configuration bits */
-	lanes_ie |= STM32_CSI_SR1_DL0_ERRORS;
-	lanes_en |= STM32_CSI_PCR_DL0EN;
+	lanes_ie = STM32_CSI_SR1_DL0_ERRORS;
+	lanes_en = STM32_CSI_PCR_DL0EN;
 	if (csidev->num_lanes == 2) {
 		lanes_ie |= STM32_CSI_SR1_DL1_ERRORS;
 		lanes_en |= STM32_CSI_PCR_DL1EN;
-- 
2.39.5


