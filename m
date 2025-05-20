Return-Path: <linux-media+bounces-32881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155BABD287
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B42A0188A735
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16268267F78;
	Tue, 20 May 2025 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jFxpxgID"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A2267B68;
	Tue, 20 May 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731452; cv=none; b=B73O5K12+rycMj1ye8eAp9KjEUDeOmKnBDGiQj8uCtw9UbPoHhvzADHDUcTzoTkBuAQzNtKszRgjiJZkvF/HkB88E7R0WYZLN+vUdur/d+RSPdksHuPkKQkYnyVFFMryVfOlVedHd7vQeCs0LK/evr7g7onxJgqlUnLIFlAleGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731452; c=relaxed/simple;
	bh=JJuiL47otzbbsIuzp/oAX3FaUVr4ch28K0JiDBk+f7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=da5SF1MIWekzohImNCzZTTxEu3BKaRTbZs+szzkuTcg19GPtXDBdIXSlkCgymvGwVqzufSAtEyubzgp5JC7qZICMTa1qohXRbPp5oBv6rWv701+0ko1nldi9LFGYizoK0mBj93KTcT+zffqPTCXcmyCvVO+SFfhcL3asLD9aRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jFxpxgID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7cITx023174;
	Tue, 20 May 2025 08:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIJ4kYTM8PYYGYAwguMJlgYXVvQNZ8YTtRUV3ZCtc1k=; b=jFxpxgIDvPwrEONW
	WjIcnww4C8He5ww3Vv40UwKQ06PDlQfKfbqLrZLhyO/4C++/4dnt9ZRMIXA72HM0
	PwIc8/SnxVZSh1OxBibwpDQjuQqILn82KXVmMtqHXQdGAVAC11NVFG02Gy4kAhRU
	t5YDErVqqWmN8YfBcbQarbTKeZvWgKtuXrMxxRVgr55AJT56FFUOK/F84sJ9vvCo
	+T3rP3Ht+hd/neD+z1t94UJC/6mIKHZ7+ImmAVZNUg7OQSiu/MsAvl+nn9TE8KMN
	8STW2kCrcArtrxcEAkMbR4QH18bAQ3L7IIh/y5PYcTfCm9Rerw2XaX06ROj6ZwnK
	lPuEcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d39yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:57:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K8vQon019947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:57:26 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 01:57:22 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Tue, 20 May 2025 16:56:52 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>,
        <linux-media@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747731434; l=760;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=JJuiL47otzbbsIuzp/oAX3FaUVr4ch28K0JiDBk+f7U=;
 b=2TXxMEmZkLvT6TS7e3xnMqGK+N1KgdTCzP16FBSV5/Wfnh3BN5snLKEBPBDsRzLVH8AlYjMU5
 WagMVNfBtmZAKekP5B8mNwaOcB6fn7ErvXe1Qfxzo4MOgOSBNtSwAIx
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MiBTYWx0ZWRfXwkTUFBHPkIBP
 S9Z9CFLq+LJXb9M9j1lUIJ79QRSDz8xds/5fu4IvMvyAne2EFs7i7/AVZl1yekHFPk6a9HQQuf+
 jemgFN2Y6wMnQMHmHKpUeeFwoMkHc/WsYowbUAqBjFyk1w9rxY4qhPDW12f7loqwZXRFZcxj/5m
 cQM3LUvneGWX5gpVmY6EJ13sFRoimH+qb7s+dLXIpJa6fp6jD/tqjyt71POqM1QiUh3UF56+3gp
 EzoQTf0rqGLVtDLTmv+9BMQUn42zVasrI5GTo6i6+wcnRQHaABjYjY9wYI+u8KxShT4uk/jWRk6
 epaFNxZb69xUCI8uVgnQ64craVTf0TXTiLD37nGQJe8D8HgZapjCFrvx2jkrkGuja5+LJWC10Ye
 sO0YA03mOaegt2qPntYuZWJu/nGT2vqZ6aDVsCDGXHPRnmKMaSwu9cbImcw4grs/q+P2dP9j
X-Proofpoint-GUID: hS_jM4QrnJTR1Hz7QCr-_wXEsaz8hDdN
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682c43f6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=DD1ijYisUoa9qVLK_oMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hS_jM4QrnJTR1Hz7QCr-_wXEsaz8hDdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=696 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200072

This change enables camera driver for QCS615 ADP AIR board.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "ok";
+};
+
 &gcc {
 	clocks = <&rpmhcc RPMH_CXO_CLK>,
 		 <&rpmhcc RPMH_CXO_CLK_A>,

-- 
2.34.1


