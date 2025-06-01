Return-Path: <linux-media+bounces-33850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B8ACA703
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 03:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10A247A3ED9
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931532BDC5B;
	Sun,  1 Jun 2025 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a35Kq3z9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ADC2BDC49;
	Sun,  1 Jun 2025 23:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821390; cv=none; b=ZU/AIzIh2Ks6ymblorjkSge3NA3bSaVenUpB/HPISn0r3eYmNiHH0w2frvhUcVik97DroGiUlgaA9Z9AWvJgRJIJszKxPlhpn4ewIS7SBQjx5e9ovzuyfD9+J+OEqsItwvLhli+T4TPZK13tSjJM8bLBuIKKIEx0q8KCX4//xd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821390; c=relaxed/simple;
	bh=s+oQ2bo5B89Cat2VatCtbcQRDxCMdjPh8YLds/P4TDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WL4tAm8v7Q6GP72sfjurTnbPPk2brKBbcx/S0afhA4Cukkq6X9c+vbl9VbkQRGkIi/drziDIoXz8lhTIXXnwGVpmNdTeqeOL6gSUYIPXB+YQ8GHj9zhwh5dtIl9+vjA0kaO4au/tHvw0Ucqg3Pye3WFXv52kcn9WW88q7lTeOYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a35Kq3z9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0256C4CEE7;
	Sun,  1 Jun 2025 23:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821389;
	bh=s+oQ2bo5B89Cat2VatCtbcQRDxCMdjPh8YLds/P4TDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a35Kq3z9bRsDA+ayzYcJ2DREyIbGNvO4SpkUGpbnMMfMwleutwZsQe3gpTOkBVb1E
	 YEbRZb8OqU5eNfVLZbcJ/0TvDPGGItx4w37q0RVZd88j3XXwQnm7xiLzsbuRn8udhB
	 3P7x4+YiJ3whJqubJYZRUe8EQdy1Mgzhq80O/zhExVB2Wp6TyqkhhRsxF05dyHgtHz
	 mIRxHdh4xx6EsT93QYFL9TbDDqD/ta8RSPwcYlkVEysycgWwOVsyVpwudnSByLvjwQ
	 RmT5DqHZ1IcreVWrCRJfRZsLPcQ3/PJayC1aCTwvG5DvPOMgrSw76a1Kyw0jc2MJZH
	 nKLSKv3sBwP0Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 19/43] media: ti: cal: Fix wrong goto on error path
Date: Sun,  1 Jun 2025 19:41:59 -0400
Message-Id: <20250601234224.3517599-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234224.3517599-1-sashal@kernel.org>
References: <20250601234224.3517599-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
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

 drivers/media/platform/ti-vpe/cal-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index d87177d04e921..2e93c1b8f3597 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -744,7 +744,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = pm_runtime_resume_and_get(ctx->cal->dev);
 	if (ret < 0)
-		goto error_pipeline;
+		goto error_unprepare;
 
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
@@ -761,8 +761,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 error_stop:
 	cal_ctx_stop(ctx);
 	pm_runtime_put_sync(ctx->cal->dev);
+error_unprepare:
 	cal_ctx_unprepare(ctx);
-
 error_pipeline:
 	media_pipeline_stop(&ctx->vdev.entity);
 error_release_buffers:
-- 
2.39.5


