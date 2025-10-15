Return-Path: <linux-media+bounces-44534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C50BDD3AE
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D27F3538E4
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE4A314B8E;
	Wed, 15 Oct 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZUkfRhWn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2B7314D3E
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514871; cv=none; b=sBhUzZv6bkfoHpQuMiOL78+p4K5QlRrH+ImmAjZW7AbVZuaQGeCywxku0kMNw6J/eXyHkyYP+BSmbZyshKPsDiRmXi0RCBxVICkB64l/vWvdR+oFgPyV1KcEtbU9ZE4CpIiWlEs8v9KAhl0GDHG7/e8vo1GgsIdRN2rM6Zjw9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514871; c=relaxed/simple;
	bh=kbs1RqNJaZcy/K/4HjFLhq1ptrP5FnU877/vsgOz2Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZCVhmxDm4KlJ2WoM11TFUJIboDSlmaDSipoGHm7L+U8bVRA43HwgaLzfOgDg3C0hfCzcWYb1WE04qODfzNNbG4S4/UfzV55z6kq19BnZ31qoERdF0UbMnhbfZ6ZolSOz0mq+3aoA+dDiYxW3IIcjQ1rlNDvQWiy0e5IWk6dqCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZUkfRhWn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45258EB7;
	Wed, 15 Oct 2025 09:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514768;
	bh=kbs1RqNJaZcy/K/4HjFLhq1ptrP5FnU877/vsgOz2Ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUkfRhWnPVzRfiSVx8/NsaWw365C/fIoJ4nQh1woRwcMYM1PhIpo0ZFu9vC6xnFR7
	 6ucCp5/rMax4ZQCyI89wnC7StJMeM8WU5+9OZrUSEoeCvDKzaDFOesoIBARE3ckO4w
	 VnJxDmg+8PfvAjiFQo6pE8F6BrEVHctoqMgL+DOs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH v2 14/25] media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:37 +0300
Message-ID: <20251015075353.22625-15-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/nxp/mx2_emmaprp.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 3aae8c0b690c..02d57229b9b3 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -431,13 +431,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct emmaprp_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 
 	f->fmt.pix.width	= q_data->width;
@@ -540,8 +535,6 @@ static int vidioc_s_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 	int ret;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


