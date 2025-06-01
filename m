Return-Path: <linux-media+bounces-33789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABADACA3F7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEDC216FDB1
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACF328FA95;
	Sun,  1 Jun 2025 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoCSzg0i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B028FAAC;
	Sun,  1 Jun 2025 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820690; cv=none; b=gY/OfoGHUM7BKj2xfROZNcZgA7kf2WVJwWhTPJ0RYLN9OsHYTFrn9cIh0NUlJR6XL/W3Y0c0z8R0L02jwt1oMGigXqZ9Cny8+9gIZs2EJiLHJxfdF0omC+qQe1xM6MdkxtA8VDPSpJXMKojQLjGyf8JU4PvRpiP02BzmDaph4Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820690; c=relaxed/simple;
	bh=WWweUVkZLxToskZKMTXLs4Hq2iUwmPhSIni0qTxLnYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+SjHCj1dZme4d/4yNZ2rBdDxhsIhTIXUpwbYa1gcPy/m2an7tllzsCYANxy3frTHdpUleYSN5XWqYVNq/v9TzoWF9Y2CA+iUfwHT7dSsJFiVOSewZ+aEzA4Mow2jboih8IqiwXcKrZ+0pKXXc0OO6sUQXQ/SX6Vho3AWGCOpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoCSzg0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F70C4CEF2;
	Sun,  1 Jun 2025 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820690;
	bh=WWweUVkZLxToskZKMTXLs4Hq2iUwmPhSIni0qTxLnYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoCSzg0iBguL1cdTN5/YsU9Yp7/+KNXIJ+yBcgLuCTTB179/feK+fXmYk+0QrgtCJ
	 UbZ76zhIxo1TEY6UvCkunXKmupxKV3B5Y7yzkus5x/u7xxPX4qMMKJ5LdccPr5xNve
	 d7ZcDvJPj0SmMFD6vm91yHGI7qu6Tf5CsHlO/6Ay+MLse/fWAmGfrPCwmrzXGTwbdI
	 dq6h/Gq7P6t+d4TvqVSY0ovTwLpAe0nP+a0qlHqebKYmnfB5RSmsckciFBLRF8wDp0
	 iSXpn8winDVD477dlBt8gSW2Hy8yyPgiUtMYvBwu7RkE5I+RA2mHYuANzwBMHbCZ1I
	 GkhSL1lysfLJQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	bparrot@ti.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 045/102] media: ti: cal: Fix wrong goto on error path
Date: Sun,  1 Jun 2025 19:28:37 -0400
Message-Id: <20250601232937.3510379-45-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit a5b18fd769b7dc2e77a9e6a390844cbf50626ae8 ]

If pm_runtime_resume_and_get() fails, we should unprepare the context,
but currently we skip that as we goto to a later line.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## Bug Analysis The commit fixes a **resource leak
bug** in the error handling path of the CAL (Camera Abstraction Layer)
media driver. The specific issue is: 1. **What happens**: In
`cal_start_streaming()`, if `pm_runtime_resume_and_get()` fails after
`cal_ctx_prepare()` has been successfully called, the code incorrectly
jumps to `error_pipeline` instead of `error_unprepare`. 2. **The
resource leak**: This means `cal_ctx_unprepare()` is never called, which
fails to: - Release any reserved pixel processor units (via
`cal_release_pix_proc()`) - Properly clean up context resources that
were allocated in `cal_ctx_prepare()` 3. **Impact**: This creates a
**hardware resource leak** where pixel processor units become
permanently unavailable, potentially preventing future camera operations
from working properly. ## Code Change Analysis The fix is **minimal and
surgical**: - **Before**: `goto error_pipeline;` (line 761) - skips
cal_ctx_unprepare() - **After**: `goto error_unprepare;` (line 761) -
properly calls cal_ctx_unprepare() first The fix adds a new label
`error_unprepare:` that ensures: 1. `cal_ctx_unprepare(ctx)` is called
to release resources 2. Control then flows to `error_pipeline:` for
remaining cleanup 3. The error handling sequence becomes: unprepare →
pipeline cleanup → buffer release ## Stable Tree Criteria Assessment **✅
Fixes important bug**: Resource leaks in hardware drivers can cause
system instability and prevent devices from working correctly. **✅ Small
and contained**: Single line change plus one new label - extremely
minimal modification. **✅ Low regression risk**: The fix only changes
the error path to properly clean up resources that were already being
cleaned up in the success path. **✅ Clear side effects**: No
architectural changes, just proper resource cleanup ordering. **✅
Critical subsystem**: Media drivers are important for many embedded
systems and devices. **✅ Clear benefit**: Prevents hardware resource
exhaustion that could break camera functionality. ## Historical Context
Looking at the similar commits provided: - **Similar Commit #5**: Also a
CAL driver fix that was marked "Backport Status: YES" for fixing initial
buffer handling - The pattern shows CAL driver bug fixes are considered
appropriate for backporting when they fix real functional issues ##
Conclusion This is a textbook stable tree candidate: it fixes a real
resource leak bug with a minimal, safe change that has clear benefits
and virtually no regression risk. The fix ensures proper cleanup of
hardware resources (pixel processors) that are limited in number and
critical for camera operation.

 drivers/media/platform/ti/cal/cal-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index e29743ae61e27..c16754c136ca0 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -758,7 +758,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = pm_runtime_resume_and_get(ctx->cal->dev);
 	if (ret < 0)
-		goto error_pipeline;
+		goto error_unprepare;
 
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
@@ -775,8 +775,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 error_stop:
 	cal_ctx_stop(ctx);
 	pm_runtime_put_sync(ctx->cal->dev);
+error_unprepare:
 	cal_ctx_unprepare(ctx);
-
 error_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 error_release_buffers:
-- 
2.39.5


