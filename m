Return-Path: <linux-media+bounces-39333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 049BBB1F7E2
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E8717D3DA
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB560202C30;
	Sun, 10 Aug 2025 01:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EN79+nRn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465E1C3BE0
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789583; cv=none; b=mqclP1xiW/BkU0FCBdEM5ZCVLn2uo51/BCrw6HFXIuAVHBXW4XqhhW1m7n6zcS4ZklH8G1DJuOfg+rj8eRR7AAjv9UNiMnUakCy+ChwjDMDjwjqueyKpalbreOR3rUDX0ALynOPSgahS3NhtcA/NCRUgE+NYbWkZYPs5tJvJZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789583; c=relaxed/simple;
	bh=AbaiTxyIYXP8jNzNeoFYbmsk9iNyhOHOEEeEpUP7aiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5huxV/pw8r+51CagRu/SxPmpsenzVuT0rdR3F4Ikn/r5XCJ6VhdVQaoe21qRR2qwGIAWm4J57iT9K+tTocY6Qtv+6Lt1P147ckeQgJoSzksG39csavrxGpkL38h08wAOTRIkz9jX+EhmZYplPMqSy+o6dgX3ER8dPk8aK3EHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EN79+nRn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 721D618B9;
	Sun, 10 Aug 2025 03:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789529;
	bh=AbaiTxyIYXP8jNzNeoFYbmsk9iNyhOHOEEeEpUP7aiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EN79+nRnrcbCRx4sBe/vGN5tBgzi8FlNzpnA6wR3yzAuKLbGRoLIn6+fz5nx68cKK
	 WNuPmGwzBSuHwXlvhTTJivcvmbeh7k2QdEMIawMT6OlkJYmHMHymcGNSvfr3b3t2o5
	 21TNa84glnqDNt9JX2vehjLlTVf61hThoG9f8gGM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH v3 60/76] media: st: delta: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:42 +0300
Message-ID: <20250810013100.29776-61-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/media/platform/st/sti/delta/delta-v4l2.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index 385b26d21408..6c1a53c771f7 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -24,11 +24,9 @@
 
 #define DELTA_PREFIX "[---:----]"
 
-#define to_ctx(__fh) container_of(__fh, struct delta_ctx, fh)
-
 static inline struct delta_ctx *file_to_ctx(struct file *filp)
 {
-	return to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct delta_ctx, fh);
 }
 
 #define to_au(__vbuf) container_of(__vbuf, struct delta_au, vbuf)
@@ -727,7 +725,7 @@ static int delta_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 static int delta_g_selection(struct file *file, void *fh,
 			     struct v4l2_selection *s)
 {
-	struct delta_ctx *ctx = to_ctx(fh);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_frameinfo *frameinfo = &ctx->frameinfo;
 	struct v4l2_rect crop;
 
@@ -809,7 +807,7 @@ static int delta_try_decoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int delta_decoder_stop_cmd(struct delta_ctx *ctx, void *fh)
+static int delta_decoder_stop_cmd(struct delta_ctx *ctx)
 {
 	const struct delta_dec *dec = ctx->dec;
 	struct delta_dev *delta = ctx->dev;
@@ -872,14 +870,14 @@ static int delta_decoder_stop_cmd(struct delta_ctx *ctx, void *fh)
 static int delta_decoder_cmd(struct file *file, void *fh,
 			     struct v4l2_decoder_cmd *cmd)
 {
-	struct delta_ctx *ctx = to_ctx(fh);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	ret = delta_try_decoder_cmd(file, fh, cmd);
 	if (ret)
 		return ret;
 
-	return delta_decoder_stop_cmd(ctx, fh);
+	return delta_decoder_stop_cmd(ctx);
 }
 
 static int delta_subscribe_event(struct v4l2_fh *fh,
-- 
Regards,

Laurent Pinchart


