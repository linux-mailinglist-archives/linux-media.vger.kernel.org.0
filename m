Return-Path: <linux-media+bounces-22898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6E9E9500
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E9301881C17
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8876E229B3B;
	Mon,  9 Dec 2024 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eIsLIHy0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34499229B25;
	Mon,  9 Dec 2024 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748794; cv=none; b=lj4urr8QURtDI/x9DjxzMeICPWOPMXytlP5Do1KRbYTiVXDM9D94NT7dIpOAnYOfqBGHGqvgIgLyOgHpH0Gt0+zLuBD0XBifVXWoJwt9/CdS7wgtlKOSsdkTWuvhkqnQP1C4Nh4eFMbiYRa8BLZuC1YDhgdNuHNnx8+7vPNw1Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748794; c=relaxed/simple;
	bh=yo4wEsfKluGMJhK9rgxoR6DFEK2OtcSu2L6+bU/Qkfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=quIifzrzp8H0gMvrh7PPSj8PVN3b4UBxQdxpFsslwm6rZo/HO51G/RPG6Y1qKx3CGV8ZRbkHGqLihDGzBpX/eJKLeUyKzgJKXn206LFdAkUwYT0hXbviTngZBkjnXao9n0uRELPHBF5ZZ7A6HWUkiVQjlnNfzhcT5Hap2ZjYPRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eIsLIHy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98LRJ1014016;
	Mon, 9 Dec 2024 12:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojm9NMLyFDrwVfF8kbSoBLoNqjrrljFnxHuKJhFd8Dg=; b=eIsLIHy0vl6GVryK
	B3WOGvJTYpkN3jrQC1NuFFIygD4WwT0ZxxP1DemExrvbUYtHNxUuWpXkz0fg9oQi
	sq3tzoP7JdxFXOdWm67Y2rON91Nv4XWfLBm8DyLTSN73Jc5VOwNjneneNPBS1HFu
	rPBgXYxFXMh49q6FA7GmYl7LeFpiXqXyvLyIlWz7Et2+EUVL3pIMqSkWznWweuoc
	KPz06MHNZ203Yp/04Y3821J6QQVgGKFf3n3gwgMKBhRktI8P+26T0GM2EDok2Ul0
	LMZ+geHb4fEDM4qwz613j8rPxcBEjTknhae2WI0L2IeQeJR/pntQCpFDoDaOS7R8
	QHJHsQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyah0eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:53:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Cr3DG007419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:53:03 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:52:57 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:21:50 +0530
Subject: [PATCH v7 05/28] media: iris: implement video firmware load/unload
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-5-05c6bdead47b@quicinc.com>
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=8150;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=yo4wEsfKluGMJhK9rgxoR6DFEK2OtcSu2L6+bU/Qkfc=;
 b=6VbQRfwoLnM3quXsbKlYvdyO2lL+XrJfLTVOE5gIaJffWaexexEs2dhGymQ/D8TKermrs5VNK
 RaGHlzJgw32C0NKULDqUVV5h3kHqnHWgDyBLhvZgmdVl3w2XbaZJuOe
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YyIZQK46GjyODQS8Q5du1O0hVVGPzPMd
X-Proofpoint-ORIG-GUID: YyIZQK46GjyODQS8Q5du1O0hVVGPzPMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090101

Load/unload firmware in memory via mdt loader. Firmware is loaded as
part of core initialization and unloaded as part of core
de-initialization.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Kconfig           |   2 +
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_core.c       |   8 ++
 drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_firmware.h   |  14 +++
 .../platform/qcom/iris/iris_platform_common.h      |  12 +++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  10 ++
 7 files changed, 152 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 8debddec87a5..f92cc7fe9378 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -3,6 +3,8 @@ config VIDEO_QCOM_IRIS
         depends on VIDEO_DEV
         depends on ARCH_QCOM || COMPILE_TEST
         select V4L2_MEM2MEM_DEV
+        select QCOM_MDT_LOADER if ARCH_QCOM
+        select QCOM_SCM
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 93711f108a77..6906caa2c481 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,4 +1,5 @@
 iris-objs += iris_core.o \
+             iris_firmware.o \
              iris_hfi_gen1_command.o \
              iris_hfi_gen2_command.o \
              iris_hfi_queue.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 360a54909ef6..8c7d53c57086 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -4,11 +4,13 @@
  */
 
 #include "iris_core.h"
+#include "iris_firmware.h"
 #include "iris_state.h"
 
 void iris_core_deinit(struct iris_core *core)
 {
 	mutex_lock(&core->lock);
+	iris_fw_unload(core);
 	iris_hfi_queues_deinit(core);
 	core->state = IRIS_CORE_DEINIT;
 	mutex_unlock(&core->lock);
@@ -33,10 +35,16 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error;
 
+	ret = iris_fw_load(core);
+	if (ret)
+		goto error_queue_deinit;
+
 	mutex_unlock(&core->lock);
 
 	return 0;
 
+error_queue_deinit:
+	iris_hfi_queues_deinit(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
new file mode 100644
index 000000000000..d40508889f9d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "iris_core.h"
+#include "iris_firmware.h"
+
+#define MAX_FIRMWARE_NAME_SIZE	128
+
+static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+{
+	u32 pas_id = core->iris_platform_data->pas_id;
+	const struct firmware *firmware = NULL;
+	struct device *dev = core->dev;
+	struct reserved_mem *rmem;
+	struct device_node *node;
+	phys_addr_t mem_phys;
+	size_t res_size;
+	ssize_t fw_size;
+	void *mem_virt;
+	int ret;
+
+	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
+		return -EINVAL;
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node)
+		return -EINVAL;
+
+	rmem = of_reserved_mem_lookup(node);
+	of_node_put(node);
+	if (!rmem)
+		return -EINVAL;
+
+	mem_phys = rmem->base;
+	res_size = rmem->size;
+
+	ret = request_firmware(&firmware, fw_name, dev);
+	if (ret)
+		return ret;
+
+	fw_size = qcom_mdt_get_size(firmware);
+	if (fw_size < 0 || res_size < (size_t)fw_size) {
+		ret = -EINVAL;
+		goto err_release_fw;
+	}
+
+	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+	if (!mem_virt)
+		goto err_release_fw;
+
+	ret = qcom_mdt_load(dev, firmware, fw_name,
+			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	ret = qcom_scm_pas_auth_and_reset(pas_id);
+	if (ret)
+		goto err_mem_unmap;
+
+	return ret;
+
+err_mem_unmap:
+	memunmap(mem_virt);
+err_release_fw:
+	release_firmware(firmware);
+
+	return ret;
+}
+
+int iris_fw_load(struct iris_core *core)
+{
+	struct tz_cp_config *cp_config = core->iris_platform_data->tz_cp_config_data;
+	int ret;
+
+	ret = iris_load_fw_to_memory(core, core->iris_platform_data->fwname);
+	if (ret) {
+		dev_err(core->dev, "firmware download failed\n");
+		return -ENOMEM;
+	}
+
+	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
+					     cp_config->cp_size,
+					     cp_config->cp_nonpixel_start,
+					     cp_config->cp_nonpixel_size);
+	if (ret) {
+		dev_err(core->dev, "protect memory failed\n");
+		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+		return ret;
+	}
+
+	return ret;
+}
+
+int iris_fw_unload(struct iris_core *core)
+{
+	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.h b/drivers/media/platform/qcom/iris/iris_firmware.h
new file mode 100644
index 000000000000..266bdd92a124
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_firmware.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_FIRMWARE_H__
+#define __IRIS_FIRMWARE_H__
+
+struct iris_core;
+
+int iris_fw_load(struct iris_core *core);
+int iris_fw_unload(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index b4d63d6677c5..42c1fe8e4fa6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -6,6 +6,8 @@
 #ifndef __IRIS_PLATFORM_COMMON_H__
 #define __IRIS_PLATFORM_COMMON_H__
 
+#define IRIS_PAS_ID				9
+
 extern struct iris_platform_data sm8550_data;
 
 enum platform_clk_type {
@@ -19,6 +21,13 @@ struct platform_clk_data {
 	const char *clk_name;
 };
 
+struct tz_cp_config {
+	u32 cp_start;
+	u32 cp_size;
+	u32 cp_nonpixel_start;
+	u32 cp_nonpixel_size;
+};
+
 struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	const struct icc_info *icc_tbl;
@@ -32,6 +41,9 @@ struct iris_platform_data {
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
 	u64 dma_mask;
+	const char *fwname;
+	u32 pas_id;
+	struct tz_cp_config *tz_cp_config_data;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 9b305b8e2110..96d9d6e816a0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -24,6 +24,13 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
+static struct tz_cp_config tz_cp_config_sm8550 = {
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x01000000,
+	.cp_nonpixel_size = 0x24800000,
+};
+
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.icc_tbl = sm8550_icc_table,
@@ -37,4 +44,7 @@ struct iris_platform_data sm8550_data = {
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.dma_mask = GENMASK(31, 29) - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.tz_cp_config_data = &tz_cp_config_sm8550,
 };

-- 
2.34.1


