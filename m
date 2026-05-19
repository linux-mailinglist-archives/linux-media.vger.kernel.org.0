Return-Path: <linux-media+bounces-62083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHsOCbcADGpcTQUAu9opvQ
	(envelope-from <linux-media+bounces-62083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:18:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1A577E46
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 554BD3071C11
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8784A39A06E;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNSYL8iS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F337FF40;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171355; cv=none; b=HdgwltWq5Dxg7+lhkOKqNnC0DmLJusARQxKAX2GLI9Mmy6Dd8FHoApNe1oQ8WB2o2bGWdPnD0m8H8ZVUUWz81YhXcCcgxNtHuvQYW5n1sSkewRhLT5/ytLKX6q1//5vsWeyxUE23MGnMj9Rw3Xra4VPv7fA6tKM5stA03iS2n/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171355; c=relaxed/simple;
	bh=TS9Zx94HUE7toyHkXp6okRZvrYsKEOqiWiOe5T4qfiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbUDVP/fnYtZbwR9wbPjLysCU3iXFOJGhmOZvVHYHwg8O7x7+XbG+BJJ7GpdjYyV6BGrtLi9xlf86BeK5mK/AIJLrG3aQixjQ+ND5fy2C9YPx8n4tg5Fz1mjoUzX79oGW+506kCditF3F8XccvESffYmhNacVU+M1Im8p+X2WDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNSYL8iS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 655DAC2BCFB;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171355;
	bh=TS9Zx94HUE7toyHkXp6okRZvrYsKEOqiWiOe5T4qfiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mNSYL8iSHlJfLzTGP14TTq+1een9RAwtVG6sjjxCg9ol4Q4vb/w6Sfc5jV3OEIQ9j
	 tD6ZTs6z95IFT7SwxY6blqslo9HZuV1DYQZtg9kt55AIeP5bi5fBze/teUS/ChTDdS
	 96FX9LQtDRjNPpaT+H6ful9FGFJoVr8a7RRE8hCC7ClEYpsI+DNtgShUaoUH+gEXV+
	 uH/PlGgbMBxRm5orOpVuycPbAufMfWGEb2rUZouTtQZLppljiikrEKZCO+EDIdtWLS
	 FV+KLwKJq4UUboNzfe5IxafXpr15WcmaQVKiO9+0kWJyImH2oDUFf7nAno4FE4TOu5
	 O8ZblAHXd+Xzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C282CD4F54;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:45:53 +0530
Subject: [PATCH 03/15] accel/qda: Add initial QDA DRM accelerator driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qda-series-v1-3-b2d984c297f8@oss.qualcomm.com>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
In-Reply-To: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=11746;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Xz5iWY7BeXgDD47yqqDoSnINiMtsSocL1wFqa3U3gXo=;
 b=evSgHotAPQ+Tnx97m7CWpFAnRyCTDDEkJq/R711YGhmkvQTb2zNhmSoeBqy0t7x2GKJVHQccr
 LtTu4OZ8S7uBGJyT309lqz7+7mwwq2mDpiPndEyGCUjAmE6phKzM0+6
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62083-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: 93C1A577E46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Add the foundational driver files for the Qualcomm DSP Accelerator
(QDA), a DRM accel driver for Qualcomm DSPs. The driver integrates
with the DRM accel subsystem (drivers/accel/) and provides:

  - A standard /dev/accel/accel* character device node via DRM.
  - GEM-based buffer management with DMA-BUF import/export (PRIME).
  - IOMMU context bank management for per-session memory isolation.
  - Standard DRM IOCTLs for device management and job submission.

qda_drv.c / qda_drv.h: Core DRM driver registration. Defines the
drm_driver ops table, per-file private state (qda_file_priv), and the
main device structure (qda_dev) which embeds drm_device.

qda_rpmsg.c / qda_rpmsg.h: RPMsg transport layer. Registers an
rpmsg_driver matching the "qcom,fastrpc" compatible string. On probe
it allocates a qda_dev, reads the DSP domain name from the "label" DT
property, and registers the DRM device.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Kconfig         |  1 +
 drivers/accel/Makefile        |  1 +
 drivers/accel/qda/Kconfig     | 30 +++++++++++++
 drivers/accel/qda/Makefile    | 10 +++++
 drivers/accel/qda/qda_drv.c   | 97 ++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_drv.h   | 62 +++++++++++++++++++++++++++
 drivers/accel/qda/qda_rpmsg.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_rpmsg.h | 13 ++++++
 8 files changed, 313 insertions(+)

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..74ac0f71bc9d 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/qda/Kconfig"
 source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..58c08dd5f389 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
new file mode 100644
index 000000000000..484d21ff1b55
--- /dev/null
+++ b/drivers/accel/qda/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm DSP accelerator driver
+#
+
+config DRM_ACCEL_QDA
+	tristate "Qualcomm DSP accelerator"
+	depends on DRM_ACCEL
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
+	help
+	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
+	  This driver provides a standardized interface for offloading computational
+	  tasks to the DSP, including audio processing, sensor offload, computer
+	  vision, and AI inference workloads.
+
+	  The driver supports all DSP domains (ADSP, CDSP, SDSP, GDSP) and
+	  implements the FastRPC protocol for communication between the application
+	  processor and DSP. It integrates with the Linux kernel's Compute
+	  Accelerators subsystem (drivers/accel/) and provides a modern alternative
+	  to the legacy FastRPC driver found in drivers/misc/.
+
+	  Key features include DMA-BUF interoperability for seamless buffer sharing
+	  with other multimedia subsystems, IOMMU-based memory isolation, and
+	  standard DRM IOCTLs for device management and job submission.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qda.
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
new file mode 100644
index 000000000000..dbe809067a8b
--- /dev/null
+++ b/drivers/accel/qda/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm DSP accelerator driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
+
+qda-y := \
+	qda_drv.o \
+	qda_rpmsg.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
new file mode 100644
index 000000000000..1c1bab68d445
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
+
+#include "qda_drv.h"
+#include "qda_rpmsg.h"
+
+static int qda_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_file_priv *qda_file_priv;
+
+	qda_file_priv = kzalloc_obj(*qda_file_priv);
+	if (!qda_file_priv)
+		return -ENOMEM;
+
+	qda_file_priv->qda_dev = qda_dev_from_drm(dev);
+	file->driver_priv = qda_file_priv;
+
+	return 0;
+}
+
+static void qda_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_file_priv *qda_file_priv = file->driver_priv;
+
+	kfree(qda_file_priv);
+	file->driver_priv = NULL;
+}
+
+DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
+
+static const struct drm_driver qda_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.fops = &qda_accel_fops,
+	.open = qda_open,
+	.postclose = qda_postclose,
+	.name = QDA_DRIVER_NAME,
+	.desc = "Qualcomm DSP Accelerator Driver",
+};
+
+struct qda_dev *qda_alloc_device(struct device *dev)
+{
+	struct qda_dev *qdev;
+
+	qdev = devm_drm_dev_alloc(dev, &qda_drm_driver, struct qda_dev, drm_dev);
+	if (IS_ERR(qdev))
+		return ERR_CAST(qdev);
+
+	return qdev;
+}
+
+void qda_unregister_device(struct qda_dev *qdev)
+{
+	drm_dev_unregister(&qdev->drm_dev);
+}
+
+int qda_register_device(struct qda_dev *qdev)
+{
+	int ret;
+
+	ret = drm_dev_register(&qdev->drm_dev, 0);
+	if (ret)
+		drm_err(&qdev->drm_dev, "Failed to register DRM device: %d\n", ret);
+
+	return ret;
+}
+
+static int __init qda_core_init(void)
+{
+	int ret;
+
+	ret = qda_rpmsg_register();
+	if (ret)
+		return ret;
+
+	pr_info("qda: QDA driver initialization complete\n");
+	return 0;
+}
+
+static void __exit qda_core_exit(void)
+{
+	qda_rpmsg_unregister();
+}
+
+module_init(qda_core_init);
+module_exit(qda_core_exit);
+
+MODULE_AUTHOR("Qualcomm AI Infra Team");
+MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
new file mode 100644
index 000000000000..7ba2ef19a411
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_DRV_H__
+#define __QDA_DRV_H__
+
+#include <linux/device.h>
+#include <linux/rpmsg.h>
+#include <linux/types.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+/* Driver identification */
+#define QDA_DRIVER_NAME "qda"
+
+/**
+ * struct qda_file_priv - Per-process private data for DRM file
+ */
+struct qda_file_priv {
+	/** @qda_dev: Back-pointer to device structure */
+	struct qda_dev *qda_dev;
+};
+
+/**
+ * struct qda_dev - Main device structure for QDA driver
+ *
+ * The DRM device is embedded as the first member so that container_of()
+ * can recover the qda_dev from any drm_device pointer.
+ */
+struct qda_dev {
+	/** @drm_dev: Embedded DRM device; recover via qda_dev_from_drm() */
+	struct drm_device drm_dev;
+	/** @rpdev: RPMsg device for communication with the remote processor */
+	struct rpmsg_device *rpdev;
+	/** @dev: Underlying Linux device */
+	struct device *dev;
+	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
+	const char *dsp_name;
+};
+
+/**
+ * qda_dev_from_drm - Recover qda_dev from an embedded drm_device pointer
+ * @dev: Pointer to the embedded drm_device
+ *
+ * Return: Pointer to the enclosing qda_dev.
+ */
+static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
+{
+	return container_of(dev, struct qda_dev, drm_dev);
+}
+
+/* Device allocation (uses devm_drm_dev_alloc internally) */
+struct qda_dev *qda_alloc_device(struct device *dev);
+
+/* Core device lifecycle */
+int qda_register_device(struct qda_dev *qdev);
+void qda_unregister_device(struct qda_dev *qdev);
+
+#endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
new file mode 100644
index 000000000000..6eaf1b145f8a
--- /dev/null
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/rpmsg.h>
+#include <drm/drm_print.h>
+
+#include "qda_drv.h"
+#include "qda_rpmsg.h"
+
+static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev;
+
+	qdev = qda_alloc_device(&rpdev->dev);
+	if (IS_ERR(qdev))
+		return qdev;
+
+	qdev->dev = &rpdev->dev;
+	qdev->rpdev = rpdev;
+	dev_set_drvdata(&rpdev->dev, qdev);
+
+	return qdev;
+}
+
+static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
+			void *priv, u32 src)
+{
+	/* Placeholder: responses will be dispatched here */
+	return 0;
+}
+
+static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
+
+	drm_dev_unplug(&qdev->drm_dev);
+	qdev->rpdev = NULL;
+	qda_unregister_device(qdev);
+	dev_info(qdev->dev, "RPMsg device removed\n");
+}
+
+static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev;
+	const char *label;
+	int ret;
+
+	dev_dbg(&rpdev->dev, "QDA RPMsg probe starting\n");
+
+	qdev = alloc_and_init_qdev(rpdev);
+	if (IS_ERR(qdev))
+		return PTR_ERR(qdev);
+
+	ret = of_property_read_string(rpdev->dev.of_node, "label", &label);
+	if (ret) {
+		dev_err(qdev->dev, "Missing 'label' property in DT node: %d\n", ret);
+		return ret;
+	}
+	qdev->dsp_name = label;
+
+	ret = qda_register_device(qdev);
+	if (ret)
+		return ret;
+
+	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
+	return 0;
+}
+
+static const struct of_device_id qda_rpmsg_id_table[] = {
+	{ .compatible = "qcom,fastrpc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, qda_rpmsg_id_table);
+
+static struct rpmsg_driver qda_rpmsg_driver = {
+	.probe = qda_rpmsg_probe,
+	.remove = qda_rpmsg_remove,
+	.callback = qda_rpmsg_cb,
+	.drv = {
+		.name = "qcom,fastrpc",
+		.of_match_table = qda_rpmsg_id_table,
+	},
+};
+
+int qda_rpmsg_register(void)
+{
+	int ret = register_rpmsg_driver(&qda_rpmsg_driver);
+
+	if (ret)
+		pr_err("qda: Failed to register RPMsg driver: %d\n", ret);
+
+	return ret;
+}
+
+void qda_rpmsg_unregister(void)
+{
+	unregister_rpmsg_driver(&qda_rpmsg_driver);
+}
diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
new file mode 100644
index 000000000000..5229d834b34b
--- /dev/null
+++ b/drivers/accel/qda/qda_rpmsg.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_RPMSG_H__
+#define __QDA_RPMSG_H__
+
+/* RPMsg transport layer registration */
+int qda_rpmsg_register(void);
+void qda_rpmsg_unregister(void);
+
+#endif /* __QDA_RPMSG_H__ */

-- 
2.34.1



