Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F9F4C5CB8
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 17:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiB0QCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 11:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiB0QCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 11:02:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5C94B867
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 08:01:33 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D6F8488;
        Sun, 27 Feb 2022 17:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645977692;
        bh=vy7JpQTnRFpo97VwYZj+0uG3egTgvClvLHTT5UB033w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CFrC+I7IPDKHw2Z+GTQkpWfjD0lvTVn4NKNF96tNiIzdk/tZT6RiZY8fwwNYciOcw
         6jgVGhfWRsPsOKCwB5704fhUCODdPCc3l0NnyrPFtC6+sy9EFEC+XEoSjNSdL2GNkA
         BhnFAVbDAK71Edmsz6RZXALI8xTelo6S57nvWam8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 01/16] media: rkisp1: capture: Initialize entity before video device
Date:   Sun, 27 Feb 2022 18:01:01 +0200
Message-Id: <20220227160116.18556-2-laurent.pinchart@ideasonboard.com>
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

The media_entity embedded in the video_device needs to be initialized
before registering the video_device. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

