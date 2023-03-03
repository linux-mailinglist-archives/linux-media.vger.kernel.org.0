Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A436AA19B
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 22:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjCCVlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 16:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbjCCVlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 16:41:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42B462D95;
        Fri,  3 Mar 2023 13:41:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5132861924;
        Fri,  3 Mar 2023 21:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D197CC433B4;
        Fri,  3 Mar 2023 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677879675;
        bh=MnO25NQocJUNOpC1Ct+asHRrKRSUSG6lxX6orxqjOE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RKDTapaOwgl+MDZL99lGorE5tB9qomCqxVuYELyGisf+lkg+Ki4jvIBBax/f7Mrgz
         uhfsoBX+iyR/HzQ20BhtKz9xdVR0d3A9jUvFuxPtCV3/rGuau6Gyg5ZFVM5epihBmJ
         hKuXeUTW3NKbNjlXVaNMn4Bpnzmkm4qhoNI9GlmONlhjiMpQzNLJvKLjkMzgulDqn/
         l+VgMXfDdHpcT+l81qjG5OvxbY+eOToOWRtneRF/2Y4wjeYn1dtkkozvit3PS4yHva
         KHFYF7xb6m/WK/fknKGa68b0UfJxCL4PO14Iig8FhP1ME4rVaOVszXZZJVRBoRedYV
         tKhwcnNc8c4aw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 05/64] media: uvcvideo: Remove format descriptions
Date:   Fri,  3 Mar 2023 16:40:07 -0500
Message-Id: <20230303214106.1446460-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214106.1446460-1-sashal@kernel.org>
References: <20230303214106.1446460-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 50459f103edfe47c9a599d766a850ef6014936c5 ]

The V4L2 core overwrites format descriptions in v4l_fill_fmtdesc(),
there's no need to manually set the descriptions in the driver. This
prepares for removal of the format descriptions from the uvc_fmts table.

Unlike V4L2, UVC makes a distinction between the SD-DV, SDL-DV and HD-DV
formats. It also indicates whether the DV format uses 50Hz or 60Hz. This
information is parsed by the driver to construct a format name string
that is printed in a debug message, but serves no other purpose as V4L2
has a single V4L2_PIX_FMT_DV pixel format that covers all those cases.

As the information is available in the UVC descriptors, and thus
accessible to users with lsusb if they really care, don't log it in a
debug message and drop the format name string to simplify the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 24 ++----------------------
 drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
 drivers/media/usb/uvc/uvcvideo.h   |  2 --
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e4bcb50113607..0a35d7c0d0a0a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -251,14 +251,10 @@ static int uvc_parse_format(struct uvc_device *dev,
 		fmtdesc = uvc_format_by_guid(&buffer[5]);
 
 		if (fmtdesc != NULL) {
-			strscpy(format->name, fmtdesc->name,
-				sizeof(format->name));
 			format->fcc = fmtdesc->fcc;
 		} else {
 			dev_info(&streaming->intf->dev,
 				 "Unknown video format %pUl\n", &buffer[5]);
-			snprintf(format->name, sizeof(format->name), "%pUl\n",
-				&buffer[5]);
 			format->fcc = 0;
 		}
 
@@ -270,8 +266,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		 */
 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
 			if (format->fcc == V4L2_PIX_FMT_YUYV) {
-				strscpy(format->name, "Greyscale 8-bit (Y8  )",
-					sizeof(format->name));
 				format->fcc = V4L2_PIX_FMT_GREY;
 				format->bpp = 8;
 				width_multiplier = 2;
@@ -312,7 +306,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strscpy(format->name, "MJPEG", sizeof(format->name));
 		format->fcc = V4L2_PIX_FMT_MJPEG;
 		format->flags = UVC_FMT_FLAG_COMPRESSED;
 		format->bpp = 0;
@@ -328,17 +321,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		switch (buffer[8] & 0x7f) {
-		case 0:
-			strscpy(format->name, "SD-DV", sizeof(format->name));
-			break;
-		case 1:
-			strscpy(format->name, "SDL-DV", sizeof(format->name));
-			break;
-		case 2:
-			strscpy(format->name, "HD-DV", sizeof(format->name));
-			break;
-		default:
+		if ((buffer[8] & 0x7f) > 2) {
 			uvc_dbg(dev, DESCR,
 				"device %d videostreaming interface %d: unknown DV format %u\n",
 				dev->udev->devnum,
@@ -346,9 +329,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
-			sizeof(format->name));
-
 		format->fcc = V4L2_PIX_FMT_DV;
 		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
 		format->bpp = 0;
@@ -375,7 +355,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 		return -EINVAL;
 	}
 
-	uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
+	uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
 
 	buflen -= buffer[0];
 	buffer += buffer[0];
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4d4c33b6dfbd..dcd178d249b6b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -660,8 +660,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 	fmt->flags = 0;
 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
 		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
-	strscpy(fmt->description, format->name, sizeof(fmt->description));
-	fmt->description[sizeof(fmt->description) - 1] = 0;
 	fmt->pixelformat = format->fcc;
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index df93db259312e..b60e4ae95e815 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -264,8 +264,6 @@ struct uvc_format {
 	u32 fcc;
 	u32 flags;
 
-	char name[32];
-
 	unsigned int nframes;
 	struct uvc_frame *frame;
 };
-- 
2.39.2

