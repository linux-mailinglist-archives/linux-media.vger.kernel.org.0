Return-Path: <linux-media+bounces-39328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43771B1F7DD
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 425984E12E0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90F2201017;
	Sun, 10 Aug 2025 01:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u3DMTGKv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931711FF1A0
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789576; cv=none; b=GILl3auQViBENfi5J4Rks4TfAZ26PoDFM35aCnthQ3X2BDYNI9k2/sskJzDwF7awIw4dsIwD1XCFhs7KMMFI4Z/S+WA7DxAk9Mm/qqr5jmqsiJLBzc5cxmmIiAsLGZbLVyjQshNLkPlZx/KGecLtbbPeldd06ETUwwrZy6dd16o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789576; c=relaxed/simple;
	bh=J2YqhlSkO4rBsv8gjA8t0o3f5oF8H+i91NwRu0XujMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0OKiSImW4GqxDMho36uXUjXURzQGf79kC53iuAm5AuKCDqnpRoxZRXRX5Oyr0eDZVHzzcXUTyOmfcT+z2C4eybTKNTC8yBx6o9eDRKjH4mhzSLwUBBDmr/ogpPM/sv/4LW/1JO0gm2PYox0uOhJlDCss1hCjvkMYtnnQkMo6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u3DMTGKv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A2AC8CB;
	Sun, 10 Aug 2025 03:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789521;
	bh=J2YqhlSkO4rBsv8gjA8t0o3f5oF8H+i91NwRu0XujMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u3DMTGKv8ZDvAbZW8KSATAtpd635VqOq1FA82O8ekimzra3yNnnqvZmhubzhDBWEW
	 jYYFq12zMRQgdvIfQM+NLOthZTZdW6htZuR/SfN2pkPOlRv1WhemgezXxTzV9mJ6A3
	 NDeE+w3RQkaxAKdjB6+qKOI99t/j7hinlHJJubnM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 55/76] media: s5p-g2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:37 +0300
Message-ID: <20250810013100.29776-56-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index 922262f61e7b..55f5130156b7 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -307,7 +307,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct g2d_frame *frm;
 
@@ -359,7 +359,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
 	struct g2d_frame *frm;
@@ -400,7 +400,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 static int vidioc_g_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_frame *f;
 
 	f = get_frame(ctx, s->type);
@@ -450,7 +450,7 @@ static int vidioc_g_selection(struct file *file, void *prv,
 static int vidioc_try_selection(struct file *file, void *prv,
 				const struct v4l2_selection *s)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_dev *dev = ctx->dev;
 	struct g2d_frame *f;
 
@@ -478,7 +478,7 @@ static int vidioc_try_selection(struct file *file, void *prv,
 static int vidioc_s_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_frame *f;
 	int ret;
 
-- 
Regards,

Laurent Pinchart


