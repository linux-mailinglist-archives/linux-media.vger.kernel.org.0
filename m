Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C2F1994EF
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730664AbgCaLMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730619AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 896F92192A;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=8N4iqokzqoNaJxagCxYxEAKdqXuGw67XV4CIcoQUf1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IlyzrfztvY58o5Ww4OVWJDez2wsSlA4ovXLQRR/CAcwO2zQv9csBqyENd3Oh+WxhL
         uIkR3nEi1hACfwZOodB/JMelwL4TbjhfOTpUNLECGvu9PYcbDnVnFrvN0xhd6u7kIp
         5nNOaUxDkuwPkOpvb4igaXovCsRSWOw4gRHqODE4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brY-O5; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 22/33] media: Kconfig: make filtering devices optional
Date:   Tue, 31 Mar 2020 13:11:58 +0200
Message-Id: <53a0d97793a50891c7a1d67681c927cf45d0d947.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The per-device option selection is a feature that some
developers love, while others hate...

So, let's make both happy by making it optional.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a57f898fa35e..8b070fb703f9 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -25,14 +25,32 @@ menuconfig MEDIA_SUPPORT
 	  Additional info and docs are available on the web at
 	  <https://linuxtv.org>
 
-menu "Types of devices to be supported"
+if MEDIA_SUPPORT
+
+config MEDIA_SUPPORT_FILTER
+	bool "Filter devices by their types"
 	depends on MEDIA_SUPPORT
+	help
+	   Configuring the media subsystem can be complex, as there are
+	   hundreds of drivers and other config options.
+
+	   This menu offers option that will help the Kernel's config
+	   system to hide drivers that are out of the scope of the
+	   user needs, and disabling core support for unused APIs.
+
+	   If not selected, all non-optional media core functionality
+	   needed to support media drivers will be enabled. Also, all
+	   media device drivers should be shown.
+
+menu "Media device types"
+	visible if MEDIA_SUPPORT_FILTER
 
 #
 # Multimedia support - automatically enable V4L2 and DVB core
 #
 config MEDIA_CAMERA_SUPPORT
 	bool "Cameras and video grabbers"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable support for webcams and video grabbers.
 
@@ -40,6 +58,7 @@ config MEDIA_CAMERA_SUPPORT
 
 config MEDIA_ANALOG_TV_SUPPORT
 	bool "Analog TV"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable analog TV support.
 
@@ -47,6 +66,7 @@ config MEDIA_ANALOG_TV_SUPPORT
 
 config MEDIA_DIGITAL_TV_SUPPORT
 	bool "Digital TV"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable digital TV support.
 
@@ -54,6 +74,7 @@ config MEDIA_DIGITAL_TV_SUPPORT
 
 config MEDIA_RADIO_SUPPORT
 	bool "AM/FM radio receivers/transmitters"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable AM/FM radio support.
 
@@ -64,6 +85,7 @@ config MEDIA_RADIO_SUPPORT
 
 config MEDIA_SDR_SUPPORT
 	bool "Software defined radio"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable software defined radio support.
 
@@ -71,6 +93,7 @@ config MEDIA_SDR_SUPPORT
 
 config MEDIA_CEC_SUPPORT
 	bool "HDMI CEC"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable support for HDMI CEC (Consumer Electronics Control),
 	  which is an optional HDMI feature.
@@ -80,6 +103,7 @@ config MEDIA_CEC_SUPPORT
 
 config MEDIA_PLATFORM_SUPPORT
 	bool "Platform-specific devices"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Enable support for complex cameras, codecs, and other hardware
 	  that are integrated at the CPU, GPU or on Image Signalling Processor
@@ -92,6 +116,7 @@ config MEDIA_PLATFORM_SUPPORT
 
 config MEDIA_TEST_SUPPORT
 	bool "Test drivers"
+	default y if !MEDIA_SUPPORT_FILTER
 	help
 	  Those drivers should not be used on production Kernels, but
 	  can be useful on debug ones. It enables several dummy drivers
@@ -103,9 +128,7 @@ config MEDIA_TEST_SUPPORT
 
 	  In case of doubts, say N.
 	  Say Y when you have a software defined radio device.
-endmenu # Types of devices to be supported
-
-if MEDIA_SUPPORT
+endmenu # media device types
 
 comment "Multimedia core features"
 
-- 
2.25.1

