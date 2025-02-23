Return-Path: <linux-media+bounces-26667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F6A40F5E
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 16:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46EE3AC8BA
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 15:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47311207DFD;
	Sun, 23 Feb 2025 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pVYJZQHr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F6CA4B
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740323178; cv=none; b=sv5UJkohZbJZ6GoXQpTq82zK2x97PE8MIfJlG/W4xOh8F6TAyr4n1ikvyLIbIljZMBEkWPHT9esa7uAdj5h9LcLukx+05UpqvYjL9lT/7PgloqhiNMifddcyjd7XpMh0e6WXK068BeP0N65IAwSQ+sbreOHerUMu/WgVxBjF8pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740323178; c=relaxed/simple;
	bh=d8NzydtaxSoGpGxP1xfN9oRcBxHeIor3yvomGZNIB9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdnyBw/tao8j6BpvyqxXrEn3UxCpjJio4NOQPciI8l/3AzR9E3rrMSlJY0z7Drd4E7BrON1sPgXm7GHlduQ7P3+91bZWQIgs146fSCx0qPiIhyGVh+Vks1fc2UBGTi3nVwAMV1zx4Jt8bOMX/FsVwaxZ6NAUa1CHIDpgQtwEL/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pVYJZQHr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68F8B4DC;
	Sun, 23 Feb 2025 16:04:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740323088;
	bh=d8NzydtaxSoGpGxP1xfN9oRcBxHeIor3yvomGZNIB9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=pVYJZQHrqGB8jVC36JNl5SrQRnwCIHtwO7ad7uzF0+C6QRbrwE6M1d4wIf3BJbuZ9
	 vhJmuOK+WFq+/OTS+vqbJbyJsXVOP0Zdb6c9Hro1eyIvDtfdQ+83rBlCkHiwpJXQJp
	 AvbGe3NqVWCBcq7mplE/LwrRvugL980xnzKG9N+k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Drop the uvc_driver structure
Date: Sun, 23 Feb 2025 17:05:57 +0200
Message-ID: <20250223150557.25148-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uvc_driver structure used to contain more fields, but those got
removed in commit ba2fa99668bb ("[media] uvcvideo: Hardcode the
index/selector relationship for XU controls"). The structure is now just
a wrapper around usb_driver. Drop it.

Fixes: ba2fa99668bb ("[media] uvcvideo: Hardcode the index/selector relationship for XU controls")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 35 +++++++++++++++---------------
 drivers/media/usb/uvc/uvcvideo.h   |  7 ------
 2 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index deadbcea5e22..84e931959198 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -37,6 +37,8 @@ static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
 
+static struct usb_driver uvc_driver;
+
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -546,7 +548,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 		return -EINVAL;
 	}
 
-	if (usb_driver_claim_interface(&uvc_driver.driver, intf, dev)) {
+	if (usb_driver_claim_interface(&uvc_driver, intf, dev)) {
 		uvc_dbg(dev, DESCR,
 			"device %d interface %d is already claimed\n",
 			dev->udev->devnum,
@@ -556,7 +558,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 
 	streaming = uvc_stream_new(dev, intf);
 	if (streaming == NULL) {
-		usb_driver_release_interface(&uvc_driver.driver, intf);
+		usb_driver_release_interface(&uvc_driver, intf);
 		return -ENOMEM;
 	}
 
@@ -779,7 +781,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	return 0;
 
 error:
-	usb_driver_release_interface(&uvc_driver.driver, intf);
+	usb_driver_release_interface(&uvc_driver, intf);
 	uvc_stream_delete(streaming);
 	return ret;
 }
@@ -1922,8 +1924,7 @@ static void uvc_delete(struct kref *kref)
 		struct uvc_streaming *streaming;
 
 		streaming = list_entry(p, struct uvc_streaming, list);
-		usb_driver_release_interface(&uvc_driver.driver,
-			streaming->intf);
+		usb_driver_release_interface(&uvc_driver, streaming->intf);
 		uvc_stream_delete(streaming);
 	}
 
@@ -3196,17 +3197,15 @@ static const struct usb_device_id uvc_ids[] = {
 
 MODULE_DEVICE_TABLE(usb, uvc_ids);
 
-struct uvc_driver uvc_driver = {
-	.driver = {
-		.name		= "uvcvideo",
-		.probe		= uvc_probe,
-		.disconnect	= uvc_disconnect,
-		.suspend	= uvc_suspend,
-		.resume		= uvc_resume,
-		.reset_resume	= uvc_reset_resume,
-		.id_table	= uvc_ids,
-		.supports_autosuspend = 1,
-	},
+static struct usb_driver uvc_driver = {
+	.name		= "uvcvideo",
+	.probe		= uvc_probe,
+	.disconnect	= uvc_disconnect,
+	.suspend	= uvc_suspend,
+	.resume		= uvc_resume,
+	.reset_resume	= uvc_reset_resume,
+	.id_table	= uvc_ids,
+	.supports_autosuspend = 1,
 };
 
 static int __init uvc_init(void)
@@ -3215,7 +3214,7 @@ static int __init uvc_init(void)
 
 	uvc_debugfs_init();
 
-	ret = usb_register(&uvc_driver.driver);
+	ret = usb_register(&uvc_driver);
 	if (ret < 0) {
 		uvc_debugfs_cleanup();
 		return ret;
@@ -3226,7 +3225,7 @@ static int __init uvc_init(void)
 
 static void __exit uvc_cleanup(void)
 {
-	usb_deregister(&uvc_driver.driver);
+	usb_deregister(&uvc_driver);
 	uvc_debugfs_cleanup();
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b63720e21075..b4ee701835fc 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -632,10 +632,6 @@ struct uvc_fh {
 	unsigned int pending_async_ctrls;
 };
 
-struct uvc_driver {
-	struct usb_driver driver;
-};
-
 /* ------------------------------------------------------------------------
  * Debugging, printing and logging
  */
@@ -686,9 +682,6 @@ do {									\
  * Internal functions.
  */
 
-/* Core driver */
-extern struct uvc_driver uvc_driver;
-
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
 
 /* Video buffers queue management. */

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
Regards,

Laurent Pinchart


