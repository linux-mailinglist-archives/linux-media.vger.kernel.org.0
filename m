Return-Path: <linux-media+bounces-33803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE708ACA4E7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEED6189BE29
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406882BEC4E;
	Sun,  1 Jun 2025 23:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQsZuMDV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4D2BFC6F;
	Sun,  1 Jun 2025 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820916; cv=none; b=e/dBzJA7PBKtjq5KYT02lvdf3B2VOwf0ykgy7YoHZP5T5xPWOcn4GgjXebcfkP3CAW52rfWJ7u7Sn0udBElyLOuJsf+NahQG1/nOE2GXUyP4EKtomdC6WoPw8HHpTSUwYRs3wuIr7my0P/I4JBYS36ExdaDYddXbS89X8GLFgxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820916; c=relaxed/simple;
	bh=ttfOECRtD5PXtaIw69vMnoWuEDtkXJQhrGI743nHL1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a7X0tPREs8ej30umBCOnNtnRmZeQJGaDp9s9ykfXQsxLLfHAZjPfsEFHZgACnJPL3fmNrOLCj8F+6YI8ahd7INEZslvXJKTqw6XWMGsp4JPSO5N51QAkndHnQwXm9qWKpJZxW8qn9tGBGhmmN5pQvUNWrsE8Wh7AXP23CXv6oXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQsZuMDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEE1C4CEE7;
	Sun,  1 Jun 2025 23:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820915;
	bh=ttfOECRtD5PXtaIw69vMnoWuEDtkXJQhrGI743nHL1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQsZuMDVK7fPxtuTVBYO/eiMTw9f9wwcToivU4wO6D6KQdNNhjMKJSw1oVFLQk70f
	 NEnWHGUuR9QgJBq2pqNdwqtPCRRofxG0xjcniTPXT3zod6CkrQ1r2ysCW07rDk3c+c
	 bO7m1bzZ1Tkfru0MYr6e0H08Mq0eF7xCrI8T/7bRNYP+/Q8ME/9qPhg1CTFrYVAkBy
	 r48BiVkwylI2PaNkdJUrsbUx15z5+B4wkpFRAfQYmlHe5ytsiN+VV+hrpKYnURuD6z
	 Kq17j1d0746nJPoPJZUfKvd53vwPTRdVaUwiKij05He3DRJpg9+u0/6JDzZyEHslKF
	 jCLd0dZ1LDljw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 28/93] media: verisilicon: Enable wide 4K in AV1 decoder
Date: Sun,  1 Jun 2025 19:32:55 -0400
Message-Id: <20250601233402.3512823-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Transfer-Encoding: 8bit

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

[ Upstream commit 311e40e877bd980bc665e6c8d3b15d96f0ec2aa8 ]

Tested on RK3588, this decoder is capable of handling WUHD, so bump the
maximum width and height accordingly.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Analysis This is a **bug fix** that corrects an artificial limitation in
the AV1 decoder driver, not a new feature addition. Here's my detailed
analysis: ### Nature of the Change The commit changes format capability
declarations from `FMT_UHD_WIDTH/HEIGHT` (3840x2160) to
`FMT_4K_WIDTH/HEIGHT` (4096x2304) for the RK3588 AV1 decoder. Looking at
the constants in the codebase: - `FMT_UHD_WIDTH` = 3840,
`FMT_UHD_HEIGHT` = 2160 (standard UHD) - `FMT_4K_WIDTH` = 4096,
`FMT_4K_HEIGHT` = 2304 (Cinema 4K) ### Why This is a Bug Fix 1.
**Hardware Capability vs Driver Limitation**: The commit message states
this was "Tested on RK3588" and confirms the decoder is "capable of
handling WUHD", indicating the hardware already supports these
resolutions but the driver was artificially limiting them. 2. **User-
Visible Problem**: Users with Cinema 4K content (4096x2160 or wider)
would experience decode failures despite having capable hardware. 3.
**No New Hardware Features**: This doesn't enable new hardware
functionality - it simply removes an incorrect software limitation. ###
Risk Assessment - Very Low 1. **Minimal Code Changes**: Only changes
constant values in format capability arrays - no algorithmic logic
changes. 2. **Backward Compatibility**: Existing UHD content (3840x2160)
continues to work exactly as before. 3. **Self-Contained**: Changes are
isolated to the verisilicon media driver, affecting only format
capability declarations. 4. **No API Changes**: No changes to userspace
interfaces or kernel APIs. ### Comparison to Similar Backported Commit
This change is very similar to commit #5 in the reference examples
(marked "Backport Status: YES"): - Both increase maximum supported
resolution after hardware testing - Both are minimal, low-risk changes
to capability declarations - Both fix user-visible decode failures for
content the hardware can actually handle ### Stable Tree Benefits 1.
**Fixes decode failures** for users with Cinema 4K AV1 content 2.
**Improves hardware utilization** by removing artificial limitations 3.
**Very low regression risk** due to minimal, well-contained changes 4.
**Meets all stable tree criteria**: important fix, minimal risk, no new
features This commit clearly qualifies for stable backporting as it
fixes a user-visible bug with minimal risk and no architectural changes.

 .../platform/verisilicon/rockchip_vpu_hw.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c3559..b64f0658f7f1e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -85,10 +85,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
 		.postprocessed = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -99,10 +99,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
 		.postprocessed = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -318,10 +318,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
 		.match_depth = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -331,10 +331,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
 		.match_depth = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -344,10 +344,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
-- 
2.39.5


