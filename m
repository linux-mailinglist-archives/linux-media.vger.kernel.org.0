Return-Path: <linux-media+bounces-23766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29799F7418
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 06:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7C84161EB0
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 05:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA4A217657;
	Thu, 19 Dec 2024 05:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tvpytr4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A64217718;
	Thu, 19 Dec 2024 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586953; cv=none; b=kpy8krT2dwHblMXjpFA9tZFOrxgSnVoGCN+0+v18yKtKgQOLtxQpOIIi2aZqVcPSP8T34IkQP6xEHgl99r5GeFV7vV9EZqHfPlWHizF1qKWXfP09StcOg2JaIJp7ffiZumf7F6S6kG+v4tjRP5L4czsd56yE8nlRV5hUYJgD3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586953; c=relaxed/simple;
	bh=C0E2b4Hyps9Q/DWoHwWSfXox4cvkifP40WaddWc7jWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hu3yXYQem3KRp8P5xvDESpzzxRvsYSrblIRfcCNvFm9aU0yDO+bhSnGe4RdySLQpvP4Aiat/NYSc3wGEce0MJHsHV8cATYeFHZjljDUdXLxdOSqUHE/itSbWNGuzpnwkpTbSCZaHqoxVRfnLNVDChNVRKrNOG4/fXnnl/ICmESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tvpytr4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKCRLW013236;
	Thu, 19 Dec 2024 05:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oy/Zsd2bM+jXGQzD1FrhI+LrB+yj3i1aS/C+f57OcCA=; b=Tvpytr4YywK/DNAl
	Tdx/bNei9C9jHX8xowJMotdwwKktR1qNXdQ7QDQMpS0j5+yKlaayXRUWj9tk1+Ht
	E0ctKBf4DN061Wp/KH7CUViurQEHcI/oQ9vmlYNnrtVJCtnsNfDg/uCR1IiG7qpd
	3tWzoHLX+bW2KjCm+FMsW/2Gt4+FaxbchARtLXA2hh7isFkFzcJ44Zlu/ekYSznC
	THWmJ1+jKLdXdfuDewXYXvK0qnz4xupPzDXLA5xo/CcZWgJGlNIQQ/PqCEi2SY4e
	iEWay02+KnAlnkowZmkLDJT329MjeEQqMxi5xXhGmlhl7kCArpe9JZZzpW9Te2Jh
	EVZUKw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m57h11bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ5gQGv016144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:26 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 21:42:23 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Thu, 19 Dec 2024 11:11:56 +0530
Subject: [PATCH v6 4/4] arm64: dts: qcom: qcs615-ride: enable venus node to
 initialize video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-add-venus-for-qcs615-v6-4-e9a74d3b003d@quicinc.com>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
In-Reply-To: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734586930; l=721;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=C0E2b4Hyps9Q/DWoHwWSfXox4cvkifP40WaddWc7jWE=;
 b=T26Eff806fA9gfmDcf3V/J6oFK3XTeklO/H3zuXWiMIRJ7Lv4VwemrklSsjKKhhKL/Bil4LD7
 zdZ6Z9I0kDqAud8S7P43zuHY9078ssxZY52SdNg9Zlo3y5TAxCX3+oJ
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D4shSl5ElbF2GCeLUS60Ly_UJHnhh5DT
X-Proofpoint-ORIG-GUID: D4shSl5ElbF2GCeLUS60Ly_UJHnhh5DT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=643 mlxscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412190043

Enable the venus node to allow the video codec to start working properly
by setting its status to "okay".

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index a25928933e2b66241258e418c6e5bc36c306101e..de954ede27f0942397d982f9aa725e59a8de9657 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -237,6 +237,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&venus {
+	status = "okay";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.34.1


