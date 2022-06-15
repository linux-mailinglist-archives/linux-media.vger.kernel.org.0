Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9332E54CC52
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344902AbiFOPNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239055AbiFOPNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:13:09 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DDF13D30
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:08 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id n28so16630945edb.9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7CbeHNxpi9+s0qv2gIQi33L5PMDbofgWDLYkT2RlfqU=;
        b=Auij9wGydoXVcXtnVt7f5SscEe86yhsuqwH1KBIeBgvJIamUxyE+Vb4zImjfbs/8Gg
         vUnQ2F90PpL4Fg5ZySoT9EghYv3hokn3+el6rjZ0/FMwTRdgNl7aD54X5zsd/qxIhrff
         5qFW6e0Ief8Zv+CCF4k39oNBYsX3RwDmztce8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CbeHNxpi9+s0qv2gIQi33L5PMDbofgWDLYkT2RlfqU=;
        b=R6FJwIL5u1d5mL5fO8iU0Z/20mSHm4jMtJ1laU7etefVOnsGWdWkR455wJtgO+RPDn
         B82DFSDNhNqF9yriEBdNZJxiRJku48tytCuhBwC4ApCT9vSFHr0B0TUq5QIfyYZqgcpo
         hDdRmBOfqTiTjYZdoALehmYPrN2E5eIo/7g/PCfVuPs8+vvYNs4As+rqaN+coh1hK098
         cB3TJ5/0Q0Yn3n7qRaudP6V6LU1wNYmTGiCkqqcX9lVr7VSpqbTkwga53p/QIdYXSOTq
         AYr9ZGQH9mSbDisZvcE2CcnYRsb/n4Q4A7/4UGZ0exq1N9/PsGxuTzsJcxSwDJj+ZU80
         n5hw==
X-Gm-Message-State: AJIora9rWUbx7fQAOzNJia5WHEG5uj4EJAfsmhRXFV0Ty6Fs5En2znFE
        +XFC/y5P2gjMdartgl5Tlu1qHw==
X-Google-Smtp-Source: AGRyM1uCatZFuN2m8N1LXga0uQ6Mh4GENNAyAybfRA+eNgeNGD+PO4HiS0jfW/G6qoArI/+erOyYPA==
X-Received: by 2002:a05:6402:3322:b0:42d:f984:92fa with SMTP id e34-20020a056402332200b0042df98492famr291175eda.106.1655305987825;
        Wed, 15 Jun 2022 08:13:07 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b25-20020aa7cd19000000b0042bd2012196sm9610264edw.85.2022.06.15.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:13:07 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 8/8] media: uvcvideo: Limit power line control for Acer EasyCamera
Date:   Wed, 15 Jun 2022 17:12:59 +0200
Message-Id: <20220615151259.77825-9-ribalda@chromium.org>
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

