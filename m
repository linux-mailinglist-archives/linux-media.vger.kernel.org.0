Return-Path: <linux-media+bounces-20170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8629ADF1D
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57C98282C5B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 08:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E771A76AC;
	Thu, 24 Oct 2024 08:30:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FF16FF3B
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729758654; cv=none; b=WgE8u6S3ElL7nO0hJwNhyMAmqwiG+mpDGWj53MZlnQjMKtn1rPT/hc7n2xHDr7gkIghj81aQ9NZbKmOihTsLP5gWfLESuRzbHO5Z9FH4Hatjr7BFmIwVVL25AMYe78HEkjW55uHq5LZJW+ARWgI4mhAP5bzSW60DlXeqQO4DNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729758654; c=relaxed/simple;
	bh=f3RgNnHe9tUu07ad0mTuTuMr/PpstMME1tziHK0l1K0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nzp/AAhlOkeve7eO+pGBY7tSObLV+8aVu/do8iTpFvjcvhsp+we7ycS1uL7NNKv2E/cYZ9q0aXN5ENHBtQVdQBHwyL79HbfwvwapNTYXbGkG5IxBMndMQU/gpR3n7/p7lMsXRN4nS3imoXcUVBgMyqTss6geRjRBfhljLTmjoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE53C4CEC7;
	Thu, 24 Oct 2024 08:30:53 +0000 (UTC)
Message-ID: <47f231d4-1a76-40f0-a5c3-2285cb012a29@xs4all.nl>
Date: Thu, 24 Oct 2024 10:30:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 bugzilla-daemon@kernel.org
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v6.12] media: vivid: fix buffer overwrite when using > 32
 buffers
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The maximum number of buffers that can be requested was increased to
64 for the video capture queue. But video capture used a must_blank
array that was still sized for 32 (VIDEO_MAX_FRAME). This caused an
out-of-bounds write when using buffer indices >= 32.

Create a new define MAX_VID_CAP_BUFFERS that is used to access the
must_blank array and set max_num_buffers for the video capture queue.

This solves a crash reported by:

	https://bugzilla.kernel.org/show_bug.cgi?id=219258

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Fixes: cea70ed416b4 ("media: test-drivers: vivid: Increase max supported buffers for capture queues")
Cc: stable@vger.kernel.org
---
 drivers/media/test-drivers/vivid/vivid-core.c    | 2 +-
 drivers/media/test-drivers/vivid/vivid-core.h    | 4 +++-
 drivers/media/test-drivers/vivid/vivid-ctrls.c   | 2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 8d8f60e15d1d..7477ac8cb955 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -910,7 +910,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	 * videobuf2-core.c to MAX_BUFFER_INDEX.
 	 */
 	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		q->max_num_buffers = 64;
+		q->max_num_buffers = MAX_VID_CAP_BUFFERS;
 	if (buf_type == V4L2_BUF_TYPE_SDR_CAPTURE)
 		q->max_num_buffers = 1024;
 	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index cc18a3bc6dc0..d2d52763b119 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -26,6 +26,8 @@
 #define MAX_INPUTS 16
 /* The maximum number of outputs */
 #define MAX_OUTPUTS 16
+/* The maximum number of video capture buffers */
+#define MAX_VID_CAP_BUFFERS 64
 /* The maximum up or down scaling factor is 4 */
 #define MAX_ZOOM  4
 /* The maximum image width/height are set to 4K DMT */
@@ -481,7 +483,7 @@ struct vivid_dev {
 	/* video capture */
 	struct tpg_data			tpg;
 	unsigned			ms_vid_cap;
-	bool				must_blank[VIDEO_MAX_FRAME];
+	bool				must_blank[MAX_VID_CAP_BUFFERS];

 	const struct vivid_fmt		*fmt_cap;
 	struct v4l2_fract		timeperframe_vid_cap;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8bb38bc7b8cc..2b5c8fbcd0a2 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -553,7 +553,7 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case VIVID_CID_PERCENTAGE_FILL:
 		tpg_s_perc_fill(&dev->tpg, ctrl->val);
-		for (i = 0; i < VIDEO_MAX_FRAME; i++)
+		for (i = 0; i < MAX_VID_CAP_BUFFERS; i++)
 			dev->must_blank[i] = ctrl->val < 100;
 		break;
 	case VIVID_CID_INSERT_SAV:
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 69620e0a35a0..6a790ac8cbe6 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -213,7 +213,7 @@ static int vid_cap_start_streaming(struct vb2_queue *vq, unsigned count)

 	dev->vid_cap_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
-	for (i = 0; i < VIDEO_MAX_FRAME; i++)
+	for (i = 0; i < MAX_VID_CAP_BUFFERS; i++)
 		dev->must_blank[i] = tpg_g_perc_fill(&dev->tpg) < 100;
 	if (dev->start_streaming_error) {
 		dev->start_streaming_error = false;
-- 
2.45.2


