Return-Path: <linux-media+bounces-33779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0FDACA2FB
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24651892BB6
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AEF2741AD;
	Sun,  1 Jun 2025 23:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jglMpM3K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56CB272E63;
	Sun,  1 Jun 2025 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820499; cv=none; b=skF/hisOdEJJ4Qkaho2wxxAYOcPlNJLDOhUktwCkyVsxC340kfqYOgRu+nSbGMeJV7LzO8ehndwcg4RMu8isGI0zuu+ChEvZQCvQiuUt6IjAEr7narn2XbgSNEhyHiovIIpZayXwzTomrA2v9OzXSze/Z1DXC2G1clpAUUU5oj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820499; c=relaxed/simple;
	bh=zu3m5Srkc9jh8dAzxMrFXkdW7FEaom6aY+vqpPWbA4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCNLgTL61SCHfnqCJ0SHnNAWjLrF4V/+0+/OWytsQtaznN3FHPJHQ5fmle4Fer8bQ4+y6SHSlG/q9KFR0P2YvWbfwPOMg243btWCqP41yuyV3x8LFyQ4GvPl0nBxUbK/DwEEVDu7qDiiXDmnSsEiN8f+rs7E6l5QL1zC0J1JgWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jglMpM3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9367C4CEF1;
	Sun,  1 Jun 2025 23:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820497;
	bh=zu3m5Srkc9jh8dAzxMrFXkdW7FEaom6aY+vqpPWbA4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jglMpM3KcY063a4dfv120rU77YNlOfbjiE9Sa2dSAD8VN9R3exOVtJL0lu2fJH/M/
	 YBZ9YztQIsIEJqjXKYqcX/OESLEhZPAHIl7EzyW6E+yby3xK1hnjpI2EOQrCI66BPS
	 goidiVe8T9QiO+49aepFF1KUDMKhnAUEbnz1j01C9UnYaLB/2ltYn+hDBAe+oDkKgi
	 KAfZG0no4k+5oK140600Oyg9Afbp96FOwdOtxjfh3itcmR4hHhoQtcjvBsZ2my7IJ+
	 rAcNrrBsdXVJK44CxpT9JGEogu4bikiqB1PzWN1skS1nbciUlfPEFaz3cVWL20bohL
	 ZF7PEJK2wdHTA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 074/110] media: rcar-vin: Fix stride setting for RAW8 formats
Date: Sun,  1 Jun 2025 19:23:56 -0400
Message-Id: <20250601232435.3507697-74-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

[ Upstream commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ]

Earlier versions of the datasheet where unclear about the stride setting
for RAW8 capture formats. Later datasheets clarifies that the stride
only process in this mode for non-image data. For image data the full
stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".

Remove the special case from pixel formats that carry image data and
treat it as any other image format.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Link: https://lore.kernel.org/r/20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Nature of the Fix This commit fixes a
**hardware configuration bug** in the R-Car VIN (Video Input) driver for
Renesas SoCs. The commit message clearly states that earlier datasheets
were unclear about stride settings for RAW8 formats, and updated
datasheets clarified that the special stride/2 handling should only
apply to "non-image data," not regular image data. ## Code Analysis The
change removes problematic special-case logic from
`drivers/media/platform/renesas/rcar-vin/rcar-dma.c:662-696`: **Removed
Code (Lines 683-696):** ```c /bin /bin.usr-is-merged /boot /dev /etc
/home /init /lib /lib.usr-is-merged /lib64 /lost+found /media /mnt /opt
/proc /root /run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr
/var For RAW8 format bpp is 1, but the hardware process RAW8
amd_display_timing_generator_analysis.md amdgpu_csb_analysis.md
cgroup_rstat_analysis.sh cgroup_rstat_analysis_guide.md
expected_findings_summary.md kernel_analysis_commands.sh
sta2x11_removal_analysis.md format in 2 pixel unit hence configure
VNIS_REG as stride / 2. */ switch (vin->format.pixelformat) { case
V4L2_PIX_FMT_SBGGR8: case V4L2_PIX_FMT_SGBRG8: case V4L2_PIX_FMT_SGRBG8:
case V4L2_PIX_FMT_SRGGB8: case V4L2_PIX_FMT_GREY: stride /= 2; break;
default: break; } ``` This removal is **safe and necessary** because: 1.
**Corrects Hardware Behavior**: The original code was based on incorrect
understanding of hardware requirements from unclear documentation 2.
**Minimal Risk**: Only affects the VNIS_REG register setting for
specific RAW8 pixel formats 3. **Contained Scope**: Limited to R-Car VIN
driver RAW8 image capture functionality ## Backport Criteria Assessment
✅ **Fixes Important Bug**: RAW8 format capture was incorrectly
configured, likely causing image corruption or capture failures ✅
**Small and Contained**: 16-line removal in a single function, no
architectural changes ✅ **Clear Documentation**: Well-documented
reasoning based on updated hardware specifications ✅ **Low Regression
Risk**: The change aligns stride calculation with other pixel formats
and corrected hardware documentation ✅ **Affects User-Visible
Functionality**: Users capturing RAW8 camera data would experience
incorrect behavior ## Historical Context From the git history, I found
that the problematic `stride /= 2` logic was introduced in commit
`8c3e0f67df6c9` ("media: rcar-vin: Extend RAW8 support to all RGB
layouts") in 2020. The original comment stated "hardware process RAW8
format in 2 pixel unit hence configure VNIS_REG as stride / 2" - but
this was based on unclear documentation that has since been clarified.
## Comparison with Similar Commits The provided historical examples show
that similar R-Car VIN media driver fixes were **NOT** backported, but
those were primarily: - Feature additions (extending RAW8 support to
more layouts) - New format support (RAW10 addition) - Non-critical fixes
(stride reporting corrections) This commit is fundamentally different as
it **fixes incorrect hardware configuration** that would cause
functional problems for existing users. ## Risk Assessment **Very Low
Risk**: - Only removes incorrect special-case handling - Makes RAW8
formats behave consistently with other formats - Based on authoritative
hardware documentation clarification - No new code paths or complex
logic introduced This fix is precisely the type that stable trees are
intended for: fixing incorrect behavior that affects existing
functionality with minimal risk of introducing regressions.

 .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8de8712404409..edb06730bc7c0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -679,22 +679,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 	stride = vin->format.bytesperline / fmt->bpp;
-
-	/* For RAW8 format bpp is 1, but the hardware process RAW8
-	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
-	 */
-	switch (vin->format.pixelformat) {
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
-	case V4L2_PIX_FMT_GREY:
-		stride /= 2;
-		break;
-	default:
-		break;
-	}
-
 	rvin_write(vin, stride, VNIS_REG);
 }
 
-- 
2.39.5


