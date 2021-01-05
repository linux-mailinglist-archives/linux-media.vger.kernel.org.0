Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238AC2EAEF4
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbhAEPlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:41:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbhAEPlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:41:14 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 831D81C1C;
        Tue,  5 Jan 2021 16:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860626;
        bh=ItPDMZG1NRYIXal7KZGs1SEMf4aYvcAcYiozfkmc+jM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ekWIPVKXClG1OqN2slpYt3Mv2deVYOZg8a9DvpFDKZHh15eGeynF1tCtJ0o7GBg4k
         vwJL63jXKetLLpD6DfLNUDMZFl/QK8NAQ++memE3wrh7RGP6PrJhUqnZ800NrQHnkn
         sAESSa/yJpYOy07jL8aGGUrvUfI/3HhNi/ZVDPa4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 75/75] media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs()
Date:   Tue,  5 Jan 2021 17:28:52 +0200
Message-Id: <20210105152852.5733-76-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print the value of the ISP shadow registers in mipi_csis_dump_regs() as
this can help debugging.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 63a150be3bd6..944518a9fd58 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -188,6 +188,11 @@
 #define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
 #define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
 
+/* ISP shadow registers */
+#define MIPI_CSIS_SDW_CONFIG_CH(n)		(0x80 + (n) * 0x10)
+#define MIPI_CSIS_SDW_RESOL_CH(n)		(0x84 + (n) * 0x10)
+#define MIPI_CSIS_SDW_SYNC_CH(n)		(0x88 + (n) * 0x10)
+
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
@@ -412,6 +417,8 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
 		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
 		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
+		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 	};
 
-- 
Regards,

Laurent Pinchart

