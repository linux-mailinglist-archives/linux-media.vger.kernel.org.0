Return-Path: <linux-media+bounces-16143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6F94EFE2
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 167FA1C2201D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7169183CB1;
	Mon, 12 Aug 2024 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OAuTT5/K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C5184555;
	Mon, 12 Aug 2024 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473727; cv=none; b=p6HIGjCY6arunjINW4LqHG4DdtN21qL4keNC6mV6cJXJtDa06KuVtxuhBFfwReCKhhYl7kP67B6Ser/UMjQZoYcHHhG+YdF+7k1jVYUzL+fUdJLsZblrq0yXzHPDdR/+ateeBu7ZshgYdNEPGehVxRBTDxd2ncK5E4fzJKlKOI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473727; c=relaxed/simple;
	bh=09UKorB9i3b1j6aCVM1705A8BPhn2tHgY5s7FGL1n1I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBPjCtyMAiq3BNYs9FNyBnhYfgHCa9lTklg5OPE8jtaB7319kfcwAISUl7h82mwYcCGGzWjl8dIqKpTP4/k6FYYvod1YcSc1sX6jhOLnWo7Is6fzYCPBDzQQPzIwdv240yaRWAd3Nst+bWhQ8Gdof+z9SESrECCa2anHOQ2xEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OAuTT5/K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSUk8005635;
	Mon, 12 Aug 2024 14:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sinKnvNVFikgucwwHT+PNICLiWhbEqsFsWERef9NaVc=; b=OAuTT5/KvV3Tzd1T
	2mBzTV+flE0PqfyQoRAZS2lxk9mUgIwSSCXbeYIpK3JA5aTch1Lb4qQlYCcMGPYW
	bDEMA7wpeqLK9ES7Fcgu8HOv2rI4MF5Yz0yZmTiyHExQuEySCynvyrDt5IdxGgku
	HJ50xXnjeUNrkTKEUru2ej6b8j6inHBl/e8sdFBDtobp737FmDWutG4saFbbDJ+D
	TGoIZLrF6J+3DTkBtrd57R/pSMRAP/PafD4A9bQc5aW+4ff/HnlKtYbPNR+kzgD9
	EQ5VI8cnMj8IDzz7p6LSGwZHkfshbxSnbwHI+lwtSxHRF4h8PqEWYGrOFqpNVhCA
	wu7AEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xvha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:41:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CEfwGN031483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:41:58 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 07:41:52 -0700
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
Subject: [PATCH 02/13] media: qcom: camss: csiphy-3ph: Remove redundant PHY init sequence control loop
Date: Mon, 12 Aug 2024 20:11:20 +0530
Message-ID: <20240812144131.369378-3-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: H0fTfEWcEBKP_dsLogX1RVbgu1Jg4FlD
X-Proofpoint-ORIG-GUID: H0fTfEWcEBKP_dsLogX1RVbgu1Jg4FlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120109

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Adding a new CSIPHY init sequence using downstream as a reference prompted
me to look at why we are splitting up the init sequence into chunks.

Right now we declare CSI PHY init sequences as an array of five equally
sized writes with a hard-coded control loop to iterate through each of the
five indexes. One bug in this model is that if you don't have an even
number of writes, you can't init the PHY as you wish.

In downstream the original code has something of the character
phy_init_seq[MAX_LANES][MAX_PARAMS] which in upstream we have translated
into phy_init_seq[5][SOME_NUMBER_OF_EQUAL_WRITES];

What the code does is take a pointer to the first index of the
r = &phy_init_seq[0][0]; and then literally does write(r, value); r++;

The controlling loop that hard-codes '5' in-lieu of MAX_LANES does no
special sleep, fabric-coherence sync or even a printk() to justify its
existence. Our compilers are optimising all of this away anyway so lets
drop.

Reduce the array declaration down to one flat aggregate init and let the
code just step through. As a happy side-effect we can then also handle
odd-number writes as the number of elements in the init sequence will no
longer have to be evenly divisible.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 554 +++++++++---------
 1 file changed, 261 insertions(+), 293 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 53892bdaaf58..39269ae31709 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -65,287 +65,257 @@ struct csiphy_reg_t {
 
 /* GEN2 1.0 2PH */
 static const struct
-csiphy_reg_t lane_regs_sdm845[5][14] = {
-	{
-		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0008, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0708, 0x14, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0208, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0408, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
+csiphy_reg_t lane_regs_sdm845[] = {
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x14, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
 /* GEN2 1.1 2PH */
 static const struct
-csiphy_reg_t lane_regs_sc8280xp[5][14] = {
-	{
-		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0000, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0008, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x000C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0708, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0200, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0208, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0400, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0408, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0600, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0608, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
+csiphy_reg_t lane_regs_sc8280xp[] = {
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
 /* GEN2 1.2.1 2PH */
 static const struct
-csiphy_reg_t lane_regs_sm8250[5][20] = {
-	{
-		{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0900, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0908, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0034, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0010, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x001C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0024, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C80, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C88, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0734, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0710, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x071C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x070c, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0724, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0A00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0A08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0234, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0210, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x021C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x020c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0224, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0B00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0B08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0434, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0410, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x041C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x040c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0424, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
-	{
-		{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0634, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0610, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x061C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
-		{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x060c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0624, 0x00, 0x00, CSIPHY_DNP_PARAMS},
-		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
-		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
-	},
+csiphy_reg_t lane_regs_sm8250[] = {
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0900, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0908, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0010, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0024, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C80, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C88, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x070c, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0724, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0210, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x020c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0224, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0410, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x040c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0424, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0610, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x060c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0624, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
@@ -501,41 +471,39 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
 	const struct csiphy_reg_t *r;
-	int i, l, array_size;
+	int i, array_size;
 	u32 val;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
-		r = &lane_regs_sdm845[0][0];
-		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
+		r = &lane_regs_sdm845[0];
+		array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
 	case CAMSS_8250:
-		r = &lane_regs_sm8250[0][0];
-		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
+		r = &lane_regs_sm8250[0];
+		array_size = ARRAY_SIZE(lane_regs_sm8250);
 		break;
 	case CAMSS_8280XP:
-		r = &lane_regs_sc8280xp[0][0];
-		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
+		r = &lane_regs_sc8280xp[0];
+		array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
 	default:
 		WARN(1, "unknown cspi version\n");
 		return;
 	}
 
-	for (l = 0; l < 5; l++) {
-		for (i = 0; i < array_size; i++, r++) {
-			switch (r->csiphy_param_type) {
-			case CSIPHY_SETTLE_CNT_LOWER_BYTE:
-				val = settle_cnt & 0xff;
-				break;
-			case CSIPHY_DNP_PARAMS:
-				continue;
-			default:
-				val = r->reg_data;
-				break;
-			}
-			writel_relaxed(val, csiphy->base + r->reg_addr);
+	for (i = 0; i < array_size; i++, r++) {
+		switch (r->csiphy_param_type) {
+		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
+			val = settle_cnt & 0xff;
+			break;
+		case CSIPHY_DNP_PARAMS:
+			continue;
+		default:
+			val = r->reg_data;
+			break;
 		}
+		writel_relaxed(val, csiphy->base + r->reg_addr);
 	}
 }
 
-- 
2.34.1


