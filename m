Return-Path: <linux-media+bounces-45981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DEBC1EE22
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762071897198
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9712D33A039;
	Thu, 30 Oct 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMaDNLSo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D3B338592;
	Thu, 30 Oct 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761811162; cv=none; b=aOlY0zJ7kNhCnfrdON+yxJhE+N3klz23Ok6t48yAiI+uTm50yBqBzjibHm5teo1xY3AWep8hoge0skfSuOMrGQyErkWA7vYzYynnAVcfriOCIOcW8v69uB2PlxoNjtKr0RuR5em4gMK/gY1hHS9OUaz08FIBdUt/6pwPjpITiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761811162; c=relaxed/simple;
	bh=m1jQgGTt6zJDUfj3/5LcwXIsSTC6xfUWjIy900n/kiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hY8id/V0hAEIK3HFfIFoNBhU2CTSgbY/2w6A9GAnksonH5+Zy4CLOrKE2KO5LNQE/C2njlBlKRnCwCnwVhcu0vuThF/E+Od9n+K9QBAyd0TVA23nybi2DIjUe+0RDSkxY3BMyL+AJYIJDfFAi7EMHNYBwos4WI9jNO7kvai0Dug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMaDNLSo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F9E5C4CEF1;
	Thu, 30 Oct 2025 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761811162;
	bh=m1jQgGTt6zJDUfj3/5LcwXIsSTC6xfUWjIy900n/kiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mMaDNLSolBjHVp5mJcTd6qX9rCszLSQTM8VfJKk8VWxxM6xkn2T1K0WN1/ihw0zlC
	 82UR7wteWmpEgE7j7U3asuBgSbGBbC1pjfD+noQr/QkWir28C58cFeejroBKu1Pdgv
	 oLWINFtiXoA/CjLLdYwhuKiXiKj5lkoRCpRmprlnGdhFiUVqP5cCtAVsqyYD9npYm0
	 hCm32pe/uAuc5AMwPItEjByQimb4ryIsp2DcoHAWMA5JcBr9l8rjZg8W1D2bX2Ljls
	 3rvU2FZAKBJVi+7ZYVmOT1MgkbVRG6GUFJElzq/t5uTfUlfuGgytmRukIc7++1aZ4H
	 jPSTM/JbJn3zQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49709CCF9F8;
	Thu, 30 Oct 2025 07:59:22 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Thu, 30 Oct 2025 08:59:13 +0100
Subject: [PATCH v8 2/4] media: qcom: camss: vfe: Add VBIF setting support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251030-camss-8x39-vbif-v8-2-754834937f5c@apitzsch.eu>
References: <20251030-camss-8x39-vbif-v8-0-754834937f5c@apitzsch.eu>
In-Reply-To: <20251030-camss-8x39-vbif-v8-0-754834937f5c@apitzsch.eu>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761811160; l=5419;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=LUWA6d1W5yZjmia9pSTmWz7Fms+vfBEZ+ggLf0ICA8s=;
 b=TGD08czsjIMQjmsur/e5dREqaGRPhRs/HwoSnvPqVDzepeaX0UXKGSGqZW13CAYIY3D2bSCtv
 MYjJNOQebs2DQTf4wzHN5Cq7SOxozNvnDUvr3WEPHJHoIrhG+jS66s1
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



