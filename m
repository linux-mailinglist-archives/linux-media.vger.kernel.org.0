Return-Path: <linux-media+bounces-33815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630DFACA52D
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231E816C94B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E893012D4;
	Sun,  1 Jun 2025 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qgc73YQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF83012BF;
	Sun,  1 Jun 2025 23:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821006; cv=none; b=m4pBprdFWMgZdUS9/cCF0oFdzAdCh49xYKuU4yW5F7Mwx+CYCo22WkHlAj3bWyXWFzxU+UT26a+l/YCqmwOtIfd2WD0HemXq+MGvux2aEFtLaViMavZxQ4bKPix79e9V/C1/UXY7isSzwCU2MzoStYCQMs9H3nXG440yVlniB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821006; c=relaxed/simple;
	bh=C46JUL7bTtrn0ddSAXxVkFRaXbm18vxDw19GfiYjUQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzfDePsEuFB3A58A7TngZujgaiYlNTsedCyZqd3G9pEZs7YZtw+JUsd/w3zwQx0wkFBOYy2tpDJaZvgU48X+/o9RX3D9sEFoMjIlKnWGvThbAcY+BlCtXLh9WLlnFecoWxz9e1McR2c/Tb2htfl3KuKldqrtrTypEA9+DQ82Wtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qgc73YQ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37342C4CEEE;
	Sun,  1 Jun 2025 23:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821006;
	bh=C46JUL7bTtrn0ddSAXxVkFRaXbm18vxDw19GfiYjUQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qgc73YQ9C4p6iugQB52TP3QVrnHcG9vUz1LgR6rJMIv1GraRxBI4Z8fGraYVxi4kf
	 Rbu1VcMJRopWUVCK2fz//yVfzmhKB86hmgTrUXul3N74K7go71VoKLAN+tK/kpqVYE
	 0FDtpcsJ3u4csLcBdLIGL6rSzWYe795IKQzOOUQTT3RTfuwwI8Xq+Mc1Ua4WL/avHb
	 HXfasVqivG6FvRJJa9SxUyoVHUhepADLaPupOKRj24ZyZN1dhsKM+J9jZtqQz5Nkvl
	 ZygqE1C5xsvhCmPmjX9UjyQz8CWPLB4IndYibDNHj0RXuUvzGi4F2wgbqZEkQR1PiL
	 AvCYqaV6go5AQ==
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
Subject: [PATCH AUTOSEL 6.12 63/93] media: rcar-vin: Fix stride setting for RAW8 formats
Date: Sun,  1 Jun 2025 19:33:30 -0400
Message-Id: <20250601233402.3512823-63-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
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
index 21d5b2815e86a..f2b098056542d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -677,22 +677,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 
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


