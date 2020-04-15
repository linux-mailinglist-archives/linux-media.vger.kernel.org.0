Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3442C1A951A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 09:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635344AbgDOHty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 03:49:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:43614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635333AbgDOHty (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 03:49:54 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6681020768;
        Wed, 15 Apr 2020 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586936993;
        bh=rd7DE3LTZtKGdR3PiC0MuIBv0QpJNOuilo/ol/esxcE=;
        h=From:To:Cc:Subject:Date:From;
        b=2XT75QxuRHHSbHJoJ6NUbY9TLvt7fgsCTQjhOlrrukUNt1ARP+i/6i1NU/mKyUYUx
         xIxFRWbTSXwCMn+fiMQdj0iF3mjfv/x+wZ79vMCWSsWwRIf3b6C2hftQFx9aZmtHA8
         9UmoAkBAQlCTbDw6NU4tddXFEeyRXL6uEitYx2F0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOcnv-006H9n-9y; Wed, 15 Apr 2020 09:49:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Revert "media: Kconfig: move CEC-specific options to cec/Kconfig"
Date:   Wed, 15 Apr 2020 09:49:46 +0200
Message-Id: <9393d050c860a8f03f1e04d380653d23c7911c90.1586936984.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC_CORE symbols are selected by DRM, and should be
independent of MEDIA_SUPPORT.

Fixes this warning when doing "make multi_v7_defconfig":

	WARNING: unmet direct dependencies detected for CEC_CORE
	  Depends on [m]: MEDIA_SUPPORT [=m]
	  Selected by [y]:
	  - DRM_TEGRA [=y] && HAS_IOMEM [=y] && (ARCH_TEGRA [=y] || ARM [=y] && COMPILE_TEST [=n]) && COMMON_CLK [=y] && DRM [=y] && OF [=y] && CEC_NOTIFIER [=y]
	  Selected by [m]:
	  - VIDEO_SAMSUNG_S5P_CEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && CEC_PLATFORM_DRIVERS [=y] && (ARCH_EXYNOS [=y] || COMPILE_TEST [=n])
	  - DRM_EXYNOS_HDMI [=y] && HAS_IOMEM [=y] && DRM_EXYNOS [=m] && (DRM_EXYNOS_MIXER [=y] || DRM_EXYNOS5433_DECON [=n]) && CEC_NOTIFIER [=y]
	  - DRM_I2C_ADV7511_CEC [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && DRM_I2C_ADV7511 [=m]
	  - DRM_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && CEC_NOTIFIER [=y]

This reverts commit f1991411257bdb68d96ef8c8c5b35f412b480375.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig     | 13 +++++++++++++
 drivers/media/cec/Kconfig | 10 ----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a8def1591352..836c2be6c522 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -3,6 +3,19 @@
 # Multimedia device configuration
 #
 
+#
+# NOTE: Those symbols can't depend on MEDIA_SUPPORT, as it would cause
+# unmatched dependencies
+#
+config CEC_CORE
+	tristate
+
+config CEC_NOTIFIER
+	bool
+
+config CEC_PIN
+	bool
+
 source "drivers/media/rc/Kconfig"
 
 menuconfig MEDIA_SUPPORT
diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
index 31417feaa213..c01919713ab9 100644
--- a/drivers/media/cec/Kconfig
+++ b/drivers/media/cec/Kconfig
@@ -1,14 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-
-config CEC_CORE
-	tristate
-
-config CEC_NOTIFIER
-	bool
-
-config CEC_PIN
-	bool
-
 config MEDIA_CEC_RC
 	bool "HDMI CEC RC integration"
 	depends on CEC_CORE && RC_CORE
-- 
2.25.2

