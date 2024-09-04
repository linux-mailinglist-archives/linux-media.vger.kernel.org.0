Return-Path: <linux-media+bounces-17561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55596B9D4
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 075F2B26744
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620691D2213;
	Wed,  4 Sep 2024 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H9RH/UmU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9C1D014F;
	Wed,  4 Sep 2024 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448344; cv=none; b=g/eXgonM2yioRemthVEKu2ozuQZ/WDR/LFVyDU1gIqFzWcoTQC33pq+rd7+k7/u6d6q8EHqxvdWIRAtoKsC+EATUgN2qhvlQ0WfhZHmhgZEqnJBgeHWRAZ5cPlCK04Ffffk/2+8rXHyTPuqpos3tTf/R+1pjveAzCIqQnqNtOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448344; c=relaxed/simple;
	bh=jwLMfGORsSiP6mcpykXLayCwE51PJygqXblHzcDBQmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OWTF8jn09HJbt+HmIB1wDhM5QZ09eED0gNkyi8uK+7u6hebLmRSqS+jMsNC55L8jnwgd7dbEugzoO1V0JJFoEFAQnOXov6OAAwfw3gRTJDEFCKbKxyKmXHxHryCptuqIIR4+YZqxoT3+2NaI7LsOMXEWcJB4TbMb8vTkxd8cl+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H9RH/UmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484AP5St020460;
	Wed, 4 Sep 2024 11:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTC79PgSwR1fcyw/55Y1ZQEVyYMHWVicGE4iKZ9HLX0=; b=H9RH/UmUNgfQWWiE
	w5Wggxy4J6ggwHYSyYtpVUWN1ZWRqJwVjM3VYro5DMGgwP7iArTcUbKhL6xmJuEo
	mstgHWNVsm21MajabB7tOC9dYErFx1MTAwJFEFWpburBwpCdhKr+XJuNBne1Ortt
	KybRLJCxFYzkYuggcNg99mYsdS2lFT9m1+irc2XOaCwXgqT9m4OxgWaur4Y02imi
	7HikSGbLzcn09TYb/r2CSAwXaQ/fvD8VAa+OeFI0cCMgQ8g7x1N9MqGAVTh2m7wM
	2CeYNFJ8Kgrn0NV2+pcOhiw9W6lfBWclSROkZQtCbP+MA7AjPX4Z7H8M9buOJ65T
	6iW2dw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxfabgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:12:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BC7mY030641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:12:07 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:12:01 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:11 +0530
Subject: [PATCH 05/10] media: qcom: camss: Add support for camss driver on
 SC7280
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-5-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=14035;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=afVmOOOoXXeG91gjgMgKd+TU0g/ecGjCrjBDkYgcPCU=;
 b=K9DnhxexXgAbscpk19hG615WiwTHc7oqSiSnG23N16raAhlDZ2x/izre4CpRcMlCdQ1A2Wspq
 x+lWY4quJoFDeOmNacEaaIbWatOTz7WjTKgxtxaWNRLR3NGmh1MjSEl
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sFLk0lzhVSfNl3M81r9ZjHTw7Bv8Uqux
X-Proofpoint-ORIG-GUID: sFLk0lzhVSfNl3M81r9ZjHTw7Bv8Uqux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040084

From: Suresh Vankadara <quic_svankada@quicinc.com>

Add support for the camss driver on the SC7280 SoC.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c     |   1 -
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   5 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 342 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 7 files changed, 356 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..8d3dc26e2af4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1028,7 +1028,6 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->res->hw_ops->subdev_init(csid);
 
 	/* Memory */
-
 	if (camss->res->version == CAMSS_8250) {
 		/* for titan 480, CSID registers are inside the VFE region,
 		 * between the VFE "top" and "bus" registers. this requires
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
index 2f7361dfd461..b3525ad81ffd 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -108,6 +108,11 @@ const struct csiphy_formats csiphy_formats_sdm845 = {
 	.formats = formats_sdm845
 };
 
+const struct csiphy_formats csiphy_formats_sc7280 = {
+	.nformats = ARRAY_SIZE(formats_sdm845),
+	.formats = formats_sdm845
+};
+
 /*
  * csiphy_get_bpp - map media bus format to bits per pixel
  * @formats: supported media bus formats array
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 47f0b6b09eba..9295f2fc6745 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -110,6 +110,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 extern const struct csiphy_formats csiphy_formats_8x16;
 extern const struct csiphy_formats csiphy_formats_8x96;
 extern const struct csiphy_formats csiphy_formats_sdm845;
+extern const struct csiphy_formats csiphy_formats_sc7280;
 
 extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
 extern const struct csiphy_hw_ops csiphy_ops_3ph_1_0;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ffcb1e2ec417..61f6815a3756 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -334,6 +334,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 		break;
 	case CAMSS_660:
+	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1692,6 +1693,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 30b36d36f0b2..5e7235001239 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1480,6 +1480,333 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_7280[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = { "csiphy0", "csiphy0_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = { "csiphy1", "csiphy1_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = { "csiphy2", "csiphy2_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {},
+		.clock = { "csiphy3", "csiphy3_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {},
+		.clock = { "csiphy4", "csiphy4_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 380000000, 0},
+			{ 400000000, 0, 510000000, 0},
+			{ 400000000, 0, 637000000, 0},
+			{ 400000000, 0, 760000000, 0}
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 380000000, 0},
+			{ 400000000, 0, 510000000, 0},
+			{ 400000000, 0, 637000000, 0},
+			{ 400000000, 0, 760000000, 0}
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi2", "vfe2_cphy_rx", "vfe2", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 380000000, 0},
+			{ 400000000, 0, 510000000, 0},
+			{ 400000000, 0, 637000000, 0},
+			{ 400000000, 0, 760000000, 0}
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 320000000, 0},
+			{ 400000000, 0, 400000000, 0},
+			{ 400000000, 0, 480000000, 0},
+			{ 400000000, 0, 600000000, 0}
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 320000000, 0},
+			{ 400000000, 0, 400000000, 0},
+			{ 400000000, 0, 480000000, 0},
+			{ 400000000, 0, 600000000, 0}
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
+		.clock = { "vfe0", "vfe0_axi", "soc_ahb",
+			   "cpas_ahb", "camnoc_axi",
+			   "gcc_camera_axi"},
+		.clock_rate = {
+			{ 380000000, 0, 80000000, 0, 150000000, 0},
+			{ 510000000, 0, 80000000, 0, 240000000, 0},
+			{ 637000000, 0, 80000000, 0, 320000000, 0},
+			{ 760000000, 0, 80000000, 0, 400000000, 0},
+			{ 760000000, 0, 80000000, 0, 480000000, 0},
+		},
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
+		.clock = { "vfe1", "vfe1_axi", "soc_ahb",
+			   "cpas_ahb", "camnoc_axi",
+			   "gcc_camera_axi"},
+		.clock_rate = {
+			{ 380000000, 0, 80000000, 0, 150000000, 0},
+			{ 510000000, 0, 80000000, 0, 240000000, 0},
+			{ 637000000, 0, 80000000, 0, 320000000, 0},
+			{ 760000000, 0, 80000000, 0, 400000000, 0},
+			{ 760000000, 0, 80000000, 0, 480000000, 0},
+		},
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
+		.clock = { "vfe2", "vfe2_axi", "soc_ahb",
+			   "cpas_ahb", "camnoc_axi",
+			   "gcc_camera_axi"},
+		.clock_rate = {
+			{ 380000000, 0, 80000000, 0, 150000000, 0},
+			{ 510000000, 0, 80000000, 0, 240000000, 0},
+			{ 637000000, 0, 80000000, 0, 320000000, 0},
+			{ 760000000, 0, 80000000, 0, 400000000, 0},
+			{ 760000000, 0, 80000000, 0, 480000000, 0},
+		},
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
+		.clock = { "vfe0_lite", "soc_ahb", "cpas_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 320000000, 80000000, 0, 150000000, 0},
+			{ 400000000, 80000000, 0, 240000000, 0},
+			{ 480000000, 80000000, 0, 320000000, 0},
+			{ 600000000, 80000000, 0, 400000000, 0},
+		},
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
+		.clock = { "vfe1_lite", "soc_ahb", "cpas_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 320000000, 80000000, 0, 150000000, 0},
+			{ 400000000, 80000000, 0, 240000000, 0},
+			{ 480000000, 80000000, 0, 320000000, 0},
+			{ 600000000, 80000000, 0, 400000000, 0},
+		},
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
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -2445,9 +2772,24 @@ static const struct camss_resources sc8280xp_resources = {
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
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 73c47c07fc30..16e527f8b831 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -76,6 +76,7 @@ enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
 	CAMSS_660,
+	CAMSS_7280,
 	CAMSS_845,
 	CAMSS_8250,
 	CAMSS_8280XP,

-- 
2.25.1


