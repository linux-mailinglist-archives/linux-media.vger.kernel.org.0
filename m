Return-Path: <linux-media+bounces-28256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887CEA6153A
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCC5462DCC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29F020126A;
	Fri, 14 Mar 2025 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrULeqcw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8841519B0;
	Fri, 14 Mar 2025 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967263; cv=none; b=ibv5+hNujREAhNGBz7NPzGcCm8F2y/9XCokTdSEcQX8vVDygh7GNgTsnjWcCVkJ4LU1tgC/l+3id33PnL4QuHcqLfV4O1VkhmJYy4r0Fkcr+GbVw+PQ3TH7q+h1jBc+rcuh7gyZl7m4/n5daFrQGDaFoe80triwLvTBEY5u97lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967263; c=relaxed/simple;
	bh=rBLmkl1p+uVpiS36v8hfNcMeImuPcFd987Cqs4MlZr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qPalmqFPrBH8Lwjbec2H6/ZeaKQ4SPy/dua78o7JqcXWoenyUpUScR29wKFWI3T01GkeBEAYazfBSVIBgl18v+E+61AEAIK5GFsYkBY1awZIVlhYkEJ88OmuZoP7t3lRlpDND6Gym2XlP6wVS1hm9/Un1F8UsGSi03AfqkVg0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrULeqcw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF0FC4CEE3;
	Fri, 14 Mar 2025 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967262;
	bh=rBLmkl1p+uVpiS36v8hfNcMeImuPcFd987Cqs4MlZr4=;
	h=From:To:Cc:Subject:Date:From;
	b=HrULeqcw2xByVf5CF7+RZGouSJg/D29IWkChCCYE4XNSQV/trULOJAvIFNzYZV9IZ
	 DmM5xbirr2Cd3SoTI8Q/GFk3zur7dhmxdycXUevMQz2YTOdY8yvkeYNG5wupWv828B
	 k/DCONPVpLPue9MblzqzXzxugjU6k/4Gkvys2F2rzRL0WTbiV5qPNcmv3NlItDsYOa
	 hLpEuTmEzxBmz31BjnOHxOAvLAINYZB/9ecaxcM0SIuOP/7qRY51I5W9jpElhhpLSk
	 nw+wteDBxvWJjIkv7GXaroesj8+yf7JvFcC2UKkepUgWt13MpLF5Be831QyVWAtFtN
	 kSWHRi8IezTuQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dongcheng Yan <dongcheng.yan@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: lt6911uxe: Fix Kconfig dependencies:
Date: Fri, 14 Mar 2025 16:46:30 +0100
Message-Id: <20250314154738.3983798-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The new driver fails to build if I2C is disabled:

drivers/media/i2c/lt6911uxe.c:703:1: error: data definition has no type or storage class [-Werror]
  703 | module_i2c_driver(lt6911uxe_i2c_driver);

or if I2C is on but V4L2_CCI_I2C is not:

ERROR: modpost: "cci_write" [drivers/media/i2c/lt6911uxe.ko] undefined!
ERROR: modpost: "cci_read" [drivers/media/i2c/lt6911uxe.ko] undefined!

For both by adding a dependency on I2C and selecting V4L2_CCI_I2C, which
follows the common practice for these.

Fixes: e49563c3be09 ("media: i2c: add lt6911uxe hdmi bridge driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e576b213084d..b06365d02ef1 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1149,8 +1149,9 @@ config VIDEO_ISL7998X
 
 config VIDEO_LT6911UXE
 	tristate "Lontium LT6911UXE decoder"
-	depends on ACPI && VIDEO_DEV
+	depends on ACPI && VIDEO_DEV && I2C
 	select V4L2_FWNODE
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the Lontium
 	  LT6911UXE HDMI to MIPI CSI-2 bridge.
-- 
2.39.5


