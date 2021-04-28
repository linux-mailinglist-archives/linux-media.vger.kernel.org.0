Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2195036DB94
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240085AbhD1P0N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:26:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56574 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236545AbhD1P0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:26:03 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 05465404AD;
        Wed, 28 Apr 2021 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619623518; bh=Cjwofvyx7tHITwroONobhD5qV5HclCkCWYemv1jIgWE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=Mj2u2xrc7wgTqKRzRT1hlYVqy230P9RUVCGoI0Z3j57KPSW6fkaMPWR23y+OmTIKM
         c8uGZPvjedHn0tOK4XEkoNifnsTI6QM01Athb59tRTwTA4eLiGbTBC7nN87qe936xF
         4+6f3XigseBZf+8oIxdD+6AYSvk5dOy79xsjWOJqFO+HLS8kgEEZaN7zOg/9Z/Zcg3
         HxP1AVWIkgJLhMZST3g2m6OPWsFsxindnK353XBQy2i/lPgfgatbhI9SLtShDDq08Z
         d5lPitQ3ga3j6jUyG5pFY5/SMgHjxzSNXAM+SBW2Q2ZyBuiaceRNfgWd20VVQ3vHc4
         kL40ll0g2ZOzQ==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 72F70A006E;
        Wed, 28 Apr 2021 15:25:16 +0000 (UTC)
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
Subject: [RFC 3/8] phy: Add PHY standard HDMI opts to the PHY API
Date:   Wed, 28 Apr 2021 17:25:06 +0200
Message-Id: <d854e5cb55be588290738fa93b4a72c8c9f459ed.1618937288.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
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

