Return-Path: <linux-media+bounces-45551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99438C097C4
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26C784F8546
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074B1307AD4;
	Sat, 25 Oct 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPIYGQit"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD530ACE8;
	Sat, 25 Oct 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409000; cv=none; b=b5MQn6+eFS3UTbqRmxZVA4ktPmtQ8yK98YyIcIcBsjHjBW6qgrEVXhpaC3US+vURUbOVBN5ydy2uRa2raZceASBYt7YUNKPFS2vH1QtqpaNaCyS3Dh578hNpkRbxqM6kRM/BcBEB9G/CpZKys+3EOF/8e4RzHE/6pu5OD1358fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409000; c=relaxed/simple;
	bh=BJNj1AKX4x8khA3V2BuAeQsKGL0gnc5G62vc3d98SzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NfTRud16jVMB+BLB3iwhQpbcA06Gw2miSJq9DbDcanEJmTlXEagZiE6y6eyfZ8I20lIa4iVtzGRVJ/N5nir2H187M7MHksW1TIARNvk5hcqvse1+SFEbMcfZPFCypwjsgGDGyZKnCR67/YT20+FEtbCSEasJyDbFOsfGWuTqWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPIYGQit; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB9AC4CEFB;
	Sat, 25 Oct 2025 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409000;
	bh=BJNj1AKX4x8khA3V2BuAeQsKGL0gnc5G62vc3d98SzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPIYGQitIuGVOHLExI6hVPNjCjoZxtNmL067vCxYnarugMoytfXI2cTRALvaAG3Yd
	 w12SYStShAxlvt0WeIlPhhFmowsu3/b8WsSLG+IEUjibgU44RnhrfLXtumemy9PMtN
	 n9AW0cP4ExuXYrYPAsNBiUVmh3n1xD2T0o2X25GqpFogkvK9OyguXYGfTjSistyawa
	 8hALd0rcZEi2gRhZdaqVroO6F9e6XGmc8p+ZClKLVw0EVTVE7RW4i1CGOVpr63ZSww
	 2BYDz83IWHUBGlIt5Jzb7qNvmCI33qv9v9KWfmeZDxjXbZ4HDpArL7v9TeFk6b9ckN
	 EzGH4o7tC2aRw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	rmfrfs@gmail.com,
	shawnguo@kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] media: imx-mipi-csis: Only set clock rate when specified in DT
Date: Sat, 25 Oct 2025 11:56:40 -0400
Message-ID: <20251025160905.3857885-169-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 65673c6e33cf46f220cc5774166b373b3c087739 ]

The imx-mipi-csis driver sets the rate of the wrap clock to the value
specified in the device tree's "clock-frequency" property, and defaults
to 166 MHz otherwise. This is a historical mistake, as clock rate
selection should have been left to the assigned-clock-rates property.

Honouring the clock-frequency property can't be removed without breaking
backwards compatibility, and the corresponding code isn't very
intrusive. The 166 MHz default, on the other hand, prevents
configuration of the clock rate through assigned-clock-rates, as the
driver immediately overwrites the rate. This behaviour is confusing and
has cost debugging time.

There is little value in a 166 MHz default. All mainline device tree
sources that enable the CSIS specify a clock-frequency explicitly, and
the default wrap clock configuration on supported platforms is at least
as high as 166 MHz. Drop the default, and only set the clock rate
manually when the clock-frequency property is specified.

Link: https://lore.kernel.org/r/20250822002734.23516-10-laurent.pinchart@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this is a bug fix
- The driver unconditionally forced the wrap clock to 166 MHz when the
  DT lacked a clock-frequency property, which overrides DT-assigned
  clock rates. That breaks the expected DT model where `assigned-clock-
  rates` controls rates, leading to misconfiguration and hard-to-debug
  behavior.
- This change stops overriding the clock unless the DT explicitly
  requests it, restoring correct DT semantics.

What changed (code references)
- Set rate only when explicitly requested:
  - `drivers/media/platform/nxp/imx-mipi-csis.c:744` now guards
    `clk_set_rate()` with `if (csis->clk_frequency) { ... }`, meaning
    the driver only sets the rate when the DT provided `clock-
    frequency`.
- Drop the 166 MHz fallback:
  - `drivers/media/platform/nxp/imx-mipi-csis.c:1483` now reads `clock-
    frequency` without assigning a default if the property is absent,
    removing the prior implicit 166 MHz default.
- The removal of the default macro and fallback behavior eliminates the
  unconditional override while preserving backward compatibility for DTs
  that do specify `clock-frequency`.

Why it matters (user impact)
- Systems using `assigned-clock-rates` in DT were previously ignored by
  the driver due to the unconditional 166 MHz set, causing unexpected
  clock rates and potential functional issues.
- With this patch, DT-provided assigned rates take effect unless a
  legacy DT explicitly uses `clock-frequency`, which is retained for
  compatibility.

Risk and compatibility
- Scope is small and contained to one driver; no core or architectural
  changes.
- Backward compatibility is preserved for legacy DTs that specify
  `clock-frequency` (the driver still sets the rate in that case).
- For DTs without `clock-frequency`, the driver no longer forces 166 MHz
  and leaves the rate to the clock framework/DT assignments. The commit
  rationale notes that all mainline DTs enabling CSIS already specify
  `clock-frequency`, and default platform wrap clock configurations are
  at least as high as 166 MHz, reducing regression risk.
- The only functional behavior change is the removal of an incorrect
  default that masked DT configuration.

Stable criteria assessment
- Fixes a real misbehavior that affects users (DT `assigned-clock-rates`
  ignored).
- Minimal, well-contained change in a single driver file.
- No new features or architectural changes.
- Low regression risk with explicit consideration for legacy DT
  compatibility.
- No explicit “Cc: stable” or “Fixes” tag, but technically aligns with
  stable policy as a correctness fix that removes a problematic default
  override.

Conclusion
- This is a clear, low-risk bug fix that restores proper DT semantics
  and prevents the driver from clobbering assigned clock rates. It
  should be backported to stable.

 drivers/media/platform/nxp/imx-mipi-csis.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c01..cea017a2b14ec 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -228,8 +228,6 @@
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
 #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
-#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -704,12 +702,17 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	if (ret < 0)
 		return ret;
 
-	/* Set clock rate */
-	ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
-			   csis->clk_frequency);
-	if (ret < 0)
-		dev_err(csis->dev, "set rate=%d failed: %d\n",
-			csis->clk_frequency, ret);
+	if (csis->clk_frequency) {
+		/*
+		 * Set the clock rate. This is deprecated, for backward
+		 * compatibility with old device trees.
+		 */
+		ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
+				   csis->clk_frequency);
+		if (ret < 0)
+			dev_err(csis->dev, "set rate=%d failed: %d\n",
+				csis->clk_frequency, ret);
+	}
 
 	return ret;
 }
@@ -1413,9 +1416,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 {
 	struct device_node *node = csis->dev->of_node;
 
-	if (of_property_read_u32(node, "clock-frequency",
-				 &csis->clk_frequency))
-		csis->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
+	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
 
 	return 0;
 }
-- 
2.51.0


