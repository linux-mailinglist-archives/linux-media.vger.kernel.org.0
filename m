Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461E22DFFA9
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgLUSZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLUSZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:25:53 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB45C0613D6
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:25:13 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c133so10768732wme.4
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skLFBdxo6UCYZ4yDxWChUtdKPmyeX1NQl5DrEbn25iI=;
        b=dGonIstMEWJigNB22oJtYe6ikAUSMbTdkJjRiH8Mxh7UJ2WgdDuMvHiIqRhGM25VxA
         FMIMiaG+qblUthDnHupv9AezXkyw/hlUGvqDlZFodoELRdWFi/+NgqkCwLeZ7aGq7U34
         XGiWjrHoNXAqV4AlBwWjDgLiijqrlxZN4l8pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skLFBdxo6UCYZ4yDxWChUtdKPmyeX1NQl5DrEbn25iI=;
        b=HYzsNDhq4IZbnodfhPdWizBo2XAoH2WZiApAxA8EDs35wsc7RFKELIceGW712vJNiU
         b7wurD95wbV4BPwnz8L+HkPdNl228rcDVXPWwTX5qUFK82DCiw057NPL3vUk45GooDV6
         GJuQNl3MvxsqGj7hNklxCK3xDiExtBA04kNeSfzgj0xrYlUPH6pYuWmIJWTFfuLPT9mQ
         HtlFj0L/spAUHiEUasTOgVtEeCZdMoBsCiKnKl5ijLvI1utGzZh9NqeSNcNDmdifVLuG
         4zp72ySvM/jUfH5EWMjsKej0f7QVt+ugowDgOLPb7Nz+Rcut/zL/f+uzpeZkCU4x9lxQ
         gOFQ==
X-Gm-Message-State: AOAM533RYqupNjw8CdzNI2I7Lr4EyGafjVU0XAAJNzwZNC7ETwvLAUg2
        FtcQ/6h7g330o+OtL4imGWq46q92e59JuSdWkFk=
X-Google-Smtp-Source: ABdhPJy+ooun0QSQm9bX8V9EP7EZb+lSg8PNvOdnDujyKFIgMUsJU48pzCu4vrBGeun9Ca0RnUimNQ==
X-Received: by 2002:a1c:2ed2:: with SMTP id u201mr17350407wmu.79.1608569307344;
        Mon, 21 Dec 2020 08:48:27 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:26 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 07/12] media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
Date:   Mon, 21 Dec 2020 17:48:14 +0100
Message-Id: <20201221164819.792019-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
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

In some systems, the GPIO is connected to main SoC instead of the
camera controller, with the connected reported by the system firmware
(ACPI or DT). In that case, the UVC device isn't aware of the GPIO. We
need to implement a virtual entity to handle the GPIO fully on the
driver side.

For example, for ACPI-based systems, the GPIO is reported in the USB
device object:

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
 drivers/media/usb/uvc/uvc_ctrl.c   |   7 ++
 drivers/media/usb/uvc/uvc_driver.c | 156 +++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_entity.c |   1 +
 drivers/media/usb/uvc/uvcvideo.h   |  16 +++
 4 files changed, 180 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 528254230535..a430fa666897 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1300,6 +1300,10 @@ static void __uvc_ctrl_status_event_work(struct uvc_device *dev,
 
 	mutex_unlock(&chain->ctrl_mutex);
 
+	/* Events not started by the UVC device. E.g. the GPIO unit */
+	if (!w->urb)
+		return;
+
 	/* Resubmit the URB. */
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
@@ -2317,6 +2321,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
 			bmControls = entity->camera.bmControls;
 			bControlSize = entity->camera.bControlSize;
+		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
+			bmControls = entity->gpio.bmControls;
+			bControlSize = entity->gpio.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index c0c5f75ade40..72516101fdd0 100644
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
@@ -1051,6 +1053,9 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 	 * is initialized by the caller.
 	 */
 	switch (type) {
+	case UVC_EXT_GPIO_UNIT:
+		memcpy(entity->guid, uvc_gpio_guid, 16);
+		break;
 	case UVC_ITT_CAMERA:
 		memcpy(entity->guid, uvc_camera_guid, 16);
 		break;
@@ -1464,6 +1469,137 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
+/* -----------------------------------------------------------------------------
+ * Privacy GPIO
+ */
+
+
+static u8 uvc_gpio_update_value(struct uvc_device *dev,
+				struct uvc_entity *unit)
+{
+	struct uvc_video_chain *chain;
+	u8 gpio_val, old_val, new_val;
+
+	gpio_val = new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+
+	old_val = atomic_xchg(&unit->gpio.gpio_privacy_value, gpio_val);
+	if (new_val == old_val)
+		return new_val;
+
+	/* GPIO entities are always on the first chain. */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	uvc_ctrl_status_event(NULL, chain, unit->controls, &new_val);
+
+	return new_val;
+}
+
+static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+			    u8 cs, void *data, u16 size)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
+		return -EINVAL;
+
+	*(uint8_t *)data = uvc_gpio_update_value(dev, entity);
+	return 0;
+}
+
+static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
+			     u8 cs, u8 *caps)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL)
+		return -EINVAL;
+
+	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
+	return 0;
+}
+
+static struct uvc_entity *uvc_gpio_find_entity(struct uvc_device *dev)
+{
+	struct uvc_video_chain *chain;
+	struct uvc_entity *unit;
+
+	/* GPIO entities are always on the first chain. */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	list_for_each_entry(unit, &chain->entities, chain) {
+		if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
+			return unit;
+	}
+
+	return NULL;
+}
+
+static irqreturn_t uvc_gpio_irq(int irq, void *data)
+{
+	struct uvc_device *dev = data;
+	struct uvc_entity *unit;
+
+	unit = uvc_gpio_find_entity(dev);
+	if (!unit)
+		return IRQ_HANDLED;
+
+	uvc_gpio_update_value(dev, unit);
+	return IRQ_HANDLED;
+}
+
+static int uvc_gpio_parse(struct uvc_device *dev)
+{
+	struct uvc_entity *unit;
+	struct gpio_desc *gpio_privacy;
+	int irq;
+
+	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
+					       GPIOD_IN);
+	if (IS_ERR_OR_NULL(gpio_privacy))
+		return PTR_ERR_OR_ZERO(gpio_privacy);
+
+	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
+	irq = gpiod_to_irq(gpio_privacy);
+	if (irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	if (irq < 0)
+		dev_warn(&dev->udev->dev,
+		       "Unable to find privacy_gpio: %d\n", irq);
+
+	atomic_set(&unit->gpio.gpio_privacy_value, -1);
+	unit->gpio.gpio_privacy = gpio_privacy;
+	unit->gpio.irq = irq;
+	unit->gpio.bControlSize = 1;
+	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->gpio.bmControls[0] = 1;
+	unit->get_cur = uvc_gpio_get_cur;
+	unit->get_info = uvc_gpio_get_info;
+
+	sprintf(unit->name, "GPIO");
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	return 0;
+}
+
+static int uvc_gpio_init_irq(struct uvc_device *dev)
+{
+	int ret;
+	struct uvc_entity *unit;
+
+	unit = uvc_gpio_find_entity(dev);
+	if (!unit)
+		return 0;
+
+	if (unit->gpio.irq < 0)
+		return 0;
+
+	ret = devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
+					uvc_gpio_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
+					 IRQF_TRIGGER_RISING,
+					"uvc_privacy_gpio", dev);
+	return ret;
+}
+
 /* ------------------------------------------------------------------------
  * UVC device scan
  */
@@ -1915,6 +2051,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 {
 	struct uvc_video_chain *chain;
 	struct uvc_entity *term;
+	struct uvc_entity *unit;
 
 	list_for_each_entry(term, &dev->entities, list) {
 		if (!UVC_ENTITY_IS_OTERM(term))
@@ -1953,6 +2090,13 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -1;
 	}
 
+	/* Add GPIO entities to the first chain. */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	list_for_each_entry(unit, &dev->entities, list) {
+		if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
+			list_add_tail(&unit->chain, &chain->entities);
+	}
+
 	return 0;
 }
 
@@ -2285,6 +2429,12 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	/* Parse the associated GPIOs. */
+	if (uvc_gpio_parse(dev) < 0) {
+		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
+		goto error;
+	}
+
 	uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		udev->product ? udev->product : "<unnamed>",
@@ -2329,6 +2479,12 @@ static int uvc_probe(struct usb_interface *intf,
 			"supported.\n", ret);
 	}
 
+	ret = uvc_gpio_init_irq(dev);
+	if (ret < 0)
+		dev_warn(&dev->udev->dev,
+			 "Unable to request uvc_privacy_gpio irq %d. Continuing wihtout privacy events\n",
+			 ret);
+
 	uvc_trace(UVC_TRACE_PROBE, "UVC device initialized.\n");
 	usb_enable_autosuspend(udev);
 	return 0;
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index ca3a9c2eec27..6a9ba5b498db 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -105,6 +105,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_DISPLAY:
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
+		case UVC_EXT_GPIO_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6edbf79b2ff1..079a407ebba5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -6,6 +6,7 @@
 #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
 #endif /* __KERNEL__ */
 
+#include <linux/atomic.h>
 #include <linux/kernel.h>
 #include <linux/poll.h>
 #include <linux/usb.h>
@@ -37,6 +38,8 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
+#define UVC_EXT_GPIO_UNIT		0x7ffe
+#define UVC_EXT_GPIO_UNIT_ID		0x100
 
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
@@ -278,6 +284,8 @@ struct uvc_format_desc {
 	u32 fcc;
 };
 
+struct gpio_desc;
+
 /* The term 'entity' refers to both UVC units and UVC terminals.
  *
  * The type field is either the terminal type (wTerminalType in the terminal
@@ -353,6 +361,14 @@ struct uvc_entity {
 			u8  *bmControls;
 			u8  *bmControlsType;
 		} extension;
+
+		struct {
+			u8  bControlSize;
+			u8  *bmControls;
+			struct gpio_desc *gpio_privacy;
+			int irq;
+			atomic_t gpio_privacy_value;
+		} gpio;
 	};
 
 	u8 bNrInPins;
-- 
2.29.2.684.gfbc64c5ab5-goog

