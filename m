Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1298310849A
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfKXTHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:24 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42499 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbfKXTHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:23 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so5423567plt.9
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sRRyt6fc5LRoY7i647zUdzX7LInrVBsOqheBLaeBHkk=;
        b=hHCjRYPbtfMv79iVk9WV/D5EVAhwZOtOmYgxyscvnqd06aeTql4nM7ufCioB1HVLnW
         gPw6Jbc7sUR3iccJhzWOO9FaQgd1MBuvfwjE52uuL1eWXUcEWFbWeCmeNl8KqYMob9/p
         w77WV+yp3KbnsbFFsjreiSFedpfNJb6hkVnzUhgRGtNG0D4n7t2WKHgdZs+qDa52pzdd
         JuJgKwpof6m0yKusxafH0odkXK1c1LT31EXuS6nUSSD2VeHZ2KBvRoHxPRUKaChHa/44
         DlC+bXeqVDElOeYEAa7Kb4+HSbiILM6HtgbYFOnFX8dVIQ61YJXlkm5SNjggABn6djId
         hp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sRRyt6fc5LRoY7i647zUdzX7LInrVBsOqheBLaeBHkk=;
        b=hwVJkC0EDavRoBP5KU1xgiZPie6sGCeRKCRuOIdl/g61xbqJvqWs4KZ+679maqLfhA
         jIcj8BrvSXhb/t5NmAdBlO0q3ALWuh4tgdsvXiyiFwSgqskQT4L81rUYVLzNn45cunpu
         fqIZ0wEGHS0i0NmrV6JUGr8mKrhVm6xB0g3D3n81HdgWgCAoMjMmVna3GWuZtfyw6YJz
         dW2MO97Wac2b2vuPy3oE517nFuOgCYzo6DUNhn6N72EMPD/aEKuySwzLbrFha1h+sjHV
         bNsaskgqUJo9TEusFewNF37ssYMyInEDevxOkRzGIwmUNDuopfYL87V7kqsFB+oIGa5d
         BYFA==
X-Gm-Message-State: APjAAAXsjDSqHk6LN7FZtQ0vhGRRS3xrudlwV1iYqlMammEY8cOIIeMC
        H92Zd3TrEPJ5UzIH0wORfBGBTYFRBtk=
X-Google-Smtp-Source: APXvYqzbITRSkAAmspfJ5jYvcmr2++QY2ZLZvfvs8ByPiU/Q5Em2I+J7MQjbW+fGydkovuUfvB7aJg==
X-Received: by 2002:a17:902:760b:: with SMTP id k11mr15152099pll.272.1574622442156;
        Sun, 24 Nov 2019 11:07:22 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:21 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 09/23] media: sun6i: Fix fwnode media link creation
Date:   Sun, 24 Nov 2019 11:06:49 -0800
Message-Id: <20191124190703.12138-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sun6i_csi_link_entity() passes the bound subdev's sd->fwnode to
media_entity_get_fwnode_pad(). This is likely not an endpoint
fwnode as required by media_entity_get_fwnode_pad(), for most
subdevices it is the port parent of endpoint fwnode(s). This has only
worked before because no entities have implemented the .get_fwnode_pad()
op yet, and the default behavior of media_entity_get_fwnode_pad()
was to ignore the passed fwnode and return the first pad that matches
the given direction flags.

Fix this by replacing the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: 5cc7522d89655 ("media: sun6i: Add support for Allwinner CSI V3s")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 36 +++----------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 055eb0b8e396..c6f51554ef67 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -630,37 +630,11 @@ static int sun6i_csi_link_entity(struct sun6i_csi *csi,
 				 struct media_entity *entity,
 				 struct fwnode_handle *fwnode)
 {
-	struct media_entity *sink;
-	struct media_pad *sink_pad;
-	int src_pad_index;
-	int ret;
-
-	ret = media_entity_get_fwnode_pad(entity, fwnode, MEDIA_PAD_FL_SOURCE);
-	if (ret < 0) {
-		dev_err(csi->dev, "%s: no source pad in external entity %s\n",
-			__func__, entity->name);
-		return -EINVAL;
-	}
-
-	src_pad_index = ret;
-
-	sink = &csi->video.vdev.entity;
-	sink_pad = &csi->video.pad;
-
-	dev_dbg(csi->dev, "creating %s:%u -> %s:%u link\n",
-		entity->name, src_pad_index, sink->name, sink_pad->index);
-	ret = media_create_pad_link(entity, src_pad_index, sink,
-				    sink_pad->index,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret < 0) {
-		dev_err(csi->dev, "failed to create %s:%u -> %s:%u link\n",
-			entity->name, src_pad_index,
-			sink->name, sink_pad->index);
-		return ret;
-	}
-
-	return 0;
+	return media_create_fwnode_pad_links(&csi->video.pad,
+					     dev_fwnode(csi->dev),
+					     entity, fwnode,
+					     MEDIA_LNK_FL_ENABLED |
+					     MEDIA_LNK_FL_IMMUTABLE);
 }
 
 static int sun6i_subdev_notify_complete(struct v4l2_async_notifier *notifier)
-- 
2.17.1

