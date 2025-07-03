Return-Path: <linux-media+bounces-36731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2692AF838D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EACF545CAF
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1582C0326;
	Thu,  3 Jul 2025 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bf/LdZnS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24D2BF011;
	Thu,  3 Jul 2025 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582352; cv=none; b=Nzc6mw2qS6tVUkJU7mKZP4gPU6aTvCO9U6Lm+cAZIG6QrGS+elP64idSbovGKxPINr0sRgZwZ1xoOTT4QFWbVBlD9r2tyiTvze6K+cadRVjfEAwQj7whL8HdjZxK6r7VNDsnO+aARxrCih2jkiaz/xqnCdDSpZ2I5xvnH1hF8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582352; c=relaxed/simple;
	bh=Unli75nNXDef97rsgX6LE+x1ePeQ0Mc4wyQUOtpEC98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvZqbjpl/xGR4FbkD4Xg0VqPIYL9VGfyB3qxudD1b69Or4AcY4SexM1IuyDqDiqyMVbFoLbbgrvF2RqRXyiIC/2NoPzUlzcPgQBApaQFw/iZdyBmVntfVIPpN1x47+FQhxaDnDidlg4FkCJMLd402LbfcJwBmJpGsbzpLQ8BsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bf/LdZnS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BC006E45;
	Fri,  4 Jul 2025 00:38:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582317;
	bh=Unli75nNXDef97rsgX6LE+x1ePeQ0Mc4wyQUOtpEC98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bf/LdZnS+K3+PCHQ+sRd5+U9/yd2i0n6nL5A13y8HQpftvgsiauVODRRKo9r2x5+C
	 eCbXb2+vfpG09FGOVsBhf186qcqBrbGpT29HrKP9nmLkOTjeRMtMnBgYmFQmGE9R8h
	 G1Z+ZYQ7KLCOTk6h4lncERJh7jmWGxzAoM2STirs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 4/8] media: renesas: vsp1: Fix crop left and top clamping on RPF
Date: Fri,  4 Jul 2025 01:38:22 +0300
Message-ID: <20250703223826.10246-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPF doesn't enforces the alignment constraint on the sink pad
format, which could have an odd size, possibly down to 1x1. In that
case, the upper bounds for the left and top coordinates clamping would
become negative, cast to a very large positive value. Incorrect crop
rectangle coordinates would then be incorrectly accepted.

A second issue can occur when the requested left and top coordinates are
negative. They are cast to a large unsigned value, clamped to the
maximum. While the calculation will produce valid values for the
hardware, this is not compliant with the V4L2 specification that
requires values to be adjusted to the closest valid value.

Fix both issues by switching to signed clamping, with an explicit
minimum to adjust negative values, and adjusting the clamp bounds to
avoid negative upper bounds.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 56464875a6c5..ffc1b3ab54e2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -201,6 +201,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
+	unsigned int min_width = RWPF_MIN_WIDTH;
+	unsigned int min_height = RWPF_MIN_HEIGHT;
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
@@ -229,18 +231,36 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
 	/*
-	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
-	 * shifting the color plane.
+	 * For YUV formats, restrict the crop rectangle coordinates to multiples
+	 * of 2 to avoid shifting the color plane.
 	 */
 	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
 		sel->r.left = ALIGN(sel->r.left, 2);
 		sel->r.top = ALIGN(sel->r.top, 2);
 		sel->r.width = round_down(sel->r.width, 2);
 		sel->r.height = round_down(sel->r.height, 2);
+
+		/*
+		 * The RPF doesn't enforces the alignment constraint on the sink
+		 * pad format, which could have an odd size, possibly down to
+		 * 1x1. In that case, the minimum width and height would be
+		 * smaller than the sink pad format, leading to a negative upper
+		 * bound in the left and top clamping. Clamp the minimum width
+		 * and height to the format width and height to avoid this.
+		 *
+		 * In such a situation, odd values for the crop rectangle size
+		 * would be accepted when clamping the width and height below.
+		 * While that would create an invalid hardware configuration,
+		 * the video device enforces proper alignment of the pixel
+		 * format, and the mismatch will then result in link validation
+		 * failure. Incorrect operation of the hardware is not possible.
+		 */
+		min_width = min(ALIGN(min_width, 2), format->width);
+		min_height = min(ALIGN(min_height, 2), format->height);
 	}
 
-	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
-	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
+	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
+	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
 	sel->r.width = min_t(unsigned int, sel->r.width,
 			     format->width - sel->r.left);
 	sel->r.height = min_t(unsigned int, sel->r.height,
-- 
Regards,

Laurent Pinchart


