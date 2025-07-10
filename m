Return-Path: <linux-media+bounces-37336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE4B0085F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 18:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6B21CA0123
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798572F0055;
	Thu, 10 Jul 2025 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnZ+Fl+8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1832EFD9E
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164218; cv=none; b=NDp3lNGiMuz+orlFRDGAIO72VC/bOw3EvbnM/OIur0HrrEAvsvluUnmwi6/JwNO/KEwZRPF1w3g4Kmjt2HUZwlxXFE6KjlKuPa1LsXILKSnygC2Wjg2FFBZvWvwmwIHJdjCYgD9+WSroP+AnJJ+7BuLtnlVy6x9a3HLg/COztUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164218; c=relaxed/simple;
	bh=OWPD9PGXodMtjZ3cv1bKY6Ymj/PitKrkTDsQ4Purvoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBSM6yfEg925BXw1TIdocPO0gum8/4qbFTKEM/GaBLYD2djTZ1DskkjfoRQEIzzk+Ru8PAGFk+QGNDcn47I/NXTNvCUHLw0eSHIjRoaSz1/SJHca57MyOvdZog47sIWMHeyH3v5nrO7JXW+bLJP7LHqPL3w+07cbL/sQIKx7ews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hnZ+Fl+8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a54690d369so1192487f8f.3
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 09:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752164213; x=1752769013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAICERzxd9sdyaM1ityhKEE91RgYWGS0XNY5rc0wQP0=;
        b=hnZ+Fl+8/1p+W2GZMS/4nDEzMPaHEiciLNLNwTOhoFivMIXL+muRmlEIEGfV0AdmcD
         8nBjEqmezKPXmk/gAvTlQTtpM69Vt4EQoMtuju//5NHrFswlPGqHcEYGTmoMEkcnrQAj
         wbWKwetK7CImknRHOQbYXVvl+mUelarEpdzlxPO5bYTaoxx6apiMAnAOH0W7qR9YHSgL
         3O9/xGLXd6xmIH5My9XwWY65DFHsiQdjf0FXHv+coXjw0jLJRxQk88gi9mbz3WGQOtXl
         0C8W0INtNsOPbcUawG2kzmUj9GSeAEjLvnw/o1tN2QQSgVlt7Nax1Mzd6cL6gSsA2Vi5
         pcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164213; x=1752769013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAICERzxd9sdyaM1ityhKEE91RgYWGS0XNY5rc0wQP0=;
        b=mWolmymOdHS8hUzZE+x7IJY2Bp32rUuhwXTi9jmziz3NtHzTD7RWYjtFIn7qtMln5q
         WncqvawzcjSys/zdCR6maerzFzxmRJGYCd1nn7I7mZpT4rt9NmZuffJSE6UA7ap18Rjg
         oUMHlDKhKmdFG5ZZRG3mlu8LVsA/GcNvl/Tifg7/X9e0EkUa89vV8kCww3p/h1/lr1EP
         HCozAimJbJbZgUvQNJwV7fSCbeSFFN/tYAtVRyraKVliKj7dQrN/th3hfXpQXM7mXegq
         LBVns8agUUMh5f+rsl9ijJfLrdM8iBtU0+Cs17bzfBudu6Xu6PwKi1LrKUCCxOV6zqgF
         PUdw==
X-Forwarded-Encrypted: i=1; AJvYcCUCMwNZ7T7M9BRbJJM0B44+LPlTTxQHZl7oWeMEta0+bhOIzsT4Ry5idB9rGUQGiDuxzo26T36sFhnFnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9EpgaVoLrGDbfCjX9trBEOjvdR7GmlxY711EmiRB7ibd0EQL
	CZDmel7qkfQMsk4YubIMDJyrIyYXVITH0c9OeC3x9BDtqfguTVkxPWQBkqTaubiScn0=
X-Gm-Gg: ASbGncugQB+9UPIBCiOr+yT/NIrxhi/ih7BHQoQ86Nw2TGvz9k8XsKz136xbDu0bDCZ
	kJm+egfKNmjmZZESGhBqdEOuulluGtZTGrbmDRh4VBH8PiZOFTyLjk7ybVEsTGArcRxiYp1dZSc
	VVtHMc5/wJXsVZlbONs0OyYR9skWiQ2zemPVFQoV7XTWF5dtBJI+ctqOO4lUpp0Tu5bFbAovEtY
	tOlxXsFe5LRUltsxd3aHIJJV33r9hVmajti3s5/T8Rbz+sN8lfrb+C+cj2DqDR1G4xMQqasJn3f
	wizQ7Etarf34Kq6Ea3GUsswNzZCKT6hyts8qPoS9pmjSzAJgsIguYJW+of/MrJ9xoRUbU7+MWrK
	LHNWbyncwVJ/FyV1XHRnpy/eOUJXubrO3Z69ma+E=
X-Google-Smtp-Source: AGHT+IHWikfJKVBLu7+5FocjbPC9OurmErRpiXDqCrZqJyjGECRiA98fvrWX3bT69BsregE5Jd+3JQ==
X-Received: by 2002:a05:6000:2a05:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3b5f1868f4cmr104275f8f.15.1752164212852;
        Thu, 10 Jul 2025 09:16:52 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm2314207f8f.34.2025.07.10.09.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:16:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 10 Jul 2025 17:16:48 +0100
Subject: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
In-Reply-To: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=33110;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=OWPD9PGXodMtjZ3cv1bKY6Ymj/PitKrkTDsQ4Purvoo=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBob+dwBn2W8Whiwxovciab8Q4pw2hlNYwpFJWNG
 P6QLg1JBl6JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaG/ncAAKCRAicTuzoY3I
 OsQWEACI4g6C7Vf2BtRuoQv1yR42WPGmo/S2WzH+F+rIevidJBc3ZL/AqJsB9CW2UPu9tLzfskR
 FeykcssZE+cpGB8ngPH66rygqWon9iVbR/ljRhnD33fJRezdJsMz2hb11fWvnB9vKNhmqKkkBhN
 WtkqeAfF4HQTP4lJm9AMAFjTyjNejcryTHiaT1TUb8ACoqKuvKDEXZmd9f0Zkd3ZjVc1O/KcLhk
 zJFrRKIWsoDEQiPJ570INyf4nTY9EMM4kpU0SgC1k5gkfw/VHeAOGkL+FZcvOb/jzNMcv4AmxzM
 9uIvFR6LcNn/ImNKBEAtn9t/N/Nl446UQAnsE8kgUAyKE8fT3v/JBhJsm86dHILxI3GktdtIamt
 NcsGVG/9kQMeFxmS8BV7qk5m5WNwcAgD9GdUlCrdBbW9yK3PNTtZMlPqu0HSFh3oe1BX4+rmdsJ
 ghkH0D6hRA7nubc7A5a1spvoaDUIqrV4zWex72Yflr/b7QjtK462TbSoK+Mm1QRdO/0n/E/04Cq
 LeEozLUASi8v+ImX4fVM5Y5sS8QrLqITgsDC2rTULulWXh1BzAyXA/E6aWOvlulvtKOMdjS2dba
 jrifn0k1UgFf334KaODhvTZs+YD0NEWcNyJf3odxxsFwOp068l5Z/hnSg5VFAeVMe6/gQsbnenY
 M4KP/o4S4HFZ/nQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a new MIPI CSI2 driver in D-PHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

In-line with other PHY drivers the process node name is omitted from the
compat string while the soc name is included.

At the moment we follow the assignment of lane positions - the bitmap of
physical input lanes to logical lane numbers as a linear list per the
existing DPHY @lanes data-member.

This is fine for us in upstream since we also map the lanes contiguously
but, our hardware can support different lane mappings so we should in the
future extend out the DPHY structure to capture the mapping.

The Qualcomm 3PH class of PHYs can do both D-PHY and C-PHY mode. For now only
D-PHY is supported.

In porting some of the logic over from camss-csiphy*.c to here its also
possible to rationalise some of the code.

In particular use of regulator_bulk and clk_bulk as well as dropping the
seemingly useless and unused interrupt handler.

The PHY sequences and a lot of the logic that goes with them are well proven
in CAMSS and mature so the main thing to watch out for here is how to get
the right sequencing of regulators, clocks and register-writes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   6 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 491 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 281 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 101 +++++
 6 files changed, 901 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ef99240a57ed1ad0d4501998970c7c3b85d3b81..69519e2d6dfb65771a3245735283645bb50a249a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20536,6 +20536,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
 
+QUALCOMM MIPI CSI2 PHY DRIVER
+M:	Bryan O'Donoghue <bod@kernel.org>
+L:	linux-phy@lists.infradead.org
+L:	linux-media@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
+F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
+F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
+F:	include/dt-bindings/phy/phy-qcom-mipi-csi2*
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ef14f4e33973cff4103d8ea3b07cfd62d344e450..d0ab70827519c2b046d0fb03c14bb4d8ae2ec9a1 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -28,6 +28,17 @@ config PHY_QCOM_EDP
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
+	  Qualcomm chipsets.
+
 config PHY_QCOM_IPQ4019_USB
 	tristate "Qualcomm IPQ4019 USB PHY driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 3851e28a212d4a677a5b41805868f38b9ab49841..67013d27cb0387b9d65dcbe030ea6e5eaaabbe91 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,6 +5,12 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
+
+phy-qcom-mipi-csi2-objs			+= phy-qcom-mipi-csi2-core.o \
+					   phy-qcom-mipi-csi2-3ph-dphy.o
+
+obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)	+= phy-qcom-mipi-csi2.o
+
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
new file mode 100644
index 0000000000000000000000000000000000000000..1a99efee88cc94ec0d29a335cd29f88af8a00c02
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-phy_qcom_mipi_csi2-3ph-1-0.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0
+ *
+ * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2016-2025 Linaro Ltd.
+ */
+#define DEBUG
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+
+#include "phy-qcom-mipi-csi2.h"
+
+#define CSIPHY_3PH_LNn_CFG1(n)				(0x000 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG		(BIT(7) | BIT(6))
+#define CSIPHY_3PH_LNn_CFG2(n)				(0x004 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT		BIT(3)
+#define CSIPHY_3PH_LNn_CFG3(n)				(0x008 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG4(n)				(0x00c + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS		0xa4
+#define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660		0xa5
+#define CSIPHY_3PH_LNn_CFG5(n)				(0x010 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG5_T_HS_DTERM			0x02
+#define CSIPHY_3PH_LNn_CFG5_HS_REC_EQ_FQ_INT		0x50
+#define CSIPHY_3PH_LNn_TEST_IMP(n)			(0x01c + 0x100 * (n))
+#define CSIPHY_3PH_LNn_TEST_IMP_HS_TERM_IMP		0xa
+#define CSIPHY_3PH_LNn_MISC1(n)				(0x028 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_MISC1_IS_CLKLANE			BIT(2)
+#define CSIPHY_3PH_LNn_CFG6(n)				(0x02c + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG6_SWI_FORCE_INIT_EXIT		BIT(0)
+#define CSIPHY_3PH_LNn_CFG7(n)				(0x030 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG7_SWI_T_INIT			0x2
+#define CSIPHY_3PH_LNn_CFG8(n)				(0x034 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG8_SWI_SKIP_WAKEUP		BIT(0)
+#define CSIPHY_3PH_LNn_CFG8_SKEW_FILTER_ENABLE		BIT(1)
+#define CSIPHY_3PH_LNn_CFG9(n)				(0x038 + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CFG9_SWI_T_WAKEUP		0x1
+#define CSIPHY_3PH_LNn_CSI_LANE_CTRL15(n)		(0x03c + 0x100 * (n))
+#define CSIPHY_3PH_LNn_CSI_LANE_CTRL15_SWI_SOT_SYMBOL	0xb8
+
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
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
+	{0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+};
+
+static inline const struct mipi_csi2phy_device_regs *
+csi2phy_dev_to_regs(const struct mipi_csi2phy_device *csi2phy)
+{
+	return &csi2phy->soc_cfg->reg_info;
+}
+
+static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	u32 hw_version;
+
+	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
+
+	hw_version = readl_relaxed(csi2phy->base +
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
+	hw_version |= readl_relaxed(csi2phy->base +
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
+	hw_version |= readl_relaxed(csi2phy->base +
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
+	hw_version |= readl_relaxed(csi2phy->base +
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
+
+	csi2phy->hw_version = hw_version;
+
+	dev_dbg(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
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
+	writel_relaxed(0x1, csi2phy->base +
+		      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
+	usleep_range(5000, 8000);
+	writel_relaxed(0x0, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
+}
+
+static irqreturn_t phy_qcom_mipi_csi2_isr(int irq, void *dev)
+{
+	const struct mipi_csi2phy_device *csi2phy = dev;
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	int i;
+
+	for (i = 0; i < 11; i++) {
+		int c = i + 22;
+		u8 val = readl_relaxed(csi2phy->base +
+				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
+
+		writel_relaxed(val, csi2phy->base +
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
+	}
+
+	writel_relaxed(0x1, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
+	writel_relaxed(0x0, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
+
+	for (i = 22; i < 33; i++) {
+		writel_relaxed(0x0, csi2phy->base +
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
+	}
+
+	return IRQ_HANDLED;
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
+	u32 ui; /* ps */
+	u32 timer_period; /* ps */
+	u32 t_hs_prepare_max; /* ps */
+	u32 t_hs_settle; /* ps */
+	u8 settle_cnt;
+
+	if (link_freq <= 0)
+		return 0;
+
+	ui = div_u64(1000000000000LL, link_freq);
+	ui /= 2;
+	t_hs_prepare_max = 85000 + 6 * ui;
+	t_hs_settle = t_hs_prepare_max;
+
+	timer_period = div_u64(1000000000000LL, timer_clk_rate);
+	settle_cnt = t_hs_settle / timer_period - 6;
+
+	return settle_cnt;
+}
+
+static void phy_qcom_mipi_csi2_gen1_config_lanes(struct mipi_csi2phy_device *csi2phy,
+						 struct mipi_csi2phy_stream_cfg *cfg,
+						 u8 settle_cnt)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
+	int i, l = 0;
+	u8 val;
+
+	for (i = 0; i <= cfg->num_data_lanes; i++) {
+		if (i == cfg->num_data_lanes)
+			l = 7;
+		else
+			l = lane_cfg->data[i].pos * 2;
+
+		val = CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG;
+		val |= 0x17;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG1(l));
+
+		val = CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG2(l));
+
+		val = settle_cnt;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG3(l));
+
+		val = CSIPHY_3PH_LNn_CFG5_T_HS_DTERM |
+			CSIPHY_3PH_LNn_CFG5_HS_REC_EQ_FQ_INT;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG5(l));
+
+		val = CSIPHY_3PH_LNn_CFG6_SWI_FORCE_INIT_EXIT;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG6(l));
+
+		val = CSIPHY_3PH_LNn_CFG7_SWI_T_INIT;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG7(l));
+
+		val = CSIPHY_3PH_LNn_CFG8_SWI_SKIP_WAKEUP |
+			CSIPHY_3PH_LNn_CFG8_SKEW_FILTER_ENABLE;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG8(l));
+
+		val = CSIPHY_3PH_LNn_CFG9_SWI_T_WAKEUP;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG9(l));
+
+		val = CSIPHY_3PH_LNn_TEST_IMP_HS_TERM_IMP;
+		writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_TEST_IMP(l));
+
+		val = CSIPHY_3PH_LNn_CSI_LANE_CTRL15_SWI_SOT_SYMBOL;
+		writel_relaxed(val, csi2phy->base +
+				    CSIPHY_3PH_LNn_CSI_LANE_CTRL15(l));
+	}
+
+	val = CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG;
+	writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG1(l));
+
+	if (regs->generation == GEN1_660)
+		val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660;
+	else
+		val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS;
+	writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_CFG4(l));
+
+	val = CSIPHY_3PH_LNn_MISC1_IS_CLKLANE;
+	writel_relaxed(val, csi2phy->base + CSIPHY_3PH_LNn_MISC1(l));
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
+		switch (r->mipi_csi2phy_param_type) {
+		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
+			val = settle_cnt & 0xff;
+			break;
+		case CSIPHY_SKEW_CAL:
+			/* TODO: support application of skew from dt flag */
+			continue;
+		case CSIPHY_DNP_PARAMS:
+			continue;
+		default:
+			val = r->reg_data;
+			break;
+		}
+		writel_relaxed(val, csi2phy->base + r->reg_addr);
+		if (r->delay_us)
+			udelay(r->delay_us);
+	}
+}
+
+static bool phy_qcom_mipi_csi2_is_gen2(struct mipi_csi2phy_device *csi2phy)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+
+	return regs->generation == GEN2;
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
+	writel_relaxed(val, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
+
+	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
+	writel_relaxed(val, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
+
+	val = 0x02;
+	writel_relaxed(val, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
+
+	val = 0x00;
+	writel_relaxed(val, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
+
+	if (phy_qcom_mipi_csi2_is_gen2(csi2phy))
+		phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
+	else
+		phy_qcom_mipi_csi2_gen1_config_lanes(csi2phy, cfg, settle_cnt);
+
+	/* IRQ_MASK registers - disable all interrupts */
+	for (i = 11; i < 22; i++) {
+		writel_relaxed(0, csi2phy->base +
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
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
+	writel_relaxed(0, csi2phy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
+
+	writel_relaxed(0, csi2phy->base +
+			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
+}
+
+static int phy_qcom_mipi_csi2_init(struct mipi_csi2phy_device *csi2phy)
+{
+	return 0;
+}
+
+const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
+	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
+	.reset = phy_qcom_mipi_csi2_reset,
+	.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
+	.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
+	.isr = phy_qcom_mipi_csi2_isr,
+	.init = phy_qcom_mipi_csi2_init,
+};
+
+const struct mipi_csi2phy_clk_freq zero = { 0 };
+
+const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
+	.freq = {
+		300000000, 400000000, 480000000
+	},
+	.num_freq = 3,
+};
+
+const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
+	.freq = {
+		266666667, 400000000
+	},
+	.num_freq = 2,
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.offset = 0x1000,
+		.generation = GEN2,
+	},
+	.supply_names = (const char *[]){
+		"vdda-0p8",
+		"vdda-1p2"
+	},
+	.num_supplies = 2,
+	.clk_names = (const char *[]) {
+		"camnoc_axi",
+		"cpas_ahb",
+		"csiphy",
+		"csiphy_timer"
+	},
+	.num_clk = 4,
+	.clk_freq = {
+		zero,
+		zero,
+		dphy_4nm_x1e_csiphy,
+		dphy_4nm_x1e_csiphy_timer,
+	},
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..1def2d1258d9dd3835c09c6804e08dfffc184248
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Linaro Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
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
+	struct device *dev = csi2phy->dev;
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
+		csi2phy->timer_clk_rate = round_rate;
+
+		dev_dbg(dev, "set clk %s %lu Hz\n",
+			clk_name, round_rate);
+
+		ret = clk_set_rate(clk, csi2phy->timer_clk_rate);
+		if (ret < 0) {
+			dev_err(dev, "clk set rate failed: %d\n", ret);
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
+	if (ret) {
+		dev_err(dev, "Failed to get clocks %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(num_clk, csi2phy->clks);
+	if (ret) {
+		dev_err(dev, "apq8016 clk_enable failed\n");
+		return ret;
+	}
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
+		dev_err(dev, "failed to create phy, %d\n", ret);
+		return ret;
+	}
+	csi2phy->phy = generic_phy;
+
+	phy_set_drvdata(generic_phy, csi2phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (!IS_ERR(phy_provider))
+		dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");
+	else
+		pm_runtime_disable(dev);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,x1e80100-mipi-csi2-combo-phy", .data = &mipi_csi2_dphy_4nm_x1e },
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
+MODULE_DESCRIPTION("Bryan O'Donoghue <bryan.odonoghue@linaro.org>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
new file mode 100644
index 0000000000000000000000000000000000000000..adcb371c9bf6fb7b2a3282f810c578966aca9b5f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -0,0 +1,101 @@
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
+	irqreturn_t (*isr)(int irq, void *dev);
+	int (*init)(struct mipi_csi2phy_device *csi2phy_dev);
+};
+
+struct mipi_csi2phy_lane_regs {
+	const s32 reg_addr;
+	const s32 reg_data;
+	const u32 delay_us;
+	const u32 mipi_csi2phy_param_type;
+};
+
+struct mipi_csi2phy_device_regs {
+	const struct mipi_csi2phy_lane_regs *init_seq;
+	const int lane_array_size;
+	const u32 offset;
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
2.49.0


