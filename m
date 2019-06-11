Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB79C3CC35
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388722AbfFKMvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:51:04 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50565 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388160AbfFKMvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:51:04 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hagEw-00077w-SO; Tue, 11 Jun 2019 14:51:02 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v4 07/10] media: hantro: allow arbitrary number of clocks
Date:   Tue, 11 Jun 2019 14:50:55 +0200
Message-Id: <20190611125058.13470-8-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611125058.13470-1-p.zabel@pengutronix.de>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dynamically allocate clocks and move clock names out of struct
hantro_variant. This lifts the four clock limit and allows to use
ARRAY_SIZE() to fill .num_clocks to reduce the risk of mismatches.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changed since v3:
 - Moved before adding i.MX8M support.
---
 drivers/staging/media/hantro/hantro.h        |  6 ++----
 drivers/staging/media/hantro/hantro_drv.c    |  5 +++++
 drivers/staging/media/hantro/rk3288_vpu_hw.c |  8 ++++++--
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 12 ++++++++----
 4 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 5c2f87272ce2..62dcca9ff19c 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -25,8 +25,6 @@
 
 #include "hantro_hw.h"
 
-#define HANTRO_MAX_CLOCKS		4
-
 #define MPEG2_MB_DIM			16
 #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
 #define MPEG2_MB_HEIGHT(h)		DIV_ROUND_UP(h, MPEG2_MB_DIM)
@@ -88,7 +86,7 @@ struct hantro_variant {
 	int (*runtime_resume)(struct hantro_dev *vpu);
 	const struct hantro_irq *irqs;
 	int num_irqs;
-	const char *clk_names[HANTRO_MAX_CLOCKS];
+	const char * const *clk_names;
 	int num_clocks;
 	const char * const *reg_names;
 	int num_regs;
@@ -182,7 +180,7 @@ struct hantro_dev {
 	struct hantro_func *decoder;
 	struct platform_device *pdev;
 	struct device *dev;
-	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
+	struct clk_bulk_data *clocks;
 	void __iomem **reg_bases;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index fa933960687d..d1f061dd8ede 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -688,6 +688,11 @@ static int hantro_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
+	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
+				   sizeof(*vpu->clocks), GFP_KERNEL);
+	if (!vpu->clocks)
+		return -ENOMEM;
+
 	for (i = 0; i < vpu->variant->num_clocks; i++)
 		vpu->clocks[i].id = vpu->variant->clk_names[i];
 	ret = devm_clk_bulk_get(&pdev->dev, vpu->variant->num_clocks,
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index c5473bc1ac29..bcacc4f51093 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -166,6 +166,10 @@ static const struct hantro_irq rk3288_irqs[] = {
 	{ "vdpu", rk3288_vdpu_irq },
 };
 
+static const char * const rk3288_clk_names[] = {
+	"aclk", "hclk"
+};
+
 const struct hantro_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3288_vpu_enc_fmts,
@@ -178,6 +182,6 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.irqs = rk3288_irqs,
 	.num_irqs = ARRAY_SIZE(rk3288_irqs),
 	.init = rk3288_vpu_hw_init,
-	.clk_names = {"aclk", "hclk"},
-	.num_clocks = 2
+	.clk_names = rk3288_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3288_clk_names)
 };
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index fc52bedf3665..f8400e49bc50 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -165,6 +165,10 @@ static const struct hantro_irq rk3399_irqs[] = {
 	{ "vdpu", rk3399_vdpu_irq },
 };
 
+static const char * const rk3399_clk_names[] = {
+	"aclk", "hclk"
+};
+
 const struct hantro_variant rk3399_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3399_vpu_enc_fmts,
@@ -177,8 +181,8 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.irqs = rk3399_irqs,
 	.num_irqs = ARRAY_SIZE(rk3399_irqs),
 	.init = rk3399_vpu_hw_init,
-	.clk_names = {"aclk", "hclk"},
-	.num_clocks = 2
+	.clk_names = rk3399_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3399_clk_names)
 };
 
 static const struct hantro_irq rk3328_irqs[] = {
@@ -194,6 +198,6 @@ const struct hantro_variant rk3328_vpu_variant = {
 	.irqs = rk3328_irqs,
 	.num_irqs = ARRAY_SIZE(rk3328_irqs),
 	.init = rk3399_vpu_hw_init,
-	.clk_names = {"aclk", "hclk"},
-	.num_clocks = 2
+	.clk_names = rk3399_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3399_clk_names),
 };
-- 
2.20.1

