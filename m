Return-Path: <linux-media+bounces-38455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D59AB11D0B
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95AE63AD047
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608142E6D3D;
	Fri, 25 Jul 2025 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cGnkGrjd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D752E54D1
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441299; cv=none; b=hFfLhV/pGjH3BZvJlpH6Lb0Pp/HWv8xPq+rGomDM479Ayp4H2uyt1K7Eg0FVvPh96ZsVNDew5weNjkNK2a2nkMJU8VxEAvv8TbB2EhBBKB9/ZhZCIFV3ELqSeBQUvaOHqfYENax8PGNqrgoOhxH9CYxu9ufQnNTHwdk0qCCZaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441299; c=relaxed/simple;
	bh=o30ZSV9FeCx4hujNg/9n5m7YOqfDTDEuc4ltscdB0cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=upyZVdkbGm/x7UfL8GSiHU1vbdjRGoNO2DKqj5h32dB2vuCUTTGxmt5m7RceUROzut9nHhWQvC17NNrlY8IgehPr59cznHhV1KUWrl7w8x98ZFWY5ggeJRFoTCjQigAxbXfoWz1Smiaus/8b4/dH4X9ewpIsnrQyfE93+oRekvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cGnkGrjd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so17339811fa.0
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753441294; x=1754046094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWlgweQLq0iD3tdg0roZR/9BMZAODiAXvKbaTm2lzCs=;
        b=cGnkGrjdhNA6Eelvn+JIgABXjCkUlI0YRPk9XIqlXfpmQs6+Eh2YC521QnGPeWcido
         S+VnLkcnJLyaO45MUqb7D/3cOV+qmWyfODvqdOxRusettXkP4xGWSeXZKQs5exTD+HrA
         H+0MeRcFqeQ7HyEMI4Mp8I4Mr8Y417b5ww6xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441294; x=1754046094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWlgweQLq0iD3tdg0roZR/9BMZAODiAXvKbaTm2lzCs=;
        b=jX/FVEKywAiklXRQXxwFz2Pw44WFAIPjSf83sftdnaFemnJiBeWYSxT8x2PWuXz/Xy
         H3gaoKxZGsjXkvZMu/GxIy62tKgUdnssere5uge18wJ/eN04FmSuk6PmpIE0hZ5tjo6v
         cFdx8NUBRco1zQdb5nIuNA+2FM+dR4wiPQLTNngwCGxUZd2ImybcjH/KQpb1uZ6Tp+Gt
         jllZyHgv9R8HrgiOUYfp+83cLB0D/RSgvuQJDTDMkBzTPm3URvZ/nePbYu7A8NESI6rt
         oS65L/BeYQAlEEuJHXrBNQW7DY/D/J+O4rPZnf6epJOCS593EeuYiPk0QGaO89wIuHkt
         kQEg==
X-Gm-Message-State: AOJu0YzdEXs2ebtEDb1E01/vybKwZfK5EQy9R9BffQnfcnIndC7sBo+7
	YGDoJZQcQD2Y6AnpjdBhsTwQFl3xmu+Hvqa1Ih5RSzytBH5D8+lC3WIlSnuNMz36Vw==
X-Gm-Gg: ASbGnctX7sISqSzf9HSHgbMZJPhpBVMz7JFXVXsewHelBjmi3U84BwjnKXXf4rmP15J
	jqkLPfHHMlgRd0gKtuqEzfqIFl1EpscyJp/EsGBTZ5GobKCUv6u/yFsiRbqcPLV5sVkZA3TriR8
	lX32+l1hTXBtIEQmp8SumJQdjZhd3PBPokY6+hJCDKi/tLmJb/BUXgmveBAxidvAAHggaf4NQCP
	uwvaFzT3ZW0yJIjBmYrQWLEZpE5D/e1qCOYMKwInGCzoAAExdHYaQ7rr4d5V6IBjioCen/BEScd
	UGJ43HaIjK+ysbE2Wse9CubN/wrNFBBRtsMH3R3UlOEIwUMXUm4B8TnlycMVKtaezD27+kDDR+R
	9rxfqt8R3FkLLmjg7+mG8wlmJXxFEXCHcVOd62LA4RFO2R0K7SEzRmPR4pBYGdUlp8hifElfW1k
	QLhw==
X-Google-Smtp-Source: AGHT+IEyc7q+P1FhLgEbwnK+1SM40z9gnYguYl1DecXltBQFvoJzhdsiz7Pk0P5SVQQ5RrPJZNgB0A==
X-Received: by 2002:a2e:be05:0:b0:32a:88ca:ec18 with SMTP id 38308e7fff4ca-331ee6e6d2amr4473321fa.10.1753441293557;
        Fri, 25 Jul 2025 04:01:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e8940156sm4187141fa.97.2025.07.25.04.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 04:01:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Jul 2025 11:01:29 +0000
Subject: [PATCH 1/2] media: uvcvideo: Use intf instead of udev for printks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-uvc-nousbdev-v1-1-28f5a1fdf544@chromium.org>
References: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
In-Reply-To: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The UVC driver is a usb_interface driver. Use the correct device for
printks to avoid confusions with other interface drivers associated to
the same usb device.

With this change:
uvcvideo 3-6:1.0: Found UVC 1.10 device USB2.0 WebCam (1234:abcd)

Without this change:
usb 3-6: Found UVC 1.10 device USB2.0 WebCam (1234:abcd)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 10 +++++-----
 drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++----------
 drivers/media/usb/uvc/uvc_entity.c |  4 ++--
 drivers/media/usb/uvc/uvc_status.c |  4 ++--
 drivers/media/usb/uvc/uvc_video.c  |  6 +++---
 drivers/media/usb/uvc/uvcvideo.h   |  4 ++--
 6 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index efe609d7087752cb2ef516eef0fce12acd13e747..669caec2a3c448b8b2b7e03cd2a03a840aba3e92 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1619,7 +1619,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		}
 
 		if (ret == -EIO) {
-			dev_warn_ratelimited(&chain->dev->udev->dev,
+			dev_warn_ratelimited(&chain->dev->intf->dev,
 					     "UVC non compliance: Error %d querying master control %x (%s)\n",
 					     ret, master_map->id,
 					     uvc_map_get_name(master_map));
@@ -1643,7 +1643,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
 	if (ret && !mapping->disabled) {
-		dev_warn(&chain->dev->udev->dev,
+		dev_warn(&chain->dev->intf->dev,
 			 "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
 			 mapping->id, uvc_map_get_name(mapping), ret);
 		mapping->disabled = true;
@@ -1858,7 +1858,7 @@ static int uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
 	lockdep_assert_held(&handle->chain->ctrl_mutex);
 
 	if (ctrl->handle) {
-		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
+		dev_warn_ratelimited(&handle->stream->dev->intf->dev,
 				     "UVC non compliance: Setting an async control with a pending operation.");
 
 		if (ctrl->handle == handle)
@@ -1956,7 +1956,7 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
 	if (ret < 0)
-		dev_err(&dev->udev->dev,
+		dev_err(&dev->intf->dev,
 			"Failed to resubmit status URB (%d).\n", ret);
 }
 
@@ -2895,7 +2895,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			if (!ctrl->initialized || !ctrl->modified ||
 			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
 				continue;
-			dev_dbg(&dev->udev->dev,
+			dev_dbg(&dev->intf->dev,
 				"restoring control %pUl/%u/%u\n",
 				ctrl->info.entity, ctrl->info.index,
 				ctrl->info.selector);
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 775bede0d93d9b3e5391914aa395326d3de6a3b1..d09d1286da0f61d5953125df23ed92555585e8f2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1868,7 +1868,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 		uvc_scan_fallback(dev);
 
 	if (list_empty(&dev->chains)) {
-		dev_info(&dev->udev->dev, "No valid video chain found.\n");
+		dev_info(&dev->intf->dev, "No valid video chain found.\n");
 		return -ENODEV;
 	}
 
@@ -2092,7 +2092,7 @@ static int uvc_register_terms(struct uvc_device *dev,
 
 		stream = uvc_stream_by_id(dev, term->id);
 		if (stream == NULL) {
-			dev_info(&dev->udev->dev,
+			dev_info(&dev->intf->dev,
 				 "No streaming interface found for terminal %u.",
 				 term->id);
 			continue;
@@ -2128,7 +2128,7 @@ static int uvc_register_chains(struct uvc_device *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 		ret = uvc_mc_register_entities(chain);
 		if (ret < 0)
-			dev_info(&dev->udev->dev,
+			dev_info(&dev->intf->dev,
 				 "Failed to register entities (%d).\n", ret);
 #endif
 	}
@@ -2229,23 +2229,23 @@ static int uvc_probe(struct usb_interface *intf,
 	if (ret < 0)
 		goto error;
 
-	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
+	dev_info(&dev->intf->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		 udev->product ? udev->product : "<unnamed>",
 		 le16_to_cpu(udev->descriptor.idVendor),
 		 le16_to_cpu(udev->descriptor.idProduct));
 
 	if (dev->quirks != dev->info->quirks) {
-		dev_info(&dev->udev->dev,
+		dev_info(&dev->intf->dev,
 			 "Forcing device quirks to 0x%x by module parameter for testing purpose.\n",
 			 dev->quirks);
-		dev_info(&dev->udev->dev,
+		dev_info(&dev->intf->dev,
 			 "Please report required quirks to the linux-media mailing list.\n");
 	}
 
 	if (dev->info->uvc_version) {
 		dev->uvc_version = dev->info->uvc_version;
-		dev_info(&dev->udev->dev, "Forcing UVC version to %u.%02x\n",
+		dev_info(&dev->intf->dev, "Forcing UVC version to %u.%02x\n",
 			 dev->uvc_version >> 8, dev->uvc_version & 0xff);
 	}
 
@@ -2281,21 +2281,21 @@ static int uvc_probe(struct usb_interface *intf,
 	/* Initialize the interrupt URB. */
 	ret = uvc_status_init(dev);
 	if (ret < 0) {
-		dev_info(&dev->udev->dev,
+		dev_info(&dev->intf->dev,
 			 "Unable to initialize the status endpoint (%d), status interrupt will not be supported.\n",
 			 ret);
 	}
 
 	ret = uvc_gpio_init_irq(dev);
 	if (ret < 0) {
-		dev_err(&dev->udev->dev,
+		dev_err(&dev->intf->dev,
 			"Unable to request privacy GPIO IRQ (%d)\n", ret);
 		goto error;
 	}
 
 	ret = uvc_meta_init(dev);
 	if (ret < 0) {
-		dev_err(&dev->udev->dev,
+		dev_err(&dev->intf->dev,
 			"Error initializing the metadata formats (%d)\n", ret);
 		goto error;
 	}
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..3823ac9c8045b3ad8530372fd38983aaafbd775d 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -140,7 +140,7 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_mc_init_entity(chain, entity);
 		if (ret < 0) {
-			dev_info(&chain->dev->udev->dev,
+			dev_info(&chain->dev->intf->dev,
 				 "Failed to initialize entity for entity %u\n",
 				 entity->id);
 			return ret;
@@ -150,7 +150,7 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_mc_create_links(chain, entity);
 		if (ret < 0) {
-			dev_info(&chain->dev->udev->dev,
+			dev_info(&chain->dev->intf->dev,
 				 "Failed to create links for entity %u\n",
 				 entity->id);
 			return ret;
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index ee01dce4b7834b05aab95379191c305cf8cec7f7..d3a3c4125c1fb6c8a5f2ee20bf4f0a9227fe2e46 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -215,7 +215,7 @@ static void uvc_status_complete(struct urb *urb)
 		return;
 
 	default:
-		dev_warn(&dev->udev->dev,
+		dev_warn(&dev->intf->dev,
 			 "Non-zero status (%d) in status completion handler.\n",
 			 urb->status);
 		return;
@@ -247,7 +247,7 @@ static void uvc_status_complete(struct urb *urb)
 	urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret < 0)
-		dev_err(&dev->udev->dev,
+		dev_err(&dev->intf->dev,
 			"Failed to resubmit status URB (%d).\n", ret);
 }
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..f044666947a8c59e5bc6b444bb4e01f54df33c80 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -95,14 +95,14 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	 */
 	if (ret > 0 && query != UVC_GET_INFO) {
 		memset(data + ret, 0, size - ret);
-		dev_warn_once(&dev->udev->dev,
+		dev_warn_once(&dev->intf->dev,
 			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
 			      uvc_query_name(query), cs, unit, ret, size);
 		return 0;
 	}
 
 	if (ret != -EPIPE) {
-		dev_err(&dev->udev->dev,
+		dev_err(&dev->intf->dev,
 			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
 			uvc_query_name(query), cs, unit, ret, size);
 		return ret < 0 ? ret : -EPIPE;
@@ -119,7 +119,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	*(u8 *)data = tmp;
 
 	if (ret != 1) {
-		dev_err_ratelimited(&dev->udev->dev,
+		dev_err_ratelimited(&dev->intf->dev,
 				    "Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
 				    uvc_query_name(query), cs, unit, ret);
 		return ret < 0 ? ret : -EPIPE;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe930ae61c9d0425f04d4cd074a617e..8507de9ae633c9374b6427c890401a6a09ccb819 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -667,7 +667,7 @@ extern unsigned int uvc_hw_timestamps_param;
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\
 	if (uvc_dbg_param & UVC_DBG_##flag)				\
-		dev_printk(KERN_DEBUG, &(_dev)->udev->dev, fmt,		\
+		dev_printk(KERN_DEBUG, &(_dev)->intf->dev, fmt,		\
 			   ##__VA_ARGS__);				\
 } while (0)
 
@@ -680,7 +680,7 @@ do {									\
 #define uvc_warn_once(_dev, warn, fmt, ...)				\
 do {									\
 	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
-		dev_info(&(_dev)->udev->dev, fmt, ##__VA_ARGS__);	\
+		dev_info(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
 } while (0)
 
 /* --------------------------------------------------------------------------

-- 
2.50.1.470.g6ba607880d-goog


