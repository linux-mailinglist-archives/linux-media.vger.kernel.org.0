Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B8B82829
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731441AbfHEXge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:34 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42480 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731097AbfHEXfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so40406170pff.9;
        Mon, 05 Aug 2019 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sLSukBr2Dr/fkgKqS432Drjpjtgmp1YtkMGvOGWg9/A=;
        b=ssmMvt5WCl/uRVDnSNPt4nSuNoE1M3ZRy31D9o4qEeDpQBL314Lb5MhF1Y88I5QXwd
         +76WDYgBLRNqZn+i0gu8M+NaYA6MGYuQmuGzkKDhOrQtN51oZcn9hIVzZacRJRdTVLY6
         3Au6tNwHcx3LkgmIZJCqdTV2lCmGLjNNKfybzQgH7yoHFPKuo3lUhiOSSRgKrN0JngKn
         xVviFCYLs1IopioWs6AX5zvksXZexNZsp1H03p/Wsytz5o6PJmDztvm1FcPBD/0EcUiY
         n+Imbga638jsSiV8ZM4Z+qSDJ2MdYwK64CbIyPbDuBC/+gzfKTziJMwDLGcwc7hYTnKS
         k7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sLSukBr2Dr/fkgKqS432Drjpjtgmp1YtkMGvOGWg9/A=;
        b=Ah86oymqPNDhNyS1IdnX4xGj1JbnlopS2c8JDJtbuJkd8JTHBM1K43uNryHgO+c+Tg
         NTVU8qYh3faACks1VRw9sL1s+fp5bWKFXU24rahbK45nYMWWK+A7J9B7zD236N15MK+E
         6O9xo4nbIbuqjaYLb9oxF6Gw53nWPmYcEteef2t6E1IAJkU69QJFuq1LkvZBjv7BXHYZ
         NFcwvarkYXoHli4RDbdhzM8Q/qa5wjQ5qxJyHNV8/8axgLCWPieDk2EqO9DcMCPsgnU3
         DeDqSdYWsfm2Qc0KfRy5i2XWe2Xxd9pa9I/dxG/f9uKQx34Hmc/FgbIrII/tr2w3rOK/
         xo7Q==
X-Gm-Message-State: APjAAAWKGtd2CPPdlL3Wf14KQes7Uil7Unllrt89azlrU+uCykJDG7kj
        9e/H012xgePK5yfZExk5QJMUeJEX
X-Google-Smtp-Source: APXvYqxdrgMTw3ampNtYtP76n+DzZeeu18uPjTa9aAYoc3tHW8eoeyXU0JU2dmiZHiOit2WQTYQmlA==
X-Received: by 2002:a63:4404:: with SMTP id r4mr311426pga.245.1565048124005;
        Mon, 05 Aug 2019 16:35:24 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:23 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 09/22] media: sun6i: Fix fwnode media link creation
Date:   Mon,  5 Aug 2019 16:34:52 -0700
Message-Id: <20190805233505.21167-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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
index 6e0e894154f4..9cf726b5c25a 100644
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

