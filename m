Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 511F24DE35C
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241072AbiCRVQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240986AbiCRVQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:16:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AA7D4456;
        Fri, 18 Mar 2022 14:15:16 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3E182E0;
        Fri, 18 Mar 2022 22:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647638110;
        bh=jOMgpOzP4ODIcbwU/EUMFmGOgnpTrrsAmm0wdppi+lk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bzLCjgMXNuYPwend069aKxp4siTbkVRiiW3+UcU7aMnCjW68vbJBmUQANbiZpJGgY
         p92/vuBVUlUG/WHAM0WZHbBHCBSoNQNOFrkBN9JHmWVzRTXDxTgZh7T26l8Wg+6KMF
         6tPH5i5UUDPwiW2d78u2q8crDteflMQdE2iLIAbE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] media: vsp1: Use vb2_queue_is_busy()
Date:   Fri, 18 Mar 2022 23:14:46 +0200
Message-Id: <20220318211446.11543-4-laurent.pinchart+renesas@ideasonboard.com>
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

Use the new vb2_queue_is_busy() helper to replace the open-coded
version.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 8f53abc71db2..4da70b2b0869 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1032,7 +1032,7 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	struct vsp1_pipeline *pipe;
 	int ret;
 
-	if (video->queue.owner && video->queue.owner != file->private_data)
+	if (vb2_queue_is_busy(&video->queue, file))
 		return -EBUSY;
 
 	/*
-- 
Regards,

Laurent Pinchart

