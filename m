Return-Path: <linux-media+bounces-53352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENlkG8QPn2neYgQAu9opvQ
	(envelope-from <linux-media+bounces-53352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:05:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D98081992D2
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0D95313FE50
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8733D4128;
	Wed, 25 Feb 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nwa8Cj8p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B433D413E
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031570; cv=none; b=jZCodW0VNBUcPGcpKWX80DDmKtDEknAefW8wqiBfiwJNjsXe4Vpu2sqwZ6eJLRJBGw0fzWltDcCr6SbryE60bEQzTEbM87VfVL4s7cXwWk+r0SwGrsHPCR+fKuPL7xKEgFPivCku1PePW+EwcAo/dUOJkQURD4P5z3IVwtg5i6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031570; c=relaxed/simple;
	bh=dmr41i2HZ0VeSQaiZlhKlLHVUgdcevIxysKiedepq9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdB+rRfM/9j/rLB7fUcMYAyNmkfvPkZs6mNDILj/LUjaPm1+bRvq2uNcL7AKNNnZ4tu791L6eeP0n8AOwB8APKLiI3mCtR+vs+ZOq0lV8OVS9Ahphu70OFh7WUomCiIJiukzYJmm+4qtNXHWvyk5CJxySiR4N494PQ9+x9LYa/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nwa8Cj8p; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43770c94dfaso6610507f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772031567; x=1772636367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcpzhWrlg5HZGtC1m04Aqa9ctjAREKWbT3U4sFPHqSc=;
        b=Nwa8Cj8pMrxDEbY7snc1C8bkk6fowSjn7Ts+ugt+TGKAtwspXjZVD1xqdLnYzADmnc
         zvS9fuQhxrYh4+EXUMvuHfAB6bJHbQLHzzLmUojlK78RJZR0gW/heHAySh2zUC+EmdGr
         gd3Wom+PhiqKfS8klbaaazWBvfc1WqJZobK8yExyR1cBLnA+3McQXhqBkRkPEkO/fXKb
         ++nBbd6sGV49xjnLXoJPfGWWj9pAsxtKj6Jq4P7caU+eC0cLeUi3JDJIW73wdnGhMec2
         XyYQ0j+L2IU7Q/R5jctKbQxAkGiTsNypWLkwu0fayteitG9ww6XD8j0JcLeiWjNvkr59
         0n8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031567; x=1772636367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XcpzhWrlg5HZGtC1m04Aqa9ctjAREKWbT3U4sFPHqSc=;
        b=NbIU2oul0dsjoUGS05GOpmiCi1kPjH6Sy/HlnDYwn9aXmMl4Hdn0uLyI5dovKt+y6p
         G+yH5oqOL3UAITH40HGJRPTKBX6tubDkC9EHxl1kb+jytXItIL/kVYXMUWupMtsNxIzM
         gk5q2D0xxDYdBsZK3cYhsy9DFXfxkPfx0c8xxT0pNNdeG450Hwz7H00UWIdsXObgMjy/
         731RdCwFhARFoS3LLstpQVHfvYbUufj9780y/DhLNW+h+5Q54HalVYXRtK4dBsiWSy2T
         Z3s11wdoNRP9x/xeB7dSRsUj/QFfI35TbwOC1nx/9UpyX+bGeCBecC4BvMrp6TLmJtYq
         wt9g==
X-Forwarded-Encrypted: i=1; AJvYcCXB1NVNL/MHRqQ1Iloz/Xnjx1Gujo2wGhwAu7oZKoLTWjLzDeqySOOPlxjG9dUd0lyXdjii8eWk3zWg1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNkXR4FMXmp3YP0HG447F430E2CreS3ojpPAIfAiCwGOFLIxgB
	XGVqOy8UskZofI9AKALQNkEL/UHgcmWrn+wR2W0VxPF+ZMmlrGjOrIv7F6AgSVpW2wE=
X-Gm-Gg: ATEYQzx3DGnR7/nO8x41r//MxnaK5/b9ledEiNFbLL6djpnQcIl/R75REY4KPtY8lUe
	GfotnNRN0CKU0tA6kHllgAbOBDgA5bDB0zJmZ6BCtitHQS1BL1tcTkCGROtXNQAr2kdJy4JzWmY
	owBcwHMMTT7U1s9SR08EYTCCs+b7YnR3Yp647G+WCS+zhbWc93wn+26tDMc+1CctX2V+DTEsufB
	g6hTF+HJCf+v6N2HPcnJXP49wVlWPwVLpvaTT2zj4ZM7I1qYhIzeohtXTZL2JPrOBFI1JRLJH3A
	Tt61esCqp3T6FI0dx4sgt+S9rvO+1Zx8cJeADfW7Ax3aetCgLnydb2/8ph+OyvMimdvKDAbAhy5
	drK1Kw+9kMSvR2mI/YDl7INZJIzjH8YDZKcMJas8Q0z6VqBm6XFqxMbnHJ6jRyUEJITLN4s9q8N
	pDLeA0gY7KTHaA9/W5PBiodtdvrnGnJKxvF2xxmHGMfKIKEruJd5bmnoD6hgYyvXTHpPGOiWrBP
	Jg=
X-Received: by 2002:a05:6000:40ca:b0:435:dbc4:3af0 with SMTP id ffacd0b85a97d-4396f15ae2fmr31948916f8f.14.1772031566284;
        Wed, 25 Feb 2026 06:59:26 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm32445600f8f.24.2026.02.25.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:59:25 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 14:59:13 +0000
Subject: [PATCH v2 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-x1e-csi2-phy-v2-2-7756edb67ea9@linaro.org>
References: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
In-Reply-To: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=33267;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=dmr41i2HZ0VeSQaiZlhKlLHVUgdcevIxysKiedepq9w=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnw5KZ2x8uTM7hBMJiaR+rCvW3U53Xk9mBUQhE
 xGjqilnaRuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8OSgAKCRAicTuzoY3I
 OmItD/9ZURCHceydlAJoD1SZ4XLOa+OFI73doQRq5h1zal2nUWCLgFHMfwaocfI+8R5spTJ3M16
 rxvsqZVCpEsJU76IK/HZsbJWF20COtza6gN5S9WajbgvtEc+TqxE618bWKE5wln5B2EaQMAkJus
 a+LLP3VDP22xhTgfm089/23MbocXz5Iff+VmeadEiTBVknfUEqoyzaBaoi7jkuI5npQEILYBjgl
 1pKMulz8DSgvW+OlXmJxb9IQsVn1Y1TbuSO4y38lAiyDqCU37g6aheO8H+j7R5PN3foqJday9Sf
 eEmND5Rpl6bCjyJl/wKs3tJ8sKENQ3gkkfDLJLRM+SSK2kCi2R3UDex+ZqktyEKC4/MV4LQNSLI
 mlDeS5U5BoWfEpHoUJjbq2Ev+sxO4+vkjIBhXJ65W2f7HUSjtetplw78+ddKQYVI7DkVeI/tLBM
 DmigH1ZP4tAYr7YvLmB3c6fUCR7DHelhLocAT//WK6iFSgAcX3iEcA9yHJKSwJ5Q5piuUEPVwYe
 pCIhaemmAh9o5PfbyJjz3+TIK24EPr7B7NoGYsOfu/2miClFMkkdC9It4XIBlgd8sYlZ7xXti+l
 61HozpZ+EekaEKyd/ygzlDKPOcF0WT+FQtUq3NBBOJ+SLLsp0rhY9CSpeigu/HISpno08fbqjAQ
 CCWA5PkG804pCYQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53352-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: D98081992D2
X-Rspamd-Action: no action

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

The following devices are supported in this drop:
"qcom,x1e80100-csi2-phy"

In-line with other PHY drivers the process node is included in the name. At
the moment we follow the assignment of lane positions - the bitmap of
physical input lanes to logical lane numbers as a linear list per the
existing DPHY @lanes data-member.

This is fine for us in upstream at the moment since we also map the lanes
contiguously but, our hardware can support different lane mappings so we
should in the future extend out the DPHY structure to capture the mapping.

The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
DPHY is supported.

In porting some of the logic over from camss-csiphy*.c to here its also
possible to rationalise some of the code.

In particular use of regulator_bulk and clk_bulk as well as dropping the
seemingly useless and unused interrupt handler.

The PHY sequences and a lot of the logic that goes with them are well
proven in CAMSS and mature so the main thing to watch out for here is how
to get the right sequencing of regulators, clocks and register-writes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 384 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 307 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 102 ++++++
 6 files changed, 822 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62ccdc72384d4..fe19722355d94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21542,6 +21542,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
 
+QUALCOMM MIPI CSI2 PHY DRIVER
+M:	Bryan O'Donoghue <bod@kernel.org>
+L:	linux-phy@lists.infradead.org
+L:	linux-media@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
+F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
+F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
+F:	include/dt-bindings/phy/phy-qcom-mipi-csi2*
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9..ea33025a40fd0 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -28,6 +28,19 @@ config PHY_QCOM_EDP
 	  Enable this driver to support the Qualcomm eDP PHY found in various
 	  Qualcomm chipsets.
 
+config PHY_QCOM_MIPI_CSI2
+	tristate "Qualcomm MIPI CSI2 PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	select GENERIC_PHY_MIPI_DPHY
+	help
+	  Enable this to support the MIPI CSI2 PHY driver found in various
+	  Qualcomm chipsets. This PHY is used to connect MIPI CSI2
+	  camera sensors to the CSI Decoder in the Qualcomm Camera Subsystem
+	  CAMSS.
+
 config PHY_QCOM_IPQ4019_USB
 	tristate "Qualcomm IPQ4019 USB PHY driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1..382cb594b06b6 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -6,6 +6,11 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
 obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
+
+phy-qcom-mipi-csi2-objs			+= phy-qcom-mipi-csi2-core.o \
+					   phy-qcom-mipi-csi2-3ph-dphy.o
+obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)	+= phy-qcom-mipi-csi2.o
+
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
new file mode 100644
index 0000000000000..f9f3451e9a5e1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-phy_qcom_mipi_csi2-3ph-1-0.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0
+ *
+ * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2016-2025 Linaro Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/time64.h>
+
+#include "phy-qcom-mipi-csi2.h"
+
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET	BIT(0)
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+
+/*
+ * 3 phase CSI has 19 common status regs with only 0-10 being used
+ * and 11-18 being reserved.
+ */
+#define CSI_COMMON_STATUS_NUM				11
+/*
+ * There are a number of common control registers
+ * The offset to clear the CSIPHY IRQ status starts @ 22
+ * So to clear CSI_COMMON_STATUS0 this is CSI_COMMON_CONTROL22, STATUS1 is
+ * CONTROL23 and so on
+ */
+#define CSI_CTRL_STATUS_INDEX				22
+
+/*
+ * There are 43 COMMON_CTRL registers with regs after # 33 being reserved
+ */
+#define CSI_CTRL_MAX					33
+
+#define CSIPHY_DEFAULT_PARAMS				0
+#define CSIPHY_LANE_ENABLE				1
+#define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
+#define CSIPHY_SETTLE_CNT_HIGHER_BYTE			3
+#define CSIPHY_DNP_PARAMS				4
+#define CSIPHY_2PH_REGS					5
+#define CSIPHY_3PH_REGS					6
+#define CSIPHY_SKEW_CAL					7
+
+/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
+static const struct
+mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
+	/* Power up lanes 2ph mode */
+	{.reg_addr = 0x1014, .reg_data = 0xD5, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x101C, .reg_data = 0x7A, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0094, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x00A0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0090, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0098, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0094, .reg_data = 0x07, .delay_us = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0000, .reg_data = 0x8E, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x0F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001C, .reg_data = 0x0A, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0094, .reg_data = 0xD7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x005C, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0060, .reg_data = 0xBD, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0064, .reg_data = 0x7F, .param_type = CSIPHY_SKEW_CAL},
+
+	{.reg_addr = 0x0E94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0EA0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E94, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E28, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E00, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E0C, .reg_data = 0xFF, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E38, .reg_data = 0x1F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E2C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E34, .reg_data = 0x0F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E1C, .reg_data = 0x0A, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E3C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E04, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0E08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0E10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0494, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x04A0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0490, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0498, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0494, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0400, .reg_data = 0x8E, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x0F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041C, .reg_data = 0x0A, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0494, .reg_data = 0xD7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x045C, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0460, .reg_data = 0xBD, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0464, .reg_data = 0x7F, .param_type = CSIPHY_SKEW_CAL},
+
+	{.reg_addr = 0x0894, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x08A0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0890, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0898, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0894, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0830, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x8E, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0838, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x082C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0834, .reg_data = 0x0F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x081C, .reg_data = 0x0A, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0814, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x083C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0804, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0820, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0808, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0810, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0894, .reg_data = 0xD7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x085C, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0860, .reg_data = 0xBD, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0864, .reg_data = 0x7F, .param_type = CSIPHY_SKEW_CAL},
+
+	{.reg_addr = 0x0C94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0CA0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C94, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C00, .reg_data = 0x8E, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C38, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C2C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C34, .reg_data = 0x0F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C1C, .reg_data = 0x0A, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C3C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0C10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C94, .reg_data = 0xD7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0C5C, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0C60, .reg_data = 0xBD, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0C64, .reg_data = 0x7F, .param_type = CSIPHY_SKEW_CAL},
+};
+
+static inline const struct mipi_csi2phy_device_regs *
+csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
+{
+	return &csi2phy->soc_cfg->reg_info;
+}
+
+static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	u32 tmp;
+
+	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
+
+	tmp = readl_relaxed(csi2phy->base +
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+	csi2phy->hw_version = tmp;
+
+	tmp = readl_relaxed(csi2phy->base +
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
+
+	tmp = readl_relaxed(csi2phy->base +
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
+
+	tmp = readl_relaxed(csi2phy->base +
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
+
+	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
+}
+
+/*
+ * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
+ * @phy_qcom_mipi_csi2: CSIPHY device
+ */
+static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+
+	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET,
+	       csi2phy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
+	usleep_range(5000, 8000);
+	writel(0x0, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
+}
+
+/*
+ * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
+ *
+ * Helper function to calculate settle count value. This is
+ * based on the CSI2 T_hs_settle parameter which in turn
+ * is calculated based on the CSI2 transmitter link frequency.
+ *
+ * Return settle count value or 0 if the CSI2 link frequency
+ * is not available
+ */
+static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
+{
+	u32 t_hs_prepare_max_ps;
+	u32 timer_period_ps;
+	u32 t_hs_settle_ps;
+	u8 settle_cnt;
+	u32 ui_ps;
+
+	if (link_freq <= 0)
+		return 0;
+
+	ui_ps = div_u64(PSEC_PER_SEC, link_freq);
+	ui_ps /= 2;
+	t_hs_prepare_max_ps = 85000 + 6 * ui_ps;
+	t_hs_settle_ps = t_hs_prepare_max_ps;
+
+	timer_period_ps = div_u64(PSEC_PER_SEC, timer_clk_rate);
+	settle_cnt = t_hs_settle_ps / timer_period_ps - 6;
+
+	return settle_cnt;
+}
+
+static void
+phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
+				     u8 settle_cnt)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
+	int i, array_size = regs->lane_array_size;
+	u32 val;
+
+	for (i = 0; i < array_size; i++, r++) {
+		switch (r->param_type) {
+		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
+			val = settle_cnt & 0xff;
+			break;
+		case CSIPHY_SKEW_CAL:
+			/* TODO: support application of skew from dt flag */
+			continue;
+		default:
+			val = r->reg_data;
+			break;
+		}
+		writel(val, csi2phy->base + r->reg_addr);
+		if (r->delay_us)
+			udelay(r->delay_us);
+	}
+}
+
+static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
+					   struct mipi_csi2phy_stream_cfg *cfg)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
+	u8 settle_cnt;
+	u8 val;
+	int i;
+
+	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
+
+	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	for (i = 0; i < cfg->num_data_lanes; i++)
+		val |= BIT(lane_cfg->data[i].pos * 2);
+
+	writel(val, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
+
+	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
+	writel(val, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
+
+	val = 0x02;
+	writel(val, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 7));
+
+	val = 0x00;
+	writel(val, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
+
+	phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
+
+	/* IRQ_MASK registers - disable all interrupts */
+	for (i = CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++) {
+		writel(0, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, i));
+	}
+
+	return 0;
+}
+
+static void
+phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
+				 struct mipi_csi2phy_stream_cfg *cfg)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+
+	writel(0, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
+
+	writel(0, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
+}
+
+static const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
+	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
+	.reset = phy_qcom_mipi_csi2_reset,
+	.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
+	.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
+};
+
+static const struct mipi_csi2phy_clk_freq zero = { 0 };
+
+static const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
+	.freq = {
+		300000000, 400000000, 480000000
+	},
+	.num_freq = 3,
+};
+
+static const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
+	.freq = {
+		266666667, 400000000
+	},
+	.num_freq = 2,
+};
+
+static const char * const x1e_clks[] = {
+	"camnoc_axi",
+	"cpas_ahb",
+	"csiphy",
+	"csiphy_timer"
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.generation = GEN2,
+	},
+	.supply_names = (const char *[]){
+		"vdda-0p8",
+		"vdda-1p2"
+	},
+	.num_supplies = 2,
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.opp_clk = x1e_clks[2],
+	.timer_clk = x1e_clks[3],
+	.clk_freq = {
+		zero,
+		zero,
+		dphy_4nm_x1e_csiphy,
+		dphy_4nm_x1e_csiphy_timer,
+	},
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
new file mode 100644
index 0000000000000..454144f81b719
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Linaro Ltd.
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_opp.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "phy-qcom-mipi-csi2.h"
+
+#define CAMSS_CLOCK_MARGIN_NUMERATOR 105
+#define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
+
+static inline void phy_qcom_mipi_csi2_add_clock_margin(u64 *rate)
+{
+	*rate *= CAMSS_CLOCK_MARGIN_NUMERATOR;
+	*rate = div_u64(*rate, CAMSS_CLOCK_MARGIN_DENOMINATOR);
+}
+
+static int
+phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
+				   s64 link_freq)
+{
+	const struct mipi_csi2phy_soc_cfg *soc_cfg = csi2phy->soc_cfg;
+	unsigned long rates[MAX_CSI2PHY_CLKS] = {0};
+	struct device *dev = csi2phy->dev;
+	unsigned long vote_freq = 0;
+	int i, j;
+	int ret;
+
+	for (i = 0; i < soc_cfg->num_clk; i++) {
+		const struct mipi_csi2phy_clk_freq *clk_freq = &soc_cfg->clk_freq[i];
+		const char *clk_name = soc_cfg->clk_names[i];
+		struct clk *clk = csi2phy->clks[i].clk;
+		u64 min_rate = link_freq / 4;
+		long round_rate;
+
+		phy_qcom_mipi_csi2_add_clock_margin(&min_rate);
+
+		/* This clock should be enabled only not set */
+		if (!clk_freq->num_freq)
+			continue;
+
+		for (j = 0; j < clk_freq->num_freq; j++)
+			if (min_rate < clk_freq->freq[j])
+				break;
+
+		if (j == clk_freq->num_freq) {
+			dev_err(dev,
+				"Pixel clock %llu is too high for %s\n",
+				min_rate, clk_name);
+			return -EINVAL;
+		}
+
+		/* if sensor pixel clock is not available
+		 * set highest possible CSIPHY clock rate
+		 */
+		if (min_rate == 0)
+			j = clk_freq->num_freq - 1;
+
+		round_rate = clk_round_rate(clk, clk_freq->freq[j]);
+		if (round_rate < 0) {
+			dev_err(dev, "clk round rate failed: %ld\n",
+				round_rate);
+			return -EINVAL;
+		}
+
+		rates[i] = round_rate;
+
+		if (!strcmp(clk_name, soc_cfg->timer_clk))
+			csi2phy->timer_clk_rate = round_rate;
+
+		if (!strcmp(clk_name, soc_cfg->opp_clk))
+			vote_freq = round_rate;
+	}
+
+	if (!vote_freq) {
+		dev_err(dev, "Unable to find operating point frequency\n");
+		return -ENODEV;
+	};
+
+	dev_dbg(dev, "OPP freq: %lu Hz\n", vote_freq);
+
+	ret = dev_pm_opp_set_rate(dev, vote_freq);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set OPP rate: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < soc_cfg->num_clk; i++) {
+		if (rates[i] == 0)
+			continue;
+
+		dev_dbg(dev, "Setting clk %s to %lu Hz\n",
+			soc_cfg->clk_names[i], rates[i]);
+
+		ret = clk_set_rate(csi2phy->clks[i].clk, rates[i]);
+		if (ret < 0) {
+			dev_err(dev, "clk_set_rate failed for %s: %d\n",
+				soc_cfg->clk_names[i], ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int phy_qcom_mipi_csi2_configure(struct phy *phy,
+					union phy_configure_opts *opts)
+{
+	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
+	struct phy_configure_opts_mipi_dphy *dphy_cfg_opts = &opts->mipi_dphy;
+	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
+	int ret;
+	int i;
+
+	ret = phy_mipi_dphy_config_validate(dphy_cfg_opts);
+	if (ret)
+		return ret;
+
+	if (dphy_cfg_opts->lanes < 1 || dphy_cfg_opts->lanes > CSI2_MAX_DATA_LANES)
+		return -EINVAL;
+
+	stream_cfg->combo_mode = 0;
+	stream_cfg->link_freq = dphy_cfg_opts->hs_clk_rate;
+	stream_cfg->num_data_lanes = dphy_cfg_opts->lanes;
+
+	/*
+	 * phy_configure_opts_mipi_dphy.lanes starts from zero to
+	 * the maximum number of enabled lanes.
+	 *
+	 * TODO: add support for bitmask of enabled lanes and polarities
+	 * of those lanes to the phy_configure_opts_mipi_dphy struct.
+	 * For now take the polarities as zero and the position as fixed
+	 * this is fine as no current upstream implementation maps otherwise.
+	 */
+	for (i = 0; i < stream_cfg->num_data_lanes; i++) {
+		stream_cfg->lane_cfg.data[i].pol = 0;
+		stream_cfg->lane_cfg.data[i].pos = i;
+	}
+
+	stream_cfg->lane_cfg.clk.pol = 0;
+	stream_cfg->lane_cfg.clk.pos = 7;
+
+	return 0;
+}
+
+static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
+{
+	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
+	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
+	struct device *dev = &phy->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
+				    csi2phy->supplies);
+	if (ret)
+		return ret;
+
+	ret = phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stream_cfg.link_freq);
+	if (ret)
+		goto poweroff_phy;
+
+	ret = clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
+				      csi2phy->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks, %d\n", ret);
+		goto poweroff_phy;
+	}
+
+	ops->reset(csi2phy);
+
+	ops->hw_version_read(csi2phy);
+
+	return ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
+
+poweroff_phy:
+	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
+			       csi2phy->supplies);
+
+	return ret;
+}
+
+static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
+{
+	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
+
+	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
+				   csi2phy->clks);
+	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
+			       csi2phy->supplies);
+
+	return 0;
+}
+
+static const struct phy_ops phy_qcom_mipi_csi2_ops = {
+	.configure	= phy_qcom_mipi_csi2_configure,
+	.power_on	= phy_qcom_mipi_csi2_power_on,
+	.power_off	= phy_qcom_mipi_csi2_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
+{
+	unsigned int i, num_clk, num_supplies;
+	struct mipi_csi2phy_device *csi2phy;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy *generic_phy;
+	int ret;
+
+	csi2phy = devm_kzalloc(dev, sizeof(*csi2phy), GFP_KERNEL);
+	if (!csi2phy)
+		return -ENOMEM;
+
+	csi2phy->dev = dev;
+	csi2phy->soc_cfg = device_get_match_data(&pdev->dev);
+
+	if (!csi2phy->soc_cfg)
+		return -EINVAL;
+
+	num_clk = csi2phy->soc_cfg->num_clk;
+	csi2phy->clks = devm_kzalloc(dev, sizeof(*csi2phy->clks) * num_clk, GFP_KERNEL);
+	if (!csi2phy->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_clk; i++)
+		csi2phy->clks[i].id = csi2phy->soc_cfg->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, num_clk, csi2phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	num_supplies = csi2phy->soc_cfg->num_supplies;
+	csi2phy->supplies = devm_kzalloc(dev, sizeof(*csi2phy->supplies) * num_supplies,
+					 GFP_KERNEL);
+	if (!csi2phy->supplies)
+		return -ENOMEM;
+
+	for (i = 0; i < num_supplies; i++)
+		csi2phy->supplies[i].supply = csi2phy->soc_cfg->supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, num_supplies, csi2phy->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulator supplies\n");
+
+	csi2phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi2phy->base))
+		return PTR_ERR(csi2phy->base);
+
+	generic_phy = devm_phy_create(dev, NULL, &phy_qcom_mipi_csi2_ops);
+	if (IS_ERR(generic_phy)) {
+		ret = PTR_ERR(generic_phy);
+		return dev_err_probe(dev, ret, "failed to create phy\n");
+	}
+	csi2phy->phy = generic_phy;
+
+	phy_set_drvdata(generic_phy, csi2phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (!IS_ERR(phy_provider))
+		dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
+
+static struct platform_driver phy_qcom_mipi_csi2_driver = {
+	.probe		= phy_qcom_mipi_csi2_probe,
+	.driver = {
+		.name	= "qcom-mipi-csi2-phy",
+		.of_match_table = phy_qcom_mipi_csi2_of_match_table,
+	},
+};
+
+module_platform_driver(phy_qcom_mipi_csi2_driver);
+
+MODULE_DESCRIPTION("Qualcomm MIPI CSI2 PHY driver");
+MODULE_AUTHOR("Bryan O'Donoghue <bryan.odonoghue@linaro.org>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
new file mode 100644
index 0000000000000..4f3a245ba6a53
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *
+ * Qualcomm MIPI CSI2 CPHY/DPHY driver
+ *
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+#ifndef __PHY_QCOM_MIPI_CSI2_H__
+#define __PHY_QCOM_MIPI_CSI2_H__
+
+#include <linux/phy/phy.h>
+
+#define CSI2_MAX_DATA_LANES 4
+
+struct mipi_csi2phy_lane {
+	u8 pos;
+	u8 pol;
+};
+
+struct mipi_csi2phy_lanes_cfg {
+	struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
+	struct mipi_csi2phy_lane clk;
+};
+
+struct mipi_csi2phy_stream_cfg {
+	u8 combo_mode;
+	s64 link_freq;
+	u8 num_data_lanes;
+	struct mipi_csi2phy_lanes_cfg lane_cfg;
+};
+
+struct mipi_csi2phy_device;
+
+struct mipi_csi2phy_hw_ops {
+	void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
+	void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
+	int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
+			    struct mipi_csi2phy_stream_cfg *cfg);
+	void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
+			      struct mipi_csi2phy_stream_cfg *cfg);
+};
+
+struct mipi_csi2phy_lane_regs {
+	const s32 reg_addr;
+	const s32 reg_data;
+	const u32 delay_us;
+	const u32 param_type;
+};
+
+struct mipi_csi2phy_device_regs {
+	const struct mipi_csi2phy_lane_regs *init_seq;
+	const int lane_array_size;
+	const u32 common_regs_offset;
+	enum  {
+		GEN1 = 0,
+		GEN1_660,
+		GEN1_670,
+		GEN2,
+	} generation;
+};
+
+#define MAX_CSI2PHY_CLKS 8
+struct mipi_csi2phy_clk_freq {
+	u32 num_freq;
+	u32 freq[MAX_CSI2PHY_CLKS];
+};
+
+struct mipi_csi2phy_soc_cfg {
+	const struct mipi_csi2phy_hw_ops *ops;
+	const struct mipi_csi2phy_device_regs reg_info;
+
+	const char ** const supply_names;
+	const unsigned int num_supplies;
+
+	const char ** const clk_names;
+	const unsigned int num_clk;
+
+	const char * const opp_clk;
+	const char * const timer_clk;
+
+	const struct mipi_csi2phy_clk_freq clk_freq[];
+};
+
+struct mipi_csi2phy_device {
+	struct device *dev;
+
+	struct phy *phy;
+	void __iomem *base;
+
+	struct clk_bulk_data *clks;
+	struct regulator_bulk_data *supplies;
+	u32 timer_clk_rate;
+
+	const struct mipi_csi2phy_soc_cfg *soc_cfg;
+	struct mipi_csi2phy_stream_cfg stream_cfg;
+
+	u32 hw_version;
+};
+
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+
+#endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.52.0


