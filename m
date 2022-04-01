Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE45E4EF8E3
	for <lists+linux-media@lfdr.de>; Fri,  1 Apr 2022 19:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349953AbiDAR0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Apr 2022 13:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345195AbiDAR0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Apr 2022 13:26:31 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4749418461E
        for <linux-media@vger.kernel.org>; Fri,  1 Apr 2022 10:24:41 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id yy13so7296634ejb.2
        for <linux-media@vger.kernel.org>; Fri, 01 Apr 2022 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itX6ZZDlmuyBNG/5Go3LOxLwje8CLOx4KzAC1vNYDfw=;
        b=W37q/N/fxR2JsEfeu3tmB6iJzoDO+wWKa9x4C46Y/scFn2aC53ryid5sUIcTZr1Fzz
         gCjDtUORa3dh91SAJA23vptWLlAAWWAKDIyKm0tz4bIUlzYlcICsgs6ka7vF/AQhRCS/
         h0enJPEVy1RQWFKT81eg0X9+NSb1zAbqsDNgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itX6ZZDlmuyBNG/5Go3LOxLwje8CLOx4KzAC1vNYDfw=;
        b=NWAftU5R4gsJTBc4uODtD2AVjiNoJfu5QyJLjvx0Joye7vuDRPcOXrGX/EVZaRTmqg
         PuPiyECvpJRWhlCSb9ELk1buieEZb+zxrHza5r0RJbsSC/oQIsfsl9wOHvanBcmL6Ixk
         1Lmnh9m4xeTQZKpBhBy7Z7smdY2Kc49t13tIPTKFy9tui5HvhNkyUOBN3Hbw5z3wC292
         ZF6Vr/W87Fkd7ofqWIEoChAAkCeZQ8bbIXdHF3MzO8QT7mJQeqlfFN4k5Q4XhahH+T9L
         KFtYfBAbIBwDO1rvj4BRnRueT0dNZxn4z7aYK3V4RMekPkKN6W1gAdJu5S2H0x6B+HLY
         OV1w==
X-Gm-Message-State: AOAM532BcDYszRgWDwVU8dofOrSmxJUyb6RH/iZmndXyMCkUKRhtobtx
        CskS6D4DxGUS+SOl6h/uSX1P9/T+jvlE1Q==
X-Google-Smtp-Source: ABdhPJydnsgioh6WWKMZfbT9LvY29DDEvTfRmaO7RNuB9WPB31XNesrvBDn0vw12puQJtNqE2+8xzw==
X-Received: by 2002:a17:907:971e:b0:6da:8221:c82f with SMTP id jg30-20020a170907971e00b006da8221c82fmr709937ejc.443.1648833879897;
        Fri, 01 Apr 2022 10:24:39 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id m25-20020a170906161900b006d43be5b95fsm1230475ejd.118.2022.04.01.10.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 10:24:39 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 1/2] media: uvc: simplify uvc_enpoint_max_bpi
Date:   Fri,  1 Apr 2022 19:24:36 +0200
Message-Id: <20220401172437.625645-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The case USB_SPEED_WIRELESS and the default one were doing the same.

Also, make always use of usb_endpoint_maxp_mult, as it should have a
sane value, even for LOW speed and WIRELESS.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 1b4cc934109e..a2dcfeaaac1b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1760,21 +1760,14 @@ static unsigned int uvc_endpoint_max_bpi(struct usb_device *dev,
 					 struct usb_host_endpoint *ep)
 {
 	u16 psize;
-	u16 mult;
 
 	switch (dev->speed) {
 	case USB_SPEED_SUPER:
 	case USB_SPEED_SUPER_PLUS:
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
-	case USB_SPEED_HIGH:
-		psize = usb_endpoint_maxp(&ep->desc);
-		mult = usb_endpoint_maxp_mult(&ep->desc);
-		return psize * mult;
-	case USB_SPEED_WIRELESS:
-		psize = usb_endpoint_maxp(&ep->desc);
-		return psize;
 	default:
 		psize = usb_endpoint_maxp(&ep->desc);
+		psize *= usb_endpoint_maxp_mult(&ep->desc);
 		return psize;
 	}
 }
-- 
2.35.1.1094.g7c7d902a7c-goog

