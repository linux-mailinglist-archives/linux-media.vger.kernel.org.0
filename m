Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A8F648049
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 10:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiLIJl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Dec 2022 04:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiLIJl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Dec 2022 04:41:26 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A56254762;
        Fri,  9 Dec 2022 01:41:25 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B99dvui013969;
        Fri, 9 Dec 2022 09:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=yekuQf9WN+3YB7oiCGodcXmVhT//PoO8mnUgLyWnxww=;
 b=n21NgkX4Gi9QWTS3FQ1qSH0BBpFZ87yxUdysD6aNym+zZw3MfVt1hW9luXBqbwyBCUxe
 Mg/fg4RZbTdnDO05p9Amj55R50P+N9INBGKQj7KZhcbrmltP4waqnG7IhsgFRcUQ4eNs
 E7axEYGcT0S4X6zfhoNiIdTcMlDwDAAD53YoMSJHCiEG4Nf2Csk9wKUFjsPWDKBpCfbY
 2YmsjCKi4ZPn28URqimnFVMwwX5MG8gZWOY0mgd81nml2K3IraocoMxjjJx1KXyzCUJO
 aQFJDjpK/JuOpC/1YPYnPAMGIgUC704K6kUBT/f5v0zRDSbGgPYJsF8v1slotVmmiegv 9w== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mbub5rt6g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 09:41:16 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B99fFew022702
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 9 Dec 2022 09:41:15 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 9 Dec 2022 01:41:11 -0800
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v7 2/4] media: camss: vfe: Reserve VFE lines on stream start and link to CSID
Date:   Fri, 9 Dec 2022 11:40:35 +0200
Message-ID: <20221209094037.1148-3-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TxTcVX4SvyotTj0HEWqRAELwNPN4tgpK
X-Proofpoint-GUID: TxTcVX4SvyotTj0HEWqRAELwNPN4tgpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090066
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

For multiple virtual channels support, each VFE line can be in either
ON, RESERVED or OFF states. This allows the starting and stopping
of a VFE line independently of other active VFE lines (e.g. already-
running lines stay in ON state, and newly-added lines are RESERVED)

Also, link the CSID entity's source ports to corresponding VFE lines.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c  | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-480.c  | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c      | 1 +
 drivers/media/platform/qcom/camss/camss.c          | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 8e506a805d11..02494c89da91 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -409,7 +409,7 @@ static int vfe_get_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	output = &line->output;
-	if (output->state != VFE_OUTPUT_OFF) {
+	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is running\n");
 		goto error;
 	}
@@ -462,7 +462,7 @@ static int vfe_enable_output(struct vfe_line *line)
 
 	ops->reg_update_clear(vfe, line->id);
 
-	if (output->state != VFE_OUTPUT_OFF) {
+	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
 			output->state);
 		spin_unlock_irqrestore(&vfe->output_lock, flags);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 3aa962b5663b..f03a84daafbe 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -239,7 +239,7 @@ static int vfe_get_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	output = &line->output;
-	if (output->state != VFE_OUTPUT_OFF) {
+	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is running\n");
 		goto error;
 	}
@@ -279,7 +279,7 @@ static int vfe_enable_output(struct vfe_line *line)
 
 	vfe_reg_update_clear(vfe, line->id);
 
-	if (output->state != VFE_OUTPUT_OFF) {
+	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
 			output->state);
 		spin_unlock_irqrestore(&vfe->output_lock, flags);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index 4fd265d01883..239d3d4ac666 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -194,7 +194,7 @@ static int vfe_enable_output(struct vfe_line *line)
 
 	ops->reg_update_clear(vfe, line->id);
 
-	if (output->state != VFE_OUTPUT_RESERVED) {
+	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n", output->state);
 		spin_unlock_irqrestore(&vfe->output_lock, flags);
 		return -EINVAL;
@@ -289,7 +289,7 @@ static int vfe_get_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	output = &line->output;
-	if (output->state != VFE_OUTPUT_OFF) {
+	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is running\n");
 		goto error;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index a26e4a5d87b6..e0832f3f4f25 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -740,6 +740,7 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		line->output.state = VFE_OUTPUT_RESERVED;
 		ret = vfe->ops->vfe_enable(line);
 		if (ret < 0)
 			dev_err(vfe->camss->dev,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9cda284f1e71..547099f8ed14 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1320,7 +1320,7 @@ static int camss_register_entities(struct camss *camss)
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
 					ret = media_create_pad_link(&csid->entity,
-								    MSM_CSID_PAD_SRC,
+								    MSM_CSID_PAD_FIRST_SRC + j,
 								    &vfe->entity,
 								    MSM_VFE_PAD_SINK,
 								    0);
-- 
2.37.3

