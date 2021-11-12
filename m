Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2DA44E8B5
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbhKLObD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:03 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55248 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbhKLObC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727291; x=1668263291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7zR7YV+/NaEAUBvJ084GX1l4HCMOCQS7YcMiVzt3gE=;
  b=1XCgFME157ENP/MmsWg7M2tYj3BrJsyHR5Wqx6d7tCIbJXJJQyeADYa8
   MdWukNphOGW7mOunVpmM7fakGdWzDcF8iDBXGdVHbo5bHChjIbs/xF/qY
   Kj8TaZ3L5bjJeoRlORKlHvL6SGMkFfOo6SqrNNLi23sctpmezR0eR2d6k
   0rfdRK7s03OW8sxWikOo3IRA8EYuEG2ypEH6ah5yEg9I8fH8jB1s0psaB
   yo8kHblLaxiz+IlzfrArGXe3LKV24rE9NV0yA7UHOtYC0mClc8e/Uk5GF
   rSvrzfgni8ipLsqZlrFF59eERPFsZdgeTwcgXW3mpSnWBu5VxK9Sy4wvZ
   A==;
IronPort-SDR: Fg1JGnFlYJezOOu5tk9FvQJXvNqOP6Sk4Fq1apqY+o6vjCauLz3KflIOV0nsN+moF1nPmJpuuf
 XkCc3e3r9x/LACk2nnIGyf4zvDcqYQ7RDhgDqGSeEr6FtPkyZGEaYXWUBaDNK9jK+0H5PuR40o
 GpmkEC532wn2RMzQtZFD6/A5DPO3DEMN+geUlmmSaItZUvVNOzLhhwne+XHozE4mwYlhGoZdju
 ptKRUL/UtSQeKFsEiEdUvBqGj3XJFIsTkURrG30clQ6o+GnQV/ftKfSCnp357Q4E6NQr08r+CW
 0P82MT8F1D6/9vVvM9o+8R4J
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="136387855"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:27:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:27:58 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:27:47 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 08/25] media: atmel: atmel-isc-base: use streaming status when queueing buffers
Date:   Fri, 12 Nov 2021 16:24:52 +0200
Message-ID: <20211112142509.2230884-9-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During experiments with libcamera, it looks like vb2_is_streaming returns
true before our start streaming is called.
Order of operations is streamon -> queue -> start_streaming
ISC would have started the DMA immediately when a buffer is being added
to the vbqueue if the queue is streaming.
It is more safe to start the DMA after the start streaming of the driver is
called.
Thus, even if vb2queue is streaming, add the buffer to the dma queue of the
driver instead of actually starting the DMA process, if the start streaming
has not been called yet.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 26a6090f056c..e6c9071c04f0 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -441,12 +441,14 @@ static void isc_buffer_queue(struct vb2_buffer *vb)
 	unsigned long flags;
 
 	spin_lock_irqsave(&isc->dma_queue_lock, flags);
-	if (!isc->cur_frm && list_empty(&isc->dma_queue) &&
-		vb2_is_streaming(vb->vb2_queue)) {
+
+	if (!isc->cur_frm && list_empty(&isc->dma_queue) && !isc->stop) {
 		isc->cur_frm = buf;
 		isc_start_dma(isc);
-	} else
+	} else {
 		list_add_tail(&buf->list, &isc->dma_queue);
+	}
+
 	spin_unlock_irqrestore(&isc->dma_queue_lock, flags);
 }
 
@@ -1014,7 +1016,7 @@ static int isc_s_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct isc_device *isc = video_drvdata(file);
 
-	if (vb2_is_streaming(&isc->vb2_vidq))
+	if (!isc->stop)
 		return -EBUSY;
 
 	return isc_set_fmt(isc, f);
@@ -1536,7 +1538,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 
 		isc_update_awb_ctrls(isc);
 
-		if (vb2_is_streaming(&isc->vb2_vidq)) {
+		if (!isc->stop) {
 			/*
 			 * If we are streaming, we can update profile to
 			 * have the new settings in place.
@@ -1552,8 +1554,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 		}
 
 		/* if we have autowhitebalance on, start histogram procedure */
-		if (ctrls->awb == ISC_WB_AUTO &&
-		    vb2_is_streaming(&isc->vb2_vidq) &&
+		if (ctrls->awb == ISC_WB_AUTO && !isc->stop &&
 		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
 			isc_set_histogram(isc, true);
 
@@ -1829,6 +1830,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	struct vb2_queue *q = &isc->vb2_vidq;
 	int ret = 0;
 
+	isc->stop = true;
+
 	INIT_WORK(&isc->awb_work, isc_awb_work);
 
 	ret = v4l2_device_register_subdev_nodes(&isc->v4l2_dev);
-- 
2.25.1

