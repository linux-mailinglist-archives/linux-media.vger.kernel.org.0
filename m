Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB7A58247C
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbiG0KhK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiG0KhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA3C46DBB
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:08 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1680FDF7;
        Wed, 27 Jul 2022 12:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918222;
        bh=952/K15WWh8qeRzuNvXwBHZ+Y/gk1Hn7dLApGzZ+A7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ktW77wigaK/uwIIWGO02i4EQ/cRRdjkYMMusQnPxV6oR/W+9QS1sKxeRLTG96ijsI
         jbhzQUTLrPF+hHD4hPrgqTfRCaVJfowB4NjseM1NIbnBzfhb9+xLj0uhCP5nWEfHv3
         PSkZ4zaCK8ZDfEeHq6de3v/sSA2KH4zxtRCrd+M4=
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
Subject: [PATCH v12 08/30] media: mc: entity: add media_pipeline_alloc_start & media_pipeline_stop_free
Date:   Wed, 27 Jul 2022 13:36:17 +0300
Message-Id: <20220727103639.581567-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

Add new versions of media_pipeline_start() and media_pipeline_stop().
The new functions can be used by drivers that do not need to extend the
media_pipeline with their own structs, and the new functions will handle
allocating and freeing the media_pipeline as needed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 49 ++++++++++++++++++++++++++++++++++++
 include/media/media-entity.h | 22 ++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 0d0d6c0dda16..b7b6c6411aa7 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -579,6 +579,55 @@ void media_pipeline_stop(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_pipeline_stop);
 
+__must_check int media_pipeline_alloc_start(struct media_entity *entity)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline *pipe;
+	int ret;
+	bool new_pipe = false;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	/*
+	 * Is the entity already part of a pipeline? If not, we need to allocate
+	 * a pipe.
+	 */
+	pipe = media_entity_pipeline(entity);
+	if (!pipe) {
+		pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
+		new_pipe = true;
+	}
+
+	ret = __media_pipeline_start(entity, pipe);
+	if (ret) {
+		if (new_pipe)
+			kfree(pipe);
+	}
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
+
+void media_pipeline_stop_free(struct media_entity *entity)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline *pipe;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	pipe = media_entity_pipeline(entity);
+
+	__media_pipeline_stop(entity);
+
+	if (pipe && pipe->start_count == 0)
+		kfree(pipe);
+
+	mutex_unlock(&mdev->graph_mutex);
+}
+EXPORT_SYMBOL_GPL(media_pipeline_stop_free);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 6c0d0a00d58e..13a882a7839c 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1035,6 +1035,28 @@ void media_pipeline_stop(struct media_entity *entity);
  */
 void __media_pipeline_stop(struct media_entity *entity);
 
+/**
+ * media_pipeline_alloc_start - Mark a pipeline as streaming
+ * @entity: Starting entity
+ *
+ * media_pipeline_alloc_start() is similar to media_pipeline_start() but
+ * instead of working on a given pipeline the function will allocate a new
+ * pipeline if needed.
+ *
+ * Calls to media_pipeline_alloc_start() must be matched with
+ * media_pipeline_stop_free().
+ */
+__must_check int media_pipeline_alloc_start(struct media_entity *entity);
+
+/**
+ * media_pipeline_stop_free - Mark a pipeline as not streaming
+ * @entity: Starting entity
+ *
+ * media_pipeline_stop_free() is similar to media_pipeline_stop() but will
+ * also free the pipeline when the start_count drops to 0.
+ */
+void media_pipeline_stop_free(struct media_entity *entity);
+
 /**
  * media_devnode_create() - creates and initializes a device node interface
  *
-- 
2.34.1

