Return-Path: <linux-media+bounces-37806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C189B06652
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9135C163C79
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288FA2C08AB;
	Tue, 15 Jul 2025 18:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HBfQ2pFP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E891C8616
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605584; cv=none; b=NCZobJm2bslEZ5cmsoGmd6X3P6XtmWkT5Rn0He2PRvgeiPAd3b9NsRW27bGyWeof4OnU/uXboWqx6Z4BsSfv/uAjtXpEqOXGHM6kqmAtGvKZTn3+dKT79i8Ocu7xefcFgk6qQe2rruRDX/eVy6SFbBt7/LpHVNPw6h8Mqpw0EIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605584; c=relaxed/simple;
	bh=30fA+Uo215jdxupilwNi/cdtPpwvEE1ieVNvV9F2BgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+ZtkfDzFUqBODa9379ES2zQx4vnIcEHypQJ/+q+xHkwOGSDPr7Tlcwi3hT3K3cFYZePA/GwF3KRh6aa50TCqs7tdSVd7KHz++6fHZOP5bEqZf40Ti7TQwNBX9K6/Txhf60Y/ooV/d7qvTR8Thy90JgzRP+KDNP3ASfTsn4cy0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HBfQ2pFP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C1ECD289;
	Tue, 15 Jul 2025 20:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752605549;
	bh=30fA+Uo215jdxupilwNi/cdtPpwvEE1ieVNvV9F2BgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HBfQ2pFP6V07vdHgF5VVf09EAaRnJ4srjQ5WJipgieYtHBDUhRcKSHC+NSsrjGh+B
	 rMmvH9PQ++/KeuDEGqneKc+Uto1JYyq/oJ2PNMFNYI8l8DKHi/5AgsOZ4i8j9m7HE9
	 uswN4+bOeqWMijO5+FJKmb0F0KJZ9ms4hNIW3qIs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 3/3] media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header
Date: Tue, 15 Jul 2025 21:52:54 +0300
Message-ID: <20250715185254.6592-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the MSXU_CONTROL_METADATA control definitino to the
include/linux/usb/uvc.h header, alongside the corresponding XU GUID. Add
a UVC_ prefix to avoid namespace clashes.

While at it, add the definition for the other controls for that
extension unit, as defined in
https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_metadata.c |  9 ++++-----
 include/linux/usb/uvc.h              | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 386b04a3a102..57f5455a726c 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -171,7 +171,6 @@ static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
 	return NULL;
 }
 
-#define MSXU_CONTROL_METADATA 0x9
 static int uvc_meta_detect_msxu(struct uvc_device *dev)
 {
 	u32 *data __free(kfree) = NULL;
@@ -192,7 +191,7 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 
 	/* Check if the metadata is already enabled. */
 	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
-			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret)
 		return 0;
 
@@ -207,16 +206,16 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	 * us, the value from GET_MAX seems to work all the time.
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
-			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret || !*data)
 		return 0;
 
 	/*
-	 * If we can set MSXU_CONTROL_METADATA, the device will report
+	 * If we can set UVC_MSXU_CONTROL_METADATA, the device will report
 	 * metadata.
 	 */
 	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
-			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (!ret)
 		dev->quirks |= UVC_QUIRK_MSXU_META;
 
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index ee19e9f915b8..72fff9463c88 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -33,6 +33,22 @@
 	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
 	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
 
+#define UVC_MSXU_CONTROL_FOCUS			0x01
+#define UVC_MSXU_CONTROL_EXPOSURE		0x02
+#define UVC_MSXU_CONTROL_EVCOMPENSATION		0x03
+#define UVC_MSXU_CONTROL_WHITEBALANCE		0x04
+#define UVC_MSXU_CONTROL_FACE_AUTHENTICATION	0x06
+#define UVC_MSXU_CONTROL_CAMERA_EXTRINSICS	0x07
+#define UVC_MSXU_CONTROL_CAMERA_INTRINSICS	0x08
+#define UVC_MSXU_CONTROL_METADATA		0x09
+#define UVC_MSXU_CONTROL_IR_TORCH		0x0a
+#define UVC_MSXU_CONTROL_DIGITALWINDOW		0x0b
+#define UVC_MSXU_CONTROL_DIGITALWINDOW_CONFIG	0x0c
+#define UVC_MSXU_CONTROL_VIDEO_HDR		0x0d
+#define UVC_MSXU_CONTROL_FRAMERATE_THROTTLE	0x0e
+#define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG	0x0f
+#define UVC_MSXU_CONTROL_FIELDOFVIEW2		0x10
+
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
Regards,

Laurent Pinchart


