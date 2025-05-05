Return-Path: <linux-media+bounces-31753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29485AAA4C0
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A925716ED59
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85EB30572C;
	Mon,  5 May 2025 22:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I58zlFHO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E911304F6B;
	Mon,  5 May 2025 22:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484067; cv=none; b=oNQixAwds75Gg3mz3qGCa2w/YktNCPe/s2YHQyE6OSCIP0rTHmG728gnax72N+HJCdajERj8fFx+XbrLqbF+UulKZ+P8Yz/sAeKohX4v4v+HkLwmZ5Zwh3++YHXNKlg+RDzs2HKj+kD59efKWonh68Lr2KUcemyUYimJccZ9WeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484067; c=relaxed/simple;
	bh=PXD8X/4b79ElEbyvaA2oiAdbCNpWP5Ubagm3wRzutns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9HiWJVvWAZL/PzvYn9+wfbf3nkHQPF/gaETmuQ11HRPUy4MYWcGqJYa+Z2W+mVqfs8B/Ck6HMhDdx6pTR/c5c2v7NDpMcxzEL2pKvBzq6K7e0FWw6dfBlCLPAXhfMWb3dSP2+AC6pVxolijE+EhaPFY0kZ30EnV3d5C4N7wI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I58zlFHO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F638C4CEEE;
	Mon,  5 May 2025 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484064;
	bh=PXD8X/4b79ElEbyvaA2oiAdbCNpWP5Ubagm3wRzutns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I58zlFHOadAFYWLcdwLyrPx2ZIMDO5EcfHlRSBwBy1dpnhta7mM2s4PcYwHe0hLGf
	 mmhSvYcXKgkztcziwinILX+PPrgAoG0qfwop5NNSUAlgLQTNzli92HMbAHF6XdWdRk
	 +B6UkpjmgZ123DebT05Ux9w56KFlZqWLxN8OwnOTyP2C8+rngAKmjJ7ydLvrEbgIo9
	 OAKN0uoXjcXHu8peQAnXABSDYDiblwFQrCnG++/k6sJtSmtvd94D4CIq8CLMFDz3aa
	 PLQWW38GNHDZuGk9cHjGEE8dwPEa4k483iKDZzd8Rwe/uDllI61aOxn9I3kaZby3uk
	 XUtCVRpZfYgjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	lars@metafoo.de,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 333/642] media: adv7180: Disable test-pattern control on adv7180
Date: Mon,  5 May 2025 18:09:09 -0400
Message-Id: <20250505221419.2672473-333-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

[ Upstream commit a980bc5f56b0292336e408f657f79e574e8067c0 ]

The register that enables selecting a test-pattern to be outputted in
free-run mode (FREE_RUN_PAT_SEL[2:0]) is only available on adv7280 based
devices, not the adv7180 based ones.

Add a flag to mark devices that are capable of generating test-patterns,
and those that are not. And only register the control on supported
devices.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/adv7180.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index ff7dfa0278a7a..6e50b14f888f1 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -195,6 +195,7 @@ struct adv7180_state;
 #define ADV7180_FLAG_V2			BIT(1)
 #define ADV7180_FLAG_MIPI_CSI2		BIT(2)
 #define ADV7180_FLAG_I2P		BIT(3)
+#define ADV7180_FLAG_TEST_PATTERN	BIT(4)
 
 struct adv7180_chip_info {
 	unsigned int flags;
@@ -682,11 +683,15 @@ static int adv7180_init_controls(struct adv7180_state *state)
 			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
 	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
 
-	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
-				      V4L2_CID_TEST_PATTERN,
-				      ARRAY_SIZE(test_pattern_menu) - 1,
-				      0, ARRAY_SIZE(test_pattern_menu) - 1,
-				      test_pattern_menu);
+	if (state->chip_info->flags & ADV7180_FLAG_TEST_PATTERN) {
+		v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl,
+					     &adv7180_ctrl_ops,
+					     V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     0,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     test_pattern_menu);
+	}
 
 	state->sd.ctrl_handler = &state->ctrl_hdl;
 	if (state->ctrl_hdl.error) {
@@ -1221,7 +1226,7 @@ static const struct adv7180_chip_info adv7182_info = {
 };
 
 static const struct adv7180_chip_info adv7280_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P | ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1235,7 +1240,8 @@ static const struct adv7180_chip_info adv7280_info = {
 };
 
 static const struct adv7180_chip_info adv7280_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1256,7 +1262,8 @@ static const struct adv7180_chip_info adv7280_m_info = {
 };
 
 static const struct adv7180_chip_info adv7281_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN7) |
@@ -1271,7 +1278,8 @@ static const struct adv7180_chip_info adv7281_info = {
 };
 
 static const struct adv7180_chip_info adv7281_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1291,7 +1299,8 @@ static const struct adv7180_chip_info adv7281_m_info = {
 };
 
 static const struct adv7180_chip_info adv7281_ma_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1316,7 +1325,7 @@ static const struct adv7180_chip_info adv7281_ma_info = {
 };
 
 static const struct adv7180_chip_info adv7282_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P | ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN7) |
@@ -1331,7 +1340,8 @@ static const struct adv7180_chip_info adv7282_info = {
 };
 
 static const struct adv7180_chip_info adv7282_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
-- 
2.39.5


