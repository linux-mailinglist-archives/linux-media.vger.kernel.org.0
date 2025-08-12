Return-Path: <linux-media+bounces-39520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E90B21FD1
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AFA36806D1
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AB72DEA60;
	Tue, 12 Aug 2025 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bMqRojIL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3346B5;
	Tue, 12 Aug 2025 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754984967; cv=none; b=MlPSzpsZHeOlSe6HlzGVA0srhY+jAzmu7Lhk5jVOvh5jANMgbU6oMP/0B5WOC2JJ+puinMabApucRLmKYH3jaLMb3vhgWxBLgjGznQg+tqwZ7xHl0xY5eA72tkB5LP33GlXjnuePXF0R8lobFHiO7BGCj/8arC9BliOoldTB/90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754984967; c=relaxed/simple;
	bh=7U+4gn9pS8I+rtj2LNkrjT4KMQyuRjN6Ze9TE7TFzZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=OnH7UA77mXoqgCTHn1VUUKwECwprrRNeJ34fsNp9+gDpRv8BCJcuc1w6+voM5zlszA4x9gfqD0qIY2TZRVqzffcRT78X3bXisrGicjzmzbATuzfVQYm3ID8vXH+KbIbHDhpRAlqMBIhGZYYPH14h6tQWed32v0lkruDySIgGJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bMqRojIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5g3XP018332;
	Tue, 12 Aug 2025 07:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IkAYvHtINB6LUMF8R7RUL3
	O74Vv1lk8ZW/9p0E3HbYE=; b=bMqRojILf4oPLFgHTJQi4NT6qLOuQDQWQUMBtJ
	E14C0Ajn9kyiGJJEQkbpR8EF4UlWmxqEM/EfgNEV6/qEnHZD6c3lplXQMS5LUgzT
	DtDTP2FZkCJfWG+pf2R3wwIBsWxGxx37RS+gp7I9rQhpCrn6tx1+mn8LbXdgRvQG
	ADLAHS0ENrcT/ytcjJuX2pkGsczrTj19MI6uQ06JWK8TvXvjLHaoICn+PP6LJ2MH
	EYqpWo++Hur3nqHsJ3j/b7mvqaLg34+Nk62RlFeNtuPp+dfZTRtVNT2351wIzi41
	UqA2nhlR2AK1gtno/lv/dILNp/S3lIzqHOLjOfdNQCbXzlDQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g77v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:49:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C7nJYo031488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:49:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 00:49:16 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 12 Aug 2025 13:18:56 +0530
Subject: [PATCH] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOfxmmgC/x2MzQrCMBAGX6Xs2YV0QyXxVcRDWj91D6Y1S3+g9
 N0bPM7AzE6GojC6NTsVLGo65grtpaHhk/IbrM/KJE46F1ph+4Zr53gaVxQ2/GbkAfzSjfsUUxQ
 Xg3hPtZ8Kqv6/74/jOAHm/0xcawAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754984955; l=2400;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=7U+4gn9pS8I+rtj2LNkrjT4KMQyuRjN6Ze9TE7TFzZc=;
 b=MwDge/r7ZIMngbdJMq3HI09BUxIvHQTo+Fcl1hex6sfG/R3meDPrDT39rRC9sQT/sE6sapbsI
 qzEKEZ8JA3pCpeC0+YnbktIZmfj6BDW/0pVx78/Ck8hQsEObo9SiKau
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689af1ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=oH3p6_XQ8KUHbw2Ta6wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX/4ywGcHjaapk
 qgQQF7MhRlDsaZ8fLZm8EOcOPWdlWXJVd+dbXiwdFsnPGmgJAZt91ysDwdZo9rx09io7FIlMrOf
 IDqaP0E7Pmb3AbUasBWDV2R05sTvO2pktbybplQBKAXSt6Vl7CqkYLyh6v4D0OWIKQJKJDipUHZ
 INySFOctXv1FEOvkdHV79qh+syyV3lvPT39TRmV5UGvnlV6l2k82ND+iEMAWruAloiQzJamOtRV
 Hr3Ewul13D3LE3spum4u4+N2Ep5GYoa7xuKeXpB91EiJ1XgHWok4Z4hrw6YkhXTDoIm+5xaYbwW
 wy0GPpimNtirc/XRBWe7V8GaK0pHgpiOHRX7Ky9GcRRcN9KkdcHoqv06S8p2gIW8VlAscATYqbo
 Ar6IlYYn
X-Proofpoint-GUID: i7ZEoxzYUCVeu6pGKH4V3OLyNnKlYQkc
X-Proofpoint-ORIG-GUID: i7ZEoxzYUCVeu6pGKH4V3OLyNnKlYQkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
reading the LPI status register. Introduce a handshake loop to ensure
MNoC enters low power mode reliably during VPU3 hardware power-off with
timeout handling.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c2e6af575cbe4b3e3f2a019b24eecf3a5d469566 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -110,6 +110,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
 {
 	u32 reg_val = 0, value, i;
+	u32 count = 0;
 	int ret;
 
 	if (iris_vpu3x_hw_power_collapsed(core))
@@ -128,13 +129,31 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 			goto disable_power;
 	}
 
+	/* set MNoC to low power */
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+	while (!(value & BIT(0)) && (value & BIT(2) || value & BIT(1))) {
+		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+		usleep_range(10, 20);
+
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+		if (++count >= 1000) {
+			dev_err(core->dev, "LPI handshake timeout\n");
+			break;
+		}
+	}
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


