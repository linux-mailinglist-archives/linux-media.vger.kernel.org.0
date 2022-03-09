Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4544D2CC4
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 11:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiCIKGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 05:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiCIKGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 05:06:02 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75C413CEED
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 02:05:03 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 97CE840003;
        Wed,  9 Mar 2022 10:04:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE)
Subject: [PATCH] media: imx: imx-mipi-csis: Add support for JPEG_1X8
Date:   Wed,  9 Mar 2022 11:04:48 +0100
Message-Id: <20220309100448.9749-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
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

Add support for MEDIA_BUS_FMT_JPEG_1X8 media bus code to the
CSIS driver.

The MEDIA_BUS_FMT_JPEG_1X8 code is mapped tot the RAW8 CSI-2 Data Type,
while the CSI-2 specification suggests to use User Defined Data Type 1.

As reported in the comment, the CSIS interface captures arbitrary Data
Types by using a pixel sampling mode not supported by the IP core
connected to it on i.MX SoCs.

As some sensors, such as OV5640, support sending JPEG data on the RAW8
Data Type and capture operations work correcty with such configuration,
map MEDIA_BUS_FMT_JPEG_1X8 to Data Type 0x2a.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

Based on Hans' br-v5.18s where the CSIS patches have been collected

---
 drivers/media/platform/imx/imx-mipi-csis.c | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 0a72734db55e..3731748de18b 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -470,6 +470,34 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
+	},
+	/* JPEG */
+	{
+		.code = MEDIA_BUS_FMT_JPEG_1X8,
+		.output = MEDIA_BUS_FMT_JPEG_1X8,
+		/*
+		 * Map JPEG_1X8 on the RAW8 datatype.
+		 *
+		 * The CSI-2 specification suggests in Annex A "JPEG8 Data
+		 * Format (informative)" to transmit JPEG data using one of the
+		 * Data Types aimed to represent arbitrary data, such as the
+		 * "User Defined Data Type 1" (0x30).
+		 *
+		 * However, when configured with a User Defined Data Type, the
+		 * CSIS outputs data in quad pixel mode regardless of the mode
+		 * selected in the MIPI_CSIS_ISP_CONFIG_CH register. Neither of
+		 * the IP cores connected to the CSIS in i.MX SoCs (CSI bridge
+		 * or ISI) support quad pixel mode, so this will never work in
+		 * practice.
+		 *
+		 * Some sensors (such as the OV5640) send JPEG data using the
+		 * RAW8 data type. This is usable and works, so map the JPEG
+		 * format to RAW8. If the CSIS ends up being integrated in an
+		 * SoC that can support quad pixel mode, this will have to be
+		 * revisited.
+		 */
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.width = 8,
 	}
 };

--
2.35.1

