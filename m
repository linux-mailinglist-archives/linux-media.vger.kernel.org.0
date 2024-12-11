Return-Path: <linux-media+bounces-23197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102F9ECE11
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 15:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C3D7163471
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B28236951;
	Wed, 11 Dec 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i7PZBgee"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD1233694;
	Wed, 11 Dec 2024 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926131; cv=none; b=Q8r83dJexdMXaI4LrHN+ndM2VLgWSd6UUuM6DjMxWHR7QzRIXsQIR+cGU5cXp/oABXeJddUgqXyl3Lxux6MwRlI15auZOo30zntdjH75aNqfEhenEpSEFd+ekDHITPZgSnsB/cWJOp3hf1LVzinl0dQn8sR6RLTwQTZaLUvorZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926131; c=relaxed/simple;
	bh=9TmYt5d2xZBEkmWsvz/wgQFgY9NQhV+ZwH2BfhlzbMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHCPvCz+tSPytak623R2oiEBiOsrVENijH6lUN/o1q54uoht6FKq739Ch2vUXx7u3RRsns0K2/BIsTU/Dk4j1QFnV3hZtow2Wz4IvFtDXYdV0VRHFcrg+b/9VveT8W8lYRnjh87oq9xzNlXiesAanVtlmJRS3JeFpUqRmAlweVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i7PZBgee; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8cqJO019383;
	Wed, 11 Dec 2024 14:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgLNBIJwcg5803xnAbGZuX9yCWhENqVHLF3QMWbcJ54=; b=i7PZBgeeybaT3idm
	XbF5k5UNkY9Yl5siGlNAKwkDo19RexydITqLsG0igQDIsW084rbHvRj0J4YS4s1Z
	7oO1cAS7C0iHWGhZFjxWM6BEt1g/CmM6fkQmT2pTg/WEQmqs4zP5QsHSc/2MZfAi
	6l2ABCvZ1fHmlEG1O1R6Ab3fnyyektKRoMqV3oY4LWrybVq8BiliQG32o4wsVJjK
	Mp+KzvNJ2pEEUQujyawlu3v++TMAn8/GNcsrIE323FgbJm8dwkWtckIb1bWNUpRs
	e7ICMwNHg6t6JcOVzOCwpYfNhQ4PLGNzuPjDSmcA9DvOuFPU4rrTPOs1MN08ViNV
	fUo5Ag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dph094-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:08:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBE8heG019550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:08:43 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 06:08:37 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 01/16] media: qcom: camss: csiphy-3ph: Fix trivial indentation fault in defines
Date: Wed, 11 Dec 2024 19:37:23 +0530
Message-ID: <20241211140738.3835588-2-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211140738.3835588-1-quic_depengs@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: NggOsyvCF5NPtNGxkGHaq6IX8bR9v8-y
X-Proofpoint-ORIG-GUID: NggOsyvCF5NPtNGxkGHaq6IX8bR9v8-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110102

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


