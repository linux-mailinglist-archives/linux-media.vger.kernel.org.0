Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1041A2B3C
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbgDHVeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:34:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38543 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730754AbgDHVeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:34:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id v16so9326914ljg.5
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Mt9OBIj0ykBafNH/9trvGlSeMEJzqQmkZCMhh/GB4oU=;
        b=t31m+68I3U983sirf6zcS6e9xeVWoUaxTp9krnrbio2KDHZgVrxIe7uqLphilktHFp
         MDx7Az0j+gxYhyBpKNXOp8Hro+V700/mS+ZDDkuVx63BrbFJvFe/hllVStC81XRcfPxM
         jNfIu8ewZKQbxq0la02ESkd7HPjGJepHLioqqkhi7ebGAvJhTaOpZJ10dTG/DVKpWVwf
         0AqLpPgggy9xqRHuGe8vJSGuAk1AxZJORxF4iKgmytx+oDE2X7ubCnyxKl8Ag5J6hv9a
         i0Turjc0XfnaDZIepqUsut6p/CwiC9OlZ2UnhUNuPJ4BcSqD61k2Ile6WKCnaX3SeZij
         upWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Mt9OBIj0ykBafNH/9trvGlSeMEJzqQmkZCMhh/GB4oU=;
        b=lLMexqsmD8oPndjNsPG//MHKxLHVgH6wdA84pecJ9hFu2t7wNE1L/oN0K3r+RUKg7G
         34mh3rS94OysbguNbn5DX4wwkP17m9hORRGqYEKlloN8VET/jnG84jXvwbsnjM83RF9f
         Wwi+k3bNM3JT3jEFiLPFF/vABPrc9FoHKQbCD4zGSMathZS/huiZDQDIryyNvFCg5p+v
         wUyEzzHjqn706Hf6Hns9m4an4mU9cCXUFslO7RZeqfG8j/hX5IQowTf5JLuLLxOjga3l
         q5aFRdiU4IbsULFzXTMgMrsGVW7LIjL98XiYfOMvz2+ZK6VXuc4OoJUUwYYrVP7S6kBq
         5spA==
X-Gm-Message-State: AGi0PubjA9Xk8+a4KovzNnLZxK2gI+pm0cYhJV91ZAEf87TXyuyjDy64
        b9mTlB8G42Y3x3uqb4l0vjaiLP2wqAk=
X-Google-Smtp-Source: APiQypLFbtG20kBPRjrMvbSnxkPIJuRxVgxuATQnnRzzI6NprTKvBrrkBcaA+fi4G4LdQEEFQ/QWSg==
X-Received: by 2002:a2e:8e3a:: with SMTP id r26mr6347426ljk.233.1586381645983;
        Wed, 08 Apr 2020 14:34:05 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:34:05 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/7] venus: helpers: Done buffers per queue type
Date:   Thu,  9 Apr 2020 00:33:27 +0300
Message-Id: <20200408213330.27665-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently calling venus_helper_buffers_done() will return buffers to
user for both capture and output queues in the same call. This is
wrong because both queues are really separate and calling
stop_streaming on one queue shouldn't return buffers for the other.
Solve this by add a new queue type argument and fix the clients of
the helper function.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 18 ++++++++++++------
 drivers/media/platform/qcom/venus/helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c    |  5 ++---
 drivers/media/platform/qcom/venus/venc.c    |  2 +-
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index bcc603804041..0143af7822b2 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1129,15 +1129,18 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_buf_queue);
 
-void venus_helper_buffers_done(struct venus_inst *inst,
+void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 			       enum vb2_buffer_state state)
 {
 	struct vb2_v4l2_buffer *buf;
 
-	while ((buf = v4l2_m2m_src_buf_remove(inst->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, state);
-	while ((buf = v4l2_m2m_dst_buf_remove(inst->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, state);
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		while ((buf = v4l2_m2m_src_buf_remove(inst->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		while ((buf = v4l2_m2m_dst_buf_remove(inst->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	}
 }
 EXPORT_SYMBOL_GPL(venus_helper_buffers_done);
 
@@ -1168,7 +1171,10 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 		INIT_LIST_HEAD(&inst->registeredbufs);
 	}
 
-	venus_helper_buffers_done(inst, VB2_BUF_STATE_ERROR);
+	venus_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+				  VB2_BUF_STATE_ERROR);
+	venus_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+				  VB2_BUF_STATE_ERROR);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->streamon_out = 0;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index b64875564064..8fbbda12a4fe 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -14,7 +14,7 @@ struct venus_core;
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
 struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
 					      unsigned int type, u32 idx);
-void venus_helper_buffers_done(struct venus_inst *inst,
+void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 			       enum vb2_buffer_state state);
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
 int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e8e1ecf7cf4a..7d093accbd59 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1044,7 +1044,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 put_power:
 	vdec_pm_put(inst, false);
 error:
-	venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&inst->lock);
 	return ret;
 }
@@ -1071,7 +1071,6 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		break;
 	case VENUS_DEC_STATE_DRC:
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
-		vdec_cancel_dst_buffers(inst);
 		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
 		INIT_LIST_HEAD(&inst->registeredbufs);
 		venus_helper_free_dpb_bufs(inst);
@@ -1117,7 +1116,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	else
 		ret = vdec_stop_output(inst);
 
-	venus_helper_buffers_done(inst, VB2_BUF_STATE_ERROR);
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
 
 	if (ret)
 		goto unlock;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 9981a2a27c90..3d8431dc14c4 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1018,7 +1018,7 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 deinit_sess:
 	hfi_session_deinit(inst);
 bufs_done:
-	venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->streamon_out = 0;
 	else
-- 
2.17.1

