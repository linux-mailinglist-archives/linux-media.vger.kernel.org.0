Return-Path: <linux-media+bounces-16144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DFF94EFE5
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79CFD1C22003
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15401862B9;
	Mon, 12 Aug 2024 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VF7L5xUE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2845183094;
	Mon, 12 Aug 2024 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473728; cv=none; b=sYmTl02fE+pg1jnw7N92YvGkmh0jHuHFI421Q009VipXldvp41vNEaBLO8ZcTZyhoVmkRqBbMlFxcpiBj+AwruO0+PxHsPcay/K2eQwxr864qrVredmB0Uz4qZZ/RxLNH39RYBZKS5anqC+gsCXmJ9KT1uO2bFBTjqWBVUaENIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473728; c=relaxed/simple;
	bh=s+Ej9Z2BPnXOnQnLYmrvnOBRG/9Z5vaG+mBMOPwH4xA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bstgVO4J8LawPpeOaW1z+Lf5+jiRdJnpwqba/Uiq0sOgQC3XadogGtXZEpkeKiJAuyr+tugH3lNZ9QSNPFISQXebF9TMBuGgGoCt5fNsSgm+xP+94wYWmXlqnHeipw3a4mOxY34cue+HVYAv7SNjnbNr+04E6SyNYbmJfFSQwC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VF7L5xUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSqfg020608;
	Mon, 12 Aug 2024 14:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tQGtDkEgurzejqoXBOvxO/giBPOKZaTWmMI8PVj/bs=; b=VF7L5xUEw0fD/z0L
	JEkCZ3rhIWHei0J5PQpQhdw1I6PCKcQ1KvDba/EEyT8zL5K4ZbinPMC6rpaXYkIX
	kDePGPntFugPdClYc9TbNGVhC9XvSqeO+KI6Z6FZMEiwzlyUI/Kb7vSa/Ehstryj
	9b1EXXfrGgWVppiVEc0PE6YMjS/G+3yf6+MmiPhBVuMLHNzFED8nmzyyWPp0znIh
	PCa9g6Cux0ajONBj0l5jNjJTBcflFNjS/oVkXahsAlU3dszxahbHwIvTaK9m98zh
	r8RNgHx0QiwltsJFK2vgtiIAXcs/Wk3iqnAx9Txexcsgfd+58e/Ywto1DlI3w9Uw
	vBZYFQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18dcjc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CEg0Ne028046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:00 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 07:41:55 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_depengs@quicinc.com>,
        Elliot Berman
	<quic_eberman@quicinc.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH 03/13] media: qcom: camss: csiphy-3ph: Rename struct
Date: Mon, 12 Aug 2024 20:11:21 +0530
Message-ID: <20240812144131.369378-4-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812144131.369378-1-quic_depengs@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: 9M6CVDh8xOKwJ_qh5vQWuhqt6CsRyNjd
X-Proofpoint-ORIG-GUID: 9M6CVDh8xOKwJ_qh5vQWuhqt6CsRyNjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408120109

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
index 39269ae31709..bc4834ee2dcc 100644
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


