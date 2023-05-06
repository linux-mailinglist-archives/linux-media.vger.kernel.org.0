Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DD66F8FC1
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjEFHOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjEFHOp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:14:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660394C1E
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:14:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00CFA2D8;
        Sat,  6 May 2023 09:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683357278;
        bh=bONZTkglABHH9VJR9X8X8X9BdH71a+NEMWuc52829F0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=blXxOFLPuUORvVNkrzbHkBWIr5ZpsBAJ1vWdqkIyNsQG780AHIezfiBghTeePeLUk
         6N8bVfS/GZPJMhXI6y82gVucjm2qtHowpVZ+L201Ef+raYPU60+uULpCKDwP/symCo
         kdD/AH8lf/NhgSQf2cgHUQ/KEK0zctjzpKABRLyw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 5/7] media: uvcvideo: Increment intervals pointer at end of parsing
Date:   Sat,  6 May 2023 10:14:25 +0300
Message-Id: <20230506071427.28108-6-laurent.pinchart@ideasonboard.com>
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

The intervals pointer is incremented for each interval when parsing the
format descriptor. This doesn't cause any issue as such, but gets in the
way of constifying some pointers. Modify the parsing code to index the
intervals pointer as an array and increment it in one go at end of
parsing.

Careful readers will notice that the maxIntervalIndex variable is set to
1 instead of n - 2 when bFrameIntervalType has a zero value. This is
functionally equivalent, as n is equal to 3 in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 446bd8ff128c..11e4fa007f3f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -370,6 +370,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 	 */
 	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
 	       buffer[2] == ftype) {
+		unsigned int maxIntervalIndex;
+
 		frame = &format->frames[format->nframes];
 		if (ftype != UVC_VS_FRAME_FRAME_BASED)
 			n = buflen > 25 ? buffer[25] : 0;
@@ -418,7 +420,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		for (i = 0; i < n; ++i) {
 			interval = get_unaligned_le32(&buffer[26+4*i]);
-			*(*intervals)++ = interval ? interval : 1;
+			(*intervals)[i] = interval ? interval : 1;
 		}
 
 		/*
@@ -440,11 +442,11 @@ static int uvc_parse_format(struct uvc_device *dev,
 				* frame->wWidth * frame->wHeight / 8;
 
 		/* Clamp the default frame interval to the boundaries. */
-		n -= frame->bFrameIntervalType ? 1 : 2;
+		maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
 		frame->dwDefaultFrameInterval =
 			clamp(frame->dwDefaultFrameInterval,
 			      frame->dwFrameInterval[0],
-			      frame->dwFrameInterval[n]);
+			      frame->dwFrameInterval[maxIntervalIndex]);
 
 		/*
 		 * Some devices report frame intervals that are not functional.
@@ -463,6 +465,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 			(100000000 / frame->dwDefaultFrameInterval) % 10);
 
 		format->nframes++;
+		*intervals += n;
+
 		buflen -= buffer[0];
 		buffer += buffer[0];
 	}
-- 
Regards,

Laurent Pinchart

