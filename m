Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC2750AC20
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiDUXpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442643AbiDUXpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3B638DAF
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:42:50 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA7F48EF;
        Fri, 22 Apr 2022 01:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584567;
        bh=YPQIRGVNsWPVkyQMTYuyOKEuf0FJFRZ/wSLmqQxjVFg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Td/RhJ5j1MGiist9jyC7deDPqhUzgnFZoHLwrRkOJhom2yxNRrooYiLYoHgmTIcZq
         aFVdD+CINAL9zGsKY4s2KABKXqviwdWX/igwmA+uN+xJvOAg9+8jRjNuWGQ2VwC0Gp
         Hjo2SstOQhOFNDmovJeKNi0IJo98V0sFkMpS6KR0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 05/21] media: rkisp1: params: Fix and simplify (un)registration
Date:   Fri, 22 Apr 2022 02:42:24 +0300
Message-Id: <20220421234240.1694-6-laurent.pinchart@ideasonboard.com>
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

The rkisp1_params_register() and rkisp1_params_unregister() functions
don't destroy the mutex (in the error path for the former). Fix this,
simplify error handling at registration time as media_entity_cleanup()
can be called on an uninitialized entity, and make
rkisp1_params_unregister() safe to be called on an unregistered params
node to prepare for simplification of error handling at probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Use video_is_registered() for registration test
---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 8f62f09e635f..f6da2571b55f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1844,16 +1844,20 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		return ret;
+		goto error;
+
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		goto err_cleanup_media_entity;
+		goto error;
 	}
+
 	return 0;
-err_cleanup_media_entity:
+
+error:
 	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&node->vlock);
 	return ret;
 }
 
@@ -1863,6 +1867,10 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
 	struct rkisp1_vdev_node *node = &params->vnode;
 	struct video_device *vdev = &node->vdev;
 
+	if (!video_is_registered(vdev))
+		return;
+
 	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&node->vlock);
 }
-- 
Regards,

Laurent Pinchart

