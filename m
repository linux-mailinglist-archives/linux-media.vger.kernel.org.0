Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4A3550107
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 01:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbiFQX4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 19:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383440AbiFQX4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 19:56:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C88866AF0
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:56:22 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id h23so11327630ejj.12
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=smgH2pDBx1ofaZrM152FsxaiSpM+uoxslxM+FEyW34c=;
        b=BeEQ4TJ+StpwEeRKtNhqEWyR6951KbaWIfursLBbX0/XJas5D2wzyKEk+BS1ToHLhM
         1yea3fbBN1B05sTYEYC0j/VfjOmSdYMqyx6WBpE3PX4Z0Biddp9iTb4t/I3JF47MWy4u
         x8QhELQHJrISgpvWPiEKiKy7EQUp1igOTHMzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=smgH2pDBx1ofaZrM152FsxaiSpM+uoxslxM+FEyW34c=;
        b=scevGXBi/3+lV6enVu9p7K/Qq56OPHAUEbt9HfriC4Sm/eDl8sVKjcnYjSRberWw4x
         JpJlq6lmmTLpCRZyMsLeKtq+qegZtEUKqOd29L5VwMahECQcSInY24wiHePgKNJ0ap6p
         P3ocrDko85YwTbweb/0dS6MMi99lmaHavRgEpbromoDMWSccYUXoYFPCUVyNMhjqyGqr
         z+S36wJuo2YWJVywWVibVbUeGAghs7FtX1DCQS8yRlNoHdphpuyTEpNalJigthLJkq0+
         DcK69WgBE9kzFZIsAk2LgK/OgjDnW8KLZD7UYFJ5mzgPXIk899BkzJNUmQTTuohjxEOD
         Ws8Q==
X-Gm-Message-State: AJIora/NTdHMN0+xuN/vnGhhQww/962e8dRghCz5HH3H1B8f9slU31Pp
        JEZLhYYxJam2tIiPrsq8Y/fauA==
X-Google-Smtp-Source: AGRyM1usF0zfm/ieUT9r1lbPRPzma4aEocNyIUPWHG/uKyyHfOm2qkqIawRoshKy0ZEENfPGxPRgyw==
X-Received: by 2002:a17:907:1dd1:b0:715:73d2:df1f with SMTP id og17-20020a1709071dd100b0071573d2df1fmr11536181ejc.46.1655510180195;
        Fri, 17 Jun 2022 16:56:20 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id z21-20020aa7d415000000b0043566884333sm1452538edq.63.2022.06.17.16.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:56:19 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 9/9] media: uvcvideo: Limit power line control for Acer EasyCamera
Date:   Sat, 18 Jun 2022 01:56:10 +0200
Message-Id: <20220617235610.321917-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220617235610.321917-1-ribalda@chromium.org>
References: <20220617235610.321917-1-ribalda@chromium.org>
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

The device does not implement the power line control correctly. Add a
corresponding control mapping override.

Bus 001 Device 003: ID 5986:1172 Acer, Inc EasyCamera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x5986 Acer, Inc
  idProduct          0x1172
  bcdDevice           56.04
  iManufacturer           3 Bison
  iProduct                1 EasyCamera
  iSerial                 2
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 387b85fa1998..e037d46b958e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3240,6 +3240,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
+	/* Acer EasyCamera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x5986,
+	  .idProduct		= 0x1172,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Intel RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.37.0.rc0.104.g0611611a94-goog

