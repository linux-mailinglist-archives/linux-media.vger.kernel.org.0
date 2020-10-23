Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3844296FCF
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464176AbgJWM5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464131AbgJWM5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:57:23 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BB9C0613D5
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:23 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q5so1439215wmq.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZFseCIKmd4AutdezcJJkL4SrWd2bZ1+/6MDl5tIHNnc=;
        b=YSUyy99Rkveptn5PzX5hv4IkjbPMMugLbvjuzfzkr96YHYPqTot2Ym3PIFQbNsDADW
         +LyYKNtpy9GHP3FWlcFzXQ2vJx+KwdYl8mYo3gYkugu4ORGpP8OsCspJQPQ2eV7S0zKo
         X8zh8zhobD0GBED+11SQDKq18CGTBwxos/NIalT6kmWUK/qk5gj59feAnpN3DQTa07gn
         3arL8KyFlaMixoJ1hmdn/ic95g348jXonXv3DZGxOolqBHnTpTNciXyiAzvu62ItqraW
         QehWjbwbom5rckpgGNfAiFRN0fwyOCk4umm8X0FzXUJfP9qGPurNsUNXbnEJhX2UZGh6
         d++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZFseCIKmd4AutdezcJJkL4SrWd2bZ1+/6MDl5tIHNnc=;
        b=s4+54/YGRFQAp6cxL6GSxPjftQlV6Msyud+6qjtSYFYp9D9kXNiMPt5gyaZx6c1/JX
         d1Wsrp8PDo8VkK2mhUZyvzfzj3f2BEDTH5U+E0ZmIzWqfoF+MybACgjUWw47JfnonT51
         z7zj/Lvlt8MvnM+A03rnq/m2BOelaMXrUWPX9vhR1+nqSAN6NzRLbugjvXkBQVO112zW
         3aFF2S++6Wi7yPLhzPOpktPNSmNzIhuX1fBX7IGce4sKFr2LKlysrUzjaNCpax9mBnjU
         YDWntB4QvoIdY9oqupvDMNlrDgFF6Gh+1V/M3Vx9BHbFyDlY6f/3g1fIrUPr6QE2cfY4
         4YtA==
X-Gm-Message-State: AOAM532VWjjVHuKyVtjjhsDYZihDx05qmyxuF67rPQpI8Cl3tPA4DLc7
        PZ/38l3L56+p00e3YqmXbAtEYH0IZfKajwUR
X-Google-Smtp-Source: ABdhPJyeZZ9bzyZYKpr/fdm9hlTUGXOVfcvjpWFXRM7+3BGWOKN/dr4ppE4nP9V7lWvvdA17YpLJ0A==
X-Received: by 2002:a1c:383:: with SMTP id 125mr660940wmd.175.1603457841937;
        Fri, 23 Oct 2020 05:57:21 -0700 (PDT)
Received: from localhost.localdomain (hst-221-77.medicom.bg. [84.238.221.77])
        by smtp.gmail.com with ESMTPSA id s19sm3475873wmc.0.2020.10.23.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:57:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] venus: helpers: Add a new helper for buffer processing
Date:   Fri, 23 Oct 2020 15:57:02 +0300
Message-Id: <20201023125704.4984-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
References: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
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
index 2b6925b6c274..8d0ca70d740d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1369,6 +1369,26 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
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
index a4a0562bc83f..dca4794c05d9 100644
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
2.17.1

