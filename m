Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A635E4BBF97
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 19:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239291AbiBRSgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 13:36:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236890AbiBRSgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 13:36:02 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07263254A40
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 10:35:44 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A321D40005;
        Fri, 18 Feb 2022 18:35:40 +0000 (UTC)
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
Subject: [PATCH v2 3/7] media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
Date:   Fri, 18 Feb 2022 19:34:17 +0100
Message-Id: <20220218183421.583874-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
References: <20220218183421.583874-1-jacopo@jmondi.org>
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

The CSI bridge should operate in dual pixel sampling mode when it is
connected to a pixel transmitter that transfers two pixel samples (16
bits) at the time in YUYV formats.

Use the image format variants to determine if single or dual pixel mode
should be used.

Add a note to the TODO file to record that the list of supported formats
should be restricted to the SoC model the CSI bridge is integrated on
to avoid potential pipeline mis-configurations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/media/imx/TODO             | 26 ++++++++++++++++++++++
 drivers/staging/media/imx/imx7-media-csi.c |  8 +++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 06c94f20ecf8..e15eba32cc94 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -27,3 +27,29 @@
 - i.MX7: all of the above, since it uses the imx media core

 - i.MX7: use Frame Interval Monitor
+
+- imx7-media-csi: Restrict the supported formats list to the SoC version.
+
+  The imx7 CSI bridge can be configured to sample pixel components from the Rx
+  queue in single  (8bpp) or double (16bpp) modes. Image format variations with
+  different sample sizes (ie YUYV_2X8 vs YUYV_1X16) determine the sampling size
+  (see imx7_csi_configure()).
+
+  As the imx7 CSI bridge can be interfaced with different IP blocks depending on
+  the SoC model it is integrated on, the Rx queue sampling size should match
+  the size of samples transferred by the transmitting IP block.
+
+  To avoid mis-configurations of the capture pipeline, the enumeration of the
+  supported formats should be restricted to match the pixel source
+  transmitting mode.
+
+  Examples: i.MX8MM SoC integrates the CSI bridge with the Samsung CSIS CSI-2
+  receiver which operates in dual pixel sampling mode. The CSI bridge should
+  only expose the 1X16 formats variant which instructs it to operate in dual
+  pixel sampling mode. When the CSI bridge is instead integrated on an i.MX8MQ
+  SoC, which features a CSI-2 receiver that operates in single sampling mode, it
+  should only expose the 2X8 formats variant which instruct it to operate in
+  single sampling mode.
+
+  This currently only applies to YUYV formats, but other formats might need
+  to be treated in the same way.
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 32311fc0e2a4..108360ae3710 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -503,11 +503,15 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		 * all of them comply. Support both variants.
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

