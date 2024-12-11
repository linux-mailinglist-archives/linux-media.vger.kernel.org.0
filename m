Return-Path: <linux-media+bounces-23199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 977029ECE1B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 15:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D38162AA2
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE6E237FE5;
	Wed, 11 Dec 2024 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fLCrizKG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDD02368F2;
	Wed, 11 Dec 2024 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926138; cv=none; b=bNdyGIYNVvDQbnrr3hgxjJta9HJywOJL+2mG0KF/ioJs2LPY8NXtrPDdyaAvRP4AlQknBzPfUR0aIWQ9f+EyVXqUijylG3LN6Sz1pVfTzBDdT8KMgU0/qINP2PM6mc9kehI2kAloaNAvJPQr9KnLHmP8aC/AjbN5OAkik3YbPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926138; c=relaxed/simple;
	bh=s+Ej9Z2BPnXOnQnLYmrvnOBRG/9Z5vaG+mBMOPwH4xA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5NxCGfDbdT8ExPs30vHwchgXQDVD5pjuKtB4g5spcXDuBaM0EkUeAn0EspSmjIwPwn1RxMMTqoTXNu6doOJgn+FTvXvSPMGqY+HERgkDbLrRjHmjeTDYVN9o63nIEThqXy9dh6ikfHR3CwFrD1PwYoLCaoJgPrXjD9rJN+WNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fLCrizKG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBCtmsv030797;
	Wed, 11 Dec 2024 14:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tQGtDkEgurzejqoXBOvxO/giBPOKZaTWmMI8PVj/bs=; b=fLCrizKGr5UBnpNx
	FXumEdw2mqbJR3FWM4tIo67Ub1UDwFmv2nLU7MNRmuouuI6F910SFiPh35qqPISA
	WeZtnMxJxfkVQGK0Yx21h95fuyF52LKur46dOQEt5gRavHW7i8+4+W/s1faMm5mN
	cmXuEUyAqIQPusptA4wDg4OCGA2BQR/nYcDbyX2KxKBxW7kSfjKPvHxbEaO9G7rA
	TTq9Lsht3iKWfDaQALTig/u7fAFqi92wkilj4hoWz6h/hhtWrs39cJY2zKfLNqXF
	Uxw61LqAR+BTkL+vYI0TQgTUcF3xrDmnJbrHJQh63fK7lJgYSEd4qYJWegLXlVU5
	RU+qww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eqr33m4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:08:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBE8ptU018610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:08:51 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 06:08:45 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 03/16] media: qcom: camss: csiphy-3ph: Rename struct
Date: Wed, 11 Dec 2024 19:37:25 +0530
Message-ID: <20241211140738.3835588-4-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211140738.3835588-1-quic_depengs@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YJKxP75GHErgD8dKE5CKGu4MDN0IIcWX
X-Proofpoint-GUID: YJKxP75GHErgD8dKE5CKGu4MDN0IIcWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110102

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


