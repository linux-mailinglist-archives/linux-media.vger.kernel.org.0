Return-Path: <linux-media+bounces-39321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89253B1F7D3
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2B33AC617
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBE31AA7BF;
	Sun, 10 Aug 2025 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v0qJm/+j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97D487BE
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789564; cv=none; b=urZiC7Hxn50yylzYax/mdE+aWtYIjxEZNIU76CPng7z8m6Uqi4tumh6IE5UJdwZzFKAataRjiQvnxZgDY2GaQZTrMhWh+crEsIPWtoO0e1Cu36osDOknSOhy94KwuWsKr0Jbd+8+Spocb8a2ZtMiD8JW0kLBLZSDEsPlxdf489Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789564; c=relaxed/simple;
	bh=ojPCdkuZW4zO4KQA3P9FX5blA92FGG3DElIHtscQ1Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4CKFmvg6Ea/YMLKKkeK1VWZpYYqjXot8gZUU5ACSaYjSEnbj+K1nvAqrzi3dgrfTlKAXChN/NneIG8cho83vq140nuN+mjJbJvNhAM3UYgTffx1xpekVg2s8eUZq86sw/NQM4OMpZJCGhPOwBIUMlfqwKLqsBATKOAaLPJjY2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v0qJm/+j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1872599F;
	Sun, 10 Aug 2025 03:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789510;
	bh=ojPCdkuZW4zO4KQA3P9FX5blA92FGG3DElIHtscQ1Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v0qJm/+jfhz3SQTq54sU+JABx69PARyxHJ5DlHuPNzqWOPk7t9ogPF0k/bqLhrgo6
	 CRhuKgnp0rt7VtmLVjYTqKZHC8KgDaAHTOwjKE4w9ZJPDXrJkef5j/wUftqOGI30Sz
	 judjzzg1Z8dN+F7KvYXaVGRcT15j1Lg9GWt7wADw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 48/76] media: nxp: mx2: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:30 +0300
Message-ID: <20250810013100.29776-49-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/media/platform/nxp/mx2_emmaprp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index d23da93304bd..3aae8c0b690c 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -456,13 +456,13 @@ static int vidioc_g_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	return vidioc_g_fmt(priv, f);
+	return vidioc_g_fmt(file_to_emmaprp_ctx(file), f);
 }
 
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	return vidioc_g_fmt(priv, f);
+	return vidioc_g_fmt(file_to_emmaprp_ctx(file), f);
 }
 
 static int vidioc_try_fmt(struct v4l2_format *f)
@@ -502,8 +502,8 @@ static int vidioc_try_fmt(struct v4l2_format *f)
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
+	struct emmaprp_ctx *ctx = file_to_emmaprp_ctx(file);
 	struct emmaprp_fmt *fmt;
-	struct emmaprp_ctx *ctx = priv;
 
 	fmt = find_format(f);
 	if (!fmt || !(fmt->types & MEM2MEM_CAPTURE)) {
@@ -519,8 +519,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
+	struct emmaprp_ctx *ctx = file_to_emmaprp_ctx(file);
 	struct emmaprp_fmt *fmt;
-	struct emmaprp_ctx *ctx = priv;
 
 	fmt = find_format(f);
 	if (!fmt || !(fmt->types & MEM2MEM_OUTPUT)) {
@@ -580,7 +580,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vidioc_s_fmt(priv, f);
+	return vidioc_s_fmt(file_to_emmaprp_ctx(file), f);
 }
 
 static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
@@ -592,7 +592,7 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vidioc_s_fmt(priv, f);
+	return vidioc_s_fmt(file_to_emmaprp_ctx(file), f);
 }
 
 static const struct v4l2_ioctl_ops emmaprp_ioctl_ops = {
-- 
Regards,

Laurent Pinchart


