Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064BB199507
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbgCaLMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730631AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E21C21D80;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=xbGgqzx6a1TZbgIEHC0Dp1LOeRQ5xVEkHRRNAfTGXMk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NaGTvpZCiDPzlHM/JxY9DoK85nnTN9NW4cRT7eBGWv4cxhEl18HHKdjT8OMUDp69F
         jX4u+ydoOFGZc5F/IaS//LPeUme1TS1dyPk5GfpnoyRyy6cF6RLF8BDnXykgHhVh0Y
         /t5JOYrBT/ILKz49tLt0a2rb7fQtnGa0lclv/6n8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bry-Sr; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 27/33] media: Kconfig: move media controller core select to main Kconfig
Date:   Tue, 31 Mar 2020 13:12:03 +0200
Message-Id: <03284418f076a78b47f6cf3d7bbf2970f98b4f6f.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's place the main API selections at the media/Kconfig file,
as this way we can better organize things.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig    | 9 +++++++++
 drivers/media/mc/Kconfig | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index f14b583c9ee1..9c1de28ef070 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -136,6 +136,15 @@ config VIDEO_DEV
 	prompt "Video4Linux core" if !(MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI)
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_TEST_SUPPORT || MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
 
+config MEDIA_CONTROLLER
+	bool "Media Controller API"
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_PLATFORM_SUPPORT
+	help
+	  Enable the media controller API used to query media devices internal
+	  topology and configure it dynamically.
+
+	  This API is mostly used by camera interfaces in embedded platforms.
+
 #
 # DVB Core
 #	Only enables if one of DTV is selected
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index e740ace54d7f..002a918c4c75 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -5,15 +5,6 @@
 #	Selectable only for webcam/grabbers, as other drivers don't use it
 #
 
-config MEDIA_CONTROLLER
-	bool "Media Controller API"
-	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_PLATFORM_SUPPORT
-	help
-	  Enable the media controller API used to query media devices internal
-	  topology and configure it dynamically.
-
-	  This API is mostly used by camera interfaces in embedded platforms.
-
 config MEDIA_CONTROLLER_DVB
 	bool "Enable Media controller for DVB (EXPERIMENTAL)"
 	depends on MEDIA_CONTROLLER && DVB_CORE
-- 
2.25.1

