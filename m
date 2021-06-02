Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FDD398824
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 13:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhFBL01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 07:26:27 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59166 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232322AbhFBL0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 07:26:22 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 895BAC043D;
        Wed,  2 Jun 2021 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1622633079; bh=Cjwofvyx7tHITwroONobhD5qV5HclCkCWYemv1jIgWE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=JRzwo6X5wD2eGf3ut07wX48KnCGO79T1WetxnNRkp3aBD07ZBNq3DdaNrPQEeQwb6
         YJdv3rs/pA44sQfwsmqXPMTTWGSVPTYs12GdaNBjzXtNUm9iOiuFRmL30xIHzPx7SI
         xDn8bt85dW60Ib5J/Cn1+bTyEVRu3W1NuaeCI4XvgEJ2xKRdmx2ygwMY16fZEv6K5Z
         2lrNc4SKwE0CPaVZ3vfIP0+guJS4GHNqEUyxDdDvvTaSaMaWeaAzT6WPV4yCLEEzr2
         pX6sGrV2f26rmjfMEgUID6H0/JLVDS/1xO24dGaHgU1BDqdN0Bt7p9N1ITsGaUpIOc
         ibLiAr1V/Kddg==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 427A5A006E;
        Wed,  2 Jun 2021 11:24:37 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>
Subject: [PATCH 4/9] phy: Add PHY standard HDMI opts to the PHY API
Date:   Wed,  2 Jun 2021 13:24:22 +0200
Message-Id: <fb400f26ab158f6c44bdd1241334945760390d99.1622631488.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1622631488.git.nelson.costa@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1622631488.git.nelson.costa@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds the new options to give support for HDMI
PHYs in a standard way. This is mainly useful when
the HDMI PHY requires parameters to be passed by
"phy_configure" function.

For this, the new struct phy_configure_opts_hdmi
was added with the required generic and standard
parameters.

Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 include/linux/phy/phy-hdmi.h | 102 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |   7 ++-
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000..62334f4
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 - present Synopsys, Inc. and/or its affiliates.
+ * HDMI generic PHY options.
+ *
+ * Author: Nelson Costa <nelson.costa@synopsys.com>
+ */
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+#include <linux/types.h>
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI PHY configuration set
+ *
+ * This structure is used to represent the configuration state of an
+ * HDMI PHY.
+ */
+struct phy_configure_opts_hdmi {
+	/**
+	 * @color_depth:
+	 *
+	 * Color depth, as specified by HDMI specification, represents the
+	 * number of bits per pixel.
+	 *
+	 * Allowed values: 24, 30, 36, 48
+	 *
+	 */
+	u8 color_depth;
+
+	/**
+	 * @tmds_bit_clock_ratio:
+	 *
+	 * Flag indicating, as specified by HDMI specification, the relation
+	 * between TMDS Clock Rate and TMDS Character Rate.
+	 *
+	 * As specified by HDMI specification:
+	 *
+	 * tmds_bit_clock_ratio = 0, for TMDS Character Rates <= 340 Mcsc
+	 * (TMDS Clock Rate = TMDS Character Rate)
+	 *
+	 * tmds_bit_clock_ratio = 1, for TMDS Character Rates > 340 Mcsc
+	 * (TMDS Clock Rate = TMDS Character Rate / 4)
+	 *
+	 */
+	u8 tmds_bit_clock_ratio;
+
+	/**
+	 * @scrambling:
+	 *
+	 * Scrambling, as specified by HDMI specification, enables the technique
+	 * to reduce the EMI/RFI.
+	 *
+	 */
+	u8 scrambling;
+
+	/**
+	 * @calibration_acq:
+	 *
+	 * Calibration acquisitions number for the calibration algorithm.
+	 *
+	 */
+	unsigned int calibration_acq;
+
+	/**
+	 * @calibration_force:
+	 *
+	 * Flag indicating, to force calibration algorithm even if the MPLL
+	 * status didn't change from previous run calibration.
+	 *
+	 */
+	u8 calibration_force;
+
+	/**
+	 * @set_color_depth:
+	 *
+	 * Flag indicating, whether or not reconfigure deep_color
+	 * to requested values.
+	 *
+	 */
+	u8 set_color_depth : 1;
+
+	/**
+	 * @set_tmds_bit_clock_ratio:
+	 *
+	 * Flag indicating, whether or not reconfigure tmds_bit_clock_ratio
+	 * to requested values.
+	 *
+	 */
+	u8 set_tmds_bit_clock_ratio : 1;
+
+	/**
+	 * @set_scrambling:
+	 *
+	 * Flag indicating, whether or not reconfigure scrambling
+	 * to requested values.
+	 *
+	 */
+	u8 set_scrambling : 1;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index e435bdb..8b1aaa4 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -18,6 +18,7 @@
 
 #include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-mipi-dphy.h>
+#include <linux/phy/phy-hdmi.h>
 
 struct phy;
 
@@ -41,7 +42,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI
 };
 
 /**
@@ -51,10 +53,13 @@ enum phy_mode {
  *		the MIPI_DPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
+ * @hdmi	Configuration set applicable for phys supporting
+ *		the HDMI protocol.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.7.4

