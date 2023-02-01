Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC26B686BAE
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjBAQ3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjBAQ3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:29:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112B340F4
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:28:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 529B661827
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12ADC433EF;
        Wed,  1 Feb 2023 16:28:53 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 1/8] vb2: set owner before calling vb2_read
Date:   Wed,  1 Feb 2023 17:28:43 +0100
Message-Id: <20230201162850.886563-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
References: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before vb2_read is called, the owner must be set since vb2_read will
actually start streaming. If vb2_read returns an error and q->fileio is
NULL, then it failed to start streaming and the owner is set back to NULL.

When the vb2 start_streaming callback is called, it expects the owner
pointer to be set, and that wasn't the case in this particular situation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 1f5d235a8441..c7a54d82a55e 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1171,10 +1171,11 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
 		return -ERESTARTSYS;
 	if (vb2_queue_is_busy(vdev->queue, file))
 		goto exit;
+	vdev->queue->owner = file->private_data;
 	err = vb2_read(vdev->queue, buf, count, ppos,
 		       file->f_flags & O_NONBLOCK);
-	if (vdev->queue->fileio)
-		vdev->queue->owner = file->private_data;
+	if (!vdev->queue->fileio)
+		vdev->queue->owner = NULL;
 exit:
 	if (lock)
 		mutex_unlock(lock);
-- 
2.39.0

