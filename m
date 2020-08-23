Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5454C24EAB4
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 03:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHWBVt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Aug 2020 21:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgHWBVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Aug 2020 21:21:47 -0400
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com [IPv6:2607:f8b0:4864:20::a49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD59C061573
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 18:21:47 -0700 (PDT)
Received: by mail-vk1-xa49.google.com with SMTP id p2so1671753vkp.4
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 18:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=n3DhyqY375Ipe7NVxdqGFwuYsUhvRETKMRg2jv8ryx8=;
        b=sxVB+uXNSSKW133zTCYUoY8ofixIZc2YV8vYbEE/M/ki1BlQNYvhOXxetQBykPWRw+
         nQVljL+tecLVrB8Nuz4ovUVHE8GmSABkI2N3i6nLEpKzkoXxoS0eRnT+zxnb1ccXI3GZ
         3yRuz0mrGp4NxhPkTxb9rC04cskxn549KGT79VzhRM/K8T6Vt+rSrHi5JBywlONPiBGg
         SmBO3pplsD+fpgOkKC3e1zpTI1DxHPHzdtDzqagr7NnoypAqyIzU5bJldQBAq0vQhGP1
         x5RScDzwYfqG4laTRw2hUQb6k/U7GT9RgUxMuoTzYxW1AgK3ljRLMPC81vzlZsjoW5nz
         YPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=n3DhyqY375Ipe7NVxdqGFwuYsUhvRETKMRg2jv8ryx8=;
        b=bpqQsRZN13fu8bXTbpXvmqDROycfDGJB6qXjTyqN9nT9I2dOPJpvsONuoTil5xjviv
         4RHZ/Gg+nw96JiLHxG8m5QB5YuocBfdKy+V6n/hWQBAphsZas8PmZcVqy3ery6e2cRSc
         KVGB2OzU0JdJdtyoioW4vGH1t0XAlZINwnoHL6UxCpAexZWRuDWhnCdYQLQBFWlcgPgF
         nDdrAqBCP+pGwL1DOOm26n9591yrNylP0CNIO2Bpv9QCcj7rRgD3ow7YWE/u//oLTEx4
         jvdPCn7ovwr9SJ46XjH/yy++6MJ3A1ZKei/RyDD0I81aD77S605CZ/HIGNb1AEWB4Ohj
         /icw==
X-Gm-Message-State: AOAM530ki6gCYdbCk3ft13LFTJrqOmm0RyTsa6PIcQ+RsBxigC5MsklJ
        oMkQc8DZg+6uDTgIzDRQGzq1/pgB5LU=
X-Google-Smtp-Source: ABdhPJwvffrWmmEbfSl5IOGr6w9hLslpHSpEtF2b1OFHLtPJifLXlCpJTd3IASAy5zlD6pnjClqOzoJEe7E=
X-Received: from christoph.c.googlers.com ([fda3:e722:ac3:10:14:4d90:c0a8:1fe1])
 (user=agoode job=sendgmr) by 2002:a67:eb91:: with SMTP id e17mr5274045vso.7.1598145705968;
 Sat, 22 Aug 2020 18:21:45 -0700 (PDT)
Date:   Sat, 22 Aug 2020 21:21:33 -0400
Message-Id: <20200823012134.3813457-1-agoode@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 1/2] media: uvcvideo: Ensure all probed info is returned to v4l2
From:   Adam Goode <agoode@google.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Adam Goode <agoode@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

bFrameIndex and bFormatIndex can be negotiated by the camera during
probing, resulting in the camera choosing a different format than
expected. v4l2 can already accommodate such changes, but the code was
not updating the proper fields.

Without such a change, v4l2 would potentially interpret the payload
incorrectly, causing corrupted output. This was happening on the
Elgato HD60 S+, which currently always renegotiates to format 1.

As an aside, the Elgato firmware is buggy and should not be renegotating,
but it is still a valid thing for the camera to do. Both macOS and Windows
will properly probe and read uncorrupted images from this camera.

With this change, both qv4l2 and chromium can now read uncorrupted video
from the Elgato HD60 S+.

Signed-off-by: Adam Goode <agoode@google.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..7f14096cb44d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -247,11 +247,37 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	if (ret < 0)
 		goto done;
 
+	/* After the probe, update fmt with the values returned from
+	 * negotiation with the device.
+	 */
+	for (i = 0; i < stream->nformats; ++i) {
+		if (probe->bFormatIndex == stream->format[i].index) {
+			format = &stream->format[i];
+			break;
+		}
+	}
+	if (i == stream->nformats) {
+		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFormatIndex %u.\n",
+			  probe->bFormatIndex);
+		return -EINVAL;
+	}
+	for (i = 0; i < format->nframes; ++i) {
+		if (probe->bFrameIndex == format->frame[i].bFrameIndex) {
+			frame = &format->frame[i];
+			break;
+		}
+	}
+	if (i == format->nframes) {
+		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFrameIndex %u.\n",
+			  probe->bFrameIndex);
+		return -EINVAL;
+	}
 	fmt->fmt.pix.width = frame->wWidth;
 	fmt->fmt.pix.height = frame->wHeight;
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
+	fmt->fmt.pix.pixelformat = format->fcc;
 	fmt->fmt.pix.colorspace = format->colorspace;
 
 	if (uvc_format != NULL)
-- 
2.28.0.297.g1956fa8f8d-goog

