Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2781D4E6AB2
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 23:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355385AbiCXWbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 18:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352786AbiCXWbo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 18:31:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2192274637
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:30:12 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lr4so3546358ejb.11
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fTZhyNPuwQt0YnVzzdFN7OhDh0dFrSvziK2Pyz1Mf1E=;
        b=EtZj0Lga9iAirSG624eYAhDeP9DBKWy2DTkVMZRAuqCNrnVAHTO1QhrJUpk9OMTetl
         859pNldbFIjgnBqlCQMbm/57SwFzomj1HED6jHThQzT7YSm4kUVILaWlqZAzC7rDmSiq
         x1VTjV99nOZ3fFlbPSupodIqbKG1EAc11i20k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fTZhyNPuwQt0YnVzzdFN7OhDh0dFrSvziK2Pyz1Mf1E=;
        b=e45QTMVrXyHtBrqXLTQFjnS6x14bssMqT6Ipmi05L+eg7PjBCRYv7PE1mYDh06IPB1
         Yzr73nRTCSWIomaylNs5a9r5qmLggsE7jBoGVVJY5XxHgOfb4Mf/80RtCQtM77oq2Bb7
         h1Pb7+s8rtZDAts9epLFtxjX/IUXBGoGsBNPvUpd1DuXZUFcwq0PyrNPEXXpsEthU/2a
         5w4w1h4FMeCeg43Bm9ce0eppEOBibWfaIdCsRqUjTiYBRE6ZVgdxHsc6iN7P4blnf5p+
         T72pf7oAxDMDZZXObM6bn/SZVDnCizW6iMBPZS9vKQ3RF7iTBJyD/7RF92x3NY3JOIYy
         Xhkw==
X-Gm-Message-State: AOAM532IzH+zzdoLsQk808eMnqZbZ4r/mnpjjEGnNzRADaQgfVgQtNXE
        qz0a7Qj8n3vYmS3VOJ32n518NQ==
X-Google-Smtp-Source: ABdhPJz8gJvTgIbW0C4W6JeYPg70oc2BYPxmmi63h1NjXF4FU7Lf+N8XiEFZE2TQgkVeVkQbhbYp7g==
X-Received: by 2002:a17:907:9956:b0:6b9:a6d9:a535 with SMTP id kl22-20020a170907995600b006b9a6d9a535mr8294292ejc.64.1648161010732;
        Thu, 24 Mar 2022 15:30:10 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id yy18-20020a170906dc1200b006d6e5c75029sm1600219ejb.187.2022.03.24.15.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 15:30:10 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Colin King <colin.i.king@gmail.com>,
        tfiga@chromium.org
Subject: [PATCH v3] media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails
Date:   Thu, 24 Mar 2022 23:30:08 +0100
Message-Id: <20220324223008.382640-1-ribalda@chromium.org>
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

If the mapping fails, the name field is not freed on exit.
Take the same approach as with the menu_info and have two different
allocations with two different life cycles.

Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
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
index 711556d13d03..891c0bbc295c 100644
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
+		if (!xmap->name) {
+			ret = -EINVAL;
 			goto free_map;
 		}
+		map->name = xmap->name;
+		map->name[sizeof(xmap->name) - 1] = '\0';
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
-- 
2.35.1.1021.g381101b075-goog

