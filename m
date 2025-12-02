Return-Path: <linux-media+bounces-48042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C41C9A8DE
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5927C3A658F
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AA5302CB0;
	Tue,  2 Dec 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTd18HCK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EE302CC4
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661759; cv=none; b=ux9Gy/zXz4iY4nziGNFoRt0EBgXSRnGFB6xhAbqdwfjO5kUGSFn92eHklh2AJdXg+SgKDyI3pTKrX1F4TfxqB+SdfxQ20OrzWLWlJ/Xg3X/I2kdSZmd2RFNN4TlpM2f3E0wErerherwj2OYqrfetwDVeY6bDz9h8BTmoNW04SYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661759; c=relaxed/simple;
	bh=Fxdl+qkjTp4qNBwdwHOkqx+o8ivGaUbUxjGHT8MqB5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heapk/Ghwfk8HjPKnH62U9G9c1f9ZB4sS62K+oVR01yprYYdByHjuodDTLDpYVmyt3z2Yxu8yPYHcbD1WxXiZSgp5tteEyC9LW/QqF0KEGToTCnqo+Fzp1yzopr6nrm2tffxwRHbIuCKZAskbFB4nrdVehMPPuEYzHmICNb7wX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTd18HCK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45DBC4CEF1;
	Tue,  2 Dec 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661759;
	bh=Fxdl+qkjTp4qNBwdwHOkqx+o8ivGaUbUxjGHT8MqB5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTd18HCKaKd/zgPtuaWnZS3z5EMxF93MXptVfHwA2n/5lLLoDY+oAjqYVwoKumw2S
	 QZPjnJd0IEB6215LSzbz4InQz53P6SZgllOTCDSs96n1h+sezO5m7sbyuS34BSo4z/
	 0C0odn2734jUxVAwHuh2kVuIxhVgq7yzuI/LCRuCccFxJBDgKTyn/oK9kctMKy5Bja
	 SylTGsJuAbN5XLcBn1vFUO3StQzUBS1bHNnSJpcFGnAk8FJ6izSgDPlm+s6tJ1P/PN
	 MFSlDdNpc0F5NjVB3K163R+zWmwk7BcWUMLbfDeiWI+jjCYPuYfhULVuUpa8bfngn1
	 ZLX9G5vtAlOJA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 11/11] media: omap3isp: isppreview: always clamp in preview_try_format()
Date: Tue,  2 Dec 2025 08:48:12 +0100
Message-ID: <e2e22fe86adc6df606b82df34871addef3b13e4d.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
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
index 8720c6b38e79..601fffec8733 100644
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


