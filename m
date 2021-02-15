Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B0731B4D2
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBOEkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOEj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:39:58 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88E672CDD;
        Mon, 15 Feb 2021 05:29:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363347;
        bh=wR2H+fsbpySf42aL1wPZoGKLeUnNTo/sqIjH15Dp78g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uu3ygZybtTfOlPldykTIcqwXP/8Q86r7HDUU1TGGIBl2Sbcxp0vlEMue3Bh0xpCCN
         IOhBU/MfzIbiNfR4SnCCOG8M6P22aG1m4O1JethSbEGEUO5z3yAtLU3XvHs/LnMx86
         bmP+VdWay3HR8gTNFE7D+0PpsC43E1+jeW96ozDc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 71/77] media: imx: imx7_mipi_csis: Turn register access macros into functions
Date:   Mon, 15 Feb 2021 06:27:35 +0200
Message-Id: <20210215042741.28850-72-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make it easier to instrument register access (for instance with
printk-based logging) by turning the macros into inline functions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 4a51d2440b64..5e907ea46743 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -358,8 +358,15 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	}
 };
 
-#define mipi_csis_write(__csis, __r, __v) writel(__v, (__csis)->regs + (__r))
-#define mipi_csis_read(__csis, __r) readl((__csis)->regs + (__r))
+static inline void mipi_csis_write(struct csi_state *state, u32 reg, u32 val)
+{
+	writel(val, state->regs + reg);
+}
+
+static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
+{
+	return readl(state->regs + reg);
+}
 
 static int mipi_csis_dump_regs(struct csi_state *state)
 {
-- 
Regards,

Laurent Pinchart

