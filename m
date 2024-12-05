Return-Path: <linux-media+bounces-22732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EF9E5A77
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3ABD16CC85
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD974227BB5;
	Thu,  5 Dec 2024 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IpgXXRu1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6FC227B93;
	Thu,  5 Dec 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414210; cv=none; b=bRuTr5NG/LxIw2sfOvCstBMPEZi+bXB6ZQFu8nVZ4EH/8XZLkvruCYUlxjRX5RXUlOve07+++C8OWFDd5RjROv4qJ83dnNO+x1miOrVZvsc0mjvAWRabYEQcLB7uexd2/yGOD4gIJATjCIfyQeJY/bvX8s4wg8BdXGR2e0tm90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414210; c=relaxed/simple;
	bh=Ii83cg4a2Y8R1elJhFgR/+AqwMODRWTgoFUP7JKhanI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCqBhooxKe6tOZPGDYDjTT+Rxd9ljnu3uaTUT70MYw1TD+t3KbL6Bu5GpcEtCp5ENlkbDJMPqvyra3/5xedD1gTFDssfAwgrOMleibTiJUEVPyeEEWVvvA/0Z5AlmaTWAZMdGW/Vf9/hLidA66RbrMQFiyl632Ve2DVfxH/vHXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IpgXXRu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59wlCD031112;
	Thu, 5 Dec 2024 15:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOTJqtfgwtVwPvp7KQnuv+nW8GeXNry+9tR/gjIRbJg=; b=IpgXXRu1zcJxsuNf
	cu17QRsY9pCFqjmVeHazPIqp190Ue3mxICHJnPky96dyqmijY7odQokI/ePkieee
	V7jZWhC/PNw/nVBN+lwyxgmtUIij9d5giAPlrDXypJmXgTeccqyhLP4LNXzz7tL1
	vB8DxTQvkVh8PFbHTiVjPdfGGdBft/W8qTHPW8YNSd8J5mR06GMWL9qelTm9FWP4
	YwhulMIiVNUnYhisqZC/sofwgCzlCzO2nXwwBzxkkhHHXGVbcw9njdAlW2ti0Zw4
	ybqXIXDh2ccf0Fkk3xy+8kX39TKEGZTNgQvyemoYptCaZgo6NLk9aU258LcIHU1W
	JlA3hA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba140y9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:56:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Fug0W021212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:56:42 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:56:35 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 10/16] media: qcom: camss: Add callback API for RUP update and buf done
Date: Thu, 5 Dec 2024 21:25:32 +0530
Message-ID: <20241205155538.250743-11-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: NprbIRFg4blgmo86Q7BDTgMn11jsCOIF
X-Proofpoint-ORIG-GUID: NprbIRFg4blgmo86Q7BDTgMn11jsCOIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050115

The RUP registers and buf done irq are moved from the IFE to CSID register
block on recent CAMSS implementations. Add callbacks structure to wrapper
the location change with minimum logic disruption.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
index 9fb31f4c18ad..e24084ff88de 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2087,6 +2087,28 @@ static int camss_link_entities(struct camss *camss)
 	return 0;
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
index 9da7f48f5dd7..6dceff8ce319 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -161,5 +161,8 @@ void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
+void camss_buf_done(struct camss *camss, int hw_id, int port_id);
+void camss_reg_update(struct camss *camss, int hw_id,
+		      int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.34.1


