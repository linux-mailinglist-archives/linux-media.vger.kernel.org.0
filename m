Return-Path: <linux-media+bounces-36798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B57AF8B6E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F851172475
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EE82FD5B1;
	Fri,  4 Jul 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLV8yT5q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AAE2FD59C
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616951; cv=none; b=GKzB6C1rOxf4+bQdUk/PrClenqzvwHRLtHFoiben2nxtl2fHvzWYBBQeoQj5gGtkQOU2Pw2zz2p20Hf0HraNq43GaYLsbxYervyIdQTsDa6zYZkTT8/K0blAYi2BpGU7FoCTm7aI0QqlkBuT6/32Jj85YT/Tw7kvVcp07n1tJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616951; c=relaxed/simple;
	bh=h/8FPdShUxBnyuQhvITfLr1y2fX5Z1y5nBq5BvfsLf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dY2h99zraPrC1kqCeL1UGA1ioKMntmav+dP2FA/IPhSxe2KSBxmLk5PhD5sFXtd/2CSg+Joxj1STwVqgDTie+Hn3tFUbpDigzfciy+bJ2rvmfljsETVjbWr9/+PiqrnGxwzBBOlkDZmzBmZ+LMwaWT9PK2ZDgmMVVijoAQQE+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLV8yT5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5642fmxF020148
	for <linux-media@vger.kernel.org>; Fri, 4 Jul 2025 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XMfhAIPniYR
	1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=; b=iLV8yT5qyL9LSGrBxENa52+xcHd
	EJMw09SsyIFSh0dm6yEAyFseyhi/PnJJTx0B6NarAUMxTs4xlsRUyD4MxjVQXyU2
	YBo8fZTA4gXF42UZBKRQa4hvOfw3t0WTxsRRbRH46W/8lEWjTxO5J4yn/h2ggMkg
	nX2SKYMggPTXBpMxqYw5cNliKC5xlHoI4UkmoiNftconQJmguE9hb7fYYELRfgTZ
	pYmOb9UosN+bZULFepU69GowdzkiKKWMzZEFeXWO3WT9ZpW2vmFWtzQsPi+ZMIid
	jpBJKTf+jcL4UJv6zTOBj8yFKrOI6oEUfmOWSWwAq1O+KxQPNcnGaLAvmvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn9r8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 08:15:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09ed509aaso79675885a.3
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 01:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616948; x=1752221748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfhAIPniYR1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=;
        b=YTy9fVEsZYBRdsia2WBE784WMKs0B2hSZVzLwwS8yPeYhUfTyUI6Zp8WDqsXywidOq
         nScptjBEJrREtdJ/XJC46peyIuna5MIzpXYw64OvhskzOS/0x3qSYD1/HFhVVy8poGzz
         aI5jHrdxpJCVQc+8S+EGGuuqTTVie5b1kReuuTOXxUl5RPDewq8krS+bxg5bsHuZ21zu
         kdo6+laQMws6Q4v6zp46IEq9mAkG0weaxLoz4M8GfGMC03AaXiUrb4jnVXYkzGOBHlpG
         PwRGYJsfi4aNhPlANKHURMZeYaYSNVXgI9Gm1KcSesL26hjIG3j7hFKm0AUFE/Q0hq8F
         X98Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtmy+kPt/vgUx2vWHjn9w49OPWZYyOAEpQq9M73tNvcMEOEJz3eyl9rX/7ndn72KKELzV35MV0VLxmOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYJdduY6KWgpAKtC5xi/3j+mQgLQzlhJmYpr/kNAaqxOht4gl
	ROmsp/CV+aGY/gKwejiwgPOO0p9+8FtG8vBK9FNL+dh0vqMWb4nN2jAyDkBtDa7HI6mR/SD4b6D
	k5G4WZJ6llRZmeKXPK3NYDxuM8BF/8Lkldm1feVJwQ7Q0wAVK+Bb0E8FxmVWJyM+k8A==
X-Gm-Gg: ASbGnctIHXVTtSPWwA53V9mffNK+rkQr9Pyb2j6Fb9YU/YoJ1ch2qKwIGlSQhSEdtK4
	rJIOfktF88v34jEDq4NIf0bVnoDbnwJFBQ0+0bWsFKszJIIIAjHDtmKOw7tbNLbcqXc2Simlu2c
	n72Hh/dJWk4KOxwdNC7qRk/fefLDb08xiML2G8afIVTm4+tbHd/Xdlc/Bd6O6zXfQ85TQl0kfIv
	1v8FoUJ9Ono91hKW3K2WWqlNbz+OK60B0FZz7+WwJNuNAOeQRrsDlB+PjgS2wHfw+WLQO6/fxpw
	5hcC5ihLNrTTS5kvzEP+icsjwKg3afktC116U+yXcMku82XXnnLH1mPDTw==
X-Received: by 2002:a05:620a:f02:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d5ddb7bc39mr170751085a.28.1751616947719;
        Fri, 04 Jul 2025 01:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvjH7u2gPUyRmlBtvHydQOMJaC1U0SBdfYiytn0vSDFWas8pXrT2rfMU7zoc2YL1jncXRARA==
X-Received: by 2002:a05:620a:f02:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d5ddb7bc39mr170747785a.28.1751616947223;
        Fri, 04 Jul 2025 01:15:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e0ed:c3b0:c674:7c4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989fcesm47991835e9.16.2025.07.04.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:15:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
Date: Fri,  4 Jul 2025 10:15:34 +0200
Message-Id: <20250704081537.1716613-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
References: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfX0s+yFNIU+6me
 3d3XJyJO/zF/RXKivBuw3uqwsxotyGwBx2ukbQkjvM7eR61kkGDqTNihakVhaoESUmeM8swlsNS
 7EkkTjOfrA1F5yG99NFCubRauSf+O24lFXx85XEavt1eCfxoumG2KshtUYPWbNlCl0IqWySztpY
 uPpeVRLX9MdyopFGoR/Au7xpgh+U81J8JSts0E/rx0dDqYFqzFWTkaUhfNljg+/PGSm7UofSpA1
 vg0Lu5ZQiJmOyHCa70wtkBW3C+Ob1tNOf6A+xQoEUc4fd6zyBauwHGzx4fdNrfIS6B5zwN+k/ot
 veZcui9k/eLtX55P6Rkh9voNsEuEwZnBQmIJFvYIlWDUo+0GI2p9Voc9XHLS+TakbuQdvenPTJ6
 n+qf5xIcvdGrULiU12l3CmHwa0xQaTXJGAMBUArpulhQ4LEKtUTi6kFnxj6BSuOmW+2K4QNp
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68678db4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=j5mQdKQlijobKnpfenYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XyJaE7rJ_A2FBgko2Se9Q9_lV5XrPbiX
X-Proofpoint-GUID: XyJaE7rJ_A2FBgko2Se9Q9_lV5XrPbiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040064

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


