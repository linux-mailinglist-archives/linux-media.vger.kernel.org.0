Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA9735D54B
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343600AbhDMCbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343539AbhDMCbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:40 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D85AF3;
        Tue, 13 Apr 2021 04:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281080;
        bh=8mZw0jxuyyQI3EiFxbwD4SfsUP8db/QyqYYTX9hz1Fw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uo45ysdOvmwQwVVcn/n2hK+4tqW9lv4Zg98cJ2K3iRWmBPC/JPRLqhG4iimvk/nqH
         uapFDk8AMQX5Xa/y2diIGbvkdD4SuMCr/CXcF0F/k5zPpGta45P5K57BVi65aYknpO
         s2C09o6jEcvfutQNia/AQRENzU/H7jTsC0WGm8Nw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 18/23] media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
Date:   Tue, 13 Apr 2021 05:30:09 +0300
Message-Id: <20210413023014.28797-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The num_clocks field of the csi_state only stores positive values, make
it unsigned.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 1cb8eeb2fdac..0ec6870f98a8 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -309,7 +309,7 @@ struct csi_state {
 	struct dentry *debugfs_root;
 	bool debug;
 
-	int num_clks;
+	unsigned int num_clks;
 	struct clk_bulk_data *clks;
 
 	u32 clk_frequency;
-- 
Regards,

Laurent Pinchart

