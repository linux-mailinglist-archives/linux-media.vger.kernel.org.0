Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 100C351D571
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 12:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347455AbiEFKQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 06:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245457AbiEFKQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 06:16:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E317750067;
        Fri,  6 May 2022 03:13:03 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77755487;
        Fri,  6 May 2022 12:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651831982;
        bh=2+tuYCwivtB145V4QoTwdnoY2qPvvaOlTfMdgauiziE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSUAhwqOQp0vyVtQqVo7Q672Tlj9n5RKIk7tVmauS62RbVVw0LxCb8q1n1MeDAoP6
         KfdnG2YvViuEuKjOyK2uyTmUF+TyCnrAh109A+rqWL+mJiZ3B2i7xwxPQKdnhTGvDs
         XXR2Fc+Km7l1YJsqqkfjkbqw5+rMUbdivfeLUl6E=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 2/3] media: vsp1: Don't open-code vb2_fop_release()
Date:   Fri,  6 May 2022 13:12:52 +0300
Message-Id: <20220506101252.28770-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318211446.11543-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318211446.11543-3-laurent.pinchart+renesas@ideasonboard.com>
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

Use the vb2_fop_release() helper to replace the open-coded version. The
video->lock is assigned to the queue lock, used by vb2_fop_release(), so
the only functional difference is that v4l2_fh_release() is now called
before vsp1_device_put(). This should be harmless.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Remove redundant clear of file->private_data
---
 drivers/media/platform/renesas/vsp1/vsp1_video.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 497f352e9f8c..0180ffce35f7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1127,21 +1127,11 @@ static int vsp1_video_open(struct file *file)
 static int vsp1_video_release(struct file *file)
 {
 	struct vsp1_video *video = video_drvdata(file);
-	struct v4l2_fh *vfh = file->private_data;
 
-	mutex_lock(&video->lock);
-	if (video->queue.owner == vfh) {
-		vb2_queue_release(&video->queue);
-		video->queue.owner = NULL;
-	}
-	mutex_unlock(&video->lock);
+	vb2_fop_release(file);
 
 	vsp1_device_put(video->vsp1);
 
-	v4l2_fh_release(file);
-
-	file->private_data = NULL;
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

