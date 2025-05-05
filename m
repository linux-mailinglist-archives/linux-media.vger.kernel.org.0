Return-Path: <linux-media+bounces-31789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF15AAB63A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80D0E4C5F18
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 05:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D252F2BFC7B;
	Tue,  6 May 2025 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6IpFgK9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968A2BF3F6;
	Mon,  5 May 2025 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485310; cv=none; b=NQJi5Gk0ebSBtF0Ia3QZdooquqgGVyADMDwlvqpZCkuuA87+FwIPcNXbErkl7UnHcr3MkcA9Xecos4Ryg/3mY1Y96BwOX3bmlfUPFPIV4VRbHB8Gsc+0Kh/zZ6hTvFEVbF9wDsbEh3WnclBuXOgXwAESF3XD8HpuhgCjJEjdZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485310; c=relaxed/simple;
	bh=vjrfuym7pkSiHbN5oJDD/loQ5BFrgADDxlgZk5uXq0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PGrjzkU+ftCM+66DFYhf3cOpfs3iuRcOdLqDzNuJFvJL0eBYocIq9phQ7MBf8hcDXKtXzG+LK0oOqqJZDbaoMshfiJwftpxsrPg3OYcH56TW5T/TQOC8VmguiXDGph0nGfOrarskCbRBID/H+VY9OqxgYoA0STVsdtevZjUf1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6IpFgK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC15C4CEF2;
	Mon,  5 May 2025 22:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485310;
	bh=vjrfuym7pkSiHbN5oJDD/loQ5BFrgADDxlgZk5uXq0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6IpFgK9ROJi7hdnXLYiXBaVaDXpsQ3+N7kDUjpQZ090L0HXC5JWJkM0dWL6hTk8W
	 +TVqPUkXLAUW1vsZBXwkNG4iIpOdZvQyiBwRxY63ZTYXWjZ1V3aNQv85S7s3Yzn+v5
	 /VGrh3BVI9PcpKfxfTuNTFi3tpJ8+OfROmMdGH1Mvnv5giBN6o+5BUVQg0q7V02P4M
	 9en/SRqL3gxWcODn3DO8WXfygklElJ4yfd7IEo2c77VgkSGEz7cMfePfTelZKd3cQI
	 0WytU4qIX6J06gRp/koj4zblzjS8DMjhXXrJKkNE6XnbGGsSRjKeYg/DSkrFZQOWEk
	 9GS/2BJYmeRQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	lars@metafoo.de,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 261/486] media: adv7180: Disable test-pattern control on adv7180
Date: Mon,  5 May 2025 18:35:37 -0400
Message-Id: <20250505223922.2682012-261-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 819ff9f7c90fe..2a20a4fad796c 100644
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


