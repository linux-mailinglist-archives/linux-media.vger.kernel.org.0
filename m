Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA91B77E1DF
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 14:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244612AbjHPMr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 08:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245319AbjHPMrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 08:47:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F37E26BA
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 05:47:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF3DF6435C
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5A6C433C8;
        Wed, 16 Aug 2023 12:47:34 +0000 (UTC)
Message-ID: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
Date:   Wed, 16 Aug 2023 14:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videobuf2-core.c: check if all buffers have the same
 number of planes
Cc:     andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
number of planes per buffer might be different from the already allocated buffers.

However, this does not make a lot of sense and there are no drivers that allow
for variable number of planes in the allocated buffers.

While it is possible do this today, when such a buffer is queued it will fail
in the buf_prepare() callback where the plane sizes are checked if those are
large enough. If fewer planes were allocated, then the size for the missing
planes are 0 and the check will return -EINVAL.

But it is much better to do this check in VIDIOC_CREATE_BUFS.

This patch adds the check to videobuf2-core.c

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
With this patch the mediatek vcodec patch would no longer be needed:
https://patchwork.linuxtv.org/project/linux-media/patch/20230810082333.972165-1-harperchen1110@gmail.com/
---
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index cf6727d9c81f..b88c08319bbe 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -938,6 +938,10 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			dprintk(q, 1, "memory model mismatch\n");
 			return -EINVAL;
 		}
+		if (requested_planes != q->num_planes) {
+			dprintk(q, 1, "num_planes mismatch\n");
+			return -EINVAL;
+		}
 		if (!verify_coherency_flags(q, non_coherent_mem))
 			return -EINVAL;
 	}
@@ -1002,6 +1006,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		mutex_unlock(&q->mmap_lock);
 		return -ENOMEM;
 	}
+	if (no_previous_buffers)
+		q->num_planes = num_planes;
 	mutex_unlock(&q->mmap_lock);

 	/*
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b6a9d2ea372..799a285447b7 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -558,6 +558,7 @@ struct vb2_buf_ops {
  * @dma_dir:	DMA mapping direction.
  * @bufs:	videobuf2 buffer structures
  * @num_buffers: number of allocated/used buffers
+ * @num_planes: number of planes in each buffer
  * @queued_list: list of buffers currently queued from userspace
  * @queued_count: number of buffers queued and ready for streaming.
  * @owned_by_drv_count: number of buffers owned by the driver
@@ -621,6 +622,7 @@ struct vb2_queue {
 	enum dma_data_direction		dma_dir;
 	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
 	unsigned int			num_buffers;
+	unsigned int			num_planes;

 	struct list_head		queued_list;
 	unsigned int			queued_count;
