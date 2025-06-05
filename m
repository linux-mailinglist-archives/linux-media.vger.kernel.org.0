Return-Path: <linux-media+bounces-34088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C04ACEA9F
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DFC13A4460
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CFD1F7904;
	Thu,  5 Jun 2025 07:05:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174F2C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107147; cv=none; b=AyDz7uTaQwcgI3C0zzzUafet+MMNw2LySeXYNKCHyqpsSdlgfoCMTkCOq07iA1ehxTRIS+ZWq8zDbIt+YvwykEHgMpIl0viCaX8N/VGSQD/43AGbA76AVzfO8QLxfT8XxAOQCgAWuurwSG9FPhrRQWaXq7Osf3A6/SnysZg+4mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107147; c=relaxed/simple;
	bh=YXA+mp+j9JF82EH8XyDAfv7iPP+EN8RFjstK02cKPxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5isF86fptHv92guqlszzCXnQGihPgkAzICphgO9pxb9ZDNNjPc9rrA54kxaVnaQDM+8MDS0SxGbYajY4cny5xXDG/vB4xjG++jwnITFKLCbkjMIpNIyGkrnstzt8T1VIdb3AqjNISd2bfDWtZce7kKctxzKi8Ov/tBLmHeCqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6CDC4CEF0;
	Thu,  5 Jun 2025 07:05:45 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/5] media: dvb-core/dmxdev: drop locks around mmap()
Date: Thu,  5 Jun 2025 08:57:36 +0200
Message-ID: <fc61f3fc50089264b5e875c4548bce9ed6046fae.1749106659.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749106659.git.hverkuil@xs4all.nl>
References: <cover.1749106659.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vb2 no longer requires locking around mmap since commit
f035eb4e976e ("[media] videobuf2: fix lockdep warning").

Since the streaming I/O mode for DVB support is by default off, and
the dvb utilities were never updated with streaming support, and
we never had regression tests for this streaming mode, this was
never noticed before.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/dvb-core/dmxdev.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index e4cf5e6bb542..ffeedb0c0950 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1216,24 +1216,11 @@ static int dvb_demux_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct dmxdev_filter *dmxdevfilter = file->private_data;
 	struct dmxdev *dmxdev = dmxdevfilter->dev;
-	int ret;
 
 	if (!dmxdev->may_do_mmap)
 		return -ENOTTY;
 
-	if (mutex_lock_interruptible(&dmxdev->mutex))
-		return -ERESTARTSYS;
-
-	if (mutex_lock_interruptible(&dmxdevfilter->mutex)) {
-		mutex_unlock(&dmxdev->mutex);
-		return -ERESTARTSYS;
-	}
-	ret = dvb_vb2_mmap(&dmxdevfilter->vb2_ctx, vma);
-
-	mutex_unlock(&dmxdevfilter->mutex);
-	mutex_unlock(&dmxdev->mutex);
-
-	return ret;
+	return dvb_vb2_mmap(&dmxdevfilter->vb2_ctx, vma);
 }
 #endif
 
@@ -1366,7 +1353,6 @@ static int dvb_dvr_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct dvb_device *dvbdev = file->private_data;
 	struct dmxdev *dmxdev = dvbdev->priv;
-	int ret;
 
 	if (!dmxdev->may_do_mmap)
 		return -ENOTTY;
@@ -1374,12 +1360,7 @@ static int dvb_dvr_mmap(struct file *file, struct vm_area_struct *vma)
 	if (dmxdev->exit)
 		return -ENODEV;
 
-	if (mutex_lock_interruptible(&dmxdev->mutex))
-		return -ERESTARTSYS;
-
-	ret = dvb_vb2_mmap(&dmxdev->dvr_vb2_ctx, vma);
-	mutex_unlock(&dmxdev->mutex);
-	return ret;
+	return dvb_vb2_mmap(&dmxdev->dvr_vb2_ctx, vma);
 }
 #endif
 
-- 
2.47.2


