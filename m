Return-Path: <linux-media+bounces-23587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121D9F4CA2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A3BA16AF46
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD821F5401;
	Tue, 17 Dec 2024 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GRwv/XHN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95FA1F3D3A;
	Tue, 17 Dec 2024 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442845; cv=none; b=nj9e7rr3sRLoVP+7hAxRGztmqvaizLFmWBRvX/iztUlL0OLnCwv/q9+4zQhpe280xoGqiE13J2OaBRYfp3dhzRvUDaE0KZ1yM7pe0r56Py90JjKazFVjK9HdGyMneuYweBF0LtDYOlBkb2R1dvwhoodB4XZePLWIZzTvjada2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442845; c=relaxed/simple;
	bh=+Zc5NG8dQaAWckamos63Vydm992wSJmKBZ2gKEhI/Ps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFOXE8wV0H+tF02AWZku5mqsk6gUFTyJDiqDbEwt1dY6X4FrWoAj21gnLWqS2pgDEZohf2qI4JuYuKv0nD1twX/vS/OrqREiBn45h3FqWbF1iucniHKWsmVrXYnxjz8Vb/JMDb94eGCf0JTOd32LqrTCjfghSybnpzE/fhFriXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GRwv/XHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH62Kdx007049;
	Tue, 17 Dec 2024 13:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UX+UB4pSAZuNGX3KLa2eoB0Vgo1doW5zbFcTpeB+Wnc=; b=GRwv/XHNuZP92TME
	we1SjG4MBgB6ggbeYMemeAOvF324nBMihU2BM5AA/7XKnHrGtZvFOPmFyYW0t+pt
	OEjjVu76/3aLZvCe7v5OQZxIYQi3GLOdSbzrmk/0Yvf4xMpAz9RjYyDZi6AWu9AQ
	L8G9AGZhZzFuEaaz5z0G9tBH54fGmJXEg6pLpxNGzbp13SUa2yBsJJe4p/hLT9bF
	/rSHayt4i5GietBbayUm3ue55MrSsjEtTq8a1tXMl/RtrOVpIg/x+Jw7KUJJYxDS
	0W39jOE0P7+8C7xG11Km8AhA6fTcn/MJOREaz6u712WBQjp39TuRctrCT1gQDQ+b
	kJ2huw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p497aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHDeVbm026346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:31 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 05:40:22 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 2/4] media: qcom: camss: update clock names for sc7280
Date: Tue, 17 Dec 2024 19:09:53 +0530
Message-ID: <20241217133955.946426-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
References: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 8JsqgL6lDzmv0S5wpTuwmYANDtIP7851
X-Proofpoint-GUID: 8JsqgL6lDzmv0S5wpTuwmYANDtIP7851
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170109

This patch changes gcc_cam_hf_axi clock name to make consistent
with existing platforms and add gcc_axi_sf clock too.
gcc_cam_hf_axi changed to gcc_axi_hf.
added gcc_axi_sf.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 004a74f6b2f6..1d992dc74877 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1443,12 +1443,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.regulators = {},
 
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
-			   "vfe0_axi", "gcc_cam_hf_axi" },
+			   "vfe0_axi", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 380000000, 510000000, 637000000, 760000000 },
 				{ 0 },
+				{ 0 },
 				{ 0 } },
 
 		.reg = { "vfe0" },
@@ -1468,12 +1469,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.regulators = {},
 
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
-			   "vfe1_axi", "gcc_cam_hf_axi" },
+			   "vfe1_axi", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 380000000, 510000000, 637000000, 760000000 },
 				{ 0 },
+				{ 0 },
 				{ 0 } },
 
 		.reg = { "vfe1" },
@@ -1493,12 +1495,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.regulators = {},
 
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
-			   "vfe2_axi", "gcc_cam_hf_axi" },
+			   "vfe2_axi", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 380000000, 510000000, 637000000, 760000000 },
 				{ 0 },
+				{ 0 },
 				{ 0 } },
 
 		.reg = { "vfe2" },
@@ -1516,11 +1519,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 	/* VFE3 (lite) */
 	{
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
-			   "vfe_lite0", "gcc_cam_hf_axi" },
+			   "vfe_lite0", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 320000000, 400000000, 480000000, 600000000 },
+				{ 0 },
 				{ 0 } },
 
 		.regulators = {},
@@ -1537,11 +1541,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 	/* VFE4 (lite) */
 	{
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
-			   "vfe_lite1", "gcc_cam_hf_axi" },
+			   "vfe_lite1", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 320000000, 400000000, 480000000, 600000000 },
+				{ 0 },
 				{ 0 } },
 
 		.regulators = {},
-- 
2.25.1


