Return-Path: <linux-media+bounces-66928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CfBKLHOOTWpk2AEAu9opvQ
	(envelope-from <linux-media+bounces-66928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 01:40:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D405C72073C
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 01:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=BXbuHzL4;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66928-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66928-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E83313053DC6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 23:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C328438552C;
	Tue,  7 Jul 2026 23:39:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A05381AEF
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 23:39:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467554; cv=none; b=EFrQ4FXz/o/Dj3GCabOsVUPMOiB0ofPaT3kJAlETR6J7c/JKkFz6wI1sM85Nf5d4vHJWA1Aw30H851cyUG37DeIV37OLWmiaBTrlNmQhx1yjxGIKHuW4qMayW0d4pfiq691aiTC4jXq55WEgfq0lI2Ft/yB3RVLhtZPePpcoQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467554; c=relaxed/simple;
	bh=s7RS5IXj5Q5a2Dst/ehr19qd7F/hhQ5jArzu8wHSrKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Orce4mOZJdCBjt7Vv/7qRDl5W3zPcgHoqGQYO0gMpvcybBFD+JQntUUms4U2SNXtd4Gl5W7Y3/18Ak/dRFJjaiHOyY8k67gMx8bANq6/l70En3SZuuB3RDVAskGOF8Bfj1EZdHPI1GqCkGVJK46OYh7+B+5RfsaqoLNVxH4Tm0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXbuHzL4; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so399565e9.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783467549; x=1784072349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkwTqpfsMdlh5LVd3MM7twwQLVF1PUUECldvygRyku8=;
        b=BXbuHzL4/u3ktNc1B9bqw0nlmeQlf4Dj9sUFe4V9LJM1zsLx5cHOggHK2v+CiM90fh
         pFCA9Clx+XIGaFTNo6uKZh4EA0pS87JRBCKJtXeDYGKn02K8QsSR8uegDMTvxfwIlOHw
         1W2RTyIiy/bbd0U6U4tprrVpYKJjFB3cGRiKu6Bl4gU3QAYLGZsQgL+kdbsAUue1yE+W
         zvOlZr18B+6ZygV/AOMdqCyzVp1uLrSB/sH1ViRLsgH20w0t3pQ1kjc3nkXRPg1yvrzk
         uzn7pDdNzhKYUrPcWHjlowWMUZBbwH7xEVAfWIW9uHeQQTjgaLXXMkKhm5JALB9QMjZ8
         vgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783467549; x=1784072349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkwTqpfsMdlh5LVd3MM7twwQLVF1PUUECldvygRyku8=;
        b=XgP81/U6oK9uPQqaAaZer0G6vOxCoWbJ2V2VUZIAvjzSu7aUKC0HQ8cdi8fhlWmgGP
         +GRcjMurppva+HJrIqg9tcytRPhWNNGzCmUTuwwuj/rht/9/MbbpBPK0GB//fAJxclCO
         +cQGTxzWXtF10CPflIK3ULD97SfbR7AyVeP0lLZKwUCdWwaIYhWUNP09hh6cfOXJCrqv
         pUCcxT3UFsp2Q8WgHMNzyUQDWx7CfPZ5iaMTaTYvY6/pwgrImk0MaijF8lDFAPEoPok7
         Ee+xUIiMn1WpG4K414qH4Y/B9JrU+NsW2ToKFMTeNIgeCwuWVH1a87FljT7qafOkrKTD
         OfZw==
X-Forwarded-Encrypted: i=1; AHgh+RrkM1f8n4tc1DiM4APmDkKXmBtAn5djwucXFaxB2eHFqWtGaqiNA95V4GEk5UPepdhXZoB/Pwlku1aZ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhBGpmo8NOTC35kP+cpLJhQ2KfTXJ2/wKXNRaGWiOee7kWJYby
	NDioudn1AB9U1d3lHPBBAlu8EBcsq8Hq35W9v6+eG+oEvpNEi2milb2OtBDx8LZ3B6E=
X-Gm-Gg: AfdE7cktaxJmXaZCxYV7Ru1KhWbXn6b98b92y56fVIeve9QZGrQts+1yufKYnzToVe4
	sztpbUOKWtwKtzFOTZCF3BALzBRA0c4Q5r62euKWZZEssatk5VEj7BgNB+2x7beAoS2XBcrOwyV
	YoOfcpuzxskzdPVAAbOgWkRGjJdQTT0DmZQUtotxBMCEaBvKOYu91FGo781jWrskcG+aq6s9SVO
	7U6bk8i26FMaL9vJGCGH0uKd9IRcq+Q/Azlnh4dbk2+ROwSswHMv5j+8ULRUarbk6YQFaHIH8kC
	oH1n4Iisj+eWnqeRI6YNyFS2KibW7HcvVu5bKPFkrHYYP4HX7jKRxD8rkbOnC47H6SZJUn+CK2a
	9prEJkKtMHXRSHS9WC76EblftGvNC/ci8o4WfUxYXy5f7QdwdRCtnUBiia9y4oT35thlGVhxC+T
	S/FTNA/4Lf6UuMvVb1a5P9FyNjE0HQs4ODAA==
X-Received: by 2002:a05:600c:6096:b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493df0a0bdfmr87402965e9.34.1783467549048;
        Tue, 07 Jul 2026 16:39:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm82398655e9.13.2026.07.07.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:39:08 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 00:39:03 +0100
Subject: [PATCH v9 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
In-Reply-To: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=36712;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=s7RS5IXj5Q5a2Dst/ehr19qd7F/hhQ5jArzu8wHSrKk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTY4ZpdSs8WJ40yOUod+sPJaTERf778Be8vQZv
 HaWkFh/KOCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2OGQAKCRAicTuzoY3I
 OojqEACcCDPkwhvQNWm8lUfXqCQ9rVKkmGGs/jhfF0QJN3Q4JXJoVmyle40Dcs3Uwpf4pm4xQbS
 haQILDhd+ejL7xrgGCe9HvPxMzHz855DbopV9738g66IkR9dBY1+HjNf39WoLSN6Jw4nHrGXAep
 KcLEoJNfIEECr1BeimWSTvMdBvaHjoVlrAK6G8tLyHW/rLoiuMHV4+5JPs2YKjbV/f1N7lojsEJ
 S+Md9wz3FxULKqhoF40GACAEotyanLlLcLXLWtObUyW2jWbHYG+u8RksR2FsQdibreiq8DfIIU1
 RahdkdudvjxgVWOFienynwYv0iGAm3zuB5INxLxX0o1GUT+/6Xq9n29EFbIjwZphs+gu//GTtFm
 SbxSKm/L02sKMtMqP2L4vOViQw4dL5Eyzws/+RORXJuGQ/VXAA7pX5WOkTnYDMGy2lNknJhWVQy
 b+6j+2qAKHegw3masTR9pGxgnfR01F732XphFKpBsPsrRuE9AWjS9riWL3l6Ftuj7lVahvvwwPd
 V6K52HzeqdYFSMx2H43+Zx2IKY7epJcMh3oRPLHoqRSZzm8K6MJ/m9TA+d0c4KKe67A1lXKudR/
 CjlkCMqRvhey6zGbI3+PcK9r72AnD0yLmeeEu2ak38Y1kFxXGPIG0EQfPbLsqvlnalTY0DpKx0h
 1K8M0YQHxC2yZzg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66928-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D405C72073C

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

The following devices are supported in this drop:
"qcom,x1e80100-csi2-phy"

In-line with other PHY drivers the process node is included in the name.
Data-lane and clock lane positioning and polarity selection via newly
amended struct phy_configure_opts_mipi_dphy{} is supported.

The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
DPHY is supported.

In porting some of the logic over from camss-csiphy*.c to here its also
possible to rationalise some of the code.

In particular use of regulator_bulk and clk_bulk as well as dropping the
seemingly useless and unused interrupt handler.

The PHY sequences and a lot of the logic that goes with them are well
proven in CAMSS and mature so the main thing to watch out for here is how
to get the right sequencing of regulators, clocks and register-writes.

The register init sequence table is imported verbatim from the existing
CAMSS csiphy driver. A follow-up series will rework the table to extract
the repetitive per-lane pattern into a loop.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  14 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 387 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 431 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  98 +++++
 6 files changed, 945 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a99..a203b41475ea4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22296,6 +22296,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
 
+QUALCOMM MIPI CSI2 PHY DRIVER
+M:	Bryan O'Donoghue <bod@kernel.org>
+L:	linux-phy@lists.infradead.org
+L:	linux-media@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
+F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
+F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9..779a3511ba852 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -28,6 +28,20 @@ config PHY_QCOM_EDP
 	  Enable this driver to support the Qualcomm eDP PHY found in various
 	  Qualcomm chipsets.
 
+config PHY_QCOM_MIPI_CSI2
+	tristate "Qualcomm MIPI CSI2 PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on PM
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
index 0000000000000..5a97dc3d45d88
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0
+ *
+ * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2016-2026 Linaro Ltd.
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
+#define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
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
+#define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
+#define CSIPHY_SKEW_CAL					7
+
+/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
+static const struct
+mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
+	/* Power up lanes 2ph mode */
+	{.reg_addr = 0x1014, .reg_data = 0xd5, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0094, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x00a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0090, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0098, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0094, .reg_data = 0x07, .delay_us = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0000, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0094, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0060, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+
+	{.reg_addr = 0x0e94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0ea0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e94, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e28, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e00, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e0c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e38, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0e08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0e10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0494, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x04a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0490, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0498, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0494, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0400, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0494, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0460, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+
+	{.reg_addr = 0x0894, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x08a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0890, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0898, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0894, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0830, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0838, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x082c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0834, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x081c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0814, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x083c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0804, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0820, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0808, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0810, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0894, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x085c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0860, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0864, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+
+	{.reg_addr = 0x0c94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0ca0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c94, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c00, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c38, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0c10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0c94, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0c5c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0c60, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
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
+
+	if ((t_hs_settle_ps / timer_period_ps) < 6)
+		return 0;
+
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
+	if (!settle_cnt)
+		return -EINVAL;
+
+	/*
+	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
+	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
+	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
+	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
+	 */
+	val = BIT(lane_cfg->clk.pos);
+	for (i = 0; i < cfg->num_data_lanes; i++)
+		val |= BIT(lane_cfg->data[i].pos * 2);
+
+	writel(val, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
+
+	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
+	for (i = 0; i < cfg->num_data_lanes; i++) {
+		if (lane_cfg->data[i].pol) {
+			u8 pos = lane_cfg->data[i].pos;
+
+			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos));
+		}
+	}
+
+	if (lane_cfg->clk.pol)
+		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
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
+static const char * const x1e_clks[] = {
+	"core",
+	"timer",
+	"ahb"
+};
+
+static const char * const x1e_supplies[] = {
+	"vdda-0p8",
+	"vdda-1p2"
+};
+
+static struct mipi_csi2_genpd x1e_genpds[] = {
+	{ .name = "top", .scaled = false },
+	{ .name = "mmcx", .scaled = true },
+	{ .name = "mx", .scaled = true },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
new file mode 100644
index 0000000000000..5036926b741b5
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026, Linaro Ltd.
+ */
+
+#include <dt-bindings/phy/phy.h>
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
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "phy-qcom-mipi-csi2.h"
+
+static int
+phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
+				   s64 link_freq)
+{
+	struct device *dev = csi2phy->dev;
+	unsigned long opp_rate = link_freq / 4;
+	struct dev_pm_opp *opp;
+	long timer_rate;
+	int i, pstate;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
+	if (IS_ERR(opp)) {
+		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
+			link_freq);
+		return PTR_ERR(opp);
+	}
+
+	pstate = 0;
+	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+		unsigned int perf;
+
+		if (!csi2phy->soc_cfg->genpds[i].scaled)
+			continue;
+
+		perf = dev_pm_opp_get_required_pstate(opp, pstate);
+		pstate += 1;
+
+		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
+		if (ret) {
+			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
+				perf);
+			dev_pm_opp_put(opp);
+			goto unset_pstate;
+		}
+	}
+	dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(dev, opp_rate);
+	if (ret) {
+		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
+		goto unset_opp_rate;
+	}
+
+	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
+	if (timer_rate <= 0) {
+		ret = -ENODEV;
+		goto unset_opp_rate;
+	}
+
+	ret = clk_set_rate(csi2phy->timer_clk, timer_rate);
+	if (ret)
+		goto unset_opp_rate;
+
+	csi2phy->timer_clk_rate = timer_rate;
+
+	return 0;
+
+unset_opp_rate:
+	dev_pm_opp_set_rate(dev, 0);
+
+unset_pstate:
+	while (i--) {
+		if (!csi2phy->soc_cfg->genpds[i].scaled)
+			continue;
+
+		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
+	}
+
+	return ret;
+}
+
+static int phy_qcom_mipi_csi2_configure(struct phy *phy,
+					union phy_configure_opts *opts)
+{
+	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
+	struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
+	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
+	int ret;
+
+	ret = phy_mipi_dphy_config_validate(dphy_cfg);
+	if (ret)
+		return ret;
+
+	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
+		return -EINVAL;
+
+	stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
+
+	return 0;
+}
+
+static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
+{
+	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
+	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
+	int i, ret;
+
+	ret = regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
+				    csi2phy->supplies);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(csi2phy->dev);
+	if (ret < 0)
+		goto disable_regulators;
+
+	ret = phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stream_cfg.link_freq);
+	if (ret)
+		goto poweroff_phy;
+
+	ret = clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
+				      csi2phy->clks);
+	if (ret) {
+		dev_err(csi2phy->dev, "failed to enable clocks, %d\n", ret);
+		goto unset_rate;
+	}
+
+	ops->reset(csi2phy);
+
+	ops->hw_version_read(csi2phy);
+
+	return ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
+
+unset_rate:
+	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+		if (!csi2phy->soc_cfg->genpds[i].scaled)
+			continue;
+
+		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
+	}
+
+	dev_pm_opp_set_rate(csi2phy->dev, 0);
+
+poweroff_phy:
+	pm_runtime_put_sync(csi2phy->dev);
+
+disable_regulators:
+	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
+			       csi2phy->supplies);
+
+	return ret;
+}
+
+static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
+{
+	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
+	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
+	int i;
+
+	ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
+
+	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
+				   csi2phy->clks);
+
+	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+		if (!csi2phy->soc_cfg->genpds[i].scaled)
+			continue;
+
+		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
+	}
+
+	dev_pm_opp_set_rate(csi2phy->dev, 0);
+
+	pm_runtime_put_sync(csi2phy->dev);
+
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
+static struct phy *qcom_csi2_phy_xlate(struct device *dev,
+				       const struct of_phandle_args *args)
+{
+	struct mipi_csi2phy_device *csi2phy = dev_get_drvdata(dev);
+
+	if (args->args_count < 1 || args->args[0] != PHY_TYPE_DPHY) {
+		dev_err(csi2phy->dev, "invalid phy mode in DTB\n");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	csi2phy->phy_mode = args->args[0];
+
+	return csi2phy->phy;
+}
+
+static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2phy)
+{
+	struct dev_pm_domain_attach_data pd_data;
+	const char **pd_names;
+	int i;
+
+	pd_names = devm_kzalloc(csi2phy->dev,
+				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
+				GFP_KERNEL);
+	if (!pd_names)
+		return -ENOMEM;
+
+	for (i = 0; i < csi2phy->soc_cfg->num_genpds; i++)
+		pd_names[i] = csi2phy->soc_cfg->genpds[i].name;
+
+	pd_data.pd_names = pd_names;
+	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;
+
+	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
+					  &csi2phy->pd_list);
+}
+
+static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
+{
+	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
+	u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
+	u32 data_lanes[CSI2_MAX_DATA_LANES];
+	struct device *dev = csi2phy->dev;
+	struct fwnode_handle *ep;
+	int num_polarities;
+	int num_data_lanes;
+	int i, ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 1, 0);
+	if (ep) {
+		fwnode_handle_put(ep);
+		dev_err(dev, "DPHY split mode is not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep) {
+		dev_err(dev, "Missing port@0\n");
+		return -ENODEV;
+	}
+
+	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
+	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
+		ret = -EINVAL;
+		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
+		goto out_put;
+	}
+	stream_cfg->num_data_lanes = num_data_lanes;
+
+	ret = fwnode_property_read_u32_array(ep, "data-lanes", data_lanes,
+					     stream_cfg->num_data_lanes);
+	if (ret) {
+		dev_err(dev, "Failed to read data-lanes: %d\n", ret);
+		goto out_put;
+	}
+
+	/* lane-polarities: optional, up to num_data_lanes + 1 entries */
+	memset(lane_polarities, 0x00, sizeof(lane_polarities));
+	num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
+	if (num_polarities > 0) {
+		if (num_polarities != stream_cfg->num_data_lanes + 1) {
+			ret = -EINVAL;
+			dev_err(dev, "clock+data-lane %d/polarities %d mismatch\n",
+				stream_cfg->num_data_lanes + 1, num_polarities);
+			goto out_put;
+		}
+
+		ret = fwnode_property_read_u32_array(ep, "lane-polarities", lane_polarities,
+						     num_polarities);
+		if (ret) {
+			dev_err(dev, "Failed to read lane-polarities: %d\n", ret);
+			goto out_put;
+		}
+	}
+
+	csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
+	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
+
+	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
+		if (data_lanes[i] > CSI2_MAX_LANE_NUM) {
+			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
+			ret = -EINVAL;
+			goto out_put;
+		}
+		csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i];
+		csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i + 1];
+	}
+
+	ret = 0;
+
+out_put:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
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
+	dev_set_drvdata(dev, csi2phy);
+
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
+	ret = phy_qcom_mipi_csi2_parse_routing(csi2phy);
+	if (ret)
+		return ret;
+
+	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
+	if (ret < 0 || csi2phy->pd_list == NULL)
+		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
+
+	devm_pm_runtime_enable(dev);
+
+	for (i = 0; i < num_clk; i++)
+		csi2phy->clks[i].id = csi2phy->soc_cfg->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, num_clk, csi2phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	csi2phy->timer_clk = devm_clk_get(dev, "timer");
+	if (IS_ERR(csi2phy->timer_clk)) {
+		return dev_err_probe(dev, PTR_ERR(csi2phy->timer_clk),
+				     "Failed to get timer clock\n");
+	}
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
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
+	phy_provider = devm_of_phy_provider_register(dev, qcom_csi2_phy_xlate);
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
+MODULE_AUTHOR("Bryan O'Donoghue <bod@kernel.org>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
new file mode 100644
index 0000000000000..17b8eb505b7bd
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -0,0 +1,98 @@
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
+#define CSI2_MAX_DATA_LANES	4
+#define CSI2_DEFAULT_CLK_LANE	7
+#define CSI2_MAX_LANE_NUM	7
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
+};
+
+struct mipi_csi2_genpd {
+	const char *name;
+	bool scaled;
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
+	const struct mipi_csi2_genpd *genpds;
+	const unsigned int num_genpds;
+};
+
+struct mipi_csi2phy_device {
+	struct device *dev;
+	u8 phy_mode;
+
+	struct phy *phy;
+	void __iomem *base;
+
+	struct clk_bulk_data *clks;
+	struct clk *timer_clk;
+	u32 timer_clk_rate;
+
+	struct regulator_bulk_data *supplies;
+	struct dev_pm_domain_list *pd_list;
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
2.54.0


