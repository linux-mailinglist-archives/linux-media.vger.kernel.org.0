Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6626E3230
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 17:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjDOP4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjDOP4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 11:56:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1472117
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 08:56:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 320229C;
        Sat, 15 Apr 2023 17:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681574194;
        bh=pJkTkVAG8/+DjRkqISw5b95j1lyYuDZlNfVtI91IZzg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gcRBcM4vUPG2mcatR1Wi81VZGQXzQK+C9f3VmhgDIE7aASzpxYQXDV5IWRlPnCTk9
         h/G0dbR/3YZ2JqWlI21Vb7V4fw6fYMZkB/fcrAh/skpXW8kUB3FQ5tCFnRm2cfN2Ny
         qMwKUfRW/wC86OCy4KqOWpVbmDQum6fP9B7JUvXw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v5 3/5] media: nxp: imx8-isi: Drop partial support for i.MX8QM and i.MX8QXP
Date:   Sat, 15 Apr 2023 18:56:28 +0300
Message-Id: <20230415155630.7492-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
References: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support for the i.MX8QM and i.MX8QXP is only partly implemented and has
never been tested. Furthermore, the corresponding compatible string it
not documented. Drop it, until someone with interest in those platforms
can test and implement it properly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 108 +-----------------
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |   1 -
 2 files changed, 1 insertion(+), 108 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 629ccdd98a62..238521622b75 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -16,7 +16,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/sys_soc.h>
 #include <linux/types.h>
 
 #include <media/media-device.h>
@@ -244,27 +243,7 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
  * Device information
  */
 
-/* For i.MX8QM/QXP B0 ISI IER version */
-static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v0 = {
-	.oflw_y_buf_en = { .offset = 16, .mask = 0x10000  },
-	.oflw_u_buf_en = { .offset = 19, .mask = 0x80000  },
-	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
-
-	.excs_oflw_y_buf_en = { .offset = 17, .mask = 0x20000  },
-	.excs_oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
-	.excs_oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
-
-	.panic_y_buf_en = {.offset = 18, .mask = 0x40000   },
-	.panic_u_buf_en = {.offset = 21, .mask = 0x200000  },
-	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
-};
-
 /* Panic will assert when the buffers are 50% full */
-static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v0 = {
-	.panic_set_thd_y = { .mask = 0x03, .offset = 0, .threshold = 0x2 },
-	.panic_set_thd_u = { .mask = 0x18, .offset = 3, .threshold = 0x2 },
-	.panic_set_thd_v = { .mask = 0xc0, .offset = 6, .threshold = 0x2 },
-};
 
 /* For i.MX8QXP C0 and i.MX8MN ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
@@ -295,39 +274,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
 };
 
-static const struct clk_bulk_data mxc_imx8_clks[] = {
-	{ .id = NULL },
-};
-
-/* Chip C0 */
-static const struct mxc_isi_plat_data mxc_imx8_data_v0 = {
-	.model			= MXC_ISI_IMX8,
-	.num_ports		= 5,
-	.num_channels		= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v0,
-	.set_thd		= &mxc_imx8_isi_thd_v0,
-	.clks			= mxc_imx8_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8_clks),
-	.buf_active_reverse	= false,
-	.has_gasket		= false,
-	.has_36bit_dma		= false,
-};
-
-static const struct mxc_isi_plat_data mxc_imx8_data_v1 = {
-	.model			= MXC_ISI_IMX8,
-	.num_ports		= 5,
-	.num_channels		= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v1,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8_clks),
-	.buf_active_reverse	= true,
-	.has_gasket		= false,
-	.has_36bit_dma		= false,
-};
-
 static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "axi" },
 	{ .id = "apb" },
@@ -361,53 +307,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
-static const struct soc_device_attribute imx8_soc[] = {
-	{
-		.soc_id   = "i.MX8QXP",
-		.revision = "1.0",
-		.data     = &mxc_imx8_data_v0,
-	}, {
-		.soc_id   = "i.MX8QXP",
-		.revision = "1.1",
-		.data     = &mxc_imx8_data_v0,
-	}, {
-		.soc_id   = "i.MX8QXP",
-		.revision = "1.2",
-	}, {
-		.soc_id   = "i.MX8QM",
-		.revision = "1.0",
-		.data     = &mxc_imx8_data_v0,
-	}, {
-		.soc_id   = "i.MX8QM",
-		.revision = "1.1",
-		.data     = &mxc_imx8_data_v0,
-	}, {
-		.soc_id   = "i.MX8MN",
-		.revision = "1.0",
-	}, {
-		.soc_id   = "i.MX8MP",
-	}, {
-		/* sentinel */
-	}
-};
-
-static int mxc_isi_get_platform_data(struct mxc_isi_dev *isi)
-
-{
-	const struct soc_device_attribute *match;
-
-	isi->pdata = of_device_get_match_data(isi->dev);
-
-	match = soc_device_match(imx8_soc);
-	if (!match)
-		return -EINVAL;
-
-	if (match->data)
-		isi->pdata = match->data;
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -525,11 +424,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);
 
-	ret = mxc_isi_get_platform_data(isi);
-	if (ret < 0) {
-		dev_err(dev, "Can't get platform device data\n");
-		return ret;
-	}
+	isi->pdata = of_device_get_match_data(dev);
 
 	isi->pipes = kcalloc(isi->pdata->num_channels, sizeof(isi->pipes[0]),
 			     GFP_KERNEL);
@@ -621,7 +516,6 @@ static int mxc_isi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {
-	{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
 	{ /* sentinel */ },
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index a6b1ce5bd106..e469788a9e6c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -148,7 +148,6 @@ struct mxc_isi_set_thd {
 };
 
 enum model {
-	MXC_ISI_IMX8,
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
 };
-- 
Regards,

Laurent Pinchart

