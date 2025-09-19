Return-Path: <linux-media+bounces-42757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A902BB88B40
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5497C078C
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E392F8BDC;
	Fri, 19 Sep 2025 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fCn2SfwH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933902F83BA;
	Fri, 19 Sep 2025 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275866; cv=none; b=mZ2ZKLwXpW27ZmuR4dU3fZy7bQwToCxSAUhdVtZANBaBfJ2+1oJtfpuZ7Ol1t8Scgi7jsw2W2HqFWKrI2e+dbMzYfpdLRm66LhcQ+bUfH6UOt8Y3Fo5B0pZO1t+Duj3skdn2rqSJRKZefWbZQUddK35zVrVNLO4IlUzURjQXE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275866; c=relaxed/simple;
	bh=XNnJ6n8emPTeuOsinNTjhgf/eEcs0/njtyMq0631uec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhmEdT9SPcCtzTIALWCf4kF5b/CGcFrr2C0Qzz9qCIskmvIGDISdqC/MqjUFtVLjKQTj6BmE92JHcBnU5pPuJgMrHKYrY8II1/kDbBHPFjQCT3h3uOnLAoJN5QgzicSKBpYQnfNOaKLTuzs1NHS6f/cHjv8Kq3+Z5WLXLOGxbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fCn2SfwH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB4C6D3E;
	Fri, 19 Sep 2025 11:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275782;
	bh=XNnJ6n8emPTeuOsinNTjhgf/eEcs0/njtyMq0631uec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fCn2SfwH3pbehC5d6BM5q6QCWLF+LLW5iGQGSe+Lqyrsg75wVZUexcsTukx7BZPr+
	 WAaKU9z8DRFW6VKaCOwjum4Nnszb1mfYYA4SKlh474OaAYizRlPKzI3uQrL00y8txT
	 WcFbM8Pn/vZmn1pSKImztVpi3H/W0m3ZdeqZdu+4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:25:59 +0530
Subject: [PATCH v2 07/10] media: v4l2-ioctl: Pass device state for
 G/S/TRY_FMT ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-7-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Now that video device state is accepted as an argument in ioctl
implementations across all video device drivers, populate that argument
with the actual state data.

Pass the active state for G_FMT and S_FMT ioctls, and the try state for
TRY_FMT ioctl to drivers that have opted to use device state for format
storage.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 644f06521673ff7ce5b194335d50f0e375ca7f51..500fc20627c97ce70016f4524301835142b7bebd 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3070,6 +3070,21 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
 }
 EXPORT_SYMBOL(v4l_printk_ioctl);
 
+static struct video_device_state *
+video_device_get_state(struct video_device *vfd, struct v4l2_fh *vfh,
+		       unsigned int cmd)
+{
+	switch (cmd) {
+	default:
+		return NULL;
+	case VIDIOC_G_FMT:
+	case VIDIOC_S_FMT:
+		return vfd->state;
+	case VIDIOC_TRY_FMT:
+		return vfh->state;
+	}
+}
+
 static long __video_do_ioctl(struct file *file,
 		unsigned int cmd, void *arg)
 {
@@ -3078,6 +3093,7 @@ static long __video_do_ioctl(struct file *file,
 	struct mutex *lock; /* ioctl serialization mutex */
 	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
 	bool write_only = false;
+	struct video_device_state *state = NULL;
 	struct v4l2_ioctl_info default_info;
 	const struct v4l2_ioctl_info *info;
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -3090,6 +3106,9 @@ static long __video_do_ioctl(struct file *file,
 		return ret;
 	}
 
+	if (test_bit(V4L2_FL_USES_STATE, &vfd->flags))
+		state = video_device_get_state(vfd, vfh, cmd);
+
 	/*
 	 * We need to serialize streamon/off with queueing new requests.
 	 * These ioctls may trigger the cancellation of a streaming
@@ -3138,11 +3157,11 @@ static long __video_do_ioctl(struct file *file,
 
 	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
 	if (info != &default_info) {
-		ret = info->func(ops, file, NULL, arg);
+		ret = info->func(ops, file, state, arg);
 	} else if (!ops->vidioc_default) {
 		ret = -ENOTTY;
 	} else {
-		ret = ops->vidioc_default(file, NULL,
+		ret = ops->vidioc_default(file, state,
 			v4l2_prio_check(vfd->prio, vfh->prio) >= 0,
 			cmd, arg);
 	}

-- 
2.51.0


