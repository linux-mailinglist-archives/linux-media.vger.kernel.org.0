Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9D1F8B84
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgFOAAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgFOAAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A89BCFA2;
        Mon, 15 Jun 2020 02:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179222;
        bh=pzqnglejuz59mVe4aJhiAL2+fClOZ6ZFHEETaHLOlfU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YfxtPYyB9h1cIiTg6FcUg2Pd3vbANgMBZzBP2Y4e8UYl+2l1iyX8HzmeJaXrDwxOR
         /M+a8rAs3J6IglVpOL2tTX3X83/4YNoGdx3C9ky0YB528tX1J/B2CPaCdBiIrHAk1s
         SZHaD5EzNGevQhEZRTIkExqbnfdAMsTd3h92wqXM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 029/107] media: ti-vpe: cal: Store instance ID and cal pointer in cal_camerarx
Date:   Mon, 15 Jun 2020 02:58:26 +0300
Message-Id: <20200614235944.17716-30-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store a pointer to the cal_dev and the cal_camerarx instance number in
the cal_camerarx structure. This prepares for passing a cal_camerarx
pointer instead of a cal_ctx pointer to multiple functions that deal
with the CAMERARX.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9b905b61148f..e40967751aa4 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -325,6 +325,9 @@ struct cal_camerarx {
 	struct resource		*res;
 	struct platform_device	*pdev;
 	struct regmap_field	*fields[F_MAX_FIELDS];
+
+	struct cal_dev		*cal;
+	unsigned int		instance;
 };
 
 struct cal_dev {
@@ -466,8 +469,7 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
 }
 
 static int cal_camerarx_regmap_init(struct cal_dev *cal,
-				    struct cal_camerarx *phy,
-				    unsigned int idx)
+				    struct cal_camerarx *phy)
 {
 	const struct cal_camerarx_data *phy_data;
 	unsigned int i;
@@ -475,7 +477,7 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 	if (!cal->data)
 		return -EINVAL;
 
-	phy_data = &cal->data->camerarx[idx];
+	phy_data = &cal->data->camerarx[phy->instance];
 
 	for (i = 0; i < F_MAX_FIELDS; i++) {
 		struct reg_field field = {
@@ -561,7 +563,8 @@ static void camerarx_phy_disable(struct cal_ctx *ctx)
 /*
  * Camera Instance access block
  */
-static struct cal_camerarx *cc_create(struct cal_dev *cal, unsigned int core)
+static struct cal_camerarx *cc_create(struct cal_dev *cal,
+				      unsigned int instance)
 {
 	struct platform_device *pdev = cal->pdev;
 	struct cal_camerarx *phy;
@@ -571,8 +574,11 @@ static struct cal_camerarx *cc_create(struct cal_dev *cal, unsigned int core)
 	if (!phy)
 		return ERR_PTR(-ENOMEM);
 
+	phy->cal = cal;
+	phy->instance = instance;
+
 	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						(core == 0) ?
+						(instance == 0) ?
 						"cal_rx_core0" :
 						"cal_rx_core1");
 	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
@@ -584,7 +590,7 @@ static struct cal_camerarx *cc_create(struct cal_dev *cal, unsigned int core)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		phy->res->name, &phy->res->start, &phy->res->end);
 
-	ret = cal_camerarx_regmap_init(cal, phy, core);
+	ret = cal_camerarx_regmap_init(cal, phy);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
Regards,

Laurent Pinchart

