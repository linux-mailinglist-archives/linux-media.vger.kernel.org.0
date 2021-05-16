Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EA2381C11
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbhEPCTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhEPCTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:19:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73957C061761
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 18:55:01 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50D04B2B;
        Sun, 16 May 2021 03:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129499;
        bh=FeIUVO/g/8jWltLgBMFShpSkWGsFqRegvMwyZ/hE02c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OUVI5L8+d7QgTzYpUegfFWWEtwDlypr0O4LnmCXhaMhMmfP4Aey2GmaXMRlkVs4A2
         f3cH9gQAuZMp9YyYbhI+nAbJcikunYLEdYtOhGPBVTJV0ZpWOeHtuy8CUIyInukSbV
         BM6ffIGpK24VN0gS8gYLz1JU/KxNHnf6kA2p7wIc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 03/25] media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel mode
Date:   Sun, 16 May 2021 04:44:19 +0300
Message-Id: <20210516014441.5508-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MM expands the DOUBLE_CMPNT bit in the ISP_CONFIG register into
a two bits field that support quad pixel mode in addition to the single
and double modes. Update the ISP_CONFIG register macros to support this.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 67911eb8761f..f7c8b6d67e1c 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -166,7 +166,9 @@
 #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
-#define MIPI_CSIS_ISPCFG_DOUBLE_CMPNT		BIT(12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
 #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
 #define MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT	(0x1e << 2)
 #define MIPI_CSIS_ISPCFG_FMT_RAW8		(0x2a << 2)
-- 
Regards,

Laurent Pinchart

