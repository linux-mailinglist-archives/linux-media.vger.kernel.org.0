Return-Path: <linux-media+bounces-17364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DD968966
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1C71F227EE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0027720FAB5;
	Mon,  2 Sep 2024 14:05:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EF20FAA7
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285904; cv=none; b=byZ6D/RzFVSfzO3VB1vqBMB487sPZlfOEpQSxElAf9j/g1OI+gikGT/g9t9YhntYiN23jkvtZtEYb5G/AyAqpS21llzGRaxpzboPkwW6CjXlTmnjDaCEz0SxkyaJtG4pEsfT+VY4b1JFa9ux4HzeTdqVLC1wwMNYoBUIvquy1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285904; c=relaxed/simple;
	bh=a5mhb6v74NOvJXgvSCwpp0T/xk+4D68DXSQa4Hg6REY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sUGpqAka/9PYdLoS/HtkrASemfTwSuI88gq+xTn8A8I+xRxQeYICDKW3SXJAVBrm+4+j44WVghFIW0GmN7zXMu2PxXwJZHDL7lIV0xDblBZBsUSJcY6abMTMyJOTOcH85dc8/IJXk3aHq6Uex7oS3HpdlkIgXoYI6h5tXhSqmH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC8C4CEC7;
	Mon,  2 Sep 2024 14:05:03 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/9] media: airspy: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:51 +0200
Message-Id: <50a4adc0487018bb51328142c05d636e7663ef55.1725285495.git.hverkuil-cisco@xs4all.nl>
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
---
 drivers/media/usb/airspy/airspy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index e24e655fb1db..3e2a3099a8fe 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -1017,6 +1017,7 @@ static int airspy_probe(struct usb_interface *intf,
 	s->vb_queue.ops = &airspy_vb2_ops;
 	s->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	s->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	s->vb_queue.lock = &s->vb_queue_lock;
 	ret = vb2_queue_init(&s->vb_queue);
 	if (ret) {
 		dev_err(s->dev, "Could not initialize vb2 queue\n");
@@ -1026,7 +1027,6 @@ static int airspy_probe(struct usb_interface *intf,
 	/* Init video_device structure */
 	s->vdev = airspy_template;
 	s->vdev.queue = &s->vb_queue;
-	s->vdev.queue->lock = &s->vb_queue_lock;
 	video_set_drvdata(&s->vdev, s);
 
 	/* Register the v4l2_device structure */
-- 
2.34.1


