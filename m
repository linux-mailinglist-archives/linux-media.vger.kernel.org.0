Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9D5215E8D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgGFSh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729899AbgGFSh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76777D98;
        Mon,  6 Jul 2020 20:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060666;
        bh=pVZPvfgD2GuPGe7gV5oEC/bL2L0s1jCOvKh8IjW7qx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FsSeeVd7OflIRl6r/wCPwlDgQt0yLVqjNLLHyX+ll02OYnHNLKLa1zdAHTzAikOJd
         pY0xx/F204Pb8TL2TiCp3uCT3NT3NBbGJciZiaEnlCFSsTDggNMWB4zAGK75HIW/27
         1WE+hTlMefW7h5qiKKnh4/17MW1/sC5Sm5RtlZr8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 029/108] media: ti-vpe: cal: Store instance ID and cal pointer in cal_camerarx
Date:   Mon,  6 Jul 2020 21:35:50 +0300
Message-Id: <20200706183709.12238-30-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 471e2581b28b..ff9bc3ae58ba 100644
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

