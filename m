Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCA11253C0
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 21:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLRUsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 15:48:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51260 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfLRUsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 15:48:23 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40A20B23;
        Wed, 18 Dec 2019 21:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576702101;
        bh=UFSAjd8mti/K4PhYmSb1wbzO2s1priDs3SejdmOy3lM=;
        h=From:To:Cc:Subject:Date:From;
        b=bz7UthgM77OcD9YtRKU7fuy5m83iU3H6OxRDRcCdIos7/OLzBHIC7wY+DAcRJ09Bp
         b/N2zooS+gGBTexCgVZUCTyDyJZAkxJPcemAnGD9Vqy8BUHQLTa1mz2I57VrQv9EeL
         Jr5TFDhR20QNmzqV19yshd23nEAeYoLmFB9edY8s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sergey Zakharchenko <szakharchenko@digital-loggers.com>
Subject: [PATCH] media: uvc: Don't recompute frame size unnecessarily
Date:   Wed, 18 Dec 2019 22:48:04 +0200
Message-Id: <20191218204804.24479-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

uvc_fixup_video_ctrl() needs the frame size for bandwidth calculation,
which it computes from the frame width, height and bpp. The same
calculation is done earlier and the resulting value is stored in
dwMaxVideoFrameBufferSize. Reuse it instead of recomputing it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8fa77a81dd7f..a269aeaa9ecc 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -178,7 +178,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		 * high-speed devices) per second and add the UVC header size
 		 * (assumed to be 12 bytes long).
 		 */
-		bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
+		bandwidth = frame->dwMaxVideoFrameBufferSize;
 		bandwidth *= 10000000 / interval + 1;
 		bandwidth /= 1000;
 		if (stream->dev->udev->speed == USB_SPEED_HIGH)
-- 
Regards,

Laurent Pinchart

