Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE75043732C
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhJVH4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:33 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbhJVH4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889254; x=1666425254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gcb+lnpjPb51M6Oj/PPqswwgdjHYl153vJF1lo5rimE=;
  b=rlP71XSEiNPbp1yGWkJriJms5LKiq1SW+M6JLLUAbzp36vh9jxLTsY/7
   79zSJYU/c9KgIbtgJ/rtNTdJ9zyRkmVbCoyHbS6+EcM6dghZHntoEfweg
   JP/xxEDqw39Cyli4U2MfYgrNA+IKS/+w0Jpx/6rh0QoYEdaDXah8jUkIH
   cd/5+yKuV1HMb2g+75WwtJHV+h/OD49CyZXhhEh5GYHtSk30k6a3F6GX1
   k6344Iil1Y4U1A+WDDJAaEmlFg9cdiLcxtc8paJOzqwSzRtDHjfmcEakL
   AnPVln/RZJWR8PcLdv/EH4J/xJ3JsL99lq35r3I+ki1enk3z/fx57tadM
   Q==;
IronPort-SDR: biDkLlip17oxnkF2jKE70Mfk0IlDOq8R3NLj8ilE2cQRdNS4Bq24W0uxAPUCL9psuWLR3458Rt
 D7QrP4ljohElJa79uRoZFTd1gCA/aWlIIpBRQfLfGJDsaS645SStzD/KGCvW1na04dbClcs6s4
 Lplk5sqyvn5xWtHNgNiFJNMRjsFlEmyyUb0tCWz5tc6Y+swLsA7TAYPvErNgNOVhJ4+W4lYo1J
 P52aT3d3aadhHBz8FWi3E8aWEpuPEMXhFoahW7+DQaMzHra3paIYm5MTFdjE+6JKhFFZ2k16Pc
 rbbL4+SX16zZ1FBKsuzx9DwM
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141211"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:13 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:09 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 08/21] media: atmel: atmel-isc-base: use streaming status when queueing buffers
Date:   Fri, 22 Oct 2021 10:52:34 +0300
Message-ID: <20211022075247.518880-9-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
index f3e89a892373..6f14cc549543 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -442,12 +442,14 @@ static void isc_buffer_queue(struct vb2_buffer *vb)
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
 
@@ -1015,7 +1017,7 @@ static int isc_s_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct isc_device *isc = video_drvdata(file);
 
-	if (vb2_is_streaming(&isc->vb2_vidq))
+	if (!isc->stop)
 		return -EBUSY;
 
 	return isc_set_fmt(isc, f);
@@ -1537,7 +1539,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 
 		isc_update_awb_ctrls(isc);
 
-		if (vb2_is_streaming(&isc->vb2_vidq)) {
+		if (!isc->stop) {
 			/*
 			 * If we are streaming, we can update profile to
 			 * have the new settings in place.
@@ -1553,8 +1555,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 		}
 
 		/* if we have autowhitebalance on, start histogram procedure */
-		if (ctrls->awb == ISC_WB_AUTO &&
-		    vb2_is_streaming(&isc->vb2_vidq) &&
+		if (ctrls->awb == ISC_WB_AUTO && !isc->stop &&
 		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
 			isc_set_histogram(isc, true);
 
@@ -1830,6 +1831,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	struct vb2_queue *q = &isc->vb2_vidq;
 	int ret = 0;
 
+	isc->stop = true;
+
 	INIT_WORK(&isc->awb_work, isc_awb_work);
 
 	ret = v4l2_device_register_subdev_nodes(&isc->v4l2_dev);
-- 
2.25.1

