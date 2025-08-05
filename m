Return-Path: <linux-media+bounces-38937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C92B1B472
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A3E3A7A4F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F184279780;
	Tue,  5 Aug 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4dpR8h9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C612275AE6;
	Tue,  5 Aug 2025 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399494; cv=none; b=W8KUbrD0UgxsLZtVcnA2X2ioM018lWVqomDI6HdKt7Kud3CyLfQsXlf+McgWV+rP4y+GWxWrPe32bqs9Fl+yzdYCSNj0qDHLjZ1TOTZtxnikYwdcNGqoytJEdebC9/Bfz+lF2wmvcR1OYkXj3+dZbBokB2lQcc1LUbI1sbgRNvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399494; c=relaxed/simple;
	bh=9H17uJLfuVnidCS+gWRXYJKkHr1eMHymYRNlRa11BOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nlsj3Tt925EiWCKuSd5AJrBDPaU4VOI+TQVaVHjJKhT4/0+xoOcGOWbN5deTjTlx3ZxbiEiSbSyCKJx55yOeL6fdM20ONrQqsKeJskBe5FQsbAJnLR9BLgYgf5V9nhjSMrdCgzlwPgcF8YwqBJAG3gFrm5Lpauo5hG8YhVPKmzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4dpR8h9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A710C4CEF0;
	Tue,  5 Aug 2025 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399494;
	bh=9H17uJLfuVnidCS+gWRXYJKkHr1eMHymYRNlRa11BOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4dpR8h91NEfQjjTthyqk6j2sBw3TGNdfoMFsJNfJrQ2aatuG61Wr7osj49M9A2tS
	 HQAkwESAulLCYd88kCZtXmjWsEIcb5Py/fXoYW8tpqfQWnzDNJ4fVCxBvIMx/tMnzW
	 D6jJILjsnkvIr7Rhe9Q+YjOAFrIY2CRVzdPVuEZ7PTiKf0FxhBCqE3WKE0qhJqkIp/
	 YKNeqMhpnYC4pIW6Sip4WqLzmCtmiA07R2zBIjJ8ZOrgc5JxUZAnxRXsTCLgGMLCp0
	 9bwWJYqq65DmbydcXYBmAWqccE2tamb7OGSHZUhNKhYeBCZtVi3ymHFKz6/bkfBWKm
	 ss0mHR0YkB1FQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] media: tc358743: Increase FIFO trigger level to 374
Date: Tue,  5 Aug 2025 09:09:24 -0400
Message-Id: <20250805130945.471732-49-sashal@kernel.org>
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

[ Upstream commit 86addd25314a1e77dbdcfddfeed0bab2f27da0e2 ]

The existing fixed value of 16 worked for UYVY 720P60 over
2 lanes at 594MHz, or UYVY 1080P60 over 4 lanes. (RGB888
1080P60 needs 6 lanes at 594MHz).
It doesn't allow for lower resolutions to work as the FIFO
underflows.

374 is required for 1080P24 or 1080P30 UYVY over 2 lanes @
972Mbit/s, but >374 means that the FIFO underflows on 1080P50
UYVY over 2 lanes @ 972Mbit/s.

Whilst it would be nice to compute it, the required information
isn't published by Toshiba.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit and the kernel repository, here is my
assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Bug Fix for Real Hardware Issues**: The commit fixes a concrete bug
   where the tc358743 HDMI-to-CSI2 bridge experiences FIFO underflows
   with certain video resolutions. The old hardcoded value of 16 causes
   failures with lower resolutions (1080P24, 1080P30) and different lane
   configurations, making the hardware unusable in these modes.

2. **Small and Contained Change**: The fix is minimal - it only changes
   a single value from 16 to 374 and adds explanatory comments. The
   change is confined to the probe function's initialization code and
   doesn't modify any complex logic or introduce new features.

3. **No Architectural Changes**: This is a simple parameter adjustment
   that doesn't alter the driver's architecture or introduce new
   subsystems. It only modifies the FIFO trigger threshold value written
   to the hardware register (FIFOCTL).

4. **Clear Problem and Solution**: The commit message clearly explains:
   - The old value (16) worked only for specific configurations (720P60
     2-lane, 1080P60 4-lane at 594MHz)
   - It failed for lower resolutions due to FIFO underflows
   - The new value (374) fixes these issues while maintaining
     compatibility with the original working modes

5. **Hardware Compatibility Fix**: This is a hardware compatibility fix
   for the Toshiba TC358743 HDMI-to-CSI2 bridge chip. Users with this
   hardware trying to use affected video modes would experience failures
   without this fix.

6. **Low Risk of Regression**: The change increases the FIFO threshold
   from a very conservative value (16) to a more appropriate one (374).
   The commit message indicates this value was tested with multiple
   configurations and represents a sweet spot that works for both low
   and high resolution modes.

7. **Affects End Users**: Without this fix, users cannot use certain
   common video formats (1080P24/30) with this hardware, which directly
   impacts functionality.

The commit follows stable tree rules by being a minimal bugfix that
resolves a real hardware issue without introducing new features or
making risky changes. The fact that it's simply adjusting a hardware
register value to fix FIFO underflow issues makes it an ideal candidate
for stable backporting.

 drivers/media/i2c/tc358743.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 0bf6481dd0d9..1c7546d2ada4 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1979,8 +1979,19 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	state->pdata.refclk_hz = clk_get_rate(refclk);
 	state->pdata.ddc5v_delay = DDC5V_DELAY_100_MS;
 	state->pdata.enable_hdcp = false;
-	/* A FIFO level of 16 should be enough for 2-lane 720p60 at 594 MHz. */
-	state->pdata.fifo_level = 16;
+	/*
+	 * Ideally the FIFO trigger level should be set based on the input and
+	 * output data rates, but the calculations required are buried in
+	 * Toshiba's register settings spreadsheet.
+	 * A value of 16 works with a 594Mbps data rate for 720p60 (using 2
+	 * lanes) and 1080p60 (using 4 lanes), but fails when the data rate
+	 * is increased, or a lower pixel clock is used that result in CSI
+	 * reading out faster than the data is arriving.
+	 *
+	 * A value of 374 works with both those modes at 594Mbps, and with most
+	 * modes on 972Mbps.
+	 */
+	state->pdata.fifo_level = 374;
 	/*
 	 * The PLL input clock is obtained by dividing refclk by pll_prd.
 	 * It must be between 6 MHz and 40 MHz, lower frequency is better.
-- 
2.39.5


