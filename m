Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3871145B100
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 02:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbhKXBLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 20:11:19 -0500
Received: from dhtrptvr.outbound-mail.sendgrid.net ([208.117.55.133]:19492
        "EHLO dhtrptvr.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232547AbhKXBLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 20:11:18 -0500
X-Greylist: delayed 543 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Nov 2021 20:11:18 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=from:subject:in-reply-to:references:mime-version:to:cc:
        content-transfer-encoding:content-type;
        s=s1; bh=RB7nXO+KUWphDBWj6Y1fU+hvnEYvNqNMauNTavDrtD4=;
        b=gPm5HPzfcachnINd7SHuDQzaAlr2xVrWzWOWxmSLhzuamauyYBszFu/gtAvS7THNrI66
        aqW6wEtfpMapHL79I4cQf+zqaR7It7k4uOBEor7ucxPYHLUNdw8DNpLB4rzgXiJ1QkLZbS
        iG4/K4sTuwdnle6NrzBSrxtaLfebjrT9H0unQVcCJ0G1bcD1GyBGwEY0suDA/2UVGzlNpQ
        Gvuk9zxsAHWAuJKb83QdgONfi9hHJvnb8UVqCwDURtfXjIPpCCfg/uIH98IiH1bMAaGT7i
        WgitjmQYkPtyV0Ve2vqLxLVbK+yDDCyk2Kjo3QjOKkMQxB8RWdDvUBzgbbQzpefA==
Received: by filterdrecv-64fcb979b9-zwvj5 with SMTP id filterdrecv-64fcb979b9-zwvj5-1-619D8E59-13
        2021-11-24 00:59:05.507953777 +0000 UTC m=+6138081.665299869
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by geopod-ismtpd-5-1 (SG) with ESMTP
        id sJSEDrk3RQqbXEAvv1XQIQ
        Wed, 24 Nov 2021 00:59:05.333 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id 316DD1E0C97;
        Tue, 23 Nov 2021 16:59:04 -0800 (PST)
From:   Scott K Logan <logans@cottsay.net>
Subject: [PATCH v2 1/1] media: uvcvideo: Add quirk for exponential exposure
Date:   Wed, 24 Nov 2021 00:59:05 +0000 (UTC)
Message-Id: <20211124005834.556428-1-logans@cottsay.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211003023554.885815-2-logans@cottsay.net>
References: <20211003023554.885815-2-logans@cottsay.net>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmB98M7kduxQC0k2Vk?=
 =?us-ascii?Q?Aawy9MThnYynLjiCgeihtgJ29ap9QCCsr=2FEgMOX?=
 =?us-ascii?Q?5QNvkUYbtrcY0s7nXifxXsb7qV2GQBffCsqP6JV?=
 =?us-ascii?Q?dtWFxero3xNBfIZ4AdftkLc04WFR6Dd69=2FaMwvv?=
 =?us-ascii?Q?jrZjVLTLmYg0cA=2FOJfhzMtbN1belnq8Uid+EYW?=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-uvc-devel@lists.sourceforge.net, linux-media@vger.kernel.org,
        Yuriy M Kaminskiy <yumkam@gmail.com>
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
 drivers/media/usb/uvc/uvc_driver.c | 27 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 69 insertions(+)

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
index 7c007426e082..9edf77ee30e6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2718,6 +2718,33 @@ static const struct usb_device_id uvc_ids[] = {
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
+	/* Microsoft Lifecam HD-3000 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x045e,
+	  .idProduct		= 0x0810,
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
2.33.1

