Return-Path: <linux-media+bounces-26150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A079A35AF0
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C501892D94
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9692A25A64B;
	Fri, 14 Feb 2025 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D10dRUVb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725FD256C62;
	Fri, 14 Feb 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526998; cv=none; b=eQUrnu+YKx+8lgwnPPkCc3DZw/9BDw+++0JhjGv9EPgTEcDJ4qZ0lFMcfkd9LjSPUUbuVznoKDvwsykLBO/IroRG2c8asCNibzKvKN3PMya0oVgTcm09GOeYYd4cI5vNwJ86Z3nfXkNiYpR1qsRcQ6wNUC7epYEla0hlaviZfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526998; c=relaxed/simple;
	bh=1YtLxRZ/epmhXabVS87WBT5Z2CL13eFOSRsTRbiDQHI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9mTxH4boiUKrOWvgmb3y2MxjY2xrL9+NGlK1dtA2UubOa+WHz9tJ5TdjRKkP6BD+swD9LzkVTLqLQmzPL2mbzrAe2jLxUB28PLV6Imw0eADzEDU7aRar6COctmUL8ej4w5Pr9gLe3r5RTJwS9N2hGWA9rAu0vIQMky9MfneraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D10dRUVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DNm48g011988;
	Fri, 14 Feb 2025 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVFTZ3tHwGipJxtFr/mKnTTFFuOtzasFKELqtmzQhKE=; b=D10dRUVbaOcjEUFv
	HawIlMYi9QVmlo9jjMOrreFwzzi8Ta2223zqHGOftx4x+WI7TJMXpIUOeV1SZsKT
	xaSJ3v/BjXGwAl2++emc0NjubylaHFF2HJqjjdx5SKXjybfDp/8hc+cUACzdXvgo
	WFU+EFWlpe1zyeNSt5bKEAYKCj0GVB1GH87opKUdxAT67D7pkdBeMopkWZ0xTrGi
	1xwVQJoPY04C9BH1tbpGRgtmk3WqKYn/2sRdM7jNAe0wXgkHd9NvlOiFu73Wz2fy
	4eSwOA+4srMPJuOrPdRl8NJ680ZUGdxtwfo8hlnX0n3OidAG/21bXERobSLgm6cx
	lTtK/A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sfxwawc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9uV7o017550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:31 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:56:28 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>
Subject: [PATCH v1 1/5] media: qcom: camss: Add qcs8300 compatible
Date: Fri, 14 Feb 2025 15:26:07 +0530
Message-ID: <20250214095611.2498950-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
References: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6O0HyS9-ElDKRvC26XzQsK3GG2H5lETJ
X-Proofpoint-GUID: 6O0HyS9-ElDKRvC26XzQsK3GG2H5lETJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=997 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140071

Add CAMSS_8300 enum, QCS8300 compatible and qcs8300 camss driver
private data, the private data just include some basic information
for now, later changes will enumerate with csiphy, tpg, csid and
vfe resources.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f0d11298a7bd..1c0c3c019803 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2847,6 +2847,19 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_qcs8300[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
@@ -3831,6 +3844,13 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources qcs8300_resources = {
+	.version = CAMSS_8300,
+	.pd_name = "top",
+	.icc_res = icc_res_qcs8300,
+	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
+	.link_entities = camss_link_entities
+};
 
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
@@ -3943,6 +3963,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcs8300-camss", .data = &qcs8300_resources },
 	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index d3efd8bff948..93b7c38dc8fb 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -84,6 +84,7 @@ enum camss_version {
 	CAMSS_8x96,
 	CAMSS_8250,
 	CAMSS_8280XP,
+	CAMSS_8300,
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
-- 
2.25.1


