Return-Path: <linux-media+bounces-33791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5069ACA400
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C61D27A1C95
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7501290BBC;
	Sun,  1 Jun 2025 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEkxfPr0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F402900BA;
	Sun,  1 Jun 2025 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820704; cv=none; b=PGXN7mk6rj/tzB79rVETBKULFybQOztL6n+qQrBsRPrmtfPSOTuovu/wf0pAHJS6VtqH+EaohIm7mzceonIJjW7yyA4H8vIBtbNpx+OiSAS1xK7tO77PNxqkKbtjDm5MXcJlLeL/YEWm2XePrwcKrU8kDTJdQaSUq/z+T4veECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820704; c=relaxed/simple;
	bh=XYrRtZuOVTeI0fAa5/NfJJQDvr7rpN7tbXz6hxJSzwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V1t1MTbI/qrT/FszO2DgcLS0RDOqpRYLBRap+gYZoWmfNukYSKuCBq0FwDTNywfiW7yuAI0J5Qel4oOiJwPePnc8iOvIV+wLzRjyBFleV45/V2T5lC06YpIH/uI8lhKcSRKyEgjUPbyqC6b2o2QF8hf/anVI6FdRqemV/sRam3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEkxfPr0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD329C4CEE7;
	Sun,  1 Jun 2025 23:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820704;
	bh=XYrRtZuOVTeI0fAa5/NfJJQDvr7rpN7tbXz6hxJSzwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEkxfPr0250cf2O0FJK+m8nZTOYnAhlC5J5r+yfJGMWzWW1fSb59Tt0RDv7two/mX
	 +pC5Vf6Q65x0kK1+n4QgS6fOdjPKKzyyXfQPVc+K5/PmQhz6aCXe61EvjWwySg2L1F
	 dLPI7sjYmcYJUMUcwxtJVRyBtYMRyoj+1mIl63vB5DlAeeeOE0uJxam7Gm7HHk2oqd
	 xwHKhxeWfuBOc9pccz8/VW5JhTJypWVWhpiV9l5WkJiIbgNvvHeNv3WF2KlG68NBh8
	 NmtOmFXXkPrEOaq7CZhtyPL4BR6e+vrgFLnypJvzftlF9t2TFAu4A8jOk31olWpdY2
	 SAoYF6lOzHgxA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 049/102] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
Date: Sun,  1 Jun 2025 19:28:41 -0400
Message-Id: <20250601232937.3510379-49-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit 5edc9b560f60c40e658af0b8e98ae2dfadc438d8 ]

Fix gcc8 warning:

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Resizing the 'buf' and 'cmd' arrays fixed the warning.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

NO This commit should not be backported to stable kernel trees for the
following reasons: 1. **Non-critical compiler warning fix**: This commit
addresses a `-Wformat-truncation` compiler warning, which is a build-
time warning and not a runtime bug that affects users. The warning
indicates potential string truncation, but looking at the code, there's
no evidence this causes actual runtime failures or security
vulnerabilities. 2. **Consistent with similar commit patterns**: Looking
at the reference commits, all the similar format-truncation warning
fixes (commits #1, #2, #3, and #5) were marked as "Backport Status: NO".
Only commit #4 was marked "YES", but that one explicitly included "Cc:
stable@vger.kernel.org" in the commit message and had a "Fixes:" tag,
which this commit lacks. 3. **Missing stable tree indicators**: The
commit message contains no "Cc: stable@vger.kernel.org" tag and no
"Fixes:" tag pointing to a specific problematic commit that introduced a
user-facing issue. 4. **Minor code quality improvement**: The changes
are purely preventive: - `char buf[CEC_MAX_MSG_SIZE 0001-Fix-Clippy-
warnings.patch 0002-Enhance-inference-prompt-to-utilize-CVEKERNELDIR-
whe.patch 0003-Update-to-latest-version-of-clap.patch Cargo.lock
Cargo.toml LICENSE README.md adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md 3 + 1];` becomes `char
buf[(CEC_MAX_MSG_SIZE - 1) 0001-Fix-Clippy-warnings.patch 0002-Enhance-
inference-prompt-to-utilize-CVEKERNELDIR-whe.patch 0003-Update-to-
latest-version-of-clap.patch Cargo.lock Cargo.toml LICENSE README.md
adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md 3 + 1];` - `char
cmd[CEC_MAX_MSG_SIZE 0001-Fix-Clippy-warnings.patch 0002-Enhance-
inference-prompt-to-utilize-CVEKERNELDIR-whe.patch 0003-Update-to-
latest-version-of-clap.patch Cargo.lock Cargo.toml LICENSE README.md
adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md 3 + 13];` becomes `char
cmd[sizeof(buf) + 14];` These changes slightly reduce buffer sizes to
better match actual usage patterns, but there's no indication the
original sizes caused buffer overflows or other runtime problems. 5.
**Media subsystem and driver-specific**: This affects a specific USB CEC
adapter driver (`extron-da-hd-4k-plus`), making it a relatively isolated
change that doesn't impact core kernel functionality or multiple
subsystems. 6. **No user-reported issues**: There's no mention of user
reports, bug fixes, or functional improvements - only compiler warning
suppression. The stable kernel tree rules prioritize important bug fixes
with minimal regression risk. This commit, while technically correct,
falls into the category of code quality improvements rather than
critical fixes that users would benefit from in stable releases.

 .../media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67..41d019b01ec09 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1002,8 +1002,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				    u32 signal_free_time, struct cec_msg *msg)
 {
 	struct extron_port *port = cec_get_drvdata(adap);
-	char buf[CEC_MAX_MSG_SIZE * 3 + 1];
-	char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
+	char buf[(CEC_MAX_MSG_SIZE - 1) * 3 + 1];
+	char cmd[sizeof(buf) + 14];
 	unsigned int i;
 
 	if (port->disconnected)
-- 
2.39.5


