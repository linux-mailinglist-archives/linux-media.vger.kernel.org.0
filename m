Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A204BEA0C
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiBURzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 12:55:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiBURwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 12:52:24 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A456456
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 09:47:53 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id CC8E31C0006;
        Mon, 21 Feb 2022 17:47:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 3/7] media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
Date:   Mon, 21 Feb 2022 18:47:23 +0100
Message-Id: <20220221174727.320320-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220221174727.320320-1-jacopo@jmondi.org>
References: <20220221174727.320320-1-jacopo@jmondi.org>
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

The CSI bridge should operate in dual components mode when it is
connected to a pixel transmitter that transfers two components at a time
in YUV 422 formats (16 bits, Y + U/V).

Use the image format variants to determine if single or dual component mode
should be used.

Add a note to the TODO file to record that the list of supported formats
should be restricted to the SoC model the CSI bridge is integrated on
to avoid potential pipeline mis-configurations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/TODO             | 25 +++++++++++++++++
 drivers/staging/media/imx/imx7-media-csi.c | 32 +++++++++++++++++++---
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 06c94f20ecf8..5d3a337c8702 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -27,3 +27,28 @@
 - i.MX7: all of the above, since it uses the imx media core
 
 - i.MX7: use Frame Interval Monitor
+
+- imx7-media-csi: Restrict the supported formats list to the SoC version.
+
+  The imx7 CSI bridge can be configured to sample pixel components from the Rx
+  queue in single (8bpp) or double (16bpp) component modes. Image format
+  variants with different sample sizes (ie YUYV_2X8 vs YUYV_1X16) determine the
+  pixel components sampling size per each clock cycle and their packing mode
+  (see imx7_csi_configure() for details).
+
+  As the imx7 CSI bridge can be interfaced with different IP blocks depending on
+  the SoC model it is integrated on, the Rx queue sampling size should match
+  the size of the samples transferred by the transmitting IP block.
+
+  To avoid mis-configurations of the capture pipeline, the enumeration of the
+  supported formats should be restricted to match the pixel source transmitting
+  mode.
+
+  Example: i.MX8MM SoC integrates the CSI bridge with the Samsung CSIS CSI-2
+  receiver which operates in dual pixel sampling mode. The CSI bridge should
+  only expose the 1X16 formats variant which instructs it to operate in dual
+  pixel sampling mode. When the CSI bridge is instead integrated on an i.MX7,
+  which supports both serial and parallel input, it should expose both variants.
+
+  This currently only applies to YUYV formats, but other formats might need
+  to be handled in the same way.
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 32311fc0e2a4..8467a1491048 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -498,16 +498,40 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 			cr3 |= BIT_TWO_8BIT_SENSOR;
 			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
 			break;
+
 		/*
-		 * CSI-2 sources are supposed to use the 1X16 formats, but not
-		 * all of them comply. Support both variants.
+		 * The CSI bridge has a 16-bit input bus. Depending on the
+		 * connected source, data may be transmitted with 8 or 10 bits
+		 * per clock sample (in bits [9:2] or [9:0] respectively) or
+		 * with 16 bits per clock sample (in bits [15:0]). The data is
+		 * then packed into a 32-bit FIFO (as shown in figure 13-11 of
+		 * the i.MX8MM reference manual rev. 3).
+		 *
+		 * The data packing in a 32-bit FIFO input word is controlled by
+		 * the CR3 TWO_8BIT_SENSOR field (also known as SENSOR_16BITS in
+		 * the i.MX8MM reference manual). When set to 0, data packing
+		 * groups four 8-bit input samples (bits [9:2]). When set to 1,
+		 * data packing groups two 16-bit input samples (bits [15:0]).
+		 *
+		 * The register field CR18 MIPI_DOUBLE_CMPNT also needs to be
+		 * configured according to the input format for YUV 4:2:2 data.
+		 * The field controls the gasket between the CSI-2 receiver and
+		 * the CSI bridge. On i.MX7 and i.MX8MM, the field must be set
+		 * to 1 when the CSIS outputs 16-bit samples. On i.MX8MQ, the
+		 * gasket ignores the MIPI_DOUBLE_CMPNT bit and YUV 4:2:2 always
+		 * uses 16-bit samples. Setting MIPI_DOUBLE_CMPNT in that case
+		 * has no effect, but doesn't cause any issue.
 		 */
 		case MEDIA_BUS_FMT_UYVY8_2X8:
-		case MEDIA_BUS_FMT_UYVY8_1X16:
 		case MEDIA_BUS_FMT_YUYV8_2X8:
-		case MEDIA_BUS_FMT_YUYV8_1X16:
 			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
 			break;
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+		case MEDIA_BUS_FMT_YUYV8_1X16:
+			cr3 |= BIT_TWO_8BIT_SENSOR;
+			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B |
+				BIT_MIPI_DOUBLE_CMPNT;
+			break;
 		}
 	}
 
-- 
2.35.0

