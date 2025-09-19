Return-Path: <linux-media+bounces-42755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C1B88B19
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B324D52629C
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EF92FC01D;
	Fri, 19 Sep 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v/M+MsW1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82592FC009;
	Fri, 19 Sep 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275843; cv=none; b=Hazrys5UKhwEptLG0mVcwjrT/ggwHcdkTAHzRjdJ010JPzmp9G5wcVYtX6Z9tCDt/8rxSM5tM6htgTZhbBcs4jPWCoAYSMM5fU9baIXP0UyT1A4R5LzNMUvh/xQse7toVQxG6IJcmT6bOEu6b3R9CXuqbU/VP9K3/UAdsjzbVK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275843; c=relaxed/simple;
	bh=EGyzaOAYIWCgqy6phWNjNHZtVGmdItNrAOIT40wwqKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OusoFBW4kJ7FJcVyJdkRlPnDT95+fTyj1TvV9FcAgzTUBLbILcxRd8O7Y4Yq5cV3p0WsdtguHLL6TTTr1D1/t/TsuAbtVUlOCaJ2qoUlTQHYZfT9Gy2RFzYahUTx9QX+xuCglVJW/zKorypVvbxCPgSOzZXFjHlCt+QCWTmbfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v/M+MsW1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA17F842;
	Fri, 19 Sep 2025 11:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275760;
	bh=EGyzaOAYIWCgqy6phWNjNHZtVGmdItNrAOIT40wwqKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v/M+MsW1CXmwOugw92xk6gCk6HWgTNMXhPCjg1dmX2KeJxpk8UlfEbsOM6L1ZMBHw
	 0UJYkDbS9WIROxpTbMA85rKfA7b8eEQDXmlrILkH/8cJ/rRKwnvhJFoYzW1eGc+yGR
	 I5cC2qUbPHtF8qPrnQuCOnVyqhm/zAIuu9GcKNhI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:25:56 +0530
Subject: [PATCH v2 04/10] media: v4l2-dev: Add helpers to get current
 format from the state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-4-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Ma Ke <make24@iscas.ac.cn>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add a helper function that drivers can call to retrieve the current
v4l2_format stored in a video device state for internal use.

Additionally, provide a G_FMT ioctl implementation that drivers can use
instead of writing their own when the format is stored in the active
state.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/v4l2-core/v4l2-dev.c | 23 +++++++++++++++++++++++
 include/media/v4l2-dev.h           | 18 ++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index dff23c6a0b56fb3d29e1c04e386bb445fa8773bb..2606077538be0e83032c6ae8956c1d67da0d0c5d 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -199,6 +199,29 @@ void __video_device_state_free(struct video_device_state *state)
 }
 EXPORT_SYMBOL_GPL(__video_device_state_free);
 
+struct v4l2_format *video_device_state_get_fmt(struct video_device_state *state)
+{
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	return &state->fmt;
+}
+EXPORT_SYMBOL_GPL(video_device_state_get_fmt);
+
+int video_device_g_fmt(struct file *file, void *priv, struct v4l2_format *fmt)
+{
+	struct video_device_state *state = priv;
+	struct v4l2_format *vfmt = video_device_state_get_fmt(state);
+
+	if (!vfmt)
+		return -EINVAL;
+
+	*fmt = *vfmt;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(video_device_g_fmt);
+
 static inline void video_get(struct video_device *vdev)
 {
 	get_device(&vdev->dev);
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index d327be16f6def70554a7d92d10436a29384ae32a..b5312823fbff9c236d4394d48fa9a14412b17c68 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -612,6 +612,24 @@ __video_device_state_alloc(struct video_device *vdev,
  */
 void __video_device_state_free(struct video_device_state *state);
 
+/**
+ * video_device_state_get_fmt - get current v4l2_format.
+ *
+ * @state: pointer to struct video_device_state
+ */
+struct v4l2_format *
+video_device_state_get_fmt(struct video_device_state *state);
+
+/**
+ * video_device_g_fmt - fill v4l2_format from the state.
+ *
+ * @file: pointer to struct file
+ * @state: pointer to struct video_device_state
+ * @format: pointer to struct v4l2_format
+ */
+int video_device_g_fmt(struct file *file, void *priv,
+		       struct v4l2_format *format);
+
 /**
  * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
  *

-- 
2.51.0


