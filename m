Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1E55FD8EE
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 14:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiJMMNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 08:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiJMMNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 08:13:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAD9F88EB;
        Thu, 13 Oct 2022 05:13:29 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DAgDqS016104;
        Thu, 13 Oct 2022 12:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=LzJ5AnU8KIaIpzYDWipeQelOn0D6aKSXwsxm4gvi9Vk=;
 b=KO0y8CDi2Vmqf3T8dO5fe+WZ3CIqRlxN68zQHE8bHwfuLNPig+PS6IRqu5k4ukw5gY/W
 azKyfO2POdnZIRNRlIqL2VfAbrhDDpqorX9PkPsXMOZQWeUso5N3SGQ9UTOsF3XO4UaR
 j8FQMtBwafbJSlNM/oMXkeloXRKPVJ4ywKEfRBHng/rIcNqHIM7AOTCLzDzrmkDwD2fG
 tXfzBMiXaFVWOKOcw0JXHPuUjLS3zJEdgjcj9bAowP68426jqvB1kx/rGuj8pKE1ePVj
 lt2yIpvzS3is+Lt1wYZ3jbVtTVf4KkIrIb6aQOSGckSPi6hzXkugkd9XWXBplt7N/UF5 Fw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k66xjsy36-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Oct 2022 12:13:20 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29DCDKf4013534
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Oct 2022 12:13:20 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 13 Oct 2022 05:13:16 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v4 2/4] media: camss: vfe: Reserve VFE lines on stream start and link to CSID
Date:   Thu, 13 Oct 2022 15:12:53 +0300
Message-ID: <20221013121255.1977-3-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8dzWPNtq4L51HaVVrGhiQXKr7zg861fM
X-Proofpoint-ORIG-GUID: 8dzWPNtq4L51HaVVrGhiQXKr7zg861fM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=941 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130072
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

For multiple virtual channels support, each VFE line can be in either
ON, RESERVED or OFF states. This allows the starting and stopping
of a VFE line independently of other active VFE lines.

Also, link the CSID entity's source ports to corresponding VFE lines.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 7 +++++++
 drivers/media/platform/qcom/camss/camss.c     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index a26e4a5d87b6..cd8ac0478cf1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -738,8 +738,10 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
 	struct vfe_device *vfe = to_vfe(line);
 	int ret;
+	int i;
 
 	if (enable) {
+		line->output.state = VFE_OUTPUT_RESERVED;
 		ret = vfe->ops->vfe_enable(line);
 		if (ret < 0)
 			dev_err(vfe->camss->dev,
@@ -749,6 +751,11 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret < 0)
 			dev_err(vfe->camss->dev,
 				"Failed to disable vfe outputs\n");
+
+		/* At least one VFE line remains, return -EBUSY to avoid premature pipeline stop */
+		for (i = 0; i < vfe->line_num; i++)
+			if (vfe->line[i].output.state != VFE_OUTPUT_OFF)
+				return -EBUSY;
 	}
 
 	return ret;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1118c40886d5..63653ac3e056 100644
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

