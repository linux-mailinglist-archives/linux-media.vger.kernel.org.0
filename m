Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB98B27B22C
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgI1QpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgI1QpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:45:02 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B23C0613CF
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:45:01 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p15so9466528ejm.7
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3TY70mrl16JaQxxZ4/GyqEClhKIDlyWn3cWhVRTCx/M=;
        b=jAg4HwOA8V0hDv7VAH72gwxC7xRztKPm0/hXDMY4Gx7OPZkKPj2RfbzSpfXYwklev+
         fBucSHj6SYnj6YvbG35cZ4VcXc4n1Cdfb2Vj5Jjwjd3/n/vEi1NEJNpAzfmmSBaNutn4
         T1cZz7HkOiP2/aolE96WtjEwLMJQeZoeYDtbQqw1W/66mDE57fI3nnWpkZzyLQV2mG+D
         GdxH8vN6dquf1IEr5cfjC6Kcj7vncBvHxoBUJ/zEajh/ijjqqFsYWp4AXHJ/MheCS3nX
         JFdMACk9YVMX/hgMxTBDifKOc9j+qeSRCJkc6F18lAsN+qUhG41AVQSQX4qFhDsLnMb1
         4rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3TY70mrl16JaQxxZ4/GyqEClhKIDlyWn3cWhVRTCx/M=;
        b=pYWkJed7P9ysIVyWxzR8x4JMCREEWmptIXiZxPTu9gVE0p75Xd5c9dWlhhhW6SEM+4
         1yzBlC9IZOeOTnxYz8XJbED+ASAK4grMoxyFubL7QQdVyeBuThaYxzVzeEG3IW0XEpLk
         LE15C1ns3Zfkh8Fu3uwLJsJvGmyTgWe853I2M9K+wPmaofCOmQccRIs+zvw9OfGfmomr
         hDV7iy+cf6fJu80PNkEEGv90i3R93ZaRkRZaqYWV2MbkGic5fJ4XCQiLbv+sAtuzi0ge
         QF6dBzuzOvdf9qgvUmmaujAwS+EJsv9rRLL9jEkRU2RzOOQ5zzbzWlBdFXHOT90cT4Pp
         csuw==
X-Gm-Message-State: AOAM532Fe0U0kDbpBu9WO089+tRbQqSs+glD4BXmWFOZB3PjG4irCdzu
        iV2zL++fK+EVj+RKttAU6pUsaf2o0YY1G8Wi
X-Google-Smtp-Source: ABdhPJznyUxh2GhH2l2Ggevd+n4Gz21ilSpQaAQxejxJyIu1YgKNCOVrLrCzasHQGVWIhjypxXcGOA==
X-Received: by 2002:a17:906:2655:: with SMTP id i21mr2425348ejc.511.1601311500159;
        Mon, 28 Sep 2020 09:45:00 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id nh1sm1912594ejb.21.2020.09.28.09.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:44:59 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/3] venus: helpers: Lock outside of buffer queue helper
Date:   Mon, 28 Sep 2020 19:44:31 +0300
Message-Id: <20200928164431.21884-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After adding more logic in vdec buf_queue vb2 op it is not
practical to have two lock/unlock for one decoder buf_queue.
So move the instance lock in encoder and decoder vb2 buf_queue
operations.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 11 +++--------
 drivers/media/platform/qcom/venus/vdec.c    |  3 +--
 drivers/media/platform/qcom/venus/venc.c    | 11 ++++++++++-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5ca3920237c5..2b6925b6c274 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1343,34 +1343,29 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	int ret;
 
-	mutex_lock(&inst->lock);
-
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
 	/* Skip processing queued capture buffers after LAST flag */
 	if (inst->session_type == VIDC_SESSION_TYPE_DEC &&
 	    V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
 	    inst->codec_state == VENUS_DEC_STATE_DRC)
-		goto unlock;
+		return;
 
 	cache_payload(inst, vb);
 
 	if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
 	    !(inst->streamon_out && inst->streamon_cap))
-		goto unlock;
+		return;
 
 	if (vb2_start_streaming_called(vb->vb2_queue)) {
 		ret = is_buf_refed(inst, vbuf);
 		if (ret)
-			goto unlock;
+			return;
 
 		ret = session_process_buf(inst, vbuf);
 		if (ret)
 			return_buf_error(inst, vbuf);
 	}
-
-unlock:
-	mutex_unlock(&inst->lock);
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_buf_queue);
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c006401255dc..044d50f217ce 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1237,9 +1237,8 @@ static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
 		return;
 	}
 
-	mutex_unlock(&inst->lock);
-
 	venus_helper_vb2_buf_queue(vb);
+	mutex_unlock(&inst->lock);
 }
 
 static const struct vb2_ops vdec_vb2_ops = {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index f8b1484e7dcd..f7fb6e362521 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -900,13 +900,22 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
+static void venc_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	mutex_lock(&inst->lock);
+	venus_helper_vb2_buf_queue(vb);
+	mutex_unlock(&inst->lock);
+}
+
 static const struct vb2_ops venc_vb2_ops = {
 	.queue_setup = venc_queue_setup,
 	.buf_init = venus_helper_vb2_buf_init,
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
-	.buf_queue = venus_helper_vb2_buf_queue,
+	.buf_queue = venc_vb2_buf_queue,
 };
 
 static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
-- 
2.17.1

