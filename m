Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2F04D36AB
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236127AbiCIQql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbiCIQpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:45:00 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A6A2B260;
        Wed,  9 Mar 2022 08:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646843916; x=1678379916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8pGmp/P6DW09QNCZnxhFBr88c90cP0y+5hBJacUv2zo=;
  b=QJi/L/nVNgQAO0qoNUs5NjI3haPM6ajfVE0RxFzeKu0tkXhHqyAlEekH
   /jW1oJvyld/yHZUAzVl4NyXPMnr9OPUpkX6z46rVTtx3m5w5ryrVdnDF4
   IoV+LbbX3h8FrNHr8VSCzPyVvZP1fxAFLb2uNEfTEkRlp1zr4f4PU7X3W
   z+IMkKNw+4BghpBz4uu76tV5oL6VoHqH7cs1jFzJrg7i/jBqzC0riz5PT
   tepNCDeStE7BkytjbxkXOS9NFOtwqjECbPxTnHxkq7Rp3IuFxpR6ebmXB
   b9PIxPwNzvjx+Desp0eKV7KOTrMTESSmlAvQE5JDGbF2kKHdba7JKsjhc
   w==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; 
   d="scan'208";a="151431959"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2022 09:38:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 09:38:25 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 09:38:12 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <jacopo@jmondi.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <claudiu.beznea@microchip.com>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v8 01/13] media: atmel: atmel-isc-base: use streaming status when queueing buffers
Date:   Wed, 9 Mar 2022 18:37:46 +0200
Message-ID: <20220309163758.2672727-2-eugen.hristev@microchip.com>
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
Tho achieve this, we have to use vb2_start_streaming_called instead of
vb2_is_streaming.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index db15770d5b88..d2cc6c99984f 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -442,7 +442,7 @@ static void isc_buffer_queue(struct vb2_buffer *vb)
 
 	spin_lock_irqsave(&isc->dma_queue_lock, flags);
 	if (!isc->cur_frm && list_empty(&isc->dma_queue) &&
-		vb2_is_streaming(vb->vb2_queue)) {
+		vb2_start_streaming_called(vb->vb2_queue)) {
 		isc->cur_frm = buf;
 		isc_start_dma(isc);
 	} else
-- 
2.25.1

