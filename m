Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96E82769ED
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 09:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgIXHAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 03:00:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46639 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgIXHAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 03:00:11 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2020 23:59:55 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2020 23:59:53 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2020 12:29:51 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 5208C21D59; Thu, 24 Sep 2020 12:29:50 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v5 1/3] venus: core: handle race condititon for core ops
Date:   Thu, 24 Sep 2020 12:29:44 +0530
Message-Id: <1600930786-18275-2-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600930786-18275-1-git-send-email-mansur@codeaurora.org>
References: <1600930786-18275-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For core ops we are having only write protect but there
is no read protect, because of this in multithreading
and concurrency, one CPU core is reading without wait
which is causing the NULL pointer dereferece crash.

one such scenario is as show below, where in one CPU
core, core->ops becoming NULL and in another CPU core
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
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
Changes in v5:
- Addressed review comments by stan in v4 version

 drivers/media/platform/qcom/venus/hfi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index a59022a..638ed5c 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -198,6 +198,18 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 	const struct hfi_ops *ops = core->ops;
 	int ret;
 
+	/*
+	 * If core shutdown is in progress or if we are in system
+	 * recovery, return an error as during system error recovery
+	 * session_init() can't pass successfully
+	 */
+	mutex_lock(&core->lock);
+	if (!core->ops || core->sys_error) {
+		mutex_unlock(&core->lock);
+		return -EIO;
+	}
+	mutex_unlock(&core->lock);
+
 	if (inst->state != INST_UNINIT)
 		return -EINVAL;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

