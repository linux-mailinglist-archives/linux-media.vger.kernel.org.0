Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EB02E108D
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgLVXGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgLVXGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:06:51 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4DBC0611BB
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:56 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id y23so4293111wmi.1
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FPeZVhvB7xQPVoEViB5lNyVJWf6sQgG3dz4bqz+wAmc=;
        b=XYno5ww9+DA47JWmo80l5yjdA10YI253k+4C8glnHag/lqij0mq+3/yGwMkUfOu734
         gcTwQDKlHrdvwYbU5kSkS6inbhJif6BY8884C+nvHmnLps9rIssQ/M8atczCH0m/KdFL
         hzLfjh9CIgxRSt4jzwhHTnYEVw4X70jcBHhCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FPeZVhvB7xQPVoEViB5lNyVJWf6sQgG3dz4bqz+wAmc=;
        b=T/w2dogXAA9LTiRCrC8tg0912ykCjB5ndA+i2Mqfwxr5N1T6buOVCvf1S/O/Xdu3Y6
         IhcF73y0W6v62lstJWif9czrjbJ/HrA/gUqbhSgPMgMQll0S6Ev8m5XovM5tJkKDAeRM
         X2aLpKJOiFxuxvNy2jvi6bolMA5A8rrFjJyvAx5i1duwbmq3ZGYwfqpVFxTdDPrfjUgj
         uNIG5ynHYn+xHKSJTnlIcvpbRW3aC46Zy6x1NsW9qoeV9TxVAO4rzBpDwcxx+PpWDuds
         BL2WtS39+bU8oDUFeg3r09BV8HYm07y94T13jJBlHPi2ZP+Mfa0RsNzw7EdeW5GFJwU8
         aAVg==
X-Gm-Message-State: AOAM532bH174oiXGf+CtSw1TDtfs21qOJL95iGX6w5yFvCJLRsv5HP3E
        y0iswX95TDLlO8JoDpNcXRWdsg==
X-Google-Smtp-Source: ABdhPJwEGk+2sBMZiVkEYvwwc8o9BmMK0gVzX1L5WdsIUelBrzM1z/lddu5aUMxYenMcl27D2QVcHQ==
X-Received: by 2002:a1c:4645:: with SMTP id t66mr23444779wma.152.1608678295466;
        Tue, 22 Dec 2020 15:04:55 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:55 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v6 09/11] media: uvcvideo: Use dev_ printk aliases
Date:   Wed, 23 Dec 2020 00:04:44 +0100
Message-Id: <20201222230446.1027916-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
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
index 8519f4fbbeb1..f837ffdc8c43 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1331,8 +1331,8 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
 	if (ret < 0)
-		uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
-			   ret);
+		dev_err(&dev->udev->dev,
+			"Failed to resubmit status URB (%d).\n", ret);
 }
 
 bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
@@ -2030,10 +2030,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
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
index 15f7ec7d7e9b..e348d8bb625d 100644
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
@@ -2096,7 +2096,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 		uvc_scan_fallback(dev);
 
 	if (list_empty(&dev->chains)) {
-		uvc_printk(KERN_INFO, "No valid video chain found.\n");
+		dev_info(&dev->udev->dev, "No valid video chain found.\n");
 		return -1;
 	}
 
@@ -2255,8 +2255,9 @@ int uvc_register_video_device(struct uvc_device *dev,
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
-		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
-			   v4l2_type_names[type], ret);
+		dev_err(&stream->intf->dev,
+			"Failed to register %s device (%d).\n",
+			v4l2_type_names[type], ret);
 		return ret;
 	}
 
@@ -2272,8 +2273,8 @@ static int uvc_register_video(struct uvc_device *dev,
 	/* Initialize the streaming interface with default parameters. */
 	ret = uvc_video_init(stream);
 	if (ret < 0) {
-		uvc_printk(KERN_ERR, "Failed to initialize the device (%d).\n",
-			   ret);
+		dev_err(&stream->intf->dev,
+			"Failed to initialize the device (%d).\n", ret);
 		return ret;
 	}
 
@@ -2307,8 +2308,9 @@ static int uvc_register_terms(struct uvc_device *dev,
 
 		stream = uvc_stream_by_id(dev, term->id);
 		if (stream == NULL) {
-			uvc_printk(KERN_INFO, "No streaming interface found "
-				   "for terminal %u.", term->id);
+			dev_info(&dev->udev->dev,
+				 "No streaming interface found for terminal %u.",
+				 term->id);
 			continue;
 		}
 
@@ -2341,8 +2343,8 @@ static int uvc_register_chains(struct uvc_device *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 		ret = uvc_mc_register_entities(chain);
 		if (ret < 0)
-			uvc_printk(KERN_INFO,
-				   "Failed to register entities (%d).\n", ret);
+			dev_info(&dev->udev->dev,
+				 "Failed to register entities (%d).\n", ret);
 #endif
 	}
 
@@ -2445,17 +2447,18 @@ static int uvc_probe(struct usb_interface *intf,
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
@@ -2484,9 +2487,9 @@ static int uvc_probe(struct usb_interface *intf,
 
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
@@ -3192,7 +3195,6 @@ static int __init uvc_init(void)
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
index 03d6ed7fc8ed..07baead470fc 100644
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
index 58422c99f05f..3dcb9e417b3d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -754,20 +754,17 @@ extern unsigned int uvc_trace_param;
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

