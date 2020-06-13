Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318951F85B9
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 00:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgFMWjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 18:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbgFMWjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 18:39:39 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E80C03E96F
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:39:38 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id k11so13588872ejr.9
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y/kPc47OoadaJ4JaJgZRCf1efGLXg0vrEdfBGdX8oHk=;
        b=sP8VBnE6KL+vhlTDJWA7+nPHE4LQR+hYhn8Y/TdIdVC+maPvO/3HdBMjC7m9jXKQDU
         Ul59n7bk84bFkLoyddJG0tJhfsw1a0bSrZlXv1vrs02JODpBx1phWQYwHaRYljHuajNB
         0ua3F9OD8uYlDJmlqKy/yaIFVEshCOTNsMH6k57xe48nNnSueEmy2wJfAtcdExaS/eEM
         L/c0srRxJ/z8TpgBLsz8z3FDB+9OZdqkY+uWiFT3Y0lJy3MgyTvt4LEDIr583iReJJMn
         T9oiApxmGqbYzKMz7rWciHWmlkd1C0WiySnMFq4tErSjBpmrnVs13ZpR+mxhj0gVptfi
         RByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y/kPc47OoadaJ4JaJgZRCf1efGLXg0vrEdfBGdX8oHk=;
        b=faanbAYIrX+M2iW0XR6RrRfVQj+n7ddbUCJz1oapg1k1qhFNbHLvngAEyGw4OHROK3
         m0PJZe4SBL2pDonvPiJk3E3W/sdwkFq0JaauGlrfK+iO3xVq2/UINM1TONrCqfj5xM6s
         paGAk9MJ2PLnbYos0ZGrk050EwVlYxC9wM06o37yPyJxcjctjIGcFnVpyfV80OSREE8w
         NFsOTO+k1lnS6jIxw5biHv1SzQiLQHV48IWsCKsSGuvBDCniCSnmx4g3W8Id1GT/dSGy
         N+sWKkn6XYTMOV97EbsY45xE+JE8ybsyYgUSPV+A84d3slFNZxeFzM7hy/a9cnRQaEUJ
         KGUQ==
X-Gm-Message-State: AOAM532Y13o4Svl6sbfeljG7AvA33cbxy3xW56oEFPQCYSRNbeasTYZB
        KT33pKwb3f4lEpVbZBP2y81x7g==
X-Google-Smtp-Source: ABdhPJyCr1Orygj9YAJ2zr/tjDnCQmXxhuRBfH/CnpNT0fz+M+NLgXX0nOzwt8fJ+/p4Nvad1/xlGw==
X-Received: by 2002:a17:906:63c9:: with SMTP id u9mr19829717ejk.439.1592087976806;
        Sat, 13 Jun 2020 15:39:36 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id u3sm5581606edx.25.2020.06.13.15.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:39:36 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 1/3] venus: Add debugfs interface to set firmware log level
Date:   Sun, 14 Jun 2020 01:39:17 +0300
Message-Id: <20200613223919.7038-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be useful when debugging specific issues related to
firmware HFI interface.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |  2 +-
 drivers/media/platform/qcom/venus/core.c      |  3 +++
 drivers/media/platform/qcom/venus/core.h      |  3 +++
 drivers/media/platform/qcom/venus/dbgfs.c     | 21 +++++++++++++++++++
 drivers/media/platform/qcom/venus/dbgfs.h     | 12 +++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c |  7 ++++++-
 6 files changed, 46 insertions(+), 2 deletions(-)
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
index 203c6538044f..249141e27fea 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -290,6 +290,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dev_unregister;
 
+	venus_dbgfs_init(core);
+
 	return 0;
 
 err_dev_unregister:
@@ -337,6 +339,7 @@ static int venus_remove(struct platform_device *pdev)
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
index 000000000000..782d54ac1b8f
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -0,0 +1,21 @@
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
+void venus_dbgfs_init(struct venus_core *core)
+{
+	core->root = debugfs_create_dir("venus", NULL);
+	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
+}
+
+void venus_dbgfs_deinit(struct venus_core *core)
+{
+	debugfs_remove_recursive(core->root);
+}
diff --git a/drivers/media/platform/qcom/venus/dbgfs.h b/drivers/media/platform/qcom/venus/dbgfs.h
new file mode 100644
index 000000000000..b7b621a8472f
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
+void venus_dbgfs_init(struct venus_core *core);
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

