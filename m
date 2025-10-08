Return-Path: <linux-media+bounces-44002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F858BC634B
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821EE4005BE
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7762C1586;
	Wed,  8 Oct 2025 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wgyKBxv5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3FD2C0323
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945898; cv=none; b=JyTKztOn5ztobXUGr5m58tHduNY5sHiRmwPJ+nP6WM9gKwbRWLlB5hOwDKe9QBp8py1P2cTY6CoPN2xdSemEHqN6iTe+VNXgaVi+xTTe34u1MuissYMDFVnsM7C5f+mqG2hzvFp1JhHXA7A/g0JNEP6vIl6xRLExTo9O92x1t8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945898; c=relaxed/simple;
	bh=gx+Glh8duh7DqoFhEgViN0JYENyz0PE6i6OYcitpfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBn06o0I06boBm4mxWPE4u7w+J8BD3ug9tzFTdtmKZJdgVmSSLoL/UV/yXZ6uOQF5VSLafJmszq64E24M2o4cWOm2fefzEtZFV3zu37GprIMqUzm50pP6EFuKK8Qv0LsbgP1MaV4PFwrMB2Jk6LjFjYBLyDDC/AggxhWgO8daYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wgyKBxv5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4306519C4;
	Wed,  8 Oct 2025 19:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945801;
	bh=gx+Glh8duh7DqoFhEgViN0JYENyz0PE6i6OYcitpfHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wgyKBxv5sTp1/Vu7/X3Wo8XH0VB7T36rPnqqckpAKNDWqDsY58FyO6ErdO371YTvx
	 X313J5KYSvLm12kCFKngBiWdwK/V/+qla41a10Tx9hZwzJkAoRVTp5euKveF+Ooc2R
	 akD9KHSLXFbA5xshEURIZuh2U22gjYLC51mH1G0g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 21/25] media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:48 +0300
Message-ID: <20251008175052.19925-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
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
index ac4cf269456a..3211e9d0fda7 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -1333,15 +1333,10 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
 
 static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
 
-	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    ct->mode == S5P_JPEG_DECODE && !ct->hdr_parsed)
 		return -EINVAL;
@@ -1594,8 +1589,6 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
 	unsigned int f_type;
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ct, f->type);
 	BUG_ON(q_data == NULL);
-- 
Regards,

Laurent Pinchart


