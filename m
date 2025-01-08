Return-Path: <linux-media+bounces-24436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122DA05F07
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B1127A2FE4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05445200100;
	Wed,  8 Jan 2025 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C3GgCY+1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9831FFC53;
	Wed,  8 Jan 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347155; cv=none; b=D0vtNaVVJmzKBUX4aDOruOJb0ONs4Uu4ccdEDtnXcYPsOkqkJeVAo/ous3KheN5dwuDUEMCRq8S8cPACYMGLrWGOxdacA9R7/VoE8SrS4HNVWZZ7vOShBTyuxwXQ1tcg36b1X3GZiSA4n5HSVob2N38mdp3J2uXPXX0/nWDnP28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347155; c=relaxed/simple;
	bh=62lJfYZwjI+odMSI8a5F9yahcWVshb1l87VGpFV0oeM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkoTVgveHDO2IlxTewszEPm5tX7usNg+Ack6QBdJLmhjS178V0WJT5pAhdU9HPRhY9/9kV1tue7UCVRk0xFRVLxZMa15ppI9QyiBu8aklvhkOIHm2BkNrkl1OF+EkfT+fB2tz1mvRADPq9scvrS4ILT6p7bxXcK5Mk6RKN7BbMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C3GgCY+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkWPY007576;
	Wed, 8 Jan 2025 14:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsJQCH/59GXpLRdG3vXXqWO24X6t1yLlKE72hHEmPdY=; b=C3GgCY+17//yXKxb
	qloedK5ynouxHy+cpLheA9yFY86TIkFgiEHArfv240K+TgFELsKJzxPb23r3sL9z
	y5BYVtSG8uNHo8p0Mushf+ZktpbKHqmC17kNO3W5eWsCqy9D/nR/hOXbka7LQFWT
	XkorNBvYKelVcF6i86brvfR/pNVOX390h/AfM+7Xwx8I8eP45tEHB7STk0PGDO67
	z3eNSF6cUpBU2G5crM/AgWJKW3gE2T2kDxU0NDAf1I/+inGNqUrMFwnv2+dqR0cs
	c2oyavv/7i8SDuDiKuo4vlDd0CX3l/y5mH4v4GlaDWq+naZSFDhBuhJeOQz9Y2Bd
	dO7wMQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441phg8s8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:39:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Ed80t004156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 14:39:08 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 06:39:02 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v8 09/16] media: qcom: camss: Add callback API for RUP update and buf done
Date: Wed, 8 Jan 2025 20:07:26 +0530
Message-ID: <20250108143733.2761200-10-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108143733.2761200-1-quic_depengs@quicinc.com>
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: XzqGgtshKOSjrL76LSwXvq1AlyYLJtqy
X-Proofpoint-ORIG-GUID: XzqGgtshKOSjrL76LSwXvq1AlyYLJtqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080122

The RUP registers and buf done irq are moved from the IFE to CSID register
block on recent CAMSS implementations. Add callbacks structure to wrapper
the location change with minimum logic disruption.

Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csid.h    |  9 ++++++++
 drivers/media/platform/qcom/camss/camss.c     | 22 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  3 +++
 3 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index f52209b96583..1369e7ea7219 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -152,6 +152,14 @@ struct csid_hw_ops {
 	 * @csid: CSID device
 	 */
 	void (*subdev_init)(struct csid_device *csid);
+
+	/*
+	 * reg_update - receive message from other sub device
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing reg update or setting reg update
+	 */
+	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
@@ -168,6 +176,7 @@ struct csid_device {
 	struct media_pad pads[MSM_CSID_PADS_NUM];
 	void __iomem *base;
 	u32 irq;
+	u32 reg_update;
 	char irq_name[30];
 	struct camss_clock *clock;
 	int nclocks;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 004a74f6b2f6..f93b520ef038 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2454,6 +2454,28 @@ static int camss_link_entities(struct camss *camss)
 	return ret;
 }
 
+void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_buf_done(struct camss *camss, int hw_id, int port_id)
+{
+	struct vfe_device *vfe;
+
+	if (hw_id < camss->res->vfe_num) {
+		vfe = &camss->vfe[hw_id];
+
+		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
+	}
+}
+
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9a046eea334f..bd1d1d2b831d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -162,5 +162,8 @@ void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
+void camss_buf_done(struct camss *camss, int hw_id, int port_id);
+void camss_reg_update(struct camss *camss, int hw_id,
+		      int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.34.1


