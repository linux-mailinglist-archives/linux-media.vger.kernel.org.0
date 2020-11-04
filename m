Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9232A6C71
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbgKDSIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732228AbgKDSHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:54 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0163EC0401C4
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:52 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h62so3211691wme.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RJh2fYDvOJ5ldvaxv73K3rFq8dcfyeUCeQ9u9mUrnFQ=;
        b=Zs+We18Ffmjwoj6BNEKSWXq69LCB/hg65EupRsPE6yDvoEeU5+zwn/xaFHQL6fjv84
         vchkzIwjCVSxq4O2/4PhIMVQ6qfiLE1VRLIMc5R5Zo8ertwFkMBshXg26ETyK21BFK01
         izN0gzx3Z8vk+QxugiEml6bd1y2TlzSNyZUyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RJh2fYDvOJ5ldvaxv73K3rFq8dcfyeUCeQ9u9mUrnFQ=;
        b=YHz6BYqYST/6kGNDC4651+JcfT23AJbdLsvI3SVJf6UuztQR3LJ02JthpB4+X0kFlw
         i2qqTWfEhjzl5NIqe1UcTo2HNpL6OUxMH1CBJXsrqfeIyt8O9HEeaKjSWFdYZGSWhi3z
         6qconcDRT61V5JuuUqY2Mfl4V1sMT3+EBXJyBgLZXrqJijn0N/vBTUmna0jwwD748DuR
         KINMnEBiQLfwhj+0en46GS6u2YbNnTbAen3KVpJ3xlMyYO9VooxUHnwWw2p+h48nwvwa
         0+dSTinzxSOH6xcSV0zZjl8AEuu65gMEOwIGnz8/HVqdnwnoB5k8SmT10nuYr0F3+1/b
         1ADw==
X-Gm-Message-State: AOAM533hodEwI7Z174hbMp2X7xZ5cxdypBsMN5DwH4TULJGmVpLXsQ+k
        UW4L2ygs3zu7sqSVoXHtbyXrKg==
X-Google-Smtp-Source: ABdhPJy9YWuM2YBOLxZkoV/vVdDG4dlBXQMW2ikusfmDHzxLXTp8SIVytRXe09XgYMRvIYQIIHwx0A==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr5915017wmj.49.1604513270665;
        Wed, 04 Nov 2020 10:07:50 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:50 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 6/7] media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
Date:   Wed,  4 Nov 2020 19:07:33 +0100
Message-Id: <20201104180734.286789-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104180734.286789-1-ribalda@chromium.org>
References: <20201104180734.286789-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices can implement a physical switch to disable the input of the
camera on demand. Think of it like an elegant privacy sticker.

The system can read the status of the privacy switch via a GPIO.

It is important to know the status of the switch, e.g. to notify the
user when the camera will produce black frames and a videochat
application is used.

Since the uvc device is not aware of this pin (and it should't), we need
to implement a virtual entity that can interact with such pin.

The location of the GPIO is specified via acpi or DT. on the usb device Eg:

  Scope (\_SB.PCI0.XHCI.RHUB.HS07)
  {

	  /.../

    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
        GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
            "\\_SB.PCI0.GPIO", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0064
            }
    })
    Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
    {
        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
        Package (0x01)
        {
            Package (0x02)
            {
                "privacy-gpio",
                Package (0x04)
                {
                    \_SB.PCI0.XHCI.RHUB.HS07,
                    Zero,
                    Zero,
                    One
                }
            }
        }
    })
  }

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   |   6 ++
 drivers/media/usb/uvc/uvc_driver.c | 105 +++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  12 ++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 076f63af1031..f9382f8c10a8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1301,6 +1301,9 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
 
 	mutex_unlock(&chain->ctrl_mutex);
 
+	if (!w->urb)
+		return;
+
 	/* Resubmit the URB. */
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
@@ -2285,6 +2288,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
 			bmControls = entity->camera.bmControls;
 			bControlSize = entity->camera.bControlSize;
+		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
+			bmControls = entity->gpio.bmControls;
+			bControlSize = entity->gpio.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 27acc221f0d6..bb977b333752 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -1020,6 +1021,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 }
 
 static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
+static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
 static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
@@ -1048,6 +1050,9 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 	entity->type = type;
 
 	switch (type) {
+	case UVC_EXT_GPIO_UNIT:
+		memcpy(entity->guid, uvc_gpio_guid, 16);
+		break;
 	case UVC_ITT_CAMERA:
 		memcpy(entity->guid, uvc_camera_guid, 16);
 		break;
@@ -1461,6 +1466,92 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
+static int uvc_gpio_get_cur(struct uvc_entity *entity, u8 cs, void *data,
+			    u16 size)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
+		return -EINVAL;
+
+	*(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
+	return 0;
+}
+
+static int uvc_gpio_get_info(struct uvc_entity *entity, u8 cs, u8 *caps)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL)
+		return -EINVAL;
+
+	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
+	return 0;
+}
+
+static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
+{
+	struct uvc_device *dev = data;
+	struct uvc_video_chain *chain;
+	struct uvc_entity *unit;
+	u8 value;
+
+	/* GPIO entities are always on the first chain */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	list_for_each_entry(unit, &dev->entities, list) {
+		if (UVC_ENTITY_TYPE(unit) != UVC_EXT_GPIO_UNIT)
+			continue;
+		value = gpiod_get_value(unit->gpio.gpio_privacy);
+		uvc_ctrl_status_event(NULL, chain, unit->controls, &value);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int uvc_parse_gpio(struct uvc_device *dev)
+{
+	struct uvc_entity *unit;
+	struct gpio_desc *gpio_privacy;
+	int irq;
+	int ret;
+
+	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
+					       GPIOD_IN);
+	if (IS_ERR(gpio_privacy))
+		return PTR_ERR(gpio_privacy);
+
+	if (!gpio_privacy)
+		return 0;
+
+	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
+	unit->gpio.gpio_privacy = gpio_privacy;
+	unit->gpio.bControlSize = 1;
+	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->gpio.bmControls[0] = 1;
+	unit->get_cur = uvc_gpio_get_cur;
+	unit->get_info = uvc_gpio_get_info;
+
+	sprintf(unit->name, "GPIO Unit");
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	irq = gpiod_to_irq(gpio_privacy);
+	if (irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	if (irq < 0)
+		return 0;
+
+	ret = devm_request_irq(&dev->udev->dev, irq, uvc_privacy_gpio_irq,
+			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
+			       "uvc_privacy_gpio", dev);
+	if (ret < 0)
+		dev_warn(&dev->udev->dev,
+		       "Unable to request uvc_privacy_gpio irq. Continuing\n");
+
+	return 0;
+}
+
 /* ------------------------------------------------------------------------
  * UVC device scan
  */
@@ -1912,6 +2003,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 {
 	struct uvc_video_chain *chain;
 	struct uvc_entity *term;
+	struct uvc_entity *unit;
 
 	list_for_each_entry(term, &dev->entities, list) {
 		if (!UVC_ENTITY_IS_OTERM(term))
@@ -1950,6 +2042,13 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -1;
 	}
 
+	/* Add GPIO entities to the first chain */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	list_for_each_entry(unit, &dev->entities, list) {
+		if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
+			list_add_tail(&unit->chain, &chain->entities);
+	}
+
 	return 0;
 }
 
@@ -2282,6 +2381,12 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	/* Parse the associated GPIOs */
+	if (uvc_parse_gpio(dev) < 0) {
+		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
+		goto error;
+	}
+
 	uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		udev->product ? udev->product : "<unnamed>",
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 776b083ed466..689f95ff4f12 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -6,6 +6,7 @@
 #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
 #endif /* __KERNEL__ */
 
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/poll.h>
 #include <linux/usb.h>
@@ -37,6 +38,8 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
+#define UVC_EXT_GPIO_UNIT 0x7ffe
+#define UVC_EXT_GPIO_UNIT_ID 0x100
 
 /* ------------------------------------------------------------------------
  * GUIDs
@@ -56,6 +59,9 @@
 #define UVC_GUID_UVC_SELECTOR \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
+#define UVC_GUID_EXT_GPIO_CONTROLLER \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
@@ -348,6 +354,12 @@ struct uvc_entity {
 			u8  *bmControls;
 			u8  *bmControlsType;
 		} extension;
+
+		struct {
+			u8  bControlSize;
+			u8  *bmControls;
+			struct gpio_desc *gpio_privacy;
+		} gpio;
 	};
 
 	u8 bNrInPins;
-- 
2.29.1.341.ge80a0c044ae-goog

