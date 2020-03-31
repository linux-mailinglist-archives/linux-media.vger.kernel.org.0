Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C4E1994EC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgCaLMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730604AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 744FD2173E;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=Lm1iaD2aj9rKSlChgjINMsPHW8VpksU3lXgfgXKd7WA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PINJoweHOhQmxbfol2PR39tItCDEEIcrcyzGftAt/eVK9UsRBxbDuHOyP73LHGYE7
         pT5Nhm/2zFSV6Lrag7JMUUVc6+yYiIINhBkQ84tiuqB5AbSCZBgY1qcGShpurJe/+d
         JA5n5v9QaON1appM0Eink/vRqLdMdlK4VWmHkbN4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brT-N8; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 21/33] media: Kconfig: use a sub-menu to select supported devices
Date:   Tue, 31 Mar 2020 13:11:57 +0200
Message-Id: <33521b7ac775b16177187e39096b3c71aa5610e2.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media subsystem has hundreds of driver-specific options.
The *_SUPPORT config options work as a sort of filter,
allowing to reduce its complexity for users that won't
want to dig into thousands of options they don't need.

Yet, it the filtering options are becoming large. So, let's
place it on a sub-menu.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b1a6874acbcc..a57f898fa35e 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -25,36 +25,35 @@ menuconfig MEDIA_SUPPORT
 	  Additional info and docs are available on the web at
 	  <https://linuxtv.org>
 
-if MEDIA_SUPPORT
-
-comment "Multimedia core support"
+menu "Types of devices to be supported"
+	depends on MEDIA_SUPPORT
 
 #
 # Multimedia support - automatically enable V4L2 and DVB core
 #
 config MEDIA_CAMERA_SUPPORT
-	bool "Cameras/video grabbers support"
+	bool "Cameras and video grabbers"
 	help
 	  Enable support for webcams and video grabbers.
 
 	  Say Y when you have a webcam or a video capture grabber board.
 
 config MEDIA_ANALOG_TV_SUPPORT
-	bool "Analog TV support"
+	bool "Analog TV"
 	help
 	  Enable analog TV support.
 
 	  Say Y when you have a board with analog TV support.
 
 config MEDIA_DIGITAL_TV_SUPPORT
-	bool "Digital TV support"
+	bool "Digital TV"
 	help
 	  Enable digital TV support.
 
 	  Say Y when you have a board with digital TV support.
 
 config MEDIA_RADIO_SUPPORT
-	bool "AM/FM radio receivers/transmitters support"
+	bool "AM/FM radio receivers/transmitters"
 	help
 	  Enable AM/FM radio support.
 
@@ -64,14 +63,14 @@ config MEDIA_RADIO_SUPPORT
 	  Say Y when you have a board with radio support.
 
 config MEDIA_SDR_SUPPORT
-	bool "Software defined radio support"
+	bool "Software defined radio"
 	help
 	  Enable software defined radio support.
 
 	  Say Y when you have a software defined radio device.
 
 config MEDIA_CEC_SUPPORT
-	bool "HDMI CEC support"
+	bool "HDMI CEC"
 	help
 	  Enable support for HDMI CEC (Consumer Electronics Control),
 	  which is an optional HDMI feature.
@@ -80,7 +79,7 @@ config MEDIA_CEC_SUPPORT
 	  adapter that supports HDMI CEC.
 
 config MEDIA_PLATFORM_SUPPORT
-	bool "Platform-specific devices support"
+	bool "Platform-specific devices"
 	help
 	  Enable support for complex cameras, codecs, and other hardware
 	  that are integrated at the CPU, GPU or on Image Signalling Processor
@@ -92,7 +91,7 @@ config MEDIA_PLATFORM_SUPPORT
 	  Say Y when you want to be able so see such devices.
 
 config MEDIA_TEST_SUPPORT
-	bool "Test drivers support"
+	bool "Test drivers"
 	help
 	  Those drivers should not be used on production Kernels, but
 	  can be useful on debug ones. It enables several dummy drivers
@@ -103,6 +102,10 @@ config MEDIA_TEST_SUPPORT
 	  Say Y if you want to use some virtual test driver.
 
 	  In case of doubts, say N.
+	  Say Y when you have a software defined radio device.
+endmenu # Types of devices to be supported
+
+if MEDIA_SUPPORT
 
 comment "Multimedia core features"
 
-- 
2.25.1

