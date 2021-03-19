Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4384341203
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 02:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhCSBS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 21:18:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49470 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhCSBSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 21:18:20 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 005228F3;
        Fri, 19 Mar 2021 02:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616116699;
        bh=uqyLxfJIRMVNmo1MK8YktUAUd6m1uWBAdYuA5fDnq3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HUYHrJhjA6re2HiakP7otgB1Gbgp143qmtNc0E/jE6yGvW5+296Q6O/YBJQ35Tdja
         nZEoTIGj10UmFA3g3sAOWRKPStpi+penYv9kqEB3GS3lEwF77Ctn0IZ7GuWmBSTfQ5
         IvfqtdM5Dt1AYoAZs/c6r4bQYBscDkqHJrjdTS94=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH 3/3] media: imx: imx7_mipi_csis: Ensure pads are connected
Date:   Fri, 19 Mar 2021 03:17:35 +0200
Message-Id: <20210319011735.26846-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
References: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI-2 receiver requires both its sink pad and its source pad to be
connected through enabled links in order to be started. Ensure this by
setting the MEDIA_PAD_FL_MUST_CONNECT flag on both pads.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 21774f3e66e0..025fdc488bd6 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1065,8 +1065,10 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	v4l2_set_subdevdata(mipi_sd, &pdev->dev);
 
-	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
+					 | MEDIA_PAD_FL_MUST_CONNECT;
+	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
+					   | MEDIA_PAD_FL_MUST_CONNECT;
 	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
 				      state->pads);
 }
-- 
Regards,

Laurent Pinchart

