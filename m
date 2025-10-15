Return-Path: <linux-media+bounces-44530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A9BDD3A2
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EE13B85F8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B02A314D3A;
	Wed, 15 Oct 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lNsLsdh/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D6314D32
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514864; cv=none; b=ZpS2QuzfR6jVBUFNFeH0nReNQewugxqIScdAtmywXiBf/bYEmKA46opoJ0Bi8OuwSKB79dMKy42CB6LJhXv+sGzdNG1m7EdFpyVnDwBXTCPS32N8tfaOnx1IXymGd/t27qP6x97xP6kiE4gy3eJnS8B4KPg3t27KL/mEGU30uTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514864; c=relaxed/simple;
	bh=8iofSzs8DF/mTNNsWbKAnQs1IByycRUQNIZ/1gqA7gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSqXzFbmfr7h1GrShP1/+abQiMHPlhulvdFGdv/lU9sV59ULyIbin6tLGKhC6XSTPudKdz/f2nGZglvevvwHkfwJNgp1tnjIXe1EXgwSthWBd0qXglhpayB+09mnQkSTVNqrw8NiqjSux954m4WaRMGekQqhWMxj4xuwtDQTTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lNsLsdh/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4CC43EB7;
	Wed, 15 Oct 2025 09:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514761;
	bh=8iofSzs8DF/mTNNsWbKAnQs1IByycRUQNIZ/1gqA7gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lNsLsdh/CTmDCqstiysZw3SOEnc8xexvPernpgvVy5qvDtpvONCqEX20oIgg4kfll
	 yk8OqH/88iQp37UPElQ0C11Qsb3hvUY8CINF1DIHxqVjQq8M7v2bSkwGQxXV5d5Y3c
	 6Ifj6ga+IHVU5BxcpmDufFFfhZmE76Og6H4N6Rx8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH v2 10/25] media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:33 +0300
Message-ID: <20251015075353.22625-11-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 97744c7b7c03..035081c4223b 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -735,13 +735,8 @@ static int dw100_enum_framesizes(struct file *file, void *priv,
 static int dw100_g_fmt_vid(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
-	struct vb2_queue *vq;
 	struct dw100_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = dw100_get_q_data(ctx, f->type);
 
 	f->fmt.pix_mp = q_data->pix_fmt;
@@ -803,8 +798,6 @@ static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = dw100_get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


