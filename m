Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE7B387CBE
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 17:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350377AbhERPsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 11:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350325AbhERPrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 11:47:18 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB56C06138F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:28 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id b25so15337799eju.5
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y7K2JbNeUWm87uiKc3ObB7AJ60gqYS/WRSTd2rZZKPQ=;
        b=NPEiXHChn3WwgCCrlRDA2Pr9U8tOuNH538BPSpd6Al/XC/DBBtreV9h6ky5XUB8nar
         SKRS88Uz4OxHyDtGhi70CfQQw84mcg5CgFOXbRZ/3nhOfur2gOfyzHfItD/+3yEo5ksT
         8FOHplGBOw1A/PSedhwiGZ5jhd+n9SV2IBCck01s8RYdVtV0VHZjFxKePBkBFZYGZBMv
         GoBZ6fyl11KKhuBmYnfURitHCDEGRjlfhze8TajoPf0I2M8mbXF6M/jQ9MjAPXC0wRXk
         u1mWPItXfjpfcEYModQmL9mWx1lfajVZ2ErNwFVeM5zjU4gS10tsFFyZJl+EOHJW2XHx
         Qgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7K2JbNeUWm87uiKc3ObB7AJ60gqYS/WRSTd2rZZKPQ=;
        b=jxbzUvXsbbUjmFtOBccEatBZRIIr0ljNHWTv2xyqh0LUGs04wTdFwv3uvJqjlWhSWy
         i/Wy8b/vPBVBhrAFUBmIY+c/2HotIzL9mBEFKAd046xii5UjxC6Mzk7DOjaEsBkiaGJI
         kqiv+aRpUVG44OaOw0IvZraSIwvOqMYdRyEkm0wRpwhxz7JHN7kfp/h7PQt9ie7D4s3T
         Q/wD3D+pe6Kvmuitm8QhZCnyxsftZC9MNSvV24zUoEkObKM5BQB6OgukIjwBT5uKkV+c
         WKEg2WkAY3VoDDJLx04mSVPuWcGBh1V1ALyi3xh6gLdrPSMM1YuBCiT8KQziA45WWBqb
         R6IQ==
X-Gm-Message-State: AOAM533VTRIrStDYehr5qZsVLxciyRSxdyGor/qkMUEMIOfz4b3oQHyM
        l3GjXuiTWIfjfyS0l5gp2BOiDLBwckmPzjSh
X-Google-Smtp-Source: ABdhPJxryiFwZacAU28Dew5wKo1zmwaHalSPONXiyeux9FGYfZmrHx4yMhhcbSmBzZCHZLpBKHEv2g==
X-Received: by 2002:a17:906:2b57:: with SMTP id b23mr6625927ejg.294.1621352726608;
        Tue, 18 May 2021 08:45:26 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id n17sm13016434eds.72.2021.05.18.08.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:45:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/5] venus: hfi: Check for sys error on session hfi functions
Date:   Tue, 18 May 2021 18:45:07 +0300
Message-Id: <20210518154509.602137-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
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

