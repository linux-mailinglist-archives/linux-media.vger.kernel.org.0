Return-Path: <linux-media+bounces-39256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4AAB1F6B6
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A79F4E11F5
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED3127AC57;
	Sat,  9 Aug 2025 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UWr6K88e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817D12BFC74
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774340; cv=none; b=YIndG9lRbUuIQPT48RvfpseeBmovvDObfXcsIZOM5ut34Pe8zmGQzvPPff39au51oKctKTdTKlO4ai4j/LusvKobMQ4Ej/M9cILneSqafCNSU3NfzOeDZmp7XB95pR7i9/0wNSiJQoQuJrKDo43HZ8r+CbtFn15iGxGe4ZB37wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774340; c=relaxed/simple;
	bh=HYs8+7Grwk4gchGGIHTU1tAZKtiyXyexiIuD+bI6WZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTPQkmunZHzfpYc74BFY9EcjLgCyPfmd1AS5CiX8qEB5WKMxCgyVhXZfmi3EGDSZgfTR25DX7pPUXzvR9U9+AyVszdk816WK9OuP/6AUFWj6zJuvLmT5LdreNZ4cMKu3w5jupEfoFBWb6QVxEdCrQVycqEpZvG1Sr7cXv1Bg2pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UWr6K88e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 68ECE111D;
	Sat,  9 Aug 2025 23:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774282;
	bh=HYs8+7Grwk4gchGGIHTU1tAZKtiyXyexiIuD+bI6WZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UWr6K88eiflNI3J9JW0bF9nIuHf+xU42BIfpoZVhHEjq566NCzyNStdqDzsiIMohB
	 PPt+pUTJuwth9u00B++/PBx+VaIzkTDVFOG+fQmFh7rwj0UyLcJk0kFtPeAah+zbuS
	 Cv+cebsIg/y0SqxJM1IF593NzhcJ1K0hZ1t/4loI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 61/76] media: stm32: dma2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:38 +0300
Message-ID: <20250809211654.28887-62-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index bc0f81e78018..a22f587a5f83 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -354,7 +354,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 
@@ -379,7 +379,7 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct dma2d_fmt *fmt;
 	enum v4l2_field *field;
 	u32 fourcc = f->fmt.pix.pixelformat;
@@ -422,7 +422,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 	struct dma2d_fmt *fmt;
-- 
Regards,

Laurent Pinchart


