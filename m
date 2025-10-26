Return-Path: <linux-media+bounces-45572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9472C0AFCE
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 19:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59343B39C6
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3987A222566;
	Sun, 26 Oct 2025 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JpCUwRVw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4D262A6
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 18:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761502128; cv=none; b=iY27XsMoYJsMrVF9IdDMG57Epgi2Z+dPXPDrwJFnK3ZAuBinltIv0rKTGtQeI1xBu/8A+YDg9MvdjMNNj7TQS+rLMTxtZDpAuGaW6jE2Hh08e55CwtHp/cyY/sDSPxh74g4C5mXieGA9iqOCzObMFe/ovXDU3f6YRG1Xhj+6wSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761502128; c=relaxed/simple;
	bh=4uFRVtVkdI+oez0+bRZgQhjmEhIZXLEeYGfwf1wxvjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1RMXNGoY0NLZJm4Q/KevgQ6yM3OKpVkAfJmQEgWXiZZ5bANOkfYC/KKozruubO4xY6exYjEiV55KAZwYGgR9x3vGsurgSjaidlvr37ul1C2qDnCQ5rU8lEDeR9taBjMK0h/PANF38F+4PwvE+D/d9VSfhi1C7UxVRWGyTRQFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JpCUwRVw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05BD92B3;
	Sun, 26 Oct 2025 19:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761502017;
	bh=4uFRVtVkdI+oez0+bRZgQhjmEhIZXLEeYGfwf1wxvjk=;
	h=From:To:Cc:Subject:Date:From;
	b=JpCUwRVwcRkFS6mx95d41QZMeRTTPh2aG5KzXFJ7XXHYsw+n9+/AsGJBRhRzoYL8x
	 JW/2MAro9orqs4r5r6GEtQ+o3g4IOlYLuCi1Ti/8Xx7SJ4EZLqD/UjY8iMKcYObeke
	 Sj1indwryoty4ArDRmLRkxJ9IUhbZ2V79Uq2l2vk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: saa7146: Replace saa7146_ext_vv.vbi_fops with write function
Date: Sun, 26 Oct 2025 20:08:29 +0200
Message-ID: <20251026180829.12948-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vbi_fops stored in struct saa7146_ext_vv is a full
v4l2_file_operations, but only its .write field is used. Replace it with
a single vbi_write function pointer to save memory.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/common/saa7146/saa7146_fops.c | 4 ++--
 drivers/staging/media/av7110/av7110_v4l.c   | 4 ++--
 include/media/drv-intf/saa7146_vv.h         | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 9d0362a75ecd..a9e3bad76d54 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -186,11 +186,11 @@ static ssize_t fops_write(struct file *file, const char __user *data, size_t cou
 	struct saa7146_dev *dev = video_drvdata(file);
 	int ret;
 
-	if (vdev->vfl_type != VFL_TYPE_VBI || !dev->ext_vv_data->vbi_fops.write)
+	if (vdev->vfl_type != VFL_TYPE_VBI || !dev->ext_vv_data->vbi_write)
 		return -EINVAL;
 	if (mutex_lock_interruptible(vdev->lock))
 		return -ERESTARTSYS;
-	ret = dev->ext_vv_data->vbi_fops.write(file, data, count, ppos);
+	ret = dev->ext_vv_data->vbi_write(file, data, count, ppos);
 	mutex_unlock(vdev->lock);
 	return ret;
 }
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 04e659243f02..200a7a29ea31 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -940,7 +940,7 @@ static struct saa7146_ext_vv av7110_vv_data_st = {
 	.num_stds	= ARRAY_SIZE(standard),
 	.std_callback	= &std_callback,
 
-	.vbi_fops.write	= av7110_vbi_write,
+	.vbi_write	= av7110_vbi_write,
 };
 
 static struct saa7146_ext_vv av7110_vv_data_c = {
@@ -953,6 +953,6 @@ static struct saa7146_ext_vv av7110_vv_data_c = {
 	.num_stds	= ARRAY_SIZE(standard),
 	.std_callback	= &std_callback,
 
-	.vbi_fops.write	= av7110_vbi_write,
+	.vbi_write	= av7110_vbi_write,
 };
 
diff --git a/include/media/drv-intf/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
index 55c7d70b9feb..f66f4dfccf14 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -130,7 +130,8 @@ struct saa7146_ext_vv
 	/* pointer to the saa7146 core ops */
 	const struct v4l2_ioctl_ops *core_ops;
 
-	struct v4l2_file_operations vbi_fops;
+	ssize_t (*vbi_write)(struct file *file, const char __user *data,
+			     size_t count, loff_t *ppos);
 };
 
 struct saa7146_use_ops  {

base-commit: ea299a2164262ff787c9d33f46049acccd120672
-- 
Regards,

Laurent Pinchart


