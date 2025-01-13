Return-Path: <linux-media+bounces-24661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2CA0AE58
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28BA1882946
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4991C5F2D;
	Mon, 13 Jan 2025 04:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oFFYeeGx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93821AC892;
	Mon, 13 Jan 2025 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742772; cv=none; b=bO3Od6eTr0cH1+fLyjQS7cVwh76zqsCPr1OUqIFOBcfFMSiYVT811UWcdx2IwYVv04XqTm3WZX2+MC2t7NEks5qEF5WFMuyZGoHe2+fNrSTNCAHJyHfDAJVM28sJq1PmluJtbgWJma+p5oFywWiLeQXnC67pTflhufn4RRTPi6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742772; c=relaxed/simple;
	bh=mOG5M5D27h0AdLomWWOPLsIyOzlCZAho5zf+R5VPL90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BkxOie6vWIpngcxuw4wgzHD3Tv8SlxiZH/j22FNJnCOE89cWNg5LNFN40HhcoLWX58YUhx5RW5LlH2DKhCtPeqvDbma0SQhqnR2+MpkQwfSg16wrlRxgVXDG/OUtBBxsgqFF/DAR2HI99aET0SZ/GnKXEZMx25Ok3LSbfLOt3kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oFFYeeGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CMoCkr001320;
	Mon, 13 Jan 2025 04:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOsejiuw/lSvSdV7vx66g5YxR70hk1zKrc2syDkL8P8=; b=oFFYeeGxTZ5g1v1b
	LoZw7oTv2UZG1X4uCj9X0rObC6t/TF6kNKQng1kii2vuft8C9ZFp/rysyc9GfS5z
	sjtu/1HVrWSSoDZgq2LwxaEJpJrRoN3XEyM9od/wAMMwtMHBwV7qGcxA0MMPR9EW
	K97UHL4OmF/caJ9cKP6ih2t9ARjI9QmkXrhrdUdrMfeksdMiqHNg54oT+HeL0GBq
	DsHIVq7oR19DRsy/J54/TFE3/9wZNeFJRbQG6ba5egpyoN0lhb3m/FLhtRlk2mtf
	Ufh92KlmnMf7BPlEIDoHuZJQhev7+m1FtXg+r8Br24UDocM/bKIem+wS1FBQc75F
	TwnTQA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkjb5a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4WkHY031735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:46 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:32:40 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 09/16] media: qcom: camss: Add callback API for RUP update and buf done
Date: Mon, 13 Jan 2025 10:01:26 +0530
Message-ID: <20250113043133.1387162-10-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: EQ1OXaG3Elh8u1ZTf4vpi92bRMTRQi4Z
X-Proofpoint-ORIG-GUID: EQ1OXaG3Elh8u1ZTf4vpi92bRMTRQi4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130036

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
index f52209b96583..4f8765c251bc 100644
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
@@ -169,6 +177,7 @@ struct csid_device {
 	void __iomem *base;
 	u32 irq;
 	char irq_name[30];
+	u32 reg_update;
 	struct camss_clock *clock;
 	int nclocks;
 	struct regulator_bulk_data *supplies;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a85e9df0f301..7594d9ee11b2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2403,6 +2403,28 @@ static int camss_link_entities(struct camss *camss)
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


