Return-Path: <linux-media+bounces-48055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF12C9A914
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CCBDD34629C
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D4B303CA8;
	Tue,  2 Dec 2025 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NA+nd+xJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14C30276C
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661975; cv=none; b=IPQn1qz1jVSTlpYCXTt4NJnFfYbprJRS5YbL7EPp+ELteCz1KhgFtF8sQXyT3BNxvTj8x3JmavXz2nmek2ZJaU2X/W7KxZlutJQ9qJ/8DDZWzQczrnhMGNOt7il88EjFiCT1MQjko5nfP1ikGSJfJ6oVaT2FW4Hc8ciabp320eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661975; c=relaxed/simple;
	bh=eOHalLkyapHOnT1R44/hdB5Ix9iW/5IYD6IcHRQz8P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7AOGKYEZ5MWuHyj450KjN3WbOXQkABl02GBTUnpRPIx3h3LfFBV7skCYlK5z65A9cV4SiGhCdizh8cF21FAxHxSjDd6xZsRiF18aojQ0Tr94BBEbkJwhnXfEG2VNyS6odJLLdy0rfrGJYBhTsZKsl6nwWyO7fpPr4yr5QCOc7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NA+nd+xJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C15DC116B1;
	Tue,  2 Dec 2025 07:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661974;
	bh=eOHalLkyapHOnT1R44/hdB5Ix9iW/5IYD6IcHRQz8P8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NA+nd+xJ1eweek6+OhNNPvaoT5z/QG2B+uthXqPoaV8LjXKgxB3mYYTRH/Jp9obZG
	 1TN0LBAys7FKpRJW95ZpZTCEJwRaSDisFajLFUox370Z3NGrQlOVIKZENCrzQ9YHUs
	 3xMJpSZ6cNZy5lZmoMjrLYiycns8Uc3SolnbzdvxOsnWLgUBtG8v3WR1M49Fx2l4L8
	 JpHHKfCQJFB23h70mF6PFl0dwqPwcPndCZpt3rEYPrmV2yVYd6hfS9Psrllai8zy/e
	 J3U9lIjBEK5BefvEx8E7t3aMIxm3P3+iThBIvgcJTw6wDft5TQGtjO6tWMxahNqE25
	 uymBop3HKcj8A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 12/12] media: omap3isp: isppreview: always clamp in preview_try_format()
Date: Tue,  2 Dec 2025 08:51:20 +0100
Message-ID: <f753928284b7144d74e57da167ce375c09fa9545.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
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


