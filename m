Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C215F78D8
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 15:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJGNU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 09:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJGNUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 09:20:51 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714FC89CF5;
        Fri,  7 Oct 2022 06:20:50 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297BWf7l020691;
        Fri, 7 Oct 2022 13:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=GrTtXyw3LwMpYy+O6xjoKOXG8mtQt9xYXSfxY5dD+M4=;
 b=c6dcABtoKdEfjDoMGlssFzdrxtCybtcOsUavrJCsIXjSu9qhZG6xso9LkAdQdXMRV0mm
 K5EkNDoFFC8IpAYYhPUEa8wg7RYgst3IxhV9NOMTad2KB+N4ykoP44CqCBEfHDENZ6Cs
 lj079px9jgEPHhFjvRb/xXOZT6OypUCOvU7Ntu1ksWkY/cDauWlIxFbGu/Jz0WFOC8Tk
 KA4Ykkg4Zrh3zy1TO7pQjQBpT0k2Qe8WJlPvGQvmb8YylJH4gU8mG766ub37kYvWELMx
 CppDiQ8AoaZMdV1Jx5QZ730T0xB7R9NYcfh/Rbchr5Oc1BxRuSq83T+7G/GcZnorgOw2 QA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k295e99ac-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Oct 2022 13:20:44 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 297DKiaS002292
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 7 Oct 2022 13:20:44 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 7 Oct 2022 06:20:40 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <konrad.dybcio@somainline.org>, <mchehab@kernel.org>,
        <bryan.odonoghue@linaro.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v3 4/4] media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels
Date:   Fri, 7 Oct 2022 16:20:09 +0300
Message-ID: <20221007132009.1886-5-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20221007132009.1886-1-quic_mmitkov@quicinc.com>
References: <20221007132009.1886-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RgVzmC03SAbXBcfmB7IoK2VjbpUUuj6G
X-Proofpoint-GUID: RgVzmC03SAbXBcfmB7IoK2VjbpUUuj6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=776 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070080
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

Use the multistream series function video_device_pipeline_alloc_start
to allows multiple clients of the same pipeline.

If any of the entities in the pipeline doesn't return success at stop
(e.g. if a VFE line remains running), the full pipeline won't be stopped.
This allows for stopping and starting streams at any point without
disrupting the other running streams.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 81fb3a5bc1d5..b042faf3dcda 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -353,6 +353,7 @@ static int video_get_subdev_format(struct camss_video *video,
 
 	fmt.pad = pad;
 	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.stream = 0;
 
 	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
 	if (ret)
@@ -493,9 +494,11 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = video_device_pipeline_start(vdev, &video->pipe);
-	if (ret < 0)
+	ret = video_device_pipeline_alloc_start(vdev);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
 		return ret;
+	}
 
 	ret = video_check_format(video);
 	if (ret < 0)
@@ -536,6 +539,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct media_entity *entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
+	int ret;
 
 	entity = &vdev->entity;
 	while (1) {
@@ -550,7 +554,18 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
-		v4l2_subdev_call(subdev, video, s_stream, 0);
+		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
+
+		if (ret == -EBUSY) {
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

