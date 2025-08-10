Return-Path: <linux-media+bounces-39323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDFB1F7D6
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D51233B1734
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97F01F875A;
	Sun, 10 Aug 2025 01:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TrjZxXfn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036C21F8676
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789567; cv=none; b=XxvVjUwPvsl9qCO4HdAtecU6C0Z41+IC5CHPw6VySdOegQTgx8Qdsu4X1oZMWHFVZyB6ZrM3oeUH2ZHFSXXIk6ZP3TKIJwGy7o2Epqy2U/tgC0Yk+qaR3M8Kw9rXbzr2zajPTLjzygpE+XCtNwggUVG712tH8wLeReMvDlabaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789567; c=relaxed/simple;
	bh=E2YsTuLzac0tzRZQUeUKAToChu69AO8ArXm4ynIHL2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dz2ufU+iaH2jeRRfh6PUTlfmQUTGsMtrQGYL/jX+JAht+b0bR4xGAl8F94bSyH13pYEDuXxdfB4nNsqsI0UjMR7405CON5ZavPeWCx/BN0IFdx3C38iCXTopbhJ2S3VTWAmeQpl1SWbpaFXT2Z2+ss6lP2PTqaKg7HURzUTzVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TrjZxXfn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4089E104D;
	Sun, 10 Aug 2025 03:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789513;
	bh=E2YsTuLzac0tzRZQUeUKAToChu69AO8ArXm4ynIHL2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TrjZxXfnm8O97VSYbK/3m7vNl2EqK4nCayHRg+7K6tdG8/XDlOXQ0Ly8YLbQ5akXz
	 MAEiA2oouz9Ez7Wzri5wK+OvxgkIR1kZLveI/y71b1pfSWUE837jehJdFUF6YJjtD1
	 pOjWBKctr24SWYZaPADix8qR8Pc5UB5qCfgXZkBg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 50/76] media: rockhip: rga: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:32 +0300
Message-ID: <20250810013100.29776-51-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/media/platform/rockchip/rga/rga.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 45c42c7ad846..7c657df623f2 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -462,7 +462,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
 
@@ -504,7 +504,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
@@ -561,7 +561,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 static int vidioc_g_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rga_frame *f;
 	bool use_frame = false;
 
@@ -609,7 +609,7 @@ static int vidioc_g_selection(struct file *file, void *prv,
 static int vidioc_s_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 	struct rga_frame *f;
 	int ret = 0;
-- 
Regards,

Laurent Pinchart


