Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC415FD8F1
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 14:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiJMMNi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 08:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiJMMNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 08:13:35 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED99F88DB;
        Thu, 13 Oct 2022 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1665663209; x=1697199209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qoOj96ApBOzc1TcpPtjYI+umqPnp7rb8jnSe3iG49w=;
  b=PjXj/8KX2MSkKjyJ7T0Nq+JeEc64LtDFNZHDeirz12s0k7m1inr6xwK/
   vYkaQF9i7C4ZGXzVvz+2f4Q5/DqrAlxAIwQc9yNFLxhV7Xs+tMN2Wg2qn
   VKJMaaB/gbU7lZuGRZTeFucLJ062xd8zczstQhPURNHTFIUx86pmgVaVq
   U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Oct 2022 05:13:27 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 05:13:27 -0700
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 13 Oct 2022 05:13:24 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v4 4/4] media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels
Date:   Thu, 13 Oct 2022 15:12:55 +0300
Message-ID: <20221013121255.1977-5-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 81fb3a5bc1d5..094971e2ff02 100644
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

