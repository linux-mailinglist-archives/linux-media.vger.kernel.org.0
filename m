Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF10964A2FD
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 15:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbiLLOQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 09:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiLLOQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 09:16:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5493DF65
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 06:16:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05E078A9;
        Mon, 12 Dec 2022 15:16:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670854585;
        bh=j5f0IG+PJIhceiA/3r8lRcq2vcxoloztWn9ZsRHa8+E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nxJw64cYgVMDs0ZR0KL0JZB3YLrhoC7XMFFrIJIKlhd9Z1J4eNGP0R5j4q9PihjNp
         VPuD4tZeSxf9iMGL5ncPGAtvoo/7NNB/OEqJZQz4a0DuFLvY0R0s30aUmyz+5pum7W
         qpMiXOq9Ek5KLwAHkNdRpUayOAFwksUHoCKgn7b0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 1/5] media: mc: entity: Add pad iterator for media_pipeline
Date:   Mon, 12 Dec 2022 16:16:17 +0200
Message-Id: <20221212141621.724-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
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

Add a media_pipeline_for_each_pad() macro to iterate over pads in a
pipeline. This should be used by driver as a replacement of the
media_graph_walk API, as iterating over the media_pipeline uses the
cached list of pads and is thus more efficient.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 18 ++++++++++++++++++
 include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b8bcbc734eaf..70df2050951c 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -932,6 +932,24 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
 }
 EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
 
+struct media_pad *
+__media_pipeline_pad_iter_next(struct media_pipeline *pipe,
+			       struct media_pipeline_pad_iter *iter,
+			       struct media_pad *pad)
+{
+	if (!pad)
+		iter->cursor = pipe->pads.next;
+
+	if (iter->cursor == &pipe->pads)
+		return NULL;
+
+	pad = list_entry(iter->cursor, struct media_pipeline_pad, list)->pad;
+	iter->cursor = iter->cursor->next;
+
+	return pad;
+}
+EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 85ed08ddee9d..e881e483b550 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -130,6 +130,15 @@ struct media_pipeline_pad {
 	struct media_pad *pad;
 };
 
+/**
+ * struct media_pipeline_pad_iter - Iterator for media_pipeline_for_each_pad
+ *
+ * @cursor: The current element
+ */
+struct media_pipeline_pad_iter {
+	struct list_head *cursor;
+};
+
 /**
  * struct media_link - A link object part of a media graph.
  *
@@ -1163,6 +1172,26 @@ void media_pipeline_stop(struct media_pad *pad);
  */
 void __media_pipeline_stop(struct media_pad *pad);
 
+struct media_pad *
+__media_pipeline_pad_iter_next(struct media_pipeline *pipe,
+			       struct media_pipeline_pad_iter *iter,
+			       struct media_pad *pad);
+
+/**
+ * media_pipeline_for_each_pad - Iterate on all pads in a media pipeline
+ * @pipe: The pipeline
+ * @iter: The iterator (struct media_pipeline_pad_iter)
+ * @pad: The iterator pad
+ *
+ * Iterate on all pads in a media pipeline. This is only valid after the
+ * pipeline has been built with media_pipeline_start() and before it gets
+ * destroyed with media_pipeline_stop().
+ */
+#define media_pipeline_for_each_pad(pipe, iter, pad)			\
+	for (pad = __media_pipeline_pad_iter_next((pipe), iter, NULL);	\
+	     pad != NULL;						\
+	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
+
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming
  * @pad: Starting pad
-- 
Regards,

Laurent Pinchart

