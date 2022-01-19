Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51156493969
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 12:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354109AbiASLTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 06:19:36 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:58011 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354094AbiASLTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 06:19:33 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 372EA100008;
        Wed, 19 Jan 2022 11:19:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] staging: media: imx: imx7-mipi-csic: Set PIXEL_MODE for YUV422
Date:   Wed, 19 Jan 2022 12:20:24 +0100
Message-Id: <20220119112024.11339-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119112024.11339-1-jacopo@jmondi.org>
References: <20220119112024.11339-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bits 13 and 12 of the ISP_CONFIGn register configure the PIXEL_MODE
which specifies the sampling size, in pixel component units, on the
CSI-2 output data interface when data are transferred to memory.

The register description in the chip manual specifies that DUAL mode
should be used for YUV422 data but does not clarify the reason.

Todo: verify if other YUV formats require the same setting and what is the
appropriate setting for RAW and sRGB formats.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index cb54bb7491d9..e96989c46479 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -499,6 +499,10 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	/* Color format */
 	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
 	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
+
+	if (state->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
+		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
+
 	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
 	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
-- 
2.34.1

