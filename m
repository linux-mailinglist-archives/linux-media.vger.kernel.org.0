Return-Path: <linux-media+bounces-23554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5AF9F4753
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5428416F497
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7173D1DF260;
	Tue, 17 Dec 2024 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GcY/GBpD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2901F191B;
	Tue, 17 Dec 2024 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427116; cv=none; b=AacBxBdECr02qiTs+vB4tgolLfQYOZvCKxjF4P1fTCcnd1ucU4w/o37OM0u0cJDJKBg/4rEB8CxDBXCZtsN7HZJM7pezGLt9bLTqorYoRfgl+xT8i7Y7mgWT7sSorZX2JoG33I9855jQBb1FTyXbvl45989p3vlKZh9EXczEDhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427116; c=relaxed/simple;
	bh=KwWEWFCB5ShOc5u4wAgQHgytmXEGoQcKusA3At0d9GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jc9TZq6Ba97tjgmsaiCKg2cYCLXnSPHnssRmwq4kTkGFjMlsE0uPH4XurBBLni+z3PmML8svJ/952U7FUDHpxXYUqwTRPPOLW9ancd8TTrE7t21DitCXbGP2HnFw/En9Rt/AYd+12cN3EXj3FKK2ZSnQQo0l2T/F8JJID9m36rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GcY/GBpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH621cr005088;
	Tue, 17 Dec 2024 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SElXYnGf35AatXlxXldZcr44qubrPnAWZUpZmhsISg=; b=GcY/GBpDczNloczL
	1IdYxG487S+pQ2tdgv0KEayw5PpRCMDREuEsGU3dMX7UpCF6J00/Rbu4OpIefidP
	r/B8A5nflA0DLN9Wl/oljpTj4rVReoCfto+vFiDdK9Eqy3h2nDY3VkFUrRce9opT
	N5rCIgYN0fsY0mW95dcXHu2TQCnweBoo8X8RZSE1jJRPwLopDCYBXn1ss3SNw++w
	DtPXv5VrHpAefTW6zafR6wx+8QKpcppVBKxXyyZXUVIEj+FStk6WsGqrpkvW1+qg
	/uel9FkuU3luzt+ppCT+zjl9dGxmYqECVzExAbayd/MX4hXEzM/CdxJMQAeaUsfz
	iZcNwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p48gua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9IUuN030732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:30 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:18:26 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 17 Dec 2024 14:47:40 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-add-venus-for-qcs615-v5-4-747395d9e630@quicinc.com>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
In-Reply-To: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
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
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734427092; l=680;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=KwWEWFCB5ShOc5u4wAgQHgytmXEGoQcKusA3At0d9GU=;
 b=QJ8jF8iRgBWFTrXH2AF0r6CEAkjxAAOXeXpwsKd7PujbkPCXa+LCIBI+kM2Mb6hsjfAuiAGHj
 v5CV9gTDV2RBX/OD2fLRQaLzKIMT/LtDiM4zMsx+SCahqBRuXAetRVU
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H2HJRaPB0UKEuSP8Lv79mXHhTx9K2iS7
X-Proofpoint-GUID: H2HJRaPB0UKEuSP8Lv79mXHhTx9K2iS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=557 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170076

Enable the venus node so that the video codec will start working.

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


