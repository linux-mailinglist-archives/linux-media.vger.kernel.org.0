Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3651154CC48
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbiFOPNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242506AbiFOPNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:13:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE177101FB
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:05 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g7so16636067eda.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ba/er2SVgt15hBIKXCuOmTfszYwx0bh+mH6faV5HgMs=;
        b=JQp8uyCTM//DUgQt4nw52g0tqFaEinTgubLJ4S2k9TJ38p0QFNd9Dn5y64TjVrLpCv
         RzxXG/VvC8CrHUAb93Y4UyrlzUw/Qqcs3F0IhGL016/+9hGwHlXSI4NSn/0G9UqpLxRh
         NzwN218m+NNMxYKRdJV+PRCksrpXoV7O5m60g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ba/er2SVgt15hBIKXCuOmTfszYwx0bh+mH6faV5HgMs=;
        b=7RePQD9Pf8FOWM0olUlZkHQlrEqsFkX14WeZSeOsXmw3dPGls5l37Y/n/pibjo2xaO
         oSQhjGcZaevdKk6ESUq4yJ+3OFHjnGTskIMA7/EWG8RWpBp83WVHufptCuaz/D0ysohB
         leFeuhgxj53azww85QY9+So8iwfo3FaNwrJmWM5zXh/5MPXKczLRBIuQUQEBi2LKkSl9
         wRg7wZRb2XqMrIHJunGYxN0aokZBu71oSw/ATGX/Y0xePHz+zTOVwWzZMHm73x1lPmvF
         XcPejSRAej6E0YX1kx4XqQZGMiib8as74ErITHwNnlX6xeM7dl+ZNmkQJbzUf9be9t0c
         djUw==
X-Gm-Message-State: AJIora+13GigwbV/fY15p/KSAzhHe9Rc/Lqw+VRkRuA9ehCOz/sCGmKQ
        QOTaK/PukqIe1yCSfIe1725RE0cU4ONKxELH
X-Google-Smtp-Source: AGRyM1trWxCTpFGEvEnB4NgcT2N6vlpdgmjrpw2eSZpS0nT7jA4jRANaywPGo1Z/Uqct75ri8U8K1A==
X-Received: by 2002:a05:6402:2752:b0:433:3a08:27b1 with SMTP id z18-20020a056402275200b004333a0827b1mr220066edd.235.1655305984296;
        Wed, 15 Jun 2022 08:13:04 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b25-20020aa7cd19000000b0042bd2012196sm9610264edw.85.2022.06.15.08.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:13:03 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 3/8] media: uvcvideo: Support minimum for V4L2_CTRL_TYPE_MENU
Date:   Wed, 15 Jun 2022 17:12:54 +0200
Message-Id: <20220615151259.77825-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615151259.77825-1-ribalda@chromium.org>
References: <20220615151259.77825-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 092decfdaa62..0d89d239e881 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1144,7 +1144,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_MENU:
-		v4l2_ctrl->minimum = 0;
+		v4l2_ctrl->minimum = mapping->menu_min;
 		v4l2_ctrl->maximum = mapping->menu_count - 1;
 		v4l2_ctrl->step = 1;
 
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

