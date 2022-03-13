Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9C34D74B2
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 11:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbiCMKzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 06:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbiCMKyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 06:54:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD5A54F9E;
        Sun, 13 Mar 2022 03:52:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0236E61025;
        Sun, 13 Mar 2022 10:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0AAC36AF2;
        Sun, 13 Mar 2022 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647168730;
        bh=FFtBVxCNU0lgtf6MUAIWU8V5I44U7IcShp/XmPLquDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AKD41VptMrEe+KcRJCNw7xHaeEIs5iGnrBPLPFycB4lXByUCL/38lXjxxbEmSSn47
         3BSq/Rc+w/EJVuOfdM9XgDd9Twsi8hFDqYAbqgymBRpwUv/lWbQGKQY7XAjMIjhr4W
         vYU4duYCyeEQp+v64p4dqK+k+i0OoW95Xb11gyz4c3xQ6fH43PmU82cXh9aVWjbVct
         NnVbVQOom1sfAaei9jha7r8BksuK5GXt3RK8KONxCnw09MplpEiqkzaLwlS4MrWd2o
         /EoVe7FqoC4hwo07D05FDxS3dVwV3KxCtJ0sJnwOk+bS/NymyVkbYx//QAomVz3I9c
         ym7VCuHLA8YRw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTLpX-001I2m-Ts; Sun, 13 Mar 2022 11:52:07 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eddie James <eajames@linux.ibm.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH 24/24] media: platform/*/Kconfig: make menus more uniform
Date:   Sun, 13 Mar 2022 11:52:05 +0100
Message-Id: <a90b868284f35e4f80c43e863a2f9b43b7d05749.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do some adjustments at the per-vendor Kconfig, adding a comment at
the beginning in order to identify the manufacturer, and adjust
a few entries to make them look more uniform.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

 drivers/media/platform/allegro-dvt/Kconfig |  3 +++
 drivers/media/platform/amlogic/Kconfig     |  3 +++
 drivers/media/platform/aspeed/Kconfig      |  3 +++
 drivers/media/platform/atmel/Kconfig       |  3 +++
 drivers/media/platform/cadence/Kconfig     | 13 +-----------
 drivers/media/platform/chips-media/Kconfig |  3 +++
 drivers/media/platform/intel/Kconfig       |  3 +++
 drivers/media/platform/marvell/Kconfig     |  3 +++
 drivers/media/platform/mediatek/Kconfig    |  3 +++
 drivers/media/platform/nvidia/Kconfig      |  3 +++
 drivers/media/platform/nxp/Kconfig         | 24 ++++++----------------
 drivers/media/platform/qcom/Kconfig        |  3 +++
 drivers/media/platform/renesas/Kconfig     |  2 ++
 drivers/media/platform/rockchip/Kconfig    |  3 +++
 drivers/media/platform/samsung/Kconfig     |  3 +++
 drivers/media/platform/sti/Kconfig         |  3 +++
 drivers/media/platform/ti/Kconfig          |  3 +++
 drivers/media/platform/via/Kconfig         |  3 +++
 drivers/media/platform/xilinx/Kconfig      |  7 +++----
 19 files changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index c3f76a6fb6f8..735440369c5c 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Allegro DVT drivers"
+
 config VIDEO_ALLEGRO_DVT
 	tristate "Allegro DVT Video IP Core"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
index 09fb145a0b30..bc8d99e12f96 100644
--- a/drivers/media/platform/amlogic/Kconfig
+++ b/drivers/media/platform/amlogic/Kconfig
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "Amlogic drivers"
+
 source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
index 810902c8a85a..af95b08adf46 100644
--- a/drivers/media/platform/aspeed/Kconfig
+++ b/drivers/media/platform/aspeed/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Aspeed drivers"
+
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index abeb0ac595b3..ae0fa7f96f66 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Atmel drivers"
+
 config VIDEO_ATMEL_ISC
 	tristate "ATMEL Image Sensor Controller (ISC) support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index acfa0ef6247e..1a0f2d9a6a28 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -1,15 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config VIDEO_CADENCE
-	bool "Cadence Video Devices"
-	depends on V4L_PLATFORM_DRIVERS
-	help
-	  If you have a media device designed by Cadence, say Y.
 
-	  Note that this option doesn't include new drivers in the kernel:
-	  saying N will just cause Kconfig to skip all the questions about
-	  Cadence media devices.
-
-if VIDEO_CADENCE
+comment "Cadence drivers"
 
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
@@ -34,5 +25,3 @@ config VIDEO_CADENCE_CSI2TX
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called cdns-csi2tx.
-
-endif
diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index 22b654018f3c..ea49b3563320 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Chips&Media drivers"
+
 config VIDEO_CODA
 	tristate "Chips&Media Coda multi-standard codec IP"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/intel/Kconfig b/drivers/media/platform/intel/Kconfig
index d47a2cf6f334..091e15f00ef5 100644
--- a/drivers/media/platform/intel/Kconfig
+++ b/drivers/media/platform/intel/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Intel drivers"
+
 config VIDEO_PXA27x
 	tristate "PXA27x Quick Capture Interface driver"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/marvell/Kconfig b/drivers/media/platform/marvell/Kconfig
index 474795668930..d7275322fd92 100644
--- a/drivers/media/platform/marvell/Kconfig
+++ b/drivers/media/platform/marvell/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Marvell drivers"
+
 config VIDEO_CAFE_CCIC
 	tristate "Marvell 88ALP01 (Cafe) CMOS Camera Controller support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
index 549abf1df7d9..8e0770fb2dd3 100644
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "Mediatek drivers"
+
 source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
 source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
index 413005d8cd66..8fdb41e64308 100644
--- a/drivers/media/platform/nvidia/Kconfig
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "NVidia drivers"
+
 source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index e8c9d33cd3b7..65357344d5e5 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -2,20 +2,10 @@
 
 # V4L drivers
 
-menuconfig VIDEO_IMX
-	bool "V4L2 capture drivers for NXP i.MX devices"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_DEV
-	help
-	  Say yes here to enable support for capture drivers on i.MX SoCs.
-	  Support for the single SoC features are selectable in the sub-menu
-	  options.
-
-if VIDEO_IMX
+comment "NXP drivers"
 
 config VIDEO_IMX_MIPI_CSIS
-	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
+	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
@@ -24,10 +14,8 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
-endif # VIDEO_IMX
-
 config VIDEO_VIU
-	tristate "Freescale/NXP VIU Video Driver"
+	tristate "NXP VIU Video Driver"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV && (PPC_MPC512x || COMPILE_TEST) && I2C
 	select VIDEOBUF_DMA_CONTIG
@@ -42,7 +30,7 @@ config VIDEO_VIU
 # mem2mem drivers
 
 config VIDEO_IMX_PXP
-	tristate "i.MX Pixel Pipeline (PXP)"
+	tristate "NXP i.MX Pixel Pipeline (PXP)"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && (ARCH_MXC || COMPILE_TEST)
 	select VIDEOBUF2_DMA_CONTIG
@@ -52,7 +40,7 @@ config VIDEO_IMX_PXP
 	  color space conversion, and rotation.
 
 config VIDEO_MX2_EMMAPRP
-	tristate "Freescale/NXP MX2 eMMa-PrP support"
+	tristate "NXP MX2 eMMa-PrP support"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on SOC_IMX27 || COMPILE_TEST
@@ -63,5 +51,5 @@ config VIDEO_MX2_EMMAPRP
 	    memory to memory. Operations include resizing and format
 	    conversion.
 
-source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
 source "drivers/media/platform/nxp/amphion/Kconfig"
+source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index aa2428f641d3..b19b4f319f6b 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "Qualcomm drivers"
+
 source "drivers/media/platform/qcom/camss/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
index 0c0de21584ba..8c707ab38d0a 100644
--- a/drivers/media/platform/renesas/Kconfig
+++ b/drivers/media/platform/renesas/Kconfig
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+comment "Renesas drivers"
+
 # V4L drivers
 
 config VIDEO_RENESAS_CEU
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
index c7ba06388780..558e3e4b5aa4 100644
--- a/drivers/media/platform/rockchip/Kconfig
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "Rockchip drivers"
+
 source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/rockchip/rkisp1/Kconfig"
diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 9e9e8acdccd3..8813b61b06f4 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "Samsung drivers"
+
 source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
 source "drivers/media/platform/samsung/exynos4-is/Kconfig"
 source "drivers/media/platform/samsung/s3c-camif/Kconfig"
diff --git a/drivers/media/platform/sti/Kconfig b/drivers/media/platform/sti/Kconfig
index d5423743d905..a352087dba27 100644
--- a/drivers/media/platform/sti/Kconfig
+++ b/drivers/media/platform/sti/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "STMicroelectronics drivers"
+
 source "drivers/media/platform/sti/bdisp/Kconfig"
 source "drivers/media/platform/sti/c8sectpfe/Kconfig"
 source "drivers/media/platform/sti/delta/Kconfig"
diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index 796acd229987..9e63ea70b48f 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+comment "Texas Instruments drivers"
+
 source "drivers/media/platform/ti/am437x/Kconfig"
 source "drivers/media/platform/ti/davinci/Kconfig"
 source "drivers/media/platform/ti/omap/Kconfig"
diff --git a/drivers/media/platform/via/Kconfig b/drivers/media/platform/via/Kconfig
index a289f5c81b7c..6077222eb274 100644
--- a/drivers/media/platform/via/Kconfig
+++ b/drivers/media/platform/via/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "VIA drivers"
+
 config VIDEO_VIA_CAMERA
 	tristate "VIAFB camera controller support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index 439120c45eb1..0c772d070eb6 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+comment "Xilinx drivers"
+
 config VIDEO_XILINX
 	tristate "Xilinx Video IP (EXPERIMENTAL)"
 	depends on V4L_PLATFORM_DRIVERS
@@ -11,9 +13,8 @@ config VIDEO_XILINX
 	help
 	  Driver for Xilinx Video IP Pipelines
 
-if VIDEO_XILINX
-
 config VIDEO_XILINX_CSI2RXSS
+	depends on VIDEO_XILINX
 	tristate "Xilinx CSI-2 Rx Subsystem"
 	help
 	  Driver for Xilinx MIPI CSI-2 Rx Subsystem. This is a V4L sub-device
@@ -32,5 +33,3 @@ config VIDEO_XILINX_VTC
 	depends on VIDEO_XILINX
 	help
 	   Driver for the Xilinx Video Timing Controller
-
-endif #VIDEO_XILINX
-- 
2.35.1

