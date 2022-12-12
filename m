Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F3164A07B
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 14:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbiLLNZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 08:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbiLLNZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 08:25:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917F12DD3
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 05:25:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 075B98BF;
        Mon, 12 Dec 2022 14:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670851511;
        bh=AEj6xYTRYWZXjFLrt7ybQITN9f7FNHxeSJ38lx+y4gE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pf8mgjhR5EumZbA08XBdpl9ZaoVYsRGKCbkW8IWWrKZDaLMvMjmK9dxaaNrTPYdWh
         FPd1nqoU9yr5PsoQ5UJyOu68A2ZtJS/La7CG0cnYHc4sySNHbCzh1o6M7nxhTxbfjS
         NiAe4d2iB4OPqZXQL4kA6NFK5rnuCXkPOrnOZtW8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 2/2] media: mc: entity: Fix minor issues in comments and documentation
Date:   Mon, 12 Dec 2022 15:25:05 +0200
Message-Id: <20221212132505.9251-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
References: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
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

Commit ae219872834a ("media: mc: entity: Rewrite
media_pipeline_start()") incorrectly referred to entity instead of pad
in a comment, and forgot to update a second comment accordingly when
moving the pipe from entity to pad. Furthermore, it didn't properly
reflow the documentation text it updated.

Fix those small issues.

Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst | 10 ++++------
 drivers/media/mc/mc-entity.c               |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 400b8ca29367..2456950ce8ff 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -232,12 +232,10 @@ prevent link states from being modified during streaming by calling
 
 The function will mark all the pads which are part of the pipeline as streaming.
 
-The struct media_pipeline instance pointed to by
-the pipe argument will be stored in every pad in the pipeline.
-Drivers should embed the struct media_pipeline
-in higher-level pipeline structures and can then access the
-pipeline through the struct media_pad
-pipe field.
+The struct media_pipeline instance pointed to by the pipe argument will be
+stored in every pad in the pipeline. Drivers should embed the struct
+media_pipeline in higher-level pipeline structures and can then access the
+pipeline through the struct media_pad pipe field.
 
 Calls to :c:func:`media_pipeline_start()` can be nested.
 The pipeline pointer must be identical for all nested calls to the function.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f268cf66053e..4c37c0df1a73 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -711,8 +711,8 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	lockdep_assert_held(&mdev->graph_mutex);
 
 	/*
-	 * If the entity is already part of a pipeline, that pipeline must
-	 * be the same as the pipe given to media_pipeline_start().
+	 * If the pad is already part of a pipeline, that pipeline must be the
+	 * same as the pipe given to media_pipeline_start().
 	 */
 	if (WARN_ON(pad->pipe && pad->pipe != pipe))
 		return -EINVAL;
@@ -906,7 +906,7 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
 	mutex_lock(&mdev->graph_mutex);
 
 	/*
-	 * Is the entity already part of a pipeline? If not, we need to allocate
+	 * Is the pad already part of a pipeline? If not, we need to allocate
 	 * a pipe.
 	 */
 	pipe = media_pad_pipeline(pad);
-- 
Regards,

Laurent Pinchart

