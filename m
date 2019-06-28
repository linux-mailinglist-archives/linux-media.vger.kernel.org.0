Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30C959C58
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbfF1NBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:01:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38929 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfF1NAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so6214575wrt.6
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iIPMb9M330BFTKiYEMbJPjGasEIFSJBAqHuplkfgTXU=;
        b=ahTFGj2kh3K11SbQbt7t2A+bOhVM9w7V1NcNq7xDZlfsEqailhNG8GwipjuTM9zFZo
         Ab9hlm4ctVySSs3wPGHrFFYLROgYEshCp0EbdilgEcVO00YkcM5bt8SpLK63K62z/5FZ
         KCndSQxmExgpFcmUsxIODF3yN8T7zQjTApuNnIh0ON++b0vdXhjtM6ICR4Hc6hajNYtb
         7vtbOVqqydLF6SFYhKZXf6uBazVsYQwAedP7Go1lUnE0cTqUhWayJADTI8SYdt7ZnYbq
         lUmxhYWzooWpLiAoAHU9y4+VDoOb8A/kzkU4Z+Ch9dKVgZlYVrX0Vfzrbe0pn4lvn8du
         q2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iIPMb9M330BFTKiYEMbJPjGasEIFSJBAqHuplkfgTXU=;
        b=nch1Bz3mjZOiyzFI0Np+QSf1W8/SQ05hIa51piwpWV8FtOpQGRGED9LeybsDRB5AB3
         bQVxJE/0FsKWBGHh93LoTvxIQy13XSLwHjDNjVuju3hZui7fHSEp6iVOq2OJF8vg2/4a
         JTZr7bC4+x5t09ymTcuYY3eCYx5PeSZ9MWVFD7C2VE4G7WeuHlk5ai8XnvI28p8VMDrt
         anQ6mfZ5Mt+0iC9OwFoSn6tGQDVmsK6GFWA1R9Nyt3WGIjYTTCO0PLMWEmJhs20YjEYf
         kQ/ibj6NYEtTV63H2LGNvvYDTAlCIaca/alesC2NZXY8bpvL8hAexM4eSorWyTqH2Otj
         mqag==
X-Gm-Message-State: APjAAAWqbIqdbsKRHebK9fEpAg5ohIoYKANm4pqVvRb4I6fX03tnM17i
        EisMy9DUpVE1Ywb8FGEPOeW0TGj+k20=
X-Google-Smtp-Source: APXvYqwROanUwgqc+3i5q1ibO6XDuauO0I2FYtxjjciJOruumU2A636loDJTHBEJlQI/To8dJDhTYg==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr7982736wrs.136.1561726834250;
        Fri, 28 Jun 2019 06:00:34 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:33 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 06/11] venus: helpers: add three more helper functions
Date:   Fri, 28 Jun 2019 15:59:57 +0300
Message-Id: <20190628130002.24293-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds three more helper functions:
 * for internal buffers reallocation, applicable when we are doing
dynamic resolution change
 * for initial buffer processing of capture and output queue buffer
types

All of them will be needed for stateful Codec API support.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 82 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  3 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 63af69acc068..ab20fd3b36d9 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -313,6 +313,52 @@ int venus_helper_intbufs_free(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(venus_helper_intbufs_free);
 
+int venus_helper_intbufs_realloc(struct venus_inst *inst)
+{
+	enum hfi_version ver = inst->core->res->hfi_version;
+	struct hfi_buffer_desc bd;
+	struct intbuf *buf, *n;
+	int ret;
+
+	list_for_each_entry_safe(buf, n, &inst->internalbufs, list) {
+		if (buf->type == HFI_BUFFER_INTERNAL_PERSIST ||
+		    buf->type == HFI_BUFFER_INTERNAL_PERSIST_1)
+			continue;
+
+		memset(&bd, 0, sizeof(bd));
+		bd.buffer_size = buf->size;
+		bd.buffer_type = buf->type;
+		bd.num_buffers = 1;
+		bd.device_addr = buf->da;
+		bd.response_required = true;
+
+		ret = hfi_session_unset_buffers(inst, &bd);
+
+		dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
+			       buf->attrs);
+
+		list_del_init(&buf->list);
+		kfree(buf);
+	}
+
+	ret = intbufs_set_buffer(inst, HFI_BUFFER_INTERNAL_SCRATCH(ver));
+	if (ret)
+		goto err;
+
+	ret = intbufs_set_buffer(inst, HFI_BUFFER_INTERNAL_SCRATCH_1(ver));
+	if (ret)
+		goto err;
+
+	ret = intbufs_set_buffer(inst, HFI_BUFFER_INTERNAL_SCRATCH_2(ver));
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(venus_helper_intbufs_realloc);
+
 static u32 load_per_instance(struct venus_inst *inst)
 {
 	u32 mbs;
@@ -1041,6 +1087,42 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
 
+int venus_helper_process_initial_cap_bufs(struct venus_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buf, *n;
+	int ret;
+
+	v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buf, n) {
+		ret = session_process_buf(inst, &buf->vb);
+		if (ret) {
+			return_buf_error(inst, &buf->vb);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(venus_helper_process_initial_cap_bufs);
+
+int venus_helper_process_initial_out_bufs(struct venus_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buf, *n;
+	int ret;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
+		ret = session_process_buf(inst, &buf->vb);
+		if (ret) {
+			return_buf_error(inst, &buf->vb);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(venus_helper_process_initial_out_bufs);
+
 int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 70288dc860ff..486598d52811 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -56,7 +56,10 @@ int venus_helper_power_enable(struct venus_core *core, u32 session_type,
 			      bool enable);
 int venus_helper_intbufs_alloc(struct venus_inst *inst);
 int venus_helper_intbufs_free(struct venus_inst *inst);
+int venus_helper_intbufs_realloc(struct venus_inst *inst);
 int venus_helper_queue_dpb_bufs(struct venus_inst *inst);
 int venus_helper_unregister_bufs(struct venus_inst *inst);
 int venus_helper_load_scale_clocks(struct venus_core *core);
+int venus_helper_process_initial_cap_bufs(struct venus_inst *inst);
+int venus_helper_process_initial_out_bufs(struct venus_inst *inst);
 #endif
-- 
2.17.1

