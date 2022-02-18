Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225B84BBF98
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 19:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239312AbiBRSf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 13:35:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239291AbiBRSf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 13:35:56 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D4C25D27A
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 10:35:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 75D6440002;
        Fri, 18 Feb 2022 18:35:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 1/7] media: imx: De-stage imx7-mipi-csis
Date:   Fri, 18 Feb 2022 19:34:15 +0100
Message-Id: <20220218183421.583874-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
References: <20220218183421.583874-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7-mipi-csis driver is in a good state and can be destaged.

Move the imx7-mipi-csis.c driver to the newly created
drivers/media/platform/imx directory and plumb the related
options in Kconfig and in Makefile.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/media/platform/Kconfig                |  1 +
 drivers/media/platform/Makefile               |  1 +
 drivers/media/platform/imx/Kconfig            | 24 +++++++++++++++++++
 drivers/media/platform/imx/Makefile           |  1 +
 .../platform}/imx/imx7-mipi-csis.c            |  0
 drivers/staging/media/imx/Makefile            |  1 -
 7 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 rename drivers/{staging/media => media/platform}/imx/imx7-mipi-csis.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 83d27b57016f..5bdb8c881b0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11891,8 +11891,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/imx7.rst
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+F:	drivers/media/platform/imx/imx7-mipi-csis.c
 F:	drivers/staging/media/imx/imx7-media-csi.c
-F:	drivers/staging/media/imx/imx7-mipi-csis.c
 
 MEDIA DRIVERS FOR HELENE
 M:	Abylay Ospan <aospan@netup.ru>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9fbdba0fd1e7..d9eeccffea69 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -171,6 +171,7 @@ source "drivers/media/platform/xilinx/Kconfig"
 source "drivers/media/platform/rcar-vin/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
+source "drivers/media/platform/imx/Kconfig"
 
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 28eb4aadbf45..a9466c854610 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -20,6 +20,7 @@ obj-y	+= ti-vpe/
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
 obj-$(CONFIG_VIDEO_CODA)		+= coda/
 
+obj-$(CONFIG_VIDEO_IMX)			+= imx/
 obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
 obj-$(CONFIG_VIDEO_IMX8_JPEG)		+= imx-jpeg/
 
diff --git a/drivers/media/platform/imx/Kconfig b/drivers/media/platform/imx/Kconfig
new file mode 100644
index 000000000000..683863572c20
--- /dev/null
+++ b/drivers/media/platform/imx/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig VIDEO_IMX
+	bool "V4L2 capture drivers for NXP i.MX devices"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	help
+	  Say yes here to enable support for capture drivers on i.MX SoCs.
+	  Support for the single SoC features are selectable in the sub-menu
+	  options.
+
+if VIDEO_IMX
+
+config VIDEO_IMX_MIPI_CSIS
+	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	default n
+	help
+	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
+	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
+
+endif # VIDEO_IMX
diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
new file mode 100644
index 000000000000..ee272234c8d7
--- /dev/null
+++ b/drivers/media/platform/imx/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx7-mipi-csis.o
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx7-mipi-csis.c
similarity index 100%
rename from drivers/staging/media/imx/imx7-mipi-csis.c
rename to drivers/media/platform/imx/imx7-mipi-csis.c
diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 19c2fc54d424..d82be898145b 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -15,5 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
-obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
-- 
2.35.0

