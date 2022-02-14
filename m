Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDCC4B5A24
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 19:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238310AbiBNSm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 13:42:56 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbiBNSmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 13:42:55 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210976A06D
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 10:42:37 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BB96C1C0002;
        Mon, 14 Feb 2022 18:42:23 +0000 (UTC)
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
Subject: [PATCH 2/8] media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
Date:   Mon, 14 Feb 2022 19:43:12 +0100
Message-Id: <20220214184318.409208-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220214184318.409208-1-jacopo@jmondi.org>
References: <20220214184318.409208-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.

The driver is for an IP core found on i.MX7 and i.MX8 SoC, so do not
specify a SoC version number in the driver name.

Remove the references to the i.MX7 SoC in the driver symbols and expand
the driver's header with more information about the IP core the driver
controls.

Also rename the associated bindings documentation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/admin-guide/media/imx7.rst               |  2 +-
 ...{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
 MAINTAINERS                                            |  4 ++--
 drivers/media/platform/imx/Makefile                    |  2 +-
 .../platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} | 10 +++++++---
 5 files changed, 12 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
 rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (99%)

diff --git a/Documentation/admin-guide/media/imx7.rst b/Documentation/admin-guide/media/imx7.rst
index 4785ae8ac978..2fa27718f52a 100644
--- a/Documentation/admin-guide/media/imx7.rst
+++ b/Documentation/admin-guide/media/imx7.rst
@@ -33,7 +33,7 @@ reference manual [#f1]_.
 Entities
 --------
 
-imx7-mipi-csi2
+imx-mipi-csi2
 --------------
 
 This is the MIPI CSI-2 receiver entity. It has one sink pad to receive the pixel
diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
rename to Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index e2e6e9aa0fe6..36b135bf9f2a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
+$id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NXP i.MX7 and i.MX8 MIPI CSI-2 receiver
diff --git a/MAINTAINERS b/MAINTAINERS
index 5bdb8c881b0b..d919ea3ed250 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11889,9 +11889,9 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
-F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
-F:	drivers/media/platform/imx/imx7-mipi-csis.c
+F:	drivers/media/platform/imx/imx-mipi-csis.c
 F:	drivers/staging/media/imx/imx7-media-csi.c
 
 MEDIA DRIVERS FOR HELENE
diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
index ee272234c8d7..f72bdbe8e6ef 100644
--- a/drivers/media/platform/imx/Makefile
+++ b/drivers/media/platform/imx/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx7-mipi-csis.o
+obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
similarity index 99%
rename from drivers/media/platform/imx/imx7-mipi-csis.c
rename to drivers/media/platform/imx/imx-mipi-csis.c
index a22d0e6b3d44..f433758c8935 100644
--- a/drivers/media/platform/imx/imx7-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Freescale i.MX7 SoC series MIPI-CSI V3.3 receiver driver
+ * Samsung CSIS MIPI CSI-2 receiver driver.
+ *
+ * The Samsung CSIS IP is a MIPI CSI-2 receiver found in various NXP i.MX7 and
+ * i.MX8 SoCs. The i.MX7 features version 3.3 of the IP, while i.MX8 features
+ * version 3.6.3
  *
  * Copyright (C) 2019 Linaro Ltd
  * Copyright (C) 2015-2016 Freescale Semiconductor, Inc. All Rights Reserved.
@@ -31,7 +35,7 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
-#define CSIS_DRIVER_NAME			"imx7-mipi-csis"
+#define CSIS_DRIVER_NAME			"imx-mipi-csis"
 
 #define CSIS_PAD_SINK				0
 #define CSIS_PAD_SOURCE				1
@@ -1515,4 +1519,4 @@ module_platform_driver(mipi_csis_driver);
 
 MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:imx7-mipi-csi2");
+MODULE_ALIAS("platform:imx-mipi-csi2");
-- 
2.35.0

