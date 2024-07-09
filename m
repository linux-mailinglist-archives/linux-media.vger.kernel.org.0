Return-Path: <linux-media+bounces-14791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08992BF6B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD7C1F21C48
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0CD1ABC53;
	Tue,  9 Jul 2024 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KLukZU/7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF751AC23C;
	Tue,  9 Jul 2024 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541289; cv=none; b=GggMWQftT6XuwDW03eGk1AhUNOohltbTWw0T7w7XUSdypRBu8WtN8nDBgEmw4thwRh2S+/m+qSNlBu+ZItY2uuUY8F+na+aoEJTeevNO5G30jsErjDhe0lEYuuEKEnw+YXrD3TLorJfcXIlzHI0hWBJct0I318bDL7FX/6TLdPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541289; c=relaxed/simple;
	bh=E5dQcK5FDTu75sddqyY8jELeyNI4mmmEJjNPP7z2CHM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paUQFGHaBuVS56quAjh1f4/dvbIOtuvzCPpChNSTtkVDNo311+QA8v/roBT5rGvQ/G4RyjpfjzOGObuVwbcIoDS2XOGwsEx0J1DgpriOilZsUvTDNNZYTjBkCLRkOxr2QFUx/Xun4VRJaQSLKnTgfdt9/TL/aWVFxw2eYynEoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=fail smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KLukZU/7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469D1rNC019898;
	Tue, 9 Jul 2024 16:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LODSuYbscDtqcsU7SehWUfLa
	YJEyPLyS62nLLg0AFqA=; b=KLukZU/7pgMPzgJ2hMoynQOUVEGyIAZ63REY/gXx
	deWO8AYvAFhR+ML291DF19vWQM8ojXjgtL+zfARwfYXDd/NWSMa9nSJ68nMNy+st
	cJUObjkmG60ZiNnYZ8VkZ6oHSQr072/zGfMM1H5PxpIsKKJQtsga5nYD1vguytRT
	vxlOCGbnPgZye/XT7ynmJatTNs5dYoVxOAgYjP1+0FuZPKkUym6jHty7K1QylibF
	G9oZoL35RyCP5kX3x+LZgsOltnvVrQFQ31t/NDG6Jh/pFfk5uwwctv8uRaDcGCqw
	H/j8R5tYa/hymJwlr9/61HYoNOG7L1HfJRIgpgIidBkxzg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpdpp79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:08:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G82sc010660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:08:02 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:56 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH 13/13] media: qcom: camss: Add sm8550 resources
Date: Tue, 9 Jul 2024 21:36:56 +0530
Message-ID: <20240709160656.31146-14-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7wrZnYafH3I8aTiwOLloX_CI8AlxKAWB
X-Proofpoint-ORIG-GUID: 7wrZnYafH3I8aTiwOLloX_CI8AlxKAWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

Add sm8550 resources
- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 8 x CSI PHY

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 415 ++++++++++++++++++
 3 files changed, 417 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 714a8db855fd..aaa51e47cf0c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -238,6 +238,7 @@ extern const struct csid_formats csid_formats_gen2;
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_gen2;
+extern const struct csid_hw_ops csid_ops_gen3;
 
 /*
  * csid_is_lite - Check if CSID is CSID lite.
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a8b09ce9941b..6c2f394bbf55 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -239,6 +239,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
+extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index abeb0918e47d..730eecb05ef7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1480,6 +1480,406 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8550[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy0",
+			"csiphy0_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy1",
+			"csiphy1_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy2",
+			"csiphy2_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy3",
+			"csiphy3_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy4",
+			"csiphy4_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy5",
+			"csiphy5_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY6 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy6",
+			"csiphy6_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy6" },
+		.interrupt = { "csiphy6" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY7 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy7",
+			"csiphy7_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy7" },
+		.interrupt = { "csiphy7" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_8550[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = {
+			"csid",
+			"csiphy_rx" },
+		.clock_rate = {
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid0", "csid_top" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = {
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid1", "csid_top" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = {
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid2", "csid_top" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe_lite_csid",
+			"vfe_lite_cphy_rx" },
+		.clock_rate = {
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe_lite_csid",
+			"vfe_lite_cphy_rx" },
+		.clock_rate = {
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_8550[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = {
+			"cam_hf_axi",
+			"cpas_ahb",
+			"cpas_fast_ahb_clk",
+			"vfe0_fast_ahb",
+			"vfe0",
+			"cpas_vfe0",
+			"camnoc_axi"},
+		.clock_rate = {
+				{ 0, 0, 0, 0, 0 },
+				{ 0, 0, 0, 0, 80000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 466000000, 594000000, 675000000, 785000000, 785000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 }
+				},
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = {
+			"cam_hf_axi",
+			"cpas_ahb",
+			"cpas_fast_ahb_clk",
+			"vfe1_fast_ahb",
+			"vfe1",
+			"cpas_vfe1",
+			"camnoc_axi"},
+		.clock_rate = {
+				{ 0, 0, 0, 0, 0 },
+				{ 0, 0, 0, 0, 80000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 466000000, 594000000, 675000000, 785000000, 785000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 }
+				},
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = {
+			"cam_hf_axi",
+			"cpas_ahb",
+			"cpas_fast_ahb_clk",
+			"vfe2_fast_ahb",
+			"vfe2",
+			"cpas_vfe2",
+			"camnoc_axi"},
+		.clock_rate = {
+				{ 0, 0, 0, 0, 0 },
+				{ 0, 0, 0, 0, 80000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 466000000, 594000000, 675000000, 785000000, 785000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 }
+				},
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = {
+			"cam_hf_axi",
+			"cpas_ahb",
+			"cpas_fast_ahb_clk",
+			"vfe_lite_ahb",
+			"vfe_lite",
+			"cpas_ife_lite",
+			"camnoc_axi"},
+		.clock_rate = {
+				{ 0, 0, 0, 0, 0 },
+				{ 0, 0, 0, 0, 80000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 }
+				},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.regulators = {},
+		.clock = {
+			"cam_hf_axi",
+			"cpas_ahb",
+			"cpas_fast_ahb_clk",
+			"vfe_lite_ahb",
+			"vfe_lite",
+			"cpas_ife_lite",
+			"camnoc_axi"},
+		.clock_rate = {
+				{ 0, 0, 0, 0, 0 },
+				{ 0, 0, 0, 0, 80000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 300000000, 400000000, 400000000, 400000000 }
+				},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm8550[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_hf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -2487,6 +2887,20 @@ static const struct camss_resources sc8280xp_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sm8550_resources = {
+	.version = CAMSS_8550,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_8550,
+	.csid_res = csid_res_8550,
+	.vfe_res = vfe_res_8550,
+	.icc_res = icc_res_sm8550,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
+	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.vfe_num = ARRAY_SIZE(vfe_res_8550),
+	.link_entities = camss_link_entities
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
@@ -2494,6 +2908,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
+	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ }
 };
 
-- 
2.34.1


