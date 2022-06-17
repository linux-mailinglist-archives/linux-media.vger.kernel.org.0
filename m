Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD38854F595
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381882AbiFQKhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381809AbiFQKgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:55 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069436AA7A
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:55 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id n28so5614726edb.9
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65B9sTKOJd5NYeiNXyt5FiTaUyBXOPlC3GIDXkbAO3M=;
        b=fmq7sbasYov/khRRHc9VuMpS1i15wkx9IYWtts2i8BguvjXyLTmlkIQuZWpQ8H2tgw
         NnuT0c8443oQacJxe4riDZzCaXiUkS+A1C9jTCpr+DRszH3Sd7toyNXDV3V3aWypN9xA
         2doBgTWKo/ozIxnvoDzFXgn9N+Vx1SEVD/s2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65B9sTKOJd5NYeiNXyt5FiTaUyBXOPlC3GIDXkbAO3M=;
        b=qahcTkUjiJSV4I7NeaonkqlLb/VtQSDqeYW64U9nyP540dmfEYimTAbgxMqcp5zp9M
         mUqvrWnVTDckW3oTpzmTeK1c0JlD0nmPvgCFeXLyjdoJbjeuMBKmuQVKrBoNxrY0pp+o
         G3mg3cDHjSeEF+4APl2CA86Aoylo5lDQhRvk5lYKeNsvSXe34uiuTCT0j0NkGHXJgAgF
         I95GHQRqRx2BriqA8ccXqQfVA0IO3/to+bee6GElOuoHfY1MMfJpylbrqVIOwfBnAFBe
         y3roYnvXw48RmmuivSGlhmTN1coJ7vdiHr++3tmh2Q2fXUI42OE0rf6yPflVk5Y6EWiS
         k1Rg==
X-Gm-Message-State: AJIora9il71vpCvW8TJpgxUZut71OIL1ho5bgGr85crMv8h98JK5k9kV
        pR0PzyUp3qAipbklubj860JtHA==
X-Google-Smtp-Source: AGRyM1uOPsP9kgPsiUEInAik1CZxZq6swmyonmOeO74gPPg1VzmSIRPmVepJsVn+hbwoLlLBjY2Pew==
X-Received: by 2002:a05:6402:34c2:b0:42f:79c0:334b with SMTP id w2-20020a05640234c200b0042f79c0334bmr11600803edc.88.1655462213656;
        Fri, 17 Jun 2022 03:36:53 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:a86e:90:fb4:466e])
        by smtp.gmail.com with ESMTPSA id z19-20020a056402275300b004319b12371asm3704340edd.47.2022.06.17.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:53 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 3/8] media: uvcvideo: Support minimum for V4L2_CTRL_TYPE_MENU
Date:   Fri, 17 Jun 2022 12:36:40 +0200
Message-Id: <20220617103645.71560-4-ribalda@chromium.org>
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

Currently all mappings of type V4L2_CTRL_TYPE_MENU, have a minimum of 0,
but there are some controls (limited powerline), that start with a value
different than 0.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 5 +++--
 drivers/media/usb/uvc/uvcvideo.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 092decfdaa62..3b20b23abd1e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1144,7 +1144,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_MENU:
-		v4l2_ctrl->minimum = 0;
+		v4l2_ctrl->minimum = mapping->menu_min;
 		v4l2_ctrl->maximum = mapping->menu_count - 1;
 		v4l2_ctrl->step = 1;
 
@@ -1264,7 +1264,8 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
 		goto done;
 	}
 
-	if (query_menu->index >= mapping->menu_count) {
+	if (query_menu->index < mapping->menu_min ||
+	    query_menu->index >= mapping->menu_count) {
 		ret = -EINVAL;
 		goto done;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index fff5c5c99a3d..6ceb7f7b964d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -254,6 +254,7 @@ struct uvc_control_mapping {
 	u32 data_type;
 
 	const struct uvc_menu_info *menu_info;
+	u32 menu_min;
 	u32 menu_count;
 
 	u32 master_id;
-- 
2.36.1.476.g0c4daa206d-goog

