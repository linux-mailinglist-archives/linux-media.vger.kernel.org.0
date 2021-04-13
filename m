Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1362735D53B
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243672AbhDMCbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241072AbhDMCba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:30 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 313C29F0;
        Tue, 13 Apr 2021 04:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281069;
        bh=UQFDo6JyOlivcMX4OOQ8rANfMHPr7agP7zRX3IaJM2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aEiQ2RrPLWlDOvZkqC2ZZn7gMfdJm6Epx7jeqEFi+6K8iD1uehbY6Du07wuVH/L+P
         XfSAZ4CeBkn4nuIQKImhao6Jf1z/h9FntngjFwgvnlO1uT4i69iqwBc9xOylNa58pl
         YlpiwwjcCBsoWQN6X14+ccMyE5StsPN7o9IjV6nM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 03/23] media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel mode
Date:   Tue, 13 Apr 2021 05:29:54 +0300
Message-Id: <20210413023014.28797-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MM expands the DOUBLE_CMPNT bit in the ISP_CONFIG register into
a two bits field that support quad pixel mode in addition to the single
and double modes. Update the ISP_CONFIG register macros to support this.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 67911eb8761f..f7c8b6d67e1c 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -166,7 +166,9 @@
 #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
-#define MIPI_CSIS_ISPCFG_DOUBLE_CMPNT		BIT(12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
 #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
 #define MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT	(0x1e << 2)
 #define MIPI_CSIS_ISPCFG_FMT_RAW8		(0x2a << 2)
-- 
Regards,

Laurent Pinchart

