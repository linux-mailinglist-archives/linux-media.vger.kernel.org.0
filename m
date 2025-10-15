Return-Path: <linux-media+bounces-44533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B9BDD3A8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA1DB350DAD
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840BB314B72;
	Wed, 15 Oct 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U6nlyLwb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749C31578F
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514870; cv=none; b=F0mrDjienufJAEW+zbvKfZnM39sArsPcqN15zls8qywQJFVv/JcnYPxgtT9c53UZ4Z1ZOh74lkPr+rd2fa/qKNVYg9R56TvsbrXKf4nJDVaVTlw5lPFJ9D/9lJtP29mAPugZM9qi77fc5z64aqRStuZDEWm6BxEVkxViQ+kvsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514870; c=relaxed/simple;
	bh=+mq6WUhpS5IJak8rlqmx5RNu5SCT2Q4SmQZdQL5quOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrX9HhI4C8OLbwpbMjcqwDez40ParL9PaqcKvJrOGryR8PR9aMASI8cpjFblmQ+EpUtldmcJPhlOp9sm5t0ZDyvF8kBTD4wY9UnhCtbj0GsZAzMrV+bRctGjxz2q2yKCEsTeKNzZM3sZrJDPpR2CH0oxK/dBw5XUDZMYk80+Ghc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U6nlyLwb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9804B162B;
	Wed, 15 Oct 2025 09:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514766;
	bh=+mq6WUhpS5IJak8rlqmx5RNu5SCT2Q4SmQZdQL5quOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6nlyLwblg5OStUdnO2H+jut9tx6e/ij/EqcHUWFQKWFmkGfOES80Sx2RqZjsR2cM
	 mMSL7JYJIWeMwcg/vCtd0EhcrDd1Uy5bITzikErhNat0yb1ljQFpZjoezToRsYzjuQ
	 WpqMZac2xPHnZhJSLfRROaz6EjR3e+x+OZToBDdo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 13/25] media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:36 +0300
Message-ID: <20251015075353.22625-14-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 00afcbfbdde4..df14f12b3ad2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -554,8 +554,6 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart


