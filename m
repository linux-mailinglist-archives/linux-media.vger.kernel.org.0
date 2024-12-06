Return-Path: <linux-media+bounces-22809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742699E78C7
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 20:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501EC16C153
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 19:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A89203D50;
	Fri,  6 Dec 2024 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RUZEnml/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C902206AC;
	Fri,  6 Dec 2024 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512801; cv=none; b=fbYPEvEzixgpDL1uNC3XjmXKT/iQiJ2pgxb6leyo1OAopVUgw+bJxFhntqVAg6GdLCMgRFnd44/wPU+KI132zkjfrHs5R80Pkf38cbWa5TfYV1fBTRqRhs9V3XMh9hPkg7KgZ/Co8QfftA5qD/5UIP12H6UcELcyyAo9LabIvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512801; c=relaxed/simple;
	bh=IVSSAHXOdzoPeprBZc1wFE99L8FXlj3HD28TO5zSE68=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b9V6juqwcXRHsloil3LacHeD5cGOoJHErcrWFNM6TSupNcRu5ovrd9THVcWFjt9kfTxXtdSy1jDTYnCEqwIC7IGZoG198LXTtFMinbsaru86H30xy8e8yaC3ZTF8Rmv4KapdjZWGWEphuo3BtGT6QJAu0JYNP/wmkCnBD0IA03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RUZEnml/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6BmwoA003138;
	Fri, 6 Dec 2024 19:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0yz9c6TnjT63R7ZDLOdw75Fy87ZwOoQft/f+qjA5ys=; b=RUZEnml/jx3ucXfZ
	fjDkevNZWv/zElbtjwjDgYWfAymBhp5FNFeibgudNqAmoOdOSh7PFznLXRDG68s+
	aGggW5HbpBq3bc81x2mOUd/HQ2h4+DlN0x7viqY5tpwP3L8qA1aKqpEAByMrphwl
	53EZOtokLcPNORQbXkGVaxD8cnvl5H6TBf/OyIf1FUWQQE9K1jbCFLOxKYU9i3UE
	WOI6VlsbMaapNLWnVVz9puo7ILKXV0jVfaGBYNb7E4bShRstKRS/xqqdQAn0HQFE
	x17BwCC44sSQZHqwNTbYuUYOkG8A+VjFW4qBqwsEBtYcRlCNC5nSRStftjJO4QV4
	vP/noA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp2hve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 19:19:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6JJmC6015703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 19:19:48 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 11:19:39 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v8 3/5] media: qcom: camss: Add support for camss driver on sc7280
Date: Sat, 7 Dec 2024 00:48:58 +0530
Message-ID: <20241206191900.2545069-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: G3-qSbwdpQr1Z7R5zfRF-MGFfxSsdLWj
X-Proofpoint-ORIG-GUID: G3-qSbwdpQr1Z7R5zfRF-MGFfxSsdLWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060144

From: Suresh Vankadara <quic_svankada@quicinc.com>

Add support for the camss driver on the sc7280 soc.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 319 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 6 files changed, 333 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 7d2490c9de01..f341f7b7fd8a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 	u32 val;
 
 	switch (csiphy->camss->res->version) {
+	case CAMSS_7280:
+		r = &lane_regs_sm8250[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
+		break;
 	case CAMSS_8250:
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
@@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
+	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 5af2b382a843..3791c2d8a6cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 = {
 	.formats = formats_8x96
 };
 
+const struct csiphy_formats csiphy_formats_sc7280 = {
+	.nformats = ARRAY_SIZE(formats_sdm845),
+	.formats = formats_sdm845
+};
+
 const struct csiphy_formats csiphy_formats_sdm845 = {
 	.nformats = ARRAY_SIZE(formats_sdm845),
 	.formats = formats_sdm845
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index e3b9e8f12806..90cc3f976643 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -117,6 +117,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 
 extern const struct csiphy_formats csiphy_formats_8x16;
 extern const struct csiphy_formats csiphy_formats_8x96;
+extern const struct csiphy_formats csiphy_formats_sc7280;
 extern const struct csiphy_formats csiphy_formats_sdm845;
 
 extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fb3234c65403..95f6a1ac7eaf 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -335,6 +335,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 		break;
 	case CAMSS_660:
+	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1693,6 +1694,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 789e1b80f25e..004a74f6b2f6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1266,6 +1266,310 @@ static const struct resources_icc icc_res_sm8250[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_7280[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_7280[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 380000000, 510000000, 637000000, 760000000 }
+		},
+
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 380000000, 510000000, 637000000, 760000000 }
+		},
+
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 380000000, 510000000, 637000000, 760000000 }
+		},
+
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 320000000, 400000000, 480000000, 600000000 }
+		},
+
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe_lite1_csid", "vfe_lite1_cphy_rx", "vfe_lite1" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 320000000, 400000000, 480000000, 600000000 }
+		},
+
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_7280[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+
+		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
+			   "vfe0_axi", "gcc_cam_hf_axi" },
+		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 380000000, 510000000, 637000000, 760000000 },
+				{ 0 },
+				{ 0 } },
+
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+
+		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
+			   "vfe1_axi", "gcc_cam_hf_axi" },
+		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 380000000, 510000000, 637000000, 760000000 },
+				{ 0 },
+				{ 0 } },
+
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+
+		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
+			   "vfe2_axi", "gcc_cam_hf_axi" },
+		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 380000000, 510000000, 637000000, 760000000 },
+				{ 0 },
+				{ 0 } },
+
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.hw_ops = &vfe_ops_170,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
+			   "vfe_lite0", "gcc_cam_hf_axi" },
+		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 320000000, 400000000, 480000000, 600000000 },
+				{ 0 } },
+
+		.regulators = {},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
+			   "vfe_lite1", "gcc_cam_hf_axi" },
+		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 320000000, 400000000, 480000000, 600000000 },
+				{ 0 } },
+
+		.regulators = {},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sc7280[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 	/* CSIPHY0 */
 	{
@@ -2685,10 +2989,25 @@ static const struct camss_resources sc8280xp_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sc7280_resources = {
+	.version = CAMSS_7280,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_7280,
+	.csid_res = csid_res_7280,
+	.vfe_res = vfe_res_7280,
+	.icc_res = icc_res_sc7280,
+	.icc_path_num = ARRAY_SIZE(icc_res_sc7280),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
+	.csid_num = ARRAY_SIZE(csid_res_7280),
+	.vfe_num = ARRAY_SIZE(vfe_res_7280),
+	.link_entities = camss_link_entities
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ffce0a0edbc5..9a046eea334f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -78,6 +78,7 @@ enum pm_domain {
 
 enum camss_version {
 	CAMSS_660,
+	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x53,
 	CAMSS_8x96,
-- 
2.25.1


