Return-Path: <linux-media+bounces-6527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA089872A70
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 23:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2721F1C219A5
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 22:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F3712D207;
	Tue,  5 Mar 2024 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I33pzm4R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886B7E56F;
	Tue,  5 Mar 2024 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709679010; cv=none; b=LsYRxMaCaYWiy41/b9hbrjk2oPIP6uOqhX56FItNqfwgqu6NUbC7CXdbnGP7hXI7ucnvTB9KID4j3mmt0MkFfBaZ+gHBYRrNN2t4vVTdjetLjYPamtMbnlgQgFgENytSpAzfFkSw/RM8ywZomoB8uxU90vxKPVYNuIC5ppDawVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709679010; c=relaxed/simple;
	bh=libXhYEB0y2Po+a07lqZLW7hxPvCu5mR9D7xytZajyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LsUKlMT0rJj3kKuLOGoxXhR7Vneo/+vCNCOSqajzg4BXCmEgdy1EuswF0YDa/ZkeI78PqXzYFwxbdrO2j/lHWdWmItB+88m9mhMYzDRQ2pbkObr3uAtPG4Y1szmF3J27u3P+bwwgx0oJNhM7cAdsvDFgfGxyVLddxqvnUQ0Fbkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I33pzm4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE5AC433C7;
	Tue,  5 Mar 2024 22:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709679009;
	bh=libXhYEB0y2Po+a07lqZLW7hxPvCu5mR9D7xytZajyM=;
	h=From:Date:Subject:To:Cc:From;
	b=I33pzm4R35QF1i05yNQR4QiVgQ3J17FBoTBWtU1HJ5/A/ogJ6oEb01OddljbYZrFf
	 JsAi21uA5K4D46k66eHu3lRmb/L3rO46tVqWxjyh0bEwyUItpBOxYDg48IkasWZsPd
	 iKjRcLGPOJCvTi8QL5WWZ1mo3wk/kNSdQws8CVmj6u3xpwSB/UeZRVXJ7ds1z5vfcK
	 1sJjDoRYHAwJzIGdgrnbM2uav9l64fQYaS6jaMPq5WF1/rzQl3PiN6TwovHlWUYcID
	 BP3BZR+9l99TS1z0VhnkwemixRugdZ5ICh2OHwSHJVDCArGrSu03jgHnQs24ZaS2Uo
	 ez7Pa0TCMSXuQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Mar 2024 15:49:40 -0700
Subject: [PATCH v2] media: mxl5xx: Move xpt structures off stack
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-dvb-mxl5xx-move-structs-off-stack-v2-1-6903844aba3c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIOh52UC/5WNTQ6CMBBGr0Jm7ZhORUlceQ/DAsoUGn5qptjUE
 O5u5Qbuvvct3tsgsDgOcC82EI4uOL9k0KcCzNAsPaPrMoNWulREhF1scU7TNSWcfWQMq7zNGtB
 bm3djRmTSVOmW2CoN2fMSti4djWedeXBh9fI5kpF+7z/2SEhomlJfFN8qQ/QYWRaezl56qPd9/
 wJkUJXR0wAAAA==
To: mchehab@kernel.org
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
 linux-media@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5962; i=nathan@kernel.org;
 h=from:subject:message-id; bh=libXhYEB0y2Po+a07lqZLW7hxPvCu5mR9D7xytZajyM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKnPFy5IuW3W5d887+ez+SLqmsGyLna/OE9u6SnY8cnQ9
 5zQm739HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAik3Yz/M9pS5vEn7QlQnvh
 dqYtR1ha32aYtZiYXQh1C3N/z9NVKcXwT003Vufm9i+Rv66vlA7sF2oVOvx9O5fv7qlPNWzV3mx
 ZxQAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building for LoongArch with clang 18.0.0, the stack usage of
probe() is larger than the allowed 2048 bytes:

  drivers/media/dvb-frontends/mxl5xx.c:1698:12: warning: stack frame size (2368) exceeds limit (2048) in 'probe' [-Wframe-larger-than]
   1698 | static int probe(struct mxl *state, struct mxl5xx_cfg *cfg)
        |            ^
  1 warning generated.

This is the result of the linked LLVM commit, which changes how the
arrays of structures in config_ts() get handled with
CONFIG_INIT_STACK_ZERO and CONFIG_INIT_STACK_PATTERN, which causes the
above warning in combination with inlining, as config_ts() gets inlined
into probe().

This warning can be easily fixed by moving the array of structures off
of the stack via 'static const', which is a better location for these
variables anyways because they are static data that is only ever read
from, never modified, so allocating the stack space is wasteful.

This drops the stack usage from 2368 bytes to 256 bytes with the same
compiler and configuration.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/1978
Link: https://github.com/llvm/llvm-project/commit/afe8b93ffdfef5d8879e1894b9d7dda40dee2b8d
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Rebase on latest media tree
- Fix typo and link in the commit message (Miguel)
- Pick up Miguel's reviewed-by and tested-by tags
- Link to v1: https://lore.kernel.org/r/20240111-dvb-mxl5xx-move-structs-off-stack-v1-1-ca4230e67c11@kernel.org
---
 drivers/media/dvb-frontends/mxl5xx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
index 4ebbcf05cc09..91e9c378397c 100644
--- a/drivers/media/dvb-frontends/mxl5xx.c
+++ b/drivers/media/dvb-frontends/mxl5xx.c
@@ -1381,57 +1381,57 @@ static int config_ts(struct mxl *state, enum MXL_HYDRA_DEMOD_ID_E demod_id,
 	u32 nco_count_min = 0;
 	u32 clk_type = 0;
 
-	struct MXL_REG_FIELD_T xpt_sync_polarity[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_sync_polarity[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700010, 8, 1}, {0x90700010, 9, 1},
 		{0x90700010, 10, 1}, {0x90700010, 11, 1},
 		{0x90700010, 12, 1}, {0x90700010, 13, 1},
 		{0x90700010, 14, 1}, {0x90700010, 15, 1} };
-	struct MXL_REG_FIELD_T xpt_clock_polarity[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_clock_polarity[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700010, 16, 1}, {0x90700010, 17, 1},
 		{0x90700010, 18, 1}, {0x90700010, 19, 1},
 		{0x90700010, 20, 1}, {0x90700010, 21, 1},
 		{0x90700010, 22, 1}, {0x90700010, 23, 1} };
-	struct MXL_REG_FIELD_T xpt_valid_polarity[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_valid_polarity[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700014, 0, 1}, {0x90700014, 1, 1},
 		{0x90700014, 2, 1}, {0x90700014, 3, 1},
 		{0x90700014, 4, 1}, {0x90700014, 5, 1},
 		{0x90700014, 6, 1}, {0x90700014, 7, 1} };
-	struct MXL_REG_FIELD_T xpt_ts_clock_phase[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_ts_clock_phase[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700018, 0, 3}, {0x90700018, 4, 3},
 		{0x90700018, 8, 3}, {0x90700018, 12, 3},
 		{0x90700018, 16, 3}, {0x90700018, 20, 3},
 		{0x90700018, 24, 3}, {0x90700018, 28, 3} };
-	struct MXL_REG_FIELD_T xpt_lsb_first[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_lsb_first[MXL_HYDRA_DEMOD_MAX] = {
 		{0x9070000C, 16, 1}, {0x9070000C, 17, 1},
 		{0x9070000C, 18, 1}, {0x9070000C, 19, 1},
 		{0x9070000C, 20, 1}, {0x9070000C, 21, 1},
 		{0x9070000C, 22, 1}, {0x9070000C, 23, 1} };
-	struct MXL_REG_FIELD_T xpt_sync_byte[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_sync_byte[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700010, 0, 1}, {0x90700010, 1, 1},
 		{0x90700010, 2, 1}, {0x90700010, 3, 1},
 		{0x90700010, 4, 1}, {0x90700010, 5, 1},
 		{0x90700010, 6, 1}, {0x90700010, 7, 1} };
-	struct MXL_REG_FIELD_T xpt_enable_output[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_enable_output[MXL_HYDRA_DEMOD_MAX] = {
 		{0x9070000C, 0, 1}, {0x9070000C, 1, 1},
 		{0x9070000C, 2, 1}, {0x9070000C, 3, 1},
 		{0x9070000C, 4, 1}, {0x9070000C, 5, 1},
 		{0x9070000C, 6, 1}, {0x9070000C, 7, 1} };
-	struct MXL_REG_FIELD_T xpt_err_replace_sync[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_err_replace_sync[MXL_HYDRA_DEMOD_MAX] = {
 		{0x9070000C, 24, 1}, {0x9070000C, 25, 1},
 		{0x9070000C, 26, 1}, {0x9070000C, 27, 1},
 		{0x9070000C, 28, 1}, {0x9070000C, 29, 1},
 		{0x9070000C, 30, 1}, {0x9070000C, 31, 1} };
-	struct MXL_REG_FIELD_T xpt_err_replace_valid[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_err_replace_valid[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700014, 8, 1}, {0x90700014, 9, 1},
 		{0x90700014, 10, 1}, {0x90700014, 11, 1},
 		{0x90700014, 12, 1}, {0x90700014, 13, 1},
 		{0x90700014, 14, 1}, {0x90700014, 15, 1} };
-	struct MXL_REG_FIELD_T xpt_continuous_clock[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_continuous_clock[MXL_HYDRA_DEMOD_MAX] = {
 		{0x907001D4, 0, 1}, {0x907001D4, 1, 1},
 		{0x907001D4, 2, 1}, {0x907001D4, 3, 1},
 		{0x907001D4, 4, 1}, {0x907001D4, 5, 1},
 		{0x907001D4, 6, 1}, {0x907001D4, 7, 1} };
-	struct MXL_REG_FIELD_T xpt_nco_clock_rate[MXL_HYDRA_DEMOD_MAX] = {
+	static const struct MXL_REG_FIELD_T xpt_nco_clock_rate[MXL_HYDRA_DEMOD_MAX] = {
 		{0x90700044, 16, 80}, {0x90700044, 16, 81},
 		{0x90700044, 16, 82}, {0x90700044, 16, 83},
 		{0x90700044, 16, 84}, {0x90700044, 16, 85},

---
base-commit: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
change-id: 20240111-dvb-mxl5xx-move-structs-off-stack-e12172b1ef02

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


