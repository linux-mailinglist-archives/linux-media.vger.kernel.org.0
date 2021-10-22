Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081EA437353
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhJVH5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:57:34 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:13668 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbhJVH5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889295; x=1666425295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1GT8uqsv1PvTE+w2q+eOd1uaZzWC5KHZ8sqS85toEos=;
  b=UErz2OkU8Ezsya7ozGYmTkd/UdgkpN/wn/REv00ASMGOvZCTz0gjbiwz
   zgftbAYf7ChnXXbGcB0ui9XHWZctPUzLumktl9NGAtthOySGbh/D/B10/
   idawFj3kDFl4JOu+g6474ZnO4UqQRXHiA95hqZYc6bTfYixPRymNWL7Wg
   3+vuiHJ8dv3XksMqETPLJI/gogVwLmIPpPN0JcwXwZ+gLm9DqRChwNv0/
   R8sttzuARICrw1xxPifNnxSVNCAMH9Mqk7qg2Y0F9tyFKVH//t+5DuK88
   re1fpIV0FUEbLx0YbTvz6+Z7wIHRb80yKc84q5ve1V62exEyzLeurK9mm
   A==;
IronPort-SDR: GjcNflvWfkh5na0E2ZC3jyHo3m+dK+n/f/FFivCstzNKx8s89kXKRnPl6zL4Yq7aLtzJ97zX9r
 +DqbXXrMzQUUfRjwdKxOtEjgxwIv7r7y1iBaHUwGHhFxLQ0avUMr5/4OtPE5ZDWkinX1Vn926c
 nSbPusXwGBg2UU+ME4y/cAnFuZxn6ITCW8PnKxnLGU3n8nM8b9y/OcYjCk7ncGcuXBw0PuocOK
 ETwlUMgVTcVmEi92hS3grSCmehDbkjrvrNNFgzqBRJUyTPEWITetAuMSuxVEfMb1PP3j7TrXrY
 neMq0LDg2GOW/gEGBvYMsYjX
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="141320579"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:54 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:50 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 19/21] media: atmel: atmel-isc-base: use mutex to lock awb workqueue from streaming
Date:   Fri, 22 Oct 2021 10:52:45 +0300
Message-ID: <20211022075247.518880-20-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AWB workqueue runs in a kernel thread and needs to be synchronized
w.r.t. the streaming status.
It is possible that streaming is stopped while the AWB workq is running.
In this case it is likely that the check for isc->stop is done at one point
in time, but the AWB computations are done later, including a call to
isc_update_profile, which requires streaming to be started.
Thus , isc_update_profile will fail if during this operation sequence the
streaming was stopped.
To solve this issue, a mutex is added, that will serialize the awb work and
streaming stopping, with the mention that either streaming is stopped
completely including termination of the last frame is done, and after that
the AWB work can check stream status and stop; either first AWB work is
completed and after that the streaming can stop correctly.
The awb spin lock cannot be used since this spinlock is taken in the same
context and using it in the stop streaming will result in a recursion BUG.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 31 ++++++++++++++++---
 drivers/media/platform/atmel/atmel-isc.h      |  1 +
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index a0e4bc75d1a2..7ebe0a2d130f 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -402,6 +402,7 @@ static void isc_stop_streaming(struct vb2_queue *vq)
 	struct isc_buffer *buf;
 	int ret;
 
+	mutex_lock(&isc->awb_mutex);
 	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
 
 	isc->stop = true;
@@ -411,6 +412,8 @@ static void isc_stop_streaming(struct vb2_queue *vq)
 		v4l2_err(&isc->v4l2_dev,
 			 "Timeout waiting for end of the capture\n");
 
+	mutex_unlock(&isc->awb_mutex);
+
 	/* Disable DMA interrupt */
 	regmap_write(isc->regmap, ISC_INTDIS, ISC_INT_DDONE);
 
@@ -1417,10 +1420,6 @@ static void isc_awb_work(struct work_struct *w)
 	u32 min, max;
 	int ret;
 
-	/* streaming is not active anymore */
-	if (isc->stop)
-		return;
-
 	if (ctrls->hist_stat != HIST_ENABLED)
 		return;
 
@@ -1471,7 +1470,24 @@ static void isc_awb_work(struct work_struct *w)
 	}
 	regmap_write(regmap, ISC_HIS_CFG + isc->offsets.his,
 		     hist_id | baysel | ISC_HIS_CFG_RAR);
+
+	/*
+	 * We have to make sure the streaming has not stopped meanwhile.
+	 * ISC requires a frame to clock the internal profile update.
+	 * To avoid issues, lock the sequence with a mutex
+	 */
+	mutex_lock(&isc->awb_mutex);
+
+	/* streaming is not active anymore */
+	if (isc->stop) {
+		mutex_unlock(&isc->awb_mutex);
+		return;
+	};
+
 	isc_update_profile(isc);
+
+	mutex_unlock(&isc->awb_mutex);
+
 	/* if awb has been disabled, we don't need to start another histogram */
 	if (ctrls->awb)
 		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
@@ -1550,6 +1566,8 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 
 		isc_update_awb_ctrls(isc);
 
+		mutex_lock(&isc->awb_mutex);
+
 		if (!isc->stop) {
 			/*
 			 * If we are streaming, we can update profile to
@@ -1564,6 +1582,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 			 */
 			v4l2_ctrl_activate(isc->do_wb_ctrl, false);
 		}
+		mutex_unlock(&isc->awb_mutex);
 
 		/* if we have autowhitebalance on, start histogram procedure */
 		if (ctrls->awb == ISC_WB_AUTO && !isc->stop &&
@@ -1755,6 +1774,7 @@ static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct isc_device *isc = container_of(notifier->v4l2_dev,
 					      struct isc_device, v4l2_dev);
+	mutex_destroy(&isc->awb_mutex);
 	cancel_work_sync(&isc->awb_work);
 	video_unregister_device(&isc->video_dev);
 	v4l2_ctrl_handler_free(&isc->ctrls.handler);
@@ -1866,6 +1886,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	isc->current_subdev = container_of(notifier,
 					   struct isc_subdev_entity, notifier);
 	mutex_init(&isc->lock);
+	mutex_init(&isc->awb_mutex);
+
 	init_completion(&isc->comp);
 
 	/* Initialize videobuf2 queue */
@@ -1941,6 +1963,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	video_unregister_device(vdev);
 
 isc_async_complete_err:
+	mutex_destroy(&isc->awb_mutex);
 	mutex_destroy(&isc->lock);
 	return ret;
 }
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 27292c50915e..93ee000279f2 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -294,6 +294,7 @@ struct isc_device {
 	struct work_struct	awb_work;
 
 	struct mutex		lock; /* serialize access to file operations */
+	struct mutex		awb_mutex; /* serialize access to streaming status from awb work queue */
 	spinlock_t		awb_lock; /* serialize access to DMA buffers from awb work queue */
 
 	struct regmap_field	*pipeline[ISC_PIPE_LINE_NODE_NUM];
-- 
2.25.1

