Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8322F4BDE10
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356017AbiBULTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 06:19:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356123AbiBULTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 06:19:31 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11239F1C
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 03:05:21 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0E2B940005;
        Mon, 21 Feb 2022 11:05:16 +0000 (UTC)
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
Subject: [PATCH v3 4/7] media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
Date:   Mon, 21 Feb 2022 12:04:33 +0100
Message-Id: <20220221110436.45419-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220221110436.45419-1-jacopo@jmondi.org>
References: <20220221110436.45419-1-jacopo@jmondi.org>
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

Bits 13 and 12 of the ISP_CONFIGn register configure the PIXEL_MODE
which specifies the sampling size, in pixel component units, on the
CSI-2 output data interface when data are transferred to memory.

The register description in the chip manual specifies that DUAL mode
should be used for YUV422 data.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 3e7efcf43a5f..9d5034759987 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -173,6 +173,7 @@
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
+#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
 #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
 #define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
 #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
@@ -506,7 +507,25 @@ static void __mipi_csis_set_format(struct csi_state *state)
 
 	/* Color format */
 	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
-	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
+	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
+		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
+
+	/*
+	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
+	 * (referred to in the documentation as single and dual pixel modes
+	 * respectively, although the 8-bit mode transfers half a pixel per
+	 * clock sample and the 16-bit mode one pixel). While both mode work
+	 * when the CSIS is connected to a receiver that supports either option,
+	 * single pixel mode requires clock rates twice as high. As all SoCs
+	 * that integrate the CSIS can operate in 16-bit bit mode, and some do
+	 * not support 8-bit mode (this is the case of the i.MX8MP), use dual
+	 * pixel mode unconditionally.
+	 *
+	 * TODO: Verify which other formats require DUAL (or QUAD) modes.
+	 */
+	if (state->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
+		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
+
 	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
 	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
-- 
2.35.0

