Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDE84DE950
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243634AbiCSQct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243637AbiCSQcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32BF21C73A
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:27 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4752898;
        Sat, 19 Mar 2022 17:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707485;
        bh=+EEZaI1Sr64pv4WdRxOC2fjz5M1NMfScxLNyvwwsUYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pvs659Yb0nrkMtD0+dL8bi0JPXvumYFQvUksTM2MI4ETJ/q9oCgqOy9uBeJqo4n22
         BjaSUnAWlqxExt7L29kcXDNeqNpMHUMR1bb69cMKQ9B7Ni97+cezSz7l18bTMfwnBq
         2haR1RzqDLneXQ+gMcf4NMcwWevz7tSQs1KwdEJs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 01/17] media: rkisp1: capture: Initialize entity before video device
Date:   Sat, 19 Mar 2022 18:30:44 +0200
Message-Id: <20220319163100.3083-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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

