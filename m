Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 425B74B2C58
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 19:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352458AbiBKSBk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 13:01:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352443AbiBKSBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 13:01:39 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A487B2C9
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 10:01:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 8023524000E;
        Fri, 11 Feb 2022 18:01:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 3/3] media: imx: Remove reference to i.MX7 from driver
Date:   Fri, 11 Feb 2022 19:02:16 +0100
Message-Id: <20220211180216.290133-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220211180216.290133-1-jacopo@jmondi.org>
References: <20220211180216.290133-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the references to the i.MX7 in the driver description and expand
it with more information about the IP core the driver controls.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index a22d0e6b3d44..59f4485bbe70 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Freescale i.MX7 SoC series MIPI-CSI V3.3 receiver driver
+ * CSIS MIPI CSI-2 receiver driver.
+ *
+ * CSIS is an IP core originating from Samsung found in NXP i.MX7 and i.MX8
+ * SoC series. i.MX7 features version 3.3 of the IP, while i.MX8 features
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

