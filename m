Return-Path: <linux-media+bounces-33821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC4ACA5DD
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C581886D4F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73F9298803;
	Sun,  1 Jun 2025 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEth2v5h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5AC30CDB7;
	Sun,  1 Jun 2025 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821117; cv=none; b=oJYfi8usT9UQa5XP7Sy+gg9YIe/CFlvR2taHvtEr2xkX+reNGmY3tSaMr2+ySy+TWQFG/szc60YDhH9yzHD6uYcu84XX3C/QjVt6YjSRf533pWVGlhhQ2WC+KSSvH1z0yAJx6ox1Rws69NWC5T9y1nTuoofCrEAY6qeigCu2sB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821117; c=relaxed/simple;
	bh=8dbdz8fuIPb78U29jUzk2FDj/sAVRi3w+NB/iNrTAdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1BE/fm1R9CJKw2RGPyzDEqdCXaM7hD4yWMtn8UQDGKZJarVwxt6Va+qBs0v326kWBzBg70zc3fAPFTgd3WMV236kxagBq33N9XpW1VHSurPpcKh7jRGOdCCfwzVyOCdVNkVqC0GDC7ziOQkJ5oBIQdntB6fPVAIpx4R0oKby2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEth2v5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D30C4CEE7;
	Sun,  1 Jun 2025 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821117;
	bh=8dbdz8fuIPb78U29jUzk2FDj/sAVRi3w+NB/iNrTAdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bEth2v5hvpXqSpJFIq7iAH1cYeN0OsCyuX3cfNYcm+sBNRM2mrWcekujzTNZLH+MH
	 HbUdt2VxamkPnhRKooDEnK/Od1mbTzwZhK162nOyRe73nlzOG/MLNp5FfP7ochsRcp
	 QSF1/XiZWAnZTJcyu0U4YdiW4m6SP9YrS/J2gtxjfd1wFV1bDHsyjcAYkhXNCFGu4K
	 lADY6fMwWRTXWpV+VZEcUnX0lQq/qNW8wzADrc9QjbiwQ1sej+wqi0O3GNAycQTuEj
	 OV/G/D3s1fcW9ULm18TL+fazzyzB6+Da9H/Akx/mmnKIW3YzJj2pKxE2mqmuW6vMaL
	 7OX7Ctgksk4Jg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 20/66] media: i2c: imx334: Fix runtime PM handling in remove function
Date: Sun,  1 Jun 2025 19:36:57 -0400
Message-Id: <20250601233744.3514795-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tarang Raval <tarang.raval@siliconsignals.io>

[ Upstream commit b493cd3c03641f9bbaa9787e43ca92163cb50051 ]

pm_runtime_suspended() only checks the current runtime PM status and does
not modify it, making it ineffective in this context. This could result in
improper power management if the device remains active when removed.

This patch fixes the issue by introducing a check with
pm_runtime_status_suspended() to determine if the device is already
suspended. If it is not, it calls imx334_power_off() to power down the
device and then uses pm_runtime_set_suspended() to correctly update the
runtime PM status to suspended.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should **definitely** be backported to stable kernel
trees. Here's my extensive analysis: ## Bug Analysis **The Core Issue**:
Line 1435 in the current `imx334_remove()` function contains a critical
bug: ```c pm_runtime_suspended(&client->dev); // WRONG - this is a
boolean query function ``` This should be: ```c
pm_runtime_set_suspended(&client->dev); // CORRECT - this sets the PM
state ``` ## Evidence from Code Analysis 1. **Function Signature
Mismatch**: - `pm_runtime_suspended()` returns `bool` and only
**queries** the current state - `pm_runtime_set_suspended()` returns
`void` and **modifies** the runtime PM state 2. **Comparison with
Similar Drivers**: Every other IMX sensor driver in the kernel uses the
correct pattern: - **imx290.c**:
`pm_runtime_set_suspended(imx290->dev);` - **imx258.c**:
`pm_runtime_set_suspended(&client->dev);` - **imx412.c**:
`pm_runtime_set_suspended(&client->dev);` - **imx274.c**:
`pm_runtime_set_suspended(&client->dev);` - **imx415.c**:
`pm_runtime_set_suspended(&client->dev);` 3. **Missing Power
Management**: The current imx334 driver fails to ensure the device is
powered off during removal, unlike the established pattern: ```c if
(!pm_runtime_status_suspended(&client->dev)) {
imx334_power_off(&client->dev); pm_runtime_set_suspended(&client->dev);
} ``` ## Impact Assessment **Why This Is Critical for Stable
Backporting**: 1. **Resource Leaks**: If the device is powered on during
removal, the clock (`imx334->inclk`) and GPIO resources may not be
properly released, leading to resource leaks. 2. **Runtime PM State
Corruption**: The kernel's runtime PM subsystem maintains internal state
that becomes inconsistent when `pm_runtime_suspended()` is called
instead of `pm_runtime_set_suspended()`. 3. **Driver Reload Issues**: If
the driver is unloaded and reloaded, the inconsistent PM state can cause
subsequent power management operations to fail. 4. **System Power
Management**: Improper PM cleanup can affect system-wide power
management, potentially preventing proper suspend/resume cycles. ##
Stable Tree Suitability Criteria ✅ **Fixes a clear bug**: Yes - wrong
function call causing runtime PM state corruption ✅ **Small and
contained**: Yes - 3-line change in one function ✅ **Minimal regression
risk**: Yes - follows established patterns from other drivers ✅
**Important bugfix**: Yes - affects device cleanup and system stability
✅ **No architectural changes**: Yes - simple correction to existing code
✅ **Follows similar pattern**: Yes - matches Similar Commit #2 which was
marked "YES" ## Comparison with Similar Commits This commit closely
matches **Similar Commit #2** (CCS driver runtime PM fix) which was
marked for backporting because it: - Fixed runtime PM status handling in
remove function - Had minimal risk and clear benefit - Followed
established patterns The commit is much more suitable than **Similar
Commits #1, #3, #4, #5** which were marked "NO" because they involved: -
Code cleanup/refactoring (#1) - Redundant code removal (#3) - Complex
error handling changes (#4) - Major feature additions (#5) ## Conclusion
This is a textbook example of a stable tree candidate: it fixes a clear,
impactful bug with minimal code change and follows well-established
patterns. The fix prevents resource leaks and runtime PM state
corruption that can affect system stability.

 drivers/media/i2c/imx334.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index fccf474752797..239c7cee9f0c4 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1402,7 +1402,10 @@ static void imx334_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
-	pm_runtime_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		imx334_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	mutex_destroy(&imx334->mutex);
 }
-- 
2.39.5


