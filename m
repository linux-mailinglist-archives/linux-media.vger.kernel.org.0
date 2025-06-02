Return-Path: <linux-media+bounces-33949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDDAACBA41
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 19:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CC8B188FF86
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 17:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5198A229B2E;
	Mon,  2 Jun 2025 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeonM7BL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF49DDAB;
	Mon,  2 Jun 2025 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748885256; cv=none; b=J79j7SghPnwZ/ehZBo/nTbQ2bRNJ9nFtyaHnH5zcHZDS4AI9+NgC4XHP1rMyfxh9ZZEJ32OXCK9ln9VyOQvd/+1RM9RoQuIN2KI8HPTQYeVexZMhPGawTc3jUuhVqDdXxMtiuRKiZ2xGl7v1WJrJ6rt3LdpV+RAq5P0VWx0JWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748885256; c=relaxed/simple;
	bh=5uM1KEccZGwSr12tN15CoRzVQnItiD4rKHjSysiJ9Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RK1wXJGzlKWkW3QqMeXEBqN0vqLqKZm89SW7YG6qnNy6KMLhXDUu06DsdU5osCmj8M0+6XQo8/+4Vsp6zTZw6WHQI0g/WSSEAjPv5fW6YpA1HsFudklBUl26/p5iOR/P8Ye2cTVWei1Z0I+TeHYtDrM6xoOZv8npz9DknaJH3+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeonM7BL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 074F2C4CEF0;
	Mon,  2 Jun 2025 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748885256;
	bh=5uM1KEccZGwSr12tN15CoRzVQnItiD4rKHjSysiJ9Hg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FeonM7BLHPnum07msX5p8Om5dLPcbjDb1gYFoCbWo7Kdn7rVILISZC6wpsZ5178KR
	 OL46jrkQrbNkfNJfnvShVn1O3qZBbyByhAwyuxep886/rJ+LFXlogxNJUVkuyYMAPF
	 0x9eux44Arxf4CP8BAFc0CsVWd65NaHqzdeEcaCmBVyW6GE8J4YTLpbIUCjjcBuo1e
	 Uy47Z5xhxsalFpN8gr58IH2j2C8lfeosBWJWEVJic+5lzg5/HnaUv7Tv8tDqscg1Pm
	 h34KOe+VeAZsyWsfWMxsaPx6/j+OMlZsVvzEodQZGnm3GcUxwnhaU0+sdJYPgSJzOz
	 IB6W/M26f0SIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B29C5B559;
	Mon,  2 Jun 2025 17:27:35 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Mon, 02 Jun 2025 19:27:27 +0200
Subject: [PATCH v4 1/4] media: qcom: camss: vfe: Add VBIF setting support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-camss-8x39-vbif-v4-1-32c277d8f9bf@mailoo.org>
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
In-Reply-To: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748885254; l=5704;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=BNIKW/RwpPNnHWbIEWBtf7KbBZ0Sem2j1RciQTI5Pzg=;
 b=ln2mZkNtX8QALbFStuWytkKNVBm90ENDowHvcNjpQfb57D7xRSVz6ilNtafz5J8SAP7BpiwPY
 PWFmhNjy4HcAVQw2QIJq0jW5lFbE6NGs0icFfBOzcHUXjUjje/xBafA
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Some devices need writing values to VFE VBIF registers.
Add helper functions to do this.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
index 4bca6c3abaff9b898ea879674a3ff8f3592d3139..ac8e5e9471a426bec5d989abd5e082f5fa027364 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1807,6 +1807,15 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return PTR_ERR(vfe->base);
 	}
 
+	if (vfe->res->has_vbif) {
+		vfe->vbif_base = devm_platform_ioremap_resource_byname(pdev,
+								       vfe->res->vbif_name);
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



