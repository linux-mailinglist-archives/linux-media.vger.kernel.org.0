Return-Path: <linux-media+bounces-40715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC216B30E53
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14EE9AC5175
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 05:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75990296BAA;
	Fri, 22 Aug 2025 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JyXKE16e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B16433AC;
	Fri, 22 Aug 2025 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842030; cv=none; b=brOKsvz7IaVOpPLNo5//jveTtv+kW3Ay2No3GlFPcG2FRzmW1QMLbSx1oFSObNlhI2Z5+/d8w1W8G31SRLhKJ0cEQllEGbImkcg8vT0gAKUVljyw+BBdBEeJyERezs3dtYRIY0+IvSaRX2D670qaUzSXxfvVzFzUCSjP029gEX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842030; c=relaxed/simple;
	bh=c9WJsWaGNUFYZCfPMuakUC2AuRlRWNv+aDPUmdh7rBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Ux0/BzUu0Nns3g3uLXAvkqB4venj95iLBgQro1s5NDCJirKOaw77EC6C8w2isbwHuXRbbcf6s8A5RHLne7PXZI8I5T2M34to9jHGsGltq85BjjhXffAP50snZDTJWoCTDfb1YENzqwsiMUycJrJ3kvwMBoe5XlXzJIor+NS9Q4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JyXKE16e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9GfE002743;
	Fri, 22 Aug 2025 05:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TivjgjuKQ4ZLa6o5fHO7TO
	9+vNk9/33184c0LWa9Ccg=; b=JyXKE16e0OPOUvE+ui0P2dViqBuNKNL70qRlRc
	ownKHsyZrElNYJZBlMVMXz7lEYr0OMnDd/1iOX4aHcugmgqNqp5CL5Y1iqPzU6HW
	tOOoS3qeBZVPTT3IT/h/3oDz6oI9RF56FDCCXWguUZ/y59wFaNmIjn9jQ3aXYlSZ
	7+BcsxWxhCt1urHqXMemVHAMOtjLYiqJ89nIKBa4+KOxUt3oGlKtFvpaKV3LIBPZ
	hfB4UTtru6OUAfRrbFkxTu7xzO+ISWn9GLLq8btw+/upGd6eo5/je9gjZdRYucaM
	4kcpHgv0+AKKqytZSGdXTO0DcHhtJIippNcfxoc4wGZavLrw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdntdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 05:53:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M5rhs7021027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 05:53:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 22:53:40 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 22 Aug 2025 11:23:30 +0530
Subject: [PATCH v4] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-sm8650-power-sequence-fix-v4-1-e3d587e1f9e6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANkFqGgC/43NTQ7CIBCG4asY1mJgKAiuvIdxQadTy6J/oFVje
 nfRVY2Jcfl+yTzzYIlioMR2qweLNIUU+i5HsV4xbHx3Ih6q3AwEaGEl8NRaowUf+itFnmi8UIf
 E63DjpXfegXAWlGL5foiU57d9OOZuQjr38f5+NcnX+o86SS6515K2tXOoDe7HS8DQ4Qb7lr3cC
 ZaW+mVBthxVokbAQmP5bamFBfKXpbJlCm2lKb2yYD6teZ6fk5Nb/lwBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755842020; l=3964;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=c9WJsWaGNUFYZCfPMuakUC2AuRlRWNv+aDPUmdh7rBE=;
 b=NeOlaN3mnM0k389lQxCDuvw+ghkiAUEnAnCVR5wCgUme9B5KkUjwg00l4Kq9N2OqNstN+UU1i
 X2tLlVzNx/bCu8Af/RRevrJ7F4mmngdOeH5thzvS8t/mMHz7oR0LMuJ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a805e7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=4jNVkGc5x75itkM4wVYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 8UHiWJ3dz68tugddcvyEwb1NrBD461nX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX810tJ06RMFAi
 PkPeJRuiFImF/BxUP8FMyoAvRZJogN2CgKEwhNSfMu0hmClwI7IPAn/1JdGs/vmAfbimSY16fMW
 XQWpobyWgYdBMGOIzQi5uR78leIkVSr5Hp+LKpCicQY8xw1DOJY0mUpmpVGTIi/KBUm8XZ11GrC
 Fc+roLqOQyZHgMiT3FgvqApcPb6OwNwtoSkG2RZolIeGGQGcl8Xp9Lrsf491BI8N9/vTtJ+yxBR
 8pyxpVUcarZR6IXvVN+NjaO9jaokrsBuY/SSX5TdU7UH2KSjzxYmArFCrkHZi81wTh8HksBbmuh
 NP+bzxp3e0Z38ZznIq82Y4x+cr4cECnYaV16xGtVzy/Tk0srkP2pS6XRi1cpp1QvakEhLW6zc1v
 Lu/9X2+oSOtZ9mqt/2X0LP29UuYSVA==
X-Proofpoint-ORIG-GUID: 8UHiWJ3dz68tugddcvyEwb1NrBD461nX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
reading the LPI status register. Introduce a handshake loop to ensure
MNoC enters low power mode reliably during VPU3 hardware power-off with
timeout handling.

Fixes: 02083a1e00ae ("media: platform: qcom/iris: add support for vpu33")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes in v4:
- Added fixes tag (Bryan)
- Link to v3: https://lore.kernel.org/r/20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com

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


