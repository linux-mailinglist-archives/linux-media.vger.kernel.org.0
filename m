Return-Path: <linux-media+bounces-47146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F209C5F36E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2935935B46E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 20:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EFD321448;
	Fri, 14 Nov 2025 20:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pg5mmgPM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E12DAFBB
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 20:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151585; cv=none; b=J7Rqraoh8rc/x2uc/sCOnWB3MpazCG6udrB6A/bdAKfZnBllzApH3wFBqRRpuW/u6vqx9FAU7BpybxvGnAvZ4Vex6fcGqmve/kxc0UnV2ZWMHHDlwTpbLi9fA8qwfQGhloEh2tWpfsP8BUDtZfTE7CkgL8F1gMAd0F+M1CJPdNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151585; c=relaxed/simple;
	bh=IytgZWZMl24T/DdB+yezx1qT1SepmfGDhev2qZykyaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIdgzFzsuth1pf+T8/NASgC7YTSpN/R3QpTaOFE8QWh6FVl/HBRtGUue5pDoeMYkFI0FWRb0QClERIr3XCfPVK4GonaAROt3T065ydXqN2SdeLmW0Ml13MLhS0cMvUoqHDiGQAAbsiPCGvGUloeEsTHwvlUIx8xK2InDX/we5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pg5mmgPM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8CDB169;
	Fri, 14 Nov 2025 21:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763151458;
	bh=IytgZWZMl24T/DdB+yezx1qT1SepmfGDhev2qZykyaY=;
	h=From:To:Cc:Subject:Date:From;
	b=Pg5mmgPMaUy/Ot2P+3Yj2xef6aoKe/kZu3z3aWjGeFxsrLIsJXg529KTcazgKeKt5
	 h/c+o5Y+xOuWNkOIvXNXyeBItvbg1KhXb/KpsGk+/bMlL3Yg2HE44lroXjj8FujdG0
	 Wkee7q7c+Li23W/343hRl19Itus96YKdVrQGCON4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: hans@jjverkuil.nl,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: mali-c55: Mark pm handlers as __maybe_unused
Date: Fri, 14 Nov 2025 21:19:20 +0100
Message-ID: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the Mali-C55 driver is instrumented to work without depending on
CONFIG_PM, mark the two pm_runtime handlers as __maybe_unused to
suppress the compiler warning when compiling without CONFIG_PM.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Late fix for Mali C55 PR

fixes:
https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/87903226

it's great to have CI, Thanks!

---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index b23d543cf496..43b834459ccf 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -707,7 +707,7 @@ static void __mali_c55_power_off(struct mali_c55 *mali_c55)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
 }

-static int mali_c55_runtime_suspend(struct device *dev)
+static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
 {
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);

@@ -770,7 +770,7 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 	return 0;
 }

-static int mali_c55_runtime_resume(struct device *dev)
+static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
 {
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 	int ret;
--
2.51.1


