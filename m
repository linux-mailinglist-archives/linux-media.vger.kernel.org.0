Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A6E4CDA08
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241034AbiCDRUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241035AbiCDRUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:20:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F97B151D3A
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:19:43 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 409A41027;
        Fri,  4 Mar 2022 18:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414381;
        bh=XAy4l+u3O29ccEZRhIHqhldSK5JJ1M68c+15tp62Ric=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nDyAeZgSAB2dzgo+S47HvQbTJLlXMIittwF050CH8OdFPQ9lAwRxxykFmR8X7TxeM
         OSZsz2JliJug/StYkLdVPDZtKl9xVrTyPO9zdl24byoJneR8jiMUV9iqMJ1BUbXVas
         lhZ7g3PYzJ0HnjsYkmk42uxINVg+mbeoT4Vcxm+E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 01/17] media: rkisp1: capture: Initialize entity before video device
Date:   Fri,  4 Mar 2022 19:19:09 +0200
Message-Id: <20220304171925.1592-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
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

The media_entity embedded in the video_device needs to be initialized
before registering the video_device. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index c95c00a91180..9c11f2b8e5f5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1372,22 +1372,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 
 	vdev->queue = q;
 
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
+	if (ret)
+		return ret;
+
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(cap->rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		return ret;
+		goto error;
 	}
+
 	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
 		  vdev->num);
 
-	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
-	if (ret) {
-		video_unregister_device(vdev);
-		return ret;
-	}
-
 	return 0;
+
+error:
+	media_entity_cleanup(&vdev->entity);
+	return ret;
 }
 
 static void
-- 
Regards,

Laurent Pinchart

