Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1E835D53D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245576AbhDMCbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241194AbhDMCbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:32 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD250ACC;
        Tue, 13 Apr 2021 04:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281070;
        bh=lFtkgNNTxcEIgVqoHrvR4yOqSi0tw47YZcUHJJGbeOg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NNkqYn/WdD2/w0gwoyjdn7RqirjQqVt/pwaLsJQfayj8iY/GhbKxPI3LKQfS8FPwT
         zLFfNXZ1coLcJwPl5mQuma61KbM0VHsb4ebNWF4ELpswT2mK9IqmZz9kb7XdSWkad/
         PEfqi4ncajLvZAyTkNmLwvaWxDQWwN7mn7XB4H3Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 04/23] media: imx: imx7_mipi_csis: Move static data to top of mipi_csis_dump_regs()
Date:   Tue, 13 Apr 2021 05:29:55 +0300
Message-Id: <20210413023014.28797-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's customary to declare static variables at the top of the function,
with a blank line separating them from the non-static variables.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index f7c8b6d67e1c..25125e067aa7 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -429,9 +429,6 @@ static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
 
 static int mipi_csis_dump_regs(struct csi_state *state)
 {
-	struct device *dev = &state->pdev->dev;
-	unsigned int i;
-	u32 cfg;
 	static const struct {
 		u32 offset;
 		const char * const name;
@@ -450,6 +447,10 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 	};
 
+	struct device *dev = &state->pdev->dev;
+	unsigned int i;
+	u32 cfg;
+
 	dev_info(dev, "--- REGISTERS ---\n");
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
-- 
Regards,

Laurent Pinchart

