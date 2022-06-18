Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2815055010A
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 01:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383584AbiFQX4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 19:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383083AbiFQX4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 19:56:30 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742CD663C0
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:56:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id me5so11382648ejb.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Re2uASyH1bxPGXC+tDXunHL1crXE28nbgdRRf+VAYZE=;
        b=dv/67EKp8F/1FkEq91cv5Q4jIKiMwID0vD2/5uqR9o4uUiOxZgHzT6LstOsaskky/J
         WGDN7EMDoaomFN0fBEMNM0Y7iwFhZ2O3saSdjwjQDm4GMNVpZXaUouVWWTj/A/WmUiOV
         +3Xac8jnuhxdMsIU/sQna8MF3t6CiPRYN1tOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Re2uASyH1bxPGXC+tDXunHL1crXE28nbgdRRf+VAYZE=;
        b=Fo6oq2qr26v6Vl7a+fmIrrCVwern0QbjwUQ+X+Cazmwum2wz+3/30EXHECYPB8b6Hj
         +vziHfAJM1XIAIF1manFflYWpDztbFm4tih0wqN5JE7UGqPOiTmt2KtRkdLo4WcSHTZ9
         jcCi9KA0RKPR70k2WU0I6fIfG1xKSEAmDk7ecRI7NK2aKOCsyO0Qsb7dF+/0bh0KzJ6P
         fOclDdI94D91iFT0Z40QA1YLlHllUuTjMBQEwyEjzZkWg/vUsecvXat2+Vo0PikRWA1s
         f/HoDUSWfo/VSZph3PY4DjCdv4kiIP3qaFc2NOspYcT4WkWU0UyEXs9srO2JekNkJsXS
         8y6A==
X-Gm-Message-State: AJIora+gKaGXZFKX/xJN83QaszGFWZ4iHKtq+ejQpGrSK22f559JFOgQ
        hHTXE0LTivV/NbBDTHvrHEB9pw==
X-Google-Smtp-Source: AGRyM1v8NNGOwt6zPLVre6A6tr6YO5BFOQ8XbrWj1JrPm0JWr/omugcPjs24nr/YT0hTh4LUZ699sA==
X-Received: by 2002:a17:906:7c0c:b0:6f9:1fc:ebf3 with SMTP id t12-20020a1709067c0c00b006f901fcebf3mr11637584ejo.403.1655510179108;
        Fri, 17 Jun 2022 16:56:19 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id z21-20020aa7d415000000b0043566884333sm1452538edq.63.2022.06.17.16.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:56:18 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 8/9] media: uvcvideo: Limit power line control for Quanta cameras
Date:   Sat, 18 Jun 2022 01:56:09 +0200
Message-Id: <20220617235610.321917-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220617235610.321917-1-ribalda@chromium.org>
References: <20220617235610.321917-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two more cameras do not implement the power line control correctly. Add
a corresponding control mapping override.

Bus 001 Device 003: ID 0408:4034 Quanta Computer, Inc. ACER HD User Facing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0408 Quanta Computer, Inc.
  idProduct          0x4034
  bcdDevice            0.01
  iManufacturer           1 Quanta
  iProduct                2 ACER HD User Facing
  iSerial                 3 01.00.00
  bNumConfigurations      1

Bus 001 Device 003: ID 0408:4030 Quanta Computer, Inc. HD User Facing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0408 Quanta Computer, Inc.
  idProduct          0x4030
  bcdDevice            0.02
  iManufacturer           1 Quanta
  iProduct                2 HD User Facing
  iSerial                 3 01.00.00
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 425520f06ce4..387b85fa1998 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2700,6 +2700,24 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Quanta USB2.0 HD UVC Webcam */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4030,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 1,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Quanta USB2.0 HD UVC Webcam */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4034,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.37.0.rc0.104.g0611611a94-goog

