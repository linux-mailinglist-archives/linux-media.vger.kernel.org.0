Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228E611F96D
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfLORAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:00:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:54888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbfLOQ7a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:30 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FAEC24654;
        Sun, 15 Dec 2019 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429169;
        bh=EvY3LwRt0f5Tvf7gcoGOEsDupUlInqW1mNCeFk7ve3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qPHlms8RDy0m/MzsOfVjqrcisYEQwVZwsvvQLsGFf/yO16N1gXeFT/9lGSdDVBI2J
         9WykYKUqXK28CKGeZrJh6uST59Zb+UD7f94fN6fJMsYbySt6uOdMBjzCO2SXTTM2+y
         crawrkADDaSicfm7uuE1/DW0batDau1NcqoaBe+I=
Received: by wens.tw (Postfix, from userid 1000)
        id 374BC5FD34; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 03/14] media: sun4i-csi: Fix data sampling polarity handling
Date:   Mon, 16 Dec 2019 00:59:13 +0800
Message-Id: <20191215165924.28314-4-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
References: <20191215165924.28314-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The CLK_POL field specifies whether data is sampled on the falling or
rising edge of PCLK, not whether the data lines are active high or low.
Evidence of this can be found in the timing diagram labeled "horizontal
size setting and pixel clock timing".

Fix the setting by checking the correct flag, V4L2_MBUS_PCLK_SAMPLE_RISING.
While at it, reorder the three polarity flag checks so HSYNC and VSYNC
are grouped together.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index d6979e11a67b..8b567d0f019b 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -279,8 +279,8 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	       csi->regs + CSI_WIN_CTRL_H_REG);
 
 	hsync_pol = !!(bus->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH);
-	pclk_pol = !!(bus->flags & V4L2_MBUS_DATA_ACTIVE_HIGH);
 	vsync_pol = !!(bus->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH);
+	pclk_pol = !!(bus->flags & V4L2_MBUS_PCLK_SAMPLE_RISING);
 	writel(CSI_CFG_INPUT_FMT(csi_fmt->input) |
 	       CSI_CFG_OUTPUT_FMT(csi_fmt->output) |
 	       CSI_CFG_VSYNC_POL(vsync_pol) |
-- 
2.24.0

