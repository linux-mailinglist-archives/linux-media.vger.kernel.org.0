Return-Path: <linux-media+bounces-14778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A192BF35
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936652872B4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FC51A0AEC;
	Tue,  9 Jul 2024 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UVrujljJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602C1A08AE;
	Tue,  9 Jul 2024 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541251; cv=none; b=j2d9JyEYU7MuEGoKmggs+ZZpTRl1vBtrSrFHVX0P/dDbgGQdHHhB7qKAMgzBACy/cu6Nn8wh4RFHRMeDi/ylXB2Cij3/YnHeoN2sXiaZIL6tPAcJJts5rRg7NYLrXLYNMkXtkFJkAIcQRN/9mRZcpkwhuliffPQ2xBlGA/lwges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541251; c=relaxed/simple;
	bh=dX2VThhAmCn0rP4mFqKx52gwqKgTpU0yjNkO4GEy2L0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKMGQ8BHcKDfViYP0NoPn8XcjDiy34M2x3naFRD1YkXP5CjLWXlJXnSM05YvxKng1AT9UTOaKql89DHiJqlVf+WZgD9sQ8GSzbmevM/mJrEzj5qUlZAOAW9IhuCq4P/DVewgxBOnUocp2TuPbGkRgr2WllbAHEpzAApafCosIz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UVrujljJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469ABPMR000592;
	Tue, 9 Jul 2024 16:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6Yz5Hvn05abXuitje57gNUN
	ZDg+HAxNUnXsV2xH3EI=; b=UVrujljJZ9m4kVhLnAMCY/Zf/cy2ZUMbrokqa3OA
	HiLMcNwdWZrZkFAtP5mMFt1hgdd94Ej9M6w+Os/B2uPSc6clB+nK4Y1LflQ5q+8n
	O4fiB9izhbQnRngE/7jR5NtQsIBU96auFQCLsPbbWrXBymPEbqnYRJdwSZL7MpUc
	3j+q+ten5uvaQg49Exf6Yy/auG1ynjk5s8DUFmMGAXEEuGBoA/Qr2WC4beq8IS/g
	I27XL0tm8xSwfEEUt52QPZzQEzCZCXjihLL1U2peH1hN0b48kW8Ja2cxZEqN38EW
	kQpHg2V5KHFmhGjpjE7Yp6bs7I7ZB1jAI6GrdJu2JqcFbA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn768j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7MFM011962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:22 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:17 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 01/13] media: qcom: camss: csiphy-3ph: Fix trivial indentation fault in defines
Date: Tue, 9 Jul 2024 21:36:44 +0530
Message-ID: <20240709160656.31146-2-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: O3NfJ5Rxc6kn1DY_pBd0LQn5u1rLUgGK
X-Proofpoint-GUID: O3NfJ5Rxc6kn1DY_pBd0LQn5u1rLUgGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Replace space with tab in define indentations.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index df7e93a5a4f6..53892bdaaf58 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -48,13 +48,13 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)	(0x8b0 + 0x4 * (n))
 
-#define CSIPHY_DEFAULT_PARAMS            0
-#define CSIPHY_LANE_ENABLE               1
-#define CSIPHY_SETTLE_CNT_LOWER_BYTE     2
-#define CSIPHY_SETTLE_CNT_HIGHER_BYTE    3
-#define CSIPHY_DNP_PARAMS                4
-#define CSIPHY_2PH_REGS                  5
-#define CSIPHY_3PH_REGS                  6
+#define CSIPHY_DEFAULT_PARAMS		0
+#define CSIPHY_LANE_ENABLE		1
+#define CSIPHY_SETTLE_CNT_LOWER_BYTE	2
+#define CSIPHY_SETTLE_CNT_HIGHER_BYTE	3
+#define CSIPHY_DNP_PARAMS		4
+#define CSIPHY_2PH_REGS			5
+#define CSIPHY_3PH_REGS			6
 
 struct csiphy_reg_t {
 	s32 reg_addr;
-- 
2.34.1


