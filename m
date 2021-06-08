Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F280839F55F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 13:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhFHLpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 07:45:24 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:46810 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhFHLpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 07:45:24 -0400
Received: by mail-ed1-f45.google.com with SMTP id r11so24080073edt.13
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y7K2JbNeUWm87uiKc3ObB7AJ60gqYS/WRSTd2rZZKPQ=;
        b=Y9CFdu/A3lYi+m+ZOqPqTrRzlO0TanrAkOSXVsz9kDK1wqQDq1wyCIM+oE6HiyxgUu
         8WftKNaykN4h557cUIqTLx6ycrbtZJsthwiw1qHZV1i6lXTnzaH4zcIh/e7oeS/aeLgZ
         6JOM53/sZv9THkqUoBqIkf2qsW4XdpjlyoWdHTonFG9ewcJNAyImh9AWfjn8uv+l6QRV
         u/+zLsX8WyYF4SJoKKNfyrZNs9pMRSVqbBxxxBiFhxUcbiqGdAaSYnFy4p24A8eCc229
         Qos5NTUnKuhGPD1XRjlVT6AL4l0PNzImHTgMGr12+OIaJTLm0tpAt/0qdtwk80rwFjmN
         BjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7K2JbNeUWm87uiKc3ObB7AJ60gqYS/WRSTd2rZZKPQ=;
        b=rxJ3UxO7rNKu78/AKRVanxePEZjSeEqiVThD999ULtcTsEZUdGBbdSB9EbIHarmeYy
         K+rNjJcWj7qWXc7N7w79y4jxK/t7x0f17gHEqqbZa7L5Atle8OaIDGdNuGAsCdEoGcpi
         xJiY12KG4m0oqG/+0jhIEpaLoN4J8hzESMSQrnt0gquhcMOpT5zAZ/GxDU00M6/dQ7eA
         QehXy+W7DnSPSjqoRaFaCGJf6xY/UJzR7FYoFYe8sDY6bjE//XzyXdB1flarqJmKtAmF
         m/TYc08862eA+GDMHNCp7zy1FPDFY/Wj9/AxeuA5I5k7yLBYQFg5rY3HhepJYMnWqFd/
         uCDg==
X-Gm-Message-State: AOAM530IoaYLFcA1hYiVELXHAgNwwlTjmYK+Ioffc4t9D4GFHflhly1/
        cvUYIKaHZyc/V35XxjUTDksWNZdl0bt43Z/L
X-Google-Smtp-Source: ABdhPJzd7ct8ZuBfa7wEsDhzlXv/2Ul3Ym9yy/mPqr+Dfb+/AUPktRs/sm34XVtMMdUNfxj8fz/Xzw==
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr25055452eds.12.1623152550438;
        Tue, 08 Jun 2021 04:42:30 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id x4sm8754740edq.23.2021.06.08.04.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:42:30 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 3/5] venus: hfi: Check for sys error on session hfi functions
Date:   Tue,  8 Jun 2021 14:41:54 +0300
Message-Id: <20210608114156.87018-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check sys error flag for all hfi_session_xxx functions and
exit with EIO in case of an error.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 179b1f8b2650..4e2151fb47f0 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -187,6 +187,11 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
 
 	mutex_lock(&core->lock);
 
+	if (test_bit(0, &inst->core->sys_error)) {
+		ret = -EIO;
+		goto unlock;
+	}
+
 	max = atomic_add_unless(&core->insts_count, 1,
 				core->max_sessions_supported);
 	if (!max) {
@@ -196,6 +201,7 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
 		ret = 0;
 	}
 
+unlock:
 	mutex_unlock(&core->lock);
 
 	return ret;
@@ -263,6 +269,9 @@ int hfi_session_deinit(struct venus_inst *inst)
 	if (inst->state < INST_INIT)
 		return -EINVAL;
 
+	if (test_bit(0, &inst->core->sys_error))
+		goto done;
+
 	reinit_completion(&inst->done);
 
 	ret = ops->session_end(inst);
@@ -273,6 +282,7 @@ int hfi_session_deinit(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+done:
 	inst->state = INST_UNINIT;
 
 	return 0;
@@ -284,6 +294,9 @@ int hfi_session_start(struct venus_inst *inst)
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (inst->state != INST_LOAD_RESOURCES)
 		return -EINVAL;
 
@@ -308,6 +321,9 @@ int hfi_session_stop(struct venus_inst *inst)
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (inst->state != INST_START)
 		return -EINVAL;
 
@@ -331,6 +347,9 @@ int hfi_session_continue(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (core->res->hfi_version == HFI_VERSION_1XX)
 		return 0;
 
@@ -343,6 +362,9 @@ int hfi_session_abort(struct venus_inst *inst)
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	reinit_completion(&inst->done);
 
 	ret = ops->session_abort(inst);
@@ -362,6 +384,9 @@ int hfi_session_load_res(struct venus_inst *inst)
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (inst->state != INST_INIT)
 		return -EINVAL;
 
@@ -385,6 +410,9 @@ int hfi_session_unload_res(struct venus_inst *inst)
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (inst->state != INST_STOP)
 		return -EINVAL;
 
@@ -409,6 +437,9 @@ int hfi_session_flush(struct venus_inst *inst, u32 type, bool block)
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	reinit_completion(&inst->done);
 
 	ret = ops->session_flush(inst, type);
@@ -429,6 +460,9 @@ int hfi_session_set_buffers(struct venus_inst *inst, struct hfi_buffer_desc *bd)
 {
 	const struct hfi_ops *ops = inst->core->ops;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	return ops->session_set_buffers(inst, bd);
 }
 
@@ -438,6 +472,9 @@ int hfi_session_unset_buffers(struct venus_inst *inst,
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	reinit_completion(&inst->done);
 
 	ret = ops->session_unset_buffers(inst, bd);
@@ -460,6 +497,9 @@ int hfi_session_get_property(struct venus_inst *inst, u32 ptype,
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (inst->state < INST_INIT || inst->state >= INST_STOP)
 		return -EINVAL;
 
@@ -483,6 +523,9 @@ int hfi_session_set_property(struct venus_inst *inst, u32 ptype, void *pdata)
 {
 	const struct hfi_ops *ops = inst->core->ops;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (inst->state < INST_INIT || inst->state >= INST_STOP)
 		return -EINVAL;
 
@@ -494,6 +537,9 @@ int hfi_session_process_buf(struct venus_inst *inst, struct hfi_frame_data *fd)
 {
 	const struct hfi_ops *ops = inst->core->ops;
 
+	if (test_bit(0, &inst->core->sys_error))
+		return -EIO;
+
 	if (fd->buffer_type == HFI_BUFFER_INPUT)
 		return ops->session_etb(inst, fd);
 	else if (fd->buffer_type == HFI_BUFFER_OUTPUT ||
-- 
2.25.1

