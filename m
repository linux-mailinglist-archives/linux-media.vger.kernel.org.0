Return-Path: <linux-media+bounces-14788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D192BF5F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33B09282FBC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CE11ABC54;
	Tue,  9 Jul 2024 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gjk5OOj4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D319DF58;
	Tue,  9 Jul 2024 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541283; cv=none; b=JSWX7Q4zk0aacSARkUyedv7rHgQKUyXew3yEEYUZtT3un8Q5DEApfVmyvBy6RPm4MpdRN3nMLCoVWf6CQ9JB1I3hNSGM25p6r1TAgTxkItL9+scnAcdPhgoRiGg4Z/imZ1yqgnuk1oC3igIpfesYSEvPMrt+RTtJ/et8vMozY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541283; c=relaxed/simple;
	bh=D3/MM6wsAikSB28k9xrDVzoUgv/OUKf2WqjFPgwIjHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sd7jmqgy6t6YAbQ73z4orOT+PTCNbdOvuCwfzTZnl1NB1/DhfefvxotrpC12dgAQ8uk/StOfcwjKxi6qgVBkBBQKTzi7AxRp7T/5DIaCOh5SwyFwaHjBRsMWLfRtBS4C23SpOzWPCF6/YlPV9z0JfzPeqxjKhw/KvkTTPJuNCsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gjk5OOj4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469A5Ssg026613;
	Tue, 9 Jul 2024 16:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bk6i63fvhn2zSDSzb4yZNj1+
	M5Y33XI3RjtVbK7AMTs=; b=Gjk5OOj4wfsu+b/8vrKqDb6Zgr0WYGcXHtNviN7R
	IS/CDOLTbKa7ui9HYH93xar9AXpxr8LkU4tXCviGDNDec+/SNXcaITuWkHyIi8Oq
	tTQnxoE3QX8NhTBTRggSiofBJ69Ba3Ag0S2NFl6809jAlaUWj3mczHwiFO4kTV4g
	DmSnXM1LqsYkp7QOAN9ofEGlrwrT2bcZUrVXei3OwE5q0koJQnuAdKn3rNRlesmb
	YRGYFFHuZHXWzBAQ4zMR9lwD+PJtGmsYXMd+qvb+GEgWbUtRm2v9i3GI9OFZbXl2
	VOS+Euyt0YZCGLPMqvjACJ60jpFbQ4ZVYm+Ia7YgmGMoYg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t7652-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7uvB030907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:56 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:49 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 11/13] media: qcom: camss: Add notify interface in camss driver
Date: Tue, 9 Jul 2024 21:36:54 +0530
Message-ID: <20240709160656.31146-12-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q2oCdKuzDkPnoNjk7VWO6_brxHxH9KNI
X-Proofpoint-ORIG-GUID: q2oCdKuzDkPnoNjk7VWO6_brxHxH9KNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

The main v4l2 process logic in camss vfe subdev driver, so the vfe driver
handles the buf done irq and register update configuration. But the buf
done irq and register update configuration have been moved CSID HW in
Titan 780 and other new platform, so vfe driver needs to call into CSID
driver to configure the register update. And CSID driver also needs to
call into vfe driver to notify of the buf done irq.

Adding this notify interface in camss structure to do the subdevs cross
communication to decouple CSID and VFE, the subdevs can add an interface
to process the message what is routed from other subdevices, then we can
process the cross communication easily.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../platform/qcom/camss/camss-csid-gen3.c     | 38 +++++++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |  8 ++++
 .../media/platform/qcom/camss/camss-vfe-780.c | 29 +++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  1 +
 drivers/media/platform/qcom/camss/camss.c     | 47 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  9 ++++
 6 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 17fd7c5499de..585054948255 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -312,6 +312,18 @@ static u32 csid_hw_version(struct csid_device *csid)
 	return hw_version;
 }
 
+static void csid_reg_update(struct csid_device *csid, int port_id)
+{
+	csid->reg_update |= REG_UPDATE_RDI(csid, port_id);
+	writel_relaxed(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
+}
+
+static inline void csid_reg_update_clear(struct csid_device *csid,
+					int port_id)
+{
+	csid->reg_update &= ~REG_UPDATE_RDI(csid, port_id);
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -341,6 +353,14 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (csid->phy.en_vc & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
+				/* For Titan 780, Buf Done IRQ&REG has been moved to CSID from VFE.
+				 * Once CSID received Buf Done, need notify this event to VFE.
+				 * Trigger VFE to handle Buf Done process.
+				 */
+				csid->camss->notify(&csid->subdev, CAMSS_MSG_BUF_DONE, (void *)&i);
+			}
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;
@@ -434,6 +454,23 @@ static void csid_subdev_init(struct csid_device *csid)
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
 }
 
+static void csid_subdev_process_msg(struct csid_device *csid, unsigned int msg_type, void *arg)
+{
+	int msg_data = *(int *)arg;
+
+	switch (msg_type) {
+	case CAMSS_MSG_RUP:
+		csid_reg_update(csid, msg_data);
+		break;
+	case CAMSS_MSG_RUP_CLEAR:
+		csid_reg_update_clear(csid, msg_data);
+		break;
+	default:
+		dev_err(csid->camss->dev, "NOT Supported EVT Type\n");
+		break;
+	}
+}
+
 const struct csid_hw_ops csid_ops_gen3 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
@@ -442,4 +479,5 @@ const struct csid_hw_ops csid_ops_gen3 = {
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
+	.process_msg = csid_subdev_process_msg,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ae5b6b0dc0ea..714a8db855fd 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -152,6 +152,14 @@ struct csid_hw_ops {
 	 * @csid: CSID device
 	 */
 	void (*subdev_init)(struct csid_device *csid);
+
+	/*
+	 * process_msg - receive message from other sub device
+	 * @csid: CSID device
+	 * @evt_type: event type
+	 * @arg: arguments
+	 */
+	void (*process_msg)(struct csid_device *csid, unsigned int evt_type, void *arg);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index abef2d5b9c2e..3279fe53b987 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -131,13 +131,23 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u64 addr,
 
 static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
-	/* TODO: Add register update support */
+	int port_id = line_id;
+
+	/* RUP(register update) registers has beem moved to CSID in Titan 780.
+	 * Notify the event of trigger RUP.
+	 */
+	vfe->camss->notify(&vfe->line[line_id].subdev, CAMSS_MSG_RUP, (void *)&port_id);
 }
 
 static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 					enum vfe_line_id line_id)
 {
-	/* TODO: Add register update clear support */
+	int port_id = line_id;
+
+	/* RUP(register update) registers has beem moved to CSID in Titan 780.
+	 * Notify the event of trigger RUP clear.
+	 */
+	vfe->camss->notify(&vfe->line[line_id].subdev, CAMSS_MSG_RUP_CLEAR, (void *)&port_id);
 }
 
 /*
@@ -390,6 +400,20 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 	vfe->video_ops = vfe_video_ops_780;
 }
 
+static void vfe_subdev_process_msg(struct vfe_device *vfe, unsigned int msg_type, void *arg)
+{
+	int port_id = *(int *)arg;
+
+	switch (msg_type) {
+	case CAMSS_MSG_BUF_DONE:
+		vfe_buf_done(vfe, port_id);
+		break;
+
+	default:
+		break;
+	}
+}
+
 const struct vfe_hw_ops vfe_ops_780 = {
 	.global_reset = NULL,
 	.hw_version = vfe_hw_version,
@@ -401,4 +425,5 @@ const struct vfe_hw_ops vfe_ops_780 = {
 	.vfe_enable = vfe_enable,
 	.vfe_halt = vfe_halt,
 	.vfe_wm_stop = vfe_wm_stop,
+	.process_msg = vfe_subdev_process_msg,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 10e2cc3c0b83..a8b09ce9941b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -115,6 +115,7 @@ struct vfe_hw_ops {
 	int (*vfe_halt)(struct vfe_device *vfe);
 	void (*violation_read)(struct vfe_device *vfe);
 	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
+	void (*process_msg)(struct vfe_device *vfe, unsigned int msg_type, void *arg);
 };
 
 struct vfe_isr_ops {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f1f44f6fbb2..abeb0918e47d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2202,6 +2202,52 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+static void camss_notify_msg(struct v4l2_subdev *sd,
+			unsigned int msg_type, void *arg)
+{
+	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
+	struct camss *camss = to_camss(v4l2_dev);
+	struct vfe_device *vfe;
+	struct vfe_line *vfe_line;
+	struct csid_device *csid;
+	int evt_data = *(int *)arg;
+
+	switch (msg_type) {
+	case CAMSS_MSG_BUF_DONE:
+		csid = v4l2_get_subdevdata(sd);
+		vfe = &(camss->vfe[csid->id]);
+		if (vfe->res->hw_ops->process_msg)
+			vfe->res->hw_ops->process_msg(vfe,
+				CAMSS_MSG_BUF_DONE, (void *)&evt_data);
+		break;
+
+	case CAMSS_MSG_RUP:
+		vfe_line = v4l2_get_subdevdata(sd);
+		vfe = to_vfe(vfe_line);
+		csid = &(camss->csid[vfe->id]);
+
+		if (csid->res->hw_ops->process_msg)
+			csid->res->hw_ops->process_msg(csid,
+				CAMSS_MSG_RUP, (void *)&evt_data);
+		break;
+
+	case CAMSS_MSG_RUP_CLEAR:
+		vfe_line = v4l2_get_subdevdata(sd);
+		vfe = to_vfe(vfe_line);
+		csid = &(camss->csid[vfe->id]);
+
+		if (csid->res->hw_ops->process_msg)
+			csid->res->hw_ops->process_msg(csid,
+				CAMSS_MSG_RUP_CLEAR, (void *)&evt_data);
+
+		break;
+
+	default:
+		dev_err(camss->dev, "Not supported evt type\n");
+		break;
+	}
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -2272,6 +2318,7 @@ static int camss_probe(struct platform_device *pdev)
 	media_device_init(&camss->media_dev);
 
 	camss->v4l2_dev.mdev = &camss->media_dev;
+	camss->notify = camss_notify_msg;
 	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 73c47c07fc30..65fcebd42c4b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -86,6 +86,13 @@ enum icc_count {
 	ICC_SM8250_COUNT = 4,
 };
 
+enum camss_notify_message {
+	CAMSS_MSG_BUF_DONE = 0,
+	CAMSS_MSG_RUP,
+	CAMSS_MSG_RUP_CLEAR,
+	CAMSS_MSG_MAX,
+};
+
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
@@ -116,6 +123,8 @@ struct camss {
 	struct device_link *genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
+	void (*notify)(struct v4l2_subdev *sd,
+		unsigned int notification, void *arg);
 };
 
 struct camss_camera_interface {
-- 
2.34.1


