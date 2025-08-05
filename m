Return-Path: <linux-media+bounces-38933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 145ACB1B47F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46F3D7B0D75
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE1A274670;
	Tue,  5 Aug 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdcMfShv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE6272E5E;
	Tue,  5 Aug 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399453; cv=none; b=FOnbLAfAui02WVj8nE1IfA1V/FMAdN32k7ggu8dQPCDq6Vd4xQ7D+8ECtRSO9HLYv12hH8EIGDwRLvDb7e0BYd0RReV08pypdi4gZ51/8NdFemiGd4tI6lv3UbV9r6qghdfHM4/8JRGHdANnUi+yRmDhhznINIs6O+likKHsbCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399453; c=relaxed/simple;
	bh=j5u24uhVQLHf+S8xNAy3nBdm5k+ydqhyZOb99ig2Rdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Igq9yV/K6oxGuuHnG4SoLYZNyMfxzqspAMrzgwm5rmGL2IW7w4ScdjI69zdAZg3eTtF0ya2UzI23q2FHyP3C0Ftk+py9bGcGVW7+6H5w4/S2ABeqV1PoL1/WKCSYYMvtzFtiP0RKW70EkBEKVOHNMfXJfIsOin49Tk3HozxpRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdcMfShv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB99C4CEF0;
	Tue,  5 Aug 2025 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399452;
	bh=j5u24uhVQLHf+S8xNAy3nBdm5k+ydqhyZOb99ig2Rdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdcMfShvWaHNkpX1qvUjawDhgGlqOif7Ksgv0b+OYWKAzrjIzJF8lMEUNikkXdVvJ
	 QI2FEn+QoFkCjkbBoM+VUh0msbSS10Zl5SGB15AdlPJD5h7M0YTY+qDX68vinm6dC5
	 CHOULSYzRzUIEfiVpFCGiSZcBNPTWzpz+HgDKhQ3ONE49xDGNvuaBQzypegrr7u9Yp
	 /v+OiCmZ97TLJXgANOWKZtBooTcMlU2C7lmvb6cUfUfJ8IrxrYWeRyASQcaIyS8/V0
	 6uuEcfoxBgeLv8R+fwEN5B4/L5tPOcT6WwSAsUr8eZ31GLujeI18XwvmPs6Q6OMQGD
	 Xvhc/Z+Sj5PHA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	sylvain.petinot@foss.st.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16] media: i2c: vd55g1: Setup sensor external clock before patching
Date: Tue,  5 Aug 2025 09:09:05 -0400
Message-Id: <20250805130945.471732-30-sashal@kernel.org>
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

From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

[ Upstream commit df2f8fd91bde57d5d5aca6adddf7e988f2e8c60e ]

Proper clock configuration is required to advance through FSM states.
Prior than this having a different clock value than default sensor's
value was used (12 MHz) could prevent the sensor from booting.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis

1. **Critical Boot Issue**: The commit fixes a sensor initialization
   failure where the sensor could fail to boot if a non-default clock
   frequency was used. The commit message explicitly states: "Prior than
   this having a different clock value than default sensor's value was
   used (12 MHz) could prevent the sensor from booting."

2. **Clear Root Cause**: The issue is a timing/sequencing problem where
   the external clock must be configured BEFORE the patch is applied to
   allow proper FSM (Finite State Machine) state transitions. The commit
   message states: "Proper clock configuration is required to advance
   through FSM states."

3. **Small and Contained Fix**: The fix is minimal - it simply moves one
   line of code (`vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK,
   sensor->xclk_freq, &ret);`) from the streaming enable function to the
   power-on sequence, specifically between sensor detection and
   patching.

## Code Analysis

Looking at the code changes:
- **REMOVED** from `vd55g1_enable_streams()` at line 1040 (after power-
  on)
- **ADDED** to `vd55g1_power_on()` at line 1614 (after detect, before
  patch)

The new sequence in `vd55g1_power_on()` becomes:
1. Enable power/clock → FSM state: READY_TO_BOOT
2. `vd55g1_detect()` - verify sensor ID
3. **NEW: Configure external clock** ← Critical for FSM advancement
4. `vd55g1_patch()` - apply firmware patch
5. Wait for FSM state: SW_STBY

## Stable Criteria Met

1. **Fixes a real bug**: Yes - sensor initialization failure with non-
   default clocks
2. **Small change**: Yes - single line moved between functions
3. **No new features**: Correct - just fixes sequencing
4. **Low regression risk**: Yes - moves existing code to proper location
5. **Hardware enablement**: Fixes broken hardware initialization for
   VD55G1 sensor
6. **Recently added driver**: The driver was added in April 2025 (commit
   e56616d7b23c), making this an early fix for a new driver that likely
   needs to work properly in stable kernels

The fix addresses a fundamental initialization issue that would prevent
the sensor from working with any clock frequency other than the default
12 MHz, making it a critical fix for proper hardware support.

 drivers/media/i2c/vd55g1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 25e2fc88a036..8552ce75e1aa 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1038,8 +1038,6 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
-	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
-
 	/* Configure output */
 	vd55g1_write(sensor, VD55G1_REG_MIPI_DATA_RATE,
 		     sensor->mipi_rate, &ret);
@@ -1613,6 +1611,9 @@ static int vd55g1_power_on(struct device *dev)
 		goto disable_clock;
 	}
 
+	/* Setup clock now to advance through system FSM states */
+	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
+
 	ret = vd55g1_patch(sensor);
 	if (ret) {
 		dev_err(dev, "Sensor patch failed %d\n", ret);
-- 
2.39.5


