Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D16BB6DC7CE
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 16:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjDJOXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Apr 2023 10:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjDJOXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Apr 2023 10:23:47 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1CC4690;
        Mon, 10 Apr 2023 07:23:46 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33AASt9J004542;
        Mon, 10 Apr 2023 14:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=cBlqGkxmQxIgOT1rZov+upX0Ik6NP0t3NVNA0I5drAA=;
 b=De+JSFj12fWcvBIwHx2/SxPIYxn3iROAMbhUd01Jo8VY5BWze2XboXveERo0perS00GW
 E27e0duu+466COL3YZQsZ5xtHUuWRHuUvQorWhmmd9bCbho8hanlUaBfMu9DPJp6grwa
 F9dP1Fr3Pgn8k0qyj7qwVGU6fqWmg9QrO1LrpALBQQqay+PXc6tcSVxowNOGRa4X/U8A
 BpfSoCYZGGHWOzopr5XRokr8WWL0dJP/rfHhnfyDX6YExL2oggsAnwexRyeYPx/d9wvT
 G9WXJSjXLkLMvmx/ZI76ZryYvOePx6Yp9AptWDQsO8UuXxbxxDuBSoDDmU0LlDUvwNFh Rw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pty9h374y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 14:23:38 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33AENbV7024880
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 14:23:37 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 10 Apr 2023 07:23:33 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <bryan.odonoghue@linaro.org>,
        <akapatra@quicinc.com>, <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v8 3/4] media: camss: vfe-480: Multiple outputs support for SM8250
Date:   Mon, 10 Apr 2023 17:22:31 +0300
Message-ID: <20230410142232.2135-4-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20230410142232.2135-1-quic_mmitkov@quicinc.com>
References: <20230410142232.2135-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C9uJTo1g9Bqrg8P5OF9B6yt_CPJxcEpG
X-Proofpoint-ORIG-GUID: C9uJTo1g9Bqrg8P5OF9B6yt_CPJxcEpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_10,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100122
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

On SM8250 each VFE supports at least 3 RDI channels, or 4
in case of VFE-Lite, so add appropriate IRQ setup and handling.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-480.c | 57 ++++++++++++-------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index f03a84daafbe..f70aad2e8c23 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -94,6 +94,8 @@ static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
 #define RDI_WM(n)			((IS_LITE ? 0 : 23) + (n))
 #define RDI_COMP_GROUP(n)		((IS_LITE ? 0 : 11) + (n))
 
+#define MAX_VFE_OUTPUT_LINES	4
+
 static u32 vfe_hw_version(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
@@ -171,12 +173,26 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 
 static void vfe_enable_irq_common(struct vfe_device *vfe)
 {
-	/* enable only the IRQs used: rup and comp_done irqs for RDI0 */
+	/* enable reset ack IRQ and top BUS status IRQ */
 	writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
 		       vfe->base + VFE_IRQ_MASK(0));
-	writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(vfe, 0) |
-		       BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)),
-		       vfe->base + VFE_BUS_IRQ_MASK(0));
+}
+
+static void vfe_enable_lines_irq(struct vfe_device *vfe)
+{
+	int i;
+	u32 bus_irq_mask = 0;
+
+	for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
+		/* Enable IRQ for newly added lines, but also keep already running lines's IRQ */
+		if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
+		    vfe->line[i].output.state == VFE_OUTPUT_ON) {
+			bus_irq_mask |= BUS_IRQ_MASK_0_RDI_RUP(vfe, i)
+					| BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i));
+			}
+	}
+
+	writel_relaxed(bus_irq_mask, vfe->base + VFE_BUS_IRQ_MASK(0));
 }
 
 static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
@@ -193,6 +209,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 {
 	struct vfe_device *vfe = dev;
 	u32 status;
+	int i;
 
 	status = readl_relaxed(vfe->base + VFE_IRQ_STATUS(0));
 	writel_relaxed(status, vfe->base + VFE_IRQ_CLEAR(0));
@@ -207,11 +224,14 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
 		writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
 
-		if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, 0))
-			vfe_isr_reg_update(vfe, 0);
+		/* Loop through all WMs IRQs */
+		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
+			if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
+				vfe_isr_reg_update(vfe, i);
 
-		if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)))
-			vfe_isr_wm_done(vfe, 0);
+			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
+				vfe_isr_wm_done(vfe, i);
+		}
 	}
 
 	return IRQ_HANDLED;
@@ -234,7 +254,6 @@ static int vfe_get_output(struct vfe_line *line)
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output;
 	unsigned long flags;
-	int wm_idx;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -246,12 +265,12 @@ static int vfe_get_output(struct vfe_line *line)
 
 	output->wm_num = 1;
 
-	wm_idx = vfe_reserve_wm(vfe, line->id);
-	if (wm_idx < 0) {
-		dev_err(vfe->camss->dev, "Can not reserve wm\n");
-		goto error_get_wm;
-	}
-	output->wm_idx[0] = wm_idx;
+	/* Correspondence between VFE line number and WM number.
+	 * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
+	 * Note this 1:1 mapping will not work for PIX streams.
+	 */
+	output->wm_idx[0] = line->id;
+	vfe->wm_output_map[line->id] = line->id;
 
 	output->drop_update_idx = 0;
 
@@ -259,11 +278,9 @@ static int vfe_get_output(struct vfe_line *line)
 
 	return 0;
 
-error_get_wm:
-	vfe_release_wm(vfe, output->wm_idx[0]);
-	output->state = VFE_OUTPUT_OFF;
 error:
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
+	output->state = VFE_OUTPUT_OFF;
 
 	return -EINVAL;
 }
@@ -360,6 +377,8 @@ static int vfe_enable(struct vfe_line *line)
 
 	vfe->stream_count++;
 
+	vfe_enable_lines_irq(vfe);
+
 	mutex_unlock(&vfe->stream_lock);
 
 	ret = vfe_get_output(line);
@@ -566,7 +585,7 @@ static const struct camss_video_ops vfe_video_ops_480 = {
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
 	vfe->video_ops = vfe_video_ops_480;
-	vfe->line_num = 1;
+	vfe->line_num = MAX_VFE_OUTPUT_LINES;
 }
 
 const struct vfe_hw_ops vfe_ops_480 = {
-- 
2.37.3

