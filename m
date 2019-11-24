Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4A510849D
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfKXTH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:26 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40991 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfKXTHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id p26so6137768pfq.8
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M6vbKNlAe4oVXAzBpbMwq3/kIC7rorbSwG5kJs/7+zs=;
        b=R0vk/BHG/ZhjQHcVV53A70DNGDLblSriO8nUY1ykttAClZYQny54zY9F0oWQ9ywUtc
         gjSR9xZyl6ir5eNy35Myjfpe0aErhF5b/vrQ+PTnss9B7M00+ZiZsrX3pczzuqRC7i6i
         7xYEmUIMJWXU3cXJf7d2oPBaW9ccR6aeu8UUFsKiXTTQNtmey1BtS7ZOmClvLqVXSneD
         E8amFWaA9bucnb8OSlmxwL19Rj1kWzo98N2sFyrh3rWM9VEliXrCoMJqUQQuGp8bk650
         /cie1Jq1srOyxTVT+mSzwXuOF0l6niWpsRvPIRPifU/6EQv82TREsZJDrbqTp5dOi8jU
         eupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M6vbKNlAe4oVXAzBpbMwq3/kIC7rorbSwG5kJs/7+zs=;
        b=R1BLkVDpvmvAGJr4IJZL/LrKUyV9OMbekmBGCNG0jVY1WXAlStquq5x+esRq6YDumU
         nzEVHwdrlwwz4AkDdxegNu+Hd5gmVQt6KScUYrq10KT2YGuwnwODYfQhcGBHTymaGrXr
         ADsXTaA+z0bGeT1m/HB7FOJUftVQMoEI6ufcOHe22ukTXjsBidTd+B1YhCCdLHg51rIr
         a5Dd3qwTWuiFqZBORObcoSKr8YAkAogTUbV1RdHaDrteJLoitjoEPJQOy0jvdGQVILmv
         T8QClxwZyMMsE+xLbKi9Oy3Shwxx3iDeSiU57abZJlIQ8qDq7933zSAwHeeCWPwBWJ8J
         yXdw==
X-Gm-Message-State: APjAAAVFQlJf9azAqkp0O9LgJMnm1Q1VSjYkDYs9gLNtexDQ2xKRw+1T
        c/H5qS2HErjGShmdTH1x8TjA5+bpTZg=
X-Google-Smtp-Source: APXvYqz/o3Dh45ONDaf4iHpn7yOdVxKTnVylZYyk8nPT7F/52mr5NxPG9EgX2DPHls7DRgtLF+yGjA==
X-Received: by 2002:a63:fa0e:: with SMTP id y14mr27463991pgh.174.1574622444689;
        Sun, 24 Nov 2019 11:07:24 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:24 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 12/23] media: sunxi: Fix fwnode media link creation
Date:   Sun, 24 Nov 2019 11:06:52 -0800
Message-Id: <20191124190703.12138-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sun4i_csi_notify_bound() passes the bound subdev's sd->fwnode to
media_entity_get_fwnode_pad(). This is likely not an endpoint
fwnode as required by media_entity_get_fwnode_pad(), for most
subdevices it is the port parent of endpoint fwnode(s). This has only
worked before because no entities have implemented the .get_fwnode_pad()
op yet, and the default behavior of media_entity_get_fwnode_pad()
was to ignore the passed fwnode and return the first pad that matches
the given direction flags.

Fix this by replacing the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 27 ++++++++-----------
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 -
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index f36dc6258900..0f117d41a19b 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -38,19 +38,21 @@ static int sun4i_csi_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
 					     notifier);
+	struct media_pad *sink = &csi->subdev.entity.pads[CSI_SUBDEV_SINK];
+	int ret;
 
 	csi->src_subdev = subdev;
-	csi->src_pad = media_entity_get_fwnode_pad(&subdev->entity,
-						   subdev->fwnode,
-						   MEDIA_PAD_FL_SOURCE);
-	if (csi->src_pad < 0) {
-		dev_err(csi->dev, "Couldn't find output pad for subdev %s\n",
+
+	ret = media_create_fwnode_pad_links(sink, dev_fwnode(csi->dev),
+					    &subdev->entity,
+					    dev_fwnode(subdev->dev),
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		dev_err(csi->dev, "Couldn't create media links to subdev %s\n",
 			subdev->name);
-		return csi->src_pad;
-	}
 
-	dev_dbg(csi->dev, "Bound %s pad: %d\n", subdev->name, csi->src_pad);
-	return 0;
+	return ret;
 }
 
 static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
@@ -81,13 +83,6 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 	if (ret)
 		goto err_clean_media;
 
-	ret = media_create_pad_link(&csi->src_subdev->entity, csi->src_pad,
-				    &subdev->entity, CSI_SUBDEV_SINK,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret)
-		goto err_clean_media;
-
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l);
 	if (ret < 0)
 		goto err_clean_media;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 001c8bde006c..1d403f9cef1a 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -140,7 +140,6 @@ struct sun4i_csi {
 	struct v4l2_async_subdev	asd;
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*src_subdev;
-	int				src_pad;
 
 	/* V4L2 variables */
 	struct mutex			lock;
-- 
2.17.1

