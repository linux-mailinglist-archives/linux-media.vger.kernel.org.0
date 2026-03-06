Return-Path: <linux-media+bounces-54778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLSyC3TYqmnmXgEAu9opvQ
	(envelope-from <linux-media+bounces-54778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:36:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE08221CEA
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89AB331F3AA0
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9AC3A785F;
	Fri,  6 Mar 2026 13:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B23A5E6B;
	Fri,  6 Mar 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803696; cv=none; b=QdIUB+O7v+3AczHGG3q9wb2grLNi1e4t44Hz0cSvLDu1tCJSfDA7vWIf6/Fx+bfoDHw8lFQepImyGD6Ob2YpIJu8CcZPWsoehGy6rDTIzOVSUBTaRQA4k6emGjLJ/82JWOqN4ZOyJcJLmuA5hXdhsQtLRjUdGNkDk/2uN7pKKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803696; c=relaxed/simple;
	bh=/Zraufg1At4qbueRA9KFO9W8YSZXvAt+GPdRM64wryk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+TyphXe6maDyQuaPNxnTQvJTbkomrRoNNfveEaPQzNlHf9LpH3E4Bb8EuWPPmwAiIeS6ZOblsYsTFZw4VjlrwG9cIe5O1WyLzN0gouPptlGVbocdd2jRc58THVz5tE1NqhpSM9FuFO2SA47jahkj00CZLjDiPMerGY4/jFoaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D62671A0117;
	Fri,  6 Mar 2026 14:28:12 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF8161A0119;
	Fri,  6 Mar 2026 14:28:12 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5202220270;
	Fri,  6 Mar 2026 14:28:11 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:25 +0200
Subject: [PATCH v2 8/9] accel/neutron: Add logging support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-8-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=7700;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=/Zraufg1At4qbueRA9KFO9W8YSZXvAt+GPdRM64wryk=;
 b=LfLeB3kY3rylkvTDzuiLNd2vx7uZdv2NUys2ihwXSB7GbCklq4bZqb0UWat9EI0jjQfZAZ/cE
 QMaYbKcEEkUBd6/ikUQxHQLFMu+9pkUQttz+2b2+qhqj1jMRVe8Ae9Q
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: 7FE08221CEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54778-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.502];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Expose the Neutron firmware log via debugfs interface. The log resides
in internal device memory.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/accel/neutron/Makefile          |  2 +
 drivers/accel/neutron/neutron_debugfs.c | 34 ++++++++++++++++
 drivers/accel/neutron/neutron_debugfs.h | 15 +++++++
 drivers/accel/neutron/neutron_device.c  | 69 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_device.h  | 17 ++++++++
 drivers/accel/neutron/neutron_driver.c  |  3 ++
 6 files changed, 140 insertions(+)

diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
index ac6dd576521c..6d5c204460af 100644
--- a/drivers/accel/neutron/Makefile
+++ b/drivers/accel/neutron/Makefile
@@ -8,3 +8,5 @@ neutron-y := \
 	neutron_gem.o \
 	neutron_job.o \
 	neutron_mailbox.o
+
+neutron-$(CONFIG_DEBUG_FS) += neutron_debugfs.o
diff --git a/drivers/accel/neutron/neutron_debugfs.c b/drivers/accel/neutron/neutron_debugfs.c
new file mode 100644
index 000000000000..a392286e40b7
--- /dev/null
+++ b/drivers/accel/neutron/neutron_debugfs.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025 NXP */
+
+#include <linux/debugfs.h>
+
+#include "neutron_device.h"
+#include "neutron_debugfs.h"
+
+static ssize_t fw_log_read(struct file *f, char __user *buf, size_t count, loff_t *pos)
+{
+	struct neutron_device *ndev = file_inode(f)->i_private;
+
+	if (!ndev->log.size)
+		return 0;
+
+	if (ndev->flags & NEUTRON_BOOTED)
+		neutron_read_log(ndev, count);
+
+	return simple_read_from_buffer(buf, count, pos, ndev->log.buf,
+				       ndev->log.buf_count);
+}
+
+static const struct file_operations fw_log_fops = {
+	.owner = THIS_MODULE,
+	.read = fw_log_read,
+};
+
+void neutron_debugfs_init(struct neutron_device *ndev)
+{
+	struct dentry *debugfs_root;
+
+	debugfs_root = ndev->base.debugfs_root;
+	debugfs_create_file("fw_log", 0444, debugfs_root, ndev, &fw_log_fops);
+}
diff --git a/drivers/accel/neutron/neutron_debugfs.h b/drivers/accel/neutron/neutron_debugfs.h
new file mode 100644
index 000000000000..7cd4b5af55a6
--- /dev/null
+++ b/drivers/accel/neutron/neutron_debugfs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025 NXP */
+
+#ifndef __NEUTRON_DEBUGFS_H__
+#define __NEUTRON_DEBUGFS_H__
+
+struct neutron_device;
+
+#if defined(CONFIG_DEBUG_FS)
+void neutron_debugfs_init(struct neutron_device *ndev);
+#else
+static inline void neutron_debugfs_init(struct neutron_device *ndev) {}
+#endif
+
+#endif /* __NEUTRON_DEBUGFS_H__ */
diff --git a/drivers/accel/neutron/neutron_device.c b/drivers/accel/neutron/neutron_device.c
index 571ec906ad72..a5cedc91ad25 100644
--- a/drivers/accel/neutron/neutron_device.c
+++ b/drivers/accel/neutron/neutron_device.c
@@ -77,6 +77,70 @@ static void neutron_stop(struct neutron_device *ndev)
 			   100, 100 * USEC_PER_MSEC);
 }
 
+static void neutron_init_logging(struct neutron_device *ndev)
+{
+	size_t old_size = ndev->log.size;
+	u32 ringctrl;
+
+	ringctrl = readl_relaxed(NEUTRON_REG(ndev, RINGCTRL));
+
+	ndev->log.base = ndev->mem_regions[NEUTRON_MEM_DTCM].va +
+			 NEUTRON_DTCM_BANK1_OFFSET +
+			 FIELD_GET(RINGCTRL_ADDR_MASK, ringctrl);
+	ndev->log.size = FIELD_GET(RINGCTRL_SIZE_MASK, ringctrl) *
+			 RINGCTRL_SIZE_MULT;
+
+	if (ndev->log.size == 0) {
+		dev_info(ndev->dev, "Firmware logging is disabled\n");
+		return;
+	}
+
+	/* If size didn't change, keep using the old buffer */
+	if (old_size == ndev->log.size)
+		return;
+
+	devm_kfree(ndev->dev, ndev->log.buf);
+	ndev->log.buf = devm_kmalloc(ndev->dev, ndev->log.size, GFP_KERNEL);
+	if (!ndev->log.buf) {
+		ndev->log.size = 0;
+		dev_warn(ndev->dev, "Failed to allocate log buffer, logging is disabled\n");
+	}
+}
+
+/* Read up to count bytes from device log into local buffer */
+void neutron_read_log(struct neutron_device *ndev, size_t count)
+{
+	size_t bytes, remaining;
+	u32 head, tail;
+
+	ndev->log.buf_count = 0;
+
+	if (!(ndev->flags & NEUTRON_BOOTED) || !ndev->log.size)
+		return;
+
+	tail = readl_relaxed(NEUTRON_REG(ndev, TAIL));
+	head = readl_relaxed(NEUTRON_REG(ndev, HEAD));
+
+	if (tail == head)
+		return;
+
+	/* Read from head to end of buffer or tail */
+	bytes = (head < tail) ? (tail - head) : (ndev->log.size - head);
+	bytes = min(count, bytes);
+	memcpy_fromio(ndev->log.buf, ndev->log.base + head, bytes);
+	ndev->log.buf_count = bytes;
+
+	/* Read from start of buffer, if it wraps around */
+	if (head > tail && bytes < count) {
+		remaining = min(count - bytes, tail);
+		memcpy_fromio(ndev->log.buf + bytes, ndev->log.base, remaining);
+		ndev->log.buf_count += remaining;
+	}
+
+	head = (head + ndev->log.buf_count) % ndev->log.size;
+	writel_relaxed(head, NEUTRON_REG(ndev, HEAD));
+}
+
 static void __iomem *neutron_tcm_da_to_va(struct neutron_device *ndev, u64 da)
 {
 	struct neutron_mem_region *mem;
@@ -158,6 +222,8 @@ int neutron_boot(struct neutron_device *ndev)
 	/* Prepare device to receive jobs */
 	neutron_mbox_reset_state(ndev);
 
+	neutron_init_logging(ndev);
+
 	ndev->flags |= NEUTRON_BOOTED;
 
 	return 0;
@@ -165,6 +231,9 @@ int neutron_boot(struct neutron_device *ndev)
 
 void neutron_shutdown(struct neutron_device *ndev)
 {
+	/* Device log becomes unavailable after shutdown, save it */
+	neutron_read_log(ndev, ndev->log.size);
+
 	neutron_stop(ndev);
 	ndev->flags &= ~NEUTRON_BOOTED;
 }
diff --git a/drivers/accel/neutron/neutron_device.h b/drivers/accel/neutron/neutron_device.h
index 1953cdf19bfd..bbca0da9f9bc 100644
--- a/drivers/accel/neutron/neutron_device.h
+++ b/drivers/accel/neutron/neutron_device.h
@@ -85,11 +85,26 @@ enum neutron_mem_id {
 	NEUTRON_MEM_MAX
 };
 
+/**
+ * struct neutron_log - Neutron log buffer descriptor
+ * @base: base address of the log buffer in device memory
+ * @size: Size of the log buffer
+ * @buf: Kernel buffer for log data
+ * @buf_count: Number of bytes available in the kernel buffer
+ */
+struct neutron_log {
+	void __iomem *base;
+	size_t size;
+	void *buf;
+	size_t buf_count;
+};
+
 /**
  * struct neutron_device - Neutron device structure
  * @base: Base DRM device
  * @dev: Pointer to underlying device
  * @mem_regions: Array of memory region descriptors
+ * @log: Log buffer descriptor
  * @irq: IRQ number
  * @clks: Neutron clocks
  * @num_clks: Number of clocks
@@ -106,6 +121,7 @@ struct neutron_device {
 	struct device *dev;
 
 	struct neutron_mem_region mem_regions[NEUTRON_MEM_MAX];
+	struct neutron_log log;
 
 	int irq;
 	struct clk_bulk_data *clks;
@@ -134,5 +150,6 @@ void neutron_shutdown(struct neutron_device *ndev);
 void neutron_enable_irq(struct neutron_device *ndev);
 void neutron_disable_irq(struct neutron_device *ndev);
 void neutron_handle_irq(struct neutron_device *ndev);
+void neutron_read_log(struct neutron_device *ndev, size_t bytes);
 
 #endif /* __NEUTRON_DEVICE_H__ */
diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
index ceae1f7e8359..14b4bc3a79d1 100644
--- a/drivers/accel/neutron/neutron_driver.c
+++ b/drivers/accel/neutron/neutron_driver.c
@@ -18,6 +18,7 @@
 
 #include "neutron_device.h"
 #include "neutron_driver.h"
+#include "neutron_debugfs.h"
 #include "neutron_gem.h"
 #include "neutron_job.h"
 
@@ -168,6 +169,8 @@ static int neutron_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_reserved;
 
+	neutron_debugfs_init(ndev);
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto free_job;

-- 
2.34.1


