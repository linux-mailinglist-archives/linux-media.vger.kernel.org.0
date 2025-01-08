Return-Path: <linux-media+bounces-24430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99CA05EE5
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D4B3A1B09
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61061FECB0;
	Wed,  8 Jan 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TTcGPJam"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8E1FC7F0;
	Wed,  8 Jan 2025 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347131; cv=none; b=HAL/r7e1tyoZhQOzKPLpRyjlKxgtV8ZqjqsQAF/cBToFCCEgswRp+sizgf9qylTr+IYVtCcVMZbu3PYNpD8kP2XfwgnzSYmZwb9fuSXn/GfWz/ZWEGuy7COtSvIadSx4kmc5tdKDKCgKdXm6M+GwrEfz8aXB5evnjOMyl4wYBNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347131; c=relaxed/simple;
	bh=bEoSVVlJGuNrSHM0wMtd25Nwht2eMYl3v3gGmzZveRY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWYTCqUd8U7xIU23FZTKorwqFlFUbJaEpmK5tFGVpddL0gUricgeah5o/YyNmPg9+2fzRtg526+RT8cVQsItlQeeIsPRwuW/XAyAKN0sRSG9skxZmScppttriXDvC2eGgxbXze32f7Fz5KAgzqGOCs1ZZZEa1qnIWBHSKoZIa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TTcGPJam; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BlEnf020200;
	Wed, 8 Jan 2025 14:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bq3P3wTEn4GtH/QqrI9zDlQ5HCQ5EB1epclWK1ZA82M=; b=TTcGPJam3piVNdCO
	qhXvk8cJE+ERJg0Ig6NI814kQ42/3vAEjAoMZZjvVFYO2+bIOxYC0W3ZSh+w6/eY
	Wr/TiJFZnEvUXTmcSOGJvclaN2f5dmfNsuxOogiFnQ/GtmP4+mgKpvUuAlfnAB/4
	rvaOWsjFZUnGnjrXKO8EDrNQnaEJpHFYu45ojtGOYUl3eh6kKxt9B7MS8sjgoPq0
	hxTDRhkIzcZD0wvctZknLUFA/F9YIUY/z2avfOlV7z1xI7YO+JysfWi8Gsp9tYb/
	XgaSqtbhmjdbmjGWfuNhGhj7GxTV3dD58AqI+zq7Y70mt/rqs1jMAQE8hBy0XBOR
	eG4IJA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441nm18y17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:38:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Eciw4004460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 14:38:44 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 06:38:38 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v8 03/16] media: qcom: camss: csiphy-3ph: Rename struct
Date: Wed, 8 Jan 2025 20:07:20 +0530
Message-ID: <20250108143733.2761200-4-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108143733.2761200-1-quic_depengs@quicinc.com>
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MXJNaKbiSGBpOnjPsVuY9vzRMl_mgbOz
X-Proofpoint-GUID: MXJNaKbiSGBpOnjPsVuY9vzRMl_mgbOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080122

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


