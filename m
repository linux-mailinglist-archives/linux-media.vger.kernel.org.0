Return-Path: <linux-media+bounces-39334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68238B1F7E4
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844E417D14A
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8852917C220;
	Sun, 10 Aug 2025 01:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t+wO5tN/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968FA208961
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789585; cv=none; b=cOmgtsi6fnhWBmt/ojQp++qGVb0ooXb8YElRYLgsiZHLdtYaRbwWMazVKJidVfR3evByVX/TyPCkl5m+8MGhq7hOILbZBK7aPLEpb3gRNQIN9lWolmgmMkpKQaglaApaUbwf5ybVENCduDwymZgkhCYtxvZz8VKel8mkosdzhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789585; c=relaxed/simple;
	bh=HYs8+7Grwk4gchGGIHTU1tAZKtiyXyexiIuD+bI6WZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cd90p1tH6SqqgGaeZFtXHlZJ87z2djQscRI/YXBfkQpvBioXIngra8TPRerdhupEzMFbCfjmhuK/LSh4hhmSU4Ss8zByIIf/f3gaOBUrLOHwHHdp7KN5Ls092R4yMpvoPNKSX+3UMpWAXHXDR0jwbUMK90p7fNcaACnuguJwEH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t+wO5tN/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F32907E6;
	Sun, 10 Aug 2025 03:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789531;
	bh=HYs8+7Grwk4gchGGIHTU1tAZKtiyXyexiIuD+bI6WZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+wO5tN/lYNK2t2WUENECger9qKtpjRq5Jtl/jtI3SuE/GLnB1sYliOZZehre5JBF
	 9D21RzYU9QEs+0yQJGDOpbhrleawqCttzwlQiK8rnwfb4u0qFwsgCQt6uJBY0/9eb0
	 PoLjs+uL05f7ayU8SnFc/LeXF1+krmfGxe/youzE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 61/76] media: stm32: dma2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:43 +0300
Message-ID: <20250810013100.29776-62-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
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


