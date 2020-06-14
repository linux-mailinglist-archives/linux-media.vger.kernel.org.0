Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DE21F8B79
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgFOAAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgFOAAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C37691A80;
        Mon, 15 Jun 2020 02:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179219;
        bh=OPsZcTRyleVMyaESNgWlbPo38E/TpYmGgoEeRol3Tr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wBDcJmBfvVOy+EhxD8Ry2sr9TpTCMJA3i1XSISveM8Q0oq3uG/S0iBi85jqQIvChg
         aSfWek6V69LuNd6ERCmy6llL0++7PsO02y4uoBzl+HX+A6qxUZrqZU5SV6bxWybtth
         TI/hI7PvTSbweg62NNH3bpuYSEcYR1GORrJ6xRQ0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 020/107] media: ti-vpe: cal: Remove static const cal_regmap_config template
Date:   Mon, 15 Jun 2020 02:58:17 +0300
Message-Id: <20200614235944.17716-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The global static const cal_regmap_config template is only used in a
single location, to initialize 3 fields of a local variable. Two of
those fields then get overwritten. Remove the template and set the last
remaining field manually. Simplify the code by hardcoding the field
values instead of calculating them for a variable that always has the
same value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d1ab7fc26d25..852529abca7f 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -513,19 +513,12 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev, struct cc_data *cc,
 	return 0;
 }
 
-static const struct regmap_config cal_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-};
-
 static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
 {
 	struct platform_device *pdev = dev->pdev;
+	struct regmap_config config = { };
 	struct regmap *regmap;
 	void __iomem *base;
-	u32 reg_io_width;
-	struct regmap_config r_config = cal_regmap_config;
 	struct resource *res;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
@@ -539,12 +532,12 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
 	cal_dbg(1, dev, "ioresource %s at %pa - %pa\n",
 		res->name, &res->start, &res->end);
 
-	reg_io_width = 4;
-	r_config.reg_stride = reg_io_width;
-	r_config.val_bits = reg_io_width * 8;
-	r_config.max_register = resource_size(res) - reg_io_width;
+	config.reg_bits = 32;
+	config.reg_stride = 4;
+	config.val_bits = 32;
+	config.max_register = resource_size(res) - 4;
 
-	regmap = regmap_init_mmio(NULL, base, &r_config);
+	regmap = regmap_init_mmio(NULL, base, &config);
 	if (IS_ERR(regmap))
 		pr_err("regmap init failed\n");
 
-- 
Regards,

Laurent Pinchart

