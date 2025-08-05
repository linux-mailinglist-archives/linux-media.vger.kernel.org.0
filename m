Return-Path: <linux-media+bounces-38930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C9B1B433
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEAAE167523
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66099274FF2;
	Tue,  5 Aug 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1sQnzqA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE000271A9A;
	Tue,  5 Aug 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399416; cv=none; b=VAYmeZfQwtC9tJmF/FhA+hhmWYOBjkbB7l17qbA/mZzmxyvJR8t4KmxY1dmwSLVm+04UXt4FMIYqXSZksVXUYDwuQDCIHl4FtKGev+kt843KbYL7nLmu1m0Cm1AGaJo21789bTz27Mz0wMphhCLXItzpWnkJP98foIcLEldp9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399416; c=relaxed/simple;
	bh=nLR2nKCPs3giCPKRnM4kPEs7iA3ItISXiBbVh3su7hQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OubJ6D2h5GSqqdIZ/cTYirKSKJNmcn04ZT/URX+QVGt9SclIJRzbZgHlpS9Xm/yZpYyiqQMgOIX5LPGSRPc38VTw9W0ZwqnKPb20o8d2NEIp8pUaM4SEaNNCVO8d9GmNmyjRXxO8neJevc/QqZtctqEUMfyxWyzJxvt+q/MSDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1sQnzqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0F8C4CEFC;
	Tue,  5 Aug 2025 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399416;
	bh=nLR2nKCPs3giCPKRnM4kPEs7iA3ItISXiBbVh3su7hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1sQnzqAxxCWV7szqLxlwQcDkc+1agza8PNvd7M42TcsL6E59qjDeyAYUCQpWX96y
	 NLGX6zMJylR5W2KG+bVhhW8nXwLsgF/zUEOQUe21ZS1zww2oxigz60KMUWVRs0+yYk
	 NYJKiipa1xEW53HyQJfEKaze9SebtlccnfRBrqLAnZek21GsJ/zt+Ymkzuwgg71ANh
	 +5zXZENxrNAb8U0+prcBOVl7Ef/ylbfDoKh31s4t6qru/V5ACOHYjxymIEyDCnptJv
	 znXmkG86L8FnD9xub4nt2MkLAzlRJujD3mFw7feHeA4qJ9QxNT+8TU8UurvXAjLFYx
	 XoqKhLSLhHCWg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	sylvain.petinot@foss.st.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16] media: i2c: vd55g1: Fix RATE macros not being expressed in bps
Date: Tue,  5 Aug 2025 09:08:49 -0400
Message-Id: <20250805130945.471732-14-sashal@kernel.org>
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

From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

[ Upstream commit 5b69a84005b686365e9cacb2ca942271ed74867a ]

As a bit rate is expressed in bps, use MEGA instead of HZ_PER_MHZ.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's the
extensive analysis:

## Bug Analysis

The commit fixes a unit confusion bug in the vd55g1 camera sensor
driver. The macros `VD55G1_MIPI_RATE_MIN` and `VD55G1_MIPI_RATE_MAX` are
incorrectly defined using `HZ_PER_MHZ` when they should use `MEGA`:

```c
// Before (incorrect):
#define VD55G1_MIPI_RATE_MIN    (250 * HZ_PER_MHZ)   // 250 MHz
#define VD55G1_MIPI_RATE_MAX    (1200 * HZ_PER_MHZ)  // 1200 MHz

// After (correct):
#define VD55G1_MIPI_RATE_MIN    (250 * MEGA)         // 250 Mbps
#define VD55G1_MIPI_RATE_MAX    (1200 * MEGA)        // 1200 Mbps
```

Both `HZ_PER_MHZ` and `MEGA` are defined as `1000000UL` in
`/home/sasha/linux/include/linux/units.h`, so numerically they're the
same. However, semantically they represent different units:
- `HZ_PER_MHZ` is for frequency conversion (Hz)
- `MEGA` is a generic multiplier for mega units, appropriate for bit
  rates (bps)

## Impact Assessment

1. **Functional Impact**: While numerically identical, this is a
   semantic bug that affects code clarity and correctness. The driver
   uses these macros to validate MIPI data rates:
   - Lines 712-713: Range validation of `sensor->mipi_rate`
   - Lines 716-717: Error messages that explicitly show rates in Mbps
     using `/ MEGA`

2. **User-Facing Bug**: Yes - incorrect unit semantics could lead to
   confusion when debugging or maintaining the driver. The error
   messages explicitly show "MIPI rates must be in the range [%u - %u]
   Mbps", proving these are bit rates, not frequencies.

3. **Regression Risk**: Minimal - since both macros have the same
   numerical value, there's no functional change, only semantic
   correctness.

## Stable Tree Criteria

This commit meets stable tree requirements:
1. **Fixes a real bug**: Semantic incorrectness in unit usage
2. **Small and contained**: Only changes 2 lines
3. **No side effects**: Purely a semantic fix with no functional changes
4. **No architectural changes**: Simple macro definition update
5. **Subsystem impact**: Limited to a single media driver (vd55g1)
6. **Clear fix**: The commit message clearly explains what's being fixed

The fix ensures proper semantic meaning for MIPI data rate validation,
which is important for code maintainability and prevents potential
future bugs if the macro values ever diverge.

 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 8552ce75e1aa..d00daf89be96 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -129,8 +129,8 @@
 #define VD55G1_FWPATCH_REVISION_MINOR			9
 #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
 #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
-#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
-#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
+#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
+#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
 
 static const u8 patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
-- 
2.39.5


