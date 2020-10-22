Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFF529601F
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900224AbgJVNiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900219AbgJVNiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:38:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA37EC0613CF
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:38:01 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l15so2290786wmi.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQlAmo6BNhIFqjQ+zkGnWRNX5gpSqBwFOcKZJzUofPg=;
        b=SckECCy2+VsWIIftp+wBGjSx9MkI4JqmuoATkubZM79pWgywJLF5F3jwXzsdWYhBjL
         TNDE+aH0mmGaInlW8hc+EdlNsznMVGcwkUdedUMb5b8Z1q3X783cXdfOCv+/Ovb9Y85u
         huSzLzuCkY3UL2N1ocVMZdjQfhrEnZMyYmKcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQlAmo6BNhIFqjQ+zkGnWRNX5gpSqBwFOcKZJzUofPg=;
        b=lZvlksdhAjJj7t/+3duHp4ofSTkzUcBpaSOeSW1mEAO4a1dgmZMy3iNEkFKBW0jgyr
         9VgnHclHwZZYjkGWL9EpO3dnsggpy3/DBI4W4sJ8vGol6WRnIRxX8mmgtxMZhpNYpq9M
         GGGByUhdI+dXY92E6nRNPUh6BHFsZ5m9ypVDugNkjX7DsU97PmKgGv2349xOWQweDr8s
         8bwHtl1iBML34Qh+IvjpNOvpEdUYSFn4sgRdWGwfT3r87EWtJa1c/IaoStvnCPGHbX+/
         ACJx62/fBlOAU8cC5QQfG7pzS5dOcw10Ka8n+HSYoFbM6l3FK0eP1cwY0OdLDIFs1dFN
         34Wg==
X-Gm-Message-State: AOAM531uPUjrBXn8I6RAtw5T+3PFFLe4LXnSrQZ8fHKSlq9IFY68Nfzj
        iE3BMzgsp6Lj2D8zLJ3jZFjgIw==
X-Google-Smtp-Source: ABdhPJyH8dRWJldq/eGklfAVifq8/nLddWUt2x85UlqaF3RnfJ/ybzuVmssu1EkzKPJ/8O5pzgTxPg==
X-Received: by 2002:a1c:a749:: with SMTP id q70mr2781440wme.117.1603373880532;
        Thu, 22 Oct 2020 06:38:00 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q10sm4094031wrp.83.2020.10.22.06.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:38:00 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     tfiga@chromium.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 5/6] media: uvcvideo: Implement UVC_GPIO_UNIT
Date:   Thu, 22 Oct 2020 15:37:52 +0200
Message-Id: <20201022133753.310506-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201022133753.310506-1-ribalda@chromium.org>
References: <20201022133753.310506-1-ribalda@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   |  3 ++
 drivers/media/usb/uvc/uvc_driver.c | 72 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  8 ++++
 3 files changed, 83 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 786498e66646..3a49a1326a90 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2332,6 +2332,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
 			bmControls = entity->camera.bmControls;
 			bControlSize = entity->camera.bControlSize;
+		} else if (UVC_ENTITY_TYPE(entity) == UVC_GPIO_UNIT) {
+			bmControls = entity->gpio.bmControls;
+			bControlSize = entity->gpio.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ddb9eaa11be7..180e503e900f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -1440,6 +1441,58 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
+static int uvc_gpio_get_cur(struct uvc_entity *entity, u8 cs, void *data, u16 size)
+{
+	if ((cs != UVC_CT_PRIVACY_CONTROL) || (size < 1))
+		return -EINVAL;
+
+	*(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
+	return 0;
+}
+
+static int uvc_gpio_get_info(struct uvc_entity *entity, u8 cs, u8 *caps)
+{
+
+	if (cs != UVC_CT_PRIVACY_CONTROL)
+		return -EINVAL;
+
+	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
+	return 0;
+}
+
+static int uvc_parse_gpio(struct uvc_device *dev)
+{
+	struct uvc_entity *unit;
+	struct gpio_desc *gpio_privacy;
+	int irq;
+	int ret;
+
+	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy", GPIOD_IN);
+
+	if (IS_ERR(gpio_privacy))
+		return PTR_ERR(gpio_privacy);
+
+	if (!gpio_privacy)
+		return 0;
+
+	unit = uvc_alloc_entity(UVC_GPIO_UNIT, 0xff, 1, 2);
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
+	return 0;
+}
+
 /* ------------------------------------------------------------------------
  * UVC device scan
  */
@@ -1532,6 +1585,12 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 
 		break;
 
+	case UVC_GPIO_UNIT:
+		if (uvc_trace_param & UVC_TRACE_PROBE)
+			printk(KERN_CONT " GPIO %d", entity->id);
+
+		break;
+
 	case UVC_TT_STREAMING:
 		if (UVC_ENTITY_IS_ITERM(entity)) {
 			if (uvc_trace_param & UVC_TRACE_PROBE)
@@ -1929,6 +1988,13 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -1;
 	}
 
+	/* Add GPIO entities to the first_chain */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	list_for_each_entry(term, &dev->entities, list) {
+		if (UVC_ENTITY_TYPE(term) == UVC_GPIO_UNIT)
+			list_add_tail(&term->chain, &chain->entities);
+	}
+
 	return 0;
 }
 
@@ -2261,6 +2327,12 @@ static int uvc_probe(struct usb_interface *intf,
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
index a493bc383d3e..7ca78005b6a9 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -6,6 +6,7 @@
 #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
 #endif /* __KERNEL__ */
 
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/poll.h>
 #include <linux/usb.h>
@@ -37,6 +38,7 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
+#define UVC_GPIO_UNIT 0x7ffe
 
 /* ------------------------------------------------------------------------
  * GUIDs
@@ -351,6 +353,12 @@ struct uvc_entity {
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
2.29.0.rc1.297.gfa9743e501-goog

