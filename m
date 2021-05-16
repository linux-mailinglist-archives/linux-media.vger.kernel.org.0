Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CA4381C16
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhEPCYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhEPCYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:24:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E069EC061763
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 18:55:02 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31736B91;
        Sun, 16 May 2021 03:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129501;
        bh=JmqGnpDPw9T33107htWdOo96CrEGhuqfrMBa5gpgcQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y0Xl4GecRQzYVwbTz9rU7pGgX3tG3Z3BGEe6vcwvZrOGjs8ZX0TjSqMyvHsAN4+LX
         yG5yGh6OHTA8m8QbkTjaXSFgSQKcLEQ/NvpsDqIHguEaexw9Khl5KQQ6IJrx250pb+
         o2WQ9UrESfPVy8PlMzwySPiXhcCAraNfNvAmonpM=
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
Subject: [PATCH v2 06/25] media: imx: imx7_mipi_csis: Don't set subdev data
Date:   Sun, 16 May 2021 04:44:22 +0300
Message-Id: <20210516014441.5508-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver doesn't need to store subdev data, as the subdev is embedded
in csi_state and is thus accessed using container_of.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index bbcd39672f92..030ef0925cd5 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1105,8 +1105,6 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 	state->csis_fmt = &mipi_csis_formats[0];
 	mipi_csis_init_cfg(mipi_sd, NULL);
 
-	v4l2_set_subdevdata(mipi_sd, &pdev->dev);
-
 	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
 					 | MEDIA_PAD_FL_MUST_CONNECT;
 	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
-- 
Regards,

Laurent Pinchart

