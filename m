Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6353F35D54E
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343665AbhDMCbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343596AbhDMCbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:42 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3FBB15B2;
        Tue, 13 Apr 2021 04:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281083;
        bh=PgOYE+Sm4LTnD+oWFcozR37wrqlHbA/JorymUcp7HIw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C9TdM9tTdefBpgBqwCxJ6+BKovWiHKEIJ8zAMWHrIuUXI+BedsscT2VCQdPefChOU
         Vtv1YsKaqlKMv2/CsBag//vNBS6bKN1wMNE35clEBsqKKlwEVKVu8GPNt3Yiu3G3A3
         fxioEl+BxFK5gMZJzjlO0/g6nHDfOvTh2JlTaDdw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 21/23] media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
Date:   Tue, 13 Apr 2021 05:30:12 +0300
Message-Id: <20210413023014.28797-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSIS doesn't support data lanes reordering. Reject invalid settings.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

