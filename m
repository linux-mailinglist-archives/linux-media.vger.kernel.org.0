Return-Path: <linux-media+bounces-7110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A987CA43
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF68283DDC
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E391798A;
	Fri, 15 Mar 2024 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="wTD5x/4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469D1757A
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710492748; cv=none; b=TDzWRjhU9s8zAj9c44GcPp2TA0w/9NTLWq5CrLPFvOQJDskJXaXisN0ePgjlX19vETK7ik93gL3ZQLosP/GASHSZeQsIdGnbpebgEUCL56tgvcRysTZKX88SbLXG097Y9mkR8d6Ln8xhyNswSZvcHNw2+f6GiCcZ70kFzt8dX/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710492748; c=relaxed/simple;
	bh=DDOtIr3XAoQXaip1wtwaI4NIljM7dI2HA6Kp+jDOJW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdxQnt8u+rJLRSBAT4OJFSjH8nlwYao87yUpGZexeo4yLCZ9JE7tYIQndzxBirJLf/6bAW+AoFvr73rYKosvyh4lgpiLJCyk0BZY5CVhOtYpp5qnoobLtM4kSinEB/rle0sqkGpddBaDSDo9rv0IJaYMfzp9ZQRU2eR9e58T+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=wTD5x/4Y; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710492744;
	bh=DDOtIr3XAoQXaip1wtwaI4NIljM7dI2HA6Kp+jDOJW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wTD5x/4YcvuJECNsGF2kPOK4740f57OHhkXctDM3e9bk5lURD1TdK8VK9jH/UUBsh
	 DQdvfoymjURrzMZ9mxCGSb6toSKUFgjeqCoRUKPNHwGWI0usGYI3n/SR38R3cnxiE9
	 xqHJaQrExZzVKe1ZLPwYemdxVWqhMzNlfXUbvC4FD2dQHJfQ2wGavyXcP8Y7nA+uyJ
	 95ewhsUF8YawzbqhSR/8DSGYt8t0c7AzzyPjz+tbCl2IQB7n2Cqq1+RIwCG2obiMPz
	 XAPjT0B6j0qvR91tBvtQuqYqTaRO9VFTb5Jz3xi9jkXovL5cSGpI7uZK6IA+mQ2FT5
	 C6JkqKrNQ+tkw==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 706F7378210D;
	Fri, 15 Mar 2024 08:52:24 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 3/4] media: i2c: st-vgxy61: Switch to {enable,disable}_streams
Date: Fri, 15 Mar 2024 09:51:57 +0100
Message-ID: <20240315085158.1213159-4-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315085158.1213159-1-julien.massot@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/st-vgxy61.c | 37 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index e8302456a8d9..754853378ee6 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -420,7 +420,7 @@ struct vgxy61_dev {
 	struct v4l2_ctrl *vblank_ctrl;
 	struct v4l2_ctrl *vflip_ctrl;
 	struct v4l2_ctrl *hflip_ctrl;
-	bool streaming;
+	u8 streaming;
 	struct v4l2_mbus_framefmt fmt;
 	const struct vgxy61_mode_info *sensor_modes;
 	unsigned int sensor_modes_nb;
@@ -1188,20 +1188,35 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
 	return ret;
 }
 
-static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
+static int vgxy61_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
-	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
-
-	ret = enable ? vgxy61_stream_enable(sensor) :
-	      vgxy61_stream_disable(sensor);
+	if (!sensor->streaming)
+		ret = vgxy61_stream_enable(sensor);
 	if (!ret)
-		sensor->streaming = enable;
+		sensor->streaming |= streams_mask;
 
-	v4l2_subdev_unlock_state(sd_state);
+	return ret;
+}
+
+static int vgxy61_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
+	int ret;
+
+	sensor->streaming &= ~streams_mask;
+	if (sensor->streaming)
+		return 0;
+
+	ret = vgxy61_stream_disable(sensor);
+	if (!ret)
+		sensor->streaming = false;
 
 	return ret;
 }
@@ -1496,7 +1511,7 @@ static const struct v4l2_subdev_core_ops vgxy61_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops vgxy61_video_ops = {
-	.s_stream = vgxy61_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
@@ -1506,6 +1521,8 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
 	.get_frame_desc = vgxy61_get_frame_desc,
 	.get_selection = vgxy61_get_selection,
 	.enum_frame_size = vgxy61_enum_frame_size,
+	.enable_streams = vgxy61_enable_streams,
+	.disable_streams = vgxy61_disable_streams,
 };
 
 static const struct v4l2_subdev_ops vgxy61_subdev_ops = {
-- 
2.44.0


