Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4550D2E1CAD
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 14:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728840AbgLWNhe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 08:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728449AbgLWNhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 08:37:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7E2C0611CF
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a12so18628180wrv.8
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gntar2EL+CBlGWZMvRkgRe3xUsYyKhqZkRsAHkwmEKY=;
        b=kGNAjd489+wblGjoLmGczt5W9Bf+ZvC/S5WCXBrisn7yzg/SjQunuoBor+qnNGr07y
         o7P4HwwEpxfPmkWAPyyzTA4VmQ+sONl/EQ9X4oZy5Doz9+Gui6RL4HJUkb6ouCqxXXb+
         GHFBkTEwMYFcx77QezZ/8lL7LBv4Aa36NnjUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gntar2EL+CBlGWZMvRkgRe3xUsYyKhqZkRsAHkwmEKY=;
        b=SIcyLf7OrMId2DpPKuCZNlGuvjJ3zLgUodU62KlTNT9fKmO1QC3Zy7LkKWh2AhSXZi
         HkGNsdC2irW1pMOA2FM29/GWcksPkWFWW3YYdIjHQJkm0Y3pW+ScJz+6tUCAqnQrITkZ
         xZn3Ys0X0cU2q5X1Y7v0WtYerBP42yQ5QXrQpxU6tFLvmNJI04lc4tj0Y8/SEux7Xc8H
         oQHoKFwnmwvmrKiaxxScqImktRazzYe/iOYcaMas/oGYHddIINhIqdeFMVkTkZv4Du9M
         lyKZeWfCSPLu0oznL6jV6gBdg9k6rKPqk7qztUrvQ+b6mNFY16jjDoVTMEiL1zS/R5ye
         DrTg==
X-Gm-Message-State: AOAM533nGT08S0VSC1RnKNrocT+9Lja4YMR0qBUJZ1Y/iby6nxb0MIdK
        shFwnyb326ErrArv1QdD1xs6cg==
X-Google-Smtp-Source: ABdhPJxJrrc7xeqycZBHZonnfquMrxiAQ4PuIbVmCF2FDCK4VbODXwRo240Ei+yfG1rR3UtO1MCNCA==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr29716817wrq.19.1608730537192;
        Wed, 23 Dec 2020 05:35:37 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q143sm31572247wme.28.2020.12.23.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 05:35:36 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v7 08/12] media: uvcvideo: Use dev_ printk aliases
Date:   Wed, 23 Dec 2020 14:35:24 +0100
Message-Id: <20201223133528.55014-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201223133528.55014-1-ribalda@chromium.org>
References: <20201223133528.55014-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace all the uses of printk() and uvc_printk() with its
equivalent dev_ alias macros.

Modify uvc_warn_once() macro to use dev_info instead printk().

They are more standard across the kernel tree and provide
more context about the error.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 12 +++----
 drivers/media/usb/uvc/uvc_driver.c | 50 ++++++++++++++++--------------
 drivers/media/usb/uvc/uvc_entity.c | 10 +++---
 drivers/media/usb/uvc/uvc_status.c | 13 ++++----
 drivers/media/usb/uvc/uvc_video.c  | 48 ++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   | 25 +++++++--------
 6 files changed, 81 insertions(+), 77 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 58ad63751baa..b0241daaacce 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1329,8 +1329,8 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
 	if (ret < 0)
-		uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
-			   ret);
+		dev_err(&dev->udev->dev,
+			"Failed to resubmit status URB (%d).\n", ret);
 }
 
 bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
@@ -2010,10 +2010,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			if (!ctrl->initialized || !ctrl->modified ||
 			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
 				continue;
-
-			printk(KERN_INFO "restoring control %pUl/%u/%u\n",
-				ctrl->info.entity, ctrl->info.index,
-				ctrl->info.selector);
+			dev_info(&dev->udev->dev,
+				 "restoring control %pUl/%u/%u\n",
+				 ctrl->info.entity, ctrl->info.index,
+				 ctrl->info.selector);
 			ctrl->dirty = 1;
 		}
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b0bf93c44999..9ca9fcdb7b3d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -535,8 +535,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 				sizeof(format->name));
 			format->fcc = fmtdesc->fcc;
 		} else {
-			uvc_printk(KERN_INFO, "Unknown video format %pUl\n",
-				&buffer[5]);
+			dev_info(&streaming->intf->dev,
+				 "Unknown video format %pUl\n", &buffer[5]);
 			snprintf(format->name, sizeof(format->name), "%pUl\n",
 				&buffer[5]);
 			format->fcc = 0;
@@ -2056,7 +2056,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 		uvc_scan_fallback(dev);
 
 	if (list_empty(&dev->chains)) {
-		uvc_printk(KERN_INFO, "No valid video chain found.\n");
+		dev_info(&dev->udev->dev, "No valid video chain found.\n");
 		return -1;
 	}
 
@@ -2215,8 +2215,9 @@ int uvc_register_video_device(struct uvc_device *dev,
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
-		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
-			   v4l2_type_names[type], ret);
+		dev_err(&stream->intf->dev,
+			"Failed to register %s device (%d).\n",
+			v4l2_type_names[type], ret);
 		return ret;
 	}
 
@@ -2232,8 +2233,8 @@ static int uvc_register_video(struct uvc_device *dev,
 	/* Initialize the streaming interface with default parameters. */
 	ret = uvc_video_init(stream);
 	if (ret < 0) {
-		uvc_printk(KERN_ERR, "Failed to initialize the device (%d).\n",
-			   ret);
+		dev_err(&stream->intf->dev,
+			"Failed to initialize the device (%d).\n", ret);
 		return ret;
 	}
 
@@ -2267,8 +2268,9 @@ static int uvc_register_terms(struct uvc_device *dev,
 
 		stream = uvc_stream_by_id(dev, term->id);
 		if (stream == NULL) {
-			uvc_printk(KERN_INFO, "No streaming interface found "
-				   "for terminal %u.", term->id);
+			dev_info(&dev->udev->dev,
+				 "No streaming interface found for terminal %u.",
+				 term->id);
 			continue;
 		}
 
@@ -2301,8 +2303,8 @@ static int uvc_register_chains(struct uvc_device *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 		ret = uvc_mc_register_entities(chain);
 		if (ret < 0)
-			uvc_printk(KERN_INFO,
-				   "Failed to register entities (%d).\n", ret);
+			dev_info(&dev->udev->dev,
+				 "Failed to register entities (%d).\n", ret);
 #endif
 	}
 
@@ -2405,17 +2407,18 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
-	uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
-		dev->uvc_version >> 8, dev->uvc_version & 0xff,
-		udev->product ? udev->product : "<unnamed>",
-		le16_to_cpu(udev->descriptor.idVendor),
-		le16_to_cpu(udev->descriptor.idProduct));
+	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
+		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
+		 udev->product ? udev->product : "<unnamed>",
+		 le16_to_cpu(udev->descriptor.idVendor),
+		 le16_to_cpu(udev->descriptor.idProduct));
 
 	if (dev->quirks != dev->info->quirks) {
-		uvc_printk(KERN_INFO, "Forcing device quirks to 0x%x by module "
-			"parameter for testing purpose.\n", dev->quirks);
-		uvc_printk(KERN_INFO, "Please report required quirks to the "
-			"linux-uvc-devel mailing list.\n");
+		dev_info(&dev->udev->dev,
+			 "Forcing device quirks to 0x%x by module parameter for testing purpose.\n",
+			 dev->quirks);
+		dev_info(&dev->udev->dev,
+			 "Please report required quirks to the linux-uvc-devel mailing list.\n");
 	}
 
 	/* Register the V4L2 device. */
@@ -2444,9 +2447,9 @@ static int uvc_probe(struct usb_interface *intf,
 
 	/* Initialize the interrupt URB. */
 	if ((ret = uvc_status_init(dev)) < 0) {
-		uvc_printk(KERN_INFO, "Unable to initialize the status "
-			"endpoint (%d), status interrupt will not be "
-			"supported.\n", ret);
+		dev_info(&dev->udev->dev,
+			 "Unable to initialize the status endpoint (%d), status interrupt will not be supported.\n",
+			 ret);
 	}
 
 	ret = uvc_gpio_init_irq(dev);
@@ -3153,7 +3156,6 @@ static int __init uvc_init(void)
 		return ret;
 	}
 
-	printk(KERN_INFO DRIVER_DESC " (" DRIVER_VERSION ")\n");
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index 6a9ba5b498db..7c4d2f93d351 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -140,8 +140,9 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_mc_init_entity(chain, entity);
 		if (ret < 0) {
-			uvc_printk(KERN_INFO, "Failed to initialize entity for "
-				   "entity %u\n", entity->id);
+			dev_info(&chain->dev->udev->dev,
+				 "Failed to initialize entity for entity %u\n",
+				 entity->id);
 			return ret;
 		}
 	}
@@ -149,8 +150,9 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_mc_create_links(chain, entity);
 		if (ret < 0) {
-			uvc_printk(KERN_INFO, "Failed to create links for "
-				   "entity %u\n", entity->id);
+			dev_info(&chain->dev->udev->dev,
+				 "Failed to create links for entity %u\n",
+				 entity->id);
 			return ret;
 		}
 	}
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 3e26d82a906d..4999fa585844 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -209,8 +209,9 @@ static void uvc_status_complete(struct urb *urb)
 		return;
 
 	default:
-		uvc_printk(KERN_WARNING, "Non-zero status (%d) in status "
-			"completion handler.\n", urb->status);
+		dev_warn(&dev->udev->dev,
+			 "Non-zero status (%d) in status completion handler.\n",
+			 urb->status);
 		return;
 	}
 
@@ -244,10 +245,10 @@ static void uvc_status_complete(struct urb *urb)
 
 	/* Resubmit the URB. */
 	urb->interval = dev->int_ep->desc.bInterval;
-	if ((ret = usb_submit_urb(urb, GFP_ATOMIC)) < 0) {
-		uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
-			ret);
-	}
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret < 0)
+		dev_err(&dev->udev->dev,
+			"Failed to resubmit status URB (%d).\n", ret);
 }
 
 int uvc_status_init(struct uvc_device *dev)
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a6a441d92b94..71e643e6d006 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -76,9 +76,9 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	if (likely(ret == size))
 		return 0;
 
-	uvc_printk(KERN_ERR,
-		   "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
-		   uvc_query_name(query), cs, unit, ret, size);
+	dev_err(&dev->udev->dev,
+		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
+		uvc_query_name(query), cs, unit, ret, size);
 
 	if (ret != -EPIPE)
 		return ret;
@@ -254,9 +254,9 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ret = -EIO;
 		goto out;
 	} else if (ret != size) {
-		uvc_printk(KERN_ERR, "Failed to query (%u) UVC %s control : "
-			"%d (exp. %u).\n", query, probe ? "probe" : "commit",
-			ret, size);
+		dev_err(&stream->intf->dev,
+			"Failed to query (%u) UVC %s control : %d (exp. %u).\n",
+			query, probe ? "probe" : "commit", ret, size);
 		ret = -EIO;
 		goto out;
 	}
@@ -334,9 +334,9 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
 		size, uvc_timeout_param);
 	if (ret != size) {
-		uvc_printk(KERN_ERR, "Failed to set UVC %s control : "
-			"%d (exp. %u).\n", probe ? "probe" : "commit",
-			ret, size);
+		dev_err(&stream->intf->dev,
+			"Failed to set UVC %s control : %d (exp. %u).\n",
+			probe ? "probe" : "commit", ret, size);
 		ret = -EIO;
 	}
 
@@ -1120,8 +1120,8 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 
 	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
-		uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
-			   ret);
+		dev_err(&uvc_urb->stream->intf->dev,
+			"Failed to resubmit video URB (%d).\n", ret);
 }
 
 static void uvc_video_decode_data(struct uvc_urb *uvc_urb,
@@ -1507,8 +1507,9 @@ static void uvc_video_complete(struct urb *urb)
 		break;
 
 	default:
-		uvc_printk(KERN_WARNING, "Non-zero status (%d) in video "
-			"completion handler.\n", urb->status);
+		dev_warn(&stream->intf->dev,
+			 "Non-zero status (%d) in video completion handler.\n",
+			 urb->status);
 		fallthrough;
 	case -ENOENT:		/* usb_poison_urb() called. */
 		if (stream->frozen)
@@ -1545,9 +1546,8 @@ static void uvc_video_complete(struct urb *urb)
 	if (!uvc_urb->async_operations) {
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
-			uvc_printk(KERN_ERR,
-				   "Failed to resubmit video URB (%d).\n",
-				   ret);
+			dev_err(&stream->intf->dev,
+				"Failed to resubmit video URB (%d).\n", ret);
 		return;
 	}
 
@@ -1893,8 +1893,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 	for_each_uvc_urb(uvc_urb, stream) {
 		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
-			uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
-				   uvc_urb_index(uvc_urb), ret);
+			dev_err(&stream->intf->dev,
+				"Failed to submit URB %u (%d).\n",
+				uvc_urb_index(uvc_urb), ret);
 			uvc_video_stop_transfer(stream, 1);
 			return ret;
 		}
@@ -1989,7 +1990,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	int ret;
 
 	if (stream->nformats == 0) {
-		uvc_printk(KERN_INFO, "No supported video formats found.\n");
+		dev_info(&stream->intf->dev,
+			 "No supported video formats found.\n");
 		return -EINVAL;
 	}
 
@@ -2029,8 +2031,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	}
 
 	if (format->nframes == 0) {
-		uvc_printk(KERN_INFO, "No frame descriptor found for the "
-			"default format.\n");
+		dev_info(&stream->intf->dev,
+			 "No frame descriptor found for the default format.\n");
 		return -EINVAL;
 	}
 
@@ -2064,8 +2066,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 		if (stream->intf->num_altsetting == 1)
 			stream->decode = uvc_video_encode_bulk;
 		else {
-			uvc_printk(KERN_INFO, "Isochronous endpoints are not "
-				"supported for video output devices.\n");
+			dev_info(&stream->intf->dev,
+				 "Isochronous endpoints are not supported for video output devices.\n");
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 4211531a3558..a8c2766f3d6a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -751,20 +751,17 @@ extern unsigned int uvc_trace_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
 
-#define uvc_trace(flag, msg...) \
-	do { \
-		if (uvc_trace_param & flag) \
-			printk(KERN_DEBUG "uvcvideo: " msg); \
-	} while (0)
-
-#define uvc_warn_once(dev, warn, msg...) \
-	do { \
-		if (!test_and_set_bit(warn, &dev->warnings)) \
-			printk(KERN_INFO "uvcvideo: " msg); \
-	} while (0)
-
-#define uvc_printk(level, msg...) \
-	printk(level "uvcvideo: " msg)
+#define uvc_trace(flag, fmt, ...)					\
+do {									\
+	if (uvc_trace_param & flag)					\
+		printk(KERN_DEBUG "uvcvideo: " fmt, ##__VA_ARGS__);	\
+} while (0)
+
+#define uvc_warn_once(_dev, warn, fmt, ...)				\
+do {									\
+	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
+		dev_info(&(_dev)->udev->dev, fmt, ##__VA_ARGS__);	\
+} while (0)
 
 /* --------------------------------------------------------------------------
  * Internal functions.
-- 
2.29.2.729.g45daf8777d-goog

