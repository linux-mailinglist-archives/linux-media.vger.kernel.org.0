Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2666F8FC0
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjEFHOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjEFHOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:14:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F554C1E
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:14:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EC102D8;
        Sat,  6 May 2023 09:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683357273;
        bh=yfIHcBm45xwsxUfUr4Ks/Ji+rXg0OFr7OOxx241crtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P5tXvuPcQUB97OkbnYsfsW8cREF9JRnBmw9UVToqSlv8JL31L65/NmNg6xo41y2b8
         58fDN3WvjSZCHRZE3dNXa50GpRHR88cys+hNZ7wOnUpSSSsKtHF1cauiknp/+bAqT9
         P7eqU/sUKlbNV7uckeKofXzFcZ/AU+Ypsx48A9Bg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 4/7] media: uvcvideo: Reorganize format descriptor parsing
Date:   Sat,  6 May 2023 10:14:24 +0300
Message-Id: <20230506071427.28108-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format descriptor parsing has grown over time and now mixes parsing of
frame intervals with various quirk handling. Reorganize it to make the
code easier to follow, by parsing frame intervals first, and then
applying fixes and quirks. No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 40 +++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9e597bbbfe07..446bd8ff128c 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -405,8 +405,27 @@ static int uvc_parse_format(struct uvc_device *dev,
 				get_unaligned_le32(&buffer[17]);
 			frame->bFrameIntervalType = buffer[21];
 		}
+
+		/*
+		 * Copy the frame intervals.
+		 *
+		 * Some bogus devices report dwMinFrameInterval equal to
+		 * dwMaxFrameInterval and have dwFrameIntervalStep set to
+		 * zero. Setting all null intervals to 1 fixes the problem and
+		 * some other divisions by zero that could happen.
+		 */
 		frame->dwFrameInterval = *intervals;
 
+		for (i = 0; i < n; ++i) {
+			interval = get_unaligned_le32(&buffer[26+4*i]);
+			*(*intervals)++ = interval ? interval : 1;
+		}
+
+		/*
+		 * Apply more fixes, quirks and workarounds to handle incorrect
+		 * or broken descriptors.
+		 */
+
 		/*
 		 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
 		 * completely. Observed behaviours range from setting the
@@ -420,27 +439,18 @@ static int uvc_parse_format(struct uvc_device *dev,
 			frame->dwMaxVideoFrameBufferSize = format->bpp
 				* frame->wWidth * frame->wHeight / 8;
 
-		/*
-		 * Some bogus devices report dwMinFrameInterval equal to
-		 * dwMaxFrameInterval and have dwFrameIntervalStep set to
-		 * zero. Setting all null intervals to 1 fixes the problem and
-		 * some other divisions by zero that could happen.
-		 */
-		for (i = 0; i < n; ++i) {
-			interval = get_unaligned_le32(&buffer[26+4*i]);
-			*(*intervals)++ = interval ? interval : 1;
-		}
-
-		/*
-		 * Make sure that the default frame interval stays between
-		 * the boundaries.
-		 */
+		/* Clamp the default frame interval to the boundaries. */
 		n -= frame->bFrameIntervalType ? 1 : 2;
 		frame->dwDefaultFrameInterval =
 			clamp(frame->dwDefaultFrameInterval,
 			      frame->dwFrameInterval[0],
 			      frame->dwFrameInterval[n]);
 
+		/*
+		 * Some devices report frame intervals that are not functional.
+		 * If the corresponding quirk is set, restrict operation to the
+		 * first interval only.
+		 */
 		if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
 			frame->bFrameIntervalType = 1;
 			frame->dwFrameInterval[0] =
-- 
Regards,

Laurent Pinchart

