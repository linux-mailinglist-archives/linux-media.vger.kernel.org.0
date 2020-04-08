Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E76C21A2AF6
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgDHVVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:21:02 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37285 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHVVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:21:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so9273673ljd.4
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UjZ1E1u4IU1zXB433uHPAQFXm4hXjEM2/qhOvvkVBR4=;
        b=R8M9bAKAkwt9DVqI+inFBXt/hn393ug496cTZTrhmTJ7VuMiQjc7ySSki5X+z3XcLi
         9wlN2N8bUUIT/wt1e6yWPJ9HOQBgi0zRlph8HY+8Vjy2fTqdHxNjBrJNymWPB4tK8zMG
         YRPWqreWE7G/5Ls9d4axekBI/v+6NPUtKsgdq3goq6NYge+EHBHRuhqv4VDDQElzuQHA
         P0DDV4gJiPYliv1zop2r5dKSZxm2tonLhjfM40zFgYyHLPAaMgaYys2EzSk3DAYtK1pS
         HB/5cPxXe1bfxvAkNAutnnGwQb9s4NIbKvY/Cnyo7r2nta/9VFOFyrUWrZoSuoN+5PJ8
         lTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UjZ1E1u4IU1zXB433uHPAQFXm4hXjEM2/qhOvvkVBR4=;
        b=ep60C2yIs/cEXsRvwJoGe3fA2i4JFcKpHeLCSAbIRO4itE4KPPKu1x1GzXkEZC8ohh
         HU9bGVc4QQPHFvEge55QuM3GXQKxLPLhR2UJBK9fDxlX/dgVtwZiP+Fp2qYxeXQ9a1KM
         DjQYaEiKFhuMu2jckvTLpVSKpngdUhehcSQrp5mBAUWMiXcEuExonofZqkQPhLuAsrAt
         JPKjkXIQW4Bxv/8kyyeBx273MOQT7p+2Ch+jW8A3Kljx/bj2q9iptnf2xRIhQ38Wi43H
         0p76WnTf1bRDjWvu0W2nK7bBq1tr0vZDdBaXzYU+v308gmhujIoAL2kd5CWXkqmkt0nF
         nMQQ==
X-Gm-Message-State: AGi0PuYnt4qER/X/6lUMnKVL9vDkKHm/XyQ6TZCpoQDI13iW/SX8XwFZ
        nAcvMpA+qVGjLYsXsoGgaAURvU2CYjU=
X-Google-Smtp-Source: APiQypIQj1uUzgBrmfHHkBiJF2RMHhDJKfRxjIt8upRwUNd0MPIXl2SJqWchbuX7B0M/oO07z6BUNw==
X-Received: by 2002:a05:651c:102f:: with SMTP id w15mr1017010ljm.5.1586380860066;
        Wed, 08 Apr 2020 14:21:00 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id b28sm17395301ljp.90.2020.04.08.14.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:20:59 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/2] venus: Add debugfs interface to set firmware log level
Date:   Thu,  9 Apr 2020 00:20:23 +0300
Message-Id: <20200408212024.23377-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408212024.23377-1-stanimir.varbanov@linaro.org>
References: <20200408212024.23377-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be useful when debugging specific issues related
to firmware HFI interface.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |  2 +-
 drivers/media/platform/qcom/venus/core.c      |  5 ++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/dbgfs.c     | 27 +++++++++++++++++++
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
index 194b10b98767..1cff6655bcb7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -242,6 +242,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = venus_dbgfs_init(core);
+	if (ret)
+		return ret;
+
 	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
 	if (ret)
 		return ret;
@@ -337,6 +341,7 @@ static int venus_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	venus_dbgfs_deinit(core);
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index bd3ac6a4501f..1980211659f3 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -13,6 +13,7 @@
 #include <media/v4l2-device.h>
 
 #include "hfi.h"
+#include "dbgfs.h"
 
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
@@ -183,6 +184,7 @@ struct venus_core {
 	unsigned int codecs_count;
 	unsigned int core0_usage_count;
 	unsigned int core1_usage_count;
+	struct dentry *root;
 };
 
 struct vdec_controls {
diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
new file mode 100644
index 000000000000..2b07a8819125
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -0,0 +1,27 @@
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
+	debugfs_create_x32("fw_level", S_IRUGO | S_IWUSR, core->root,
+			   &venus_fw_debug);
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

