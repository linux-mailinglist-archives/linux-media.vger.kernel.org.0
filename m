Return-Path: <linux-media+bounces-16040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD694CBEB
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB568284A13
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9082B18DF62;
	Fri,  9 Aug 2024 08:13:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D41C8D1;
	Fri,  9 Aug 2024 08:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191195; cv=none; b=l1dMq7UZMkVy+fZeFs5+Kp2Zy0dGohE/E6W9LRGrT8Yj0yUyd+W5glUX25TGjKyCkEEcVqaBJIP4HyNpNibXSooLWbqIfpLUzdlQeoogW3NgJOr1HriheFSjmPMU0MU6KI3o9A5SlOXu8bH9gWylMdHy+8B+0a94G0/hQiW84Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191195; c=relaxed/simple;
	bh=EidSH5+sb9Lpbsqqu6Jugt+7B0No6uJBVNASD2UBQ00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcpsZCQRhAvGzJaI4k/gzs7mAf1eF8/lFp/p5cg/wJicTQunSPpYtuAHM7C5DlU4MpkMQb2zOJaMw63kBlwQUsNvInpnNqNtUM2AIP/lXSwhXSjSEa3bWw4w00zNmGQiQk9277Co4E7hpmkZoqHUaTjDuc+aR7748crow5rim6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00786C32782;
	Fri,  9 Aug 2024 08:13:13 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/6] media: v4l2-dev: handle V4L2_CAP_EDID
Date: Fri,  9 Aug 2024 09:57:34 +0200
Message-ID: <f88991fc4c197ef0e32f05b2f509980183aef012.1723190258.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erling Ljunggren <hljunggr@cisco.com>

When the V4L2_CAP_EDID capability flag is set,
ioctls for enum inputs/outputs and get/set edid are automatically set.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index be2ba7ca5de2..570ba00e00b3 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -557,6 +557,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
 	bool has_streaming = vdev->device_caps & V4L2_CAP_STREAMING;
+	bool is_edid =  vdev->device_caps & V4L2_CAP_EDID;
 
 	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
 
@@ -784,6 +785,20 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
 		SET_VALID_IOCTL(ops, VIDIOC_S_HW_FREQ_SEEK, vidioc_s_hw_freq_seek);
 	}
+	if (is_edid) {
+		SET_VALID_IOCTL(ops, VIDIOC_G_EDID, vidioc_g_edid);
+		if (is_tx) {
+			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
+			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
+			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
+		}
+		if (is_rx) {
+			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
+		}
+	}
 
 	bitmap_andnot(vdev->valid_ioctls, valid_ioctls, vdev->valid_ioctls,
 			BASE_VIDIOC_PRIVATE);
-- 
2.43.0


