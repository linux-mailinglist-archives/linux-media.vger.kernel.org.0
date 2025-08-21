Return-Path: <linux-media+bounces-40554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCD9B2F5B1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A25600F1E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B683093B5;
	Thu, 21 Aug 2025 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S0ArPM2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D307136358;
	Thu, 21 Aug 2025 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773705; cv=none; b=kFnDW6OtKICyr3GBryF94kdZyVpzKZ4xAIVYEmKEJ/stMD9xMYG/QnvBTNG+8eAB7FV9lwkzwdS0/XWsKdXsPqbwLSQwsmxIko0uYkDvhQrZJw2Feg0RJ8PeiFsI7qDWDdSBCVnbouhQClk97dRag6HUxe0pdoVah0jA/t+O9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773705; c=relaxed/simple;
	bh=EzZGFVJmGW+nLEFTqfxEyqxomlQCZpDbIDjo2NvlZ+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Lhg7iURdd8wjS7IBY8+KYzeHM4sh/bbN/OK3dYYsQtM3RwqbT8QM8Q/PJlzo29ovNzK1s4rHg5rJ0NkrLLWpWSI0k+ZN1msRKdcNKcp6M9FnE0FZtSL70ONceoX0H4F9ieM6HB14NJDVNwXc479D0mwx1vikQGSrgHBAqZKKtpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S0ArPM2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bH2V012873;
	Thu, 21 Aug 2025 10:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YdZ/G40cAkUHSdTe/eyASm
	AyBduCslpZKVJTTY+tP4M=; b=S0ArPM2iUh8QqbAuKyc5VOVcr7VLn4wtP8eFjD
	S3B9H2dDEp1yYSUpb9GK9zOjB1LjsiwXika19nudMsWxCy1JWWfbMNEijSuDg6pt
	AGKXY8RYp8aaMGclBejTblMMqDacffYzLqwRCWa9qDTzacetJUb+phznTBHnC1qY
	IR8PWs6aa6gSNez+yvrEIDgFuVbbomAkD1UgstAXn8KOC+WGm/X4COawtZ1HzWu6
	UVEXe2Sfq1SG+jq8hTaDuuzZVp2KAAfM5SrLCdNs/h83tXsRDPnnfXhQ3OmI9615
	NfHb3bWD63+4e43gP6yeqLM4U1DX83Y6lTPBu0B6xHmKiHFg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8ax2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:54:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAsudN013038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:54:56 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 03:54:53 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 21 Aug 2025 16:24:38 +0530
Subject: [PATCH v3] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAO36pmgC/43NTQ6CMBCG4auQrq3pj0XqynsYF2UYpAtaaKVqC
 He3sNKNcfl+yTwzk4jBYiSnYiYBk43WuxxyVxDojLshtU1uIphQrOKCxr4qFaODf2CgEccJHSB
 t7ZPWRhstmK6ElCTfDwHzvNmXa+7OxrsPr+1V4uv6j5o45dQojsdWa1AlnMfJgnWwB9+T1U3i0
 5K/LJEtjQ1rQcBBQf1tLcvyBklB7LoQAQAA
X-Change-ID: 20250812-sm8650-power-sequence-fix-ba9a92098233
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755773693; l=3678;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=EzZGFVJmGW+nLEFTqfxEyqxomlQCZpDbIDjo2NvlZ+s=;
 b=gaZveh7v0DrlbkFZsrjK5QSwjPaS4n1EZxiiYs/fe0P57Oq2tsZklQylQLwpQ5mE9+65dZJNq
 jToP3xfSyaOCGjkW6ErJD7Tm4voAfpDKdp+PNGX0SL9BFQlHA+eb09v
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX7OWL//U6X+Ac
 nkn5bUzj0iabW8XJ/tLr258uBFlznFDaantQlm5jyqzaIWO1tXX1YpCrz9X5f5sPHzbird2cV6X
 P3v7ms3aro86HaU5SQ9cPx29zZYU0Qf0PTEAC/oh/4zDBjZXCemBkbhGobLj9QNNqr9uAB0rwVL
 8WNxURWMXw0maGZnn83yyJqR6VRNWutCsRgR/DiQVwNlyAt9djiNZqr45za35zswAqo10T+uL8l
 L30ZaLLqahZEc6+M2JeSB7ZSa1jE4ffWdmOTt5KDIsVXqNeAOziUTJts2YAB9uxBRjXREQjnAdj
 sF8rn2cE4rwvka4zJ/9brIjh+5vomFQaaV1/t3g01FblU6AvJ6+0MdqmaP21SlJqblopQcTFhLW
 TYYgl/QHZsnrPK/N2KdcGC8hxfjUiA==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6fb01 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=4jNVkGc5x75itkM4wVYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: rxSfK1VWe23yg0zefp-t1u00R3sY9vX9
X-Proofpoint-ORIG-GUID: rxSfK1VWe23yg0zefp-t1u00R3sY9vX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
reading the LPI status register. Introduce a handshake loop to ensure
MNoC enters low power mode reliably during VPU3 hardware power-off with
timeout handling.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes in v3:
- Fixed the loop to capture the  success of the last power-on command (Bryan)
- Link to v2: https://lore.kernel.org/r/20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com

Changes in v2:
- Restructured loop for readability (Jorge)
- Used defines for bits (Konrad, Jorge)
- Used udelay for short waits (Konrad)
- Link to v1: https://lore.kernel.org/r/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 32 +++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..bfc52eb04ed0e1c88efe74a8d27bb95e8a0ca331 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -19,6 +19,9 @@
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
+#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
+#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
 
@@ -109,7 +112,9 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
 {
+	bool handshake_done = false, handshake_busy = false;
 	u32 reg_val = 0, value, i;
+	u32 count = 0;
 	int ret;
 
 	if (iris_vpu3x_hw_power_collapsed(core))
@@ -128,13 +133,36 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 			goto disable_power;
 	}
 
+	/* Retry up to 1000 times as recommended by hardware documentation */
+	do {
+		/* set MNoC to low power */
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+		udelay(15);
+
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+		udelay(15);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
 				 reg_val, reg_val & BIT(0), 200, 2000);
 	if (ret)
 		goto disable_power;
 
-	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
-	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
 
 	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
 	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);

---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250812-sm8650-power-sequence-fix-ba9a92098233

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


