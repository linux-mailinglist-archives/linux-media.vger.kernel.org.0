Return-Path: <linux-media+bounces-44545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552FBDD3CF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4F5E353968
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5697315D3C;
	Wed, 15 Oct 2025 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b3LBjDMm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D62C314D00
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514891; cv=none; b=LMyZca2VWt04/G5CUbsiy7G2sfCXXV16ivbxQ+0wwrLCnvuabQ51uz73yKZCbnPRokirs74wch5WgYDQzrGdebua9nNVbGMYDOXoqyvgfgIci1FLbUdqRT8DUfKpBN40rFV2hhg+j+Tz2C4Js1ZVB2rQ8jtk8JKTCFsFEacdNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514891; c=relaxed/simple;
	bh=S3urtKFriftfK/PerejsJX8soRbTvac5ByfznJ87bPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jd/vQL+Gw2a+W3uhdoRQCQuJ2WTtp9aSXF9e/qUoEaWDfX3wS4lkweCpdrrJM1bY2q3J45A3Cfk0VSM8FMuRAvCvGfmRXQWld9D+KOrgKe61VhcFbDAe0pGK/YZBjy3+kz1L/Cos3SRetoKvG0tCgSO73LBZhZSptQ8RoeOqi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b3LBjDMm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1C111E92;
	Wed, 15 Oct 2025 09:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514789;
	bh=S3urtKFriftfK/PerejsJX8soRbTvac5ByfznJ87bPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3LBjDMmub42cy7tt12/tkMmLQOIpJBRk+IJBe8JxuE83KaBk/YaohzIEuTJyICa6
	 4TXJneZeWiRdAzESz1Nlpo24jcJTeWPlfg7+6OQ9cJFCsdk47NO1iYCG+6zmXEZPvr
	 ias54WzELKnCupbjrd73S1Kq5S8h8ZQ4f96zIFyw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH v2 25/25] media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:48 +0300
Message-ID: <20251015075353.22625-26-laurent.pinchart@ideasonboard.com>
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
 drivers/media/test-drivers/vim2m.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 86c32699111a..9d921feaf824 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -724,14 +724,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct vim2m_q_data *q_data;
 	int ret;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
 		return -EINVAL;
@@ -752,14 +747,9 @@ static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 
 static int vidioc_g_fmt_mplane(struct vim2m_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct vim2m_q_data *q_data;
 	int ret;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
 		return -EINVAL;
@@ -971,8 +961,6 @@ static int vidioc_s_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 	u32 height = (is_mplane) ? f->fmt.pix_mp.height : f->fmt.pix.height;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


