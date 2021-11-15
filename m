Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265024506BC
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbhKOO1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:27:42 -0500
Received: from aposti.net ([89.234.176.197]:51228 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236232AbhKOO0v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:26:51 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Alexandru Ardelean <ardeleanalex@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 05/15] iio: buffer-dmaengine: Support specifying buffer direction
Date:   Mon, 15 Nov 2021 14:19:15 +0000
Message-Id: <20211115141925.60164-6-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the devm_iio_dmaengine_buffer_setup() function to support
specifying the buffer direction.

Update the iio_dmaengine_buffer_submit() function to handle input
buffers as well as output buffers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/adc/adi-axi-adc.c                 |  3 ++-
 .../buffer/industrialio-buffer-dmaengine.c    | 24 +++++++++++++++----
 include/linux/iio/buffer-dmaengine.h          |  5 +++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index a73e3c2d212f..0a6f2c32b1b9 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -113,7 +113,8 @@ static int adi_axi_adc_config_dma_buffer(struct device *dev,
 		dma_name = "rx";
 
 	return devm_iio_dmaengine_buffer_setup(indio_dev->dev.parent,
-					       indio_dev, dma_name);
+					       indio_dev, dma_name,
+					       IIO_BUFFER_DIRECTION_IN);
 }
 
 static int adi_axi_adc_read_raw(struct iio_dev *indio_dev,
diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index f8ce26a24c57..ac26b04aa4a9 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -64,14 +64,25 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 	struct dmaengine_buffer *dmaengine_buffer =
 		iio_buffer_to_dmaengine_buffer(&queue->buffer);
 	struct dma_async_tx_descriptor *desc;
+	enum dma_transfer_direction dma_dir;
+	size_t max_size;
 	dma_cookie_t cookie;
 
-	block->bytes_used = min(block->size, dmaengine_buffer->max_size);
-	block->bytes_used = round_down(block->bytes_used,
-			dmaengine_buffer->align);
+	max_size = min(block->size, dmaengine_buffer->max_size);
+	max_size = round_down(max_size, dmaengine_buffer->align);
+
+	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
+		block->bytes_used = max_size;
+		dma_dir = DMA_DEV_TO_MEM;
+	} else {
+		dma_dir = DMA_MEM_TO_DEV;
+	}
+
+	if (!block->bytes_used || block->bytes_used > max_size)
+		return -EINVAL;
 
 	desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
-		block->phys_addr, block->bytes_used, DMA_DEV_TO_MEM,
+		block->phys_addr, block->bytes_used, dma_dir,
 		DMA_PREP_INTERRUPT);
 	if (!desc)
 		return -ENOMEM;
@@ -275,7 +286,8 @@ static struct iio_buffer *devm_iio_dmaengine_buffer_alloc(struct device *dev,
  */
 int devm_iio_dmaengine_buffer_setup(struct device *dev,
 				    struct iio_dev *indio_dev,
-				    const char *channel)
+				    const char *channel,
+				    enum iio_buffer_direction dir)
 {
 	struct iio_buffer *buffer;
 
@@ -286,6 +298,8 @@ int devm_iio_dmaengine_buffer_setup(struct device *dev,
 
 	indio_dev->modes |= INDIO_BUFFER_HARDWARE;
 
+	buffer->direction = dir;
+
 	return iio_device_attach_buffer(indio_dev, buffer);
 }
 EXPORT_SYMBOL_GPL(devm_iio_dmaengine_buffer_setup);
diff --git a/include/linux/iio/buffer-dmaengine.h b/include/linux/iio/buffer-dmaengine.h
index 5c355be89814..538d0479cdd6 100644
--- a/include/linux/iio/buffer-dmaengine.h
+++ b/include/linux/iio/buffer-dmaengine.h
@@ -7,11 +7,14 @@
 #ifndef __IIO_DMAENGINE_H__
 #define __IIO_DMAENGINE_H__
 
+#include <linux/iio/buffer.h>
+
 struct iio_dev;
 struct device;
 
 int devm_iio_dmaengine_buffer_setup(struct device *dev,
 				    struct iio_dev *indio_dev,
-				    const char *channel);
+				    const char *channel,
+				    enum iio_buffer_direction dir);
 
 #endif
-- 
2.33.0

