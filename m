Return-Path: <linux-media+bounces-24063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9209FC562
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 14:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C307B164214
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 13:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A431BC08B;
	Wed, 25 Dec 2024 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ChDmEGV0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912A1804E;
	Wed, 25 Dec 2024 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735133760; cv=none; b=IZla17JGLKtZGGnCkcrkxFUlgCnWRTJo4N2bvVtqZDyf2EEOsABU7o9LoJrq6AJSzp6VJ9v0vb0/9MJTuQkkvWYMhbazkP8eRsKSMkXegH5IYopKnMTbjpu2qt+qothUs3Br4IQrs9ZV7dOW7AXnYV8SsRKmVC+ltMoev3lKYMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735133760; c=relaxed/simple;
	bh=6YEgkn2zWrgWn/WQx07M1LDpxfLc9wlU/HRnEec0DpM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIB4Ah7M2MTgVAub2zKEmDbckgQtl/Z700ISDvrSDvb6qeusCiDvYyIoBic2353H8x9qA4F6tF/hzhTQ9vhVK9EcYarylTvmA30sKnQyZ1VW9WgbCIJPloG6nd/CPPpcAoiLShT/011YVnSrLxlB+jGJ8PBbZm/unyGBn2qaChs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ChDmEGV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3iJ4V032277;
	Wed, 25 Dec 2024 13:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGI3DuGTeyJto5t7qEINgy9pkmUqcpRqzL0gzOeMFdI=; b=ChDmEGV0yLX/BnPd
	T9WIrTAGA9EDkU3dsxCz3O9Yj8Ms5Gh3qXc0ONx4XKTXKo9Ryl+0ObLXCt4gf06A
	0tNwzTqtc9CD0IABSkUb9kGg3iTbKj5FM5OLpRT9WLaDr43sHFW1mVRs8qCLwwm7
	uyQecAnVSFX4z+C0U2rPmXsb6+xEAEw0j69iQ9GrD3vVqeJSSlo0SDWtRN2SbutU
	sTW0xDzp85re6u7hyhUup6+DxqIlqJm7fc773v5+U3+5zFrSvNkhru33fdHEe/CS
	NZEMUSI8062HPQyvoCR6EhLERo8fuY/SsVPkBSvnFF508hQqnprzLDRL4gfBwH2M
	sVGC0g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rad8250m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:35:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDZlBV014848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:35:47 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 05:35:41 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 01/16] media: qcom: camss: csiphy-3ph: Fix trivial indentation fault in defines
Date: Wed, 25 Dec 2024 19:05:08 +0530
Message-ID: <20241225133523.4034820-2-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225133523.4034820-1-quic_depengs@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: 7J52VmJ9KhKwNgMNYQmM1kxnWEVo6R7I
X-Proofpoint-ORIG-GUID: 7J52VmJ9KhKwNgMNYQmM1kxnWEVo6R7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250120

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Replace space with tab in define indentations.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f341f7b7fd8a..616a9aa73cec 100644
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


