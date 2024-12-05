Return-Path: <linux-media+bounces-22735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF89E5A85
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 17:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872CE16D14B
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADA922B8CB;
	Thu,  5 Dec 2024 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PHNTH+qE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93E22B8B4;
	Thu,  5 Dec 2024 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414220; cv=none; b=ZWH3KOo3b0KFDFTV1ZnIh+P/enrFiKy4GPUYaRIml+y7mGX6fafUuhK5EX7zuQHytH4NB5gbLrMag56ooF0QnRDCZZyXBwAPhqN/tJ294X7DQfEIXk1mnkDqfatjexJDKjmpvRdxDtzlQDs/3Svu0OZZZhrdJXFHgV8D3njZxYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414220; c=relaxed/simple;
	bh=ZsJQHTgDq3EIoxaE6YimjMxVtV7HsM8MA+wd18zJ8bE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yl1tD0qkcVdKXEVRBSqJJ9/yODej6nVaMYBuxfUOEHaGbhR3oq+tH13Q4dApv2csId0pHhZxueiDC3T74UnlvOOn9iMqaRDS9YJn25aEKwC+3BbmyKLi0lK5RDQAAY9Fb/OX7s7gOlr3EbKlYsbqAlyq6BZn/3KBWkc2lzrvFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PHNTH+qE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5A9TlB031695;
	Thu, 5 Dec 2024 15:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wMHiw0lXI08pSZQj6A5gt6nfKgo7k2rEKdTQYRnt9A=; b=PHNTH+qEZyJItSzI
	xFZFj2c8gNRbtpXVSWkuQnTbcSHdlTbLDH1oOs4F/9crqWobvyAYSCe8/10NcM4v
	l/HoqpeF+JfgoMrlNGTV9eyG4zhRmA6vGhXxVzUENuy5/ODTvqXSsA4gJZ3hq7YQ
	GyKZMfy83Pv2YyN3cFsb8Aani1guIh8hKfFx0UknBErL5zJtPY64oFPCH+2UPM3I
	8CWh2D+r1khl2O5JJ0OQ7/1eXW3vVWSeR4e070dIsExLViatpWoaBT5evadTHIDU
	RLksi9VslKmeqnxX9JZ33NWf6PmWAbM93XZ7VJjJFs4o/pwMASFRfGJqZybpqTK8
	UKvt9w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayemahfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:56:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5FusU3017962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:56:54 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:56:48 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 13/16] media: qcom: camss: Add sm8550 compatible
Date: Thu, 5 Dec 2024 21:25:35 +0530
Message-ID: <20241205155538.250743-14-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155538.250743-1-quic_depengs@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: KGnvyVp14BbJ02e3xkPFYk0VfYUg56I6
X-Proofpoint-ORIG-GUID: KGnvyVp14BbJ02e3xkPFYk0VfYUg56I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050116

Add CAMSS_8550 enum, sm8550 compatible and sm8550 camss drvier private
data, the private data just include some basic information now, later
changes will enumerate with csiphy, csid and vfe resources.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 32 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e24084ff88de..2f7697540578 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1634,6 +1634,29 @@ static const struct resources_icc icc_res_sc8280xp[] = {
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
+	{
+		.name = "icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -2644,6 +2667,14 @@ static const struct camss_resources sc8280xp_resources = {
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
@@ -2652,6 +2683,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
+	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6dceff8ce319..cf6672baea1c 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -84,6 +84,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8250,
 	CAMSS_8280XP,
+	CAMSS_8550,
 };
 
 enum icc_count {
-- 
2.34.1


