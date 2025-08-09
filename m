Return-Path: <linux-media+bounces-39243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FAAB1F6A6
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9175A7B15A5
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEB72BEC5F;
	Sat,  9 Aug 2025 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FARtW0jM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A59279915
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774321; cv=none; b=IucAUcuwGV37NkqRLMWb07eWsD5In9jX5f4fPR0iqSxzJSg9DJAmbx7hJmhAAYczZSCf7bDQpY46DuX/MBY8hnKHOIEQXvNCRHRxm3LDNkEB1U7016wLlADLQgbQNbksmzhnTkONuZ2/9P7YwpKdTT688OGm+yzJAbN7I4YHpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774321; c=relaxed/simple;
	bh=ojPCdkuZW4zO4KQA3P9FX5blA92FGG3DElIHtscQ1Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFbYBTDKoX6TbLMJAovVm58w/xpFrpENbW8O4dxyZCekB8wml93jRzH++gOQqO83msJgGRJNjtVCO3x9Mt2QVxWbSgnsGwBIuKMNbUb8zxvHUO/fTbMLeVCdUFTKKiUPidaD54dDfxfMuwHFI1l3jwNEXfTmX5ZT+sbk569SAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FARtW0jM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E8D041FD3;
	Sat,  9 Aug 2025 23:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774261;
	bh=ojPCdkuZW4zO4KQA3P9FX5blA92FGG3DElIHtscQ1Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FARtW0jMwdSRFJTYOvk5kEsNxGDBsNr5LbDMTywjHGnQHIxia7DLO729gorPoC9iP
	 +1fRuaT9CSlA9m6bGyrRMIHZ5MgSPbdXHGG3umxMegNnnnINJHKgdYPASf6ianXYMF
	 ruH2gKpu2q1hc6BxRzNvMgkWdxb9VzAY3azTrZ+E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH v2 48/76] media: nxp: mx2: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:25 +0300
Message-ID: <20250809211654.28887-49-laurent.pinchart@ideasonboard.com>
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


