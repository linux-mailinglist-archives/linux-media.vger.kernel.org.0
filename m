Return-Path: <linux-media+bounces-33772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D0ACA26A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 458FD3B21E2
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496BB269819;
	Sun,  1 Jun 2025 23:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdIqWb8r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA762690EA;
	Sun,  1 Jun 2025 23:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820421; cv=none; b=ZQ0O9/QRzLcs0IUMCTNOqEeNN2Rzym71WI+b9DV7rSQwlIyJgLz0o+Jn1Trip+wrnoVpp9KpP76le3LxwIUc/Se/hsLTuvG2gFSjrjgvD7ZuFugpSQiXwlrpiwF12H1pAyflQav7mfoLUHc63MUohTcduQwveIdJQ81XYGGIR+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820421; c=relaxed/simple;
	bh=dt8kPgWDpFu2sSg07IECaKF33MJ/jwpv24xF5OlDrII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QTsSZY+xbPyZ+d5NWMe/61W+lJknr/RWVLQcTs6nApl9NQVEUwfiiUfd0XWZSQg+oEPNWrZhlJ8g4MfS5FZw7pkevv0ivoOfoAhMcD9yy2zJtWWFB10A265fVJWG3FUPe1dO13HNzktVvdwfaiWtPST8VdKl+MmYIkhlmZbUnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdIqWb8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5424EC4CEF1;
	Sun,  1 Jun 2025 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820421;
	bh=dt8kPgWDpFu2sSg07IECaKF33MJ/jwpv24xF5OlDrII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WdIqWb8r4kt6iAIp6YlsqR9MdecVFUAQ8eMwaUmdTyRQnMOsbObHG6QOmgYKL7rfS
	 intzkTDS2nZ0cSYR3AAYU8CLIdj+CNNal4/nDMvvO8TzcW+LwTEtuES+9uYDNT74Bj
	 UJvNe4ywNdjBtbsIhhZ9jdmEbFeuj1NVgpKTdeMYj7s46soV0F+mnG/7+BV+fOyIbE
	 Zr8ZOPc4+plT7HZU1Mx3ZJV7/oFi23qUbLE7KhYU4CYXflRAhijNSQI8mCrWbTItLx
	 eDZfmvQgno/Ty1N4pyYW+KbZLvWcr3+ZtLi/a+ybPS7Lj4ln/CAPVZZFYjAJavS30h
	 OWgAKT+QjMPyw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 052/110] media: rkvdec: h264: Use bytesperline and buffer height as virstride
Date: Sun,  1 Jun 2025 19:23:34 -0400
Message-Id: <20250601232435.3507697-52-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

[ Upstream commit d5e0aa61470c48ddc04d433a00e79cef8716377a ]

Use bytesperline and buffer height to calculate the strides configured.

This does not really change anything other than ensuring the
bytesperline that is signaled to userspace matches what is configured
in HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

### Key Reasons for NO Backport: 1. **Not a Bug Fix**: The commit
message explicitly states "This does not really change anything other
than ensuring the bytesperline that is signaled to userspace matches
what is configured in HW." This is not fixing a functional bug but
rather improving consistency between userspace and hardware
configuration. 2. **Code Quality/Consistency Improvement**: The changes
are primarily about code correctness and consistency rather than fixing
a critical issue that affects users. This aligns with similar commits
#1, #2, and #4 which were marked as NO for backporting. 3. **Staging
Driver**: The rkvdec driver is in `drivers/staging/media/`, which
indicates it's still under development and not considered stable.
Staging drivers typically have more relaxed backporting requirements. 4.
**Specific Code Changes Analysis**: - **Before**: `hor_virstride =
(sps->bit_depth_luma_minus8 + 8) 0001-Fix-Clippy-warnings.patch
0002-Enhance-inference-prompt-to-utilize-CVEKERNELDIR-whe.patch
0003-Update-to-latest-version-of-clap.patch Cargo.lock Cargo.toml
LICENSE README.md adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md dst_fmt->width / 8;` -
**After**: `hor_virstride = dst_fmt->plane_fmt[0].bytesperline;` -
**Before**: `ver_virstride = round_up(dst_fmt->height, 16);` -
**After**: `ver_virstride = dst_fmt->height;` 5. **No Risk Indication**:
The changes don't indicate they're fixing crashes, data corruption,
security issues, or other critical problems that would warrant stable
backporting. 6. **Pattern Match with Similar Commits**: Looking at the
provided examples: - Similar commits #1, #2, #4, and #5 that make
stride/calculation improvements were marked as NO - Only commit #3 that
increased max supported height (a clear functional limitation fix) was
marked as YES 7. **No Stable Tree Mention**: The commit message contains
no indication of stable tree inclusion via Fixes: tags or explicit
stable tree requests. ### Conclusion: This commit improves code
consistency by using the actual bytesperline values from userspace
instead of calculating them from SPS parameters, but it doesn't fix a
user-impacting bug. It's a code quality improvement that follows the
pattern of other NO-backport commits in the provided examples.

 drivers/staging/media/rkvdec/rkvdec-h264.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 4fc167b42cf0c..7a1e76d423df5 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -896,9 +896,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	dma_addr_t rlc_addr;
 	dma_addr_t refer_addr;
 	u32 rlc_len;
-	u32 hor_virstride = 0;
-	u32 ver_virstride = 0;
-	u32 y_virstride = 0;
+	u32 hor_virstride;
+	u32 ver_virstride;
+	u32 y_virstride;
 	u32 yuv_virstride = 0;
 	u32 offset;
 	dma_addr_t dst_addr;
@@ -909,16 +909,16 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	f = &ctx->decoded_fmt;
 	dst_fmt = &f->fmt.pix_mp;
-	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
-	ver_virstride = round_up(dst_fmt->height, 16);
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
 	y_virstride = hor_virstride * ver_virstride;
 
 	if (sps->chroma_format_idc == 0)
 		yuv_virstride = y_virstride;
 	else if (sps->chroma_format_idc == 1)
-		yuv_virstride += y_virstride + y_virstride / 2;
+		yuv_virstride = y_virstride + y_virstride / 2;
 	else if (sps->chroma_format_idc == 2)
-		yuv_virstride += 2 * y_virstride;
+		yuv_virstride = 2 * y_virstride;
 
 	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
 	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |
-- 
2.39.5


