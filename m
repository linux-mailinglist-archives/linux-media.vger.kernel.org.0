Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22DA26DC7CD
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 16:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjDJOXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Apr 2023 10:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjDJOXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Apr 2023 10:23:43 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8D44690;
        Mon, 10 Apr 2023 07:23:42 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ABRmSZ017533;
        Mon, 10 Apr 2023 14:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=TzIwGwoI7xYCBd3yh8MIHgbvZTpGY3UcGHWe7OsnsDE=;
 b=c7SZEwQZvxxP/nOIiamH/WsBB4Ac8dRC9ysO2eO+t2UJoqcTNRbf+o1UlAFQPc6ez6gU
 wiEX4cQKa8TNvu85g2jjhv3ATd3IV+NS//vz0sQUiR//LwYITeXI+cvcBWXaxmIPj7kD
 3UfXI9zCS6zf9UmutgKPvMA/hPBfd+Vcd8ClD+5RStY/qYk8iM6RtgBcr7kO58+NCiMy
 yeBG+ijkKJMRlVkTpv46poObaSgwMtjOZb88StV03DG0uE7JpUjEo4XgNojd5ySC3oTr
 zQpbXjKoZMVIha2Bb5WakeMDPNigajIw6nXWnYf9BbIf5r416DEc++g4CkPHb2EnamT4 gg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pu1f432qv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 14:23:34 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33AENXL2010120
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 14:23:33 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 10 Apr 2023 07:23:29 -0700
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
Subject: [PATCH v8 2/4] media: camss: vfe: Reserve VFE lines on stream start and link to CSID
Date:   Mon, 10 Apr 2023 17:22:30 +0300
Message-ID: <20230410142232.2135-3-quic_mmitkov@quicinc.com>
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
X-Proofpoint-GUID: 4_yea7uzAR6jEySzROsWld8qYQSdX26k
X-Proofpoint-ORIG-GUID: 4_yea7uzAR6jEySzROsWld8qYQSdX26k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_10,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=923
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100122
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

