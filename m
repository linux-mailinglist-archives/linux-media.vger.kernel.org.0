Return-Path: <linux-media+bounces-37505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0CB01D19
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E109765C38
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143612DBF45;
	Fri, 11 Jul 2025 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="naUzYY80"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185D2D8772;
	Fri, 11 Jul 2025 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752239558; cv=none; b=He7QPiJNHVGLmXE90E+7BX5ei8mprTnyjoOYg9MvN0+n+VQvdfS1rJebmezAblIwn0TOI0YZEcwYoh7EIZhHb+v1rQPDWC8MB8lMm2Qgk3Fw8xfdc7xPXwbtnGWcnn6LDCyHI9oB+dX+VlZm8Rhua+4zEsEa1jA0eG8iS+xR8Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752239558; c=relaxed/simple;
	bh=INIiCPRzBX8DD1XxVEBsBqd5ZSo7UdE2Mszw4qWRrt0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fuwVgAVBFKVBdqB7j5OT5kNvUAHnHZxMYnOruSH2hF/gLFwhNh8cc/eRaVZPFxklDAK9h1UMydn/kTNGZPPLZNW3S/xzlKihSlq7LVr/hAozmkd2UmWhzFS6DKVFWv0xK2fAH7Cx97aLKG8PJSzThHANPT54gletHwdapmFLZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=naUzYY80; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAUdOr018284;
	Fri, 11 Jul 2025 13:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTefLwab6y4wKK3qCZuwcJtFI1zo2uWgrNN0F8ExCsQ=; b=naUzYY80kqdodNDH
	y1yy2KviwL1HHy65MEXieMA0FbGDRJ6TqWSTn6Y+QsipmI/uxYahmliTBZQHXcbc
	7EhsoZZ4jVFIpY+32nlyhqWy2NLY8gSN4eas2y3633UadzZAFGAyxJZr/Cv6ty7O
	sJkFVr2+lcViW2H53PfJsaDcKStg6iw72B1xnISdzdn7uok9jnHPTdFNgPxJzPEz
	uerj23/LNzERYpsWIUe6YrHuZN5i6k1AXTqLtgTOioTyQ/nb6Nl3XuywWRUtyDH4
	gY0ytOloyJwtVxufMkc4Pk2TeLfQVts2PTcBX1W8X9ByU8a2i8FUivrXqvl0d4hP
	vQQ2iw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf32j63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDCPf4008868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:20 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/7] media: qcom: camss: Add qcs8300 compatible
Date: Fri, 11 Jul 2025 18:41:30 +0530
Message-ID: <20250711131134.215382-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfX2AhmSbWPz4TN
 z3ZyLpFnHmLn5o9PWvq8bxPRf2LjRp5ZDQMJrkubeR6PgWi6LJhGaae+hwv8SqGUWMtOCDJ83oU
 Y6RctfdH85F1i4GSzkcfRqqBoSnZXyQD3k7j49wKucioj8xdRnwX4WAliTH7eHj6dxzQ9jyweii
 QYW0wbEG2goqCgXy8QsgLC+jK1A45I5Ji+YTnSdYCl2YlfXYsdXiLRbJ01MkTTNwKjqmsyyQMXL
 eRaw1KqAtY6fBYC12aOW874UdE3sZ6/8+oE7W33pyDrx/m36ZTeClOjS1i81PCd1Ti+GY0X8Szg
 DgTeJgxcqBVIgkrwOQs7yeCwmmX+GeQNrL1zXjSVncQz39OXmR9aVK4g5J72Rr9UTUVm8+SNvH1
 cYyzohd1DUjmFs6fQaCYWMCq4TWj/Un62FvqC4phYL2plDKhyioHwjwQTiUdGj0z941GMHXy
X-Proofpoint-GUID: z3pSdBP2adka-nl_0HXe-kVW1G3YYUmM
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68710dba cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=R4QheEYGlDiWUf2spAAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z3pSdBP2adka-nl_0HXe-kVW1G3YYUmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093

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
index 6f5b70bcf488..5211367b535d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2898,6 +2898,19 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -4180,6 +4193,13 @@ static const struct camss_resources msm8996_resources = {
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
@@ -4308,6 +4328,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcs8300-camss", .data = &qcs8300_resources },
 	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 345479f6feba..b5600a8b2c4b 100644
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


