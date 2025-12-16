Return-Path: <linux-media+bounces-48847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18128CC1224
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A94B9308D46E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 06:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882A633A02D;
	Tue, 16 Dec 2025 06:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B/POJeVL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEA2F25F2;
	Tue, 16 Dec 2025 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866205; cv=none; b=tka76Ofhcw8WY2f5/+jfc7Fvh+AQgoZ0hDqTvTwotCXGY1Hb6TdbviDjRxB/x8WtGJvmT5YS34FinGitZV7Te+kL7H00RSQj7/naHV80dIZflu1ukVPr0VJ7U9HnQSDTqtP96Tw9g9ofhFmX7iJjVUqZnFsoqaMAU0xPlkp0pi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866205; c=relaxed/simple;
	bh=bvm7Nb9kS/wdMJOxnSXxeaWxjc1ZnTPFJiI7nyOAHRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWTXLjZTNvo0zM6DPEm6i93Gi+CkPtSJ4ZeO3de/fR1mWYsG/VD0SO+AasCu6BSVptlCvt7OmkL/LZD255jPmPIkvCBVolQ1VRhS9RsDqZfpeIkNR4c5aW7FX8d11VneibJa8Zw4Rpvv8kFr/1tdZvUg7MjN2c0qIWhTpNRbeQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B/POJeVL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG65Pns4174108;
	Tue, 16 Dec 2025 06:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDn8E5SZH3haG+EaPJnzeVYGaSLQewkEDM55mF67Wt0=; b=B/POJeVL4Ajb1tNL
	W9lcWXc6l2yWgQJelk4j07TxMHAZQCIQEHgO1PqTuyd4ZRkzSd7p61F+d5XwHKxg
	oFT9Ss67Fwul2EBBlVYyH2wzl1I2F2cdZo2ZeP/caRdI9qU+6jdFIZ777EWEUXoS
	1FjmqOEY1msB2lT+b5uukYrPocOEu+ZarBMlR1TldoXqnKvLYBKpZ4ilJvNvAefV
	IgB7sWMaJx/ON+5Rr4BGkFI6Bfx6zq7VULJ+tnxhiPKNMEoerLYyqHM2Dpu9ollq
	0Tw+WSLQcF9k2hKL0aDr1weIOEkFN9w78nmTl7GbzIiFpXwHEBxb8SJRh9YzhZeR
	YUQatQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks03128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:23:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BG6N0io006345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:23:00 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Dec 2025 22:22:55 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Date: Tue, 16 Dec 2025 11:52:21 +0530
Message-ID: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dYDLD-P3gjbFYBgOwMe2OcwIABh21Mkb
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=6940fac5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=6Pri4IUzgJ4UHTSCBaEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dYDLD-P3gjbFYBgOwMe2OcwIABh21Mkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MCBTYWx0ZWRfX6CFFgsrB2xPE
 nRL+jBo0TQQlnz6n8HtVLrTp0BaLTqix7g8wMBPBhAaNkNjYRXlmqf+MIvnlHDBSKWX/At+nHk+
 jDlHkKtkq00UyLjmCzGHuIxcmEFDYgM0hGaOQa2tx8uPtkHZQsvOwfc4OhoX3CBko3CFD6YkS7S
 SIA3vC35reApIHeeTmqLQBPN8eJWu5UcbQpdhKkJPrmkXYupDege3pCUaJgVtr8kvDg8kBtT7Ut
 ANWBRXacQEhGh3dqP3NHSwFyKrWUuiVqeL8Qe310V4G2LfU6lxm4ioLRoovRIBFGqyuDDUiYj/P
 A03IB98cH7N6P5oWk7fwHMFq3QBNurDhlreIBs/k3+Pwi3sumvAKOshwsk/aQQ0ayKV27c7jqll
 EnvY1VnYAb8K7U5pZKfI56YpIOPbfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160050

Define pinctrl definitions to enable camera master clocks on Monaco.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
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


