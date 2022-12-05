Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8666C642BAF
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiLEP13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbiLEP1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:27:03 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F050B1E72D;
        Mon,  5 Dec 2022 07:25:30 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5Dk1CV014634;
        Mon, 5 Dec 2022 15:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=bzcj5xVjRSmVIh/wqSOSKpnIOp0n6amFf3rtrbGSp9w=;
 b=a5syChQGOdmA2XyMyaexGLmtJgYcttv9lxtK44aTS/sNmw5YTlq7WyrWt/ygg/yU7iKM
 Edpy5OixsGlZt5FAWuweITY0KIsnixbZYRBnEkiTVy1mxzT+hxH4MLLrU10+Jct1v9EI
 D8SQxl3tr8EM3fEuNjCM6wlmwhRaLyRJF7asAldlSPSVKHObwby961cJdMoLNVD8VDpT
 fg/NeDlDlNP8dfG/Wk6TpOWcEOyAapmY6EZxGA54JIDPr9iCQS/dXQnFsyS2bZ+TEPI/
 ioZ4NWBOrpixB8Os45mpsvdLOToo38eNnplo6PbWOEO9u3gZY5VfbVa+1HMopEFemE5u 7Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7xp8mf7h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Dec 2022 15:25:13 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5FPDxC006589
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 5 Dec 2022 15:25:13 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 07:25:09 -0800
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v6 1/4] media: camss: sm8250: Virtual channels for CSID
Date:   Mon, 5 Dec 2022 17:24:47 +0200
Message-ID: <20221205152450.1099-2-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20221205152450.1099-1-quic_mmitkov@quicinc.com>
References: <20221205152450.1099-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FTyWUp5W5VrpPEhI-t_6VHhq1JkYpWce
X-Proofpoint-GUID: FTyWUp5W5VrpPEhI-t_6VHhq1JkYpWce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212050127
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

CSID hardware on SM8250 can demux up to 4 simultaneous streams
based on virtual channel (vc) or datatype (dt).
The CSID subdevice entity now has 4 source ports that can be
enabled/disabled and thus can control which virtual channels
are enabled. Datatype demuxing not tested.

In order to keep a valid internal state of the subdevice,
implicit format propagation from the sink to the source pads
has been preserved. However, the format on each source pad
can be different and in that case it must be configured explicitly.

CSID's s_stream is called when any stream is started or stopped.
It will call configure_streams() that will rewrite IRQ settings to HW.
When multiple streams are running simultaneously there is an issue
when writing IRQ settings for one stream while another is still
running, thus avoid re-writing settings if they were not changed
in link setup, or by fully powering off the CSID hardware.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
---
 .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++++-------
 .../media/platform/qcom/camss/camss-csid.c    | 44 ++++++++++-----
 .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
 3 files changed, 74 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2031bde13a93..0f8ac29d038d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -334,13 +334,14 @@ static const struct csid_format csid_formats[] = {
 	},
 };
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 	u32 val;
 	u32 phy_sel = 0;
 	u8 lane_cnt = csid->phy.lane_cnt;
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_SRC];
+	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
 	const struct csid_format *format = csid_get_fmt_entry(csid->formats, csid->nformats,
 							      input_format->code);
 
@@ -351,8 +352,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		phy_sel = csid->phy.csiphy_id;
 
 	if (enable) {
-		u8 vc = 0; /* Virtual Channel 0 */
-		u8 dt_id = vc * 4;
+		u8 dt_id = vc;
 
 		if (tg->enabled) {
 			/* Config Test Generator */
@@ -395,42 +395,42 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
-		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
+		writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
 
 		/* CSID_TIMESTAMP_STB_POST_IRQ */
 		val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
-		writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
+		writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
 
 		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
+		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
 
 		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
+		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(vc));
 
 		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
+		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
 
 		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
+		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
 
 		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(vc));
 
 		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(vc));
 
 		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(vc));
 
 		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(vc));
 
 		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
+		writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
 
-		val = readl_relaxed(csid->base + CSID_RDI_CFG0(0));
+		val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
 		val |=  1 << RDI_CFG0_ENABLE;
-		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
+		writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
 	}
 
 	if (tg->enabled) {
@@ -456,7 +456,16 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
 	else
 		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
-	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
+	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i;
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i))
+			__csid_configure_stream(csid, enable, i);
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
@@ -502,6 +511,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 	struct csid_device *csid = dev;
 	u32 val;
 	u8 reset_done;
+	int i;
 
 	val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
 	writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
@@ -510,8 +520,12 @@ static irqreturn_t csid_isr(int irq, void *dev)
 	val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
 
-	val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(0));
-	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(0));
+	/* Read and clear IRQ status for each enabled RDI channel */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+		}
 
 	val = 1 << IRQ_CMD_CLEAR;
 	writel_relaxed(val, csid->base + CSID_IRQ_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 88f188e0f750..6360314f04a6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -196,6 +196,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
+		csid->phy.need_vc_update = true;
+
 		enable_irq(csid->irq);
 
 		ret = csid->ops->reset(csid);
@@ -249,7 +251,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 			return -ENOLINK;
 	}
 
-	csid->ops->configure_stream(csid, enable);
+	if (csid->phy.need_vc_update) {
+		csid->ops->configure_stream(csid, enable);
+		csid->phy.need_vc_update = false;
+	}
 
 	return 0;
 }
@@ -460,6 +465,7 @@ static int csid_set_format(struct v4l2_subdev *sd,
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
+	int i;
 
 	format = __csid_get_format(csid, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
@@ -468,14 +474,14 @@ static int csid_set_format(struct v4l2_subdev *sd,
 	csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
-	/* Propagate the format from sink to source */
+	/* Propagate the format from sink to source pads */
 	if (fmt->pad == MSM_CSID_PAD_SINK) {
-		format = __csid_get_format(csid, sd_state, MSM_CSID_PAD_SRC,
-					   fmt->which);
+		for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; ++i) {
+			format = __csid_get_format(csid, sd_state, i, fmt->which);
 
-		*format = fmt->format;
-		csid_try_format(csid, sd_state, MSM_CSID_PAD_SRC, format,
-				fmt->which);
+			*format = fmt->format;
+			csid_try_format(csid, sd_state, i, format, fmt->which);
+		}
 	}
 
 	return 0;
@@ -738,7 +744,6 @@ static int csid_link_setup(struct media_entity *entity,
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
-		struct v4l2_subdev_format format = { 0 };
 
 		sd = media_entity_to_v4l2_subdev(entity);
 		csid = v4l2_get_subdevdata(sd);
@@ -761,11 +766,22 @@ static int csid_link_setup(struct media_entity *entity,
 		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
 		csid->phy.lane_cnt = lane_cfg->num_data;
 		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
+	}
+	/* Decide which virtual channels to enable based on which source pads are enabled */
+	if (local->flags & MEDIA_PAD_FL_SOURCE) {
+		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+		struct csid_device *csid = v4l2_get_subdevdata(sd);
+		struct device *dev = csid->camss->dev;
+
+		if (flags & MEDIA_LNK_FL_ENABLED)
+			csid->phy.en_vc |= BIT(local->index - 1);
+		else
+			csid->phy.en_vc &= ~BIT(local->index - 1);
 
-		/* Reset format on source pad to sink pad format */
-		format.pad = MSM_CSID_PAD_SRC;
-		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		csid_set_format(&csid->subdev, NULL, &format);
+		csid->phy.need_vc_update = true;
+
+		dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
+			__func__, csid->phy.en_vc);
 	}
 
 	return 0;
@@ -816,6 +832,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 	struct v4l2_subdev *sd = &csid->subdev;
 	struct media_pad *pads = csid->pads;
 	struct device *dev = csid->camss->dev;
+	int i;
 	int ret;
 
 	v4l2_subdev_init(sd, &csid_v4l2_ops);
@@ -852,7 +869,8 @@ int msm_csid_register_entity(struct csid_device *csid,
 	}
 
 	pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	pads[MSM_CSID_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; ++i)
+		pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->entity.ops = &csid_media_ops;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index f06040e44c51..d4b48432a097 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -19,8 +19,13 @@
 #include <media/v4l2-subdev.h>
 
 #define MSM_CSID_PAD_SINK 0
-#define MSM_CSID_PAD_SRC 1
-#define MSM_CSID_PADS_NUM 2
+#define MSM_CSID_PAD_FIRST_SRC 1
+#define MSM_CSID_PADS_NUM 5
+
+#define MSM_CSID_PAD_SRC (MSM_CSID_PAD_FIRST_SRC)
+
+/* CSID hardware can demultiplex up to 4 outputs */
+#define MSM_CSID_MAX_SRC_STREAMS	4
 
 #define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
 #define DATA_TYPE_YUV420_8BIT		0x18
@@ -81,6 +86,8 @@ struct csid_phy_config {
 	u8 csiphy_id;
 	u8 lane_cnt;
 	u32 lane_assign;
+	u32 en_vc;
+	u8 need_vc_update;
 };
 
 struct csid_device;
-- 
2.37.3

