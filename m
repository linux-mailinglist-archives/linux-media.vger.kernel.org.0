Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B914DE358
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241066AbiCRVQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiCRVQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:16:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC331104297;
        Fri, 18 Mar 2022 14:15:11 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05D072A5;
        Fri, 18 Mar 2022 22:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647638109;
        bh=vaGAuQll7zbxuinL8BJy0ZGjHc+MsYYoNvJG5xNG310=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kyn64D6pXBz5L6gPUW+kYjiRXuUAIfkGLg2Bug1SEypT7xHRp7dXkk/1IWg6oD+7u
         8E/pnE6tnFrDDoUMFmhbhm3WFLl0hYRU9i/9qCOaMCuK8/0iiEcapVx4SW6bQ84fvR
         NfKxILUF4LI5SLuQCHHc7ysSNUODh5A05gOdSNhQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] media: vsp1: Don't open-code vb2_fop_release()
Date:   Fri, 18 Mar 2022 23:14:45 +0200
Message-Id: <20220318211446.11543-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 drivers/media/platform/renesas/vsp1/vsp1_video.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 044eb5778820..8f53abc71db2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1129,19 +1129,11 @@ static int vsp1_video_open(struct file *file)
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
 	file->private_data = NULL;
 
 	return 0;
-- 
Regards,

Laurent Pinchart

