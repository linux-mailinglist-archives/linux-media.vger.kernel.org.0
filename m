Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8620035D53F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245617AbhDMCbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245550AbhDMCbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:33 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 927746F2;
        Tue, 13 Apr 2021 04:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281072;
        bh=9teduRvaaW43Nvifn5LBvr35KISkU6hvBOZJ9WcasAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GO3fhJohOEqWn3VYFOYniPwsqYzbmWHf/9aa44kWgmeBonmhUWviDgbO8dY7u8VoY
         J7htZ34cygvCvMH/m9RmpcKn4MVdwFtClZUMcC0RwarKRVZiFvfXgPd1HkZvYrHvoI
         d/UAz17m2RORgxwsPKWiF18supz6alq9BdkMSl1Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 06/23] media: imx: imx7_mipi_csis: Don't set subdev data
Date:   Tue, 13 Apr 2021 05:29:57 +0300
Message-Id: <20210413023014.28797-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver doesn't need to store subdev data, as the subdev is embedded
in csi_state and is thus accessed using container_of.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

