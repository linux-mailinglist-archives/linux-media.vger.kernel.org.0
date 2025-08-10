Return-Path: <linux-media+bounces-39348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094EB1F7F2
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20D46189AD1F
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877FB1E1C1A;
	Sun, 10 Aug 2025 01:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z8Pp+cUv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE31DF756
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789610; cv=none; b=pwPdAHA7sno8hMtJoYXTVrD9agfams14f8VnahfLzdob5EwFxiz26VCHjZwkcs0enR3Kjx+x48T9XeJAztqAZINqm6TKfhD/12ml6v8MXNBUiSQj+OtVmXPPFhYHVt/6lukp45RXD3fZQdTm/n1PAz+6f7cok5S0WZ+Io159Rcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789610; c=relaxed/simple;
	bh=ssl4Me/gPXuBeRmfPMzWwlJur2QUqpzxwRsQZwiB9TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6RchigMcEghOsqMVrxJR1/YKtCb2EPcw9TuSzvuPQEEecV1hlm3QF3eJGJPVnz0ALzozRHJcE5cT2uNPl8R9mzIUDTbKSlH9AVokMHIqm/QVki3m6KoXqrODxAUrCf+Ay/dBPK9bV+1zKGGwXcFztLLODZ1bD5JFrZPgQ71zqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z8Pp+cUv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DC22F99F;
	Sun, 10 Aug 2025 03:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789556;
	bh=ssl4Me/gPXuBeRmfPMzWwlJur2QUqpzxwRsQZwiB9TQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8Pp+cUvabxHafYAOUM4rb1+OCQgjSMhFI3IJfimbvEiOZ3ASwly2zKDA26vUb6Zn
	 o4ZKADA/q2vdJgb486cmhHifmhtPs58aoVofUyHRkGNbKd/XbFDsVRkB4MdMSPZquL
	 7dOCoIhU3D397z95W99LMRW5iDBGCnndnHmwELw8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 76/76] media: staging: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 04:30:58 +0300
Message-ID: <20250810013100.29776-77-laurent.pinchart+renesas@ideasonboard.com>
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

The second argument to the ioctl handlers is not a file handle any more.
The standard practice is to name it 'void *priv' in drivers. Many
drivers still name it 'void *fh', and a few use more exotic names.
Replace those more exotic names with 'void *priv' in all media staging
drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 16 ++++++++--------
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c     |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 24899f41dc1c..e7b99cee63d6 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -419,7 +419,7 @@ static void sun6i_isp_capture_format_prepare(struct v4l2_format *format)
 	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_isp_capture_querycap(struct file *file, void *private,
+static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 				      struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -433,7 +433,7 @@ static int sun6i_isp_capture_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
@@ -446,7 +446,7 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -456,7 +456,7 @@ static int sun6i_isp_capture_g_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_s_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -471,7 +471,7 @@ static int sun6i_isp_capture_s_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_try_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_try_fmt(struct file *file, void *priv,
 				     struct v4l2_format *format)
 {
 	sun6i_isp_capture_format_prepare(format);
@@ -479,7 +479,7 @@ static int sun6i_isp_capture_try_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_input(struct file *file, void *private,
+static int sun6i_isp_capture_enum_input(struct file *file, void *priv,
 					struct v4l2_input *input)
 {
 	if (input->index != 0)
@@ -491,7 +491,7 @@ static int sun6i_isp_capture_enum_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_input(struct file *file, void *private,
+static int sun6i_isp_capture_g_input(struct file *file, void *priv,
 				     unsigned int *index)
 {
 	*index = 0;
@@ -499,7 +499,7 @@ static int sun6i_isp_capture_g_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_input(struct file *file, void *private,
+static int sun6i_isp_capture_s_input(struct file *file, void *priv,
 				     unsigned int index)
 {
 	if (index != 0)
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 3d95ed0b023e..77c2d06c0436 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -383,7 +383,7 @@ static const struct vb2_ops sun6i_isp_params_queue_ops = {
 
 /* Video Device */
 
-static int sun6i_isp_params_querycap(struct file *file, void *private,
+static int sun6i_isp_params_querycap(struct file *file, void *priv,
 				     struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -397,7 +397,7 @@ static int sun6i_isp_params_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_params_enum_fmt(struct file *file, void *private,
+static int sun6i_isp_params_enum_fmt(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *fmtdesc)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -412,7 +412,7 @@ static int sun6i_isp_params_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_params_g_fmt(struct file *file, void *private,
+static int sun6i_isp_params_g_fmt(struct file *file, void *priv,
 				  struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
-- 
Regards,

Laurent Pinchart


