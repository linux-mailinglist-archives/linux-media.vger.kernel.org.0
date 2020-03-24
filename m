Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 959D2191321
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgCXO0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728218AbgCXO00 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D27EC217D8;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059986;
        bh=F8p/ub/kl1GPEtJH80f/2Zq9thwe8Qbz3WN8Z13xJRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AxOjn3XNSGCbQ/5vHpqlynBuiT+AX0D6DgKmvxEFTlpCdzN1YotNHrM7q6/C6bgVj
         iirDrMnBKNQc5o/1n+hPMwzMjIuNCOVjYLbLqT/+5/aqUG9ABrlYsm3/bG2do6ADyi
         FqlN7XTXcl81jPncM1NdMQh77dtlF+z89yvU1et4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVc-00267X-2g; Tue, 24 Mar 2020 15:26:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 15/20] media: Kconfig: move media controller core select to main Kconfig
Date:   Tue, 24 Mar 2020 15:26:16 +0100
Message-Id: <84ab3635bd37b47fc01197e1024bbb0287a1f264.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
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
index 54daeba339b7..86cf4f12a70d 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -140,6 +140,15 @@ config VIDEO_DEV
 	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || V4L_PLATFORM_DRIVERS
 
+config MEDIA_CONTROLLER
+	bool "Media Controller API"
+	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
+	help
+	  Enable the media controller API used to query media devices internal
+	  topology and configure it dynamically.
+
+	  This API is mostly used by camera interfaces in embedded platforms.
+
 source "drivers/media/v4l2-core/Kconfig"
 
 #
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 3b9795cfcb36..b3579d6c9e32 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -3,15 +3,6 @@
 #	Selectable only for webcam/grabbers, as other drivers don't use it
 #
 
-config MEDIA_CONTROLLER
-	bool "Media Controller API"
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
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
2.24.1

