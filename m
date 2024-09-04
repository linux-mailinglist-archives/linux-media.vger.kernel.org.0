Return-Path: <linux-media+bounces-17563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37596B9DD
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DB8281422
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5043A1D4170;
	Wed,  4 Sep 2024 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gmls/LGz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F82F1D016C;
	Wed,  4 Sep 2024 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448354; cv=none; b=sBCPSeLv2bpdLFOtDL2XTJPq9RH8hEmuGTo/UbeVPTmdQzMd8sFKxepwx5fPf50CmwWxLQCtcfJj94g3gDs7eNFWRm47zSGr5+XoQ9mbdgrGUz6oepVbgnKQVjp3nvqTkBMEUOCkZrTzds1IPsW/SD0M8JYB19x64Ly0GenVc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448354; c=relaxed/simple;
	bh=Kcp2kWdP+HNWbKqjmmtJA1KBNWiD20CxJPBdj/Q6yBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=muVkKU+1Dts3bifzoFjIjk8JkS+UBwfqkEy09TYVyeJgZuk1SdIs5nu1Cz/wre4jnBVeK7EjCG8D2lc4hJhwHcF1D08o6EtdQgMa5uRBCUQEmB7yvf0s+S3z29OeyC7iPYaL/JVO6xiV+4k5+ak+9CbVQTHXmAUzZ3C0CM7k5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gmls/LGz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484A1b30001041;
	Wed, 4 Sep 2024 11:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrLAh74DYFhvMtwKfP+Vk1B+Ukjx+HUK386pS2ziaA4=; b=gmls/LGz+Gv2cpc1
	IfspzQqFETYcj89L9IZ12oTza7NnMAI961D4joDoh9glSVV5oy2SNwoB61zPwi+1
	jRm0FR71RiwCSVJibfBYmchCBhwyNMl0i4j7wdTg7CQA1X3Jj2czg5zDWwJvEFDJ
	0Utq7PL4sbiTmTYkUCxmceUrRiwn2X2J0UEQ4EVVpJK3+qHxJP3k/hRP5nvvUH2T
	B4oDm4naoz3tWJd+ewfJQkMlBxrya3ptbu2BdWMpIp6dHY6Z+bJk4oEBRE1p/VUH
	oCSKd7sk8G1vmwtG7N4S3cWOcE3+gBl8rIl9tBWKz/JH+nOnEBGlVGySIhNbywLO
	IeGssw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe4t0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:12:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BCDGe030749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:12:13 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:12:07 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:12 +0530
Subject: [PATCH 06/10] media: qcom: camss: Add camss_link_entities_v2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-6-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=2731;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=Kcp2kWdP+HNWbKqjmmtJA1KBNWiD20CxJPBdj/Q6yBo=;
 b=al04Z44xl/mD5WvI/+Adn6dxipaTdlSF0P/YK/L1JRrbsxLWYBS+XBnFzoXTxFcoxCxk2gRlH
 m1ruQorThyRDCrJRjjbnzaci7EIpEQ/QlE2DpWbRM3FQz+FCBDHn01g
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g8Ew9EuCdgjlSPMOUzuaIx_G6yK7WyOv
X-Proofpoint-ORIG-GUID: g8Ew9EuCdgjlSPMOUzuaIx_G6yK7WyOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=848 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040084

Add camss_link_entities_v2, derived from the camss_link_entities
function, to handle linking for targets without ISPIF.

camss_link_entities -> Targets with ispif.
camss_link_entities_v2 -> Targets without ispif.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 53 ++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5e7235001239..516434686a27 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2154,6 +2154,57 @@ static int camss_init_subdevices(struct camss *camss)
 	return 0;
 }
 
+/*
+ * camss_link_entities_v2 - Register subdev nodes and create links
+ * @camss: CAMSS device
+ *
+ * Return 0 on success or a negative error code on failure
+ */
+static int camss_link_entities_v2(struct camss *camss)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		for (j = 0; j < camss->res->csid_num; j++) {
+			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
+						    MSM_CSIPHY_PAD_SRC,
+						    &camss->csid[j].subdev.entity,
+						    MSM_CSID_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s entities: %d\n",
+					camss->csiphy[i].subdev.entity.name,
+					camss->csid[j].subdev.entity.name,
+					ret);
+				return ret;
+			}
+		}
+	}
+
+	for (i = 0; i < camss->res->csid_num; i++)
+		for (j = 0; j < camss->vfe[i].res->line_num; j++) {
+			struct v4l2_subdev *csid = &camss->csid[i].subdev;
+			struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
+
+			ret = media_create_pad_link(&csid->entity,
+						    MSM_CSID_PAD_FIRST_SRC + j,
+						    &vfe->entity,
+						    MSM_VFE_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s entities: %d\n",
+					csid->entity.name,
+					vfe->entity.name,
+					ret);
+				return ret;
+			}
+		}
+	return 0;
+}
+
 /*
  * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
@@ -2769,7 +2820,7 @@ static const struct camss_resources sc8280xp_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
 	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
 	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
-	.link_entities = camss_link_entities
+	.link_entities = camss_link_entities_v2
 };
 
 static const struct camss_resources sc7280_resources = {

-- 
2.25.1


