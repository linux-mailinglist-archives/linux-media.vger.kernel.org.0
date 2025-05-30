Return-Path: <linux-media+bounces-33639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF634AC8A4F
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 11:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43AC07AE896
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 08:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F42B22170B;
	Fri, 30 May 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sjf1okOU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7921859A;
	Fri, 30 May 2025 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595609; cv=none; b=aFBObrBkVN4S1YFWc5nilGCku0oHhGm0IhlcQ+00K5uPqxefcolt9WDDq5MofL9CXEyhggMOTsk7uJFlC/rVenTIJH12Mw+OxqK3OH1FkaDDsjA3uwGZDvSvWwCx8dSxzrmN6QVhyEs/NAxgwDrlibo5vxFsvwnbi0xubTIfsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595609; c=relaxed/simple;
	bh=iEvbOuzqN5R0DIK0mtzXnwU4mwyKC2zLReYlN5bVtG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ed7+Vvr0kaSXAyIjL7hudw2niuckfjH6/cETd7AebHwW952u33DtmKG31b9/WsNdTbzs9DES80SPvT+ZeG0CNzvR/vtQ6j+H8WNR1Dxdyrk3UMNWW7quo6YzjKEE93COiqxphUb507kwI0rSbHYxoKbzxi1CUHqvTZrqqtao4Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sjf1okOU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 094FFC4CEEE;
	Fri, 30 May 2025 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748595609;
	bh=iEvbOuzqN5R0DIK0mtzXnwU4mwyKC2zLReYlN5bVtG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Sjf1okOUJLHuro7SEBg5TWcj9xi7g+MpviBpYg2oys4Xf8QXJzY5LmXyvrJafTcOe
	 +u3W1JfPXKgjcVcnm59+GZz6nmsGYdN7+UUz2OsACWeRKfgsU8sUk7vewyuvOtJnbe
	 OaQHQuLEuE74STw0HVHMjMiscAPwT9A4vK3V+UxJjllCSL0OQVnEabk0UanM/2uSke
	 ntntoMmuH/gsqLsA3D+34ou02ZfUaSQCh0lcpV+ocNxISC+HydXso+t1NHxQVM3weG
	 LSwJttSoXnWHSTIlGYcVECUCIL/QhjM0emvZd0gx3UhV45DYUDLybz0BhlmI92XILN
	 SNplZFVAoav9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7DDC5B549;
	Fri, 30 May 2025 09:00:08 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Fri, 30 May 2025 11:00:04 +0200
Subject: [PATCH v3 1/4] media: qcom: camss: vfe: Add VBIF setting support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-camss-8x39-vbif-v3-1-fc91d15bb5d6@mailoo.org>
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
In-Reply-To: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748595607; l=5634;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=FckotRXI72qsx6HUw4Bx86ZqjuCyq9lSzLkzhgpF+uQ=;
 b=Z/2dmfEt4MoORyEJWkUC17FbHs1Y4yvUDLRvV3GMnued+Plhr+2TMX7gmmCC9nnB3PcIHaXyM
 0R+VfRppUtnDo2iTo8J/LPIZAU2nHO9knNaGq2jdKl8s8zTyHAN4EEa
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
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  | 12 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c | 25 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h | 19 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h      |  3 +++
 6 files changed, 69 insertions(+)

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
index 901677293d971cf761944a660ef719af38203f22..9cf1ccdb2fe7ca9bf89b746af836e1035b457a8f 100644
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
@@ -742,6 +744,16 @@ static void vfe_set_qos(struct vfe_device *vfe)
 	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
 	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
 	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
+
+	/* SoC-specific VBIF settings */
+	if (vfe->res->has_vbif) {
+		ret = vfe_vbif_apply_settings(vfe);
+		if (ret < 0) {
+			dev_err_ratelimited(vfe->camss->dev,
+					    "VFE: VBIF error %d\n",
+					    ret);
+		}
+	}
 }
 
 static void vfe_set_ds(struct vfe_device *vfe)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.c b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
new file mode 100644
index 0000000000000000000000000000000000000000..691335f231a6001e6c535431a18b2e21ddc832c9
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
@@ -0,0 +1,25 @@
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
+void vfe_vbif_write_reg(struct vfe_device *vfe, u32 reg, u32 val)
+{
+	writel_relaxed(val, vfe->vbif_base + reg);
+}
+
+int vfe_vbif_apply_settings(struct vfe_device *vfe)
+{
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.h b/drivers/media/platform/qcom/camss/camss-vfe-vbif.h
new file mode 100644
index 0000000000000000000000000000000000000000..502db629e961f67723b14a7c8c9ca973fe4c267c
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
+void vfe_vbif_write_reg(struct vfe_device *vfe, u32 reg, u32 val);
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



