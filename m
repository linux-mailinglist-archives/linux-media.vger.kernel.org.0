Return-Path: <linux-media+bounces-43992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA26BC630B
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F7B84E825E
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C13D2C0294;
	Wed,  8 Oct 2025 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UtpyS0su"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747F2C028D
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945883; cv=none; b=jE9kSIWC0SKtwIP7IKAEYZ1O5PvP00fmMlQLrw0Le9wXshatPlixzHlsxjJNaRxOdY/T/TpMMCcIZ4He0SN1qb1d3l70CRtgeN5lgoFITL4IR/iK4v1CYeRCzsB4H08CLLW23J9IxYrHPIy3k5JSF9v0cg10eqxovMczLX5RxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945883; c=relaxed/simple;
	bh=Ht2XCQ3JJhPM15yVqt3rAnPQXMzBAby1D9DyhGE1PAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMy9NC6/g00Tqm/xbFNslDV55t7uzT+V3MvufcMvZ73Xw9Ft6sqHGt6sulJdRp7fdFO2DbmqdFw7X6mYR2nE7XV0XPk6KS6aq7dvqYPvar5h27NX/QxeoI+7aEdQDBaWUA/NMtefJ0PHYYw4+pKHRa7NTpxaAKdhIR0dOc9+Fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UtpyS0su; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1287B191B;
	Wed,  8 Oct 2025 19:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945786;
	bh=Ht2XCQ3JJhPM15yVqt3rAnPQXMzBAby1D9DyhGE1PAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UtpyS0suarnz/+JOG+kaffX1BQU1X5JG/EYk+3TukCYmrclmCBm+Hm6t47iXpi3IW
	 T/pJM9BB6gNuE70ga5d5GzjxNZ68fbYbIHmTiRDQkuHO5tyQXcTS0U2ErwwSAMKPJt
	 vJ2F1tfirgRcuRQqpPkuCDepEHsOzguv5/jqFzYU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 12/25] media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:39 +0300
Message-ID: <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
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

Drop the unneeded return value checks and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-pxp.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 7f8ffbac582f..5386650ce194 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1180,13 +1180,8 @@ static int pxp_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct pxp_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 
 	f->fmt.pix.width	= q_data->width;
@@ -1329,8 +1324,6 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


