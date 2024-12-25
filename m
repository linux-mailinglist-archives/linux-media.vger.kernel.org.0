Return-Path: <linux-media+bounces-24064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC649FC566
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 14:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BA5916427D
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32591C1F13;
	Wed, 25 Dec 2024 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YLNF5X+X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B91BBBF7;
	Wed, 25 Dec 2024 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735133762; cv=none; b=V4BTALuBWjQG6SNJONSiKsDYRLFXfbaARDeBIcLghmwlIKW+cYSU/P6pVKOGPb2JoxfzmilzD0GIe5xdPUQdpqJSc3R5J4rRtHg/zKyXDZJSV/Hp/R6yF/hBTdB7MsSRiXZMIDO1Nkb/I2zR0eq/n+eCmJYkB/IptjYIzC98q50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735133762; c=relaxed/simple;
	bh=bEoSVVlJGuNrSHM0wMtd25Nwht2eMYl3v3gGmzZveRY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcfWw2bODiruQ3iBJMgyG2cDdTEJRld+djTgYsEb4AbSd8tIu/vow9a5ro6GSxe7Kdxa+wMDOwSiYhcaR+8HTPKVLWGGhj1H7N0y9wtW/BYHbFnvZimzzE17FvkWvmsob/R0Do+RKgT7wnfW+uwZYeG97g4ONhyqGm8qyUDNwIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YLNF5X+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPBmMMS005549;
	Wed, 25 Dec 2024 13:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bq3P3wTEn4GtH/QqrI9zDlQ5HCQ5EB1epclWK1ZA82M=; b=YLNF5X+XDox2MPDk
	Qh4yk/CSxC1nK62jxf5jfThnso7OvKillPSas1Vud5wcrAatfqhwbFbUcfkAk7QO
	KQlIYALDju/Yq/2ERdTr7yqv9q8b8xDA9dsPBHqoix4apR2HbXRMUVgqTvwbLoKd
	f/l04HvRqVItRZjAO3Q7KoyIJaO+/R85S429J+k2yTqVjDpFBY7OtNNKom9FRSyR
	UDdBBqdEgRC/vN1inUaj5y/oWn07qz7YHDhNFVjUdji+E+MHaUAm0+MsrYKYMbrC
	yKeaavEWXQ12SybylP+bjRXV+RFnbOt8nvNGVFCPPBw5/WsTXjQdkXLdcrfixEk6
	ylkovw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rhfkr7ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:35:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDZuYO011654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:35:56 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 05:35:49 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 03/16] media: qcom: camss: csiphy-3ph: Rename struct
Date: Wed, 25 Dec 2024 19:05:10 +0530
Message-ID: <20241225133523.4034820-4-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225133523.4034820-1-quic_depengs@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l0VHy9neQI2odbI-A5vEkspa9njENhIQ
X-Proofpoint-ORIG-GUID: l0VHy9neQI2odbI-A5vEkspa9njENhIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250119

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The existing structure captures the configuration of CSIPHY lane registers.
Rename to struct csiphy_lane_regs to reflect.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f7b851242aa5..73e4c05a9dec 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -56,7 +56,7 @@
 #define CSIPHY_2PH_REGS			5
 #define CSIPHY_3PH_REGS			6
 
-struct csiphy_reg_t {
+struct csiphy_lane_regs {
 	s32 reg_addr;
 	s32 reg_data;
 	s32 delay;
@@ -65,7 +65,7 @@ struct csiphy_reg_t {
 
 /* GEN2 1.0 2PH */
 static const struct
-csiphy_reg_t lane_regs_sdm845[] = {
+csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -140,7 +140,7 @@ csiphy_reg_t lane_regs_sdm845[] = {
 
 /* GEN2 1.1 2PH */
 static const struct
-csiphy_reg_t lane_regs_sc8280xp[] = {
+csiphy_lane_regs lane_regs_sc8280xp[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -215,7 +215,7 @@ csiphy_reg_t lane_regs_sc8280xp[] = {
 
 /* GEN2 1.2.1 2PH */
 static const struct
-csiphy_reg_t lane_regs_sm8250[] = {
+csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0900, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0908, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -470,7 +470,7 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
-	const struct csiphy_reg_t *r;
+	const struct csiphy_lane_regs *r;
 	int i, array_size;
 	u32 val;
 
-- 
2.34.1


