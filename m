Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05ADB4A75A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbfFRQpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50973 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730021AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-5Z; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 26/28] media: coda: store device pointer in driver structure instead of pdev
Date:   Tue, 18 Jun 2019 18:45:33 +0200
Message-Id: <20190618164535.20162-27-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
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

From: Philipp Zabel <philipp.zabel@gmail.com>

Currently the platform device pointer is stored in struct coda_dev,
only to convert it into a device pointer wherever it is used. Just
store the device pointer directly.

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/media/platform/coda/coda-bit.c    |  7 +++--
 drivers/media/platform/coda/coda-common.c | 33 +++++++++++------------
 drivers/media/platform/coda/coda.h        |  2 +-
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 167a92772c84..de6a4216a182 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1667,8 +1667,7 @@ static int coda_alloc_bitstream_buffer(struct coda_ctx *ctx,
 		return 0;
 
 	ctx->bitstream.size = roundup_pow_of_two(q_data->sizeimage * 2);
-	ctx->bitstream.vaddr = dma_alloc_wc(&ctx->dev->plat_dev->dev,
-					    ctx->bitstream.size,
+	ctx->bitstream.vaddr = dma_alloc_wc(ctx->dev->dev, ctx->bitstream.size,
 					    &ctx->bitstream.paddr, GFP_KERNEL);
 	if (!ctx->bitstream.vaddr) {
 		v4l2_err(&ctx->dev->v4l2_dev,
@@ -1686,8 +1685,8 @@ static void coda_free_bitstream_buffer(struct coda_ctx *ctx)
 	if (ctx->bitstream.vaddr == NULL)
 		return;
 
-	dma_free_wc(&ctx->dev->plat_dev->dev, ctx->bitstream.size,
-		    ctx->bitstream.vaddr, ctx->bitstream.paddr);
+	dma_free_wc(ctx->dev->dev, ctx->bitstream.size, ctx->bitstream.vaddr,
+		    ctx->bitstream.paddr);
 	ctx->bitstream.vaddr = NULL;
 	kfifo_init(&ctx->bitstream_fifo, NULL, 0);
 }
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index cd33c260409e..8060a3425325 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1413,7 +1413,7 @@ static void coda_pic_run_work(struct work_struct *work)
 
 	if (!wait_for_completion_timeout(&ctx->completion,
 					 msecs_to_jiffies(1000))) {
-		dev_err(&dev->plat_dev->dev, "CODA PIC_RUN timeout\n");
+		dev_err(dev->dev, "CODA PIC_RUN timeout\n");
 
 		ctx->hold = true;
 
@@ -1797,7 +1797,7 @@ static void coda_buf_queue(struct vb2_buffer *vb)
 int coda_alloc_aux_buf(struct coda_dev *dev, struct coda_aux_buf *buf,
 		       size_t size, const char *name, struct dentry *parent)
 {
-	buf->vaddr = dma_alloc_coherent(&dev->plat_dev->dev, size, &buf->paddr,
+	buf->vaddr = dma_alloc_coherent(dev->dev, size, &buf->paddr,
 					GFP_KERNEL);
 	if (!buf->vaddr) {
 		v4l2_err(&dev->v4l2_dev,
@@ -1814,7 +1814,7 @@ int coda_alloc_aux_buf(struct coda_dev *dev, struct coda_aux_buf *buf,
 		buf->dentry = debugfs_create_blob(name, 0644, parent,
 						  &buf->blob);
 		if (!buf->dentry)
-			dev_warn(&dev->plat_dev->dev,
+			dev_warn(dev->dev,
 				 "failed to create debugfs entry %s\n", name);
 	}
 
@@ -1825,8 +1825,7 @@ void coda_free_aux_buf(struct coda_dev *dev,
 		       struct coda_aux_buf *buf)
 {
 	if (buf->vaddr) {
-		dma_free_coherent(&dev->plat_dev->dev, buf->size,
-				  buf->vaddr, buf->paddr);
+		dma_free_coherent(dev->dev, buf->size, buf->vaddr, buf->paddr);
 		buf->vaddr = NULL;
 		buf->size = 0;
 		debugfs_remove(buf->dentry);
@@ -2344,7 +2343,7 @@ static int coda_queue_init(struct coda_ctx *ctx, struct vb2_queue *vq)
 	 * queues to have at least one buffer queued.
 	 */
 	vq->min_buffers_needed = 1;
-	vq->dev = &ctx->dev->plat_dev->dev;
+	vq->dev = ctx->dev->dev;
 
 	return vb2_queue_init(vq);
 }
@@ -2469,7 +2468,7 @@ static int coda_open(struct file *file)
 	ctx->use_vdoa = false;
 
 	/* Power up and upload firmware if necessary */
-	ret = pm_runtime_get_sync(&dev->plat_dev->dev);
+	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "failed to power up: %d\n", ret);
 		goto err_pm_get;
@@ -2517,7 +2516,7 @@ static int coda_open(struct file *file)
 err_clk_ahb:
 	clk_disable_unprepare(dev->clk_per);
 err_clk_per:
-	pm_runtime_put_sync(&dev->plat_dev->dev);
+	pm_runtime_put_sync(dev->dev);
 err_pm_get:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
@@ -2556,7 +2555,7 @@ static int coda_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrls);
 	clk_disable_unprepare(dev->clk_ahb);
 	clk_disable_unprepare(dev->clk_per);
-	pm_runtime_put_sync(&dev->plat_dev->dev);
+	pm_runtime_put_sync(dev->dev);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	ida_free(&dev->ida, ctx->idx);
@@ -2751,18 +2750,16 @@ static int coda_firmware_request(struct coda_dev *dev)
 
 	fw = dev->devtype->firmware[dev->firmware];
 
-	dev_dbg(&dev->plat_dev->dev, "requesting firmware '%s' for %s\n", fw,
+	dev_dbg(dev->dev, "requesting firmware '%s' for %s\n", fw,
 		coda_product_name(dev->devtype->product));
 
-	return request_firmware_nowait(THIS_MODULE, true, fw,
-				       &dev->plat_dev->dev, GFP_KERNEL, dev,
-				       coda_fw_callback);
+	return request_firmware_nowait(THIS_MODULE, true, fw, dev->dev,
+				       GFP_KERNEL, dev, coda_fw_callback);
 }
 
 static void coda_fw_callback(const struct firmware *fw, void *context)
 {
 	struct coda_dev *dev = context;
-	struct platform_device *pdev = dev->plat_dev;
 	int i, ret;
 
 	if (!fw) {
@@ -2780,7 +2777,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 		 * firmware requests, report that the fallback firmware was
 		 * found.
 		 */
-		dev_info(&pdev->dev, "Using fallback firmware %s\n",
+		dev_info(dev->dev, "Using fallback firmware %s\n",
 			 dev->devtype->firmware[dev->firmware]);
 	}
 
@@ -2819,7 +2816,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 		}
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev->dev);
 	return;
 
 rel_vfd:
@@ -2827,7 +2824,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 		video_unregister_device(&dev->vfd[i]);
 	v4l2_m2m_release(dev->m2m_dev);
 put_pm:
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev->dev);
 }
 
 enum coda_platform {
@@ -2960,7 +2957,7 @@ static int coda_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dev->irqlock);
 
-	dev->plat_dev = pdev;
+	dev->dev = &pdev->dev;
 	dev->clk_per = devm_clk_get(&pdev->dev, "per");
 	if (IS_ERR(dev->clk_per)) {
 		dev_err(&pdev->dev, "Could not get per clock\n");
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 5c183c1944fe..502a6272629a 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -70,7 +70,7 @@ struct coda_aux_buf {
 struct coda_dev {
 	struct v4l2_device	v4l2_dev;
 	struct video_device	vfd[5];
-	struct platform_device	*plat_dev;
+	struct device		*dev;
 	const struct coda_devtype *devtype;
 	int			firmware;
 	struct vdoa_data	*vdoa;
-- 
2.20.1

