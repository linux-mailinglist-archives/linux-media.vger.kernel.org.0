Return-Path: <linux-media+bounces-17361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFB968963
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22B1C2819F9
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A822B20FA87;
	Mon,  2 Sep 2024 14:05:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E8A20FABF
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285901; cv=none; b=G/tkQ6vH26gT7X6YjQL/dbOTmx2Nc70Ndd1rTjE7VoSs1ZN3KmQ1gI7uMkpSkTSDkWbnsIfXYBm28BoR4rT/NiKinzJAZGXxmkQscN00GCrGdZd+T11wrP4rHzs5mD3JJPZhn6h9VcUBiKy0JKaDlKcWFK+cWAo5P5/T7q+QtZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285901; c=relaxed/simple;
	bh=SnCFrn9OJ0JErQKuzU1W8WBuxbknu/9O2wMs9q4gnHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hyp3WtDWaJ67rur1NNd5HmYeJyYbxWma4f83Q+z6hl7WpP5ucG3B2vg6+nXUog2rHy6U765+yddSS4NEWGHIDlvO8nMYeWIhRF/9JmiQ7U3m758FfVZxJqWgYQvQyPOxYAN+VPE7eaWCwsWPKBjGYnFA11xRKc2mYefxUjVblgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A75DC4CEC7;
	Mon,  2 Sep 2024 14:04:59 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/9] media: pwc: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:48 +0200
Message-Id: <91ca5c3db14df7b8d8dc4189aa73ed38ca97975e.1725285495.git.hverkuil-cisco@xs4all.nl>
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
 drivers/media/usb/pwc/pwc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index e342199711d3..4a8485ea0c81 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -1054,6 +1054,7 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 	pdev->vb_queue.ops = &pwc_vb_queue_ops;
 	pdev->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	pdev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	pdev->vb_queue.lock = &pdev->vb_queue_lock;
 	rc = vb2_queue_init(&pdev->vb_queue);
 	if (rc < 0) {
 		PWC_ERROR("Oops, could not initialize vb2 queue.\n");
@@ -1064,7 +1065,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 	pdev->vdev = pwc_template;
 	strscpy(pdev->vdev.name, name, sizeof(pdev->vdev.name));
 	pdev->vdev.queue = &pdev->vb_queue;
-	pdev->vdev.queue->lock = &pdev->vb_queue_lock;
 	video_set_drvdata(&pdev->vdev, pdev);
 
 	pdev->release = le16_to_cpu(udev->descriptor.bcdDevice);
-- 
2.34.1


