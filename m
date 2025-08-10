Return-Path: <linux-media+bounces-39310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A458B1F7C7
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA9A3BC1D9
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1D31F0991;
	Sun, 10 Aug 2025 01:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e5BVoSDr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A95194C86
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789546; cv=none; b=srW7owzn5Bdz3SMMMutiLWLxT6TfjVOLN/aZCFb95W7R3ceMYKlqJZtTuMSbNgHsKzAnP/VCYV6qA6S0L2AmpJursFcapy6E7i7qfN4yDHwhtAJ5SsHf63YP78RfRtj++J+/JKk4dRSfLH7ioth6Pia5L08tJ6KRVyxWyY5JQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789546; c=relaxed/simple;
	bh=SCnMn609VAUM2KKbbQUq8jpo/bDnKWvrBzI4LeCjjl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C11LHrAar53vlbyv2bNs5fkP7fR/zsOE3AMa8xE0hS+0zYCve4h5ztPnDENrFykMhzs4sfYiI0VTn6eEUQN1rpMsH2z/LdDfo+Rsqacz5h+V7ugoXAR27lANVumO/pgKQ+NYSCIje/vMR+A5afFSQmJkNRwzh1345E2bpuA7Dic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e5BVoSDr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45F5A1B3C;
	Sun, 10 Aug 2025 03:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789491;
	bh=SCnMn609VAUM2KKbbQUq8jpo/bDnKWvrBzI4LeCjjl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e5BVoSDrnqnRZ3uwtKgU/UPKuwsuuYflxKbcBoPoSqoIHm+vVXw4eoEVNpOT8kmnJ
	 ++/fqar3WcGj1jImwp3kz4Gi1PlJWKAVurtaksXN5jeLTIbi1goPM4XnWnRcNiO0im
	 qlAaVz0xzY8eEdFjSWc/JR/9IWKMNATkpcQS0pcQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 37/76] media: meson-ge2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:19 +0300
Message-ID: <20250810013100.29776-38-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index b1b0b6535fb1..5744853a4003 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -457,7 +457,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct ge2d_frame *f;
 	bool use_frame = false;
 
@@ -507,7 +507,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct ge2d_frame *f;
 	int ret = 0;
@@ -574,8 +574,8 @@ static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f
 
 static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	const struct ge2d_fmt *fmt = find_fmt(f);
-	struct ge2d_ctx *ctx = priv;
 	struct v4l2_pix_format fmt_cap;
 
 	vidioc_setup_cap_fmt(ctx, &fmt_cap);
@@ -595,7 +595,7 @@ static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
@@ -631,7 +631,7 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
 
@@ -670,7 +670,7 @@ static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm, *frm_cap;
-- 
Regards,

Laurent Pinchart


