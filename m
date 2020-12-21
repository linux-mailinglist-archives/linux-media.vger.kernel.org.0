Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D297F2E0034
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgLUSmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgLUSmr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:42:47 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB8EC0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:42:06 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id q18so12130081wrn.1
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGMSfbGcTj+LKi7ZSdzKGpSyU9y79v1hTguQdk41qfQ=;
        b=BQHGNe8DE3o1bfoSrA7Md+be8FlbkvVie3AOAAuQ93+S25vwP/OHjbLZWiAtffAAcC
         oq2Hfp3lO66iJgX4T705aYSf7oP7Q5etvo819Z3jWoIj2OCwciIZG0CmBcfTbJcuXory
         HzAlHC3WigV/Oag/fBHPoNSB6gVadndXvoHpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGMSfbGcTj+LKi7ZSdzKGpSyU9y79v1hTguQdk41qfQ=;
        b=g2WbcEzOcXGnXRR7gYdlLka05yiN9N4UjcCj7jl/NHQiXpj0S/bF1YbbtX6Na94Xdn
         /rwP/hoXO2SktZC+wq/RaEBKuCDV4RwOdXogawglnXkuTtWGOvTF/yBfMZp93QQKIPDz
         FTKHu+1Z6i6f5L0ELTh+++eN6KWXyZrj0bdlSCHWZoTLh+doD3n1dazAV84oKujN0ZHe
         o4kuO0x8A/f+I1tu0viS4L43Ok3PBNAJlN1STp1wofTbahgtCL/1JaM1a2D+MH/s4y3j
         IBDuLgHbRv7eaQ677Y70tpaT0YKz9AOZL4nZMSg+UjQEo6ZmcczNmxAT2Lp0sIUINDMm
         eimw==
X-Gm-Message-State: AOAM533jQrP/269Y4rkmsoDjXk+rI8odvRkVofpPG7RZsttitFc9wTOI
        7x5hs27i45jaRJESGWguAbu40whgc5EUQJPdUkI=
X-Google-Smtp-Source: ABdhPJy4SQzf+Nr0c20oi720ETjSs3rA00XYO43Pbt5AqvGT6VpLs78qiVYXhAApHsRiQ688XSEAaA==
X-Received: by 2002:a05:6000:185:: with SMTP id p5mr19523691wrx.403.1608569309346;
        Mon, 21 Dec 2020 08:48:29 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:28 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v5 10/12] media: uvcvideo: Use dev_ printk aliases
Date:   Mon, 21 Dec 2020 17:48:17 +0100
Message-Id: <20201221164819.792019-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
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
index 374822b1ee94..1f1323a649fb 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1326,8 +1326,8 @@ static void __uvc_ctrl_status_event_work(struct uvc_device *dev,
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
 	if (ret < 0)
-		uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
-			   ret);
+		dev_err(&dev->udev->dev,
+			"Failed to resubmit status URB (%d).\n", ret);
 }
 
 static void uvc_ctrl_status_event_work(struct work_struct *work)
@@ -2038,10 +2038,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
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
index 7af37d4bd60a..c98d57680e5c 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -536,8 +536,8 @@ static int uvc_parse_format(struct uvc_device *dev,
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
@@ -2137,7 +2137,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 		uvc_scan_fallback(dev);
 
 	if (list_empty(&dev->chains)) {
-		uvc_printk(KERN_INFO, "No valid video chain found.\n");
+		dev_info(&dev->udev->dev, "No valid video chain found.\n");
 		return -1;
 	}
 
@@ -2296,8 +2296,9 @@ int uvc_register_video_device(struct uvc_device *dev,
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
-		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
-			   v4l2_type_names[type], ret);
+		dev_err(&stream->intf->dev,
+			"Failed to register %s device (%d).\n",
+			v4l2_type_names[type], ret);
 		return ret;
 	}
 
@@ -2313,8 +2314,8 @@ static int uvc_register_video(struct uvc_device *dev,
 	/* Initialize the streaming interface with default parameters. */
 	ret = uvc_video_init(stream);
 	if (ret < 0) {
-		uvc_printk(KERN_ERR, "Failed to initialize the device (%d).\n",
-			   ret);
+		dev_err(&stream->intf->dev,
+			"Failed to initialize the device (%d).\n", ret);
 		return ret;
 	}
 
@@ -2348,8 +2349,9 @@ static int uvc_register_terms(struct uvc_device *dev,
 
 		stream = uvc_stream_by_id(dev, term->id);
 		if (stream == NULL) {
-			uvc_printk(KERN_INFO, "No streaming interface found "
-				   "for terminal %u.", term->id);
+			dev_info(&dev->udev->dev,
+				 "No streaming interface found for terminal %u.",
+				 term->id);
 			continue;
 		}
 
@@ -2382,8 +2384,8 @@ static int uvc_register_chains(struct uvc_device *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 		ret = uvc_mc_register_entities(chain);
 		if (ret < 0)
-			uvc_printk(KERN_INFO,
-				   "Failed to register entities (%d).\n", ret);
+			dev_info(&dev->udev->dev,
+				 "Failed to register entities (%d).\n", ret);
 #endif
 	}
 
@@ -2486,17 +2488,18 @@ static int uvc_probe(struct usb_interface *intf,
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
@@ -2525,9 +2528,9 @@ static int uvc_probe(struct usb_interface *intf,
 
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
@@ -3233,7 +3236,6 @@ static int __init uvc_init(void)
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
index 2bdb0ff203f8..36fa196a9258 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -208,8 +208,9 @@ static void uvc_status_complete(struct urb *urb)
 		return;
 
 	default:
-		uvc_printk(KERN_WARNING, "Non-zero status (%d) in status "
-			"completion handler.\n", urb->status);
+		dev_warn(&dev->udev->dev,
+			 "Non-zero status (%d) in status completion handler.\n",
+			 urb->status);
 		return;
 	}
 
@@ -243,10 +244,10 @@ static void uvc_status_complete(struct urb *urb)
 
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
index 32c1ba246d97..a4ebd56bb987 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -757,20 +757,17 @@ extern unsigned int uvc_trace_param;
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
2.29.2.684.gfbc64c5ab5-goog

