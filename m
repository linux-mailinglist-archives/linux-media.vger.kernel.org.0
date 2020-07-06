Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25F7215EB8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgGFSij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729982AbgGFSii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:38 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE1D51A55;
        Mon,  6 Jul 2020 20:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060695;
        bh=KGrJE/w2dKbBFDG3fb2FFsJMh/o5UO1U4TqfNHMEnfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YRjYSnTnXnIIDIDcJjfuga0oQ+RP54E0Pt9+Ia2QCfnLkN78Q1SyAy5XbGnhebEed
         FYodCkYZPNW+s0oqaodUPu85CVWoZjeYYAsJr+viwqtNVfWwR9rbwAfbVehDV/hTMQ
         9Wxn6c+udz0y6gyLMGy58nFMbRR2NgG7OmKUeW3I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 072/108] media: ti-vpe: cal: Store struct device in cal_dev
Date:   Mon,  6 Jul 2020 21:36:33 +0300
Message-Id: <20200706183709.12238-73-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_dev structure stores the platform_device pointer, but most
accesses to that field need the device pointer. Store the struct device
pointer directly to simplify the code, and use to_platform_device() in
the two locations that need the platform device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 55 ++++++++++++++---------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ec52cb7f3039..42b948e784d2 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -53,13 +53,12 @@ MODULE_PARM_DESC(debug, "activates debug info");
 #define cal_dbg(level, cal, fmt, arg...)				\
 	do {								\
 		if (debug >= (level))					\
-			dev_printk(KERN_DEBUG, &(cal)->pdev->dev,	\
-				   fmt,	##arg);				\
+			dev_printk(KERN_DEBUG, (cal)->dev, fmt, ##arg);	\
 	} while (0)
 #define cal_info(cal, fmt, arg...)	\
-	dev_info(&(cal)->pdev->dev, fmt, ##arg)
+	dev_info((cal)->dev, fmt, ##arg)
 #define cal_err(cal, fmt, arg...)	\
-	dev_err(&(cal)->pdev->dev, fmt, ##arg)
+	dev_err((cal)->dev, fmt, ##arg)
 
 #define ctx_dbg(level, ctx, fmt, arg...)	\
 	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
@@ -263,7 +262,7 @@ struct cal_data {
 struct cal_camerarx {
 	void __iomem		*base;
 	struct resource		*res;
-	struct platform_device	*pdev;
+	struct device		*dev;
 	struct regmap_field	*fields[F_MAX_FIELDS];
 
 	struct cal_dev		*cal;
@@ -280,7 +279,7 @@ struct cal_dev {
 	int			irq;
 	void __iomem		*base;
 	struct resource		*res;
-	struct platform_device	*pdev;
+	struct device		*dev;
 
 	const struct cal_data	*data;
 
@@ -908,7 +907,7 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 		 * Here we update the reg offset with the
 		 * value found in DT
 		 */
-		phy->fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
+		phy->fields[i] = devm_regmap_field_alloc(cal->dev,
 							 cal->syscon_camerrx,
 							 field);
 		if (IS_ERR(phy->fields[i])) {
@@ -923,7 +922,6 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
-	struct platform_device *pdev = phy->cal->pdev;
 	struct device_node *ep_node;
 	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
 	unsigned int i;
@@ -933,7 +931,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 	 * Find the endpoint node for the port corresponding to the PHY
 	 * instance, and parse its CSI-2-related properties.
 	 */
-	ep_node = of_graph_get_endpoint_by_regs(pdev->dev.of_node,
+	ep_node = of_graph_get_endpoint_by_regs(phy->cal->dev->of_node,
 						phy->instance, 0);
 	if (!ep_node) {
 		/*
@@ -990,7 +988,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 						unsigned int instance)
 {
-	struct platform_device *pdev = cal->pdev;
+	struct platform_device *pdev = to_platform_device(cal->dev);
 	struct cal_camerarx *phy;
 	int ret;
 
@@ -1006,7 +1004,7 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 						(instance == 0) ?
 						"cal_rx_core0" :
 						"cal_rx_core1");
-	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
+	phy->base = devm_ioremap_resource(cal->dev, phy->res);
 	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
 		ret = PTR_ERR(phy->base);
@@ -1042,7 +1040,8 @@ static void cal_camerarx_destroy(struct cal_camerarx *phy)
 
 static int cal_camerarx_init_regmap(struct cal_dev *cal)
 {
-	struct device_node *np = cal->pdev->dev.of_node;
+	struct platform_device *pdev = to_platform_device(cal->dev);
+	struct device_node *np = cal->dev->of_node;
 	struct regmap_config config = { };
 	struct regmap *syscon;
 	struct resource *res;
@@ -1057,16 +1056,16 @@ static int cal_camerarx_init_regmap(struct cal_dev *cal)
 		return 0;
 	}
 
-	dev_warn(&cal->pdev->dev, "failed to get ti,camerrx-control: %ld\n",
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
 		 PTR_ERR(syscon));
 
 	/*
 	 * Backward DTS compatibility. If syscon entry is not present then
 	 * check if the camerrx_control resource is present.
 	 */
-	res = platform_get_resource_byname(cal->pdev, IORESOURCE_MEM,
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					   "camerrx_control");
-	base = devm_ioremap_resource(&cal->pdev->dev, res);
+	base = devm_ioremap_resource(cal->dev, res);
 	if (IS_ERR(base)) {
 		cal_err(cal, "failed to ioremap camerrx_control\n");
 		return PTR_ERR(base);
@@ -1157,7 +1156,7 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		 *
 		 * Instead of failing here just use 8 bpp as a default.
 		 */
-		dev_warn_once(&ctx->cal->pdev->dev,
+		dev_warn_once(ctx->cal->dev,
 			      "%s:%d:%s: bpp:%d unsupported! Overwritten with 8.\n",
 			      __FILE__, __LINE__, __func__, ctx->fmt->bpp);
 		extract = CAL_PIX_PROC_EXTRACT_B8;
@@ -1279,14 +1278,14 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		reg_write(cal, CAL_HL_IRQSTATUS(0), status);
 
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
-			dev_err_ratelimited(&cal->pdev->dev, "OCPO ERROR\n");
+			dev_err_ratelimited(cal->dev, "OCPO ERROR\n");
 
 		for (i = 0; i < CAL_NUM_CSI2_PORTS; ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = reg_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
-				dev_err_ratelimited(&cal->pdev->dev,
+				dev_err_ratelimited(cal->dev,
 						    "CIO%u error: %#08x\n", i, cio_stat);
 
 				reg_write(cal, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
@@ -1388,7 +1387,7 @@ static int cal_querycap(struct file *file, void *priv,
 	strscpy(cap->card, CAL_MODULE_NAME, sizeof(cap->card));
 
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", dev_name(&ctx->cal->pdev->dev));
+		 "platform:%s", dev_name(ctx->cal->dev));
 	return 0;
 }
 
@@ -1822,7 +1821,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 	}
 
-	pm_runtime_get_sync(&ctx->cal->pdev->dev);
+	pm_runtime_get_sync(ctx->cal->dev);
 
 	cal_ctx_csi2_config(ctx);
 	cal_ctx_pix_proc_config(ctx);
@@ -1837,7 +1836,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret) {
 		v4l2_subdev_call(ctx->phy->sensor, core, s_power, 0);
 		ctx_err(ctx, "stream on failed in subdev\n");
-		pm_runtime_put_sync(&ctx->cal->pdev->dev);
+		pm_runtime_put_sync(ctx->cal->dev);
 		goto err;
 	}
 
@@ -1917,7 +1916,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	ctx->next_frm = NULL;
 	spin_unlock_irqrestore(&ctx->slock, flags);
 
-	pm_runtime_put_sync(&ctx->cal->pdev->dev);
+	pm_runtime_put_sync(ctx->cal->dev);
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -2065,7 +2064,7 @@ static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &ctx->mutex;
 	q->min_buffers_needed = 3;
-	q->dev = &ctx->cal->pdev->dev;
+	q->dev = ctx->cal->dev;
 
 	ret = vb2_queue_init(q);
 	if (ret)
@@ -2266,13 +2265,13 @@ static int cal_media_init(struct cal_dev *cal)
 	 * Initialize the V4L2 device (despite the function name, this performs
 	 * initialization, not registration).
 	 */
-	ret = v4l2_device_register(&cal->pdev->dev, &cal->v4l2_dev);
+	ret = v4l2_device_register(cal->dev, &cal->v4l2_dev);
 	if (ret) {
 		cal_err(cal, "Failed to register V4L2 device\n");
 		return ret;
 	}
 
-	vb2_dma_contig_set_max_seg_size(&cal->pdev->dev, DMA_BIT_MASK(32));
+	vb2_dma_contig_set_max_seg_size(cal->dev, DMA_BIT_MASK(32));
 
 	return 0;
 }
@@ -2292,7 +2291,7 @@ static void cal_media_cleanup(struct cal_dev *cal)
 	}
 
 	v4l2_device_unregister(&cal->v4l2_dev);
-	vb2_dma_contig_clear_max_seg_size(&cal->pdev->dev);
+	vb2_dma_contig_clear_max_seg_size(cal->dev);
 }
 
 /* ------------------------------------------------------------------
@@ -2305,7 +2304,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	struct cal_ctx *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&cal->pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(cal->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
@@ -2393,7 +2392,7 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	cal->pdev = pdev;
+	cal->dev = &pdev->dev;
 	platform_set_drvdata(pdev, cal);
 
 	/* Acquire resources: clocks, CAMERARX regmap, I/O memory and IRQ. */
-- 
Regards,

Laurent Pinchart

