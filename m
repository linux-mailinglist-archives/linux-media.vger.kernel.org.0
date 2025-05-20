Return-Path: <linux-media+bounces-32885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A650ABD39D
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 11:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39F6A1B65E97
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3422686BC;
	Tue, 20 May 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HTOny0PQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89E121C9EE;
	Tue, 20 May 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734027; cv=none; b=kYT5rRoA9eqcU9OBhWll8LfUKOa8w6abLnIrLeCWN4TecwIeCOzelsoA9Zph7WGHYmCBzUnsaIPa8apE0RYRaRLdXLJlrIBDxMVMCia3O25UbIQHzUh1CUjwKZkTMw3foaL82hK2gQNrWWlDSyLxgHqQ4wWHrRFqs3fWgLwDYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734027; c=relaxed/simple;
	bh=4Zqg9y1D4wtO3f7MXYXfgW6YWCxhagtCzvcbPjWy7lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=g3rPD15A+LC0JEV9N9phwLaMy0DZrzEm26RDchq2U0yn73XN7LqxcuYNR2A9xC1bA/ThSlE+H6TsfCfHgyS/jfQHFi/7uYVEHQcEI+YrRCUtZ+fhSZaXVOfSoVbyH+Yxas6RbxR3DKFMjDYH3Lo+/xPMZF58FT3HD2kINyBn+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HTOny0PQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8XOXu006521;
	Tue, 20 May 2025 09:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p2jw1Q/PYSxJiHCLXnQKKV
	XiMD0BcVsnN56vuABQOPU=; b=HTOny0PQJH+ywEVZiYW9HVR9LHZalcm1Y11/t1
	XhQFa1tnIsgYX4AMNoiZ++/iYTdx77GKRJ5kl7yRr3w5ga9rrwkJcBxYe03woMLI
	c7le+KXTFtKT3UMVOAgH8jlPZlGkqoresc4yMIXgPUx5RX3zTO5nusrF/2uLpEDX
	Qjh5N9loUnUO//DXWi0x4sdAmqgMYnuLBSFyMKPe/0PVSuc+KYox6INUxroROGgX
	sGqFQiIBT7C3i47oer6cBAOgUqfKiSwi3IDtL9kMbfOJBWcAvpRLwZDfEqR8/xzX
	BKQoWYjQti/KVPVbtDjFwAqsMaOJie5Tuz0oOoJV4azvOCng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsy5u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 09:40:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K9eKNW024917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 09:40:20 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 02:40:16 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Tue, 20 May 2025 17:40:03 +0800
Subject: [PATCH] arm64: dts: qcom: qcs8300: Add support for camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPNNLGgC/x3MPQqAMAxA4atIZgsxpSJeRRxKTDWDfw2IIN7d4
 vgN7z1gklUM+uqBLJea7ltBU1fAS9xmcToVAyEFDITuZOs8ouO4mrmUmNAT+zZEKM2RJen9/4b
 xfT8T/O/hXwAAAA==
X-Change-ID: 20250520-qcs8300-camss-ffc2032c365a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Wenmeng Liu
	<quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747734016; l=1226;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=4Zqg9y1D4wtO3f7MXYXfgW6YWCxhagtCzvcbPjWy7lA=;
 b=8X8C6ORMpROHJ2BfJCG4w/FbGBaCNDtleLgEEqlp/KsiMI60i/N2Ip9udEEgCVDuFWhF9IAig
 OKjzdSRmadLCOndnI7un546afb1INNUNY06LZpAbITsPp8COIFvx7ds
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Jhi8HQRFoZAxe7pYZhc4sjOf6NYj0Hjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3OSBTYWx0ZWRfX+MSx1s8Wtm/D
 En83ys5ersY88ukiIo4qiLaWTl04ZlorKyb9Ad8V2cAjaBwXsX6Tv071JFpo6eebVJXapXXikFF
 KAA3VlG4dLRVEq65uKoQ+oEsI47gflMby9QsgYEYpFT2vZEQSjg/M8/dBNxZRWg3GjIF6ntiHbU
 rcpYa0DxPlOL8Obmr/sOfc0WdLKjaWn6+Tqfgbf/eE9ayn6hNJjuSK5Xb0UKBGx94L+ClAORkBu
 pmj8z3oPqnxdxiuOSt9Ydtcg803DobOlNO8vvH0LDEhCxs7XcYoDcnB4uQ1HPMyGE0Ee5ImYgyG
 eVTo2DemZeqSjrVBF83K4tJEfDMDseJWH6jQ2E29LRFsOMqzS2DiWwJfhrRT7fyCYEBNqvcs+4y
 ygUW2wTWTdYQiyoMcs8VRf2wdQYQuhDubk6pLCr3KaV+n478mukPgWFv3tEXI4A6zzGiBagn
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c4e05 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EnCy_5FHAvOwJ-fuopUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jhi8HQRFoZAxe7pYZhc4sjOf6NYj0Hjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=525 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200079

This change enables camera driver for QCS8300 RIDE board.

---
Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
This patch series depends on patch series:
- https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com/
- https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-1-3f76c5f8431f@quicinc.com/
- https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com/
- https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com/
---
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 3ff8f398cad31a36fa46060855b075c8c2020aa7..97281d6d7376a406e5c31466e175358b10441256 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -207,6 +207,10 @@ vreg_l9c: ldo9 {
 	};
 };
 
+&camss {
+	status = "ok";
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&phy0>;

---
base-commit: b16751cc36fc42deedf4726683423e19939c1044
change-id: 20250520-qcs8300-camss-ffc2032c365a

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


