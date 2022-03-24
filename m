Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0B24E6AD7
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 23:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355483AbiCXWoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 18:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239751AbiCXWoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 18:44:08 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68C1BA321
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:42:35 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r13so12020374ejd.5
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BzcLRtokEP+E4dxnS/DJGaFkaMqTZO1rfn8KC1mIYdg=;
        b=YdX1oBMj+RiNlKH0EZoh3rP143ggJZW74CUDoLnDyuMS8S5X5mxWzM9kXdqA3yBPiq
         Zwr92254QPvIStGu54mZSIg9PN8NkRFTrYUD8saaJTboXAbX2mm9ZPGY710T0G87GLfM
         vtimHhNr7LsAOR196Vn/0TbomLUmZb7Ye0+YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BzcLRtokEP+E4dxnS/DJGaFkaMqTZO1rfn8KC1mIYdg=;
        b=3xWFbj3qj32r/aFcJI+rzbGB9yGqeeVHK5jsBnfFQFu+9BT+1hWKkhcehAU2VDSYLt
         36bmfu8rvhzpILjEHv9WgQaSXixfDFSk0F+MuN3N7DeGdQCQzvYpSQYSl0ylTcFAvfmi
         OwKE6yVqi+E9aGS3VRWfZIufK12NgiLQiOXXptD9sbhJKnAAy32ZJInCXWET3u6E6xXN
         7KysfMmTOA8RShhKycfy9+8Vx7+bw9fryEZHL+L3y3ia+dhyXEWYZUH5OJKtb1XbDRtO
         Szxy5SK68r+0itW6K6McIGxq7XE9JT0ROQQbhKXRagabPU3n4NoZsHPJEJpBMPBqUpe4
         LmKQ==
X-Gm-Message-State: AOAM532+2F2irQEK7EVwllE9iYSARSHtJb4gnQvlQrI/JtwvL/JdbSjV
        rQJibPQRkUcTrW6Z2aLAwc8KmQ==
X-Google-Smtp-Source: ABdhPJzDluZSYOUdkWud75QTPRHaYHo3Xs2ZUESZqLtZYKKNPAyyW4I9hhBMED8+//xTZmRt8IB4Mg==
X-Received: by 2002:a17:907:eab:b0:6dd:e8fe:3dc with SMTP id ho43-20020a1709070eab00b006dde8fe03dcmr8065247ejc.165.1648161754501;
        Thu, 24 Mar 2022 15:42:34 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id v5-20020a50c405000000b004161123bf7asm1953904edf.67.2022.03.24.15.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 15:42:34 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Colin King <colin.i.king@gmail.com>,
        tfiga@chromium.org
Subject: [PATCH v4] media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails
Date:   Thu, 24 Mar 2022 23:42:32 +0100
Message-Id: <20220324224232.385888-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
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

Move all the life cycle of the name to add_mapping. This simplifies
the error handling inside uvc_ioctl_ctrl_map and solves a memory leak
when kemmdup fails.

Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Laurent:
Please note that I have added xmap->name[0] == '\0' check!

Thanks

 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b4f6edf968bc..8b3bd516cb2f 100644
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
index 711556d13d03..ac829fb44b77 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -42,12 +42,12 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	map->id = xmap->id;
 	/* Non standard control id. */
 	if (v4l2_ctrl_get_name(map->id) == NULL) {
-		map->name = kmemdup(xmap->name, sizeof(xmap->name),
-				    GFP_KERNEL);
-		if (!map->name) {
-			ret = -ENOMEM;
+		if (xmap->name[0] == '\0') {
+			ret = -EINVAL;
 			goto free_map;
 		}
+		xmap->name[sizeof(xmap->name) - 1] = '\0';
+		map->name = xmap->name;
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
-- 
2.35.1.1021.g381101b075-goog

