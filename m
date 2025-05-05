Return-Path: <linux-media+bounces-31777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88AAAAEE9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 05:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7E0016210A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20985283FE5;
	Mon,  5 May 2025 23:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mC1wfMFO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60138E947;
	Mon,  5 May 2025 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486123; cv=none; b=LhwGDAvdDCNFDAZ6HK/2LXmk+CA4YiDpfTZ+ruZUVn1Hdfc0JgkjTAnpTiiCVWSKa/0/pZqEYur7Yzx7h94n8Q0YWfeRDhIvFlRni+1vN4MZqnd31HCJ6Lq6BL27ZvuV2kKI0rtrzX/HQmdW86O7d9Sd+3GjjcYs6Y+k3KFScvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486123; c=relaxed/simple;
	bh=gh/B6Hc7fNes3sCq1U2Z/pUnB7tDPKV+P35Ib1cNxAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmB5HIzEARMRiPrMe+GHBNsPvfyJ6Vwwmp7j5VEsbhFcYDYVoVxJKbOIFMRa+ynDgHn+Kalx/f1m98LndCtUO9lMvHi2sQf4edWGq8VJzoaIBRjzN1sp2DcwArbJUD08miwdnh8pUXfvg0JAQjSKelV7Y/HPApc2iQJFSGF8VKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mC1wfMFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E687C4CEE4;
	Mon,  5 May 2025 23:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486122;
	bh=gh/B6Hc7fNes3sCq1U2Z/pUnB7tDPKV+P35Ib1cNxAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mC1wfMFOqLt5wexk6mfQnWTUJ+YUsooVZf7i6hPGpRPdJ/hhAQXOBIpGRlQrzE4E3
	 rxjAxI9RQ3k32gxckUgDb1wwe4Z08tlnGLDV0YtE4dKoCKyOHXpyLGvbDAGU7fQWOG
	 Bp804NPdF+eKTnC2f1tv9LWIjNIW48kr1xyINq8kr+IQSw6p0KjIzim6IkV1u8a64R
	 i1wJCkb81r5DCnglJfNrclGI3Cvms5jXl2yL7VtGmWolD9zZkPGzBE3nLu3Y8w/8ez
	 o9P2hqYtQkqQLPtyBJt6e8M/vvFB/eM1ERQcY2Y0ZrMC5xGonUN12kmQUEhXdOKUKI
	 Xp8zRdZAz2tKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	lars@metafoo.de,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 163/294] media: adv7180: Disable test-pattern control on adv7180
Date: Mon,  5 May 2025 18:54:23 -0400
Message-Id: <20250505225634.2688578-163-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 99ba925e8ec8e..114ac0c263fb2 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -194,6 +194,7 @@ struct adv7180_state;
 #define ADV7180_FLAG_V2			BIT(1)
 #define ADV7180_FLAG_MIPI_CSI2		BIT(2)
 #define ADV7180_FLAG_I2P		BIT(3)
+#define ADV7180_FLAG_TEST_PATTERN	BIT(4)
 
 struct adv7180_chip_info {
 	unsigned int flags;
@@ -673,11 +674,15 @@ static int adv7180_init_controls(struct adv7180_state *state)
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
@@ -1209,7 +1214,7 @@ static const struct adv7180_chip_info adv7182_info = {
 };
 
 static const struct adv7180_chip_info adv7280_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P | ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1223,7 +1228,8 @@ static const struct adv7180_chip_info adv7280_info = {
 };
 
 static const struct adv7180_chip_info adv7280_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1244,7 +1250,8 @@ static const struct adv7180_chip_info adv7280_m_info = {
 };
 
 static const struct adv7180_chip_info adv7281_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN7) |
@@ -1259,7 +1266,8 @@ static const struct adv7180_chip_info adv7281_info = {
 };
 
 static const struct adv7180_chip_info adv7281_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1279,7 +1287,8 @@ static const struct adv7180_chip_info adv7281_m_info = {
 };
 
 static const struct adv7180_chip_info adv7281_ma_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1304,7 +1313,7 @@ static const struct adv7180_chip_info adv7281_ma_info = {
 };
 
 static const struct adv7180_chip_info adv7282_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P | ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN7) |
@@ -1319,7 +1328,8 @@ static const struct adv7180_chip_info adv7282_info = {
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


