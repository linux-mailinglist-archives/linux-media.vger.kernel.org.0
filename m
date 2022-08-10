Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9DB58EBB4
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbiHJMLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiHJMLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:11:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DFC6AA19
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:11:50 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D88241E5C;
        Wed, 10 Aug 2022 14:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133504;
        bh=/IER59LH+hHiRXmdVixI3VriXoarjI8V/CN2X2AIUXw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j94cRE8bzQVV6Mk5wukfbM9X4VJFpuKlxaBsSoe6GzqL1qiZAVulxs2aBTDfVvz7k
         j8JGNvnO9Ps87hELty7LSKPokFZmSDrF3hda4Gjn/7Q38INMiCifeFuoGM6mWP2p/n
         pkvdoazmK7nWgv6eyNtUQlkj0lfnJ1NDf7RxHo/w=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v13 11/34] media: drivers: use video_device_pipeline()
Date:   Wed, 10 Aug 2022 15:10:59 +0300
Message-Id: <20220810121122.3149086-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
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

Use video_device_pipeline() in the drivers instead of
media_entity_pipeline().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 4 ++--
 drivers/media/platform/xilinx/xilinx-dma.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index fcec691ce7fc..040d6e7cceeb 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -402,7 +402,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 * Use the pipeline object embedded in the first DMA object that starts
 	 * streaming.
 	 */
-	pipe = to_xvip_pipeline(&dma->video.entity) ? : &dma->pipe;
+	pipe = to_xvip_pipeline(&dma->video) ? : &dma->pipe;
 
 	ret = video_device_pipeline_start(&dma->video, &pipe->pipe);
 	if (ret < 0)
@@ -447,7 +447,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void xvip_dma_stop_streaming(struct vb2_queue *vq)
 {
 	struct xvip_dma *dma = vb2_get_drv_priv(vq);
-	struct xvip_pipeline *pipe = to_xvip_pipeline(&dma->video.entity);
+	struct xvip_pipeline *pipe = to_xvip_pipeline(&dma->video);
 	struct xvip_dma_buffer *buf, *nbuf;
 
 	/* Stop the pipeline. */
diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
index 3ea10f6b0bb9..9c6d4c18d1a9 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.h
+++ b/drivers/media/platform/xilinx/xilinx-dma.h
@@ -45,9 +45,9 @@ struct xvip_pipeline {
 	struct xvip_dma *output;
 };
 
-static inline struct xvip_pipeline *to_xvip_pipeline(struct media_entity *e)
+static inline struct xvip_pipeline *to_xvip_pipeline(struct video_device *vdev)
 {
-	struct media_pipeline *pipe = media_entity_pipeline(e);
+	struct media_pipeline *pipe = video_device_pipeline(vdev);
 
 	if (!pipe)
 		return NULL;
-- 
2.34.1

