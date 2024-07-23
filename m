Return-Path: <linux-media+bounces-15285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF924939CAA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 10:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1CF282BBC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 08:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19D714BF97;
	Tue, 23 Jul 2024 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BKqky4nJ"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1E1DDDC;
	Tue, 23 Jul 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721723475; cv=none; b=s03DOi+fLLTvDtvI2tECwR26XzoNE1o0m3E/D7QtKCb5PBucNb+lsyfXNdnmNnGG9V4ov38KEGPrRMJElFi2U9C9xVx8sMBzYaxlK5UD0C8husodCs+RhgN+Lm4MkSXHK7tjVqLMM3q3L9mOWKXEM9UqPeHL3Rw7M9yNDLiubEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721723475; c=relaxed/simple;
	bh=hu37FjXE4n28e8oaxniOGxMqOcuSTkAinSYLmnBGYTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bv1h+yuDZ5m0YQt0WZ5+yr1QgxRKMkxFH1zU0l82GffugCqCACmMiMa/kHl1BnhUxEBjjxAtu5I6httTPVbqx0p36/YS5GS8Esj6xVFnKlePNHIbDpDQ5D4JX3CzjSIrVor61O3kvObKwpS5CbstvwoQrDtYHQht4TolMi8Jixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BKqky4nJ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kG1U5
	+VhwCremK/ARvr9ey6vQ1YJB6cGaos88lP26qo=; b=BKqky4nJVxliUggYXdYjI
	vUHcIZb4801J7Ps91BthiAkUHKj+kSIja2Wk+F4/F7QOvKJRkPLN0unSeI76MFgQ
	eDJx2YrJNK1mqA5hO08MxUCWW5Yp+P+sUXWBPLpN9/zqxTP2VXR7XSj+iOalezRx
	rHUTxA2cpkChNHzRnP8spM=
Received: from localhost.localdomain (unknown [111.48.69.247])
	by gzga-smtp-mta-g2-5 (Coremail) with SMTP id _____wDXfyYJap9mXQ19Bg--.8129S2;
	Tue, 23 Jul 2024 16:30:04 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com
Cc: wangyongjun@kylinos.cn,
	zhoulei@kylinos.cn,
	liuyihu@kylinos.cn,
	lizhenneng@kylinos.cn,
	lihongtao@kylinos.cn,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: uvcvideo: Block AlcorMicroCorp camera from reporting key events.
Date: Tue, 23 Jul 2024 16:29:55 +0800
Message-Id: <20240723082955.2911825-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXfyYJap9mXQ19Bg--.8129S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXry5Jw18Zw1xWrWxXFW5KFg_yoW5Ww1Upa
	15ZayY9ryktr4fuw1UZ34Dua4rJan2yayjkFW3G398ZFn5JF1fXFyxtayj9r9Fy3ZrAry2
	q3Z0q342ga1UXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbAwsUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiZQgl3mXAnPLigAABs+

From: chenchangcheng <chenchangcheng@kylinos.cn>

When opening the camera, it will send an interrupt transmission
to the host, which is a request initiated by VS to press a button.
But the camera does't have a physical button to send interrupt
transmission.

This button will cause the upper layer to actively turn off the camera.
Ultimately, it resulted in the failure to open the camera.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
Change-Id: Ie86c311569e8bdc891dc8af12febf6e8643e082f
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 drivers/media/usb/uvc/uvc_status.c | 6 +++++-
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 07128e0..0bdd23b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2891,6 +2891,15 @@ static const struct usb_device_id uvc_ids[] = {
           .bInterfaceClass      = USB_CLASS_VENDOR_SPEC,
           .bInterfaceSubClass   = 1,
           .bInterfaceProtocol   = 0 },
+	/*  AlcorMicroCorp Nantian Camera 8513 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1dfc,
+	  .idProduct		= 0x8513,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_IGNORE_STATUS_EVENT) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 2bdb0ff..17d68e8 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -99,8 +99,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
 	}
 
 	if (status->bEvent == 0) {
-		if (len < 4)
+		if (len < 4 || (dev->quirks & UVC_QUIRK_IGNORE_STATUS_EVENT)) {
+			uvc_trace(UVC_TRACE_STATUS, "Ignore button (intf %u) %s\n",
+			  status->bOriginator,
+			  status->bValue[0] ? "pressed" : "released");
 			return;
+		}
 		uvc_trace(UVC_TRACE_STATUS, "Button (intf %u) %s len %d\n",
 			  status->bOriginator,
 			  status->bValue[0] ? "pressed" : "released", len);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7c1baa..8ac3c28 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -198,6 +198,7 @@
 #define UVC_QUIRK_RESTRICT_FRAME_RATE	0x00000200
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
+#define UVC_QUIRK_IGNORE_STATUS_EVENT	0x00001000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.7.4


