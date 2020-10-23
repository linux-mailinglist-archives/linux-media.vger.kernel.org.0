Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A01296FCA
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464149AbgJWM5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464145AbgJWM51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:57:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A49C0613D9
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so1692404wrp.10
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+xri++KZd0ajH9qdVfAp67Rdv968jiyDThdwgMpFlQU=;
        b=C1s2PoR5O3lgcFe585reoiQJvXOXD6IBX9C7RDoyIHQqE+G2XDhpnGVoatJW551ssX
         FALN9Y7qmuik7OlOkaOrSpRKNMQJ5wts0JBvoOCg7OU2PYFka4ecQDFeZl3FaQ5KJn8E
         p85w7vrEMAnsJVngcaweMZYCJ2sB8UbLc85G3z226198JwO/rQ6UAk7Y4c+5qnvrKZy8
         rB8Rq8XOZ7Vf41a6mVgnyADdcnTpli6x/8BgO0rFBjJQFkMea68RknoIM0Dye1oISd86
         SmtYjnqEwg2qPhvjevKr9Gwu/kMjbW9By4O3XXPCXZkx7FmJ5iSU9aBuSFXYHkvEruJ4
         hmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+xri++KZd0ajH9qdVfAp67Rdv968jiyDThdwgMpFlQU=;
        b=lbyO6GG65cmnIGP0NQGbmZ1hfnQKrVconSbITJL4nsRiSrrJDDoNqEkre5oL880zuV
         XIDgSFosIH2kBBhJDzSRK9x9gNiDtMefxA8EvejNeRuV5tCxJLtA511Nsb0AaZDYngY7
         DAtinhyo/+jKuFzFh5lIvg+F+u9KjlK44Jj1FRq/SliaHF8upPL2yUbLv6Q3c5LnWF1y
         E34lujuJ8OUvvOQcu61TWJmloQ2rZysLSd8meDhvhFQCee3EdI4fbgFDDQCD5G9cpxoC
         kHGVtyGiFm+QWpge+L8pLLWY1vJQP2pSlasdHX7FZE+N4OKZGvvW3EaupmScXiIAYAAG
         tA8A==
X-Gm-Message-State: AOAM531Cl31BSN1JBPGQ8Rv1UnW6voHQZZdMsw5qn8wMHNLWyiFEAeQ4
        hl6GAXKEdwXwpOxwfSkyRY/xEDMVJzXWg+7Q
X-Google-Smtp-Source: ABdhPJwNk4Ej8+YvZTaW3P3YHgDEX1teggYAa0I8cBEU+Xl67inPYEEqk39KnkHG1tYLjpq1oK0kXQ==
X-Received: by 2002:adf:eccb:: with SMTP id s11mr2529446wro.135.1603457843988;
        Fri, 23 Oct 2020 05:57:23 -0700 (PDT)
Received: from localhost.localdomain (hst-221-77.medicom.bg. [84.238.221.77])
        by smtp.gmail.com with ESMTPSA id s19sm3475873wmc.0.2020.10.23.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:57:23 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/4] venus: helpers: Delete unused stop streaming helper
Date:   Fri, 23 Oct 2020 15:57:04 +0300
Message-Id: <20201023125704.4984-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
References: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
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
index 8d0ca70d740d..1668cbaf3c72 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1404,49 +1404,6 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
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
index dca4794c05d9..b8d6c5085d4f 100644
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

