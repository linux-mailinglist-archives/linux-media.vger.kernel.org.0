Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DFF54CC46
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244347AbiFOPNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242330AbiFOPNH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:13:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C85011C0D
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:06 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z7so16599769edm.13
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nxHwUwUuK5U+dFx9/GDrIMCnRWc/PWyIrdKraztqqMs=;
        b=UMiZL2PeR/D3H8SwhhqZ4ytFyghgutCbWGDxabeKT5Pm8/GW4sl6qy6InBRoS7G2cZ
         jbLOrURxYH+P9z5NdFThCSRDxpMDieDme9bUoQShOJpcAFlLygHolUyf+rbOofF5O8z/
         J1JU79NDxthQ6K1rH4WHLJNdbvUC7LUoISJr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nxHwUwUuK5U+dFx9/GDrIMCnRWc/PWyIrdKraztqqMs=;
        b=xr9G+i8B2joIUbZfqxuMwm5dQmuMSvobTjrDnp4GJe5seImAuz8Ti+953kGxyzHC0m
         vGLeu/t3O2ggw0sKSa8J8h6AcqDdUhGw2qZUeBXbtMDF9FosQiWCBlF0x3DKsF3GUvZe
         q5VXO+yqiIR6NXVQFr+BuufURY9ZItM8C20CI6mj1jH+/1WrFqFgWjWglxEIqde3xFFW
         ovB/actVwYtXT6HsaPX5ARRccB/DJCt5r2YYcvKn7vaaqpKcfvBF5tE9DUAhTcS1Ul9N
         H28849bpzPwAReqiMRtn2hhh2ZTHxWqBkK2jTrlr1/Rd+yHG1nqLkIOtdKNxvc8Xs59v
         sz6w==
X-Gm-Message-State: AJIora821gnrdj9Y6qIugsdPO2wy7PVbIeH8xTq1Kk6yqHianfskcL/N
        YGiD7NlFv2a1P9RN3RPWvIoGdw==
X-Google-Smtp-Source: AGRyM1uF6P0Cu+GigGU7J7pjEn7/Y2CjwsZUdT2jVDX0jzUiOMMUgQ916T46X5GHrLJCyeRKmIzuuQ==
X-Received: by 2002:a05:6402:84c:b0:430:aae2:6dd8 with SMTP id b12-20020a056402084c00b00430aae26dd8mr249911edz.31.1655305984987;
        Wed, 15 Jun 2022 08:13:04 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b25-20020aa7cd19000000b0042bd2012196sm9610264edw.85.2022.06.15.08.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:13:04 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 4/8] media: uvcvideo: Limit power line control for Quanta UVC Webcam
Date:   Wed, 15 Jun 2022 17:12:55 +0200
Message-Id: <20220615151259.77825-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615151259.77825-1-ribalda@chromium.org>
References: <20220615151259.77825-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device does not implement the power line control correctly. Add a
corresponding control mapping override.

Bus 001 Device 003: ID 0408:3090 Quanta Computer, Inc. USB2.0 HD UVC WebCam
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0408 Quanta Computer, Inc.
  idProduct          0x3090
  bcdDevice            0.04
  iManufacturer           3 Quanta
  iProduct                1 USB2.0 HD UVC WebCam
  iSerial                 2 0x0001
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 6c86faecbea2..4fb07084f1c0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2643,6 +2643,32 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
  * Driver initialization and cleanup
  */
 
+static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
+	{ 0, "Invalid" },
+	{ 1, "50 Hz" },
+	{ 2, "60 Hz" },
+};
+
+static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_info	= power_line_frequency_controls_limited,
+	.menu_min	= 1,
+	.menu_count	= ARRAY_SIZE(power_line_frequency_controls_limited),
+};
+
+static const struct uvc_device_info uvc_ctrl_power_line_limited = {
+	.mappings = (const struct uvc_control_mapping *[]) {
+		&uvc_ctrl_power_line_mapping_limited,
+		NULL, /* Sentinel */
+	},
+};
+
 static const struct uvc_device_info uvc_quirk_probe_minmax = {
 	.quirks = UVC_QUIRK_PROBE_MINMAX,
 };
@@ -2673,6 +2699,15 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * though they are compliant.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/* Quanta USB2.0 HD UVC Webcam */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x3090,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.36.1.476.g0c4daa206d-goog

