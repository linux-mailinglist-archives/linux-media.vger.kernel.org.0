Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359512AF3C9
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 15:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbgKKOjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 09:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbgKKOik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:40 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0A7C061A56
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:38 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so2761044wrx.5
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DzUjnsp2X4OnTCyXgn/JbY+DNy5G4LB8TIDONuAc8II=;
        b=Qzf64FhVyFPIfQD1gu6EoyuhzvYG1X3bVXltED54Gqv32hegCwzWHi3W3muW0j04+T
         jgF9K5kF2vVLRSanLBmu7r32YPYE4t+qTKbOE2uDoby4tKP1z9dD3DLPJK14KCXR4QTc
         eFR+8+lixZGzRPhGBRbEoXFm55q7HJat3WH2EW0cgpvQUM5ZTEWWbJPYycrVX/3rIesY
         k90QNUFB4yXAlAxx7o6lA8seBS45akDOwgrR3E4Khpm4kNnL/ecBUeAhHuUvzNhUjx28
         QtYZy+mt6U7R+CB10xXZKxvKyabezUpyRU4G2CSa/OUYhKoobPe0APxaBd5zoFnxf/1p
         x6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DzUjnsp2X4OnTCyXgn/JbY+DNy5G4LB8TIDONuAc8II=;
        b=BcKGM/fKEPyj6ddT2PYum/xXftlR8OV+mxKnr9veQvSv01kQxVOiUeTFiw2c+QkRgc
         o+62CD3HGzF2t24FhPoQ2ba7I83D1KzEdcIkjR9ZyjqRW7b9lZQbeSEcj2d2Iy1Qff3V
         Cv42mOofBhnxdh25hxw1gphvd0qS+mqYBHoSdCe31f3Mxku2VWb7aioOtchMYRI6iC7y
         as5ZBnHJxuaJq6iiZvvIDq85RrXm7bHVAydiiHSevBv1GpHmWnawU8UPjpxIz5cLEt4T
         EvBhs9vdhOWxYRgX+G+CIQGvdcIDY0PHO3NG0aWRuijGUoOSr5PpmWhnyeoqQpnz3VQn
         BnZA==
X-Gm-Message-State: AOAM532nOdL1/WBZtUFl15KLlZPe21G4s39Ys89ip773PuI+PYWDvXUO
        6BF73oVDcAVm4BrA7ycBmBk+wuSuMb2YsG2q
X-Google-Smtp-Source: ABdhPJz3exYiT8GJMsh3/W6jpnBZ3DjMRWetrng5MyjLQM4Di85RFaHmr5jjqSjwNZucXT7uhaHc8Q==
X-Received: by 2002:adf:f304:: with SMTP id i4mr17619843wro.268.1605105516778;
        Wed, 11 Nov 2020 06:38:36 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:36 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 8/8] venus: helpers: Delete unused stop streaming helper
Date:   Wed, 11 Nov 2020 16:37:55 +0200
Message-Id: <20201111143755.24541-9-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After re-design of encoder driver this helper is not needed
anymore.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 43 ---------------------
 drivers/media/platform/qcom/venus/helpers.h |  1 -
 2 files changed, 44 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 490c026b58a3..51c80417f361 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1406,49 +1406,6 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 }
 EXPORT_SYMBOL_GPL(venus_helper_buffers_done);
 
-void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
-{
-	struct venus_inst *inst = vb2_get_drv_priv(q);
-	struct venus_core *core = inst->core;
-	int ret;
-
-	mutex_lock(&inst->lock);
-
-	if (inst->streamon_out & inst->streamon_cap) {
-		ret = hfi_session_stop(inst);
-		ret |= hfi_session_unload_res(inst);
-		ret |= venus_helper_unregister_bufs(inst);
-		ret |= venus_helper_intbufs_free(inst);
-		ret |= hfi_session_deinit(inst);
-
-		if (inst->session_error || core->sys_error)
-			ret = -EIO;
-
-		if (ret)
-			hfi_session_abort(inst);
-
-		venus_helper_free_dpb_bufs(inst);
-
-		venus_pm_load_scale(inst);
-		INIT_LIST_HEAD(&inst->registeredbufs);
-	}
-
-	venus_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-				  VB2_BUF_STATE_ERROR);
-	venus_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-				  VB2_BUF_STATE_ERROR);
-
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
-		inst->streamon_out = 0;
-	else
-		inst->streamon_cap = 0;
-
-	venus_pm_release_core(inst);
-
-	mutex_unlock(&inst->lock);
-}
-EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
-
 int venus_helper_process_initial_cap_bufs(struct venus_inst *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 231af29667e7..3eae2acbcc8e 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -20,7 +20,6 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
 int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
 void venus_helper_vb2_buf_queue(struct vb2_buffer *vb);
 void venus_helper_process_buf(struct vb2_buffer *vb);
-void venus_helper_vb2_stop_streaming(struct vb2_queue *q);
 int venus_helper_vb2_start_streaming(struct venus_inst *inst);
 void venus_helper_m2m_device_run(void *priv);
 void venus_helper_m2m_job_abort(void *priv);
-- 
2.17.1

