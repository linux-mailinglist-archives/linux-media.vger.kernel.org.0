Return-Path: <linux-media+bounces-16888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7239606C3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52651286BB3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBC119FA6B;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlozr1ir"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D105419D8BE;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753194; cv=none; b=U+fKNtahXvoqhACBFfxfop3MKYCqxlyRNq17g9XYUmCe/CTh7cxuohhD+nfje4ieRtZXQr9GEMeNmXcTBYCmbaiwtiU0uiEIq+F1UFq0lR2CED2yg7iTU6QM8Ah68OWKB5OTQ00yqluU1meTn1Xt+hCBO+LMAT7tuMquG7Th1N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753194; c=relaxed/simple;
	bh=EjMU+8CIbzqeYXltlnVtohsrXYIFzo1X0j7NaKNQXLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcNDm80IC4QesjeLDHMlYs0g4IM+aQpsM9D6o2fGtvhp4hcxhwzEvkJDTFuz1iWTV1qGP8YYRjBp24yzt/TACjrq7EKyWMvACaeid6+YaEpojMWuam+YSVNXyqmzHtVantsjTb/YTGMy7Qcu4PGYHPk3dd4R6mhmgNOUlAaC8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlozr1ir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70ECCC4AF17;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=EjMU+8CIbzqeYXltlnVtohsrXYIFzo1X0j7NaKNQXLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tlozr1irN7N153uaKwQwfXQzRtpybSRZGSg+vFYjwjrwNRI4AKBJBiqpHs1wyT64X
	 wa7iHrhbnxWQygwsNA1dcGOejpJBak1eoNskTT9OriBnqE51ils9I5QNX7wYwFuTRU
	 YPJxOsd1lgALh2Waa+y6d+uRQdJEPbzsaB8vxK0l3fTw9bQpXukxRNGxzjlENd3ymE
	 Rb4ANq/U/BvsRfpCYhltfQ1q+yn1H9juX/E1+Ss/5TOlqKvB5TYqREaEN5EeugoUvD
	 dVzH9JNz5takdCsH6O1qI7HB3OF0cVAqvG/sWn7i6vh7dwEndt0utGaBOIlDrWvDhQ
	 aV0VLmGdRRelQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672C1C5472E;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:30 +0530
Subject: [PATCH v3 05/29] media: iris: implement iris v4l2 file ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-5-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=15155;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=ywx9nYUrAFey2RPmAewqoeSXl/GJ2QCM3IVukYhN9pw=;
 b=0RaQyOjE2tyxiFAbYHINwSwGDMT2+zoUnJav5KVe7inS6TX5D4f4PR5N0YuCk6jXJX8R+jkcf
 Pd5I2fjy6laABWznABTJtRnL2btHDyuGPXLvNa0OqQ+w+GG10KIXM6Z
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Implement open, close and poll ops.

Open:
Configure the vb2 queue and v4l2 file handler. Allocate
a video instance and add the instance to core instance list.

Close:
Free the instance and remove it from core instance list.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Kconfig           |   1 +
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  13 ++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  12 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  22 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  11 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |  31 ++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |   2 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 174 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.h       |  15 ++
 14 files changed, 293 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index a9986aaa448d..4b757bb8adf3 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_QCOM_IRIS
         tristate "Qualcomm Iris V4L2 decoder driver"
         depends on VIDEO_DEV
         depends on ARCH_QCOM || COMPILE_TEST
+        select V4L2_MEM2MEM_DEV
         help
           This is a V4L2 driver for Qualcomm Iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 3e8474d064f4..dcc393a3780a 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,6 +1,9 @@
-iris-objs += iris_platform_sm8250.o \
+iris-objs += iris_hfi_gen1_command.o \
+             iris_hfi_gen2_command.o \
+             iris_platform_sm8250.o \
              iris_platform_sm8550.o \
              iris_probe.o \
              iris_resources.o \
+             iris_vidc.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index a1afd4387b3a..14489bd4474c 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -20,6 +20,7 @@
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
  * @vdev_dec: iris video device structure for decoder
+ * @iris_v4l2_file_ops: iris v4l2 file ops
  * @icc_tbl: table of iris interconnects
  * @icc_count: count of iris interconnects
  * @pmdomain_tbl: table of iris power domains
@@ -36,6 +37,7 @@ struct iris_core {
 	int					irq;
 	struct v4l2_device			v4l2_dev;
 	struct video_device			*vdev_dec;
+	const struct v4l2_file_operations	*iris_v4l2_file_ops;
 	struct icc_bulk_data			*icc_tbl;
 	u32					icc_count;
 	struct dev_pm_domain_list		*pmdomain_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
new file mode 100644
index 000000000000..b02f629a9cdc
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_GEN1_H_
+#define _IRIS_HFI_GEN1_H_
+
+struct iris_inst;
+
+struct iris_inst *iris_hfi_gen1_get_instance(void);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
new file mode 100644
index 000000000000..20c68f4ffb72
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen1.h"
+#include "iris_instance.h"
+
+struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	return kzalloc(sizeof(struct iris_inst), GFP_KERNEL);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
new file mode 100644
index 000000000000..4f9748cbe0e3
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_GEN2_H_
+#define _IRIS_HFI_GEN2_H_
+
+#include "iris_instance.h"
+
+/**
+ * struct iris_inst_hfi_gen2 - holds per video instance parameters for hfi_gen2
+ *
+ * @inst: pointer to iris_instance structure
+ */
+struct iris_inst_hfi_gen2 {
+	struct iris_inst		inst;
+};
+
+struct iris_inst *iris_hfi_gen2_get_instance(void);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
new file mode 100644
index 000000000000..3ee33c8befae
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen2.h"
+
+struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	return kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
new file mode 100644
index 000000000000..63cb9d70166f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_INSTANCE_H_
+#define _IRIS_INSTANCE_H_
+
+#include "iris_core.h"
+
+/**
+ * struct iris_inst - holds per video instance parameters
+ *
+ * @core: pointer to core structure
+ * @ctx_q_lock: lock to serialize queues related ioctls
+ * @lock: lock to seralise forward and reverse threads
+ * @fh: reference of v4l2 file handler
+ * @m2m_dev:	a reference to m2m device structure
+ * @m2m_ctx:	a reference to m2m context structure
+ */
+
+struct iris_inst {
+	struct iris_core		*core;
+	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
+	struct mutex			lock; /* lock to serialize forward and reverse threads */
+	struct v4l2_fh			fh;
+	struct v4l2_m2m_dev		*m2m_dev;
+	struct v4l2_m2m_ctx		*m2m_ctx;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 293fb7e904b0..daa6a74b376f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -21,6 +21,7 @@ struct platform_clk_data {
 };
 
 struct iris_platform_data {
+	struct iris_inst *(*get_instance)(void);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const char * const *pmdomain_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index b6f08fc327b5..5d4211a93bc1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -6,6 +6,7 @@
 #include "iris_core.h"
 #include "iris_platform_common.h"
 #include "iris_resources.h"
+#include "iris_hfi_gen1.h"
 
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
@@ -25,6 +26,7 @@ static const struct platform_clk_data sm8250_clk_table[] = {
 };
 
 struct iris_platform_data sm8250_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index f2f9e6f6775f..e0a3a162c55f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -4,6 +4,7 @@
  */
 
 #include "iris_core.h"
+#include "iris_hfi_gen2.h"
 #include "iris_platform_common.h"
 #include "iris_resources.h"
 
@@ -25,6 +26,7 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 struct iris_platform_data sm8550_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 2616a31224f9..fdf9f12c7728 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 
 #include "iris_core.h"
+#include "iris_vidc.h"
 
 static int iris_register_video_device(struct iris_core *core)
 {
@@ -18,6 +19,7 @@ static int iris_register_video_device(struct iris_core *core)
 
 	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
+	vdev->fops = core->iris_v4l2_file_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
@@ -76,6 +78,7 @@ static int iris_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	iris_init_ops(core);
 	ret = iris_init_resources(core);
 	if (ret) {
 		dev_err_probe(core->dev, ret, "init resource failed\n");
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
new file mode 100644
index 000000000000..24a6d744deaf
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "iris_vidc.h"
+#include "iris_instance.h"
+#include "iris_platform_common.h"
+
+#define IRIS_DRV_NAME "iris_driver"
+#define IRIS_BUS_NAME "platform:iris_icc"
+#define STEP_WIDTH 1
+#define STEP_HEIGHT 1
+
+static int iris_v4l2_fh_init(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+
+	if (inst->fh.vdev)
+		return -EINVAL;
+
+	v4l2_fh_init(&inst->fh, core->vdev_dec);
+	v4l2_fh_add(&inst->fh);
+
+	return 0;
+}
+
+static void iris_v4l2_fh_deinit(struct iris_inst *inst)
+{
+	if (!inst->fh.vdev)
+		return;
+
+	v4l2_fh_del(&inst->fh);
+	inst->fh.ctrl_handler = NULL;
+	v4l2_fh_exit(&inst->fh);
+}
+
+static struct iris_inst *iris_get_inst(struct file *filp, void *fh)
+{
+	if (!filp || !filp->private_data)
+		return NULL;
+
+	return container_of(filp->private_data,
+					struct iris_inst, fh);
+}
+
+static void iris_m2m_device_run(void *priv)
+{
+}
+
+static void iris_m2m_job_abort(void *priv)
+{
+	struct iris_inst *inst = priv;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	v4l2_m2m_job_finish(inst->m2m_dev, m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops iris_m2m_ops = {
+	.device_run = iris_m2m_device_run,
+	.job_abort = iris_m2m_job_abort,
+};
+
+static int
+iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct iris_inst *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->drv_priv = inst;
+	src_vq->dev = inst->core->dev;
+	src_vq->lock = &inst->ctx_q_lock;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->drv_priv = inst;
+	dst_vq->dev = inst->core->dev;
+	dst_vq->lock = &inst->ctx_q_lock;
+
+	return vb2_queue_init(dst_vq);
+}
+
+int iris_open(struct file *filp)
+{
+	struct iris_core *core = video_drvdata(filp);
+	struct iris_inst *inst = NULL;
+	int ret;
+
+	inst = core->iris_platform_data->get_instance();
+	if (!inst)
+		return -ENOMEM;
+
+	inst->core = core;
+
+	mutex_init(&inst->lock);
+	mutex_init(&inst->ctx_q_lock);
+
+	ret = iris_v4l2_fh_init(inst);
+	if (ret)
+		goto fail_free_inst;
+
+	inst->m2m_dev = v4l2_m2m_init(&iris_m2m_ops);
+	if (IS_ERR_OR_NULL(inst->m2m_dev)) {
+		ret = -EINVAL;
+		goto fail_v4l2_fh_deinit;
+	}
+
+	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, iris_m2m_queue_init);
+	if (IS_ERR_OR_NULL(inst->m2m_ctx)) {
+		ret = -EINVAL;
+		goto fail_m2m_release;
+	}
+
+	inst->fh.m2m_ctx = inst->m2m_ctx;
+	filp->private_data = &inst->fh;
+
+	return 0;
+
+fail_m2m_release:
+	v4l2_m2m_release(inst->m2m_dev);
+fail_v4l2_fh_deinit:
+	iris_v4l2_fh_deinit(inst);
+fail_free_inst:
+	mutex_destroy(&inst->ctx_q_lock);
+	mutex_destroy(&inst->lock);
+	kfree(inst);
+
+	return ret;
+}
+
+int iris_close(struct file *filp)
+{
+	struct iris_inst *inst;
+
+	inst = iris_get_inst(filp, NULL);
+	if (!inst)
+		return -EINVAL;
+
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+	v4l2_m2m_release(inst->m2m_dev);
+	mutex_lock(&inst->lock);
+	iris_v4l2_fh_deinit(inst);
+	mutex_unlock(&inst->lock);
+	mutex_destroy(&inst->ctx_q_lock);
+	mutex_destroy(&inst->lock);
+	kfree(inst);
+	filp->private_data = NULL;
+
+	return 0;
+}
+
+static struct v4l2_file_operations iris_v4l2_file_ops = {
+	.owner                          = THIS_MODULE,
+	.open                           = iris_open,
+	.release                        = iris_close,
+	.unlocked_ioctl                 = video_ioctl2,
+	.poll                           = v4l2_m2m_fop_poll,
+	.mmap                           = v4l2_m2m_fop_mmap,
+};
+
+void iris_init_ops(struct iris_core *core)
+{
+	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.h b/drivers/media/platform/qcom/iris/iris_vidc.h
new file mode 100644
index 000000000000..f09862e6199c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vidc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VIDC_H_
+#define _IRIS_VIDC_H_
+
+struct iris_core;
+
+void iris_init_ops(struct iris_core *core);
+int iris_open(struct file *filp);
+int iris_close(struct file *filp);
+
+#endif

-- 
2.34.1



