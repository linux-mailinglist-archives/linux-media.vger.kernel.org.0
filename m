Return-Path: <linux-media+bounces-45880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC76C170EB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 22:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61B59542683
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9142E6CCB;
	Tue, 28 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdv8dZuy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3A2E22A3;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687134; cv=none; b=QGt3d22WauFG+HFu808WlcsKu0EnYInltaw+9gya2g3wePKUJjw8O4SqkIODtKBQJdI7OJ61/Pg/folukmQtzEJlICi7pzaorrduEkVrQi4z+lidO76CD2dKydsc6aqAcpBsAJWvVM6aM+H3fq7fYWoc+36xAUTZuJz4f0G7v0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687134; c=relaxed/simple;
	bh=m1jQgGTt6zJDUfj3/5LcwXIsSTC6xfUWjIy900n/kiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9YKAYCe4OobIiQTgEJuCEQjxAz/pCOWB5D+QKnQ4KEXivmRevQuMT4JdvONm0nuSci1zWVWtgBhG+MGrJYTb/12eM/n3u6KSZ/YxQII4XcsN6Sn5o8L40owH7AA3w+UnOG8WF/NP0g6dQvwOLypljl1l9JbIqiMvY7UC1yjN8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdv8dZuy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1F71C116D0;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687134;
	bh=m1jQgGTt6zJDUfj3/5LcwXIsSTC6xfUWjIy900n/kiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vdv8dZuyjTkhzInIOX+0OhW4Ii0BzPKxKsRd+urTwH2ap19aoWP+T7B2F5/gP1N9i
	 w054/LalEjh2P3N08NRz/GOYifNmiVAUmurPTFbsgGly96smDcS9jm2C8TUdMjEddg
	 C+hCNFoglKSH7+fPOLt133RamMHf3j0+AtLpV5TxvPSXpljTUgxGjRe9qIUKzWSZ7V
	 h0dycdhUs5XgQPwa+rlIIgdyQT/uHRyNJe84pTjcdwEju4WyrLwTxPLTB7EpCXpWf9
	 wcZr0eA3UWqsBrD7j7eOGa6ULZZVVXrm+COx2UG50WNhnZvGW90zZ64KIy16FgMOYw
	 Z/2AhVp+Z1oag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A61CCF9F1;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 28 Oct 2025 22:30:43 +0100
Subject: [PATCH v7 2/4] media: qcom: camss: vfe: Add VBIF setting support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251028-camss-8x39-vbif-v7-2-91ee8becda85@apitzsch.eu>
References: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
In-Reply-To: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761687132; l=5419;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=LUWA6d1W5yZjmia9pSTmWz7Fms+vfBEZ+ggLf0ICA8s=;
 b=1lOYK06uQ4SROphgI3LwCXFiZGzfejoWRzjBo8b4spalRbRU60WSrfmfJIC0xe2340ZpokhI6
 MbuUehnwT+JDXprA2AeowtTzYPgMay3LrPwagVf6ORXUsAbuEL5oF3Q
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Vincent Knecht <vincent.knecht@mailoo.org>

Some devices need writing values to VFE VBIF registers.
Add helper functions to do this.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/platform/qcom/camss/Makefile         |  1 +
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  | 12 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c | 25 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h | 19 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h      |  3 +++
 6 files changed, 69 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 23960d02877d..5e349b491513 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -23,6 +23,7 @@ qcom-camss-objs += \
 		camss-vfe-680.o \
 		camss-vfe-gen3.o \
 		camss-vfe-gen1.o \
+		camss-vfe-vbif.o \
 		camss-vfe.o \
 		camss-video.o \
 		camss-format.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 901677293d97..9cf1ccdb2fe7 100644
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
index 000000000000..691335f231a6
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
index 000000000000..502db629e961
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
index dff8d0a1e8c2..6e28b672b1fa 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1827,6 +1827,15 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
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
index 0300efdb1c46..ae9dad353a37 100644
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
2.51.2



