Return-Path: <linux-media+bounces-16890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 403389606C8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBFC3288964
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036911A01B9;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbf4nSol"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090719D8A9;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753194; cv=none; b=mf739Uwiet6Ty0ZWF5EewFG3SrL+a5oDX7fx0LvNwgDHf7/v0ahWdPmYbj05cj2vEgKFk153h37lHofMK8uW2fqhd82M9/GYOHpDbOLqJE9l60dtOX0H99MmHM5Jkt3MDV+adPBDlK4llgGiFH+BeorOaChPVmRsiEWmkLCAQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753194; c=relaxed/simple;
	bh=CrMHvDmHqAZRXl4CoDH64DDwswVtSNt94xvcSPlw5Os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bF6MlLVaod/UAgrdFFFZ8sk7ZgjwMkO9+z62F4alHwQy05HF5d8KZhHGRf9RrvF6L8h/AOPpIBjyMMHJa/B2qToudXoB3qZr7iJq8dvMeqG2RHhK4ottcZLcJKmAxbt3f1gaKjWGyEdw4YaZvdO3kLtJRzXzoOlKFH2+gwip3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbf4nSol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 648B3C4AF1D;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=CrMHvDmHqAZRXl4CoDH64DDwswVtSNt94xvcSPlw5Os=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hbf4nSolKhIo5+gK4mpySWNdg8Oa/kjMsn/tZWpzvV2GpNWbSEQONu8oI2Az0UJnw
	 4XoatvUIs2V3pFx2wEwgA6h8WU2tDQE2BveKVJFAzJiZL8F/Z/yJchJ+yitwhG85d1
	 gLAdBUzZbbTPDnJoPPcI9hxPx7dqdRoI/IbT+q23raiecy6adZNTvs+xydZBFjgB+w
	 UOMk63EWOeB/SbyH0c8twkSjTBS+yGMkjvoeoP4Lsn0utk9M87vc+F0NZva/1+jDeL
	 Z4wOfWx6wYUGSys7GpK8e5ywT8sa2oBtE7upXpyD6F40XmpkGHxfEUwjXoOpoWHKmj
	 zafyUqBbs9akw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52149C5320E;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:29 +0530
Subject: [PATCH v3 04/29] media: iris: initialize power resources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-4-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=13266;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=ZUmC1n4wAZ0OYX2YUgQnQPDDKpqiTXXKpfIciQErzzE=;
 b=GsDFJ2Ze3no5yB/GHG2sYobjiyG4i7WHw7Mg5/Qm5MUbbFl5f3Jq2NWE5SMWIwZLM6SrJSK9U
 Ra1P5vXUP07Aa1K7DVOo3QZH4vj+v537tGBnTGqvnnErrbMEpBwb+wn
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add support for initializing Iris "resources", which are clocks,
interconnects, power domains, reset clocks, and clock frequencies
used for iris hardware.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  20 +++
 .../platform/qcom/iris/iris_platform_common.h      |  36 +++++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  38 +++++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  38 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  23 ++-
 drivers/media/platform/qcom/iris/iris_resources.c  | 171 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  19 +++
 8 files changed, 347 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 913da225486b..3e8474d064f4 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,3 +1,6 @@
-iris-objs += iris_probe.o \
+iris-objs += iris_platform_sm8250.o \
+             iris_platform_sm8550.o \
+             iris_probe.o \
+             iris_resources.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 402f0aaef995..a1afd4387b3a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -6,8 +6,12 @@
 #ifndef _IRIS_CORE_H_
 #define _IRIS_CORE_H_
 
+#include <linux/types.h>
 #include <media/v4l2-device.h>
 
+#include "iris_platform_common.h"
+#include "iris_resources.h"
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -16,6 +20,14 @@
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
  * @vdev_dec: iris video device structure for decoder
+ * @icc_tbl: table of iris interconnects
+ * @icc_count: count of iris interconnects
+ * @pmdomain_tbl: table of iris power domains
+ * @opp_pmdomain_tbl: table of opp power domains
+ * @clock_tbl: table of iris clocks
+ * @clk_count: count of iris clocks
+ * @resets: table of iris reset clocks
+ * @iris_platform_data: a structure for platform data
  */
 
 struct iris_core {
@@ -24,6 +36,14 @@ struct iris_core {
 	int					irq;
 	struct v4l2_device			v4l2_dev;
 	struct video_device			*vdev_dec;
+	struct icc_bulk_data			*icc_tbl;
+	u32					icc_count;
+	struct dev_pm_domain_list		*pmdomain_tbl;
+	struct dev_pm_domain_list		*opp_pmdomain_tbl;
+	struct clk_bulk_data			*clock_tbl;
+	u32					clk_count;
+	struct reset_control_bulk_data		*resets;
+	const struct iris_platform_data		*iris_platform_data;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
new file mode 100644
index 000000000000..293fb7e904b0
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_PLATFORM_COMMON_H_
+#define _IRIS_PLATFORM_COMMON_H_
+
+extern struct iris_platform_data sm8550_data;
+extern struct iris_platform_data sm8250_data;
+
+enum platform_clk_type {
+	IRIS_AXI_CLK,
+	IRIS_CTRL_CLK,
+	IRIS_HW_CLK,
+};
+
+struct platform_clk_data {
+	enum platform_clk_type clk_type;
+	const char *clk_name;
+};
+
+struct iris_platform_data {
+	const struct icc_info *icc_tbl;
+	unsigned int icc_tbl_size;
+	const char * const *pmdomain_tbl;
+	unsigned int pmdomain_tbl_size;
+	const char * const *opp_pd_tbl;
+	unsigned int opp_pd_tbl_size;
+	const struct platform_clk_data *clk_tbl;
+	unsigned int clk_tbl_size;
+	const char * const *clk_rst_tbl;
+	unsigned int clk_rst_tbl_size;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
new file mode 100644
index 000000000000..b6f08fc327b5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_resources.h"
+
+static const struct icc_info sm8250_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
+
+static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const char * const sm8250_opp_pd_table[] = { "mx" };
+
+static const struct platform_clk_data sm8250_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+struct iris_platform_data sm8250_data = {
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8250_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
new file mode 100644
index 000000000000..f2f9e6f6775f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_resources.h"
+
+static const struct icc_info sm8550_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const sm8550_clk_reset_table[] = { "bus" };
+
+static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
+
+static const struct platform_clk_data sm8550_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+struct iris_platform_data sm8550_data = {
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 0a54fdaa1ab5..2616a31224f9 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -69,6 +69,19 @@ static int iris_probe(struct platform_device *pdev)
 	if (core->irq < 0)
 		return core->irq;
 
+	core->iris_platform_data = of_device_get_match_data(core->dev);
+	if (!core->iris_platform_data) {
+		ret = -ENODEV;
+		dev_err_probe(core->dev, ret, "init platform failed\n");
+		return ret;
+	}
+
+	ret = iris_init_resources(core);
+	if (ret) {
+		dev_err_probe(core->dev, ret, "init resource failed\n");
+		return ret;
+	}
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
@@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id iris_dt_match[] = {
-	{ .compatible = "qcom,sm8550-iris", },
-	{ .compatible = "qcom,sm8250-venus", },
+	{
+		.compatible = "qcom,sm8550-iris",
+		.data = &sm8550_data,
+	},
+	{
+		.compatible = "qcom,sm8250-venus",
+		.data = &sm8250_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
new file mode 100644
index 000000000000..57c6f9f3449b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/interconnect.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/reset.h>
+
+#include "iris_core.h"
+#include "iris_resources.h"
+
+static int iris_init_icc(struct iris_core *core)
+{
+	const struct icc_info *icc_tbl;
+	u32 ret, i = 0;
+
+	icc_tbl = core->iris_platform_data->icc_tbl;
+
+	core->icc_count = core->iris_platform_data->icc_tbl_size;
+	core->icc_tbl = devm_kzalloc(core->dev,
+				     sizeof(struct icc_bulk_data) * core->icc_count,
+				     GFP_KERNEL);
+	if (!core->icc_tbl)
+		return -ENOMEM;
+
+	for (i = 0; i < core->icc_count; i++) {
+		core->icc_tbl[i].name = icc_tbl[i].name;
+		core->icc_tbl[i].avg_bw = icc_tbl[i].bw_min_kbps;
+		core->icc_tbl[i].peak_bw = 0;
+	}
+
+	ret = devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
+	if (ret)
+		dev_err(core->dev, "failed to get interconnect paths, NoC will stay unconfigured!\n");
+
+	return ret;
+}
+
+static int iris_pd_get(struct iris_core *core)
+{
+	int ret;
+
+	struct dev_pm_domain_attach_data iris_pd_data = {
+		.pd_names = core->iris_platform_data->pmdomain_tbl,
+		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int iris_opp_pd_get(struct iris_core *core)
+{
+	int ret;
+
+	struct dev_pm_domain_attach_data iris_opp_pd_data = {
+		.pd_names = core->iris_platform_data->opp_pd_tbl,
+		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+	};
+
+	ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int iris_init_power_domains(struct iris_core *core)
+{
+	const struct platform_clk_data *clk_tbl;
+	u32 clk_cnt, i;
+	int ret;
+
+	ret = iris_pd_get(core);
+	if (ret)
+		return ret;
+
+	ret = iris_opp_pd_get(core);
+	if (ret)
+		return ret;
+
+	clk_tbl = core->iris_platform_data->clk_tbl;
+	clk_cnt = core->iris_platform_data->clk_tbl_size;
+
+	for (i = 0; i < clk_cnt; i++) {
+		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
+			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = devm_pm_opp_of_add_table(core->dev);
+	if (ret) {
+		dev_err(core->dev, "failed to add opp table\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int iris_init_clocks(struct iris_core *core)
+{
+	int ret;
+
+	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
+	if (ret < 0) {
+		dev_err(core->dev, "failed to get bulk clock\n");
+		return ret;
+	}
+
+	core->clk_count = ret;
+
+	return 0;
+}
+
+static int iris_init_resets(struct iris_core *core)
+{
+	const char * const *rst_tbl;
+	u32 rst_tbl_size;
+	u32 i = 0, ret;
+
+	rst_tbl = core->iris_platform_data->clk_rst_tbl;
+	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+
+	core->resets = devm_kzalloc(core->dev,
+				    sizeof(*core->resets) * rst_tbl_size,
+				    GFP_KERNEL);
+	if (rst_tbl_size && !core->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < rst_tbl_size; i++)
+		core->resets[i].id = rst_tbl[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
+	if (ret) {
+		dev_err(core->dev, "failed to get resets\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+int iris_init_resources(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_init_icc(core);
+	if (ret)
+		return ret;
+
+	ret = iris_init_power_domains(core);
+	if (ret)
+		return ret;
+
+	ret = iris_init_clocks(core);
+	if (ret)
+		return ret;
+
+	ret = iris_init_resets(core);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
new file mode 100644
index 000000000000..b0217399030a
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_RESOURCES_H_
+#define _IRIS_RESOURCES_H_
+
+struct iris_core;
+
+struct icc_info {
+	const char		*name;
+	u32			bw_min_kbps;
+	u32			bw_max_kbps;
+};
+
+int iris_init_resources(struct iris_core *core);
+
+#endif

-- 
2.34.1



