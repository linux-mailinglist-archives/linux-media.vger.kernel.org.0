Return-Path: <linux-media+bounces-24653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA05A0AE3A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C9518862A5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F6919CC21;
	Mon, 13 Jan 2025 04:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UkJ9hM+e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0016F271;
	Mon, 13 Jan 2025 04:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742745; cv=none; b=k+H2GvjynZkLQ18BOitd2itGyodwOJ/P3kL4vMvvrXfXbOwdBDogbcevLH9bSrt6Qzh1cFBpcWjHxXrBFWPNRQHn6mSnmR8vSfBGufBCMW5j4Imml6wb9YUWq2D8XxmQ2I1NeJLpkL/CvsQys+ZTzJz3H/ff7xoi9azRAgefcww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742745; c=relaxed/simple;
	bh=6YEgkn2zWrgWn/WQx07M1LDpxfLc9wlU/HRnEec0DpM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDDUPYO4fA3GVfhT/zARg7yPM55RMfmhaEjj14lfXVRFA348HnFj8ql3XqRP06Y9A7x71mQPI2EiAFwA8xXEkidBN8eVMU7jFca4sjPSt1SipomrydTVr0cbuFDqmzUNxFZ3BB6GWgAzB2T5ol8WJbMigPqu2H7ftk6uU1oJtek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UkJ9hM+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNK851014997;
	Mon, 13 Jan 2025 04:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGI3DuGTeyJto5t7qEINgy9pkmUqcpRqzL0gzOeMFdI=; b=UkJ9hM+eI4N/La1c
	r91RBGuZtGRj5LgCijbMV/Dm42+bUWcKNGQ9dKVWRkTnqRHlf45OlLXvLawxvIB7
	YIl/gFM2LdbPI1CH+bK9qqP8cN0FhbgotehS9cDve4Kk0hLT6xv9cmFWGwD4ydMC
	kpqlab1fiwRfEzXDIZn3+lz1j4G/dItLWmjBdU1IJM7I29K3QjXsJhH0h4ebFfj0
	FMQgonJMFjWry0azwkUS78QtMcGDgycDvlBfh7ZYY1BOpeKPEEO1BJH0FJJGUn41
	y49ZPiGdlgneMIK9j+RmDVjWkMv1DX046LaimuNjCUbROLVXJwo3xKpMtHuJrWiG
	pV4qSA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bh34f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4WHHA021381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:17 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:32:11 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 01/16] media: qcom: camss: csiphy-3ph: Fix trivial indentation fault in defines
Date: Mon, 13 Jan 2025 10:01:18 +0530
Message-ID: <20250113043133.1387162-2-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113043133.1387162-1-quic_depengs@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: FnbBDmkIbsXDdmlARYB1PU9zCP3DUCcw
X-Proofpoint-ORIG-GUID: FnbBDmkIbsXDdmlARYB1PU9zCP3DUCcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130036

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


