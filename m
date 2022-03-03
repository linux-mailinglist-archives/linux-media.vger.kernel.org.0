Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0114CBF96
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 15:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbiCCOLX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 09:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbiCCOLV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 09:11:21 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E77E18CC13
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 06:10:36 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o18-20020a05600c4fd200b003826701f847so4810111wmq.4
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IXj3pYDWu9aW3dCcX1kJwS4hr2/kflCLfrh6DJzA/l4=;
        b=nu6+lOJhrmA2qiMyiqNJjT7+4BBDSCYtzhrpMI4IlqBGTcHq88WvymH8Y0kJsE5s2i
         6RISL5VEdSXRMEzOkP0EJCFX98ywXfMo+7pAqke8JnRivuSvtFlyWqTKOL3ZndxtqCSc
         h3A3JMBrOJN+rgMgtrpcxbOBWpRoF9QnEr3X5tH8NJsqgv5Q7B9ppsxIJpDmmwX3yUK3
         cOcsTZhaSw1QP28b5kmzYCKND7CE5lOpT159hx1pRH1Q7uWXZ0lQhRGPmbZMK1hPHtGI
         7z5/UyAmIPjl1qkPlCoa3A47wP0Q19abr3Y2UAe+j23PgPwCUR1ApKSthUwNX3E0t/ix
         kHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IXj3pYDWu9aW3dCcX1kJwS4hr2/kflCLfrh6DJzA/l4=;
        b=bIuhhOtFsctEQpPG3aolqNvp/WJbM7/KNrzuo1pBClKIauR3N4Ljq+5UODUkKKlzMD
         /lU+X5IYwaXEX3aXlW1RxezhlK81U6zTHDSXpS2WaCSk61KG7Adm1i9y6gMclhwIba+Q
         dUHULMinhEi41qKbCz2Ts0HNXIMW0yMEX1dVfWAlTn1M3hsidzg3t6kGP7pmSsGz4roZ
         qOaB52GvtsHjsC9N0Cl9lkyeYchmNCYzuZcnXm6Nn3z38xJ1AGP0uOjVUksEEbnJ3UDQ
         WPURnO2iwrwg8SMxL+fU3nYADtDzKjaUddIc2kaeV+zWTHzF+il12U+jm7rkv8XPegSC
         LxAg==
X-Gm-Message-State: AOAM531stYLYW76ELoy2HkqEaqLXxwlz4no+e3jnhtmWOM40Tk5z+B4a
        2wNjogxdOA62gYoQirN9pJklVfmbE2By/Wp8
X-Google-Smtp-Source: ABdhPJxKFaEFIewLvByzv+/n9OS0iPftnkrtmsyAun0HAFhY0k1XRGwKABz+2GBCMEvfnjqqeYZFHw==
X-Received: by 2002:a05:600c:2c49:b0:384:7202:358e with SMTP id r9-20020a05600c2c4900b003847202358emr3960511wmg.108.1646316634647;
        Thu, 03 Mar 2022 06:10:34 -0800 (PST)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id ba2-20020a0560001c0200b001f0653f1097sm194312wrb.69.2022.03.03.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:10:34 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP v2 4/6] venus: helpers: Add a new helper for buffer processing
Date:   Thu,  3 Mar 2022 16:10:08 +0200
Message-Id: <20220303141010.573408-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
References: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new helper will be used from encoder and decoder drivers
to enqueue buffers for processing by firmware.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 0bca95d01650..34611c4ced49 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1505,6 +1505,26 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_buf_queue);
 
+void venus_helper_process_buf(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	int ret;
+
+	cache_payload(inst, vb);
+
+	if (vb2_start_streaming_called(vb->vb2_queue)) {
+		ret = is_buf_refed(inst, vbuf);
+		if (ret)
+			return;
+
+		ret = session_process_buf(inst, vbuf);
+		if (ret)
+			return_buf_error(inst, vbuf);
+	}
+}
+EXPORT_SYMBOL_GPL(venus_helper_process_buf);
+
 void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 			       enum vb2_buffer_state state)
 {
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 32619c3e8c97..94b4a970a2e0 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -22,6 +22,7 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
 int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
 void venus_helper_vb2_buf_queue(struct vb2_buffer *vb);
+void venus_helper_process_buf(struct vb2_buffer *vb);
 void venus_helper_vb2_stop_streaming(struct vb2_queue *q);
 int venus_helper_vb2_start_streaming(struct venus_inst *inst);
 void venus_helper_vb2_queue_error(struct venus_inst *inst);
-- 
2.25.1

