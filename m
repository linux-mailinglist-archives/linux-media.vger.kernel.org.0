Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D142EAED8
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbhAEPjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAEPjC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:02 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFDAF1BF4;
        Tue,  5 Jan 2021 16:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860618;
        bh=BoRUolJW2RV5JG7cd9x+fen4kfoDk0I2bOZoSp+7zmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KL/9ecdjHeF7mXbimKfhLs+ky6VnS8oNJSKipLLxwBmCYVoVhN94wCU8xYfiadSuO
         /BA2pWGaG1+K/5kTzK4fl0mrhICiRL15V334v6PNEei185btoBLW5fSExKk8PTwCbu
         jaRAJs8ROlHtIimSn/LUqXYzyiPjSUsjuvYJo34s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 61/75] media: imx: imx7_mipi_csis: Fix input size alignment
Date:   Tue,  5 Jan 2021 17:28:38 +0200
Message-Id: <20210105152852.5733-62-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The alignments given to the v4l_bound_align_image() are expressed in
bytes, while the function expects them to be expressed as a power of
two. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index b6a808cddb37..fe8f3fdab832 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -831,25 +831,25 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 	 */
 	switch (csis_fmt->width % 8) {
 	case 0:
-		align = 1;
+		align = 0;
 		break;
 	case 4:
-		align = 2;
+		align = 1;
 		break;
 	case 2:
 	case 6:
-		align = 4;
+		align = 2;
 		break;
 	case 1:
 	case 3:
 	case 5:
 	case 7:
-		align = 8;
+		align = 3;
 		break;
 	}
 
 	v4l_bound_align_image(&fmt->width, 1, CSIS_MAX_PIX_WIDTH, align,
-			      &fmt->height, 1, CSIS_MAX_PIX_HEIGHT, 1, 0);
+			      &fmt->height, 1, CSIS_MAX_PIX_HEIGHT, 0, 0);
 
 	sdformat->format = *fmt;
 
-- 
Regards,

Laurent Pinchart

