Return-Path: <linux-media+bounces-44544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6EABDD3D0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8823BA388
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B14F315D2F;
	Wed, 15 Oct 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YZyGqsNY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D225315D5F
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514888; cv=none; b=u0luq00/3ysYQ4sghUy9T8viyzQI79A9WesJiydGVmaccdJVMRXHerwQ/A0cBqKz9rzADkSU6c08UqAZxqJ5ScIcmruYSHBb+gdVc7xhNQfS3snoQG9t3wJqkINGsdpk1Xrs5wIgdjpo0V8zqcY0XM2z2jsD6slZ8v+DWMQ/7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514888; c=relaxed/simple;
	bh=CM0RlA717K2qDNb93HuyLsHeoyL9/99pF9mPsJlRVL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paAsuuWl4bscJX6SbuEB4FnYB8re2QoxwtHcmkrJW5F8A30E1aFOpexEHnjJU4JgtAHnwudhuu1cCYrCXHFMAprN0zJRT5TBE9LruUxbGLdtso1l0I54A+eSrcsNpXV2ilO6BKl8nVtMcCSt71RqN+SiJqVd2cw4KyrFM12RcA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YZyGqsNY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 29AF3EB7;
	Wed, 15 Oct 2025 09:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514787;
	bh=CM0RlA717K2qDNb93HuyLsHeoyL9/99pF9mPsJlRVL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YZyGqsNYcDQGI1ZCVZeajTTUTgPzo9MsB0GFBkUZNTTkYB9bZh4OouOh+ZD+9fz0U
	 xloXu4pbUViu/g+MKusJtUTPrB881++mVaLx6oWO1bFt9rxD1cRfScBaxgj9QosD9a
	 zyKgE17QUH1Lm7gCCw6ncq+2JINJwNoVDf3fC858=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 24/25] media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:47 +0300
Message-ID: <20251015075353.22625-25-laurent.pinchart@ideasonboard.com>
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

Drop the unneeded return value checks and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index a3df3a33237e..9dc32c593427 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -760,16 +760,11 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct vicodec_q_data *q_data;
 	struct v4l2_pix_format_mplane *pix_mp;
 	struct v4l2_pix_format *pix;
 	const struct v4l2_fwht_pixfmt_info *info;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	info = q_data->info;
 
@@ -976,8 +971,6 @@ static int vidioc_s_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 	struct v4l2_pix_format *pix;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


