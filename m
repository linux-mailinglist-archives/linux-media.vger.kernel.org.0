Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85D5192DB7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgCYQEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:04:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727386AbgCYQEB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:04:01 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECA6720772;
        Wed, 25 Mar 2020 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585152241;
        bh=xdDB06UvC43JTB8pfgxcJWv7U2ANTWE7CoouvvilD+8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bHJxbhi/i/YQkSRYfnHv+PLftvX7qaHVF1MLbpW/ukL6jmlX5YbbrSL3d9amwuT9q
         3FGtgbfcJfJLV0zqJolGPLsQRcZWRqXuMxiztrposnzSJ+1g15BIGMIcVdBDndqQwO
         A+Sdx7UCjMoN+RN6zXol56D/MDQz1I2xzheUg2r0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH8Va-003MJN-PF; Wed, 25 Mar 2020 17:03:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 4/4] media: Kconfig: don't use visible for device type select
Date:   Wed, 25 Mar 2020 17:03:57 +0100
Message-Id: <3e077a758967e059705a214246ab49194a796b8b.1585151701.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585151701.git.mchehab+huawei@kernel.org>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While making the menu invisible seemed a good idea, there's
a drawback: when the menu is not visible, it is not parsing
the "default" dependency.

So, instead, let's just avoid the items at the menu to be
prompted, by using the "prompt ... if" construction.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 787a8b8f288a..e880c7fae664 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -57,13 +57,13 @@ config MEDIA_SUBDRV_AUTOSELECT
 	  If unsure say Y.
 
 menu "Media device types"
-	visible if MEDIA_SUPPORT_FILTER
 
 #
 # Multimedia support - automatically enable V4L2 and DVB core
 #
 config MEDIA_CAMERA_SUPPORT
-	bool "Cameras and video grabbers"
+	bool
+	prompt "Cameras and video grabbers" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable support for webcams and video grabbers.
@@ -71,7 +71,8 @@ config MEDIA_CAMERA_SUPPORT
 	  Say Y when you have a webcam or a video capture grabber board.
 
 config MEDIA_ANALOG_TV_SUPPORT
-	bool "Analog TV"
+	bool
+	prompt "Analog TV" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable analog TV support.
@@ -79,7 +80,8 @@ config MEDIA_ANALOG_TV_SUPPORT
 	  Say Y when you have a board with analog TV support.
 
 config MEDIA_DIGITAL_TV_SUPPORT
-	bool "Digital TV"
+	bool
+	prompt "Digital TV" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable digital TV support.
@@ -87,7 +89,8 @@ config MEDIA_DIGITAL_TV_SUPPORT
 	  Say Y when you have a board with digital TV support.
 
 config MEDIA_RADIO_SUPPORT
-	bool "AM/FM radio receivers/transmitters"
+	bool
+	prompt "AM/FM radio receivers/transmitters" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable AM/FM radio support.
@@ -98,7 +101,8 @@ config MEDIA_RADIO_SUPPORT
 	  Say Y when you have a board with radio support.
 
 config MEDIA_SDR_SUPPORT
-	bool "Software defined radio"
+	bool
+	prompt "Software defined radio" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable software defined radio support.
@@ -106,7 +110,8 @@ config MEDIA_SDR_SUPPORT
 	  Say Y when you have a software defined radio device.
 
 config MEDIA_CEC_SUPPORT
-	bool "HDMI CEC support"
+	bool
+	prompt "HDMI CEC support" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable support for HDMI CEC (Consumer Electronics Control),
@@ -116,7 +121,8 @@ config MEDIA_CEC_SUPPORT
 	  adapter that supports HDMI CEC.
 
 config MEDIA_PLATFORM_SUPPORT
-	bool "Platform-specific devices"
+	bool
+	prompt "Platform-specific devices" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable support for complex cameras, codecs, and other hardware
@@ -129,7 +135,8 @@ config MEDIA_PLATFORM_SUPPORT
 	  Say Y when you want to be able so see such devices.
 
 config MEDIA_TEST_SUPPORT
-	bool "Test drivers"
+	bool
+	prompt "Test drivers" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Those drivers should not be used on production Kernels, but
-- 
2.25.1

