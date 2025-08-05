Return-Path: <linux-media+bounces-38938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0217B1B494
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675D5189009D
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0F2279DB2;
	Tue,  5 Aug 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IssPLLXi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E73E55B;
	Tue,  5 Aug 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399539; cv=none; b=q0UZIYKLX3eO26ELRX2/ERb3WNExfD8s74x9LFL/53i0v1usERnZ6+rakXeIFvmuhOsBJQGY5oEgIy83ZmHo3HK1BuaLnqdS0flVijpAFbfzKqfrbSVeFjp9gWEvUIAq9GqtTQ8/90F2umTjeEnIj704cAcXqLQ8hbjcXvn/oC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399539; c=relaxed/simple;
	bh=8e1gwNPqga90z0UONejDocvKxDOeqc1OeIg4FdgdU2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=goJSfVFECOV6VAOHjMVl1m2X7eob68hfPyx+gIG7YTobQTX64/6OAVUERAHPqaQJg/hxtd6S8JfPubC7tGBit5S0Dbi/DPAGHzIz7Mc2OH/Zg8Q85xBbVVFraLb5c+w3LfszC8xAhFwGFU091XOgZiuHKVZ9vsvpwIuM8nByR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IssPLLXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75DEC4CEF4;
	Tue,  5 Aug 2025 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399539;
	bh=8e1gwNPqga90z0UONejDocvKxDOeqc1OeIg4FdgdU2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IssPLLXibfZwK5cUiHehNMIud8TGsXMPDnXYcojge3gmh9J1x+Kqat620aZTbHX3R
	 FzsMI//OIPw3SqX1nc5an2dDNdH6r3ses3YmqgvhF32HaTlyUZQ8V+tHu89VSPcbpT
	 NfozBKL7IaJcUAirtdfpRPOIK9KwQnv0chwH9D855PeZTJavkYYcTjwboLxGMd8eAP
	 vWZChHhcIED06aoLJhlx76As4LkDEjDE1vMDI7WT5zfDJyPwjXyH2Fgh6j6/UGvDAc
	 QMa4mOhNAvjzwC47C5inVxEsg9f5spxKHPhIY5z8O+z/tAKUfT/H9gijsmPS1v49o9
	 hybp4Jt7X5vEQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.12] media: hi556: Fix reset GPIO timings
Date: Tue,  5 Aug 2025 09:09:41 -0400
Message-Id: <20250805130945.471732-66-sashal@kernel.org>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 99f2211a9d89fe34b3fa847fd7a4475171406cd0 ]

probe() requests the reset GPIO to be set to high when getting it.
Immeditately after this hi556_resume() is called and sets the GPIO low.

If the GPIO was low before requesting it this will result in the GPIO
only very briefly spiking high and the sensor not being properly reset.
The same problem also happens on back to back runtime suspend + resume.

Fix this by adding a sleep of 2 ms in hi556_resume() before setting
the GPIO low (if there is a reset GPIO).

The final sleep is kept unconditional, because if there is e.g. no reset
GPIO but a controllable clock then the sensor also needs some time after
enabling the clock.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

### 1. **Fixes a Real Hardware Initialization Bug**
The commit addresses a timing race condition in the hi556 camera sensor
driver where:
- In `hi556_probe()`, the reset GPIO is requested with `GPIOD_OUT_HIGH`
  (line 1352-1353)
- Immediately after, `hi556_resume()` is called (line 1376) which sets
  the GPIO low
- This results in the GPIO only briefly spiking high, preventing proper
  sensor reset

### 2. **Clear User-Visible Impact**
The bug causes:
- Sensor initialization failures when the GPIO was previously low
- Runtime suspend/resume failures on back-to-back operations
- Camera sensor not working properly due to inadequate reset timing

### 3. **Small and Contained Fix**
The change is minimal and surgical:
- Adds only 3 lines of code (a conditional check and a 2ms delay)
- Changes are confined to the `hi556_resume()` function
- No architectural changes or new features introduced

### 4. **Low Risk of Regression**
- The fix only adds a delay when a reset GPIO is present
- The unconditional 5ms delay at the end is preserved
- The change follows standard practice for hardware reset timing
  requirements
- Only affects systems with the hi556 sensor that have a reset GPIO
  configured

### 5. **Affects Recently Added Functionality**
The reset GPIO support was added relatively recently (commit
860f262dd0dd from April 2024), and this fix corrects a bug in that
implementation. Systems using this feature would benefit from the fix.

### 6. **Follows Stable Kernel Rules**
The commit:
- Fixes a real bug that affects users
- Is small (under 100 lines)
- Has been tested (signed off by multiple maintainers)
- Doesn't add new features
- Has minimal risk of causing new issues

The timing issue this fixes is a classic hardware initialization race
condition that would cause sporadic camera failures, making it an
important fix for systems using the hi556 sensor with GPIO reset
control.

 drivers/media/i2c/hi556.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index aed258211b8a..d3cc65b67855 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1321,7 +1321,12 @@ static int hi556_resume(struct device *dev)
 		return ret;
 	}
 
-	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
+	if (hi556->reset_gpio) {
+		/* Assert reset for at least 2ms on back to back off-on */
+		usleep_range(2000, 2200);
+		gpiod_set_value_cansleep(hi556->reset_gpio, 0);
+	}
+
 	usleep_range(5000, 5500);
 	return 0;
 }
-- 
2.39.5


