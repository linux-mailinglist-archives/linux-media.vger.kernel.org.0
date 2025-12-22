Return-Path: <linux-media+bounces-49328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A6CD56DC
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD8D301399C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15415311942;
	Mon, 22 Dec 2025 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tbf5Wx4q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C257830DD1A;
	Mon, 22 Dec 2025 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397601; cv=none; b=StdBbb2Dg4ba4JHNUlfNAmt9LCWBjbf2sXsjrg6zEN7oBcOLPqLVUiBt8kZRrZN9o+qMr+6HhTSMkHr5vwrR50Xt5ypa55mQT0TzwKHdci9Gq66dpFBEjYw+aUf7Qimzmyoah0s2IOli0l4nyQAIW+lv8UdSPTmOHImMxCAoKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397601; c=relaxed/simple;
	bh=y2zvf8S7gYfp2F8RoVQ0LnOhTBjh2SAx0h0h6ZmEn80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=alNvGTBmzkkVy9J32+xK2PNqRjX84W91cS00xJNgSWn3Pxn0B87dT48X2cAPNgC7uIdiAAR6i5UupwE5ZFCFN8JX4HouEPXP2wxwHu5vOj2ixBvsb5vCNwIE38HKtsRfFAOl53rlk+N5PFBteGqtKHS9bw76J0ffS4FhfUxf02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tbf5Wx4q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8wq8e3962884;
	Mon, 22 Dec 2025 09:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGuTJwfFN66OKPst8uy87K+lOkYNI7LbJ64dSvoR0Kw=; b=Tbf5Wx4q8i+tOGqq
	mrOy+WjDtyvqLsJU9b0vqwoupVFRGMgUYD0hLZF941IUDe0rNoxoQPuus4Z+AueJ
	xiZIm0Yny0xwp/tlSRmIIcaQsVUF1I1bqePFpA9T23hYD+CxcEYxScKKWxRkL5rB
	pPZRv3+KqBIw/Ic2LO1Wa0o8pRQNzXibpf6XF6yzt/3N25mNTDoug81uLgbprNrz
	udw6oY5jz0rP4017PHTQnXg/PrZe6JRxJUPtP0KHRedXBYuZ1vNML1cOsSH7zmvu
	Yz9UvXq8ScFV0KRv/LYXho2nXpENa3IbwLVmQTBrk+VAA9hqvSLhR8lpvh0VXT47
	5Ea8MQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hab3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BM9xprY024437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:51 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Dec 2025 01:59:45 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH v8 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Date: Mon, 22 Dec 2025 15:29:12 +0530
Message-ID: <20251222095914.1995041-4-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u7JxKn6oG7ihmhNiFEF6iQAG0JscfQXt
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491698 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tfCBMw9KTM5U2-pTabYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MCBTYWx0ZWRfXzZcGNsGDBru9
 L+ejXK53X/awq7ZRy8PTp+NomkcuxJtTyNwauyv+q5CmWpS2Cp9yNl/AFkOmzrM497spfbMF9wl
 Ovlv6v/D2+HW2bcbsgxw+p9fe/Q58P1wJzSnYmC5M/YKWmrzdnjomeJEMfuYQIF8uFQvvrtGFCG
 pOzE5pb1tZ6u4JjaYq4kxlDD6Pd5UvUhUEsx+/KEllJyO6RY2PTYoeFOPNTbOLRxTOg//dC66wu
 dyUo//eVJFrq45jHFh7Ay8fECGKRFosXZihLqdW1AWvAiZPrOqBZUYNN+aepA6nVyfFBZUZgTTY
 R8YFlR1DM+6OwvMYBuLOm5YehT2wqF7e4525GEjaRbOhRFDc2kTRwIM1k2YIseK8fDMzVRLNhsq
 susTF7KYGMmFlzvrDwrBrshQqqq5bml/xJiNm3ltlOmUYBPgNperKd0rzs42REJe7bWPj3mInSc
 bevDUWzc67a2JjWSO1Q==
X-Proofpoint-GUID: u7JxKn6oG7ihmhNiFEF6iQAG0JscfQXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220090

Define pinctrl definitions to enable camera master clocks on Monaco.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 4b2d8a449b00..ace09239d167 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5182,6 +5182,27 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio69";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio57";
-- 
2.34.1


