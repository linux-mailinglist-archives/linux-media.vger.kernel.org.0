Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62622C7DDB
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 06:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgK3FhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 00:37:12 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31683 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgK3FhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 00:37:12 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Nov 2020 21:36:31 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Nov 2020 21:36:30 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Nov 2020 11:06:16 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id B3AB62128A; Mon, 30 Nov 2020 11:06:15 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] venus: core: add support to dump FW region
Date:   Mon, 30 Nov 2020 11:06:12 +0530
Message-Id: <1606714572-1113-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to dump video FW region during FW crash
using devcoredump helpers.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6103aaf..01a0cfe 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -7,8 +7,10 @@
 #include <linux/interconnect.h>
 #include <linux/ioctl.h>
 #include <linux/delay.h>
+#include <linux/devcoredump.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -22,6 +24,48 @@
 #include "firmware.h"
 #include "pm_helpers.h"
 
+static int subsystem_dump(struct venus_core *core)
+{
+	struct device_node *node;
+	struct device *dev;
+	struct resource r;
+	void *mem_va;
+	size_t mem_size;
+	void *data;
+	int ret;
+
+	dev = core->dev;
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node)
+		return -EINVAL;
+
+	ret = of_address_to_resource(node, 0, &r);
+	if (ret)
+		goto err_put_node;
+
+	mem_size = resource_size(&r);
+
+	mem_va = memremap(r.start, mem_size, MEMREMAP_WC);
+	if (!mem_va) {
+		ret = -ENOMEM;
+		goto err_put_node;
+	}
+
+	data = vmalloc(mem_size);
+	if (!data) {
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	memcpy(data, mem_va, mem_size);
+
+	dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
+err_unmap:
+	memunmap(mem_va);
+err_put_node:
+	of_node_put(node);
+	return ret;
+}
 static void venus_event_notify(struct venus_core *core, u32 event)
 {
 	struct venus_inst *inst;
@@ -67,6 +111,9 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	venus_shutdown(core);
 
+	dev_warn(core->dev, "dumping FW region!\n");
+	subsystem_dump(core);
+
 	pm_runtime_put_sync(core->dev);
 
 	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
-- 
2.7.4

