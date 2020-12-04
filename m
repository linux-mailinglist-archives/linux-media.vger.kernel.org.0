Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25AE2CEBB8
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 11:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387949AbgLDKDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 05:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387941AbgLDKDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 05:03:34 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1804FC061A54
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 02:02:08 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id jx16so7802543ejb.10
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 02:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/YIHndOkuyRiMsQ82HY4dIjLYZOfc93bxXe51T4cmZ0=;
        b=SRePSCV6dz/lPsfZpnayLbYuACan0Ha9kwWTtbojMk2TVx94Q4AWxd+nN89U92fo2e
         KBOYsAucPT7TB7pAYI4G2DalZBdokr0qh1VpG9IVDSp6Luu1ivRc3jHMUQZMxhl+gzpi
         ELt9tBDEDw2e2Jw6/IlJATISL5JmxFf8Dnn9htD85ANTnLeDbBkb3T3z7TFoh/DVdCBP
         Z0LF0rH1/VW1Pi96MU9RAsdjonSsXOHB6/xZDBKrb9zHG42F31UC1D/v57cof3WE24Ks
         RE2F0YU4xTr3dF5CIkN4PNi6OTKMo1dvjd/I1xlWFtMqBEos1ENrZQjpfUlTiX4+1umu
         ReYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/YIHndOkuyRiMsQ82HY4dIjLYZOfc93bxXe51T4cmZ0=;
        b=LgTX6Src2wpabsLv9zXicl4EUYWFTICSP5gozitEhNzB5qzsrIPgzDttxR0jm7C2Pq
         9HFFE2HgD0mEkjADMHOGKzQWyafE1Ixp7GvzXAvciWLNFL0BaSyIB6yBV3H+3PoRMYEu
         hfWw/naZODKrp2YZwaJqRB6GmeKda6EBtaQ6mOPVBgczw+TbOYWkwbkJJgTS6jOivWG1
         MVk4qU+2/kVmS+GUrN4pofHNCYYPaETFpjiT4UASORzyIb0TKnwXV//6+SAoCiTqMXdD
         zlOz803zogj/ZrcuY67k95tuCZKP/T3oKGHRypFx4Tk3vUmrTLmu2RAA6nu1xk5t3BWS
         jAwA==
X-Gm-Message-State: AOAM533fMIEbJ8hpX8A8piit+iLJDbLl6eNQ24VC8SwguKHQ7+O3MBa/
        mAZWAIujT71LYTfliHWdyT6BsA3K6TxYiOKe
X-Google-Smtp-Source: ABdhPJwt47TT2pE0CfJCXX6fJWbJF9jQccoVT07xLymtWur80cupOsS2gxLsYMO75QF0OrzZry8RQQ==
X-Received: by 2002:a17:906:e082:: with SMTP id gh2mr6080367ejb.406.1607076126537;
        Fri, 04 Dec 2020 02:02:06 -0800 (PST)
Received: from localhost.localdomain (hst-221-106.medicom.bg. [84.238.221.106])
        by smtp.gmail.com with ESMTPSA id p35sm3238242edd.58.2020.12.04.02.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 02:02:06 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dikshita@codeaurora.org, Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/4] venus: venc: Init the session only once in queue_setup
Date:   Fri,  4 Dec 2020 12:01:36 +0200
Message-Id: <20201204100139.6216-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Init the hfi session only once in queue_setup and also cover that
with inst->lock.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 85 ++++++++++++++++++------
 1 file changed, 64 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 1c61602c5de1..e0053cc1b7eb 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -725,7 +725,9 @@ static int venc_init_session(struct venus_inst *inst)
 	int ret;
 
 	ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
-	if (ret)
+	if (ret == -EINVAL)
+		return 0;
+	else if (ret)
 		return ret;
 
 	ret = venus_helper_set_input_resolution(inst, inst->width,
@@ -762,17 +764,13 @@ static int venc_out_num_buffers(struct venus_inst *inst, unsigned int *num)
 	struct hfi_buffer_requirements bufreq;
 	int ret;
 
-	ret = venc_init_session(inst);
+	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
 	if (ret)
 		return ret;
 
-	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
-
 	*num = bufreq.count_actual;
 
-	hfi_session_deinit(inst);
-
-	return ret;
+	return 0;
 }
 
 static int venc_queue_setup(struct vb2_queue *q,
@@ -781,7 +779,7 @@ static int venc_queue_setup(struct vb2_queue *q,
 {
 	struct venus_inst *inst = vb2_get_drv_priv(q);
 	unsigned int num, min = 4;
-	int ret = 0;
+	int ret;
 
 	if (*num_planes) {
 		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
@@ -803,6 +801,13 @@ static int venc_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
+	mutex_lock(&inst->lock);
+	ret = venc_init_session(inst);
+	mutex_unlock(&inst->lock);
+
+	if (ret)
+		return ret;
+
 	switch (q->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		*num_planes = inst->fmt_out->num_planes;
@@ -838,6 +843,49 @@ static int venc_queue_setup(struct vb2_queue *q,
 	return ret;
 }
 
+static int venc_buf_init(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst->buf_count++;
+
+	return venus_helper_vb2_buf_init(vb);
+}
+
+static void venc_release_session(struct venus_inst *inst)
+{
+	int ret;
+
+	mutex_lock(&inst->lock);
+
+	ret = hfi_session_deinit(inst);
+	if (ret || inst->session_error)
+		hfi_session_abort(inst);
+
+	mutex_unlock(&inst->lock);
+
+	venus_pm_load_scale(inst);
+	INIT_LIST_HEAD(&inst->registeredbufs);
+	venus_pm_release_core(inst);
+}
+
+static void venc_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_buffer *buf = to_venus_buffer(vbuf);
+
+	mutex_lock(&inst->lock);
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		if (!list_empty(&inst->registeredbufs))
+			list_del_init(&buf->reg_list);
+	mutex_unlock(&inst->lock);
+
+	inst->buf_count--;
+	if (!inst->buf_count)
+		venc_release_session(inst);
+}
+
 static int venc_verify_conf(struct venus_inst *inst)
 {
 	enum hfi_version ver = inst->core->res->hfi_version;
@@ -888,38 +936,32 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	inst->sequence_cap = 0;
 	inst->sequence_out = 0;
 
-	ret = venc_init_session(inst);
-	if (ret)
-		goto bufs_done;
-
 	ret = venus_pm_acquire_core(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venc_set_properties(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venc_verify_conf(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
 					inst->num_output_bufs, 0);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venus_helper_vb2_start_streaming(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	mutex_unlock(&inst->lock);
 
 	return 0;
 
-deinit_sess:
-	hfi_session_deinit(inst);
-bufs_done:
+error:
 	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->streamon_out = 0;
@@ -931,7 +973,8 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 
 static const struct vb2_ops venc_vb2_ops = {
 	.queue_setup = venc_queue_setup,
-	.buf_init = venus_helper_vb2_buf_init,
+	.buf_init = venc_buf_init,
+	.buf_cleanup = venc_buf_cleanup,
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
-- 
2.17.1

