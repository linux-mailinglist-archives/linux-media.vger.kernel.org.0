Return-Path: <linux-media+bounces-39748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF26B24358
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B550117FAFA
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07C62C3261;
	Wed, 13 Aug 2025 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bpQP/MOo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A082E36F2;
	Wed, 13 Aug 2025 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071634; cv=none; b=hWVzXCSsExfXfN6NI8FTttYPY0NNWFO1Hx1l8oeLy32//5ZSxWdN/lGLvq6/LvdA3KcqN6Gj8msdwCK5sTksxXUoFR2UVphqsOqIwV7LvRWPFCGSbxmbeb7jeYSBrN/nEUIgjebQgxHrvyCSTuCApreyYgZgGOYD8X+EtpcgkmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071634; c=relaxed/simple;
	bh=+ZKe1BOixJ/T80IcjTZOqL2H41Ct+rhNJSOCcroFnaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=WYtCNa7aoRa3eeAQ2Q6zE6tK6bWCR/NzGhC67l8C+XnPYkfycU9DM3GowIhAEJI3X1ptLuocpNaJoYkO4iuexy1hV8dMvJ39PfETFwg6PHB+1Z7YbWJXH4EDVTT+dDoZwGkHoUmmD45qSmuKdeH6S0A+A4g3PrVEUHGTQyi7oG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bpQP/MOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mhwe026809;
	Wed, 13 Aug 2025 07:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GtVPQO0nwKFPcGiaywgQA/
	p6ZJu1iypkJEIbQuuw4ZA=; b=bpQP/MOo3yRrMFA2A57jnkNuazsVFdemkPNiiQ
	DyY1qjEp7xxHcY7UWjh3acPM8JCmZ/qCiErhrsEi+9L9fa/eIRxyoNZvp5rccceg
	myM2FhV+PJXG9xnQDIsq3RdA6RH+ZSNZ/JP9mlknwjQZ9UPqDdeCo7BupUz+ze1t
	AalbV24jLHCJXjcBLvuFt02/5Rd/+YRkvWvh1y+2RyMxH5xYcjb5QXUWu4z3QSzL
	OGUSpLTYCycB9msqOZoic8OpuHDG3VgrcAtPoJ2KRKFDKm7GOXeNDaL+3kuWsWqc
	cdOKNvvLSkdN7Exqdtoa8dP7i1Ljn//cx098NLf1D0Mfp/ow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9su6da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 07:53:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D7rjCg002007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 07:53:45 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 00:53:42 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 13:23:25 +0530
Subject: [PATCH v2] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHREnGgC/42NQQ6CMBBFr0K6dkxbUqSuvIdhUcdBZkELraCG9
 O5WTuDyveS/v4lEkSmJc7WJSCsnDr6APlQCB+cfBHwvLLTURrZKQxrbxkiYwosiJJoX8kjQ8xt
 uzjqrpW11XYuynyIVvbevXeGB0zPEz361qp/9p7oqUOCMolNvLZoGL/PCyB6PGEbR5Zy/xsNZU
 cQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755071622; l=3451;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=+ZKe1BOixJ/T80IcjTZOqL2H41Ct+rhNJSOCcroFnaQ=;
 b=1XtNOMWJVGhKN67HtmloY5f/5o+KsDu0KGsFBqpURMAXektsqzvA7SJGDFpRrPmIvoxPWf+ZB
 FjKyKXTGIWPAO2Rk6OajYyRoY/5dkQ03j1V3qVMzGRXUoJrgnPfpyiv
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c448a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=4jNVkGc5x75itkM4wVYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cOs5ibgnVZPU0SXTbdp6-BV5lamZt2W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX+1DKYAykTviI
 Le5qEokqnNow99GjvlBwPcHJDM+L3pc8LDuqaaSH3vYhNPdBbECVuFqd9dAl7x7PH74CrevaUut
 21kjZBvVrNPV3x0xXa4fud00lwWjfLpTlZe0RkXVRHbx2+TiFRn1NSzeWRI3G/+NzAcKOFaY0Ga
 Ozv41fNtaEGPu3do7ywV1f6gCsTA5HLPlAZdo9RdjbM2XL8dMKpNbXXJBYt+NOxHTZ5sy2QhD1/
 J0SaeR24H3DPmVsF9fdSqyl54UfyB6OK9bf1DUXvpSm3lKfTKp4ZWQlITKV1Hh7IBiwhGVmd9i9
 SJl2QAcowKFITkUE9SZ5Q1Uafr1wuszjJc5uTRterNe1A5nL+5fMzKIrjX4WO/osT6idnf1iW8S
 Jc8DUdIX
X-Proofpoint-GUID: cOs5ibgnVZPU0SXTbdp6-BV5lamZt2W-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
reading the LPI status register. Introduce a handshake loop to ensure
MNoC enters low power mode reliably during VPU3 hardware power-off with
timeout handling.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes in v2:
- Restructured loop for readability (Jorge)
- Used defines for bits (Konrad, Jorge)
- Used udelay for short waits (Konrad)
- Link to v1: https://lore.kernel.org/r/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com

Please note that I have not added "Tested-by" tag from Neil in this update,
as the NOC handshake loop has been restructured.
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 30 +++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..a621878f02f7196de29c9e290a6c5acea34eba8c 100644
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
@@ -128,13 +133,34 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 			goto disable_power;
 	}
 
+	/* set MNoC to low power */
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	do {
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
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
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


