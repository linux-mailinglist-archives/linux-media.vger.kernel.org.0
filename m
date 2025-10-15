Return-Path: <linux-media+bounces-44531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 748FFBDD3BA
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0C2A4FA39E
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D5C315767;
	Wed, 15 Oct 2025 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nzLLp2cK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006A3314D02
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514867; cv=none; b=qyhp2Jj49oWoJARN3n/pCicZmFhC/DDvxTDe8Fz1ZYw9kSOP5EXs9QDepnKUrdOvVzcFsLHWJb3TfS3VjosfhhCA8q/ZK9o2zlc2ZiN4yC5Lzz2RbQAZ+EZIqe6Uej4d1CvA3ula1llLJUzHYQSEeHw4fhjCKhIWZF/MbFOS6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514867; c=relaxed/simple;
	bh=gIVjToJ4dGZYaDyjxYRQsimGYclfW6IBnWQW9t0yb8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AR0XCf7/kI718CpVOJI6woCXHdAOLlc1vrq/Jljw15MXYvYi9oKQS4ZDPwHFef1jCoe1IXgeyNh1tBQNQ5gp1X/au1JYaksyoBVW+u75t3HZsYrfC8z9riYD3zpCgaqtWZ2A7Jx5tImrk315iC0IFMywyjwxElycZF1QrA6Dufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nzLLp2cK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A43C190D;
	Wed, 15 Oct 2025 09:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514763;
	bh=gIVjToJ4dGZYaDyjxYRQsimGYclfW6IBnWQW9t0yb8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nzLLp2cKiShbVVIBhAaqqOAQnggH9sCWuM5VZd6mqv20ctqHgLbOWqvJDDnVA1H1O
	 Y0yAUg5pFc39zA7mX31Nrhlq/pjibSwtNy8V6sq0+iPsDCJxPOecDlCyXk8i8ZKzT7
	 MXP3LDdMwciRuZMGwFrC0f2daHJsbMghZqYkXoTs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 11/25] media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:34 +0300
Message-ID: <20251015075353.22625-12-laurent.pinchart@ideasonboard.com>
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

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767ba..d41fa4c3139b 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2491,8 +2491,6 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
@@ -2528,8 +2526,6 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 		return 0;
 
 	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, cap_type);
-	if (!dst_vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(dst_vq))
 		return 0;
-- 
Regards,

Laurent Pinchart


