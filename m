Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211F5232FE3
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 11:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729200AbgG3Jyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 05:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgG3Jyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 05:54:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EB4C0619D2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 02:54:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q76so4407554wme.4
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yCtoTmQBVaA8gm6t22/gL7cKLjCk2p79iKqAR6+EKu4=;
        b=a6IA+HktRFMnS647jLsgICsCzXuX5wzRyWIUj+jWA9npia1VbLV/V41MGtbXsfLfdt
         SjIz2R1GBGuPBojbfEQ2u0ZtmNBxo4Lm8YVU5/4JewLngMqfHQojf/65WZriYt93qQkC
         Mf9Q3OZS0H2N1lat19Rhno6hQQTxs5RBYAGxXbRezj4phfD/f4C8OmPyzei/kJEd/qcI
         CfMNAkeSuyjnBRL5TxpVq7A1g/2T1E2ap2w5RCCB1Tvp0Xg9aGhvI+cgkVsKfFgekka1
         1gG6SnVMsI1XChee4WJ6smY8aQr13H78sxSiELGnKo+4RGG+qt6OO40878oGeI+EFElE
         gc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yCtoTmQBVaA8gm6t22/gL7cKLjCk2p79iKqAR6+EKu4=;
        b=fwP/BgJITPChIsCfCNWuqlkoHjcBYyv4fodjxc6J2DtbthbVCQFNjNYWJ2Pzt/WiK9
         uH4DtWQn7+4gcPeGAb+tVIoffvyiDz5N4GHsU1hHDVsuRrCmH+y9zmHpU5CxKX2PAcqp
         Fp0e3Ih524v2NNlhprGG5d5J7xypdBbkBHv44LTOgb0m+ZFJs/7O21x/xJx+d8bf6QNT
         dI60pM1f3nrOQv+DJXQ+fVkdpSf5NH5RjBPQYov6rFRHs2QkbNgSHE0Zoxiy9c9wFsPA
         yWYHYGgO9t/O4xilaBSX2xn1tDuLabIFaH9IE0HP3GokqUxorcxp5qLwUJV7jLDoQM0R
         Mc0A==
X-Gm-Message-State: AOAM5322aiDnbUxgEF80cC2Npc6nyvEP7oBvxwe5s2gX/lNvokeAT3kz
        5+erJp03OnCTKI3mjvZjxTiUUg==
X-Google-Smtp-Source: ABdhPJxPeQEXMSvrDKRSsrWWPXxj78OyJ7LLv2CDGWEdI/MzoRcAd4rUzFrUjXciE+3y+aqqUgCpTg==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr12029262wmo.62.1596102869374;
        Thu, 30 Jul 2020 02:54:29 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id u1sm10623139wrb.78.2020.07.30.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 02:54:28 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 1/3] venus: Add debugfs interface to set firmware log level
Date:   Thu, 30 Jul 2020 12:53:48 +0300
Message-Id: <20200730095350.13925-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
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
 drivers/media/platform/qcom/venus/hfi_venus.c |  6 +++++-
 6 files changed, 45 insertions(+), 2 deletions(-)
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
index 0d8855014ab3..450c4800c12e 100644
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
@@ -1133,6 +1133,10 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
 	struct hfi_session_init_pkt pkt;
 	int ret;
 
+	ret = venus_sys_set_debug(hdev, venus_fw_debug);
+	if (ret)
+		goto err;
+
 	ret = pkt_session_init(&pkt, inst, session_type, codec);
 	if (ret)
 		goto err;
-- 
2.17.1

