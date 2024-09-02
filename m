Return-Path: <linux-media+bounces-17362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37621968964
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1DA9282633
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCB621019E;
	Mon,  2 Sep 2024 14:05:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEC20FABF
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285902; cv=none; b=u161Q+CvWF7Agdax3oRQ3WGFp1/WlgDcQpw3/8CHZqcATDTgvW5InDF/elSSZWGE6zRq0TnKvKcb1MLxWnEu0kI/nrGcG/MWLE6r5Y1TTPZgJiCnyLzY5QIM6A0G0S/jQdDIClkwjp6YdA3jE4+ZlWfdgura9KXW3fFIWjvSlK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285902; c=relaxed/simple;
	bh=r74W7yK9+SJCeh9zZtQUtFI1tpP/sE7ruD+Blw7PfNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OGRUc+/rE9y0XcWcgMftAAVi4LOOoPHlboL7OKGL2y0KJaWiJuDpeNl0BqHitzaaJBwMaemQi1I7JBAU9gEtY1MY2DAL6MUE2UOs3G2UuYL8ClDA6HmNlqC0bIjP9xxXhMc0vMbqJBwMnRJQpLNIgS4hZIAnRqNObvNjXpWKZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443B7C4CEC2;
	Mon,  2 Sep 2024 14:05:01 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/9] media: msi2500: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:49 +0200
Message-Id: <73b2b7bc2fb62415365a06ad413dea93c316cf92.1725285495.git.hverkuil-cisco@xs4all.nl>
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
 drivers/media/usb/msi2500/msi2500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 5138486abfa0..c42fad1e3204 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1199,6 +1199,7 @@ static int msi2500_probe(struct usb_interface *intf,
 	dev->vb_queue.ops = &msi2500_vb2_ops;
 	dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	dev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	dev->vb_queue.lock = &dev->vb_queue_lock;
 	ret = vb2_queue_init(&dev->vb_queue);
 	if (ret) {
 		dev_err(dev->dev, "Could not initialize vb2 queue\n");
@@ -1208,7 +1209,6 @@ static int msi2500_probe(struct usb_interface *intf,
 	/* Init video_device structure */
 	dev->vdev = msi2500_template;
 	dev->vdev.queue = &dev->vb_queue;
-	dev->vdev.queue->lock = &dev->vb_queue_lock;
 	video_set_drvdata(&dev->vdev, dev);
 
 	/* Register the v4l2_device structure */
-- 
2.34.1


