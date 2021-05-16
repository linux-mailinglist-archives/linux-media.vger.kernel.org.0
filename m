Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1616381C0A
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhEPCQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232080AbhEPCND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:13:03 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD44F2943;
        Sun, 16 May 2021 03:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129517;
        bh=7NxNFXoemo6xs2sU5hl64pmj0PwRY5x3Y2c96a5cbm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dQpciqPtN3bHUKhXKE5BDzsgmUWNgoFb+djgq9aZRuB9C4ewRWtOevjkgE1cNtu2P
         EMHw+7p4rKDM+rpFQ10DOMmD1D87Xr/68ZOJx/bG5vIEaIm8R+tdNwxyeY2Zdd3PZQ
         xLTBYgKfzy5F4HxPhZmnsqgqJHrfImbNINulYPms=
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
Subject: [PATCH v2 21/25] media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
Date:   Sun, 16 May 2021 04:44:37 +0300
Message-Id: <20210516014441.5508-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSIS doesn't support data lanes reordering. Reject invalid settings.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 07b331667db7..6e235c86e0aa 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1115,6 +1115,7 @@ static int mipi_csis_async_register(struct csi_state *state)
 	};
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *ep;
+	unsigned int i;
 	int ret;
 
 	v4l2_async_notifier_init(&state->notifier);
@@ -1128,6 +1129,14 @@ static int mipi_csis_async_register(struct csi_state *state)
 	if (ret)
 		goto err_parse;
 
+	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
+			dev_err(state->dev,
+				"data lanes reordering is not supported");
+			goto err_parse;
+		}
+	}
+
 	state->bus = vep.bus.mipi_csi2;
 
 	dev_dbg(state->dev, "data lanes: %d\n", state->bus.num_data_lanes);
-- 
Regards,

Laurent Pinchart

