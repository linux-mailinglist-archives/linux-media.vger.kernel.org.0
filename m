Return-Path: <linux-media+bounces-24407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9CA05C8C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF991669B4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D361FC7D0;
	Wed,  8 Jan 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J6MpeN4W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D971F9F47;
	Wed,  8 Jan 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342302; cv=none; b=kiuIPYjBSFiP5VjGvX56A6XlmMCwHXh/m+cSgg1G9/rUpNSFg3CA0vpsjce7xJbMu93B6EwT3F+FCAZvU3cPOYF3WcOE6eRzn9D58OgjPlGE/evP3STLBBWrpbo24dDT0x9E74hlMHhVferzliVc3O/dhNXIZeFGCniadJK/Yx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342302; c=relaxed/simple;
	bh=ajm5rj+2T/b44gRuT5exwVL0VBbnBIwLiK08vq1PsjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=APTqrcS7wKvES/PyceWA2iLU4TW2419QaBNziijUVnD8uXNAq4dEHv7qseyjYc2o7TIJiKWkM4c8AUQ3TykOrYYc/VeXozvkOB6K42RZMsGOWioSFSRQvjAJturlgeHW3wCwsm6pDLrehyk7afixnGFls8JQ8EJNUBpJTFBRm9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J6MpeN4W; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S79s008366;
	Wed, 8 Jan 2025 14:18:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7zKVl4ErJTsqC1L8EpP30Wrq/2TXXpHRlMyoxXlbIuI=; b=J6MpeN4Wx4L8S1vc
	dbQteZccsNBgU4hreVdOlI0aGn4eook9GTSHAqNkiddJrCD0s/A8kV0HxDrhDZ3S
	cRUJmX0u/OJLPQ7SXFgNby2VBSV07flu7y4jRXTf4/9mh61ttcbemG4tDYg+WgVZ
	pC+MSJyHZI4F7RooDjVr5b5YoN/iLvf+xGE2jEaei9wV8L3EjETzfZuFRC5VyRxg
	I1WRsAaX0VQY+XSarTsD3rzy7KftQKQNr1EHi9paqqFzdJx7eH2bFOILS6YHliuz
	Zvg7GwhNaoIbxDKYncphIcccA0RPjTsPqgfUBtHiDgkw86n+PevN2p+od0K5rN2F
	rJVifg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441m7t9md8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 252384004C;
	Wed,  8 Jan 2025 14:17:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AB172B0E18;
	Wed,  8 Jan 2025 14:16:14 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:13 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:07 +0100
Subject: [PATCH v2 4/8] media: stm32: csi: use ARRAY_SIZE to search D-PHY
 table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-4-05808ce50e41@foss.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Within stm32_csi_start, use ARRAY_SIZE loop in order to search
for the right setting.
Avoid useless init of lanes_ie / lanes_en.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 89fcd7d07904..3654f9895dbc 100644
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
2.34.1


