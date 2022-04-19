Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1CC5065CB
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 09:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349331AbiDSH2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 03:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241448AbiDSH2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 03:28:42 -0400
Received: from mo-csw.securemx.jp (mo-csw1114.securemx.jp [210.130.202.156])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E15DEBA;
        Tue, 19 Apr 2022 00:25:59 -0700 (PDT)
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 23J7PbOR006305; Tue, 19 Apr 2022 16:25:38 +0900
X-Iguazu-Qid: 2wHHDhtSAIJBWfaaBU
X-Iguazu-QSIG: v=2; s=0; t=1650353137; q=2wHHDhtSAIJBWfaaBU; m=OFwMfOYRcKo5PNPvIzkxm83h1KkArTfngCqo8Q8G3YE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1112) id 23J7PaPb002532
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 19 Apr 2022 16:25:36 +0900
X-SA-MID: 36308329
From:   Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, yuji2.ishikawa@toshiba.co.jp
Subject: [PATCH 2/4] soc: visconti: Add Toshiba Visconti image processing accelerator common source
Date:   Tue, 19 Apr 2022 16:20:16 +0900
X-TSB-HOP2: ON
Message-Id: <20220419072018.30057-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220419072018.30057-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220419072018.30057-1-yuji2.ishikawa@toshiba.co.jp>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds common operations for image processing accelerator drivers
including dma-buf control and ioctl definitiion

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/soc/Kconfig               |  1 +
 drivers/soc/Makefile              |  1 +
 drivers/soc/visconti/Kconfig      |  1 +
 drivers/soc/visconti/Makefile     |  6 +++
 drivers/soc/visconti/ipa_common.c | 55 +++++++++++++++++++
 drivers/soc/visconti/ipa_common.h | 19 +++++++
 drivers/soc/visconti/uapi/ipa.h   | 87 +++++++++++++++++++++++++++++++
 7 files changed, 170 insertions(+)
 create mode 100644 drivers/soc/visconti/Kconfig
 create mode 100644 drivers/soc/visconti/Makefile
 create mode 100644 drivers/soc/visconti/ipa_common.c
 create mode 100644 drivers/soc/visconti/ipa_common.h
 create mode 100644 drivers/soc/visconti/uapi/ipa.h

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index e8a30c4c5..c99139aa8 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -22,6 +22,7 @@ source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
 source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
+source "drivers/soc/visconti/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index a05e9fbcd..455b993c2 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -28,4 +28,5 @@ obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
+obj-$(CONFIG_ARCH_VISCONTI)	+= visconti/
 obj-y				+= xilinx/
diff --git a/drivers/soc/visconti/Kconfig b/drivers/soc/visconti/Kconfig
new file mode 100644
index 000000000..8b1378917
--- /dev/null
+++ b/drivers/soc/visconti/Kconfig
@@ -0,0 +1 @@
+
diff --git a/drivers/soc/visconti/Makefile b/drivers/soc/visconti/Makefile
new file mode 100644
index 000000000..8d710da08
--- /dev/null
+++ b/drivers/soc/visconti/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti specific device drivers.
+#
+
+obj-y += ipa_common.o
diff --git a/drivers/soc/visconti/ipa_common.c b/drivers/soc/visconti/ipa_common.c
new file mode 100644
index 000000000..6345f33c5
--- /dev/null
+++ b/drivers/soc/visconti/ipa_common.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti Image Processing Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include "ipa_common.h"
+
+int ipa_attach_dmabuf(struct device *dev, int fd, struct dma_buf_attachment **a,
+		      struct sg_table **s, dma_addr_t *addr, enum dma_data_direction dma_dir)
+{
+	struct dma_buf_attachment *attachment;
+	struct dma_buf *dmabuf;
+	struct sg_table *sgt;
+	int ret;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf)) {
+		dev_err(dev, "Invalid dmabuf FD\n");
+		return PTR_ERR(dmabuf);
+	}
+	attachment = dma_buf_attach(dmabuf, dev);
+
+	if (IS_ERR(attachment)) {
+		dev_err(dev, "Failed to attach dmabuf\n");
+		ret = PTR_ERR(attachment);
+		goto err_put;
+	}
+	sgt = dma_buf_map_attachment(attachment, dma_dir);
+	if (IS_ERR(sgt)) {
+		dev_err(dev, "Failed to get dmabufs sg_table\n");
+		ret = PTR_ERR(sgt);
+		goto err_detach;
+	}
+	if (sgt->nents != 1) {
+		dev_err(dev, "Sparse DMA region is unsupported\n");
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	*addr = sg_dma_address(sgt->sgl);
+	*a = attachment;
+	*s = sgt;
+
+	return 0;
+
+err_unmap:
+	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
+err_detach:
+	dma_buf_detach(dmabuf, attachment);
+err_put:
+	dma_buf_put(dmabuf);
+	return ret;
+}
diff --git a/drivers/soc/visconti/ipa_common.h b/drivers/soc/visconti/ipa_common.h
new file mode 100644
index 000000000..2c3b64837
--- /dev/null
+++ b/drivers/soc/visconti/ipa_common.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti Image Processing Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/dma-buf.h>
+
+#define COHERENT_ADDRESS_BIT   (0x400000000ULL)
+#define IPA_POLL_EVENT_NONE    (0)
+#define IPA_POLL_EVENT_DONE    (1)
+#define IPA_POLL_EVENT_ERROR   (2)
+#define IPA_WAKEUP_RETRY_DELAY (300 * 1000) /*usec*/
+
+extern int ipa_attach_dmabuf(struct device *dev, int fd, struct dma_buf_attachment **a,
+			     struct sg_table **s, dma_addr_t *addr,
+			     enum dma_data_direction dma_dir);
diff --git a/drivers/soc/visconti/uapi/ipa.h b/drivers/soc/visconti/uapi/ipa.h
new file mode 100644
index 000000000..f3a066648
--- /dev/null
+++ b/drivers/soc/visconti/uapi/ipa.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * (C) Copyright 2020 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_IPA_H
+#define _UAPI_LINUX_IPA_H
+
+/**
+ * enum drv_ipa_state - state of Visconti IPA driver
+ *
+ * @DRV_IPA_STATE_IDLE:     driver is idle
+ * @DRV_IPA_STATE_BUSY:     device is busy
+ */
+enum drv_ipa_state { DRV_IPA_STATE_IDLE = 0, DRV_IPA_STATE_BUSY };
+
+/**
+ * enum drv_ipa_buffer_direction - usage of buffer
+ *
+ * @DRV_IPA_DIR_BIDIRECTION: cpu writes/reads data
+ * @DRV_IPA_DIR_TO_DEVICE:   cpu writes data
+ * @DRV_IPA_DIR_FROM_DEVICE: cpu reads data
+ * @DRV_IPA_DIR_NONE:        cpu not access or non-coherent
+ */
+enum drv_ipa_buffer_direction {
+	DRV_IPA_DIR_BIDIRECTION = 0,
+	DRV_IPA_DIR_TO_DEVICE,
+	DRV_IPA_DIR_FROM_DEVICE,
+	DRV_IPA_DIR_NONE
+};
+
+/**
+ * struct drv_ipa_buffer_info - buffer information for Visconti IPA drivers
+ *
+ * @fd:        file descriptor of Ion allocated heap
+ * @coherent:  allocated via coherent bus or not
+ * @direction: buffer direction (to/from device)
+ *
+ * note: When the Ion heap is allocated wit ION_FLAG_CACHED,
+ * &struct drv_ipa_buffer_info.coherent should be true.
+ * Else, it should be false.
+ */
+struct drv_ipa_buffer_info {
+	uint32_t fd;
+	bool coherent;
+	enum drv_ipa_buffer_direction direction;
+};
+
+/**
+ * struct drv_ipa_addr - address structure for Visconti IPA drivers
+ *
+ * @buffer_index: array index of &struct drv_ipa_buffer_info
+ * @offset:       offset from the top of Ion heap
+ */
+struct drv_ipa_addr {
+	uint32_t buffer_index : 4;
+	uint32_t offset : 28;
+};
+
+#define IPA_BUFFER_INDEX_MAX (16)
+#define IPA_INVALID_ADDR                                                       \
+	{                                                                      \
+		.buffer_index = 0xfu, .offset = 0xfffffffu                     \
+	}
+
+static inline struct drv_ipa_addr drv_ipa_invalid_addr(void)
+{
+	struct drv_ipa_addr invalid_addr = IPA_INVALID_ADDR;
+	return invalid_addr;
+}
+
+static inline bool drv_ipa_is_invalid_addr(struct drv_ipa_addr addr)
+{
+	struct drv_ipa_addr invalid_addr = IPA_INVALID_ADDR;
+
+	if ((addr.buffer_index == invalid_addr.buffer_index) &&
+	    (addr.offset == invalid_addr.offset)) {
+		return true;
+	}
+	return false;
+}
+
+#define IOC_IPA_MAGIC	   'I'
+#define IOC_IPA_START	   _IO(IOC_IPA_MAGIC, 0)
+#define IOC_IPA_GET_STATUS _IO(IOC_IPA_MAGIC, 1)
+
+#endif /* _UAPI_LINUX_IPA_H */
-- 
2.17.1


