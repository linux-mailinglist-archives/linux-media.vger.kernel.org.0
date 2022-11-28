Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73DA463AB6F
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiK1Ono (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiK1OnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:43:04 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA8D23163;
        Mon, 28 Nov 2022 06:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1669646584; x=1701182584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X1/UKOgT7/pL11XhDRr6jR8THx7G6AXiPasEtvj83rU=;
  b=SqyQPyVsr0wiVRMmrMmvd5Ixf3q/cIZW4Q0jIojzx9b97Q8acqiflrqd
   z7gjc/o/9ES7K4Pu5QohLE4ZylGNDp5YPl7B6lKVuZTjySIpIi7qqLa1r
   LMKtIwfo9xsEpuHHvh6Wmk7PJ9FQxU8xI9i8pmdFZvV+A/KFfyp+DuCww
   s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Nov 2022 06:43:03 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 06:43:04 -0800
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 28 Nov 2022 06:42:59 -0800
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v5 2/4] media: camss: vfe: Reserve VFE lines on stream start and link to CSID
Date:   Mon, 28 Nov 2022 16:42:08 +0200
Message-ID: <20221128144210.1028-3-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
References: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 1 +
 drivers/media/platform/qcom/camss/camss.c     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

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

