Return-Path: <linux-media+bounces-44903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC9BE8F73
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A4A1AA6241
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AE13570CD;
	Fri, 17 Oct 2025 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZlAild8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADAE2F6906
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708331; cv=none; b=fFRHn3agN3fi9Tew2sKiFI1XjbVsdCRZ4hajbtadyKKDAxtIA3ussZODxtU5PP6vOp+ptNK3kyKdnk1kDT4qh/QvBmgvbJqSLVKv1l7ynf1x2+FtU6cPIX2NBhqFuSelndhI06ngfzDtfutbM61bGFuZP4edSrSQ977x+xpxghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708331; c=relaxed/simple;
	bh=eOHalLkyapHOnT1R44/hdB5Ix9iW/5IYD6IcHRQz8P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oO01gzSkmLOZf18/ZYR9mlxMv4BAYx6rMk8H6Z/apJ9mCsCtmU8LqKiA4VWIKgss3bUh+Cr2cWUF4oWyvkk05b+XZL5JcBoN7bd+2al3b9JS97B1mk0tc8aTmiVG4Hig02PePRJMLiRLoR+BDmcgJoafULgGPeuUY8P6gdSlhFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZlAild8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD99C4CEE7;
	Fri, 17 Oct 2025 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708331;
	bh=eOHalLkyapHOnT1R44/hdB5Ix9iW/5IYD6IcHRQz8P8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZlAild8PmN9MxfmAqa2LO7SAeJyaLz0gblDGfcvncmSxzpyl88Brw/Dr0oD38BaX
	 5PagJQ63YvHBbe3NuyfO2G47yD7rJcL/InEjv5PVVjQp311JPD9Jdk+eQ1tRIwS7+H
	 LqcMilcvmUzBCwQD9Ynlc4GQ3opBVOMxeAnrKKzJ3uu+mUS1GFbmUzPTcfViJobg45
	 aR+3PVcvGqD95Ftcu08QsMY1rt3xeniKOwgFgr7ceoj9pmfo9F2lPXqL/n3BPfOVee
	 LX9F+oXvY3x4DUhBVDkkgJ9YQesAWz8QSfudBtSKg3C6Wfa7R//nxmU7K4c1DVb1Xv
	 TsWgRHLtTzHDw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 12/14] media: omap3isp: isppreview: always clamp in preview_try_format()
Date: Fri, 17 Oct 2025 15:26:49 +0200
Message-ID: <18e6c7db086cf3ac690d3545c8aac823a9b0e6bf.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If prev->input != PREVIEW_INPUT_MEMORY the width and height weren't
clamped. Just always clamp.

This fixes a v4l2-compliance error:

	fail: v4l2-test-subdevs.cpp(171): fse.max_width == ~0U || fse.max_height == ~0U
	fail: v4l2-test-subdevs.cpp(270): ret && ret != ENOTTY
test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/ti/omap3isp/isppreview.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 3e9e213c6d8a..3f3b5bd9cdc7 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -1742,22 +1742,17 @@ static void preview_try_format(struct isp_prev_device *prev,
 
 	switch (pad) {
 	case PREV_PAD_SINK:
-		/* When reading data from the CCDC, the input size has already
-		 * been mangled by the CCDC output pad so it can be accepted
-		 * as-is.
-		 *
-		 * When reading data from memory, clamp the requested width and
-		 * height. The TRM doesn't specify a minimum input height, make
+		/*
+		 * Clamp the requested width and height.
+		 * The TRM doesn't specify a minimum input height, make
 		 * sure we got enough lines to enable the noise filter and color
 		 * filter array interpolation.
 		 */
-		if (prev->input == PREVIEW_INPUT_MEMORY) {
-			fmt->width = clamp_t(u32, fmt->width, PREV_MIN_IN_WIDTH,
-					     preview_max_out_width(prev));
-			fmt->height = clamp_t(u32, fmt->height,
-					      PREV_MIN_IN_HEIGHT,
-					      PREV_MAX_IN_HEIGHT);
-		}
+		fmt->width = clamp_t(u32, fmt->width, PREV_MIN_IN_WIDTH,
+				     preview_max_out_width(prev));
+		fmt->height = clamp_t(u32, fmt->height,
+				      PREV_MIN_IN_HEIGHT,
+				      PREV_MAX_IN_HEIGHT);
 
 		fmt->colorspace = V4L2_COLORSPACE_SRGB;
 
-- 
2.51.0


