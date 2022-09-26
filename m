Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582625EAB5B
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 17:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbiIZPnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 11:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiIZPmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 11:42:01 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C6A6FA1F;
        Mon, 26 Sep 2022 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664202330; x=1695738330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pfuINd9PgYmZ/yt4oNdMKOBVEklukDVuARBHpgZiRaw=;
  b=ke6cnIS+nfzGsH0FvlB3A56yF8KdWt2f2NUagJ0MRoRhjA6MBF8dP04j
   IxepopSE+OaY1PEGkWoxrqzIM+VXDDGksRsZ0vcDc7KpcD8I3A+HxWYRH
   Lqt6rGFJkGka1hCrSIyqQmCwlAJ0S+TdX+z6arFIJYeKHYLw5L/B3bmbb
   w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Sep 2022 07:25:29 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 07:25:28 -0700
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 26 Sep 2022 07:25:25 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <konrad.dybcio@somainline.org>, <mchehab@kernel.org>,
        <bryan.odonoghue@linaro.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH 2/4] media: camss: vfe: Reserve VFE lines on stream start and link to CSID
Date:   Mon, 26 Sep 2022 17:25:02 +0300
Message-ID: <20220926142505.1827-3-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20220926142505.1827-1-quic_mmitkov@quicinc.com>
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com>
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

