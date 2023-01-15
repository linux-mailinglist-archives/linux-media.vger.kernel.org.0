Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8F366B41D
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 22:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjAOVRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 16:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjAOVRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 16:17:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E11BB46B
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 13:17:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4A3E308;
        Sun, 15 Jan 2023 22:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673817455;
        bh=rctuVMix3Bj89FtQwohmuuJiIWMS6WyHzpKKKJzzsaQ=;
        h=From:To:Cc:Subject:Date:From;
        b=d+7nKEl1MtDAPQQdynnFU0Lv1GwihffQG+wyLDAVY/moICDkYOqCB/3pyvKUCK94W
         NqINKptV18av5myFbheQeKeVc+cWW4QYdV1Bey0Zx7MBmN+wi2tdg9/1RaLuPeN6Zo
         TPcW8sS3tDwPspwdvz7vFaHWd0XMXtmrET1MidzE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ai Chao <aichao@kylinos.cn>, Jackie Liu <liuyun01@kylinos.cn>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5] media: uvcvideo: Fix bandwidth error for Alcor camera
Date:   Sun, 15 Jan 2023 23:17:35 +0200
Message-Id: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
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
---
I have dropped the Reviewed-by tags as the patch has changed
significantly.

Ricardo, do you know if the 3072 bytes limit is fine with super-speed
devices, or does it need to be increased ?
---
 drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index d4b023d4de7c..c6351d3b24cf 100644
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
@@ -236,6 +250,23 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
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
+	    stream->intf->num_altsetting > 1)
+		ctrl->dwMaxPayloadTransferSize = 1024;
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
-- 
Regards,

Laurent Pinchart

