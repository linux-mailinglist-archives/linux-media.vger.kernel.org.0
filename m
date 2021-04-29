Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D9536EB5C
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237362AbhD2N3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 09:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhD2N3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 09:29:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B1DC06138C
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l2so14646597wrm.9
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/DN5H6mB286RrlpmsoTsbcLl9bW682ZJpzMoaSdcrUc=;
        b=GRF2czyYK7IRjfQzIepe9WtvcoJ+QRO9Wb52H9yRGZVh94OZ+JkKcYLjbIM6q9belu
         sc5zMe8sPkGnlB7DB9gCpCygTZKIH0rDtwWQBXKPAV5SYeEffpkV3KInXD6LWluKYJkp
         dBmQfdj5mKc1E9BxpjGe6f/lu031jYy75BmCD+GwSCmx8fUCB2ZUwFeQz2FpOnI/uM3Z
         kGf754LiMx8PkJY3ThRhd4mrYS/QkJGA7F2raI36yWQHO5qQo5IFC+XmTAWPjXgUSbmU
         FVvM/ruinikEn7Lqj7xl3lJT4FTTnr9VZHg6weOxLD/J1fKMzXztkAKwtCCU6IMCj0K/
         LLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/DN5H6mB286RrlpmsoTsbcLl9bW682ZJpzMoaSdcrUc=;
        b=WV5DVEKN2MYb/cAc7GxlGebtwhJAEKIaCV/yUQFSh/DdEaj3duA17DUBMMN27jVglB
         2McZfa9CuQL8Esm8gKUb+8BcEUN3vU30nuJTo2SZGSdnEM1qLLGpxRUthBuJkujCyueF
         pvARc7FHieozevxCqJmqayYXkVpHDcM9N401TEZgw0YggoDALnWt8aVOtc2C//5ymKA3
         sVXX0CpQlbvteteHaIB5RBlzkLPs0o3xPLNt+sUsZ+e+jj6Q3vHT5JsBSBogBDIDQ0gB
         4by9rZZx6EYZ6dqz8ddhHufDWca/jhJMWhzaWMFioPsbyAU5OmqYyPmtn57nO0U4gVfs
         ZyOw==
X-Gm-Message-State: AOAM533s2PNZDUu885sEZc119dX5oq8ot1VsBenl0/vgzSZuOyyeNjoQ
        SYehkUqr0RYiZIRXfSY0ZvyupM+v+yTIBOTO
X-Google-Smtp-Source: ABdhPJw5jhmrdJ4cznjD2hyJIHtoamcRonWnkLXp2qEbArReEdKJk6puCF+m5dWwfx1jMpR9iqPvzA==
X-Received: by 2002:adf:e491:: with SMTP id i17mr42641390wrm.314.1619702926671;
        Thu, 29 Apr 2021 06:28:46 -0700 (PDT)
Received: from localhost.localdomain (hst-221-38.medicom.bg. [84.238.221.38])
        by smtp.gmail.com with ESMTPSA id n10sm4811462wrw.37.2021.04.29.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 06:28:46 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP 3/4] venus: helpers: Add a new helper for buffer processing
Date:   Thu, 29 Apr 2021 16:28:32 +0300
Message-Id: <20210429132833.2802390-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index dc8ef13d0c95..8e7f2ec0cd01 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1450,6 +1450,26 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
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
index e6269b4be3af..c7cea33e2803 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -19,6 +19,7 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
 int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
 void venus_helper_vb2_buf_queue(struct vb2_buffer *vb);
+void venus_helper_process_buf(struct vb2_buffer *vb);
 void venus_helper_vb2_stop_streaming(struct vb2_queue *q);
 int venus_helper_vb2_start_streaming(struct venus_inst *inst);
 void venus_helper_m2m_device_run(void *priv);
-- 
2.25.1

