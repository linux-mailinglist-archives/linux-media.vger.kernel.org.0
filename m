Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D5D54F59C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381920AbiFQKhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381858AbiFQKhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:37:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D3C6B00A
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:37:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id kq6so7933013ejb.11
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7CbeHNxpi9+s0qv2gIQi33L5PMDbofgWDLYkT2RlfqU=;
        b=H47yQCGCYQVV1o+mKCF4P4ZJ82sQp7QqRAXTucT/Cgnl/74uZxFHs1vnX1pjZQjjBe
         SFJJyJhRmmdwwkMuVcpw2DI1ym6bIg3kBry27+owFAYz5OOOMcSsd9Y6IFpleOseSLyW
         /uR5aY8aivbhLPENJl/3EVol5NHkBRxUtRgPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CbeHNxpi9+s0qv2gIQi33L5PMDbofgWDLYkT2RlfqU=;
        b=bxKonkvRQdhu5ly4n5n4bfJWYpsdD9+9bzHyf6vWWTPM9KllL2OJ+T96kwM3IuKKEK
         NvGh99JyTcIfcCW98pHpgP4AXaVnyQlA/IbyE/UhDnEveGifd0cPqDxfI+ngEsEStTib
         RyRXc885FH+j72l5mGNDb0tdEmpQw8VpbrJOH+CxoQB1FIiq2f1RWlZlcD/3jMLRDfr2
         UJdpS9/RyXZIrcNVihtuIytdO8OW4M/y7QfMmB4Ay73aDpvhhl9DwFlorkNyCQWMny4t
         6veW2iZFLGQwljsk8hFfGp1w3n52vdhhfCjOyywHbEdt1vS7GpIbKsUtvNcLdAa5U+S/
         xxng==
X-Gm-Message-State: AJIora8jdf//Jxq9EQDlAUEAsxzI8fMhEQJKwdrphHnO4EQhSotyzJP5
        tQjHgOF2R7Qlt19z6XRXIDeW4A==
X-Google-Smtp-Source: AGRyM1vlbTH8+RBIK41fs93b7FZ1GsvD9UQCsPhpxe0YKUM6xZJ59ddoAWvGmBxVLczfKisqHPP1QA==
X-Received: by 2002:a17:906:209:b0:712:12d8:b52b with SMTP id 9-20020a170906020900b0071212d8b52bmr8586607ejd.394.1655462219092;
        Fri, 17 Jun 2022 03:36:59 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:a86e:90:fb4:466e])
        by smtp.gmail.com with ESMTPSA id z19-20020a056402275300b004319b12371asm3704340edd.47.2022.06.17.03.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:58 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 8/8] media: uvcvideo: Limit power line control for Acer EasyCamera
Date:   Fri, 17 Jun 2022 12:36:45 +0200
Message-Id: <20220617103645.71560-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617103645.71560-1-ribalda@chromium.org>
References: <20220617103645.71560-1-ribalda@chromium.org>
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
index a862a9d6a2fd..6d34992032e6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3248,6 +3248,15 @@ static const struct usb_device_id uvc_ids[] = {
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
2.36.1.476.g0c4daa206d-goog

