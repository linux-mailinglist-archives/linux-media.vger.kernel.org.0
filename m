Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6275702FE
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiGKMnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiGKMnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:43:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A530B1145
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:43:32 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF07D440;
        Mon, 11 Jul 2022 14:43:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543404;
        bh=TJ4MWP4xMHgGpign8+bdTuAf+yY+b4WSHYqEgslMJ7k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XqqrrI6xjuwPpoy0JyljNfhwHMklq5u9H1fWttv9AY+aAAIZOxPQIaRIqtfrXEChc
         7g4f27hirEqleC2Sl6MVc7th6bUByJtXxn+HguJTV3tu+Y5kZmrGnyozTlXMz/MjDK
         CROhxYeXwibuhK+quzUcBOylCFuMc8WMLcJszRT0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 08/46] media: rkisp1: Rename rkisp1_match_data to rkisp1_info
Date:   Mon, 11 Jul 2022 15:42:10 +0300
Message-Id: <20220711124248.2683-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkisp1_match_data structure contains device model-specific
information. It it referenced from OF match data, but that's an
implementation detail. Rename it to rkisp1_info to reflect its main
purpose.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index ba773c0784fb..258980ef4783 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -105,7 +105,7 @@ struct rkisp1_isr_data {
 	irqreturn_t (*isr)(int irq, void *ctx);
 };
 
-struct rkisp1_match_data {
+struct rkisp1_info {
 	const char * const *clks;
 	unsigned int clk_size;
 	const struct rkisp1_isr_data *isrs;
@@ -420,7 +420,7 @@ static const struct rkisp1_isr_data px30_isp_isrs[] = {
 	{ "mipi", rkisp1_mipi_isr },
 };
 
-static const struct rkisp1_match_data px30_isp_match_data = {
+static const struct rkisp1_info px30_isp_info = {
 	.clks = px30_isp_clks,
 	.clk_size = ARRAY_SIZE(px30_isp_clks),
 	.isrs = px30_isp_isrs,
@@ -438,7 +438,7 @@ static const struct rkisp1_isr_data rk3399_isp_isrs[] = {
 	{ NULL, rkisp1_isr },
 };
 
-static const struct rkisp1_match_data rk3399_isp_match_data = {
+static const struct rkisp1_info rk3399_isp_info = {
 	.clks = rk3399_isp_clks,
 	.clk_size = ARRAY_SIZE(rk3399_isp_clks),
 	.isrs = rk3399_isp_isrs,
@@ -449,11 +449,11 @@ static const struct rkisp1_match_data rk3399_isp_match_data = {
 static const struct of_device_id rkisp1_of_match[] = {
 	{
 		.compatible = "rockchip,px30-cif-isp",
-		.data = &px30_isp_match_data,
+		.data = &px30_isp_info,
 	},
 	{
 		.compatible = "rockchip,rk3399-cif-isp",
-		.data = &rk3399_isp_match_data,
+		.data = &rk3399_isp_info,
 	},
 	{},
 };
@@ -461,7 +461,7 @@ MODULE_DEVICE_TABLE(of, rkisp1_of_match);
 
 static int rkisp1_probe(struct platform_device *pdev)
 {
-	const struct rkisp1_match_data *match_data;
+	const struct rkisp1_info *info;
 	struct device *dev = &pdev->dev;
 	struct rkisp1_device *rkisp1;
 	struct v4l2_device *v4l2_dev;
@@ -469,8 +469,8 @@ static int rkisp1_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 cif_id;
 
-	match_data = of_device_get_match_data(&pdev->dev);
-	if (!match_data)
+	info = of_device_get_match_data(&pdev->dev);
+	if (!info)
 		return -ENODEV;
 
 	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
@@ -486,14 +486,14 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (IS_ERR(rkisp1->base_addr))
 		return PTR_ERR(rkisp1->base_addr);
 
-	for (i = 0; i < match_data->isr_size; i++) {
-		irq = match_data->isrs[i].name
-		    ? platform_get_irq_byname(pdev, match_data->isrs[i].name)
+	for (i = 0; i < info->isr_size; i++) {
+		irq = info->isrs[i].name
+		    ? platform_get_irq_byname(pdev, info->isrs[i].name)
 		    : platform_get_irq(pdev, i);
 		if (irq < 0)
 			return irq;
 
-		ret = devm_request_irq(dev, irq, match_data->isrs[i].isr, IRQF_SHARED,
+		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
 				       dev_driver_string(dev), dev);
 		if (ret) {
 			dev_err(dev, "request irq failed: %d\n", ret);
@@ -501,12 +501,12 @@ static int rkisp1_probe(struct platform_device *pdev)
 		}
 	}
 
-	for (i = 0; i < match_data->clk_size; i++)
-		rkisp1->clks[i].id = match_data->clks[i];
-	ret = devm_clk_bulk_get(dev, match_data->clk_size, rkisp1->clks);
+	for (i = 0; i < info->clk_size; i++)
+		rkisp1->clks[i].id = info->clks[i];
+	ret = devm_clk_bulk_get(dev, info->clk_size, rkisp1->clks);
 	if (ret)
 		return ret;
-	rkisp1->clk_size = match_data->clk_size;
+	rkisp1->clk_size = info->clk_size;
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -519,7 +519,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 
-	rkisp1->media_dev.hw_revision = match_data->isp_ver;
+	rkisp1->media_dev.hw_revision = info->isp_ver;
 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
 		sizeof(rkisp1->media_dev.model));
 	rkisp1->media_dev.dev = &pdev->dev;
-- 
Regards,

Laurent Pinchart

