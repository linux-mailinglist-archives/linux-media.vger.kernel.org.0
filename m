Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0CD4D35C9
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236527AbiCIQrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbiCIQpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:45:44 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA73A1BCF;
        Wed,  9 Mar 2022 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646843958; x=1678379958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LThCuAfW7xET2MZo5q9C4gm+wpOhS9QVzkmQqBCA9Y8=;
  b=e8HmjTm2A5yYx+3mzJ/a/erAsG233l3StTZdsdIUDGRmv2XE8HmuY3r2
   lWmovkBbi87ynAJd6WJHPEyp4yn329iTVUbaZMjKAvFLHlK2NzMByteHB
   nX8GBJny2X9W/LC8mu57arUN1ZU8kEiyXmV2in8+s5xa6A6wPSRHG4cb7
   ddN1TeBvBOMzw0Be0oKPi015POKgnFTPXXj9l+l/MoS0ARaBYtzZyjprf
   7N0SqvpLnHZg4JrAtUBAOn2gzx8kt6/AXGD0aoUpNtnfSSdaeE3XAK8WP
   0bJ9jdr5KsuRxhA7B5iIhFJZfY3DMowFZWz/YBbxmr7rwv233zehk7U0Q
   A==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; 
   d="scan'208";a="148642762"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2022 09:39:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 09:39:16 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 09:39:07 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <jacopo@jmondi.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <claudiu.beznea@microchip.com>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v8 06/13] media: atmel: atmel-isc-base: use mutex to lock awb workqueue from streaming
Date:   Wed, 9 Mar 2022 18:37:51 +0200
Message-ID: <20220309163758.2672727-7-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309163758.2672727-1-eugen.hristev@microchip.com>
References: <20220309163758.2672727-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AWB workqueue runs in a kernel thread and needs to be synchronized
w.r.t. the streaming status.
It is possible that streaming is stopped while the AWB workq is running.
In this case it is likely that the check for vb2_start_streaming_called is done
at one point in time, but the AWB computations are done later, including a call
to isc_update_profile, which requires streaming to be started.
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
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 29 ++++++++++++++++---
 drivers/media/platform/atmel/atmel-isc.h      |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 448bf281c61a..ee1dda6707a0 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -401,6 +401,7 @@ static void isc_stop_streaming(struct vb2_queue *vq)
 	struct isc_buffer *buf;
 	int ret;
 
+	mutex_lock(&isc->awb_mutex);
 	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
 
 	isc->stop = true;
@@ -410,6 +411,8 @@ static void isc_stop_streaming(struct vb2_queue *vq)
 		v4l2_err(&isc->v4l2_dev,
 			 "Timeout waiting for end of the capture\n");
 
+	mutex_unlock(&isc->awb_mutex);
+
 	/* Disable DMA interrupt */
 	regmap_write(isc->regmap, ISC_INTDIS, ISC_INT_DDONE);
 
@@ -1397,10 +1400,6 @@ static void isc_awb_work(struct work_struct *w)
 	u32 min, max;
 	int ret;
 
-	/* streaming is not active anymore */
-	if (isc->stop)
-		return;
-
 	if (ctrls->hist_stat != HIST_ENABLED)
 		return;
 
@@ -1455,7 +1454,24 @@ static void isc_awb_work(struct work_struct *w)
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
@@ -1548,6 +1564,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 			 */
 			v4l2_ctrl_activate(isc->do_wb_ctrl, false);
 		}
+		mutex_unlock(&isc->awb_mutex);
 
 		/* if we have autowhitebalance on, start histogram procedure */
 		if (ctrls->awb == ISC_WB_AUTO &&
@@ -1740,6 +1757,7 @@ static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct isc_device *isc = container_of(notifier->v4l2_dev,
 					      struct isc_device, v4l2_dev);
+	mutex_destroy(&isc->awb_mutex);
 	cancel_work_sync(&isc->awb_work);
 	video_unregister_device(&isc->video_dev);
 	v4l2_ctrl_handler_free(&isc->ctrls.handler);
@@ -1850,6 +1868,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	isc->current_subdev = container_of(notifier,
 					   struct isc_subdev_entity, notifier);
 	mutex_init(&isc->lock);
+	mutex_init(&isc->awb_mutex);
+
 	init_completion(&isc->comp);
 
 	/* Initialize videobuf2 queue */
@@ -1930,6 +1950,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	video_unregister_device(vdev);
 
 isc_async_complete_err:
+	mutex_destroy(&isc->awb_mutex);
 	mutex_destroy(&isc->lock);
 	return ret;
 }
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 9cc69c3ae26d..f98f25a55e73 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -229,6 +229,7 @@ enum isc_scaler_pads {
  *
  * @lock:		lock for serializing userspace file operations
  *			with ISC operations
+ * @awb_mutex:		serialize access to streaming status from awb work queue
  * @awb_lock:		lock for serializing awb work queue operations
  *			with DMA/buffer operations
  *
@@ -307,6 +308,7 @@ struct isc_device {
 	struct work_struct	awb_work;
 
 	struct mutex		lock;
+	struct mutex		awb_mutex;
 	spinlock_t		awb_lock;
 
 	struct regmap_field	*pipeline[ISC_PIPE_LINE_NODE_NUM];
-- 
2.25.1

