Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0DF23E744
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 08:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgHGGZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 02:25:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62166 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgHGGZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 02:25:03 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Aug 2020 23:25:03 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Aug 2020 23:25:02 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Aug 2020 11:54:50 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 06DEA21C70; Fri,  7 Aug 2020 11:54:49 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [RESEND  1/3] venus: core: handle race condititon for core ops
Date:   Fri,  7 Aug 2020 11:54:36 +0530
Message-Id: <1596781478-12216-2-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For core ops we are having only write protect but there
is no read protect, because of this in multthreading
and concurrency, one CPU core is reading without wait
which is causing the NULL pointer dereferece crash.

one such scenario is as show below, where in one
core core->ops becoming NULL and in another core
calling core->ops->session_init().

CPU: core-7:
Call trace:
 hfi_session_init+0x180/0x1dc [venus_core]
 vdec_queue_setup+0x9c/0x364 [venus_dec]
 vb2_core_reqbufs+0x1e4/0x368 [videobuf2_common]
 vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
 v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
 v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
 v4l_reqbufs+0x4c/0x5c
__video_do_ioctl+0x2b0/0x39c

CPU: core-0:
Call trace:
 venus_shutdown+0x98/0xfc [venus_core]
 venus_sys_error_handler+0x64/0x148 [venus_core]
 process_one_work+0x210/0x3d0
 worker_thread+0x248/0x3f4
 kthread+0x11c/0x12c

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 drivers/media/platform/qcom/venus/hfi.c  | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c653..fe99c83 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -64,8 +64,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 	pm_runtime_get_sync(core->dev);
 
 	hfi_core_deinit(core, true);
-	hfi_destroy(core);
 	mutex_lock(&core->lock);
+	hfi_destroy(core);
 	venus_shutdown(core);
 
 	pm_runtime_put_sync(core->dev);
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index a211eb9..2eeb31f 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -195,7 +195,7 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
 int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 {
 	struct venus_core *core = inst->core;
-	const struct hfi_ops *ops = core->ops;
+	const struct hfi_ops *ops;
 	int ret;
 
 	if (inst->state != INST_UNINIT)
@@ -204,10 +204,13 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 	inst->hfi_codec = to_codec_type(pixfmt);
 	reinit_completion(&inst->done);
 
+	mutex_lock(&core->lock);
+	ops = core->ops;
 	ret = ops->session_init(inst, inst->session_type, inst->hfi_codec);
 	if (ret)
 		return ret;
 
+	mutex_unlock(&core->lock);
 	ret = wait_session_msg(inst);
 	if (ret)
 		return ret;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

