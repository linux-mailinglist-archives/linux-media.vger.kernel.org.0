Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B348B2DF64F
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 18:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbgLTRoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 12:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbgLTRoM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 12:44:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC1AC061282
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 09:43:29 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56D0D45E;
        Sun, 20 Dec 2020 18:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608486207;
        bh=bVp0Cy9kWFHks0SMLLLLmpO/IurNyb5cd1vTTqIsoY8=;
        h=From:To:Cc:Subject:Date:From;
        b=K9Jh4KwO6u69CxCAgglJpQzHAInvuuuto43ezf4h45dotlMC4mRBHK5tyVCNqegii
         4ZMj2ZpKzglNcU2l/gRgp9u6LHcOE+AuVxnS5POy19mMQqWoVZggAjVAtE2E3OD7VH
         4ApviNgfyx/zEdwqkvvxBK7XRm843M710EcjDvIQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Goode <agoode@google.com>,
        =?UTF-8?q?Till=20D=C3=B6rges?= <doerges@pre-sense.de>
Subject: [PATCH] media: uvcvideo: Accept invalid bFormatIndex and bFrameIndex values
Date:   Sun, 20 Dec 2020 19:43:13 +0200
Message-Id: <20201220174313.11006-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Renkforce RF AC4K 300 Action Cam 4K reports invalid bFormatIndex and
bFrameIndex values when negotiating the video probe and commit controls.
The UVC descriptors report a single supported format and frame size,
with bFormatIndex and bFrameIndex both equal to 2, but the video probe
and commit controls report bFormatIndex and bFrameIndex set to 1.

The device otherwise operates correctly, but the driver rejects the
values and fails the format try operation. Fix it by ignoring the
invalid indices, and assuming that the format and frame requested by the
driver are accepted by the device.

Fixes: 8a652a17e3c0 ("media: uvcvideo: Ensure all probed info is returned to v4l2")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=210767
Reported-by: Till Dörges <doerges@pre-sense.de>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index fa06bfa174ad..c7172b8952a9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -248,7 +248,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 		goto done;
 
 	/* After the probe, update fmt with the values returned from
-	 * negotiation with the device.
+	 * negotiation with the device. Some devices return invalid bFormatIndex
+	 * and bFrameIndex values, in which case we can only assume they have
+	 * accepted the requested format as-is.
 	 */
 	for (i = 0; i < stream->nformats; ++i) {
 		if (probe->bFormatIndex == stream->format[i].index) {
@@ -257,11 +259,10 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 		}
 	}
 
-	if (i == stream->nformats) {
-		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFormatIndex %u\n",
+	if (i == stream->nformats)
+		uvc_trace(UVC_TRACE_FORMAT,
+			  "Unknown bFormatIndex %u, using default\n",
 			  probe->bFormatIndex);
-		return -EINVAL;
-	}
 
 	for (i = 0; i < format->nframes; ++i) {
 		if (probe->bFrameIndex == format->frame[i].bFrameIndex) {
@@ -270,11 +271,10 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 		}
 	}
 
-	if (i == format->nframes) {
-		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFrameIndex %u\n",
+	if (i == format->nframes)
+		uvc_trace(UVC_TRACE_FORMAT,
+			  "Unknown bFrameIndex %u, using default\n",
 			  probe->bFrameIndex);
-		return -EINVAL;
-	}
 
 	fmt->fmt.pix.width = frame->wWidth;
 	fmt->fmt.pix.height = frame->wHeight;
-- 
Regards,

Laurent Pinchart

