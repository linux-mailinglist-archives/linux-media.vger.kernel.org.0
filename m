Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA61E5BE91E
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 16:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiITOdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 10:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiITOdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 10:33:22 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B942241D14
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 07:33:21 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KETkkA014232
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 14:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=pfuINd9PgYmZ/yt4oNdMKOBVEklukDVuARBHpgZiRaw=;
 b=HcoVCFJk+/2tsp/ALNdnIcASsaFC1UI6/O1d6KGs3vjsB42QZDJ+yVzoMeZyWqWul1Dh
 XmGBWeHlb60aOZCzhIhdfVPyuQoPKCBGVIwOQRYv8H6ja7blkYJl02tYohlcs/QRVple
 2I5xw96VLl/6EODYjgyO2nD7wIyGD4EzTfkC+IKqqhHkjR8POI2PsWtwK7VZx94sWjLL
 u8KH50AvJA66qHM9eEvJkAd7h/4Cjw9LsgnUMUKWXdoCKHXzbqY4o8iuckvjWOFpaqHz
 e4vwF+D9lv2j5MOfTNCd6Ofm+InzkU3rsS1ZVRldDeMCKQKAD6k2JYQTOOuEko56buaN FA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jpx50b9nu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 14:33:21 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28KEXKLt030524
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 14:33:20 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 20 Sep 2022 07:33:19 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>
CC:     <akapatra@quicinc.com>, <jzala@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH 2/4] media: camss: vfe: Reserve VFE lines on stream start and link to CSID
Date:   Tue, 20 Sep 2022 17:32:58 +0300
Message-ID: <20220920143300.1633-3-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20220920143300.1633-1-quic_mmitkov@quicinc.com>
References: <20220920143300.1633-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3VUX8jbCIabk0NVErmufUQq3D8iYvaJv
X-Proofpoint-GUID: 3VUX8jbCIabk0NVErmufUQq3D8iYvaJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxlogscore=875 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200086
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

