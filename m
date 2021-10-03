Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF61441FF3B
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 04:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhJCCit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Oct 2021 22:38:49 -0400
Received: from dhtrptvr.outbound-mail.sendgrid.net ([208.117.55.133]:24639
        "EHLO dhtrptvr.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229589AbhJCCis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Oct 2021 22:38:48 -0400
X-Greylist: delayed 8891 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Oct 2021 22:38:48 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=from:subject:in-reply-to:references:mime-version:to:cc:
        content-transfer-encoding:content-type;
        s=s1; bh=oy6z0GN79qR+xaEd8ButbwsO7yLOxHeKO4hhzyRjvX0=;
        b=UDruXuMRcsTgNuQNSMGVTaq/cPYXJDIbjX2rjUYr2vntLDE5Vz8vG0NAMaPd0X74Qne+
        Jgz8cmxLfkbHok91uAWNDLWSJQTVoFj9AJhSXs/XnKr0frEwSf28c8sHanc99H7KLIpcXb
        0p8bRE8pOIO4DDkVzEUFMaUZcsy5+0WMx2kZBhVCF5pDuZbnYE22/B/6TnZ4umiAMzkiZk
        YfeBjnN+AhbpkmD2AlL9xr4b0EEs1YfD5yMPBoBGJApTQMJnUkiFAQXJxqPCDasHe4g604
        U7n+2DRWvWS3IGX4v41+Q8pD2JAzycQjgXjgF9d8YsD0n/zBcN+UComwsIznnP9A==
Received: by filterdrecv-64fcb979b9-tjknx with SMTP id filterdrecv-64fcb979b9-tjknx-1-6159174D-3
        2021-10-03 02:37:01.10695768 +0000 UTC m=+1651163.910476098
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by ismtpd0048p1las1.sendgrid.net (SG) with ESMTP
        id OI6uS4PqSou0UVpnxeR6HA
        Sun, 03 Oct 2021 02:37:00.949 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id 56D6A3C0436;
        Sat,  2 Oct 2021 19:37:00 -0700 (PDT)
From:   Scott K Logan <logans@cottsay.net>
Subject: [PATCH 1/1] media: uvcvideo: Add quirk for exponential exposure
Date:   Sun, 03 Oct 2021 02:37:01 +0000 (UTC)
Message-Id: <20211003023554.885815-2-logans@cottsay.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003023554.885815-1-logans@cottsay.net>
References: <20211003023554.885815-1-logans@cottsay.net>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmKo1ZoiPmeHrO05Th?=
 =?us-ascii?Q?PrFIxSljnP9RKeutpWc5asj38vsiddoee24bjQe?=
 =?us-ascii?Q?4AEDukPTJUIa1ytff4fEjTSmKqUu2MaFRFQFp5e?=
 =?us-ascii?Q?hs7vKuf8=2FJQXvdOJmN82f3Kcn+hJebdOpRJaC4o?=
 =?us-ascii?Q?alVDpcfcfOLaE6+AndKNQ9VSCv=2FFYI89sEhhkJ?=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        subscribers-only <linux-uvc-devel@lists.sourceforge.net>,
        linux-media@vger.kernel.org
Cc:     Scott K Logan <logans@cottsay.net>
X-Entity-ID: 4JzoG0JXdcXknftrbeCa4w==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least some of the Microsoft LifeCam series of webcams exhibit a
behavior which requires a 'quirk' to be handled properly. When
configuring the absolute exposure value of the image, there are only a
handful of values which will result in a consistent change to the image
exposure, while all other values appear to result in a maximum
exposure.
The valid values appear to follow an exponential pattern from the
maximum value (10000) down to the minimum, yielding less than 15
possible values depending on the device's reported minimum.

Signed-off-by: Scott K Logan <logans@cottsay.net>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 60 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 30bfe9069a1f..2dfc70597858 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2142,6 +2142,40 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 	return 0;
 }
 
+/* --------------------------------------------------------------------------
+ * Quirks
+ */
+
+static s32 uvc_ctrl_get_abs_exposure_exponential(
+	struct uvc_control_mapping *mapping, u8 query, const u8 *data)
+{
+	s32 i;
+	s32 value = uvc_get_le_value(mapping, query, data);
+
+	switch (query) {
+	case UVC_GET_CUR:
+	case UVC_GET_MIN:
+	case UVC_GET_MAX:
+	case UVC_GET_DEF:
+		for (i = 0; i < 14; ++i) {
+			if (10000 >> i <= value)
+				break;
+		}
+		return 14 - i;
+	case UVC_GET_RES:
+		return 1;
+	default:
+		return value;
+	}
+}
+
+static void uvc_ctrl_set_abs_exposure_exponential(
+	struct uvc_control_mapping *mapping, s32 value, u8 *data)
+{
+	value = 10000 >> (14 - value);
+	uvc_set_le_value(mapping, value, data);
+}
+
 /* --------------------------------------------------------------------------
  * Control and mapping handling
  */
@@ -2210,6 +2244,13 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		}
 	}
 
+	if ((chain->dev->quirks & UVC_QUIRK_EXPONENTIAL_EXPOSURE) &&
+	    ctrl->info.selector == UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL) {
+		uvc_dbg(chain->dev, CONTROL, "Applying exponential exposure quirk\n");
+		map->get = uvc_ctrl_get_abs_exposure_exponential;
+		map->set = uvc_ctrl_set_abs_exposure_exponential;
+	}
+
 	list_add_tail(&map->list, &ctrl->info.mappings);
 	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
 		uvc_map_get_name(map), ctrl->info.entity,
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7c007426e082..fa34802dfb33 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2718,6 +2718,24 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Microsoft Lifecam HD-5000 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x045e,
+	  .idProduct		= 0x076d,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
+	/* Microsoft Lifecam Studio */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x045e,
+	  .idProduct		= 0x0772,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
 	/* Logitech Quickcam Fusion */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 2e5366143b81..b6d5ae0b1c90 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -209,6 +209,7 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_EXPONENTIAL_EXPOSURE	0x00002000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.31.1

