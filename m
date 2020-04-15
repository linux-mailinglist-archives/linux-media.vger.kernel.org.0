Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12201A97CC
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393855AbgDOJF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:05:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54192 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393832AbgDOJFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:05:20 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id A86232A08AA
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: Kconfig: include test_drivers with MEDIA_TEST_SUPPORT
Date:   Wed, 15 Apr 2020 10:05:09 +0100
Message-Id: <20200415090509.18381-1-guillaume.tucker@collabora.com>
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

Fixes: 4b32216adb010 ("media: split test drivers from platform directory")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 drivers/media/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
2.20.1

