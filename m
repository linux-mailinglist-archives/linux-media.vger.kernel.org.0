Return-Path: <linux-media+bounces-26152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0EA35AF5
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE21216F95B
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD51260A4F;
	Fri, 14 Feb 2025 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jIM+lhnL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47825E44D;
	Fri, 14 Feb 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527003; cv=none; b=XQBbEmTqIajO4wEBTEIC4VKnmYAXKnbFRervZeX91zvwovjqWoPgwzlyIjaWsGGU+zy0XQu4A+FkT0SOCZC1PUg+MUXqtYNeXUcBiDv4lrTIYDjeacQFPvUmK/wN8SWF2sfJ7uIsxHpJ1MAaqYouChrFZ7Dcfz60OpLSzZF8sds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527003; c=relaxed/simple;
	bh=KASLTUJAxkjCTJqirQvBCxVX+BLGaMhtV9SR/9tjhB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wa3u6/2cTEOmQcbaNcaHEWXmLXyoLb2SFaRTaxAbS93Vuo3Cwq5Wm3RXNxOPdhjk2avfEk5HD3PMpxcUqnKmzXFn/Kk3eQvgEXqr7uxEQDiE1dgvFq519tCcQbD+u2OswC0ma6oNZ/Q8WKKKxxRGYYXnDw37b6QDoJz33c0cxeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jIM+lhnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E8NPpV021173;
	Fri, 14 Feb 2025 09:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUNsG6GmrtG49Qtky0lMGx6KGDhizVAs3aPqTzuONio=; b=jIM+lhnLeXNgT75K
	lwjBLYqRGORPEJXcbsOzW7rstvUeTOg+sGsx3jJIojjKrWVvawyfZe22ASq7tfnq
	XzUzt1dnZKFYvnkTSLXY1uh/FBt8TXll6FIH52bbEM02iBl0NtDPOiciEZYn1gRh
	zGRlzLhCtGajujWfPikF5gM5RlA9WiHaDm1lCvzrtIgHn+2jNNzazKjZwHUBuEH6
	wQUumBYXR6ILcXt2AFXMTOjIgIYI0Pj9DOXwwIgqAC3BC4FXyEaTypweWuf/cXSW
	nwEuqFIW8Epe2Xe0CEZmb3S30RMAf0q0uXQee44vA4zg79KnR4N+VCUg7585LkM/
	HWxpKg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxub9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9uakt000700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:36 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:56:33 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>
Subject: [PATCH v1 3/5] media: qcom: camss: Add CSID support for QCS8300
Date: Fri, 14 Feb 2025 15:26:09 +0530
Message-ID: <20250214095611.2498950-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
References: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VKfa27-iN99fG_z5t-87JQvuS5zF9agZ
X-Proofpoint-GUID: VKfa27-iN99fG_z5t-87JQvuS5zF9agZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140071

Add CSID support for QCS8300 soc.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 136 ++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 108470a2e70f..cf5f7d886c24 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2229,6 +2229,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	}
 };
 
+static const struct resources_wrapper csid_wrapper_res_qcs8300 = {
+	.reg = "csid_wrapper",
+};
+
 static const struct resources_wrapper csid_wrapper_res_sa8775p = {
 	.reg = "csid_wrapper",
 };
@@ -2495,6 +2499,138 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_8300[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+		.reg = { "csid0", "csid_top" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+		.reg = { "csid1", "csid_top" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid-lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid-lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite2" },
+		.interrupt = { "csid-lite2" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID5 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite3" },
+		.interrupt = { "csid-lite3" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID6 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite4" },
+		.interrupt = { "csid-lite4" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_690,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
-- 
2.25.1


