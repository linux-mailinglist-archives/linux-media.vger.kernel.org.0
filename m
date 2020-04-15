Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3AA1AA488
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 15:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636125AbgDONg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 09:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730130AbgDONg2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 09:36:28 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B56C061A0C;
        Wed, 15 Apr 2020 06:36:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 5DC1B2A0920
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: Kconfig: include test_drivers with MEDIA_TEST_SUPPORT
Date:   Wed, 15 Apr 2020 14:35:52 +0100
Message-Id: <20200415133552.26411-1-guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Include test_drivers/Kconfig when MEDIA_TEST_SUPPORT is enabled rather
than MEDIA_PLATFORM_SUPPORT.  Test drivers should not depend on
platform drivers to be enabled.

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Fixes: 4b32216adb010 ("media: split test drivers from platform directory")
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---

Notes:
    v2: Drop redundant "if MEDIA_TEST_SUPPORT" in test_drivers/Kconfig

 drivers/media/Kconfig              | 5 ++++-
 drivers/media/test_drivers/Kconfig | 4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a8def1591352..d926c2603de2 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -238,10 +238,13 @@ source "drivers/media/common/Kconfig"
 
 if MEDIA_PLATFORM_SUPPORT
 source "drivers/media/platform/Kconfig"
-source "drivers/media/test_drivers/Kconfig"
 source "drivers/media/mmc/Kconfig"
 endif
 
+if MEDIA_TEST_SUPPORT
+source "drivers/media/test_drivers/Kconfig"
+endif
+
 source "drivers/media/firewire/Kconfig"
 
 endmenu
diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test_drivers/Kconfig
index 9f4a9cfbacc9..e62abec030c3 100644
--- a/drivers/media/test_drivers/Kconfig
+++ b/drivers/media/test_drivers/Kconfig
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-if MEDIA_TEST_SUPPORT
-
 menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV
@@ -24,5 +22,3 @@ config VIDEO_VIM2M
 source "drivers/media/test_drivers/vicodec/Kconfig"
 
 endif #V4L_TEST_DRIVERS
-
-endif #MEDIA_TEST_SUPPORT
-- 
2.20.1

