Return-Path: <linux-media+bounces-39843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9DAB255EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACFC27B581B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200E62ED165;
	Wed, 13 Aug 2025 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KytFlLnE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D51C3009E9;
	Wed, 13 Aug 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121802; cv=none; b=K+ktw0SUCVrZTiZ0cadU86FC3KT+AgSbw4BAQxjVFQp5cON+qWqpjW2nSh3lmWnTmayNu0D41xrp3XzfE/9XKjJ09k9i6bzEjp6EbcuiZlbHqGsnqZ5x5uVNySlzhoGKiFusdTMy0u9s1PSLM/39MFeK07CdlTob+31CGjlI8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121802; c=relaxed/simple;
	bh=yDDQBNB3kvi//j/ammrtpGk2hlZ+mVWTE2oet671FVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AWBMB3x+Yx1D0M6r174T1aLaIEXGojoVwFbZhoG7qiLc+AaWP01Ld63eDatcvZ/9yAm2C/Fcr7WYRunSR4O8FW7vSCa2KmqTxOwzhHf3eFirRMGq3fbrwmFRTB5Vj/DZ3RPHH8lqD/Ofdwd/toEYNy/zw/ffAV/xfKTHyiIhdy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KytFlLnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A57C4CEEB;
	Wed, 13 Aug 2025 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755121802;
	bh=yDDQBNB3kvi//j/ammrtpGk2hlZ+mVWTE2oet671FVA=;
	h=From:To:Cc:Subject:Date:From;
	b=KytFlLnE+5QvngChVYN9kXSj/MmPaZmA76JwSoQ4Kv9MXdQDlPhx708d0pcydCLuc
	 tqeeOfWG/xDNRW4DlFXCQCZzWUiDF9+9uY9Jno/Vf1R6tcnn+Iq5PCLsCrmGnwDXZ9
	 +RLmchQI53G4ja3BERxwEpgRaeV25KLFa5/N3YlCZ3c4L2opfCORyZMladUSSJUM5N
	 jgXWk4NK5TDDkkWNFcHlHnAKCZb6ylK9k8mYaWnuvBzVh2bGVOC/ZYuW4RcTsm8sOw
	 ogNJqjaUIL9U++F3exrNtlrnlLiB4RfUN2Wc1C6HQNKfUz121V9TMjXEneXggfIbHt
	 wha4MrYDHgWKQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Wed, 13 Aug 2025 16:49:48 -0500
Message-ID: <20250813214949.897858-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Rebase on v6.17-rc1
---
 drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
 .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
 drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
 3 files changed, 21 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index da00f5fc0e5d..168f0514851e 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -10,7 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -542,47 +542,30 @@ const struct vpu_core_resources *vpu_get_resource(struct vpu_inst *inst)
 
 static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 {
-	struct device_node *node;
 	struct resource res;
 	int ret;
 
-	if (of_count_phandle_with_args(np, "memory-region", NULL) < 2) {
-		dev_err(core->dev, "need 2 memory-region for boot and rpc\n");
-		return -ENODEV;
+	ret = of_reserved_mem_region_to_resource(np, 0, &res);
+	if (ret) {
+		dev_err(core->dev, "Cannot get boot-region\n");
+		return ret;
 	}
 
-	node = of_parse_phandle(np, "memory-region", 0);
-	if (!node) {
-		dev_err(core->dev, "boot-region of_parse_phandle error\n");
-		return -ENODEV;
-	}
-	if (of_address_to_resource(node, 0, &res)) {
-		dev_err(core->dev, "boot-region of_address_to_resource error\n");
-		of_node_put(node);
-		return -EINVAL;
-	}
 	core->fw.phys = res.start;
 	core->fw.length = resource_size(&res);
 
-	of_node_put(node);
-
-	node = of_parse_phandle(np, "memory-region", 1);
-	if (!node) {
-		dev_err(core->dev, "rpc-region of_parse_phandle error\n");
-		return -ENODEV;
-	}
-	if (of_address_to_resource(node, 0, &res)) {
-		dev_err(core->dev, "rpc-region of_address_to_resource error\n");
-		of_node_put(node);
-		return -EINVAL;
+	ret = of_reserved_mem_region_to_resource(np, 1, &res);
+	if (ret) {
+		dev_err(core->dev, "Cannot get rpc-region\n");
+		return ret;
 	}
+
 	core->rpc.phys = res.start;
 	core->rpc.length = resource_size(&res);
 
 	if (core->rpc.length < core->res->rpc_size + core->res->fwlog_size) {
 		dev_err(core->dev, "the rpc-region <%pad, 0x%x> is not enough\n",
 			&core->rpc.phys, core->rpc.length);
-		of_node_put(node);
 		return -EINVAL;
 	}
 
@@ -594,7 +577,6 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 	if (ret != VPU_CORE_MEMORY_UNCACHED) {
 		dev_err(core->dev, "rpc region<%pad, 0x%x> isn't uncached\n",
 			&core->rpc.phys, core->rpc.length);
-		of_node_put(node);
 		return -EINVAL;
 	}
 
@@ -606,8 +588,6 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 	core->act.length = core->rpc.length - core->res->rpc_size - core->log.length;
 	core->rpc.length = core->res->rpc_size;
 
-	of_node_put(node);
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index f1b5cd56db32..40448429ba97 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -19,8 +19,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
-	struct reserved_mem *rmem;
-	struct device_node *node;
+	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
 	ssize_t fw_size;
@@ -30,17 +29,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (!node)
-		return -EINVAL;
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem)
-		return -EINVAL;
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	mem_phys = rmem->base;
-	res_size = rmem->size;
+	mem_phys = res.start;
+	res_size = resource_size(&res);
 
 	ret = request_firmware(&firmware, fw_name, dev);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..37c0fd52333e 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -9,7 +9,6 @@
 #include <linux/iommu.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
@@ -83,8 +82,7 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 			 phys_addr_t *mem_phys, size_t *mem_size)
 {
 	const struct firmware *mdt;
-	struct reserved_mem *rmem;
-	struct device_node *node;
+	struct resource res;
 	struct device *dev;
 	ssize_t fw_size;
 	void *mem_va;
@@ -94,15 +92,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 	*mem_size = 0;
 
 	dev = core->dev;
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_err(dev, "no memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(dev, "failed to lookup reserved memory-region\n");
 		return -EINVAL;
 	}
@@ -117,8 +108,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	*mem_phys = rmem->base;
-	*mem_size = rmem->size;
+	*mem_phys = res.start;
+	*mem_size = resource_size(&res);
 
 	if (*mem_size < fw_size || fw_size > VENUS_FW_MEM_SIZE) {
 		ret = -EINVAL;
-- 
2.47.2


