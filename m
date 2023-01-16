Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5538866C326
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbjAPPBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbjAPPAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:00:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D035222FE
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:51:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3202802;
        Mon, 16 Jan 2023 15:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880665;
        bh=pCL5mwM/weMLnLy7XF1m7PLtk/rPQbCJtBdGXmCZXPE=;
        h=From:To:Cc:Subject:Date:From;
        b=wOhC9cg56s+OK/dC0YbxuPrRgxjZ4OPQOsDVNPD9KHNwJ12NzXsAY9k9XC+Oh6hhU
         UaTJQGSUqujyNC7lN1ZrYyIAXlOo6JMf5wYXj86MSuydwT6ZZXszHRIWdfpDwCiR8l
         Z2DMi8uM/rwGjUPKa8xM5KW2F4ToxoExvd+Z1aW4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Ai Chao <aichao@kylinos.cn>, Jackie Liu <liuyun01@kylinos.cn>
Subject: [PATCH v6] media: uvcvideo: Fix bandwidth error for Alcor camera
Date:   Mon, 16 Jan 2023 16:51:05 +0200
Message-Id: <20230116145105.2066-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ai Chao <aichao@kylinos.cn>

The Alcor Corp. Slave camera (1b17:6684 and 2017:0011) returns a wrong
dwMaxPayloadTransferSize value for compressed formats. Valid values are
typically up to 3072 bytes per interval (for high-speed, high-bandwidth
devices), and those faulty devices request 2752512 bytes per interval.
This is a firmware issue, but the manufacturer cannot provide a fixed
firmware.

Fix this by checking the dwMaxPayloadTransferSize field, and hardcoding
a value of 1024 if it exceeds 3072 for compressed formats transferred
over isochronous endpoints. While at it, document the other quirk that
handles a bandwidth issue for uncompressed formats.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v5:

- Print a warning message
---
 drivers/media/usb/uvc/uvc_video.c | 34 +++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index d4b023d4de7c..9634596f3dc7 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -200,6 +200,20 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
 		ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
 
+	/*
+	 * Many devices report an incorrect dwMaxPayloadTransferSize value. The
+	 * most common issue is devices requesting the maximum possible USB
+	 * bandwidth (3072 bytes per interval for high-speed, high-bandwidth
+	 * isochronous endpoints) while they actually require less, preventing
+	 * multiple cameras from being used at the same time due to bandwidth
+	 * overallocation.
+	 *
+	 * For those devices, replace the dwMaxPayloadTransferSize value based
+	 * on an estimation calculated from the frame format and size. This is
+	 * only possible for uncompressed formats, as not enough information is
+	 * available to reliably estimate the bandwidth requirements for
+	 * compressed formats.
+	 */
 	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
 	    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
 	    stream->intf->num_altsetting > 1) {
@@ -236,6 +250,26 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	/*
+	 * Another issue is with devices that report a transfer size that
+	 * greatly exceeds the maximum supported by any existing USB version
+	 * for isochronous transfers.  For instance, the "Slave camera" devices
+	 * from Alcor Corp. (2017:0011 and 1b17:66B8) request 2752512 bytes per
+	 * interval.
+	 *
+	 * For uncompressed formats, this can be addressed by the FIX_BANDWIDTH
+	 * quirk, but for compressed format we can't meaningfully estimate the
+	 * required bandwidth. Just hardcode it to 1024 bytes per interval,
+	 * which should be large enough for compressed formats.
+	 */
+	if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
+	    ctrl->dwMaxPayloadTransferSize > 3072 &&
+	    stream->intf->num_altsetting > 1) {
+		uvc_warn_once(stream->dev, UVC_WARN_PAYLOAD_SIZE,
+			      "Device requested invalid bandwidth, lowering to 1024 bytes per interval\n");
+		ctrl->dwMaxPayloadTransferSize = 1024;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a596c8d894a..72189249719e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -630,6 +630,7 @@ struct uvc_driver {
 #define UVC_WARN_MINMAX		0
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
+#define UVC_WARN_PAYLOAD_SIZE	3
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;
-- 
Regards,

Laurent Pinchart

