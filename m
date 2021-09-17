Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EA8410042
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 22:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343875AbhIQUQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 16:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241879AbhIQUQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 16:16:49 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD92C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 13:15:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z94so34053674ede.8
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GmDcVXPgmbW1hz5V6+iirYSuZ4onaGTcqoNUhw3X2zE=;
        b=jPtfWVobP5xm+1Qz31db8oCkccOJhnSP/HI7t//+x/jsmUiy/qi4+5bgCiERaXZ1bt
         Xblc2KPLNSWZIfYgrSmUyfhJYuHQVD7D77yj6bHVbpS0sblJn5cCIFAVDPgYMQVfp1Mm
         FOBPtzBE0nVK547S9fZssR1KoVhsLBD+xg1y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GmDcVXPgmbW1hz5V6+iirYSuZ4onaGTcqoNUhw3X2zE=;
        b=rZ0FnO1InJxOHUwfrDAPPIEMiAShsoIaLKnCBdKUs4sOcJ5VEYEOhPlhw3EFbQyqrX
         ybDeXTKHdwZvDYRMuHbfy/Wyj8bBA/MfJ7iLXOdwtL+vDEP6zbB5/O4jI27mBnY2EEjJ
         tseFo62y6YDHD9RhKo9PgScSvi++853qucsKh/NXvRUSKzq4hPZYAXJJOG5ZWuIHlkCf
         /Xj2gu5Bti0LGnreJf+6Nxxr4FN2iQlglWx8KmkQ/KsdBZJ4Yb66nPjUL68HbwDBKcff
         hXhjFMLqxNjMpwNT+YCE/Ok9FuGzTbPx75uqNepCy5hpYjkM1hjE1k3sbcnYLmo1RVn4
         C+sA==
X-Gm-Message-State: AOAM533EQlnB5s6o+OOJTbKhGcuV5yKZ7T7fUR7qKJV9J93gMlpOZt3K
        C5MTJ4c08+5DqNSjzTsKYIsNaA==
X-Google-Smtp-Source: ABdhPJyUK2tAB59YYyo+0xUEflC6jz0k2dbYFI5yo5pUr+//KMDXfqr+MDHCqX9i20kZsGeNWVVH7A==
X-Received: by 2002:a17:907:76e7:: with SMTP id kg7mr14434143ejc.344.1631909724983;
        Fri, 17 Sep 2021 13:15:24 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id mq25sm2682647ejc.71.2021.09.17.13.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 13:15:24 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Colin King <colin.king@canonical.com>
Subject: [PATCH][next] media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails
Date:   Fri, 17 Sep 2021 22:15:21 +0200
Message-Id: <20210917201521.592586-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the mapping fails, the name field is not freed on exit.
Take the same approach as with the menu_info and have two different
allocations with two different life cycles.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To be applied after [PATCH][next] media: uvcvideo: Fix memory leak of object map on error exit path

 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c | 10 +++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 30bfe9069a1f..625d241b2c41 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2188,11 +2188,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	if (map == NULL)
 		return -ENOMEM;
 
+	/* For UVCIOC_CTRL_MAP custom controls */
+	if (mapping->name) {
+		map->name = kmemdup(mapping->name, strlen(mapping->name) + 1, GFP_KERNEL);
+		if (!map->name) {
+			kfree(map);
+			return -ENOMEM;
+		}
+	}
+
 	INIT_LIST_HEAD(&map->ev_subs);
 
 	size = sizeof(*mapping->menu_info) * mapping->menu_count;
 	map->menu_info = kmemdup(mapping->menu_info, size, GFP_KERNEL);
 	if (map->menu_info == NULL) {
+		kfree(map->name);
 		kfree(map);
 		return -ENOMEM;
 	}
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 711556d13d03..5bf33056ec1b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -48,6 +48,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 			ret = -ENOMEM;
 			goto free_map;
 		}
+		/* Make sure there is a terminating null byte */
+		map->name[sizeof(xmap->name) - 1] = '\0';
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
@@ -69,14 +71,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 		if (xmap->menu_count == 0 ||
 		    xmap->menu_count > UVC_MAX_CONTROL_MENU_ENTRIES) {
 			ret = -EINVAL;
-			goto free_map;
+			goto free_map_name;
 		}
 
 		size = xmap->menu_count * sizeof(*map->menu_info);
 		map->menu_info = memdup_user(xmap->menu_info, size);
 		if (IS_ERR(map->menu_info)) {
 			ret = PTR_ERR(map->menu_info);
-			goto free_map;
+			goto free_map_name;
 		}
 
 		map->menu_count = xmap->menu_count;
@@ -86,12 +88,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 		uvc_dbg(chain->dev, CONTROL,
 			"Unsupported V4L2 control type %u\n", xmap->v4l2_type);
 		ret = -ENOTTY;
-		goto free_map;
+		goto free_map_name;
 	}
 
 	ret = uvc_ctrl_add_mapping(chain, map);
 
 	kfree(map->menu_info);
+free_map_name:
+	kfree(map->name);
 free_map:
 	kfree(map);
 
-- 
2.33.0.464.g1972c5931b-goog

