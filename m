Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C8E4876E1
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 12:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238113AbiAGLyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 06:54:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35160 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237810AbiAGLyP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 06:54:15 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A863A4D;
        Fri,  7 Jan 2022 12:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641556454;
        bh=uIZIvGlvCSmxazTaYi/IEKag0QkSJq/k5sV8P1jHq4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DRFAY96pnEtglNdCplJqV9I3EirgzeMAcE9Umw/Ze2mVcu4TSBeI1AM6497ReB3Zh
         d6UnS4+9LUa4vZciVDyGpAKPeA4sCsC8138B+4EHR3rFo8I2c6WwPek4xNgMtERR/X
         G9bVyIy7haZNLZaUXCa9AKk5uLV4aczpPS0FggE0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Subject: [PATCH v2 1/3] staging: media: imx: imx7-mipi-csis: Dump MIPI_CSIS_FRAME_COUNTER_CH0 register
Date:   Fri,  7 Jan 2022 13:53:59 +0200
Message-Id: <20220107115401.31698-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
References: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The frame counter is useful debugging information, add it to the
register dump printed by mipi_csis_dump_regs().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 2b73fa55c938..c9c0089ad816 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -211,6 +211,8 @@
 #define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
 #define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
 
+#define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
+
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
@@ -773,6 +775,7 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
 		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
 	};
 
 	unsigned int i;
-- 
Regards,

Laurent Pinchart

