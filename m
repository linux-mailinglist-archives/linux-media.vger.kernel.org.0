Return-Path: <linux-media+bounces-39255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F8FB1F6B5
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDDCE3B08F3
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBE92D0278;
	Sat,  9 Aug 2025 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="umZFyCB8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B722D0274
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774340; cv=none; b=U63dU6ZG66s+fxvlFCbPgM7ctVR/og9wrB8u4Ef4XQCW27d2pn1yMdsZs4+Jjsv+Mx4d/LuJgWrMtzVB2Djf5UcFFu0VOxAW0v9oIGbARO+O8F16xwDXrhETtZoP1CWnAPDpNFPZGAigxGuzXJm+EQ4Tshtcb2qUQHcxiufaYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774340; c=relaxed/simple;
	bh=8U68EuaABqhZdxiFN/yiQMZ5Rn79nxoQGY5imGMYaZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlXuI7qJD7zJpuJn2o9Y1XTs42dLTnq4p/inn21urUx05GVm04jKsZkpCwg7gmM69eGQ2oMkNGVGZ3B7OASVMPwxHD5H3IeJVIKLmTuJ2EnctRrbeGUG+6dvk0KiATvAOBZRuE750xkJKqOFwzpqMSgDu36nOw5bLLqE6I359js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=umZFyCB8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7E4C389A;
	Sat,  9 Aug 2025 23:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774280;
	bh=8U68EuaABqhZdxiFN/yiQMZ5Rn79nxoQGY5imGMYaZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=umZFyCB8WxJtXxErL7s9AtuMGwfHg242zKsuJ3ia+hoD5fc7ahYHJCHCZ11bFfOGy
	 jJMHlL0c2gaKzFH8A3cILkkX3D5sL62Yq401xB9P0evRWKTq3yfs7wDurkeGk8mn6A
	 458qLcs3mbK3ssSyfVubjGKfXBNWZjb13FKtclz0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH v2 60/76] media: st: delta: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:37 +0300
Message-ID: <20250809211654.28887-61-laurent.pinchart@ideasonboard.com>
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


