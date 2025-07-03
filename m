Return-Path: <linux-media+bounces-36696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D3AF7EB5
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 19:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B83A54A03D1
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 17:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F02E2EFD81;
	Thu,  3 Jul 2025 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bGuCYHyD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667C28DB7B;
	Thu,  3 Jul 2025 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563259; cv=none; b=fkbTYze0Tbs8kQDxyhAtfWNEZtGwrCZvpwfxa10FC3bJ0zB6dd3Gsy/wtHvrNovjEeSzCvCIh/sDzN2T2HysdjoK23U+2Oj+D8jqGerZG+fesMZvQw4Ja/LpPiGpGR8pJNDDXdQHskCV5PNBJDvcNB8avzeORzmAItD1H9PSQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563259; c=relaxed/simple;
	bh=jH1osAewf5lDZ9G4162smzr6skDr7nrxI7X13pd0IzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRohQjMnmkSNvItrCYN/0hewbupSqlvXXIaeesX3QUS1dYws5LNdVRyA7+nfeGCxKibHSIEaN8RkA+0bkXrbmrZotPMV1wf/u9nT1OvgrF2XbKjEM/dphtQebGx2kdGuX/L44mp4dYLicY2nKn2F/W1lZ33Aml2NB6ilGiJ7OAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bGuCYHyD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563E5Psd010370;
	Thu, 3 Jul 2025 17:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhtP35pVf7DFU1pDP7Ssg6NzeYQ6u2xcDkQO3anUJPI=; b=bGuCYHyDVzGzxNL6
	5OvMAEMwbtmfDRz3WELFBKKMpfUZ9cJiR271x5WSHQu7CR5qlvtR5z4tQ6xjVG3j
	EHkhTo2s75JaTWzJha+yUWau4VTwa3Tdt0Dhkka3NU3pK3HvHdI0SpF8DZz7Afd0
	js5BSvyydWNmfrRw/7RkXVEjANKG8N1HOBRLQBoU8DBePceFtAC5stYlW23hZ1/6
	I0AoO1eF/VWUUdI61J17raXNvIM0SjL9DDFWImVHMsOnoRBrHMcXrbtUvJDXEjdY
	hGNX9Zm4c8DjyWAvpFKBfb0h8KUKzhkl4RHbnMcA4Hry/IZ6pQJoC+tVYmNGY638
	uv71IA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30e9r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 17:20:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563HKl8b027859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 17:20:47 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 10:20:42 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 8/9] media: qcom: camss: Add support for VFE 690
Date: Thu, 3 Jul 2025 22:49:37 +0530
Message-ID: <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6866bbf0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Xgyty1bFerXyxxqmy-QA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _3QLWEWm3E31SNBj3DmQl79Jpzqp8BlV
X-Proofpoint-GUID: _3QLWEWm3E31SNBj3DmQl79Jpzqp8BlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0NCBTYWx0ZWRfX4JdVWHOcsK8j
 KOHXfu/qImoGvQZ4FzgFV9dVV8PqnatepkeqyBtx8YQY4LojKPelnqYUBBrZ8odDRtw1gVYqgMd
 KF6QtjCH5eH+CsK1cUv30YoGI0+pb6HWt4vg/Xebcj0dQX7i9K6s0dnFnC96vi0ncQfiwSzgzrp
 PdKKhbS7WiN72ujdt8SfC+fNYd+bwgxXTjAo10uvfBiWNguHN9YFzjTpbVhVRT6uqfySg07wavm
 DePDSg7GezKTK/YMlIJDj4pESCyxatYZMCSo/IopcUDfUo0nDDYwihhKzcEdABqHmQSXwJ+lm+5
 3JUwDLybd3eEMkp3KuMXdk6nMP2uHT9UXcM5iDdZ+1cNYE9hGPpmsoiQUp9H1ElgqXuUg3IsQvm
 0fuqvKZc/oHdGYn5XPUuZdkxy5ZC5Utis/yDiYF35lZOZWUYio0uzYWlLVh1vOyHUl17udx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030144

Add support for VFE found on SA8775P (Titan 690). This VFE is
different from vfe 780 w.r.t few register offsets.
It supports two full and five lite VFE.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../platform/qcom/camss/camss-vfe-gen3.c      |  67 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 189 ++++++++++++++++++
 3 files changed, 242 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index 93d16b0951e9..a5eddc8c76ae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen2 (SA8755P/SM8550)
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
@@ -12,13 +12,41 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)
+#define IS_VFE_690(vfe) \
+	    (vfe->camss->res->version == CAMSS_8775P ? true : false)
+
+#define BUS_REG_BASE_690 \
+	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
+#define BUS_REG_BASE_780 \
+	    (vfe_is_lite(vfe) ? 0x200 : 0xC00)
+#define BUS_REG_BASE \
+	    (IS_VFE_690(vfe) ? BUS_REG_BASE_690 : BUS_REG_BASE_780)
+
+#define VFE_TOP_CORE_CFG (0x24)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL_690 (BUS_REG_BASE + 0xFC)
+#define VFE_BUS_WM_TEST_BUS_CTRL_780 (BUS_REG_BASE + 0xDC)
+#define VFE_BUS_WM_TEST_BUS_CTRL \
+	    (IS_VFE_690(vfe) ? VFE_BUS_WM_TEST_BUS_CTRL_690 \
+	     : VFE_BUS_WM_TEST_BUS_CTRL_780)
+/*
+ * Bus client mapping:
+ *
+ * Full VFE:
+ * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
+ * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
+ *
+ * VFE LITE:
+ * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
+ * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
+ */
+#define RDI_WM_690(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
+#define RDI_WM_780(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+#define RDI_WM(n)	(IS_VFE_690(vfe) ? RDI_WM_690(n) : RDI_WM_780(n))
 
 #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
 
-#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
-
 #define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
 #define		WM_CFG_EN			BIT(0)
 #define		WM_VIR_FRM_EN			BIT(1)
@@ -39,17 +67,6 @@
 #define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
 #define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
 
-/*
- * Bus client mapping:
- *
- * Full VFE:
- * 23 = RDI0, 24 = RDI1, 25 = RDI2
- *
- * VFE LITE:
- * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
- */
-#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
-
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
@@ -62,14 +79,23 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
 
-	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
-	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	if (IS_VFE_690(vfe))
+		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
+		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	else
+		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+
 	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
 	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
 	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
 	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
 	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
 
+	/* TOP CORE CFG */
+	if (IS_VFE_690(vfe))
+		writel(0x600000, vfe->base + VFE_TOP_CORE_CFG);
+
 	/* no dropped frames, one irq per frame */
 	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
 	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
@@ -92,7 +118,12 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
 	wm = RDI_WM(wm);
-	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	if (IS_VFE_690(vfe))
+		writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+	else
+		writel((addr >> 8) & 0xFFFFFFFF, vfe->base +
+		       VFE_BUS_WM_IMAGE_ADDR(wm));
 
 	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
 		wm, addr);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..99cbe09343f2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -910,7 +911,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
-		!strcmp(clock->name, "vfe_lite"));
+		!strcmp(clock->name, "vfe_lite") ||
+		!strcmp(clock->name, "camnoc_axi"));
 }
 
 /*
@@ -1974,6 +1976,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b2398196b9ff..3a11c0a98eb1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2709,6 +2709,195 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources vfe_res_8775p[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
+			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
+			   "icp_ahb"},
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 0 },
+			{ 0, 80000000 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+			{ 0 },
+		},
+
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = false,
+			.pd_name = NULL,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
+			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
+			   "icp_ahb"},
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 0 },
+			{ 0, 80000000 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+			{ 0 },
+		},
+
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = false,
+			.pd_name = NULL,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite2" },
+		.interrupt = { "vfe_lite2" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE5 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite3" },
+		.interrupt = { "vfe_lite3" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE6 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite4" },
+		.interrupt = { "vfe_lite4" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
-- 
2.25.1


