Return-Path: <linux-media+bounces-43999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A7BC632C
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E21C34E98E2
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C71B2C11FE;
	Wed,  8 Oct 2025 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gqn+PT7P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B922C026C;
	Wed,  8 Oct 2025 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945893; cv=none; b=DN8eg0JUWGP9wYKcE7iyUrEwNJqLtKSTaXT+JyfZCsoERxTqAG/7sujV6IbMq20tdvSZ5W9CAN0SkNinczdoanysI0debfmYi0GwjfbbOslfy8u3zGhOz3YySaDcidh6oQfism+sYWrprPJDr7Qv6s/yqUCPwa91YRmmet110oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945893; c=relaxed/simple;
	bh=YjQ78MlOdbG2kdjxS2oF/HH9OIUdcqSXcQKlprq7ffg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeZqwAGWrKBLGSnUxUvS25TxdHiJb2uKeolU1TVmNF5gqdWK5PrzhgTgtPrp6BiOnl31G4EwNlQW8NwNASj/TRg6DwOetdOi+iDrCVwgrrZDpPWVMmnmQn65r5jc7+d6IFi6bdb8lsTiQLOn/KSFx7URbQc5g+QozhI7NIMj1pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gqn+PT7P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E58911831;
	Wed,  8 Oct 2025 19:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945796;
	bh=YjQ78MlOdbG2kdjxS2oF/HH9OIUdcqSXcQKlprq7ffg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gqn+PT7Pp8ZCCqETLdiky64CHEvOYM+c5CZUaARhLVQSCbKdDeDRmsdWu8g4ioq6J
	 wAEGxUtf51tZ4AFL4LhRvB4AcIpUwQrgFr6NzV0xLRssVtN0GOf9DrRlTFwSfZMxcO
	 IJK6LJn5mHVAHYvnmSy5LiEg6oDPtOER27V9zIhU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 18/25] media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:45 +0300
Message-ID: <20251008175052.19925-19-laurent.pinchart@ideasonboard.com>
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

In the get and try format handlers, the return value is not used for any
purpose other than the NULL check, which was therefore probably intended
to catch invalid format types. That's not needed for the same reason as
in the set format handler.

Drop the unneeded return value check and, as the function has no side
effect, the unneeded function calls as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar_jpu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 81038df71bb5..5a4376bdd10f 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -825,9 +825,6 @@ static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct jpu_ctx *ctx = fh_to_ctx(priv);
 
-	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
-		return -EINVAL;
-
 	return __jpu_try_fmt(ctx, NULL, &f->fmt.pix_mp, f->type);
 }
 
@@ -841,8 +838,6 @@ static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	int ret;
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&ctx->jpu->v4l2_dev, "%s queue busy\n", __func__);
@@ -866,9 +861,6 @@ static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct jpu_q_data *q_data;
 	struct jpu_ctx *ctx = fh_to_ctx(priv);
 
-	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
-		return -EINVAL;
-
 	q_data = jpu_get_q_data(ctx, f->type);
 	f->fmt.pix_mp = q_data->format;
 
-- 
Regards,

Laurent Pinchart


