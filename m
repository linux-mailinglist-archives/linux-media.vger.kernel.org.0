Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE55642BB0
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbiLEP12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiLEP1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:27:03 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813AB1E738;
        Mon,  5 Dec 2022 07:25:34 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5CSImR008838;
        Mon, 5 Dec 2022 15:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=GUI4C7dlhpL71/7W3hJAf/Nb5E+R+lW3X5AW5/jMIio=;
 b=OAZxwb0FSmXgjSHBj2G4L0HQZsIa+xJ8hleEs4ZPZvzuK8MyahjpT7cgcIAiQw6zj2YQ
 MmHOfLIrXeZKSece7XUiGsl1aKnC8cBuaZAmQ4PSW4qPQ9Bh0FLb3SClxNsgbeX6glmy
 LqxTE2i9YnjNwD5VmwyHknNVreR73yHC8WZennp4fr6bzmHLPAesVwi2lpjI7uTqRq7U
 sgDTWKlju+wBEEbPnkYqsySKlFelqfHyE428djsBlrR6CkmALwilOrAie3j8SVkU6JoU
 LO1lilY8LHr7Si5pf4a2UO67zjx2ys5MiwTN0G8ApHY9BDrsbpDgCW5Dd9Vih60BwhM3 dw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m9eev0qx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Dec 2022 15:25:25 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5FPOXg014300
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 5 Dec 2022 15:25:24 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 07:25:20 -0800
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v6 4/4] media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels
Date:   Mon, 5 Dec 2022 17:24:50 +0200
Message-ID: <20221205152450.1099-5-quic_mmitkov@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gZMFSZX_sUlS6aeY2VPif-JJlO0JXJ2k
X-Proofpoint-GUID: gZMFSZX_sUlS6aeY2VPif-JJlO0JXJ2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=865 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212050127
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

Use the multistream series function video_device_pipeline_alloc_start
to allows multiple clients of the same pipeline.

If the VFE entity is used by another instance of the pipeline,
the pipeline won't be stopped. This allows for stopping and starting
streams at any point without disrupting the other running streams.

To prepare and start multiple virtual channels each CSID source pad
corresponding to a virtual channel must be linked to the corresponding
IFE entity. Note that on SM8250 each CSID is connected, at the
hardware level, to only one IFE. Thus, you must use CSID1 with IFE1
and you can't use it with IFE0 for example.

Example: the following media controller setup expects multiplexed 
sensor data on CSIPHY2. Data will be passed on to CSID0, which will 
demux it to 2 streams - for RDI0 and RD1 ports of IFE0.:

media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'":0[fmt:SRGGB10/3840x2160 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_csid0":2[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_vfe0_rdi1":0[fmt:SRGGB10/3840x2160]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'

Note: CSID's entity pad 0 is a sink pad, pads 1..4 are source pads
To start streaming a v4l2 client must open the corresponding
/dev/videoN node. For example, with yavta:

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 3840x2160 -F /dev/video0
yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 3840x2160 -F /dev/video1

Note that IFEs (vfe0, vfe1) on SM8250 have 3 RDI ports and a single 
PIX port and IFELites (vfe2, vfe3) have 4 RDI ports and no PIX port.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
---
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 41deda232e4a..12ac7d4d755e 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -351,6 +351,7 @@ static int video_get_subdev_format(struct camss_video *video,
 	if (subdev == NULL)
 		return -EPIPE;
 
+	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
 	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
@@ -493,9 +494,11 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = video_device_pipeline_start(vdev, &video->pipe);
-	if (ret < 0)
+	ret = video_device_pipeline_alloc_start(vdev);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
 		goto flush_buffers;
+	}
 
 	ret = video_check_format(video);
 	if (ret < 0)
@@ -537,6 +540,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct media_entity *entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
+	int ret;
 
 	entity = &vdev->entity;
 	while (1) {
@@ -551,7 +555,18 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
-		v4l2_subdev_call(subdev, video, s_stream, 0);
+		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
+
+		if (entity->use_count > 1) {
+			/* Don't stop if other instances of the pipeline are still running */
+			dev_dbg(video->camss->dev, "Video pipeline still used, don't stop streaming.\n");
+			return;
+		}
+
+		if (ret) {
+			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
+			return;
+		}
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.37.3

