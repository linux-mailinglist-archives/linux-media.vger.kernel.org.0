Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD5458ECAE
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiHJNCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 09:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbiHJNBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 09:01:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4480666A74
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 06:01:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05B54B81C54
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 13:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC0C433D7;
        Wed, 10 Aug 2022 13:01:31 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/6] media/v4l2-mem2mem.h: rename 'videobuf' to 'vb2'
Date:   Wed, 10 Aug 2022 15:01:24 +0200
Message-Id: <20220810130127.2707169-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
References: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is confusing to refer to vb2 structures with 'videobuf', since
that typically is used to refer to the old videobuf version 1
framework.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c |  6 +++---
 include/media/v4l2-mem2mem.h           | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 837e1855f94b..be7fde1ed3ea 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Memory-to-memory device framework for Video for Linux 2 and videobuf.
+ * Memory-to-memory device framework for Video for Linux 2 and vb2.
  *
- * Helper functions for devices that use videobuf buffers for both their
+ * Helper functions for devices that use vb2 buffers for both their
  * source and destination.
  *
  * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
@@ -21,7 +21,7 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
 
-MODULE_DESCRIPTION("Mem to mem device framework for videobuf");
+MODULE_DESCRIPTION("Mem to mem device framework for vb2");
 MODULE_AUTHOR("Pawel Osciak, <pawel@osciak.com>");
 MODULE_LICENSE("GPL");
 
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index fdbd5257e020..bb9de6a899e0 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -486,10 +486,10 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
  * @vma: pointer to struct &vm_area_struct
  *
  * Call from driver's mmap() function. Will handle mmap() for both queues
- * seamlessly for videobuffer, which will receive normal per-queue offsets and
- * proper videobuf queue pointers. The differentiation is made outside videobuf
- * by adding a predefined offset to buffers from one of the queues and
- * subtracting it before passing it back to videobuf. Only drivers (and
+ * seamlessly for the video buffer, which will receive normal per-queue offsets
+ * and proper vb2 queue pointers. The differentiation is made outside
+ * vb2 by adding a predefined offset to buffers from one of the queues
+ * and subtracting it before passing it back to vb2. Only drivers (and
  * thus applications) receive modified offsets.
  */
 int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
@@ -544,7 +544,7 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
  * @m2m_dev: opaque pointer to the internal data to handle M2M context
  * @drv_priv: driver's instance private data
  * @queue_init: a callback for queue type-specific initialization function
- *	to be used for initializing videobuf_queues
+ *	to be used for initializing vb2_queues
  *
  * Usually called from driver's ``open()`` function.
  */
@@ -579,7 +579,7 @@ void v4l2_m2m_ctx_release(struct v4l2_m2m_ctx *m2m_ctx);
  * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
  * @vbuf: pointer to struct &vb2_v4l2_buffer
  *
- * Call from videobuf_queue_ops->ops->buf_queue, videobuf_queue_ops callback.
+ * Call from vb2_queue_ops->ops->buf_queue, vb2_queue_ops callback.
  */
 void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
 			struct vb2_v4l2_buffer *vbuf);
-- 
2.35.1

