Return-Path: <linux-media+bounces-41251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F532B39F62
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 15:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52183B9747
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9695021254C;
	Thu, 28 Aug 2025 13:50:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840411E8329;
	Thu, 28 Aug 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389006; cv=none; b=jqhfxYagn8maQzPwC5cuqDW6luSAwPNRa7gVWwfQLIPZn0FgduM6ELtNVzuaADG3B3qhohDoZAAwI4wfR1zFK02fHzT4qI4li/CCXfxhFdQ0U+Ovnd6uEwE6fywKQ2Nnv2oyG0Ht+e3iu2H1H2y5FNUVLzvgvYVshXfe8XDZSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389006; c=relaxed/simple;
	bh=DDOV9rR/hjHuqWe5s6Hp4997ngPTrZBFXzeqswiR2AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukVO5UZsZsCi/MtYHICuh8V6+yKW4OIV9ZtDZUXb7++CKGlULDdwmukbCduYamZUfk3B/QSzpWopI8k79EnIyaFFBcqH5jsp+zBTCl913v8H3nC/vC4NT34H6kZ19zLFQq9SuPPtMemLk2HXIoDK+p1+LuqM7IgvPK18mwp1tK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 49C9D1F00036;
	Thu, 28 Aug 2025 13:49:56 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CD3AEB02236; Thu, 28 Aug 2025 13:49:55 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id D8197B02226;
	Thu, 28 Aug 2025 13:49:29 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2] media: verisilicon: Explicitly disable selection api ioctls for decoders
Date: Thu, 28 Aug 2025 15:49:18 +0200
Message-ID: <20250828134918.1857791-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call the dedicated v4l2_disable_ioctl helper instead of manually
checking whether the current context is an encoder for the selection
api ioctls.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c  | 2 ++
 drivers/media/platform/verisilicon/hantro_v4l2.c | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 4cc9d00fd293..6fb28a6293e7 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -916,6 +916,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 		vpu->decoder = func;
 		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
 		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
+		v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);
+		v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);
 	}
 
 	video_set_drvdata(vfd, vpu);
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 6bcd892e7bb4..fcf3bd9bcda2 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -663,8 +663,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	/* Crop only supported on source. */
-	if (!ctx->is_encoder ||
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
 	switch (sel->target) {
@@ -696,8 +695,7 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	struct vb2_queue *vq;
 
 	/* Crop only supported on source. */
-	if (!ctx->is_encoder ||
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
 	/* Change not allowed if the queue is streaming. */
-- 
2.50.1


