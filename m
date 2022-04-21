Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432BE50AC1E
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383971AbiDUXpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442649AbiDUXpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213CDDF94
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:42:52 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52C978F1;
        Fri, 22 Apr 2022 01:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584567;
        bh=EKwBdOKXYBSAZo7eHku3+WttxLQM6TlB105HlkuT1PU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T2OriKuvVSp8YK8Y2KIadOJECuDJ5CKXUPaVT8HoryUTKBVNMyAhkjXKCdSBL1UL/
         qI49P7vati9KyjM1YMd9JAuooNXQhMO4Zu6Q7SqlN+1yZEqXh49wbpGG+Ax933HgEQ
         SYz5GnjYA9yh6jyAL4afxBqqLyBuke2Iz7TsFVNA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 06/21] media: rkisp1: stats: Simplify (un)registration
Date:   Fri, 22 Apr 2022 02:42:25 +0300
Message-Id: <20220421234240.1694-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

