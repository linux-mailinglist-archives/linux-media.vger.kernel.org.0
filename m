Return-Path: <linux-media+bounces-16885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B69606BF
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540311C22706
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FB019EEDC;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZrTnZ5k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1019D067;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753194; cv=none; b=oTBr59b1PkObC6Rt1V8JNGqDSPwWjDNru6lF6U5hChxZS9VOji/A8gFm5s92clZ/w/6wdmGSoZ6j9vET1Z1vDmfTz3KQMi1O9aO7cq/iovbZ9KYtTijjn0DYT6BDsyvK+yirNvJ4tBFUIJc9Rf65sgJFLCiaV2A3wZKK0JmhH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753194; c=relaxed/simple;
	bh=9/bXUR9vWDeYiPhm6N3/6l7AKwGwD51EVfA2fLYMVmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahhemIPsX9pa4uIvHYGa04uCyW1+/q//5BhDil8wFIIBp3wgqvT+1LFB8IUzfAoV/0D21HcyKtRPqfsLM6WB4SaXNRQVcjlgr0BzhaBja0BY2XTJvFgy4q/fSdpvvpLfLYL8HwvH4loJXOA+ArSyWNuh7ToG3NgenNmSG7Maklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZrTnZ5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C381C4AF18;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=9/bXUR9vWDeYiPhm6N3/6l7AKwGwD51EVfA2fLYMVmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bZrTnZ5kLN58NwjnFzzyi8l17g1UdOywtHNEugK50VvygFejNcg32qt9ZmLvkeBGC
	 aaQrYnUl84JNZ2yDjQi6XyAPMMP8zpLe73HaUycN8jkFSurqsJZlxuKOYqTT5nebDe
	 TGzS/2fMJD55Lb+ieFnDJEXBpgWR4cC3/nmO59ZqVb30ChrsLkT0Nkex9WnSopTbXy
	 DXr6sJr95hFoEZReaVTGR6C8D1xgWTtMOyRkYD8icwdYCyCriEfNPi2CmXtPNaHFXU
	 lY+kY5BxFcjXSoiqt8uRLWMc3hJK42yMO/lROBRCXD8KvLajdI34RACI5QwjyCRNRr
	 4tuQGeE01dXHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404DAC54732;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:28 +0530
Subject: [PATCH v3 03/29] media: iris: add platform driver for iris video
 device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=5969;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=TMJ26H+innc/Bj52EA4UGDFzuDU7dFnrwt6UHLwI580=;
 b=orECwo3xcGC+nogqmINQ3RXF7HT1Ih2G5JtubsF/sXvxALIoz80udRf+3YLsy4q0O1j+hq1kS
 6FxZpRE7PScAbpg1+hsGUhmwmMm1wODH7ghC6OWJf6zKFQz9bNwWJgE
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

In preparation of adding H264 decode functionality,
add probe and remove functions to iris video platform driver.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/Kconfig           |   1 +
 drivers/media/platform/qcom/Makefile          |   1 +
 drivers/media/platform/qcom/iris/Kconfig      |   9 +++
 drivers/media/platform/qcom/iris/Makefile     |   3 +
 drivers/media/platform/qcom/iris/iris_core.h  |  29 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c | 108 ++++++++++++++++++++++++++
 6 files changed, 151 insertions(+)

diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index cc5799b9ea00..4f4d3a68e6e5 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -3,4 +3,5 @@
 comment "Qualcomm media platform drivers"
 
 source "drivers/media/platform/qcom/camss/Kconfig"
+source "drivers/media/platform/qcom/iris/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
index 4f055c396e04..ea2221a202c0 100644
--- a/drivers/media/platform/qcom/Makefile
+++ b/drivers/media/platform/qcom/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += camss/
+obj-y += iris/
 obj-y += venus/
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
new file mode 100644
index 000000000000..a9986aaa448d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_QCOM_IRIS
+        tristate "Qualcomm Iris V4L2 decoder driver"
+        depends on VIDEO_DEV
+        depends on ARCH_QCOM || COMPILE_TEST
+        help
+          This is a V4L2 driver for Qualcomm Iris video accelerator
+          hardware. It accelerates decoding operations on various
+          Qualcomm SoCs.
+          To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
new file mode 100644
index 000000000000..913da225486b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -0,0 +1,3 @@
+iris-objs += iris_probe.o \
+
+obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
new file mode 100644
index 000000000000..402f0aaef995
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_CORE_H_
+#define _IRIS_CORE_H_
+
+#include <media/v4l2-device.h>
+
+/**
+ * struct iris_core - holds core parameters valid for all instances
+ *
+ * @dev: reference to device structure
+ * @reg_base: IO memory base address
+ * @irq: iris irq
+ * @v4l2_dev: a holder for v4l2 device structure
+ * @vdev_dec: iris video device structure for decoder
+ */
+
+struct iris_core {
+	struct device				*dev;
+	void __iomem				*reg_base;
+	int					irq;
+	struct v4l2_device			v4l2_dev;
+	struct video_device			*vdev_dec;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
new file mode 100644
index 000000000000..0a54fdaa1ab5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+
+#include "iris_core.h"
+
+static int iris_register_video_device(struct iris_core *core)
+{
+	struct video_device *vdev;
+	int ret;
+
+	vdev = video_device_alloc();
+	if (!vdev)
+		return -ENOMEM;
+
+	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
+	vdev->release = video_device_release;
+	vdev->vfl_dir = VFL_DIR_M2M;
+	vdev->v4l2_dev = &core->v4l2_dev;
+	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_vdev_release;
+
+	core->vdev_dec = vdev;
+	video_set_drvdata(vdev, core);
+
+	return 0;
+
+err_vdev_release:
+	video_device_release(vdev);
+
+	return ret;
+}
+
+static void iris_remove(struct platform_device *pdev)
+{
+	struct iris_core *core;
+
+	core = platform_get_drvdata(pdev);
+	if (!core)
+		return;
+
+	video_unregister_device(core->vdev_dec);
+
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static int iris_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iris_core *core;
+	int ret;
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+	core->dev = dev;
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	core->irq = platform_get_irq(pdev, 0);
+	if (core->irq < 0)
+		return core->irq;
+
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = iris_register_video_device(core);
+	if (ret)
+		goto err_v4l2_unreg;
+
+	platform_set_drvdata(pdev, core);
+
+	return 0;
+
+err_v4l2_unreg:
+	v4l2_device_unregister(&core->v4l2_dev);
+
+	return ret;
+}
+
+static const struct of_device_id iris_dt_match[] = {
+	{ .compatible = "qcom,sm8550-iris", },
+	{ .compatible = "qcom,sm8250-venus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, iris_dt_match);
+
+static struct platform_driver qcom_iris_driver = {
+	.probe = iris_probe,
+	.remove_new = iris_remove,
+	.driver = {
+		.name = "qcom-iris",
+		.of_match_table = iris_dt_match,
+	},
+};
+
+module_platform_driver(qcom_iris_driver);
+MODULE_DESCRIPTION("Qualcomm Iris video driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1



