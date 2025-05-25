Return-Path: <linux-media+bounces-33330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE8AC3669
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 21:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D00C3173933
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 19:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C126159D;
	Sun, 25 May 2025 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqU2xycK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43D13FE7;
	Sun, 25 May 2025 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201105; cv=none; b=OOj8E5ppAlXGRO4RfCW+d+BukaCug+I8yhYwKw/0i40FTIGKzCyVEaNBvEH1F61BVGF0EHE9tZdA+g82XfulJlH4aUtVQDkx+XFNqnPHxUvfvxoE3MwA9c7vke8b6uYNguhRSJuCRKZQytPBs7bGLTywHW/q2x6/qJXi4uJ4bck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201105; c=relaxed/simple;
	bh=gwVSZHOezvIuHvqg12Oh4+wg71HgnypnT7cUcFA9Bgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pg/9OOaJi56ykgsqTiqlgi7N0m/z/RZ57KQEP7C43nn1AdqBWBtbdvrXzJPNjg9SkSg7Slk1zez5iiCXc77ykGa7vsNtVaXMxJo6E1AWozDqJubpxVU+g2Q25AnPGwB81/0f4+5NcBsGAoYRD9RDrxncm9nt+OkmbEvDAxGSszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqU2xycK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 955C1C4CEEF;
	Sun, 25 May 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748201104;
	bh=gwVSZHOezvIuHvqg12Oh4+wg71HgnypnT7cUcFA9Bgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aqU2xycKor+q/oZmhHaVzJhOVJV+OTy2YToKgHy4xWKEn8G7oeiA1I/PCln9QLciT
	 fYFyG3Adt1bHDqFvAZvSSndk9BnQG2eR4MgyOGLpQ48f5k14ctkArAzfeAl5zh0pr9
	 njWfBTMTkpaHJcEIi3hnt8W8PrWVbv4w9KNBzC85Wa2hZrDBo3GweT1KEnkxivw93t
	 8Rxo2gjm4lGVRSIk5vJ9kM3T+tkzaOOqJJ7tQGY1PgOrUEv0QHVzfTVpQN4bpwFbvC
	 yaOqxiamISlCNvK5m23lJx9q7/rbg+ytiTU0axC3fXXYFbka4ehb03OFndWjwGw20r
	 Qc8HenV41a0wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D13C54F30;
	Sun, 25 May 2025 19:25:04 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Sun, 25 May 2025 21:25:01 +0200
Subject: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vincent Knecht <vincent.knecht@mailoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748201103; l=5690;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=W7qSyl2dInincNPV8Uy2QP7zqsKo/T/nicDeLaiEMYY=;
 b=5Y277YL52LqpiubaoGzgnXH4qdS7b+iXv06KWr4RPVc4lA1Ro6MwxHqDk2//7rddP07LbCLTY
 ZfVN+7eXJI5B3q3KK+1KpFbkwjHubz/xjNOwOv5dKRhfMYmDmyMIcuG
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Some devices need writing values to VFE VBIF registers.
Add helper functions to do this.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/media/platform/qcom/camss/Makefile         |  1 +
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  | 11 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h | 19 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.h      |  3 +++
 6 files changed, 73 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d26a9c24a430a831e0d865db4d96142da5276653..4c66d29ae505ae5adc717ae98f77fb736a6e15b9 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -21,6 +21,7 @@ qcom-camss-objs += \
 		camss-vfe-680.o \
 		camss-vfe-780.o \
 		camss-vfe-gen1.o \
+		camss-vfe-vbif.o \
 		camss-vfe.o \
 		camss-video.o \
 		camss-format.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 901677293d971cf761944a660ef719af38203f22..520bc16f2a05e34f457a828ecdb1f9502a0470c1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -15,6 +15,7 @@
 #include "camss.h"
 #include "camss-vfe.h"
 #include "camss-vfe-gen1.h"
+#include "camss-vfe-vbif.h"
 
 #define VFE_0_HW_VERSION		0x000
 
@@ -733,6 +734,7 @@ static void vfe_set_qos(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
 	u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
+	int ret;
 
 	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_0);
 	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_1);
@@ -742,6 +744,15 @@ static void vfe_set_qos(struct vfe_device *vfe)
 	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
 	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
 	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
+
+	/* SoC-specific VBIF settings */
+	if (vfe->res->has_vbif) {
+		ret = vfe_vbif_apply_settings(vfe);
+		if (ret < 0)
+			dev_err_ratelimited(vfe->camss->dev,
+					    "VFE: VBIF error %d\n",
+					    ret);
+	}
 }
 
 static void vfe_set_ds(struct vfe_device *vfe)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.c b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
new file mode 100644
index 0000000000000000000000000000000000000000..2ae61b7baa148f0ad63fe3b8751aeb7b8fc12d81
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * camss-vfe-vbif.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE VBIF Module
+ *
+ * Copyright (c) 2025, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#include <linux/io.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+#include "camss-vfe-vbif.h"
+
+void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val)
+{
+	writel_relaxed(val, vfe->vbif_base + reg);
+}
+
+int vfe_vbif_apply_settings(struct vfe_device *vfe)
+{
+	switch (vfe->camss->res->version) {
+	default:
+		break;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.h b/drivers/media/platform/qcom/camss/camss-vfe-vbif.h
new file mode 100644
index 0000000000000000000000000000000000000000..cef1e17dba1f2335a2c8de070bcb6afde98eef87
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * camss-vfe-vbif.h
+ *
+ * Qualcomm MSM Camera Subsystem - VFE VBIF Module
+ *
+ * Copyright (c) 2025, The Linux Foundation. All rights reserved.
+ *
+ */
+#ifndef QC_MSM_CAMSS_VFE_VBIF_H
+#define QC_MSM_CAMSS_VFE_VBIF_H
+
+#include "camss-vfe.h"
+
+void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val);
+
+int vfe_vbif_apply_settings(struct vfe_device *vfe);
+
+#endif /* QC_MSM_CAMSS_VFE_VBIF_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff9b898ea879674a3ff8f3592d3139..3138562d399444c5cf2ae96bf16b75b85ff5c5ca 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1807,6 +1807,15 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return PTR_ERR(vfe->base);
 	}
 
+	if (vfe->res->has_vbif) {
+		vfe->vbif_base = devm_platform_ioremap_resource_byname(pdev,
+					vfe->res->vbif_name);
+		if (IS_ERR(vfe->vbif_base)) {
+			dev_err(dev, "could not map vbif memory\n");
+			return PTR_ERR(vfe->vbif_base);
+		}
+	}
+
 	/* Interrupt */
 
 	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be7531e0366c73faea44ed245e7a8e30f..614e932c33da78e02e0800ce6534af7b14822f83 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -136,6 +136,8 @@ struct vfe_subdev_resources {
 	u8 line_num;
 	bool has_pd;
 	char *pd_name;
+	bool has_vbif;
+	char *vbif_name;
 	const struct vfe_hw_ops *hw_ops;
 	const struct camss_formats *formats_rdi;
 	const struct camss_formats *formats_pix;
@@ -145,6 +147,7 @@ struct vfe_device {
 	struct camss *camss;
 	u8 id;
 	void __iomem *base;
+	void __iomem *vbif_base;
 	u32 irq;
 	char irq_name[30];
 	struct camss_clock *clock;

-- 
2.49.0



