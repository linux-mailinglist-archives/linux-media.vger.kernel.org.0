Return-Path: <linux-media+bounces-21920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABB9D7B44
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBB0BB2233E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E369018BBBB;
	Mon, 25 Nov 2024 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hAH0Crip"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D829116C684;
	Mon, 25 Nov 2024 05:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512931; cv=none; b=MW6OO2F5RDy6KoD8ww5CjDigl4YgFco+q/t+3mt01uUYV1Q0CCdZVmkUleFjS1Pm1pgJ4s0dSlK8s9kXptrede2tbAgP9wWA1Q9SbyNm43ytBHvyebtmgdAIsTxVtQJLdH2Wn/4xMYpPGr6knj5LREup4lcK/Jhr2CMwdeYUYI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512931; c=relaxed/simple;
	bh=HYx2Ssi6G4xy4zmQ6EwnKL/0RzrjW6bmidoYIfWmtWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ufV8fHLkmTgbY6w5iHk8gS2IgAfk3O8mCZgLTGD8VjwnpFq0siTMKC/IBBSFe9ImRvL1vaaDrD1w4pgVENdj8kmIK2RMVokGF10AfnfrjP/BF9NN90nZ0lDWCs/V/3lILVnAGQSeemc5Y+7QO6XUwYfmsCNphjWy4PKSobpzt5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hAH0Crip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMZO4k020756;
	Mon, 25 Nov 2024 05:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNH/IDTZxakgrflJYx1y1/z3YZ9A68RzinyXpAvjJxI=; b=hAH0CripofPC38xM
	gzaNG2Ig2T63s1kWhhp+9FoJppXurAptopq6BZpvLp0TGvzBRcNSCVgEbA5oKyCn
	uKbn69G34gMmkPo2+DfDS5yJjl0xFaiSgPgGlLgegyAc5hmWd3Pgf5abQ6xgoGTH
	Zh7hirHtHogq5vnOglAROxp7HiqOENsh+6XZF9COtVHSBUMudAngxSC9WX6c3dzk
	oEzQSfLny0AUJDAIhurTq3aFeEE1UAj4+lM+gk9FA7AhSFYj0EC/3hhuC24cp5XM
	pK1iNjMlRx/OcQazJ52c2sDdbAzOKW3r3UIyNhs/UW1VoI7qLPxAkTMVtZe+SIQX
	/qtAGQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43374sufjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5ZOWa018472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:24 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 21:35:21 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Mon, 25 Nov 2024 11:04:52 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241125-add-venus-for-qcs615-v3-4-5a376b97a68e@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
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
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732512906; l=668;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=HYx2Ssi6G4xy4zmQ6EwnKL/0RzrjW6bmidoYIfWmtWc=;
 b=3jajviKSSSszhsJ/LR9IyfB8UERuCTaioHgD+J+2TJwv6fF50g41pPN/yDIEbYGNqKCNgZmOp
 S5W5NlZDYugC9U+3ZgxCWrzSikgkaB01sTG5rTD1z54Q1RqU4vppPSn
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F7U5v374sGcJ6SKYIaMY0MBsqukLujYT
X-Proofpoint-ORIG-GUID: F7U5v374sGcJ6SKYIaMY0MBsqukLujYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=633 bulkscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250045

Enable the venus node so that the video codec will start working.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 4ef969a6af150933c72a7a83374a5a2657eebc1b..4a7bfffb7b86b21c412b16426019c9063368ca19 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -217,6 +217,10 @@ &uart0 {
 	status = "okay";
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


