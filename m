Return-Path: <linux-media+bounces-38935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33657B1B45E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2FFD3B4DA3
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22C12750E3;
	Tue,  5 Aug 2025 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK7SRWo6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D32737F8;
	Tue,  5 Aug 2025 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399473; cv=none; b=tiV9L+FBXm7NzAU5GpXlhnlIYPg6uZKBhCHWKObBB7S3YX0AMAW10KpuQR/OUZWzpjdstPxDfl992rxlsm1SX9Swja7RRPhTO9n9m5NSkGKB2OP7qCcokEa4uCGMiDxpbWhgQV3cHOrUTlWTrM4h0cxiwe7SdoPAVVVn8OR+SJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399473; c=relaxed/simple;
	bh=MSb3ijGfbO37x8g2qmbWuVLj3RmusIMgmSKXKN+eSgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cYHH2cVJrX6jJlSziPITteoPG89LKLYZHrSh8CxiY079Tfg3BUEXYGWTizghyLCXi/Ph2rn1pMoP7Y7lJP0cUSh+QSIPVltmuEzU/7OJBav4U3kD/eo4yxJyjqbuUu8OqhVtP+ZKWj24+LItpGr4Nrd0M59TEcXO6f+yp8ntRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK7SRWo6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7FBC4CEF0;
	Tue,  5 Aug 2025 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399471;
	bh=MSb3ijGfbO37x8g2qmbWuVLj3RmusIMgmSKXKN+eSgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lK7SRWo6mDogZWuYFp6mrSQJkJWpWSGdxFJg2H2A1w7GiE/g17C7+w0tJvSxp5ErE
	 mMJ2o/k3CZ7q1r94KBkxd/74Ssk7oYtOvoFtQXJE571MQNfRk3spCCiZPaXBv8Kpw7
	 WVPHyCppXF4MmD4+dhRoVaMrjklFCFINGULFl8KWbuTO+31WM6DNqxJ08plMpb324T
	 +pi2qo+nkV5sWiQ65PZzQN1ObOXQsaIyZXt+nWFlW+/GKgBSmvEjmwpreDdEJNokzG
	 uUjt+HzjHo9dp60MPTypZ/4dynaRWxL6Kk2ysZ1Eh9FPr8mDcE1byxj+3gnBUhU5SS
	 /4rTusrQYO9jw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] media: tc358743: Check I2C succeeded during probe
Date: Tue,  5 Aug 2025 09:09:14 -0400
Message-Id: <20250805130945.471732-39-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

[ Upstream commit 303d81635e1d9c949b370215cc94526ed81f2e3d ]

The probe for the TC358743 reads the CHIPID register from
the device and compares it to the expected value of 0.
If the I2C request fails then that also returns 0, so
the driver loads thinking that the device is there.

Generally I2C communications are reliable so there is
limited need to check the return value on every transfer,
therefore only amend the one read during probe to check
for I2C errors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis

1. **Critical Probe Bug**: The commit fixes a serious bug where the
   TC358743 driver incorrectly loads even when the device is not
   present. The original code reads the CHIPID register and compares it
   to 0, but if the I2C communication fails, `i2c_rd16()` also returns
   0, causing a false positive detection.

2. **User-Visible Impact**: This bug causes the driver to incorrectly
   bind to non-existent hardware, which can lead to:
   - System instability when attempting to use the non-existent device
   - Incorrect driver loading that prevents proper hardware detection
   - Potential crashes or errors when userspace tries to interact with
     the phantom device

## Code Changes Analysis

The fix is minimal and surgical:

1. **Modified I2C read functions** to return error status:
   - Changed `i2c_rd()` from void to int, returning error status
   - Added `i2c_rd16_err()` wrapper that captures error state
   - Added `i2c_rdreg_err()` to propagate errors through the stack

2. **Fixed probe logic** (lines 2134-2135):
  ```c
  -if ((i2c_rd16(sd, CHIPID) & MASK_CHIPID) != 0) {
  +if (i2c_rd16_err(sd, CHIPID, &chipid) ||
  +    (chipid & MASK_CHIPID) != 0) {
  ```
  Now properly checks for I2C errors before validating the chip ID.

## Stable Tree Criteria

The commit meets stable tree requirements:

1. **Fixes a real bug**: Prevents incorrect driver loading on I2C
   failures
2. **Small and contained**: Changes are limited to error handling in the
   probe path
3. **Low regression risk**: Only adds error checking; doesn't change
   successful probe behavior
4. **No new features**: Pure bug fix, no functionality additions
5. **Clear fix**: The problem and solution are straightforward

The commit message explicitly states "Generally I2C communications are
reliable so there is limited need to check the return value on every
transfer, therefore only amend the one read during probe" - showing
careful consideration to minimize changes while fixing the critical
issue.

This is a textbook example of a stable-worthy fix: it addresses a
specific hardware detection bug with minimal, safe changes that have no
impact on properly functioning systems.

 drivers/media/i2c/tc358743.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3d6703b75bfa..8c269e28fd5f 100644
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
@@ -2061,6 +2078,7 @@ static int tc358743_probe(struct i2c_client *client)
 	struct tc358743_platform_data *pdata = client->dev.platform_data;
 	struct v4l2_subdev *sd;
 	u16 irq_mask = MASK_HDMI_MSK | MASK_CSI_MSK;
+	u16 chipid;
 	int err;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
@@ -2092,7 +2110,8 @@ static int tc358743_probe(struct i2c_client *client)
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
 	/* i2c access */
-	if ((i2c_rd16(sd, CHIPID) & MASK_CHIPID) != 0) {
+	if (i2c_rd16_err(sd, CHIPID, &chipid) ||
+	    (chipid & MASK_CHIPID) != 0) {
 		v4l2_info(sd, "not a TC358743 on address 0x%x\n",
 			  client->addr << 1);
 		return -ENODEV;
-- 
2.39.5


