Return-Path: <linux-media+bounces-39248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7148B1F6AD
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6C43B03AC
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1529F2BEFE0;
	Sat,  9 Aug 2025 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CYDd6m/R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1196A2C326A;
	Sat,  9 Aug 2025 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774329; cv=none; b=XAazB2qxyXmhopBgbwIMf4rQDs0UQG7Xx92m8/dgWE2GHYyl2JoVRtHXXHGdogz4j1vRlALWKlr78HLz9C8i5YKQy7ExGksPEFJRuohhElhQV8bRMYiTyrz/S26SLF+Txi/rVUiu01sm9YXSWyPeUewUN0NNnn+JFMp3Cnbn98Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774329; c=relaxed/simple;
	bh=9KV6Si1pe8am7DLCLDzlI0SEPb8bsZoYOfEmMeSymXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwtQ51uKtEPewuOCqXyW+zxDwQXWk+pdJwBDEQuLhuGidL6vYpeoTZ6vZpz08nKbzRGOCG3xtd6XkgTK8kdk4j2g7P0Oo8NrMaldJCP+75ChY+3Z5/VJM3Ko0Nu/pD9/IrobK0ks6ebOCD4XNK9hswTeMQ6W600j6wJCnqREoFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CYDd6m/R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 04E18EFE;
	Sat,  9 Aug 2025 23:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774269;
	bh=9KV6Si1pe8am7DLCLDzlI0SEPb8bsZoYOfEmMeSymXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYDd6m/Rl46TVzLrEevTs5p3gWP04+ehDseFDcUisW8pTJS+1+I1T47ZW0Gd9uL6u
	 0Fl/xEd3M2GOhDjML+Mh/vQP65x/jIPxWXwu+DPTsCjK0mf/c3Ot9X/5dWBSSwHJRk
	 ppwlTG83a0pc0kNcTSrozDQ3yJ9Qp4iRdHs55e0k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 53/76] media: exynos4-is: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:30 +0300
Message-ID: <20250809211654.28887-54-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/samsung/exynos4-is/fimc-core.h |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.h b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
index 2b6c72d9442c..c23cbdee7afc 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -496,11 +496,9 @@ struct fimc_ctx {
 	struct fimc_ctrls	ctrls;
 };
 
-#define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
-
 static inline struct fimc_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct fimc_ctx, fh);
 }
 
 static inline void set_frame_bounds(struct fimc_frame *f, u32 width, u32 height)
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 609fd84f89d4..562c57f186c6 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -249,7 +249,7 @@ static int fimc_m2m_enum_fmt(struct file *file, void *priv,
 static int fimc_m2m_g_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	const struct fimc_frame *frame = ctx_get_frame(ctx, f->type);
 
 	if (IS_ERR(frame))
@@ -308,7 +308,7 @@ static int fimc_try_fmt_mplane(struct fimc_ctx *ctx, struct v4l2_format *f)
 static int fimc_m2m_try_fmt_mplane(struct file *file, void *fh,
 				   struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	return fimc_try_fmt_mplane(ctx, f);
 }
 
@@ -337,7 +337,7 @@ static void __set_frame_format(struct fimc_frame *frame,
 static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	const struct fimc_fmt *fmt;
 	struct vb2_queue *vq;
@@ -376,7 +376,7 @@ static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int fimc_m2m_g_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	const struct fimc_frame *frame;
 
 	frame = ctx_get_frame(ctx, s->type);
@@ -484,7 +484,7 @@ static int fimc_m2m_try_selection(struct fimc_ctx *ctx,
 static int fimc_m2m_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	struct fimc_frame *f;
 	int ret;
-- 
Regards,

Laurent Pinchart


