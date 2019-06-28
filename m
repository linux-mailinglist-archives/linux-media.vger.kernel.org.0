Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8681159C3F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfF1NAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:00:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53955 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfF1NA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so9039878wmj.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GusbBynaCqv/R7PuXUh9f4fYgooqYn7QcUElwV3IoHw=;
        b=De101qptdsYL0UicblH+0MmEOsOwGd+uz5zS5yDQ7qsD6kvBZYe/p2vCHilDdo/kyW
         roUJ+dw0+3tBeymz8w0ZRPrYuVgOrzi6pyZIQxUNmXVcIk8xpLw3jSoGeopa9+5zPPTK
         P+xdVmMx4llnfrZUDtUnH3UFf24VDmU/TJ9j5hDHt4KxdL1RWUT9hmIY8H4UbOF6ivvj
         0QnmGV476jPRt2QNUNKPUEGCBL2F5/VOc9oO8703SM5fNxwZHRIe9q93+mDVsBzlcp4o
         7y6NXhMXdWhEh/oXqp0bTX0dNoRp0RTEEN2h+gvNgEmTwfFBpEP3lxHToapNIdFg1p+V
         MMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GusbBynaCqv/R7PuXUh9f4fYgooqYn7QcUElwV3IoHw=;
        b=YydnXWscK2ktAA5wH5s2UIxKlFRJvAW00bQ23y+MHqZx1+OgdM65caj98ksTXS5QNM
         UXBfabpTkUkl5c35mbZwQ4L4eufSHSScin3uQkZBsV4N1RtH6DDeT9QPi3jiCwHO/a5p
         85BHex/iZT0Y6eUV2PqMWCAq/aNrOrM10GW5smMCUoVn+HBwwPr2wg6joDvHuKF48EZV
         vaaypqy1KxWRaG8xZTwlFH+aKOD6Gff4nmg1yVM8ZuzybxbPGYWlEhiLvZfzPe/YrI28
         5YgbEEOBv9q+k3l13Upx3O++dJ7B7uDOZA7ymzJLfLP3ksXEbIRLUYZ4WYY7Md7s01Jg
         4gLw==
X-Gm-Message-State: APjAAAVPS6k5xenz6k++oGWx5YioGAlEeLIOg2lZz4prpK396MmnwQuI
        zcmJc6vF2en8Vf7NctnyVAUp8NTjnJ8=
X-Google-Smtp-Source: APXvYqy9IA/jZh85Sd5TI3JjPUEhztL9jxR/hNYIUVg+erIRX6stbueqHYOe92u5XALzqsqDswq1DA==
X-Received: by 2002:a1c:407:: with SMTP id 7mr7658444wme.113.1561726827460;
        Fri, 28 Jun 2019 06:00:27 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 02/11] venus: helpers: export few helper functions
Date:   Fri, 28 Jun 2019 15:59:53 +0300
Message-Id: <20190628130002.24293-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here we export few helper function to use them from decoder to
implement more granular control needed for stateful Codec API
compliance.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 29 ++++++++++++---------
 drivers/media/platform/qcom/venus/helpers.h |  6 +++++
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 71b06dfc6dc4..63af69acc068 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -79,7 +79,7 @@ bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
 }
 EXPORT_SYMBOL_GPL(venus_helper_check_codec);
 
-static int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
+int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
 {
 	struct intbuf *buf;
 	int ret = 0;
@@ -100,6 +100,7 @@ static int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
 fail:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(venus_helper_queue_dpb_bufs);
 
 int venus_helper_free_dpb_bufs(struct venus_inst *inst)
 {
@@ -278,7 +279,7 @@ static const unsigned int intbuf_types_4xx[] = {
 	HFI_BUFFER_INTERNAL_PERSIST_1,
 };
 
-static int intbufs_alloc(struct venus_inst *inst)
+int venus_helper_intbufs_alloc(struct venus_inst *inst)
 {
 	const unsigned int *intbuf;
 	size_t arr_sz, i;
@@ -304,11 +305,13 @@ static int intbufs_alloc(struct venus_inst *inst)
 	intbufs_unset_buffers(inst);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(venus_helper_intbufs_alloc);
 
-static int intbufs_free(struct venus_inst *inst)
+int venus_helper_intbufs_free(struct venus_inst *inst)
 {
 	return intbufs_unset_buffers(inst);
 }
+EXPORT_SYMBOL_GPL(venus_helper_intbufs_free);
 
 static u32 load_per_instance(struct venus_inst *inst)
 {
@@ -339,7 +342,7 @@ static u32 load_per_type(struct venus_core *core, u32 session_type)
 	return mbs_per_sec;
 }
 
-static int load_scale_clocks(struct venus_core *core)
+int venus_helper_load_scale_clocks(struct venus_core *core)
 {
 	const struct freq_tbl *table = core->res->freq_tbl;
 	unsigned int num_rows = core->res->freq_tbl_size;
@@ -388,6 +391,7 @@ static int load_scale_clocks(struct venus_core *core)
 	dev_err(dev, "failed to set clock rate %lu (%d)\n", freq, ret);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(venus_helper_load_scale_clocks);
 
 static void fill_buffer_desc(const struct venus_buffer *buf,
 			     struct hfi_buffer_desc *bd, bool response)
@@ -472,7 +476,7 @@ static bool is_dynamic_bufmode(struct venus_inst *inst)
 	return caps->cap_bufs_mode_dynamic;
 }
 
-static int session_unregister_bufs(struct venus_inst *inst)
+int venus_helper_unregister_bufs(struct venus_inst *inst)
 {
 	struct venus_buffer *buf, *n;
 	struct hfi_buffer_desc bd;
@@ -489,6 +493,7 @@ static int session_unregister_bufs(struct venus_inst *inst)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(venus_helper_unregister_bufs);
 
 static int session_register_bufs(struct venus_inst *inst)
 {
@@ -1009,8 +1014,8 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 	if (inst->streamon_out & inst->streamon_cap) {
 		ret = hfi_session_stop(inst);
 		ret |= hfi_session_unload_res(inst);
-		ret |= session_unregister_bufs(inst);
-		ret |= intbufs_free(inst);
+		ret |= venus_helper_unregister_bufs(inst);
+		ret |= venus_helper_intbufs_free(inst);
 		ret |= hfi_session_deinit(inst);
 
 		if (inst->session_error || core->sys_error)
@@ -1021,7 +1026,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 		venus_helper_free_dpb_bufs(inst);
 
-		load_scale_clocks(core);
+		venus_helper_load_scale_clocks(core);
 		INIT_LIST_HEAD(&inst->registeredbufs);
 	}
 
@@ -1041,7 +1046,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	int ret;
 
-	ret = intbufs_alloc(inst);
+	ret = venus_helper_intbufs_alloc(inst);
 	if (ret)
 		return ret;
 
@@ -1049,7 +1054,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	if (ret)
 		goto err_bufs_free;
 
-	load_scale_clocks(core);
+	venus_helper_load_scale_clocks(core);
 
 	ret = hfi_session_load_res(inst);
 	if (ret)
@@ -1070,9 +1075,9 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 err_unload_res:
 	hfi_session_unload_res(inst);
 err_unreg_bufs:
-	session_unregister_bufs(inst);
+	venus_helper_unregister_bufs(inst);
 err_bufs_free:
-	intbufs_free(inst);
+	venus_helper_intbufs_free(inst);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_start_streaming);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 153783687a0c..70288dc860ff 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -9,6 +9,7 @@
 #include <media/videobuf2-v4l2.h>
 
 struct venus_inst;
+struct venus_core;
 
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
 struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
@@ -53,4 +54,9 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
 int venus_helper_free_dpb_bufs(struct venus_inst *inst);
 int venus_helper_power_enable(struct venus_core *core, u32 session_type,
 			      bool enable);
+int venus_helper_intbufs_alloc(struct venus_inst *inst);
+int venus_helper_intbufs_free(struct venus_inst *inst);
+int venus_helper_queue_dpb_bufs(struct venus_inst *inst);
+int venus_helper_unregister_bufs(struct venus_inst *inst);
+int venus_helper_load_scale_clocks(struct venus_core *core);
 #endif
-- 
2.17.1

