Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF2E4E8E79
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 08:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbiC1G4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 02:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbiC1G4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 02:56:11 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEBD4F9EB
        for <linux-media@vger.kernel.org>; Sun, 27 Mar 2022 23:54:30 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a8so26537232ejc.8
        for <linux-media@vger.kernel.org>; Sun, 27 Mar 2022 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xfewahMQduua60SQdP4EeukDlDGZcPBvnxc8cD79M8o=;
        b=gi+GB4JD6z9kBtNHKHdUh8A/OMFAhKgLNQXRrgV+AXonQbj4+i6wbyw3etsVbRXnlg
         oX4hQJ+Y2pUbVzp8FFbejRp58s/dF5iB7lKXVo8v1GQ/nT10DnTnUbl1V3RGMQh3idhN
         KfWlKtFJGPipz0HJqHP5Eu0nfZ26cnyzwlejI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xfewahMQduua60SQdP4EeukDlDGZcPBvnxc8cD79M8o=;
        b=LB0k+Hg61yQw+I9R3nl493VV78tjE6GuPSMywhUX7XXyYkt23JfAGhaAUOKviNuT0q
         W8A/V7TNdPr5xd9yuadrwLaosdGnYT/E3pRD8ILkJTfGTZc0pgbmKlibrRWrykZU2KYc
         1JQtb3jHKi6oeNyveQoS1JSwaf7N8L96JfhX9OPs0/j0Jm5e5nM98I3t8+t507TFsdru
         dcmWC8jPPo3KKQSjCwLgbQEf87MI+0zJC65bpjEG7MTSTKIL3jzvEB/HiJi8wygWs/tA
         jDqGjzGWsETJReY7S+O+OWj/I0w6WL908FpZO2bJaGwrH2i58525KoLM8O4jo7l8tuZi
         firA==
X-Gm-Message-State: AOAM532Az/6Pp0lEom9nwAr8fv6A7PqxtFNmBmQ8+DMleaId293DULqE
        UD0cuUZJHMDxYJDz75/runkSQQ==
X-Google-Smtp-Source: ABdhPJzpDmF0dYWcyS4aSDkE54KYfrF8P6Gi4th1AV1BXClyQqdvv/brEwzhqWNq7yOCjAJVwr7rcQ==
X-Received: by 2002:a17:907:1c16:b0:6d7:622b:efea with SMTP id nc22-20020a1709071c1600b006d7622befeamr25705224ejc.110.1648450469435;
        Sun, 27 Mar 2022 23:54:29 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:eb2c:98f7:c302:40a1])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm5596515ejj.142.2022.03.27.23.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 23:54:28 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Colin King <colin.i.king@gmail.com>,
        tfiga@chromium.org
Subject: [PATCH v5] media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails
Date:   Mon, 28 Mar 2022 08:54:23 +0200
Message-Id: <20220328065423.502709-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
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

Move all the life cycle of the name to add_mapping. This simplifies
the error handling inside uvc_ioctl_ctrl_map and solves a memory leak
when kemmdup fails.

Also make sure that for custom controls, the user provides a valid name.

Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b4f6edf968bc..0e78233fc8a0 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2188,11 +2188,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	if (map == NULL)
 		return -ENOMEM;
 
+	/* For UVCIOC_CTRL_MAP custom control */
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

