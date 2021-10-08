Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A20426A73
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 14:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240936AbhJHMLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 08:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240937AbhJHML3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 08:11:29 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D673C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 05:09:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y12so22310807eda.4
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2+ug1wODZNuHWc9/JaE1sQQpPtS5LHWq2xvyfe2/83Q=;
        b=Q6uYWyUKG4+ZNiieycrQLEi6SFoLMjd6hhfOyJONJGypRB/aAOHsaTh9aUYZI6FhQ8
         3HfETnJGKuDk2+m/6IpDboeJcexym6LyqeQcRTCWkABGh8RbiSZBtVSCTkA0s9V7mZ0Z
         X0o+ldvXPZyoKQ0U9gPH+AFwN0fhczBe5dWkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2+ug1wODZNuHWc9/JaE1sQQpPtS5LHWq2xvyfe2/83Q=;
        b=7ESBy71EdvaHEzOeDDqCk5UVG9ULfuDqCddK+8g9tRk/+6vGm/nkigDEPwCtpPzQuM
         Isvcv3ZbSDyMIXetkBUG2Q+rZArYjgyn499sSNy2Vl/nPhPC9gmD3ngJIOhm+O9bp1wO
         k4Deb7q2Sq9a0l+rkaZpmUZciXVzFNpZOGTL22+Z0K95a617J+WS5FMykmiOZ0v41YSb
         bMQS9YFfcY7Rr6LQrZAHt4zWgIWp+5kpQ0wgwL3SOZMwxqqGnmQYCYIz9SiTlrmWDBSd
         liEBXHwD9cCa9Ci1OZKA99NgHjQgdzsI1VJpwcPf1l69+xTpRPmr9Gxmu2tcyxGhheBE
         iBsA==
X-Gm-Message-State: AOAM532Pug0HEFwVLVsG/uJ+gN86J79TPWBCN2g+ldXS9a5GEnm5x6ez
        46urBhkdQMIC6zl8L/CnbqIxsQ==
X-Google-Smtp-Source: ABdhPJz+heN95IkHWqhQW9EoOcnha8ImLccymxQGSX27/y7gBbfZ4htlNrECtHGpDlBGtUw1JvBBcw==
X-Received: by 2002:a17:906:c005:: with SMTP id e5mr3721285ejz.480.1633694972223;
        Fri, 08 Oct 2021 05:09:32 -0700 (PDT)
Received: from alco.corp.google.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id d17sm944163edv.58.2021.10.08.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 05:09:32 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Colin King <colin.king@canonical.com>
Subject: [PATCH v2] media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails
Date:   Fri,  8 Oct 2021 14:09:14 +0200
Message-Id: <20211008120914.69175-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the mapping fails, the name field is not freed on exit.
Take the same approach as with the menu_info and have two different
allocations with two different life cycles.

Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To be applied after [PATCH][next] media: uvcvideo: Fix memory leak of object map on error exit path

Changelog v2: use kstrdup functions

 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 30bfe9069a1f..6bd7c30dfb75 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2188,11 +2188,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	if (map == NULL)
 		return -ENOMEM;
 
+	/* For UVCIOC_CTRL_MAP custom controls */
+	if (mapping->name) {
+		map->name = kstrdup(mapping->name, GFP_KERNEL);
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
index 711556d13d03..43bd8809241c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -42,8 +42,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	map->id = xmap->id;
 	/* Non standard control id. */
 	if (v4l2_ctrl_get_name(map->id) == NULL) {
-		map->name = kmemdup(xmap->name, sizeof(xmap->name),
-				    GFP_KERNEL);
+		map->name = kstrndup(xmap->name, sizeof(xmap->name),
+				     GFP_KERNEL);
 		if (!map->name) {
 			ret = -ENOMEM;
 			goto free_map;
@@ -69,14 +69,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
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
@@ -86,12 +86,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
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
2.33.0.882.g93a45727a2-goog

