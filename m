Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CD71A9565
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 10:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393780AbgDOIAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 04:00:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:46906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393760AbgDOH73 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 03:59:29 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FBDC206F9;
        Wed, 15 Apr 2020 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586937565;
        bh=yxKYEM/UX9AdNnZ9m3ZE/iNtfHN1LPsMNx7kD8VbEl0=;
        h=From:To:Cc:Subject:Date:From;
        b=M+Ny+vaHTlnw4V+5yNoFDdZu66gkDgQgIW2LN4RtpjFCc8Vd88FJMCBqizErWOSN4
         i1F1T/5lGWxVzYN7hEY+UbfG97ppfW2MkbX7JL9vVdv01v8tJiAnmKnJXjMA2u8KPd
         o+9H0R0GFjo7xrkjfXcx15KrISN2svZvmHJRGK70=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOcx9-006HP2-7o; Wed, 15 Apr 2020 09:59:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH RFC] media: place CEC menu before multimedia one
Date:   Wed, 15 Apr 2020 09:59:20 +0200
Message-Id: <dd06fcf8e553712e37c8929f8a5c347336e26c9f.1586937556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only item that opens at the CEC Kconfig menu is related
to Remote Controller. Also, its support should not depend on
media support, so it makes sense to keep both together.

After this change, the main media menus that are visible
under "Device Drivers" menu are:

	<*> Remote Controller support  --->
	[ ] HDMI CEC RC integration (NEW)
	<M> Multimedia support  --->

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig     | 30 ++----------------------------
 drivers/media/cec/Kconfig |  9 +++++++++
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 836c2be6c522..12a0136fe72f 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -4,19 +4,10 @@
 #
 
 #
-# NOTE: Those symbols can't depend on MEDIA_SUPPORT, as it would cause
-# unmatched dependencies
+# NOTE: CEC and Remote Controller support should not depend on MEDIA_SUPPORT
 #
-config CEC_CORE
-	tristate
-
-config CEC_NOTIFIER
-	bool
-
-config CEC_PIN
-	bool
-
 source "drivers/media/rc/Kconfig"
+source "drivers/media/cec/Kconfig"
 
 menuconfig MEDIA_SUPPORT
 	tristate "Multimedia support"
@@ -132,17 +123,6 @@ config MEDIA_SDR_SUPPORT
 
 	  Say Y when you have a software defined radio device.
 
-config MEDIA_CEC_SUPPORT
-	bool
-	prompt "HDMI CEC support" if MEDIA_SUPPORT_FILTER
-	default y if !MEDIA_SUPPORT_FILTER
-	help
-	  Enable support for HDMI CEC (Consumer Electronics Control),
-	  which is an optional HDMI feature.
-
-	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
-	  adapter that supports HDMI CEC.
-
 config MEDIA_PLATFORM_SUPPORT
 	bool
 	prompt "Platform-specific devices" if MEDIA_SUPPORT_FILTER
@@ -231,12 +211,6 @@ menu "Digital TV options"
 source "drivers/media/dvb-core/Kconfig"
 endmenu
 
-menu "HDMI CEC options"
-	visible if CEC_CORE
-
-source "drivers/media/cec/Kconfig"
-endmenu
-
 menu "Media drivers"
 
 comment "Drivers filtered as selected at 'Filter media drivers'"
diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
index c01919713ab9..c27c38305603 100644
--- a/drivers/media/cec/Kconfig
+++ b/drivers/media/cec/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config CEC_CORE
+	tristate
+
+config CEC_NOTIFIER
+	bool
+
+config CEC_PIN
+	bool
+
 config MEDIA_CEC_RC
 	bool "HDMI CEC RC integration"
 	depends on CEC_CORE && RC_CORE
-- 
2.25.2

