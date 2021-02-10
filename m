Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB083171DA
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 22:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhBJVCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 16:02:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:51498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232343AbhBJVCd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 16:02:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8860064ED0;
        Wed, 10 Feb 2021 21:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612990912;
        bh=yTX2pW8uQGXiirQGlQTPqGLyF37JnySPC1tXe+4P2lQ=;
        h=Date:From:To:Cc:Subject:From;
        b=VC131B77LJ8tPnT3qZlg9vAit8wRwB7hbTJBvgRvL29ugUt4sSm05NTEypw4IzL2C
         wG2EJsk9Lj35n+TczZJWoDzSKw14ibew2/w2KJ7Zq2spJ4sjroo/esjA+/6N1k7GFT
         eLcy1xJlK0dchyUZne4csQYfIcdtgfyHBdmnoy1v0ZYFT6mi7aOB410zSnTadd6GFL
         iXLJtz2eT0oT5M9m00MaWXVspCNuDuYaA+293PSthpnBGQ12JEowarTvSICYdsXbXF
         xUvynz/xlM4WE5uKGPpuLlSS+7TSRogs9j4qRA1vREIGicL/OOtKQZ7iWQzb6HxHIE
         JkXbyXazylJKg==
Date:   Wed, 10 Feb 2021 15:01:49 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2][next] media: uvcvideo: Remove duplicate assignments to
 pointer dma_dev
Message-ID: <20210210210149.GA842694@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove redundant assignments to pointer dma_dev.

Fixes: fdcd02a641e2 ("media: uvcvideo: Use dma_alloc_noncontiguos API")
Addresses-Coverity-ID: 1501703 ("Evaluation order violation")
Addresses-Coverity-ID: 1501692 ("Evaluation order violation")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Remove another redundant assignment in function
   uvc_free_urb_buffers().

 drivers/media/usb/uvc/uvc_video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index dc81f9a86eca..6f2f308d86fe 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1105,7 +1105,7 @@ static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
 
 static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
 {
-	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
+	struct device *dma_dev = stream_to_dmadev(uvc_urb->stream);
 
 	if (for_device) {
 		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
@@ -1586,7 +1586,7 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
-	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
+	struct device *dma_dev = stream_to_dmadev(stream);
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
-- 
2.27.0

