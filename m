Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832C6291E6F
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 21:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgJRTwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 15:52:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:60920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729124AbgJRTU6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 15:20:58 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FD7D222E7;
        Sun, 18 Oct 2020 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048857;
        bh=TPSg9F6aclc44MNfpeDtKYRLYQIcsA9t3mTkIqI3l/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L4rF4LNBKqQeFr2omJTDDfTQMzP0gOnzyhotvQBQZgi4S7u4tGACZSxrkjV8EjzHl
         lavLwo4q4hC8CqFjntxUk9dEPNix9M8bSHKc1gXVDLb4r87XmqA0Pf5HjOg1Z02qSg
         6Pp1oa/dUjQ15pKStH03TdBegrsNHLn/sbc/9Z68=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Adam Goode <agoode@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 024/101] media: uvcvideo: Ensure all probed info is returned to v4l2
Date:   Sun, 18 Oct 2020 15:19:09 -0400
Message-Id: <20201018192026.4053674-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192026.4053674-1-sashal@kernel.org>
References: <20201018192026.4053674-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Adam Goode <agoode@google.com>

[ Upstream commit 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe ]

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

[Add blank lines, remove periods at the of messages]

Signed-off-by: Adam Goode <agoode@google.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70abe..5e6f3153b5ff8 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -247,11 +247,41 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
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
+
+	if (i == stream->nformats) {
+		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFormatIndex %u\n",
+			  probe->bFormatIndex);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < format->nframes; ++i) {
+		if (probe->bFrameIndex == format->frame[i].bFrameIndex) {
+			frame = &format->frame[i];
+			break;
+		}
+	}
+
+	if (i == format->nframes) {
+		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFrameIndex %u\n",
+			  probe->bFrameIndex);
+		return -EINVAL;
+	}
+
 	fmt->fmt.pix.width = frame->wWidth;
 	fmt->fmt.pix.height = frame->wHeight;
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
+	fmt->fmt.pix.pixelformat = format->fcc;
 	fmt->fmt.pix.colorspace = format->colorspace;
 
 	if (uvc_format != NULL)
-- 
2.25.1

