Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D7A686B3C
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbjBAQMF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjBAQMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:12:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7438A14497
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:11:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 28AA5B821C6
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175ABC433D2;
        Wed,  1 Feb 2023 16:11:55 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 1/8] vb2: set owner before calling vb2_read
Date:   Wed,  1 Feb 2023 17:11:46 +0100
Message-Id: <20230201161153.883376-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
References: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

Before vb2_read is called, the owner must be set since vb2_read will actually
start streaming. If vb2_read returns an error and q->fileio is NULL, then
it failed to start streaming and the owner is set back to NULL.

When the vb2 start_streaming callback is called, it expects the owner
pointer to be set, and that wasn't the case in this particular situation.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
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

