Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFE31F8B7C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgFOAAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbgFOAAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A24AE41;
        Mon, 15 Jun 2020 02:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179220;
        bh=e1MoXjttN8ifDndnOFD0DZp2GdqWZnzP6xmW3Emvv+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HFYa8OSLW2bzASqZj0O0TTJllfrqrlWL7EZf1xb1ykzMhXbf3JUPM/adCEyp4+eqH
         t39Mm6vv1ladsTYMiLJ3gPWsMYCtPNB61pTegFcfJLkI1z11MbfiWyVH/7PIsvLMF0
         KWYH2Z/xx5shqMiaR94WYe6pqp9vZk0fkkyFwhbE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 024/107] media: ti-vpe: cal: Rename cc_data to cal_camerarx
Date:   Mon, 15 Jun 2020 02:58:21 +0300
Message-Id: <20200614235944.17716-25-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The various data structures that describe the components of the camera
access layer (CAL) are named without much consistency. Start cleaning
this up by renaming the structure that describes the CAMERARX block,
cc_data, to cal_camerarx.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 46 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 38a7c78e425e..df756c7b53b7 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -215,16 +215,6 @@ enum cal_camerarx_field {
 	F_MAX_FIELDS,
 };
 
-struct cc_data {
-	void __iomem		*base;
-	struct resource		*res;
-	struct platform_device	*pdev;
-
-	struct {
-		struct regmap_field *fields[F_MAX_FIELDS];
-	} phy;
-};
-
 struct cal_csi2_phy {
 	struct {
 		unsigned int lsb;
@@ -315,9 +305,26 @@ static const struct cal_data am654_cal_data = {
 };
 
 /*
- * there is one cal_dev structure in the driver, it is shared by
- * all instances.
+ * The Camera Adaptation Layer (CAL) module is paired with one or more complex
+ * I/O PHYs (CAMERARX). It contains multiple instances of CSI-2, processing and
+ * DMA contexts.
+ *
+ * The cal_dev structure represents the whole subsystem, including the CAL and
+ * the CAMERARX instances. The cal_camerarx structure represents one CAMERARX
+ * instance. The cal_ctx structure represents the combination of one CSI-2
+ * context, one processing context and one DMA context.
  */
+
+struct cal_camerarx {
+	void __iomem		*base;
+	struct resource		*res;
+	struct platform_device	*pdev;
+
+	struct {
+		struct regmap_field *fields[F_MAX_FIELDS];
+	} phy;
+};
+
 struct cal_dev {
 	struct clk		*fclk;
 	int			irq;
@@ -333,7 +340,7 @@ struct cal_dev {
 	u32			syscon_camerrx_offset;
 
 	/* Camera Core Module handle */
-	struct cc_data		*cc[CAL_NUM_CSI2_PORTS];
+	struct cal_camerarx	*cc[CAL_NUM_CSI2_PORTS];
 
 	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
 };
@@ -350,7 +357,7 @@ struct cal_ctx {
 	struct v4l2_fwnode_endpoint	endpoint;
 
 	struct cal_dev		*dev;
-	struct cc_data		*cc;
+	struct cal_camerarx	*cc;
 
 	/* v4l2_ioctl mutex */
 	struct mutex		mutex;
@@ -457,7 +464,8 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *dev)
 	return dev->data->num_csi2_phy;
 }
 
-static int cal_camerarx_regmap_init(struct cal_dev *dev, struct cc_data *cc,
+static int cal_camerarx_regmap_init(struct cal_dev *dev,
+				    struct cal_camerarx *cc,
 				    unsigned int idx)
 {
 	const struct cal_csi2_phy *phy;
@@ -528,7 +536,7 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
 static void camerarx_phy_enable(struct cal_ctx *ctx)
 {
 	u32 phy_id = ctx->csi2_port;
-	struct cc_data *cc = ctx->dev->cc[phy_id];
+	struct cal_camerarx *cc = ctx->dev->cc[phy_id];
 	u32 max_lanes;
 
 	regmap_field_write(cc->phy.fields[F_CAMMODE], 0);
@@ -544,7 +552,7 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
 static void camerarx_phy_disable(struct cal_ctx *ctx)
 {
 	u32 phy_id = ctx->csi2_port;
-	struct cc_data *cc = ctx->dev->cc[phy_id];
+	struct cal_camerarx *cc = ctx->dev->cc[phy_id];
 
 	regmap_field_write(cc->phy.fields[F_CTRLCLKEN], 0);
 }
@@ -552,10 +560,10 @@ static void camerarx_phy_disable(struct cal_ctx *ctx)
 /*
  * Camera Instance access block
  */
-static struct cc_data *cc_create(struct cal_dev *dev, unsigned int core)
+static struct cal_camerarx *cc_create(struct cal_dev *dev, unsigned int core)
 {
 	struct platform_device *pdev = dev->pdev;
-	struct cc_data *cc;
+	struct cal_camerarx *cc;
 	int ret;
 
 	cc = devm_kzalloc(&pdev->dev, sizeof(*cc), GFP_KERNEL);
-- 
Regards,

Laurent Pinchart

