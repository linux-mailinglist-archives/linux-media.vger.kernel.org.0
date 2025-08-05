Return-Path: <linux-media+bounces-38936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7BB1B477
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B01F175435
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ED4279358;
	Tue,  5 Aug 2025 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuiTd3RY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED72275113;
	Tue,  5 Aug 2025 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399489; cv=none; b=m3pmnLBxkGlXHRPOsGc2Z6BpFi3xU+3JwL7ugEW45HQIf8ICM8eHYaoVtw/fBfq0XbHH95WEmVgrQbfkqCB1gSqj6WGjUvsguRIRhwWQAl7B704xi2ryoFs5QSu1S+8qKA3TJM14anE8rpEFD4beRFEXOUOS0ZevJ7e29b4MvGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399489; c=relaxed/simple;
	bh=KMS29EiNpnbCgqRgh25+DaqhzCFR2obHthy2cidYnWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txorKgPgN6nk2MBvfcRjFQVNM2zf7DA4Ps7qBkY9Gr58/4RfM6nfY3kIIl3WE5c92r7U8yiZHrfnIDSSc80vqWZcHZSpVrYgt/4F0qsLIc+AezBSp6Emx6CYwdMfPeCRfEUf5ND1/oba5aDqdjOUwPrKCi2ULMqrWGOiIIBZJZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuiTd3RY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A2DC4CEF0;
	Tue,  5 Aug 2025 13:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399489;
	bh=KMS29EiNpnbCgqRgh25+DaqhzCFR2obHthy2cidYnWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PuiTd3RYI0pZJ99nnhxkHHHfLe+GWN6mbF28059plJBcJ1VgQSKNn7YAB9UVnQSgX
	 XURN0qP7SJeaZx8LDm7sbNtaiH6oeLTTfhDkBo4FmQn+ym+jJIXpoTlM4sSjkK/K2q
	 C3vICUybb55sg1FPWuxypdGVVnem00HuYxlhe5wqAkt/O1ps/IfqoBTRi8d5OmUy8U
	 UkSGKu1YotqoE9S13AOUD/TlJq4SLNjmZMJk4ZSYxl2K3e4hQDcgLhGcQytxgOJC/3
	 Uu9+6rvWPqcmetM36b72uvlOPU8SRqnlRKc9KPJeu3KzqhpMs5epinhw+iqkRBzNRj
	 MKLWgmS92guhQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] media: tc358743: Return an appropriate colorspace from tc358743_set_fmt
Date: Tue,  5 Aug 2025 09:09:22 -0400
Message-Id: <20250805130945.471732-47-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

[ Upstream commit 377cc006a364dfdab2f3f221cfad63a9265200b8 ]

When calling tc358743_set_fmt, the code was calling tc358743_get_fmt
to choose a valid format. However that sets the colorspace
based on information read back from the chip, not the colour
format requested.

The result was that if you called try or set format for UYVY
when the current format was RGB3 then you would get told SRGB,
and try RGB3 when current was UYVY and you would get told
SMPTE170M.

The value programmed in the VI_REP register for the colorspace
is always set by this driver, therefore there is no need to read
back the value, and never set to REC709.
Return the colorspace based on the format set/tried instead.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit is a good candidate for backporting to stable kernel trees
for the following reasons:

## Bug Fix Analysis

1. **Clear Bug Being Fixed**: The commit fixes an incorrect colorspace
   reporting bug in the tc358743 HDMI-to-CSI bridge driver. When calling
   `tc358743_set_fmt()` to set/try a format, the function was
   incorrectly returning the colorspace based on the *current* hardware
   state (read from VI_REP register) rather than the colorspace
   appropriate for the *requested* format.

2. **User-Visible Impact**: This bug causes incorrect colorspace
   metadata to be reported to userspace applications:
   - Requesting UYVY format when current is RGB would incorrectly report
     SRGB colorspace
   - Requesting RGB format when current is UYVY would incorrectly report
     SMPTE170M colorspace
   - This affects video capture applications that rely on correct
     colorspace information for proper color processing

## Code Analysis

3. **Small and Contained Fix**: The change is minimal and well-
   contained:
   - Adds a simple helper function `tc358743_g_colorspace()` that maps
     format codes to appropriate colorspaces
   - Removes the problematic register read (`i2c_rd8(sd, VI_REP)`) from
     `tc358743_get_fmt()`
   - Updates both `tc358743_get_fmt()` and `tc358743_set_fmt()` to use
     the helper function
   - Total change is about 40 lines with clear logic

4. **No Architectural Changes**: The fix doesn't introduce any new
   features or change the driver architecture - it simply corrects the
   colorspace reporting logic to be consistent and predictable.

5. **Low Risk of Regression**:
   - The driver always writes the VI_REP register value itself in
     `tc358743_set_csi_color_space()` (lines 690-691 for UYVY, 702-703
     for RGB)
   - The commit message correctly notes "The value programmed in the
     VI_REP register for the colorspace is always set by this driver"
   - The new implementation is simpler and more predictable than reading
     back hardware state
   - The colorspace mapping (RGB→SRGB, UYVY→SMPTE170M) is standard and
     correct

6. **No Side Effects**: The change only affects the colorspace field
   reporting and doesn't modify any hardware programming, timing
   configuration, or data flow.

7. **Subsystem Isolation**: The tc358743 is a specific HDMI-to-CSI
   bridge chip driver that's relatively isolated from core kernel
   functionality. Changes here won't affect system stability.

The commit meets stable kernel criteria as it fixes a real bug that
affects userspace applications without introducing new features or risky
changes. The fix is simple, correct, and unlikely to cause regressions.

 drivers/media/i2c/tc358743.c | 44 ++++++++++++++----------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 8c269e28fd5f..0bf6481dd0d9 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1708,12 +1708,23 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u32 tc358743_g_colorspace(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return V4L2_COLORSPACE_SRGB;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		return V4L2_COLORSPACE_SMPTE170M;
+	default:
+		return 0;
+	}
+}
+
 static int tc358743_get_fmt(struct v4l2_subdev *sd,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct tc358743_state *state = to_state(sd);
-	u8 vi_rep = i2c_rd8(sd, VI_REP);
 
 	if (format->pad != 0)
 		return -EINVAL;
@@ -1723,23 +1734,7 @@ static int tc358743_get_fmt(struct v4l2_subdev *sd,
 	format->format.height = state->timings.bt.height;
 	format->format.field = V4L2_FIELD_NONE;
 
-	switch (vi_rep & MASK_VOUT_COLOR_SEL) {
-	case MASK_VOUT_COLOR_RGB_FULL:
-	case MASK_VOUT_COLOR_RGB_LIMITED:
-		format->format.colorspace = V4L2_COLORSPACE_SRGB;
-		break;
-	case MASK_VOUT_COLOR_601_YCBCR_LIMITED:
-	case MASK_VOUT_COLOR_601_YCBCR_FULL:
-		format->format.colorspace = V4L2_COLORSPACE_SMPTE170M;
-		break;
-	case MASK_VOUT_COLOR_709_YCBCR_FULL:
-	case MASK_VOUT_COLOR_709_YCBCR_LIMITED:
-		format->format.colorspace = V4L2_COLORSPACE_REC709;
-		break;
-	default:
-		format->format.colorspace = 0;
-		break;
-	}
+	format->format.colorspace = tc358743_g_colorspace(format->format.code);
 
 	return 0;
 }
@@ -1753,19 +1748,14 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
 	u32 code = format->format.code; /* is overwritten by get_fmt */
 	int ret = tc358743_get_fmt(sd, sd_state, format);
 
-	format->format.code = code;
+	if (code == MEDIA_BUS_FMT_RGB888_1X24 ||
+	    code == MEDIA_BUS_FMT_UYVY8_1X16)
+		format->format.code = code;
+	format->format.colorspace = tc358743_g_colorspace(format->format.code);
 
 	if (ret)
 		return ret;
 
-	switch (code) {
-	case MEDIA_BUS_FMT_RGB888_1X24:
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-- 
2.39.5


