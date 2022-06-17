Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926BB54F58C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381868AbiFQKhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381835AbiFQKg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277756B006
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id fd6so2876323edb.5
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eknO20DpjREAR8olUhraC51K66eHn6x17UHnd3DEaa8=;
        b=MS26u7DaOv6ziiY21jTHfyU7S//cZGKwdDT2kK3k0ryFpdvKTeXmsFywZ9AC/6ZR4Z
         At5YLy1D9Jk/f2lWDcg41xfF9DZcXJdOoToGabSeKiVDVh6Csf8yL2sr9/2IedqfDbv+
         YMa3RDuJq9FnmBn+7hNFSA5wiCX6NLoyO28JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eknO20DpjREAR8olUhraC51K66eHn6x17UHnd3DEaa8=;
        b=YIh/y4GQVwQBhx5Sid7su00sZQstfzFlXfy/J6LrVWndc+1gvxy0nxuZY33/FNq5zq
         pSwnLIO3qnGKEteWxuidZ+jH1StSZFBrwcMgHRXSDIUMkd/6L1mSIXVhByrse68dx3gV
         /Ynwx+mnN9hZcgaN9kzTjD6n3EJQB5Dkg10At4zglcprKefn6nJgbZxLhtfQdVJwRf/c
         4aENJjc628/H7YbRg1KFRNAGX2kN3GzmiVADOZBpEYd1wTYEdLigHxi2dOCgYoFquvbP
         jovxtSvBx+cnsIFtvs7At74mD6U89iYjEGX/72lq0iw8AlxxPk7Jd86AM23HAYuxkKRD
         NNKQ==
X-Gm-Message-State: AJIora8jeMSX7eUIaTJYTnboYCApXzCNni8pNsJL9UyhgXWBfgprJmHM
        UepiCGHEOHWz7iDkleAOkYhud99vDMr8qQ==
X-Google-Smtp-Source: AGRyM1vjznye7jzu+nREIN9xuOIXLG5ykSqNy9VvlMGmXvqlr0uYc9Mrh7xJJaQnn5TKo5LopbhWqQ==
X-Received: by 2002:a05:6402:2788:b0:431:3f86:1d4e with SMTP id b8-20020a056402278800b004313f861d4emr11857977ede.238.1655462216795;
        Fri, 17 Jun 2022 03:36:56 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:a86e:90:fb4:466e])
        by smtp.gmail.com with ESMTPSA id z19-20020a056402275300b004319b12371asm3704340edd.47.2022.06.17.03.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:56 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 6/8] media: uvcvideo: Limit power line control for Chicony Easycamera
Date:   Fri, 17 Jun 2022 12:36:43 +0200
Message-Id: <20220617103645.71560-7-ribalda@chromium.org>
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

Another Chicony camera device does not implement the power line control
correctly. Add a corresponding control mapping override.

Bus 001 Device 003: ID 04f2:b5eb Chicony Electronics Co., Ltd EasyCamera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04f2 Chicony Electronics Co., Ltd
  idProduct          0xb5eb
  bcdDevice           90.45
  iManufacturer           3 Chicony Electronics Co.,Ltd.
  iProduct                1 EasyCamera
  iSerial                 2 0001
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 5b8a71a9edfb..d21de83021f5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2820,6 +2820,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
 	/* Chicony EasyCamera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb5eb,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Chicony EasyCamera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x04f2,
-- 
2.36.1.476.g0c4daa206d-goog

