Return-Path: <linux-media+bounces-14790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2692BF66
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75C581C2308C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E9A1ABCDE;
	Tue,  9 Jul 2024 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h5NSbIpu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4671ABC53;
	Tue,  9 Jul 2024 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541285; cv=none; b=iacHGML0EBQs+SgtyKG2SFwKgSXP7++8UHB+LWiGykebd3nUBxsn+CgomeCIbUSU3z8CAhRK2JWF/76uukigzX1CJ4ZJPvJECNXo8nCwfQJXw4gwpCWUXq2N24djeufvv6Zm+qz3RjOylKKCYcQ8l1IR7qj/6iPjHjU95qO0mCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541285; c=relaxed/simple;
	bh=7eJJw3trrS1gKC61U3IU3oo4VplOI5gv9FevpbsA11o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jpbW8xmQvQb4OsDlKkbToYDtHlmnUENNhdSVItaM9JgtFLoMtUYAWhIQlVisyUgVju7T0NZ2jV5ugH79ZEaiI0O2aYL054+gaX8+b07xMmv4+FbPkcTrJrP9NINEWF7ps2nyJ5IjtaOqDvRjPi/jjDU9a67WLUQfp7NUqZFpoJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h5NSbIpu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469Bjxm6002542;
	Tue, 9 Jul 2024 16:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pzc7OB2CGf57VFGDHYNA1KMl
	R4qOXmNs/lp+918SD/E=; b=h5NSbIpu7NSVjR6o9UBuqH+fbgLHlSal/OPj7DQc
	GRnv/hqAiegZrRwOaKSQqdn+tZQs/ZRTjcVL+h6L4jxOzZGUwlMFz7WioKAhSJFd
	kk47qOwWACiuSP/8+66lqdXQfSiIiK08y+4tEewMvWHdUeYdEbHgAk4lvnwiUeYA
	UMRRJcOABReAnzkL1E8D8izV0sS9R5yUnlBbnh6rgyuXHz7Zr1N8Cou7y9R4jG4n
	Mkua0iTKP2nwaqYN40PYF9EpiPfTNavwY1m0H6pAMWmquXkosPZwFP0J0lmIz9y0
	SDzC+Zubu50NUpi7FJtxRDaRDf2dbIJ249YRi4zZFEtufA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8xugk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:08:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7xuC032288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:59 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:53 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 12/13] media: qcom: camss: Add sm8550 support
Date: Tue, 9 Jul 2024 21:36:55 +0530
Message-ID: <20240709160656.31146-13-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: v2UIWBlxNLkLt7w9Zo4nozRxkmAYqSUE
X-Proofpoint-GUID: v2UIWBlxNLkLt7w9Zo4nozRxkmAYqSUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090106

Add in functional logic throughout the code to support the SM8550.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csid.c    | 21 +++++++++++++++++++
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  6 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  6 ++++++
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 4 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..90fba25db4c6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1013,6 +1013,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *top_res;
 	int i, j;
 	int ret;
 
@@ -1040,6 +1041,26 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		else
 			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
 				 + VFE_480_CSID_OFFSET;
+	} else if (camss->res->version == CAMSS_8550) {
+		/* for titan 780, CSID lite registers are inside the VFE lite region,
+		 * between the VFE "top" and "bus" registers. this requires
+		 * VFE to be initialized before CSID
+		 */
+		if (csid_is_lite(csid))
+			csid->base =  csid->res->parent_dev_ops->get_base_address(camss, id);
+		else {
+			csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
+			/* CSID "top" is a new function in Titan780.
+			 * CSID can connect to VFE & SFE(Sensor Front End).
+			 * This connection is ontrolled by CSID "top" registers.
+			 * CSID "top" registers at only one region.
+			 */
+			top_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
+			csid->top_base = ioremap(top_res->start, resource_size(top_res));
+		}
+
+		if (IS_ERR(csid->base))
+			return PTR_ERR(csid->base);
 	} else {
 		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 		if (IS_ERR(csid->base))
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b6d5a27b94a6..53c46c2e5896 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -631,6 +631,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8550:
 		ret = true;
 		break;
 	}
@@ -718,6 +719,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sc8280xp[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
+	case CAMSS_8550:
+		regs->lane_regs = &lane_regs_sm8550[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		regs->offset = 0x1000;
+		break;
 	default:
 		WARN(1, "unknown csiphy version\n");
 		return -ENODEV;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..479474c1cd95 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -338,6 +338,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8550:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -408,6 +409,10 @@ int vfe_reset(struct vfe_device *vfe)
 
 	reinit_completion(&vfe->reset_complete);
 
+	/* The reset has been moved to csid in 8550 */
+	if (vfe->camss->res->version == CAMSS_8550)
+		return 0;
+
 	vfe->res->hw_ops->global_reset(vfe);
 
 	time = wait_for_completion_timeout(&vfe->reset_complete,
@@ -1695,6 +1700,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8550:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 65fcebd42c4b..feac83510a17 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -79,6 +79,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8250,
 	CAMSS_8280XP,
+	CAMSS_8550,
 };
 
 enum icc_count {
-- 
2.34.1


