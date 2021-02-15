Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9D831B4CC
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhBOEjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:39:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbhBOEjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:39:08 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9C431B25;
        Mon, 15 Feb 2021 05:28:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363340;
        bh=06shbK39iihSN974oiHPWV+3z/RaALg8jKjgJBuKUI8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uHhHhM/9uIukYcGlX5p9Fuspo16wVBaiEPE6ftqUFB8oAykdg7vpb43j6Xz2oi0zI
         T5ia9VhabbKEH3QpZMjZkocnyapKb8eIU3KDan2VtAEZFl1/WabDxOtb0V5wXY1v14
         JW4mM5YPB+34690gsZufB98WZIaggv81NypVT4pQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 63/77] media: imx: imx7_mipi_csis: Fix input size alignment
Date:   Mon, 15 Feb 2021 06:27:27 +0200
Message-Id: <20210215042741.28850-64-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The alignments given to the v4l_bound_align_image() are expressed in
bytes, while the function expects them to be expressed as a power of
two. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 36eabab22bfb..381eda94398a 100644
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

