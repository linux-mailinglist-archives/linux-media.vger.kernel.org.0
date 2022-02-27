Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CBE4C5CBD
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 17:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbiB0QCT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 11:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbiB0QCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 11:02:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5924B867
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 08:01:41 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC62712BF;
        Sun, 27 Feb 2022 17:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645977695;
        bh=EKwBdOKXYBSAZo7eHku3+WttxLQM6TlB105HlkuT1PU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cmDgYA19NS7bYN4h1xMx+SBNGUQuuu+zTr59T1yL786jWrBg0nRdS+5DjGIefk2mv
         AfHK7aZcjUdD6ze+kp+2xfP0Ljp7kd/WkLtJr9UJ1e7My949HCHSAwKb0cWCHv1OiK
         Yn7oDKnGWMmvi253BeEHmnZAxwzHyowS4NJVwaXA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 06/16] media: rkisp1: stats: Simplify (un)registration
Date:   Sun, 27 Feb 2022 18:01:06 +0200
Message-Id: <20220227160116.18556-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify error handling at registration time as media_entity_cleanup()
can be called on an uninitialized entity, and make
rkisp1_stats_unregister() safe to be called on an unregistered stats
node to prepare for simplification of error handling at probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index be5777c65bfb..26ef3bbe43d0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -463,21 +463,21 @@ int rkisp1_stats_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto err_mutex_destroy;
+		goto error;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(&vdev->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		goto err_cleanup_media_entity;
+		goto error;
 	}
 
 	return 0;
 
-err_cleanup_media_entity:
+error:
 	media_entity_cleanup(&vdev->entity);
-err_mutex_destroy:
 	mutex_destroy(&node->vlock);
+	stats->rkisp1 = NULL;
 	return ret;
 }
 
@@ -487,6 +487,9 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1)
 	struct rkisp1_vdev_node *node = &stats->vnode;
 	struct video_device *vdev = &node->vdev;
 
+	if (!stats->rkisp1)
+		return;
+
 	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&node->vlock);
-- 
Regards,

Laurent Pinchart

