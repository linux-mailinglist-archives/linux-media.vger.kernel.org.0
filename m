Return-Path: <linux-media+bounces-34539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0856BAD5E54
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 20:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A4917C72E
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A40283CA2;
	Wed, 11 Jun 2025 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IaFJ8l/q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1A2248B8
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667046; cv=none; b=UYwCaY+9nsAGEJLuByjvffPswC42vg+VrPs1OfoXao5kixK7LERd0assf12arYYJRb2+zf3QetyO5Jd2wNgOtePjXAZT6EIhKkocJAgK2W7p/W+wllipShgCeNUEcYCg3ub081PfkLE3OI5t5TqG+dLr0JyngGVYKkDR0n5D5Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667046; c=relaxed/simple;
	bh=VRd2k/Q/i3FDTIxyZfK84tJ4lV+Mf4e5ymoaKFQZRCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxPKWsmhFXS3IhbuJnk6Z1dt2LJVsPo8wNny2NB0w44POXHZ87zUUpXfF1OSbAGsDv+qn5Tmf2gG+hyVUjPOzbOOOaPhWfAyuY4z8Ytl1KKokAGdP5/lcmCUHuUw1T1A0PoLIJnC/N+MPqMYsLMkCZn841kJqcoQe9sRpY08JdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IaFJ8l/q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450dd065828so712905e9.2
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 11:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667043; x=1750271843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/axqm8k3/xlEItyAFlEMdzmmFWn3XyIBiwkuVUA9GE=;
        b=IaFJ8l/qw3xgAcnyPN3GjYU+xik77kVDNYqfPwv+dyQYE8DKPsxb1iT6bMvDto98S3
         KvscFzeqX7p5eVZvjBkkEoKZqDPHhgwjINU0o/Zirz2PldJ7kstaN3KbV6lrL5YkLWzB
         qgMJWuUU159D1JSbDNXwkiY89evPhSmH7Xa5YExZak1Twi1tst7+SmC+0BL/X2LKSsFd
         hRyVt2iaLDnrlOFcadMacurpLx2zdn/IPvpBDxx0iljUWHlix0LfKbbjkcpoR4rB2qMN
         +Q42t0QORIkokBEe8CRazFl2AwT5AwcTTfqcE+jQRnQZm3eNSFynSg5WR3Ur04iXFeaQ
         8Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667043; x=1750271843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/axqm8k3/xlEItyAFlEMdzmmFWn3XyIBiwkuVUA9GE=;
        b=SQ72D8i2xdff7cKdx9ZNYDhgPYg4faGsoidUNSAy0Csmh6socEKNJWMn/vte/KP/wr
         OqZeBpHm0JBhWuJwhKd8EoRx3NmkDvBfmsJPxbpIilpF+xEJYULgXUoFhY7Hpuyzv3zq
         2xexWtVFcv4TDA2+ysk2E4hSExoZAz68qaTEpXYqqC6IlDPQm3FFdkGt+F/BoyrDYKWs
         b5aL+GS8o292iVKvXXYFkdfhMOsQ6vC7TPwesoce6wbHjua1Rwtg8WzMDHaZGYdBhf/A
         Kj+byd5LUYTvsOCIvUATRCd4fwsJgeppEsxQNMlsoQkCeCzfd1GQkbgxx40xoSejNh2j
         QAWw==
X-Forwarded-Encrypted: i=1; AJvYcCVS3SToY4Ik4UmPUTZKKgvEuLaG4xIRXxnGZnntFLV2f0U3yq/sfThet2XWpyxSDNjlJl7M2Rngj6tKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfi5fML5K1eiVHoGucNtdEvAn8AQBCOF4fO0bUxyka94+TQih
	U+FJwMPZ3H9mzqV5cNqo+yxB/237MCARU2CKx30rc9k/5F3fvaHw10HkrK4rA3HCW9g=
X-Gm-Gg: ASbGncvYGejkDWH+Ylr85acC6ibeX3Eky13tgKNpxrbYMbA4fZN5EksfImNQmZJuOjA
	OSEAijKShmI7YsHhuGrtvwlP1NJffVe9olpzA45IVBTTif80JiT6Tshme/TwzgZHG8Hw+lIu4We
	oR8xyxDHS7k25XyKW0NOWKvw+FDtfaFWnTB3GI1hBBEeR3pnSOdbM/GNciDeDl9ZWbsBLjJ/Qdr
	z1t21BLzuRXC8wm+Pu6tN5VQdoZlBpBh6tcG7rjiJbLVp/YqewKVCHeBi7QLhlgS+0rGYkvPabK
	0ScgHNAU8jR9sw5iDNbMsYHuqjgB5b+3wboloE994KkaHeY45ncjqA==
X-Google-Smtp-Source: AGHT+IHy4y7hCn0YytWiolkQuGznWohvLW0swvm6O3+u87Ddu4wgBl0yE5V8jmp1ZcCdpnMkxt7mIA==
X-Received: by 2002:a5d:584a:0:b0:3a5:2f23:376f with SMTP id ffacd0b85a97d-3a5606c83b4mr431761f8f.13.1749667042774;
        Wed, 11 Jun 2025 11:37:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Jun 2025 19:37:15 +0100
Subject: [PATCH 3/4] media: tc358743: Check I2C succeeded during probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-media-tc358743-v1-3-708556026f9d@raspberrypi.com>
References: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
In-Reply-To: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The probe for the TC358743 reads the CHIPID register from
the device and compares it to the expected value of 0.
If the I2C request fails then that also returns 0, so
the driver loads thinking that the device is there.

Generally I2C communications are reliable so there is
limited need to check the return value on every transfer,
therefore only amend the one read during probe to check
for I2C errors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index ddba8c392ead..4d3dc61a9b8b 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -114,7 +114,7 @@ static inline struct tc358743_state *to_state(struct v4l2_subdev *sd)
 
 /* --------------- I2C --------------- */
 
-static void i2c_rd(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
+static int i2c_rd(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
 {
 	struct tc358743_state *state = to_state(sd);
 	struct i2c_client *client = state->i2c_client;
@@ -140,6 +140,7 @@ static void i2c_rd(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
 		v4l2_err(sd, "%s: reading register 0x%x from 0x%x failed: %d\n",
 				__func__, reg, client->addr, err);
 	}
+	return err != ARRAY_SIZE(msgs);
 }
 
 static void i2c_wr(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
@@ -196,15 +197,24 @@ static void i2c_wr(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
 	}
 }
 
-static noinline u32 i2c_rdreg(struct v4l2_subdev *sd, u16 reg, u32 n)
+static noinline u32 i2c_rdreg_err(struct v4l2_subdev *sd, u16 reg, u32 n,
+				  int *err)
 {
+	int error;
 	__le32 val = 0;
 
-	i2c_rd(sd, reg, (u8 __force *)&val, n);
+	error = i2c_rd(sd, reg, (u8 __force *)&val, n);
+	if (err)
+		*err = error;
 
 	return le32_to_cpu(val);
 }
 
+static inline u32 i2c_rdreg(struct v4l2_subdev *sd, u16 reg, u32 n)
+{
+	return i2c_rdreg_err(sd, reg, n, NULL);
+}
+
 static noinline void i2c_wrreg(struct v4l2_subdev *sd, u16 reg, u32 val, u32 n)
 {
 	__le32 raw = cpu_to_le32(val);
@@ -233,6 +243,13 @@ static u16 i2c_rd16(struct v4l2_subdev *sd, u16 reg)
 	return i2c_rdreg(sd, reg, 2);
 }
 
+static int i2c_rd16_err(struct v4l2_subdev *sd, u16 reg, u16 *value)
+{
+	int err;
+	*value = i2c_rdreg_err(sd, reg, 2, &err);
+	return err;
+}
+
 static void i2c_wr16(struct v4l2_subdev *sd, u16 reg, u16 val)
 {
 	i2c_wrreg(sd, reg, val, 2);
@@ -2092,6 +2109,7 @@ static int tc358743_probe(struct i2c_client *client)
 	struct tc358743_platform_data *pdata = client->dev.platform_data;
 	struct v4l2_subdev *sd;
 	u16 irq_mask = MASK_HDMI_MSK | MASK_CSI_MSK;
+	u16 chipid;
 	int err;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
@@ -2123,7 +2141,8 @@ static int tc358743_probe(struct i2c_client *client)
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
 	/* i2c access */
-	if ((i2c_rd16(sd, CHIPID) & MASK_CHIPID) != 0) {
+	if (i2c_rd16_err(sd, CHIPID, &chipid) ||
+	    (chipid & MASK_CHIPID) != 0) {
 		v4l2_info(sd, "not a TC358743 on address 0x%x\n",
 			  client->addr << 1);
 		return -ENODEV;

-- 
2.34.1


