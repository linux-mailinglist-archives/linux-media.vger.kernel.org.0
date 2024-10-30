Return-Path: <linux-media+bounces-20575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A098F9B6097
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D297B1C2125E
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74461E47DE;
	Wed, 30 Oct 2024 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tnoh7md5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1769B1E3DEC;
	Wed, 30 Oct 2024 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285688; cv=none; b=BpIzUXBlLE42sJ/C5Pnrrkb4UpbVNR79GmklMbxohpXLsB6+guOe1gwaknqKVZRRXvwHRKTCSpOrAZ0oMmIOmiX8qhZJ6rBAgNU6yoDeGj/bJcSPtiCvPb1/bxhO3dMZfhpcDQhn5kI2XMOFzxhYOu89AbWq6QzYaSSGSJDemlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285688; c=relaxed/simple;
	bh=emPUvFrFXkDopSdcqNjR5Kvbp8S1Qe7u/dQgK8JwJD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tPWNw67losbDHjGNZHBW4fRESJNBfuq6hliEYY0FjbTiu0ggeomwl/8gjkxm8O0Pz2RaxQJ0VE/nKDAYfrmxBwv345AXCBEUvGs/jzHjh5U8f7TnKfF7TJ/QI5VzHhmDLZsHR0qye09E128uJKkwFYPPwD9t1xUualz6igul1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tnoh7md5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U5FgMQ027398;
	Wed, 30 Oct 2024 10:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UrmOgvd2ceRG8Y7uibtKUk24yS8TIwwaTKhvVRRaeuI=; b=Tnoh7md5jBteXjva
	eY7m+cTMahmBvmmyBdSZVItR3aeu5bObZqpX+ijmAe3CoPfw/nK6qdp5HvarEr5q
	s6e5iL4Mr7maFHjqaWUhLXU5ysS+PVHM6Rt05qetbMncdme6QVRSDc/I4Zx95Qs7
	f27Vo3eObHP2h66yFqKXq+4MVKOPFY0agjFtEk5XUGLYEcxWPiwCvYkbQzMnP4a5
	wg0dy9dbxu8JKr26M/nVy6f5YahCtRyDJ1gDAIE9JSw/4KpRa83whPvjolXsH//w
	Gg4rL5J0I4pO7wA/iTgSQ94U5UXtjJxPqbzFrfGj9LRcwvOhDdk1+dDmyGZZD8sC
	chFuHw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k1p330mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UAsUZ5015557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:30 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 03:54:21 -0700
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
Subject: [PATCH v4 2/6] media: qcom: camss: Sort CAMSS version enums and compatible strings
Date: Wed, 30 Oct 2024 16:23:43 +0530
Message-ID: <20241030105347.2117034-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: GsQRDTPCc9ytlV9Di90RyfcRwUSLZOzI
X-Proofpoint-ORIG-GUID: GsQRDTPCc9ytlV9Di90RyfcRwUSLZOzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300084

Sort CAMSS version enums and compatible strings alphanumerically.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 10 +++++-----
 drivers/media/platform/qcom/camss/camss-vfe.c          |  6 +++---
 drivers/media/platform/qcom/camss/camss.c              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index df7e93a5a4f6..7d2490c9de01 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -505,10 +505,6 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 	u32 val;
 
 	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		r = &lane_regs_sdm845[0][0];
-		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
-		break;
 	case CAMSS_8250:
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
@@ -517,6 +513,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		r = &lane_regs_sc8280xp[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
 		break;
+	case CAMSS_845:
+		r = &lane_regs_sdm845[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
+		break;
 	default:
 		WARN(1, "unknown cspi version\n");
 		return;
@@ -557,9 +557,9 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
-	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_845:
 		ret = true;
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..ffcb1e2ec417 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -333,11 +333,11 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	case CAMSS_8x96:
 	case CAMSS_660:
-	case CAMSS_845:
+	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_845:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1692,9 +1692,9 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
-	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_845:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fabe034081ed..e8cd8afe7bee 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2456,10 +2456,10 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
-	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ }
 };
 
-- 
2.25.1


