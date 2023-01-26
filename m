Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D5B67D97B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjAZXPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjAZXPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:15:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5590B14E9C
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:15:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-0004JB-Gu; Fri, 27 Jan 2023 00:15:09 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-000fEr-K4; Fri, 27 Jan 2023 00:15:08 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSV-00EH88-MA; Fri, 27 Jan 2023 00:15:07 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 4/5] usb: uvc: make uvc_format_desc table const
Date:   Fri, 27 Jan 2023 00:14:55 +0100
Message-Id: <20230126231456.3402323-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
References: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the uvc_fmts array can not be modified we declare it const and
change every user of the uvc_format_by_guid function aswell.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - added reviewed and tested tags
v2 -> v3: - no changes

 drivers/media/common/uvc.c             | 4 ++--
 drivers/media/usb/uvc/uvc_driver.c     | 2 +-
 drivers/usb/gadget/function/uvc_v4l2.c | 8 ++++----
 include/linux/usb/uvc.h                | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index bb96d9e26d8019..2b4df3e8f48aa6 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -11,7 +11,7 @@
  * Video formats
  */
 
-static struct uvc_format_desc uvc_fmts[] = {
+static const struct uvc_format_desc uvc_fmts[] = {
 	{
 		.name		= "YUV 4:2:2 (YUYV)",
 		.guid		= UVC_GUID_FORMAT_YUY2,
@@ -204,7 +204,7 @@ static struct uvc_format_desc uvc_fmts[] = {
 	},
 };
 
-struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
+const struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
 {
 	unsigned int len = ARRAY_SIZE(uvc_fmts);
 	unsigned int i;
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index edf8c4a201a8ab..7aefa76a42b316 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -225,7 +225,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 {
 	struct usb_interface *intf = streaming->intf;
 	struct usb_host_interface *alts = intf->cur_altsetting;
-	struct uvc_format_desc *fmtdesc;
+	const struct uvc_format_desc *fmtdesc;
 	struct uvc_frame *frame;
 	const unsigned char *start = buffer;
 	unsigned int width_multiplier = 1;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 7435df0cf2a847..21e573e628f4e7 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -27,10 +27,10 @@
 #include "uvc_v4l2.h"
 #include "uvc_configfs.h"
 
-static struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
+static const struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
 {
 	char guid[16] = UVC_GUID_FORMAT_MJPEG;
-	struct uvc_format_desc *format;
+	const struct uvc_format_desc *format;
 	struct uvcg_uncompressed *unc;
 
 	if (uformat->type == UVCG_UNCOMPRESSED) {
@@ -119,7 +119,7 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
 	struct uvcg_format *uformat = NULL;
 
 	list_for_each_entry(format, &uvc->header->formats, entry) {
-		struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
+		const struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
 
 		if (fmtdesc->fcc == pixelformat) {
 			uformat = format->fmt;
@@ -364,7 +364,7 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
-	struct uvc_format_desc *fmtdesc;
+	const struct uvc_format_desc *fmtdesc;
 	struct uvcg_format *uformat;
 
 	if (f->index >= uvc->header->num_fmt)
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 8cebb46602a118..b0210c5c5406b3 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -154,6 +154,6 @@ struct uvc_format_desc {
 	u32 fcc;
 };
 
-struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16]);
+const struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16]);
 
 #endif /* __LINUX_V4L2_UVC_H */
-- 
2.30.2

