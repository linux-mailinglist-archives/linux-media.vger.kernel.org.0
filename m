Return-Path: <linux-media+bounces-40063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DEB29844
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87A912018AF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D80A26738C;
	Mon, 18 Aug 2025 04:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bAHeCtce"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5EE265CA4
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491849; cv=none; b=n17qlakEvoHbeUVFr1Xp5s7ELM9SvJdxhAmpOxR2eUgqrtJY8Rt/8b/BbzOm7T5MaLGoAbJIiJ8ASDXyMTdW9SZ/4Jb3JCwOo+NI8bBtl/jYMbpIpyT+9wc2X/aO3KSux0DO/GVXogMzptlq7VO/mG2QK0qZKcpwxzXOHcKO/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491849; c=relaxed/simple;
	bh=nI7T8dEbuydo3P7kHObkEw/Kb5zkf07VtRHdkDEp4Bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cHXzrZUdhR8T6KQp68ujvFDFpfE4lukmJf+8A9JKvOjGL7/LM1tq4P7z4QS7Kl4g2AP+6ANZBgCvmlqHLAVVxzHleAgB/225aeN9uDvXoM1qT8ckd5Hr9foC1gGXi30Xt3+3fl9tl3QV8SnYodiRX2OP7FfDf+b86youTGqKwFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bAHeCtce; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818043725epoutp04109a4b812324c766105f440f17f967cb~cwog42b1d2679726797epoutp042
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818043725epoutp04109a4b812324c766105f440f17f967cb~cwog42b1d2679726797epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491845;
	bh=ZQkuArzUBJ5lpcVufyrUHpPfpl5KDWV5jQPGPwpyaM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAHeCtcePAv3CBWIaO6xtw+sQZqxVbw6kdogRL8dOFSNpbXeHI3ii6OUrVnWo/NHQ
	 Tl6EBCB1gJUeWEbdy3MuXXM3l4UFhOc4G1kSTRy7BDF/GNesIPThWvmZnGS7mk5H3J
	 u7D4JC2DrC05Jy/ZHJU+Dsqj3e8vTb8s1qDjhQjw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043724epcas5p4db958c5a752ae5478793a9feaa79016a~cwogS1iFM0892908929epcas5p4z;
	Mon, 18 Aug 2025 04:37:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c50LW3f53z3hhTB; Mon, 18 Aug
	2025 04:37:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4~bp3cJoraC0184301843epcas5p1q;
	Thu, 14 Aug 2025 14:10:09 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141005epsmtip2d1643f4a1ca80c05e99ef3861a193ff7~bp3YUwBVU1817818178epsmtip2j;
	Thu, 14 Aug 2025 14:10:05 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in
 CAM_CSI block
Date: Thu, 14 Aug 2025 19:39:33 +0530
Message-ID: <20250814140943.22531-3-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>

Add clock id for PCLK and PLL. These clock id will be used for
operation of CSI driver. PCLK is AXI2APB clock used for register
access. PLL clock is main clock source for CAM_CSI block.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/clk/samsung/clk-fsd.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 594931334574..4124d65e3d18 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -89,7 +89,7 @@
 #define CLKS_NR_FSYS1		(PCIE_LINK1_IPCLKPORT_SLV_ACLK + 1)
 #define CLKS_NR_IMEM		(IMEM_TMU_GT_IPCLKPORT_I_CLK_TS + 1)
 #define CLKS_NR_MFC		(MFC_MFC_IPCLKPORT_ACLK + 1)
-#define CLKS_NR_CAM_CSI		(CAM_CSI2_3_IPCLKPORT_I_ACLK + 1)
+#define CLKS_NR_CAM_CSI		(CAM_CSI2_3_IPCLKPORT_I_PCLK + 1)
 
 static const unsigned long cmu_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED0,
@@ -1646,7 +1646,7 @@ static const struct samsung_pll_rate_table pll_cam_csi_rate_table[] __initconst
 };
 
 static const struct samsung_pll_clock cam_csi_pll_clks[] __initconst = {
-	PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
+	PLL(pll_142xx, CAM_CSI_PLL, "fout_pll_cam_csi", "fin_pll",
 	    PLL_LOCKTIME_PLL_CAM_CSI, PLL_CON0_PLL_CAM_CSI, pll_cam_csi_rate_table),
 };
 
@@ -1682,51 +1682,51 @@ static const struct samsung_gate_clock cam_csi_gate_clks[] __initconst = {
 	     GAT_CAM_CSI_BUS_D_CAM_CSI_IPCLKPORT_CLK__SYSTEM__NOC, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_0_IPCLKPORT_I_ACLK, "cam_csi0_0_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_0_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_0_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_0_IPCLKPORT_I_PCLK, "cam_csi0_0_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_1_IPCLKPORT_I_ACLK, "cam_csi0_1_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_1_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_1_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_1_IPCLKPORT_I_PCLK, "cam_csi0_1_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_2_IPCLKPORT_I_ACLK, "cam_csi0_2_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_2_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_2_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_2_IPCLKPORT_I_PCLK, "cam_csi0_2_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_3_IPCLKPORT_I_ACLK, "cam_csi0_3_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_3_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_3_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_3_IPCLKPORT_I_PCLK, "cam_csi0_3_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_0_IPCLKPORT_I_ACLK, "cam_csi1_0_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_0_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_0_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_0_IPCLKPORT_I_PCLK, "cam_csi1_0_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_1_IPCLKPORT_I_ACLK, "cam_csi1_1_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_1_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_1_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_1_IPCLKPORT_I_PCLK, "cam_csi1_1_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_2_IPCLKPORT_I_ACLK, "cam_csi1_2_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_2_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_2_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_2_IPCLKPORT_I_PCLK, "cam_csi1_2_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_3_IPCLKPORT_I_ACLK, "cam_csi1_3_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_3_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_3_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_3_IPCLKPORT_I_PCLK, "cam_csi1_3_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_0_IPCLKPORT_I_ACLK, "cam_csi2_0_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_0_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_0_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_0_IPCLKPORT_I_PCLK, "cam_csi2_0_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_1_IPCLKPORT_I_ACLK, "cam_csi2_1_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_1_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_1_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_1_IPCLKPORT_I_PCLK, "cam_csi2_1_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_2_IPCLKPORT_I_ACLK, "cam_csi2_2_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_2_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_2_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_2_IPCLKPORT_I_PCLK, "cam_csi2_2_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_3_IPCLKPORT_I_ACLK, "cam_csi2_3_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_3_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_3_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_3_IPCLKPORT_I_PCLK, "cam_csi2_3_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "cam_ns_brdg_cam_csi_ipclkport_clk__psoc_cam_csi__clk_cam_csi_d",
 	     "dout_cam_csi_busd",
-- 
2.49.0


