Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63B12EAEDB
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbhAEPjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbhAEPjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:25 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9A761C05;
        Tue,  5 Jan 2021 16:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860620;
        bh=5QfZh/BMzL6gvPCzQghMRe2L+NrPrCmPKCEuoWtqygw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oFD7zfSd0P/NMTaFIzWT04XCbqFEI69n17UQqjuaaBek/bnvYHMN0reaqxpcXrqp2
         FDbn4vczxHjp4B80iPwIV2zInHvaXMqA/FV68AHkFF6XPNav/i6C26+4MQkHqf8dop
         EwLe9Q/2FbOc8q+Cl+OUZ9pwABfjuLZfczS5qHi0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 64/75] media: imx: imx7_mipi_csis: Drop 10-bit YUV support
Date:   Tue,  5 Jan 2021 17:28:41 +0200
Message-Id: <20210105152852.5733-65-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The data type specified for 10-bit YUV is the same as 8-bit YUV. This is
wrong, and has thus clearly not been tested. Instead of fixing data type
without being able to test it, drop it. It can be added back later when
someone will have access to a 10-bit YUV source to this it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 7994b3f54933..5a5b3723f0a8 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -276,10 +276,6 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
 		.width = 8,
-	}, {
-		.code = MEDIA_BUS_FMT_UYVY10_2X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.width = 10,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
-- 
Regards,

Laurent Pinchart

