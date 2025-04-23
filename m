Return-Path: <linux-media+bounces-30776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD5A9807C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3DE1941282
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11DD267F59;
	Wed, 23 Apr 2025 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTJI/FMv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349319ABDE
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392862; cv=none; b=t64iW4RibsznGWgvauVi+aCG4kNo7ec70mxk93abjfNsHQqvJ47UXlzW9pcO0Op3ufL5gAE3Wzw1326YfCX5HS3zV1ICb4wxGFpEQhUi1pksDKb1s8wjo537swJAPuPO37P+sUGW/YLzrmiEtbkmMyPX0NCuADVWqZ0a3w2xb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392862; c=relaxed/simple;
	bh=h/8FPdShUxBnyuQhvITfLr1y2fX5Z1y5nBq5BvfsLf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N/mNOtLR5ng+3yiLGevitYOeAeUo2sf2Jiz4q7LHLd597blZFHC8rr5Srm/dNYrHq95SeSEtA2JsihxhKJmXKbKD2koOt1wgcZEBwP4anzVarRfvEX4IoFLOsMSxIKQPbZBG75OK2Lit2sZSUUnt1brvV7fP0AYbqa+/JZB6Aeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTJI/FMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iGUq016850
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XMfhAIPniYR
	1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=; b=PTJI/FMvdNjW4LlXkKT9AbZMi8+
	dWKnl2gfV5VAeVa/CoRK4vod7k+akViRSe7MB22ppacKOdklMDjS+mR5fL4U0DDK
	PloO7UCF8TIkcyW1rED/p4acMd7aRg9j18fi8l4v+eOhhl+I49DcV7ZnUTM/OE0S
	1MskkC65LAt9u+mtoByG21CP0T2KWKSO2brDY/vajOTdk0GzNmX0vm4VEKaAEyEg
	6VFGkMWCX4C+ITMwpj1OO3XOCV689BQK+HLOWfITt38gFJDUNvyznp8pmcvzvtkS
	Mg8UaAxkPJ1Mo4FVuOqHsENlwmowC+yO/EjR8NsPXRLRAF3isrK5iPMD6PA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3h7gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:20:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so1466233685a.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 00:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392859; x=1745997659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfhAIPniYR1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=;
        b=agIu+7Ox+Upnr9r30H9Fu4JQfHG0TeeqvbQ0rbrO5uNtlCVFFY9I+FGTsHOZ5EDY4X
         XodUvpF3LudDeZ2NBhDfu1fujDyHi+1hr0LDQ/+pBFpoM/feRUyf/bjFDwFremu/SYWK
         cTVFRd5XbR02hws8ODhqUNCZSYXLpGfPY0TAm6apelruMARGoybplHJ7EB3Er1wmGnto
         q+eCravUucLUzqH9mWDut2cxtYD9IFOQBxgjJcR8qSaNMbBa+xXwqZkGh+R4UYwgL4JL
         GMhFYJtXl2EW6jwkxW5DoTEWdyhx71f058e0FklUaXBbxfSPDMoAYcI5dz8p6bpzCb6P
         4IXA==
X-Forwarded-Encrypted: i=1; AJvYcCVB2ExZyfwJmpGVH0BYdmDfNDW+ImPDasg2I13sIAelE9FtkA1Vpcw5o91CpEv/lHMX94khsg1+ixGKEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzom6ScVXbvWJW+YNwTbFChrGltOwOcBwp59H/0ot6j/jj1rc7+
	lXm3N0XEYN1nmX5M2YOl1GCjIoYqsW1IuefT3v5ZggEDm3h3r93qmpgm+WpMWp6B5kFSYn/am75
	LmyKlJ8mGc7k0Ki9N6sLm7WUaqTQbNb5XRST1Vmlo2+VRjho0aKMLmx/3815/UA==
X-Gm-Gg: ASbGncuf9lh7F1kvRObODevrncSKF26RIhzOLqP40Lg+2jKO4IDTJEk+IhqCkzImbyv
	SoOIBTSC9YHiUFISY/pXbqeU/+0CSrjViyuKASb71mMICx88c7A/M45W1QjzhkF5tbJj1P702oc
	PvlYHvQ0J2St7mALNy+1zLwfvCgHwE8p5CaAa1Q5wk7PEG7A9lsXPqQ7ycXixBgyBylwvobA9R3
	KmUaKE/LNHMvwo4vML+H4/P7yGz/3MWCpWBvChwQXwpcQDj017YpTKduJmoSl6qRVBwpWlfmdIz
	i3R6hkSe2bQ5Zj2F3o72k728X7gEWDo0o3JkthFMajTq+Mc=
X-Received: by 2002:a05:620a:d8b:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c927fb69d5mr2516014485a.26.1745392853968;
        Wed, 23 Apr 2025 00:20:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwTbazvuUZm8MkVRj5CTopBSHkBsd4/IjAVZrBz82lJYYka4ImpMiCtw9b/nJwJBAAz10MQ==
X-Received: by 2002:a05:620a:d8b:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c927fb69d5mr2516012785a.26.1745392853645;
        Wed, 23 Apr 2025 00:20:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:20:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
Date: Wed, 23 Apr 2025 09:20:41 +0200
Message-Id: <20250423072044.234024-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jUJ4Npn6eFx9RLbdki9WodQsNpdkLXb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0NyBTYWx0ZWRfX+DPQ/7Wau5/r GHbRhKWoF+LnV9XlSLUVa9zTOiDzq3MkdsxjmY8OkLjefBRlCe3/LmZAiz4VMol92TGWwqyurUt LvvP2+ArZ9SlI4N/vr4ZfygKGdWZTbIsWZG6K59yUH2BWS6ww8lRZLLQZ8YQcRZI36GDxif4h3F
 XxOUtn+eXJkjLNUIaoFsP2otH7hC/L63y3KFt/c9dbC+FGa5RqxqZ5wIETylTMP3eD5WjZWk81I GL2Ce8EjWwd/60xCQ3Mpe7sU8SIfgaFVYwOMLRNThM+um73ccPBOsMs6jyxwFF6v33mtDTJzuAO 30hRMo1crk6GTX+Kno7r+smHXNKIsDhQOTVlL9brdswJL84VV6Glf/dJtXrrOkx/48aA9MCftxR
 wamqDXSYp6ewI4Nxol/TGzR04gy3k4aIA8nnT7yXLn5nnN6fC2kqSggigyHiBRJGKGSxfjyx
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680894db cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=j5mQdKQlijobKnpfenYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jUJ4Npn6eFx9RLbdki9WodQsNpdkLXb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230047

This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
The table is extracted from downstream camera driver.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e..91cd697083ff 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_qcm2290[] = {
+	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0730, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0230, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0430, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0630, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 2.1.2 2PH DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_sm8550[] = {
@@ -744,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -829,6 +914,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sdm845[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
+	case CAMSS_2290:
+		regs->lane_regs = &lane_regs_qcm2290[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..377707d91ff2 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -78,6 +78,7 @@ enum pm_domain {
 
 enum camss_version {
 	CAMSS_660,
+	CAMSS_2290,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x53,
-- 
2.34.1


