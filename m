Return-Path: <linux-media+bounces-39316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56DB1F7CD
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54BB017C949
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656FF1F4176;
	Sun, 10 Aug 2025 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ft+WpgzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2051F4161
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789555; cv=none; b=TEj0HUntiuFw5CzfAP9HiNdrhLAcj/NwXUyIdBVrgSAJCcJrkEau6uaWvdLszvYPaJ8zFEcV59wb+3e0M0e2Asdv++X0dChZtO9kAlfWqwyXjW4pyQNzUB1frpQbj1jPeRD7mQclOYRlVRTIdsHKPlti+I0hAiY/0FupPa/HDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789555; c=relaxed/simple;
	bh=OalqXRX2BlFGyxMJdGnLlToeFLxIFE59sf/mpzpkEFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEMfSojY+8MAsJBtZAhrHVU0oTP3739IdxDb76GI4dQWyw7Gn4IvfDHB3Mwg+Gugwh5iAU1gS6Z3cGazOGIm+JAimpE6IbnwHjLnKNBtwTqFbB0J+VHa7nXwOzx6RY2xz18cbtwntbCcl3x3XVdkcAsZ1cmBcfM7smau1DDX9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ft+WpgzJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F272E104D;
	Sun, 10 Aug 2025 03:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789502;
	bh=OalqXRX2BlFGyxMJdGnLlToeFLxIFE59sf/mpzpkEFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ft+WpgzJ5TKvLfgzbdV8vv2daDiEGd/rGYkAfT0DpXtoDYpnnqqmU5H6bsTznNCMS
	 JzAQo8ts6cQ1vpLWGx/QKQKsvDJ2Ye+tyGrPWCxk6xBDICkm/RXjMOO0joFSRIorYz
	 1RInpb1NKhl147NS8mNQRxGs5ZFu4UVZa2Fsa+/c=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 43/76] media: mtk: mdp3: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:25 +0300
Message-ID: <20250810013100.29776-44-laurent.pinchart+renesas@ideasonboard.com>
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
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index e68ae19d71a9..9ef956b565a7 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -10,14 +10,9 @@
 #include <media/videobuf2-dma-contig.h>
 #include "mtk-mdp3-m2m.h"
 
-static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mdp_m2m_ctx, fh);
-}
-
 static inline struct mdp_m2m_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mdp_m2m_ctx, fh);
 }
 
 static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
@@ -290,7 +285,7 @@ static int mdp_m2m_querycap(struct file *file, void *fh,
 static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
 				   struct v4l2_fmtdesc *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 
 	return mdp_enum_fmt_mplane(ctx->mdp_dev, f);
 }
@@ -298,7 +293,7 @@ static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 				struct v4l2_format *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
 
@@ -316,7 +311,7 @@ static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 				struct v4l2_format *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame = ctx_get_frame(ctx, f->type);
 	struct mdp_frame *capture;
 	const struct mdp_format *fmt;
@@ -359,7 +354,7 @@ static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 				  struct v4l2_format *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 
 	if (!mdp_try_fmt_mplane(ctx->mdp_dev, f, &ctx->curr_param, ctx->id))
 		return -EINVAL;
@@ -370,7 +365,7 @@ static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_g_selection(struct file *file, void *fh,
 			       struct v4l2_selection *s)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame;
 	bool valid = false;
 
@@ -422,7 +417,7 @@ static int mdp_m2m_g_selection(struct file *file, void *fh,
 static int mdp_m2m_s_selection(struct file *file, void *fh,
 			       struct v4l2_selection *s)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame = ctx_get_frame(ctx, s->type);
 	struct mdp_frame *capture;
 	struct v4l2_rect r;
-- 
Regards,

Laurent Pinchart


