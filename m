Return-Path: <linux-media+bounces-39238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F218B1F69F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CA457B13B9
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49522C15B9;
	Sat,  9 Aug 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ustenXQF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EDC23ED6A
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774315; cv=none; b=HKuJkfVKAPRonc0XH19205gv8TLN3//rf8m0oBQrPTl/mJC0xWkLWDmiqZiTPZFMaqSq/ay8nk5bQHiDry1ajaPG3mhc187xgWGbEDYFuHllk+g4Lgh/oQb50bIuxKjxAyiGPTpfxCpTPN6J4xZoedoNZn71Npy4MDeBlcnsiMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774315; c=relaxed/simple;
	bh=JxJecvVwukWQyE9AbR4sLAXnlqqIvOq21VVCjpO2RsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo2abj7owBF8Jat6YdK1crzM7Wtbc9WFOxdd7BdRpHMESR9ZFD60MMEJ0UHVMlw7StMvj0ayiYwqNVrULKcP5WMdrr9aMYyvuLUcyX6wiZtn2H3EQCfqmaH87n7ljTGNT5eMduXktpFsZStnhIXVKid6vGcj+gxOfbW/8/AvlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ustenXQF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8A11F162B;
	Sat,  9 Aug 2025 23:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774252;
	bh=JxJecvVwukWQyE9AbR4sLAXnlqqIvOq21VVCjpO2RsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ustenXQFGcikKqznJpnnq6gsGe5WgAIq5dE7O66RGi1htgJFcC4cLPXpMr2R5azHJ
	 rb/5W6yKsQagKqZp8Y80fAQOIuZghnNcaDDxWoKe6gIfXb8MrUrpVzMfw9CDLEnhhD
	 rmbfxoMHpAvrwk8SUL81LTYdOiwG66Oep7oFFu60=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 43/76] media: mtk: mdp3: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:20 +0300
Message-ID: <20250809211654.28887-44-laurent.pinchart@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


