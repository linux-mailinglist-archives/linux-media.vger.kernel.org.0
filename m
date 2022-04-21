Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A0A50AC17
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442637AbiDUXpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442632AbiDUXpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A0438DAF
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:42:45 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDBD44A8;
        Fri, 22 Apr 2022 01:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584564;
        bh=+EEZaI1Sr64pv4WdRxOC2fjz5M1NMfScxLNyvwwsUYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=piyFUWpUlBZXAB9PLDO4R+mbp0uNMH1Ivb040g7hO2h4zIVRCPbP3CYpes6N8WN9h
         f4CbdrZyg6bL6YWQoAYQC8EAIfe9FnTqdC9M8L2io5jmAGjK3/emTyeVJ1JjgEDInh
         Kzb9KC6aTJLihscQblPc5ESRxomYAN4EYXydqnhU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 01/21] media: rkisp1: capture: Initialize entity before video device
Date:   Fri, 22 Apr 2022 02:42:20 +0300
Message-Id: <20220421234240.1694-2-laurent.pinchart@ideasonboard.com>
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

The media_entity embedded in the video_device needs to be initialized
before registering the video_device. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index fee2aaacb26b..e88749488969 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1386,22 +1386,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 
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

