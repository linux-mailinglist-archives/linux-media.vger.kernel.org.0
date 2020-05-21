Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CED81DCDEF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 15:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729461AbgEUN2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 09:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbgEUN2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 09:28:46 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC304C05BD43
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 06:28:44 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id k19so6646485edv.9
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KgK4P2m0HWbcss1X1BSEkxtN1Ke/4iUpNFB9xpmQCOg=;
        b=vCFh/0+Rp4kSoWgjBnF1niGrWdO50WqI460eRb2JuKVtE7LHNqlTUqrahBUFWh/WZa
         7vdCJ5Jzi6dZmduyhLTE48j+BlJvxxQREP5KLq+opTmE7RzhB5tn/28SM/1429VQkk8N
         sFVXYxk5C3QneEDJZaxIPY4wu/yShzFgRqLvpNRBmLOoXjLvuh3xSbGcjpNXXyuii4eX
         2S5LkugngxeT7UDz7ogwFnIH3OAvjFCILzrrl4uke13aghoez0fhdY5kZt5dSR4lDb/s
         5GLxqis9Y3iP/ZVZT8HHr7VOg4a5XEQW7BnO5LuWbEoQ9akGPkBPrkueFUo+/4pylyPq
         16ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KgK4P2m0HWbcss1X1BSEkxtN1Ke/4iUpNFB9xpmQCOg=;
        b=T8vhmIiR3S7Fc0WSjc+ywKi0DZeu8HQsyTvFcMAQJFLrLvkspTWetLwkw7VTaxmBfK
         BO2oWHx1NCo3JjIcPFSriRVGHaY41wXiXd+ISLFZ+nkCIfBOEERSIQnnmm8N97X7AGzp
         u17+c5B7CZSbfefL1wlR+4TAZBE3wnDGbMyLFOOsZMD5npJZR+VvJjqVgaBPLf5xLysB
         YaH00UMkrlvqcj6AsK9010Y8INt+MGtes/UnUHq+3ATOIQcwZVGaTS0mq5oH2q1gLMqr
         dWRAYvvxhLXwNoW9d84bCcd+s9DwkYTkho9d0LNoCLKdsZssR/bMfypwWXsdOaKMp5I6
         J29w==
X-Gm-Message-State: AOAM53268jRbAJno/3qyeCjwE6wo79/vQl2yV0XJ1TTTSXBquImbMiN5
        Ky7CNDF3SWOu81LHOI4YjHtOnSzUid8urA==
X-Google-Smtp-Source: ABdhPJwF6w4PiSMUsC4iKOkahMR1nX0fjjKHYwOgy5UzmPBK9NfcGi8EVvT1b+KNeX3tjHaW0UK25g==
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr7672852edp.312.1590067723075;
        Thu, 21 May 2020 06:28:43 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-12.ip.btc-net.bg. [212.5.158.12])
        by smtp.gmail.com with ESMTPSA id lr21sm4980580ejb.117.2020.05.21.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:28:42 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/3] venus: Add debugfs interface to set firmware log level
Date:   Thu, 21 May 2020 16:28:14 +0300
Message-Id: <20200521132816.31111-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521132816.31111-1-stanimir.varbanov@linaro.org>
References: <20200521132816.31111-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be useful when debugging specific issues related to
firmware HFI interface.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |  2 +-
 drivers/media/platform/qcom/venus/core.c      |  5 ++++
 drivers/media/platform/qcom/venus/core.h      |  3 +++
 drivers/media/platform/qcom/venus/dbgfs.c     | 26 +++++++++++++++++++
 drivers/media/platform/qcom/venus/dbgfs.h     | 12 +++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c |  7 ++++-
 6 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 64af0bc1edae..dfc636865709 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -3,7 +3,7 @@
 
 venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
-		   hfi_parser.o pm_helpers.o
+		   hfi_parser.o pm_helpers.o dbgfs.o
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c6538044f..bbb394ca4175 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -290,6 +290,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dev_unregister;
 
+	ret = venus_dbgfs_init(core);
+	if (ret)
+		goto err_dev_unregister;
+
 	return 0;
 
 err_dev_unregister:
@@ -337,6 +341,7 @@ static int venus_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
+	venus_dbgfs_deinit(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7118612673c9..b48782f9aa95 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -12,6 +12,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 
+#include "dbgfs.h"
 #include "hfi.h"
 
 #define VIDC_CLKS_NUM_MAX		4
@@ -136,6 +137,7 @@ struct venus_caps {
  * @priv:	a private filed for HFI operations
  * @ops:		the core HFI operations
  * @work:	a delayed work for handling system fatal error
+ * @root:	debugfs root directory
  */
 struct venus_core {
 	void __iomem *base;
@@ -185,6 +187,7 @@ struct venus_core {
 	unsigned int codecs_count;
 	unsigned int core0_usage_count;
 	unsigned int core1_usage_count;
+	struct dentry *root;
 };
 
 struct vdec_controls {
diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
new file mode 100644
index 000000000000..a2465fe8e20b
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Linaro Ltd.
+ */
+
+#include <linux/debugfs.h>
+
+#include "core.h"
+
+extern int venus_fw_debug;
+
+int venus_dbgfs_init(struct venus_core *core)
+{
+	core->root = debugfs_create_dir("venus", NULL);
+	if (IS_ERR(core->root))
+		return IS_ERR(core->root);
+
+	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
+
+	return 0;
+}
+
+void venus_dbgfs_deinit(struct venus_core *core)
+{
+	debugfs_remove_recursive(core->root);
+}
diff --git a/drivers/media/platform/qcom/venus/dbgfs.h b/drivers/media/platform/qcom/venus/dbgfs.h
new file mode 100644
index 000000000000..4e35bd7db15f
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/dbgfs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2020 Linaro Ltd. */
+
+#ifndef __VENUS_DBGFS_H__
+#define __VENUS_DBGFS_H__
+
+struct venus_core;
+
+int venus_dbgfs_init(struct venus_core *core);
+void venus_dbgfs_deinit(struct venus_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 0d8855014ab3..3a04b08ab85a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -130,7 +130,7 @@ struct venus_hfi_device {
 };
 
 static bool venus_pkt_debug;
-static int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
+int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
 static bool venus_sys_idle_indicator;
 static bool venus_fw_low_power_mode = true;
 static int venus_hw_rsp_timeout = 1000;
@@ -1130,9 +1130,14 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
 			      u32 codec)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(inst->core);
+	struct device *dev = hdev->core->dev;
 	struct hfi_session_init_pkt pkt;
 	int ret;
 
+	ret = venus_sys_set_debug(hdev, venus_fw_debug);
+	if (ret)
+		dev_warn(dev, "setting fw debug msg ON failed (%d)\n", ret);
+
 	ret = pkt_session_init(&pkt, inst, session_type, codec);
 	if (ret)
 		goto err;
-- 
2.17.1

