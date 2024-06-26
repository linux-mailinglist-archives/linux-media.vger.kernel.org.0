Return-Path: <linux-media+bounces-14170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082B917F30
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 13:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4D928324C
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AF117D8A8;
	Wed, 26 Jun 2024 11:07:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B71662E5
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719400071; cv=none; b=efMcT8mJodZi7Hl8ZD07C4FyALJWri9RF3DMi6JW2JEQqHTDKCyOr37ELZZAc1uIdORSxAXBOTMSq+u3wFkeSkib1xsQyk/cQnVDIKWbMdd0HvNkaVZ9O1x4i3aElr58UCGFaEWdbijrNhmbn7jOBblN5h9Yzs5Mn/X/r4WQq64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719400071; c=relaxed/simple;
	bh=96H8KoO8tlJoOQ/2VIP0n2Ct10OBDmpRBq6vsBtGwvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BN4QUqAfPSwo+kiqKIbLr7yFGC8K69ZSziiCrW8119XJ7p0IBtAIrWGsw/n/LFjQnm1cvIADu2y+lCt+2OQoA4JX9Zzd9WepDKNSUwd2d2jhQuFOXaIOdBVfyA2Q1JXVeBVb/YnTAWnShU6Uwol06qyDfTXiVgnHZWTfTJU4b2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81779C32789;
	Wed, 26 Jun 2024 11:07:50 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] media: vivid: fix wrong sizeimage value for mplane
Date: Wed, 26 Jun 2024 13:06:16 +0200
Message-ID: <ba657022879fedc8ae261f308e142525c64287b1.1719399977.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1719399977.git.hverkuil-cisco@xs4all.nl>
References: <cover.1719399977.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In several places a division by fmt->vdownsampling[p] was
missing in the sizeimage[p] calculation, causing incorrect
behavior for multiplanar formats were some planes are smaller
than the first plane.

Found by new v4l2-compliance tests.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |  5 +++--
 drivers/media/test-drivers/vivid/vivid-vid-out.c | 16 +++++++++-------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 2804975fe278..3a3041a0378f 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -106,8 +106,9 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
 		if (*nplanes != buffers)
 			return -EINVAL;
 		for (p = 0; p < buffers; p++) {
-			if (sizes[p] < tpg_g_line_width(&dev->tpg, p) * h +
-						dev->fmt_cap->data_offset[p])
+			if (sizes[p] < tpg_g_line_width(&dev->tpg, p) * h /
+					dev->fmt_cap->vdownsampling[p] +
+					dev->fmt_cap->data_offset[p])
 				return -EINVAL;
 		}
 	} else {
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 1653b2988f7e..7a0f4c61ac80 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -63,14 +63,16 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
 		if (sizes[0] < size)
 			return -EINVAL;
 		for (p = 1; p < planes; p++) {
-			if (sizes[p] < dev->bytesperline_out[p] * h +
-				       vfmt->data_offset[p])
+			if (sizes[p] < dev->bytesperline_out[p] * h /
+					vfmt->vdownsampling[p] +
+					vfmt->data_offset[p])
 				return -EINVAL;
 		}
 	} else {
 		for (p = 0; p < planes; p++)
-			sizes[p] = p ? dev->bytesperline_out[p] * h +
-				       vfmt->data_offset[p] : size;
+			sizes[p] = p ? dev->bytesperline_out[p] * h /
+					vfmt->vdownsampling[p] +
+					vfmt->data_offset[p] : size;
 	}
 
 	*nplanes = planes;
@@ -124,7 +126,7 @@ static int vid_out_buf_prepare(struct vb2_buffer *vb)
 
 	for (p = 0; p < planes; p++) {
 		if (p)
-			size = dev->bytesperline_out[p] * h;
+			size = dev->bytesperline_out[p] * h / vfmt->vdownsampling[p];
 		size += vb->planes[p].data_offset;
 
 		if (vb2_get_plane_payload(vb, p) < size) {
@@ -331,8 +333,8 @@ int vivid_g_fmt_vid_out(struct file *file, void *priv,
 	for (p = 0; p < mp->num_planes; p++) {
 		mp->plane_fmt[p].bytesperline = dev->bytesperline_out[p];
 		mp->plane_fmt[p].sizeimage =
-			mp->plane_fmt[p].bytesperline * mp->height +
-			fmt->data_offset[p];
+			mp->plane_fmt[p].bytesperline * mp->height /
+			fmt->vdownsampling[p] + fmt->data_offset[p];
 	}
 	for (p = fmt->buffers; p < fmt->planes; p++) {
 		unsigned stride = dev->bytesperline_out[p];
-- 
2.43.0


