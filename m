Return-Path: <linux-media+bounces-24070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F579FC57F
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 14:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453DB1882EF1
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 13:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28781BC064;
	Wed, 25 Dec 2024 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ux+lrfK5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D62D1CCB4A;
	Wed, 25 Dec 2024 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735133784; cv=none; b=I33UF/ynMnHJzBpVLyeuR198UsrfdiNKaYh7uuNUFPqnH7KPmP/pEPLpcc5/Xetg+9eSFYVsxzohfPws/fefg8kioIzD22tplHdmQs2LT4mMKrWLRsP7jjie41PpERV1qCNSGZIDreLrCyL7vDiUIyU1wOOtJctOHXRSrj9wb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735133784; c=relaxed/simple;
	bh=62lJfYZwjI+odMSI8a5F9yahcWVshb1l87VGpFV0oeM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/MS0jNawEl9UYohm7TjP0kKlaezicViMKBImhxBkqFzWLObKgrNMR7aEa+Gwk4fJk062T4cvKy8ckLGONGnOhiktEopVvVRUoBQFY3r8v3B893xeJbZ4o7czNb2+HKX199om5mepiXK1W7JdhjcjECY84zWmmV88tiijnQlZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ux+lrfK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP9Uu7e019311;
	Wed, 25 Dec 2024 13:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsJQCH/59GXpLRdG3vXXqWO24X6t1yLlKE72hHEmPdY=; b=Ux+lrfK5lCtJ9gAu
	paa+1Ca0zXKLPOF8PmXjMrYSQOVE+4ezOBwnosLd+nUHMokif/yTlC7SBLUkyAas
	MMfTFUpAg9ADOjbQCkHCqjC9hlXzSBra0i4JFsdvojg9PNwIId7lkQiciUAdYl2L
	xpoPEC9OITff9MZUskKknoZ4YKwMKtrFVufvfyFfVYDBjULHqkdpn6R3g28v9WkU
	IlVtYz2Qtob3mfT8asfpLYM2YkvM0pMpQOPJ/m4KzjU+5Pm7Uo8Rqkxuap/uA9vn
	l0jPLRe9wG3x8AByVZeYUcxe8JHQZBVqBXkR5qfbpfEKKJhxudWc5CglXCFTHMg0
	K2zDew==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rffxghxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDaIZ3012000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:18 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 05:36:12 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update and buf done
Date: Wed, 25 Dec 2024 19:05:16 +0530
Message-ID: <20241225133523.4034820-10-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225133523.4034820-1-quic_depengs@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0YvBCo62oi8lVvqVs_LESo3jaSf2sGsH
X-Proofpoint-GUID: 0YvBCo62oi8lVvqVs_LESo3jaSf2sGsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250121

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


