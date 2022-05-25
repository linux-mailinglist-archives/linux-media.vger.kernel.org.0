Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5733E5343AB
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 21:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344076AbiEYTG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 15:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344032AbiEYTGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 15:06:46 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8115F9C;
        Wed, 25 May 2022 12:06:43 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7E06E1C0010;
        Wed, 25 May 2022 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653505602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w5IfG9ptveYiTpI6QTEcwlqfXGi+j1kqUaqBGVDq584=;
        b=AdUc3E3QFVXxFSxeWhLgsVHT09JYy/AOMMtBNd1arGtIo6WZWcJ3AGlUG7e2qCPfqa9Hkg
        CLOVaTm3QZtfdp4yz0+e9MSsMjwDiZ9i8UeApFFuyp3oZmhW96tccOt+KV4IvNrB/GUABC
        QQbcsB985GmHfT0x6UgMGS5yRBCmvynN7fyEUL4DpwuUf92io9z3S0b6B6DWbqYoXekb+j
        LlXs6QRff6NL9d3i8RPgk5bGKCxbRqgyAcGWoFDaei8Iwar9lwJ+h9hfsL0tV3ohtWV1uR
        zydF5vw+g9MhrZJ2yDKtbC+K+Ie7zJZ0tlqXG5OJFtsX9Q7kRWs8uhlya0AmPA==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 14/44] media: sun6i-csi: Introduce and use video helper functions
Date:   Wed, 25 May 2022 21:05:47 +0200
Message-Id: <20220525190617.696344-15-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525190617.696344-1-paul.kocialkowski@bootlin.com>
References: <20220525190617.696344-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce some helpers for buffer and general video configuration.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_video.c    | 46 +++++++++++--------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 06e55ee40e24..9e0f8a478bef 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -92,6 +92,29 @@ static bool sun6i_video_format_check(u32 format)
 	return false;
 }
 
+/* Video */
+
+static void sun6i_video_buffer_configure(struct sun6i_csi_device *csi_dev,
+					 struct sun6i_csi_buffer *csi_buffer)
+{
+	csi_buffer->queued_to_csi = true;
+	sun6i_csi_update_buf_addr(csi_dev, csi_buffer->dma_addr);
+}
+
+static void sun6i_video_configure(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_video *video = &csi_dev->video;
+	struct sun6i_csi_config config = { 0 };
+
+	config.pixelformat = video->format.fmt.pix.pixelformat;
+	config.code = video->mbus_code;
+	config.field = video->format.fmt.pix.field;
+	config.width = video->format.fmt.pix.width;
+	config.height = video->format.fmt.pix.height;
+
+	sun6i_csi_update_config(csi_dev, &config);
+}
+
 /* Queue */
 
 static int sun6i_video_queue_setup(struct vb2_queue *queue,
@@ -160,7 +183,6 @@ static int sun6i_video_start_streaming(struct vb2_queue *queue,
 	struct video_device *video_dev = &video->video_dev;
 	struct sun6i_csi_buffer *buf;
 	struct sun6i_csi_buffer *next_buf;
-	struct sun6i_csi_config config;
 	struct v4l2_subdev *subdev;
 	unsigned long flags;
 	int ret;
@@ -182,22 +204,13 @@ static int sun6i_video_start_streaming(struct vb2_queue *queue,
 		goto error_media_pipeline;
 	}
 
-	config.pixelformat = video->format.fmt.pix.pixelformat;
-	config.code = video->mbus_code;
-	config.field = video->format.fmt.pix.field;
-	config.width = video->format.fmt.pix.width;
-	config.height = video->format.fmt.pix.height;
-
-	ret = sun6i_csi_update_config(csi_dev, &config);
-	if (ret < 0)
-		goto error_media_pipeline;
+	sun6i_video_configure(csi_dev);
 
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
 
 	buf = list_first_entry(&video->dma_queue,
 			       struct sun6i_csi_buffer, list);
-	buf->queued_to_csi = true;
-	sun6i_csi_update_buf_addr(csi_dev, buf->dma_addr);
+	sun6i_video_buffer_configure(csi_dev, buf);
 
 	sun6i_csi_set_stream(csi_dev, true);
 
@@ -219,8 +232,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *queue,
 	 * would also drop frame when lacking of queued buffer.
 	 */
 	next_buf = list_next_entry(buf, list);
-	next_buf->queued_to_csi = true;
-	sun6i_csi_update_buf_addr(csi_dev, next_buf->dma_addr);
+	sun6i_video_buffer_configure(csi_dev, next_buf);
 
 	spin_unlock_irqrestore(&video->dma_queue_lock, flags);
 
@@ -294,8 +306,7 @@ void sun6i_video_frame_done(struct sun6i_csi_device *csi_dev)
 	 * for next ISR call.
 	 */
 	if (!next_buf->queued_to_csi) {
-		next_buf->queued_to_csi = true;
-		sun6i_csi_update_buf_addr(csi_dev, next_buf->dma_addr);
+		sun6i_video_buffer_configure(csi_dev, next_buf);
 		dev_dbg(csi_dev->dev, "Frame dropped!\n");
 		goto complete;
 	}
@@ -309,8 +320,7 @@ void sun6i_video_frame_done(struct sun6i_csi_device *csi_dev)
 	/* Prepare buffer for next frame but one.  */
 	if (!list_is_last(&next_buf->list, &video->dma_queue)) {
 		next_buf = list_next_entry(next_buf, list);
-		next_buf->queued_to_csi = true;
-		sun6i_csi_update_buf_addr(csi_dev, next_buf->dma_addr);
+		sun6i_video_buffer_configure(csi_dev, next_buf);
 	} else {
 		dev_dbg(csi_dev->dev, "Next frame will be dropped!\n");
 	}
-- 
2.36.1

