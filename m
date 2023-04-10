Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4091A6DC7D0
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 16:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjDJOXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Apr 2023 10:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjDJOXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Apr 2023 10:23:50 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3790527B;
        Mon, 10 Apr 2023 07:23:49 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ADRMUD008939;
        Mon, 10 Apr 2023 14:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=8S/GHR+g9lweayB9bbfVo8imVnARdZbV+nOs7TD9erw=;
 b=eefmnvBHrXmnx7FaK2z7gfRIrJ5WrKwhlMz5G62S9a51N9iwPY8lvZ0kULwpqugddc9x
 pD/euaR4fbnzvyudlLl/U0xWmkY6E6A6uRCwDoQkoiT2e5D7ZUMYcsSUf3aIIB25znW7
 jru9AFmO4mtkd3PHUKM24WTKUbSek5Z/79jQXPgIx3+wL9btFZnOT0REJOH3IkygYwxY
 Jr6X9h4PBpeV0XmeOXO5WP+0HMvl5am5SrIWQ9slQm5iZ6kYai7pFJg06fV+ddswkbc9
 D2Nmvk1PEkC13aUMH21EcwIoD0XCo6yA5NFwpPKgjBZfDCB5M8JGtLGJ5pBiCavggIhH ww== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ptyktk5r5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 14:23:42 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33AENfZv024935
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 14:23:41 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 10 Apr 2023 07:23:37 -0700
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
Subject: [PATCH v8 4/4] media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels
Date:   Mon, 10 Apr 2023 17:22:32 +0300
Message-ID: <20230410142232.2135-5-quic_mmitkov@quicinc.com>
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
X-Proofpoint-GUID: LP3yb63yZrxbaja6RkrtIulY8QAd6Qv6
X-Proofpoint-ORIG-GUID: LP3yb63yZrxbaja6RkrtIulY8QAd6Qv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_09,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=727 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Use the multistream series function video_device_pipeline_alloc_start
to allows multiple clients of the same pipeline.

If the VFE entity is used by another instance of the pipeline,
the pipeline won't be stopped. This allows for stopping and starting
streams at any point without disrupting the other running streams.

To prepare and start multiple virtual channels each CSID source pad
corresponding to a virtual channel must be linked to the corresponding
IFE entity. CSID pad 1 (1st source pad) corresponds to virtual
channel 0, CSID pad 2 corresponds to virtual channel 1 and so on.
Each of these must be linked to corresponding IFE RDI port.
E.g. to enable vc 0 on CSID0:

media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

To enable vc1 on CSID0:

media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'

And so on. Note that on SM8250 each CSID is connected, at the
hardware level, to only one IFE. Thus, you must link CSID0
with IFE0, you can't link it with IFE1.

Example: the following media controller setup expects multiplexed
sensor data on CSIPHY2. Data will be passed on to CSID0, which will
demux it to 2 streams - for RDI0 and RD1 ports of IFE0:

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
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

