Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA57A54F58D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381900AbiFQKhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381838AbiFQKg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3409B6B007
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:57 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id h23so7934106ejj.12
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wxtahHXOWJVeicX7Htkco0Z9aLUkbZ4bBYqOrbr4kgY=;
        b=FFracXLTR8Dxr/cfAOL0R12ff89M0Oo1wU7lh9TTQjLXx+d8O7Uc3CIIDP/Z0OqkOm
         mNl/J91Gf56tH3i9Ovgl+KF2WgNRBSdT4538Gb/eOfvnLbtbpugN6KGdoB7XFe1A+yEf
         SGvFE/35Q0f7ETbBvg+s4956/tzNrvLum2QGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wxtahHXOWJVeicX7Htkco0Z9aLUkbZ4bBYqOrbr4kgY=;
        b=Ig8e0w5iQzLwxhqPctIHAvnfWKx8vVhA20L84kcdiza3W2J9XoQ3kLkiVxD+sPNa81
         J7QrRaYTiYZreq1r8IFIBoabVwJBbN687MOdKfdxEyX5MuNn0WYJ9OBtZo/GBNUex6gt
         yJPgGmGhMPnK7bWPhNAEBePMkE4dIiq4wdsfvXUIjEYRg6NrHZCFwo7WMFXUcM9ZrLJx
         c/xjWZ/zNo3xkvE2jkxSVa7A/RLFFBWm0OrFOEpql/tdN+K6LCjd/lHgACqwFopi0caN
         LRtjOEugVxIUxxJYRSWk+KJ8B/PPV4NYXnj75i3wR5ZmA2VSh3xWSfw3E8OEGlqQNkfB
         QUkA==
X-Gm-Message-State: AJIora//oMGSRSNVvTjtiXN6CLiu0oNdxv0mc7oc/Edu/EoRsHJo6ZqB
        cGxeM5blJM6UEGqIi3zypjoJug==
X-Google-Smtp-Source: AGRyM1sFv7RzJJuG0WA5n3pug/S1D4WQ6LHSw583UOuI4gplbwiNAyj9ocrJSqdqBNAORag7N1zS7w==
X-Received: by 2002:a17:907:1c01:b0:6f4:2692:e23 with SMTP id nc1-20020a1709071c0100b006f426920e23mr8278359ejc.243.1655462215652;
        Fri, 17 Jun 2022 03:36:55 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:a86e:90:fb4:466e])
        by smtp.gmail.com with ESMTPSA id z19-20020a056402275300b004319b12371asm3704340edd.47.2022.06.17.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:55 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 5/8] media: uvcvideo: Limit power line control for Chicony Easycamera
Date:   Fri, 17 Jun 2022 12:36:42 +0200
Message-Id: <20220617103645.71560-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617103645.71560-1-ribalda@chromium.org>
References: <20220617103645.71560-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two different Easycamera devices do not implement the power line control
correctly. Add a corresponding control mapping override.

Bus 001 Device 003: ID 04f2:b6ba Chicony Electronics Co., Ltd EasyCamera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04f2 Chicony Electronics Co., Ltd
  idProduct          0xb6ba
  bcdDevice           10.70
  iManufacturer           3 Chicony Electronics Co.,Ltd.
  iProduct                1 EasyCamera
  iSerial                 2 0001
  bNumConfigurations      1

Bus 001 Device 003: ID 04f2:b746 Chicony Electronics Co., Ltd EasyCamera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04f2 Chicony Electronics Co., Ltd
  idProduct          0xb746
  bcdDevice           97.57
  iManufacturer           3 Chicony Electronics Co.,Ltd.
  iProduct                1 EasyCamera
  iSerial                 2 0001
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 4fb07084f1c0..5b8a71a9edfb 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2819,6 +2819,24 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
+	/* Chicony EasyCamera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb6ba,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Chicony EasyCamera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb746,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Alcor Micro AU3820 (Future Boy PC USB Webcam) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.36.1.476.g0c4daa206d-goog

