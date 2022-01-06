Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3BA486867
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 18:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241788AbiAFRZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 12:25:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241779AbiAFRZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 12:25:03 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CCBC1414;
        Thu,  6 Jan 2022 18:25:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641489901;
        bh=h+U2APg4noz72XH28G+Z5iUlwLaee6G+ecRMP5PxNNE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rhW1wlVwsIHF4ZsHz0si3/lffCex849xp5DrvRlQaQmeY065gaedoFmm3mebuqBWH
         bUYJ0D7LLVVd1VfqwMbEX/jQciX8e9HWlQ1Rwnu87pcy4sZ4pMDO6Trhh+gVX++YO9
         rgK2F7Q6TRcN8A/dVPNZJJeH36i7q7C+m32Ngi5E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Subject: [PATCH v1 1/3] staging: media: imx: imx7-mipi-csis: Dump MIPI_CSIS_FRAME_COUNTER_CH0 register
Date:   Thu,  6 Jan 2022 19:24:39 +0200
Message-Id: <20220106172441.7399-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
References: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The frame counter is useful debugging information, add it to the
register dump printed by mipi_csis_dump_regs().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

