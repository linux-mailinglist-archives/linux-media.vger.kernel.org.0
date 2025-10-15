Return-Path: <linux-media+bounces-44541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE68BDD3DF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C17D4FC477
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEB431577D;
	Wed, 15 Oct 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OSJzCGp/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A1314A97
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514882; cv=none; b=acL+i+sjP5B28FwTulhjdpbma62O+4jqvz8jMntc7fPu0mSGvHwlJcxGwS0KxrCeUi9nvxo36IWmmi7bMac7U4+ZRe6+m9025MtJo/0lC+b83Vj7yjzjjnIMrGEpAQUKHu5t3YVmqfZFHBgfWmhKggOrEeUtMFEPf8mOOLwokJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514882; c=relaxed/simple;
	bh=5ExTISueDck3eSzbG+2J0OnMYAZSzfIqlIz/5v8IkXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaT7xkD5SVa4d8p6K/iXf69qPQEiTw4elSXGp8wyS84WJ+Lcp+PvXKGtfz1wOs3kjn6rMFolQYTZIupL6Dz9eEDnbTYAagp04H7Kca++CxOqBmJHp40ceMQbmk63rs7GrUOhuoUfSYDTKaGWkhF+JcoDFJ/zD9pG5DnecPRXozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OSJzCGp/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3DCF2EB7;
	Wed, 15 Oct 2025 09:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514781;
	bh=5ExTISueDck3eSzbG+2J0OnMYAZSzfIqlIz/5v8IkXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSJzCGp/OGDmtCa1RdEbaSDUWuAdiS36cuonfnmCOD6KPf5as7LYT/+Zu5muusOfh
	 /+SHP0zzzDg5pdxg56e++E3QZhzrpkw8ockv8M+Slt8rAM7c1Hrctt44+8AZRYurLJ
	 vhtqMldNt0QqSGLROw0te5v5fAvjWih0T9ZTGJz4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 21/25] media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:44 +0300
Message-ID: <20251015075353.22625-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handler, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handler, the return value is not used for any purpose
other than the NULL check, which was therefore probably intended to
catch invalid format types. That's not needed for the same reason as in
the set format handler.

Drop the unneeded return value check and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 81792f7f8b16..ff28482759ec 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -1332,15 +1332,10 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
 
 static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
 
-	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    ct->mode == S5P_JPEG_DECODE && !ct->hdr_parsed)
 		return -EINVAL;
@@ -1593,8 +1588,6 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
 	unsigned int f_type;
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ct, f->type);
 	BUG_ON(q_data == NULL);
-- 
Regards,

Laurent Pinchart


