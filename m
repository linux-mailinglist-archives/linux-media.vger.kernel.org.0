Return-Path: <linux-media+bounces-62087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJpsMfYADGpcTQUAu9opvQ
	(envelope-from <linux-media+bounces-62087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:19:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E6B577E9F
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E7C63088352
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726263A6B61;
	Tue, 19 May 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSkJ02ar"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBE238F25A;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171356; cv=none; b=B+QT4YNsKQr2mcNjLQvD//PvKAi3Q61kZocnDqCXDQgkrcb9KFUHwUh3WQ+/nP7CCSLT9CBT5gZXRKnivHuyC3bV5hF8gWcnUsAJTXzP5KHiledDrzXEKBRi2e9GbVonpVWBNCopj7CQrRxfwyJqVsR6rAne/g7NFe1slZjtgzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171356; c=relaxed/simple;
	bh=ig/vmSqFhkmDgcH8IiwWoJUQwqHS/X/UyN5dj7rmp4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZpdsRGabaEQ8WrgCSJiqkTVAVsP++8dKAvxmwO4/L7SoLWYVVdytBOb11ctZDOITctxHLxG9z/F+kei5lKZ3Ef0sNWf82pvF0YtUkYdl1D/2GxB6FedPO6MwGnV05x6zQHhJs5WbgKvoLg4NOZi4LrrHHy2eBNosE//iNRdisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSkJ02ar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C18E0C2BCFA;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171355;
	bh=ig/vmSqFhkmDgcH8IiwWoJUQwqHS/X/UyN5dj7rmp4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nSkJ02ar9vRyAvEcCNyDmI8RYdawt8rxmW8Yl2e0rT5sN+IYV+bHdEogeFsZZOaiL
	 OrPixu8BXC4mmSty6ao+A96Ag8Tc7u/JwTtt7h5yGKbG2r3QG7UUDbOH4UUnDMAM58
	 XcSeu4gl+Oi6VJmKOkquCIbOQZMfjn4FbIsY8DjSxf+Dyoh5sk5s6sKhiICmg0jEBJ
	 K52A8rMBsmmQvXV//ASXPSTWVgg4zi0uH/r5LqrRmBLvKJDZTlVGzySufft5PP/fw9
	 DaZ/y42bE+HPMnRMU2JTBZ0p0D0ArO2Wnoi3X6P7f4SEvB33UfUwPhxQbS2rqjN5x5
	 m8iJHpuXzJ9uA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4096CD4F58;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:45:58 +0530
Subject: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=5690;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=CaIfrn5nBl4FVUxVXFzPBaCS065D5xRWuAJfeXm6ubA=;
 b=3zXxCnThCYXr7tfb7Gp7BYx3l9J3BwlbvBt7D+/4UGZuIgLhC7JEXwrFlGq9nsoZNXuDEyZ3L
 7eQJmf2YCJQC0p6t62N6Zbcw2quPlyg0rmAuX1V9xW7XmVkVO2SPQv0
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
	TAGGED_FROM(0.00)[bounces-62087-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
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
X-Rspamd-Queue-Id: E0E6B577E9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
identify which DSP domain a given /dev/accel/accel* node represents
(e.g. "cdsp", "adsp").

include/uapi/drm/qda_accel.h
  Defines the QDA IOCTL command numbers and the associated data
  structures. The header follows the standard DRM UAPI conventions:
  __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
  Linux-syscall-note licensing.

drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
  Implements qda_ioctl_query(), which copies the DSP domain name
  stored in qda_dev.dsp_name into the user-supplied drm_qda_query
  buffer using strscpy().

drivers/accel/qda/qda_drv.c
  Registers the qda_ioctls[] table with the drm_driver so that the
  DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_drv.c   |  8 +++++++
 drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
 include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 701fad5ffb50..b658dad35fee 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_ioctl.o \
 	qda_memory_manager.o \
 	qda_rpmsg.o
 
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 0ad5d9873d7e..becd831d10be 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -8,8 +8,10 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
+#include <drm/qda_accel.h>
 
 #include "qda_drv.h"
+#include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
 static int qda_open(struct drm_device *dev, struct drm_file *file)
@@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
+static const struct drm_ioctl_desc qda_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+};
+
 static const struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops = &qda_accel_fops,
 	.open = qda_open,
 	.postclose = qda_postclose,
+	.ioctls = qda_ioctls,
+	.num_ioctls = ARRAY_SIZE(qda_ioctls),
 	.name = QDA_DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
new file mode 100644
index 000000000000..761d3567c33f
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_ioctl.h>
+#include <drm/qda_accel.h>
+#include "qda_drv.h"
+#include "qda_ioctl.h"
+
+/**
+ * qda_ioctl_query() - Query DSP device information
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_query)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_query *args = data;
+	struct qda_dev *qdev;
+
+	qdev = qda_dev_from_drm(dev);
+
+	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
+
+	return 0;
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
new file mode 100644
index 000000000000..b8fd536a111f
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_IOCTL_H__
+#define __QDA_IOCTL_H__
+
+#include "qda_drv.h"
+
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+#endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
new file mode 100644
index 000000000000..1971a4263065
--- /dev/null
+++ b/include/uapi/drm/qda_accel.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_ACCEL_H__
+#define __QDA_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * QDA IOCTL command numbers
+ *
+ * These define the command numbers for QDA-specific IOCTLs.
+ * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
+ */
+#define DRM_QDA_QUERY		0x00
+
+/*
+ * QDA IOCTL definitions
+ *
+ * These macros define the actual IOCTL numbers used by userspace applications.
+ * They combine the command numbers with DRM_COMMAND_BASE and specify the
+ * data structure and direction (read/write) for each IOCTL.
+ */
+#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
+					 struct drm_qda_query)
+
+/**
+ * struct drm_qda_query - Device information query structure
+ * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
+ *
+ * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
+ * allowing userspace to identify which DSP a device node represents. The
+ * kernel provides the DSP name directly as a null-terminated string.
+ */
+struct drm_qda_query {
+	__u8 dsp_name[16];
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __QDA_ACCEL_H__ */

-- 
2.34.1



