Return-Path: <linux-media+bounces-17366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6B968968
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73B11C20BF0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B040A210190;
	Mon,  2 Sep 2024 14:05:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3FE20FAA7
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285907; cv=none; b=L0dyd/3tmU6pW3nXZ44OlqZgYoQnbrhhtA+0qJJ0IaPqOLFVB4PO7v8ah/5UkTrsW1t7/KhiExWDC6WuqcYRPQtQrnnKGmwQy1NIYY6qpnfoNsCbHpuPrLhgK6J2+UrMPfKfxYu7CMaTPs6hq9t0xcJCfl+TfdZ9Fv17NLOWZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285907; c=relaxed/simple;
	bh=qocQgFApmNTAlylByfp1CdkP9lXyqE5m88bQtMAdCt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lR60lLLewSzDoofkzyQqg1MiBLFipgCUhZ9nUXsWR7xL8ys5yIp61MDb7W8nHlkltLSeCgLcCFp/Ux3SkM9xDmMoJGVhszYAsBpqa4hgXPlHn+wjRnUo0TWDdrl3isnYDIPPKO49c37BOArm2pzMoJE95XhcdlNlFXchV4uqPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A44C4CEC2;
	Mon,  2 Sep 2024 14:05:05 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Matt Ranostay <matt@ranostay.sg>
Subject: [PATCH 7/9] media: video-i2c: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:53 +0200
Message-Id: <42695db9edcf5e6b5ddebab59338eb88a5abcebe.1725285495.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
the future. So for those drivers that set the lock later, move it up to
before the vb2_queue_init() call.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Matt Ranostay <matt@ranostay.sg>
---
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..ffb3d9d61a74 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -798,13 +798,13 @@ static int video_i2c_probe(struct i2c_client *client)
 	queue->min_queued_buffers = 1;
 	queue->ops = &video_i2c_video_qops;
 	queue->mem_ops = &vb2_vmalloc_memops;
+	queue->lock = &data->queue_lock;
 
 	ret = vb2_queue_init(queue);
 	if (ret < 0)
 		goto error_unregister_device;
 
 	data->vdev.queue = queue;
-	data->vdev.queue->lock = &data->queue_lock;
 
 	snprintf(data->vdev.name, sizeof(data->vdev.name),
 				 "I2C %d-%d Transport Video",
-- 
2.34.1


