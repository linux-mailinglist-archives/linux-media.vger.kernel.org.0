Return-Path: <linux-media+bounces-24665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C74A0AE6B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA40E165C9F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196FA1CF5C0;
	Mon, 13 Jan 2025 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FUzg58Oc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACED1B6CF5;
	Mon, 13 Jan 2025 04:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742786; cv=none; b=P+ww9jmMHrEa5gfmwTRlIU/holGx62QB5Wwr7Jc9NabAEuKgq1s7cpLBQPOI8940+Zj48raZiO/R2aWkeuhdjmqbupSzxI5/Lvx6Z5TTq2twHYifPsHfEuHsVSsLAkahKBfv4CQIV19l1QCbNLcSZgzH2OImGRteSwQRRsTc8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742786; c=relaxed/simple;
	bh=WbCbQMtYnXWHKHLV8YuyHP9q6AJ01ut3bxqtOa4bY9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nST6leW05v5OVSLzAzrbpfgGF0w18AJipXTU/vCltNa/FcaFXwEf7e2HZeLCBMOfwnkCM0wQaIGfdX69pO/NxXYKwzVcyBEpX7IRhLaL5ZL1HArW4ZwM2ZSr2y8bsb7rLRsfjHke20m4JwhI0cRbQurqOqcRSBmbePXE8mcDHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FUzg58Oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNq96r005357;
	Mon, 13 Jan 2025 04:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	666uLpuhhv2Xr54q6hetVB1gWx0CRIuNoujwjv3MuwE=; b=FUzg58OcYEwr7IHD
	KsybxwpBfR167WF5ySC5z6Cx2242Qa8sBo+C5dAjJmZm8R5W/zIrGi8uczYtBR5g
	eX2tKJgZ+CsVlUjHY9PQHCmumb9olXWrwxRF/nM5bxW/HzxTqWRbt2pATO7r2724
	kiMw72/fDWVm2Ch63e/22Em65sEPoHwSbt4Km76yM3JcBj5Xk3LANynl3HPYd2ip
	1wlcFNqJW8APLbSRQiRZjsP37CXAc7NuIk1jcBzg1VNedzP8/zyInWKrjlRFMkb9
	xu9YtgxV0mzjHaHHQ7c+lAuxM8qNwLfJy1xBNORUTsWR1EjYMahjA+PQ2Q4Ha3sC
	AANglg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bh36v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:33:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4X1j6021139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:33:01 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:32:54 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 13/16] media: qcom: camss: Add sm8550 compatible
Date: Mon, 13 Jan 2025 10:01:30 +0530
Message-ID: <20250113043133.1387162-14-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113043133.1387162-1-quic_depengs@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: dL05DEkK47kDKQyLbRiGex6z9L__O_F7
X-Proofpoint-ORIG-GUID: dL05DEkK47kDKQyLbRiGex6z9L__O_F7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130036

Add CAMSS_8550 enum, sm8550 compatible and sm8550 camss drvier private
data, the private data just include some basic information now, later
changes will enumerate with csiphy, csid and vfe resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7594d9ee11b2..a1b8f202c8bb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1938,6 +1938,19 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8550[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "hf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -2974,6 +2987,14 @@ static const struct camss_resources sc7280_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sm8550_resources = {
+	.version = CAMSS_8550,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8550,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
+	.link_entities = camss_link_entities
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -2983,6 +3004,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index bd1d1d2b831d..58fc61e7cf7a 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -85,6 +85,7 @@ enum camss_version {
 	CAMSS_8250,
 	CAMSS_8280XP,
 	CAMSS_845,
+	CAMSS_8550,
 };
 
 enum icc_count {
-- 
2.34.1


