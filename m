Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB1F59C055
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 15:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiHVNSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 09:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbiHVNSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 09:18:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC1233E29
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:17:58 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bj12so4083636ejb.13
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=RJWgbhnetMUZfyM+6mbC5WR3l/QmeL2C9e6LCezHs8s=;
        b=nEZxKvECnqaTacdetsPvCMLjEzMvzkaws4tpiuI3hSGvDeMW/Z8BeFaxSFYuH5rzZy
         VTtnGO/hu+Kj8UxFUaKUJBj7DiQw+plUm8miZ/m1FTDt0nH3O4ejvACvedKR8khFwXvU
         Jy0i92dmLpB6vvQP6MDvasUvdn1zF+YfRSwP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=RJWgbhnetMUZfyM+6mbC5WR3l/QmeL2C9e6LCezHs8s=;
        b=zz5JhOlXSxyO7uPUeAmC6S75k80aEhzMdM1iM07BkLhYavJGor0vn4cPFukF56Xk7x
         MfRqLW9HQPJd31pHVHxsEDot5ubRU5e4jJkw4N6pheEuoDx6tcHGba4RgrMgr2qRaXck
         Hskcy1yskYp+ly1fFFVuZcWLud1z/PfY87Pj5xEVyjHiWsJQEYGqCqwNyJuCRoYdjMtD
         W6HJIIumW6wXdPx37eMSB5gYHhXfwGPPG3pKS3KsfT2cfh6bP2hDGdAem4XCx2GMwfAH
         pshskkwKrbj3KH8i2qZVQwbr4gWBuEWsSR5NsWC7AVDAxCev3Gr/MpHh6BboohDH0/xL
         G8wg==
X-Gm-Message-State: ACgBeo3sHiN2b4ve/w7HRGkaWTP4RfRNspb/a8wsAEc48KedEeXJlFVf
        NVVFE5uW0BsnPNvcK41HSU4vHX7Ytiut5g==
X-Google-Smtp-Source: AA6agR5XwKKVgTOQ165d7kv54mlk+T5p7ggV9lJhMetTNmnUiUMrmTa0+gfNTPMNwA3/LVQAyyLAww==
X-Received: by 2002:a17:907:2cd4:b0:73c:9fa8:3ddc with SMTP id hg20-20020a1709072cd400b0073c9fa83ddcmr10642455ejc.40.1661174277183;
        Mon, 22 Aug 2022 06:17:57 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:31ed:bb21:563b:e10c])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b0073c10031dc9sm4363211ejc.80.2022.08.22.06.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 06:17:56 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2] media: uvcvideo: Fix InterfaceProtocol for Quanta camera
Date:   Mon, 22 Aug 2022 15:17:54 +0200
Message-Id: <20220822131754.102393-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Quanta 0408:4034 camera implements UVC 1.5, and thus sets
bInterfaceProtocol to UVC_PC_PROTOCOL_15. Commit 95f03d973478 ("media:
uvcvideo: Limit power line control for Quanta cameras") added a quirk
for the device that incorrectly specified the UVC 1.0 protocol,
rendering the quirk inoperative. Fix it.

Fixes: 95f03d973478 ("media: uvcvideo: Limit power line control for Quanta cameras")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---

Mauro, could you queue this patch for v6.0?

Thanks!

 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9c05776f11d1..d509a4a2f08e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2740,7 +2740,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .idProduct		= 0x4034,
 	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-- 
2.37.1.595.g718a3a8f04-goog

