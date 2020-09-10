Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2430264649
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 14:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730857AbgIJMqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 08:46:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11026 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbgIJMpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 08:45:36 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 10 Sep 2020 05:44:39 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 10 Sep 2020 05:44:37 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Sep 2020 18:14:25 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id DD94921D23; Thu, 10 Sep 2020 18:14:23 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 2/3] venus: core: cancel pending work items in workqueue
Date:   Thu, 10 Sep 2020 18:14:15 +0530
Message-Id: <1599741856-16239-3-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
References: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In concurrency usecase and reboot scenario we are
observing race condition and seeing NULL pointer
dereference crash. In shutdown path and system
recovery path we are destroying the same mutex
hence seeing crash.

This case is handled by mutex protection and
cancel delayed work items in work queue.

Below is the call trace for the crash
Call trace:
 venus_remove+0xdc/0xec [venus_core]
 venus_core_shutdown+0x1c/0x34 [venus_core]
 platform_drv_shutdown+0x28/0x34
 device_shutdown+0x154/0x1fc
 kernel_restart_prepare+0x40/0x4c
 kernel_restart+0x1c/0x64

Call trace:
 mutex_lock+0x34/0x60
 venus_hfi_destroy+0x28/0x98 [venus_core]
 hfi_destroy+0x1c/0x28 [venus_core]
 venus_sys_error_handler+0x60/0x14c [venus_core]
 process_one_work+0x210/0x3d0
 worker_thread+0x248/0x3f4
 kthread+0x11c/0x12c
 ret_from_fork+0x10/0x18

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c5af428..69aa199 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -323,6 +323,8 @@ static int venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
+	cancel_delayed_work_sync(&core->work);
+
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
@@ -340,7 +342,9 @@ static int venus_remove(struct platform_device *pdev)
 	if (pm_ops->core_put)
 		pm_ops->core_put(dev);
 
+	mutex_lock(&core->lock);
 	hfi_destroy(core);
+	mutex_unlock(&core->lock);
 
 	icc_put(core->video_path);
 	icc_put(core->cpucfg_path);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

