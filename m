Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B566F8F8E
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 08:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjEFG6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 02:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjEFG6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 02:58:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA588AD17
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 23:58:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16186547;
        Sat,  6 May 2023 08:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683356275;
        bh=ixc+cEbkLuav8xSr6URWM1IgqaAn73YHFEuPynh4hdY=;
        h=From:To:Cc:Subject:Date:From;
        b=Svayg9njbZLjcKpLjeA6XAi9BF9j8IPN4jQfIVK3Pf64icMqXaL7PEFAL4IBsvtlA
         lF4/zju+DEKPWilxCvHXrida9k2Wf2ByZ95dmpG/PVoQtBvKXoO2cyK2OHT8MTKdzZ
         aOg5kzWtcrSMw4LV/WbuUuZAU+ssHi7sTs1wBwzM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2] media: uvcvideo: Don't expose unsupported formats to userspace
Date:   Sat,  6 May 2023 09:58:09 +0300
Message-Id: <20230506065809.24645-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
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

When the uvcvideo driver encounters a format descriptor with an unknown
format GUID, it creates a corresponding struct uvc_format instance with
the fcc field set to 0. Since commit 50459f103edf ("media: uvcvideo:
Remove format descriptions"), the driver relies on the V4L2 core to
provide the format description string, which the V4L2 core can't do
without a valid 4CC. This triggers a WARN_ON.

As a format with a zero 4CC can't be selected, it is unusable for
applications. Ignore the format completely without creating a uvc_format
instance, which fixes the warning.

Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix streaming->nformats
---
 drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 4be6dfeaa295..8a9cfd5a0077 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -251,14 +251,17 @@ static int uvc_parse_format(struct uvc_device *dev,
 		/* Find the format descriptor from its GUID. */
 		fmtdesc = uvc_format_by_guid(&buffer[5]);
 
-		if (fmtdesc != NULL) {
-			format->fcc = fmtdesc->fcc;
-		} else {
+		if (!fmtdesc) {
+			/*
+			 * Unknown video formats are not fatal errors, the
+			 * caller will skip this descriptor.
+			 */
 			dev_info(&streaming->intf->dev,
 				 "Unknown video format %pUl\n", &buffer[5]);
-			format->fcc = 0;
+			return 0;
 		}
 
+		format->fcc = fmtdesc->fcc;
 		format->bpp = buffer[21];
 
 		/*
@@ -675,7 +678,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	interval = (u32 *)&frame[nframes];
 
 	streaming->format = format;
-	streaming->nformats = nformats;
+	streaming->nformats = 0;
 
 	/* Parse the format descriptors. */
 	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
@@ -689,7 +692,10 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 				&interval, buffer, buflen);
 			if (ret < 0)
 				goto error;
+			if (!ret)
+				break;
 
+			streaming->nformats++;
 			frame += format->nframes;
 			format++;
 

base-commit: 423f331364bfbcd1212b78ac9052894ff5213ac9
-- 
Regards,

Laurent Pinchart

