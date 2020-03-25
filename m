Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478711924A4
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgCYJtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:51332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727459AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28E8A20B80;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=HopLG/jB0cZXKuvZ6uRd3D30VC2RRN0bKuinR9RKx+k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=14MGI57l2uu5z/sxoSK/ygljB68DKHBNEbQcFEegJ3/l3aZQ7ytpEXKk0xy1REW/d
         DfauknW0USOy5Y3gqEs33kUq2/OsrLRHuJiFTwlR87kdS34l2clDN9ppuZAgYJzBii
         SmhLZJMTYX0RZu6rs/JHxrBoVpOc8ULsM9y0KSMA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HU3-D1; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 13/22] media: Kconfig: move V4L2 subdev API to v4l2-core/Kconfig
Date:   Wed, 25 Mar 2020 10:49:27 +0100
Message-Id: <720696d8ab65766460e4ff6b012677d15df7bd95.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This option is part of V4L2 API extra functionality set.
Move it to be at the v4l2-core/Kconfig, where it belongs,
cleaning the main Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig           | 9 ---------
 drivers/media/v4l2-core/Kconfig | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a9fe9574a057..b056976ebdee 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -144,15 +144,6 @@ config VIDEO_DEV
 	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
 
-config VIDEO_V4L2_SUBDEV_API
-	bool "V4L2 sub-device userspace API"
-	depends on VIDEO_DEV && MEDIA_CONTROLLER
-	help
-	  Enables the V4L2 sub-device pad-level userspace API used to configure
-	  video format, size and frame rate between hardware blocks.
-
-	  This API is mostly used by camera interfaces in embedded platforms.
-
 source "drivers/media/v4l2-core/Kconfig"
 
 #
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 26276b257eae..33aa7fe571f8 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -16,6 +16,15 @@ config VIDEO_V4L2_I2C
 	depends on I2C && VIDEO_V4L2
 	default y
 
+config VIDEO_V4L2_SUBDEV_API
+	bool "V4L2 sub-device userspace API"
+	depends on VIDEO_DEV && MEDIA_CONTROLLER
+	help
+	  Enables the V4L2 sub-device pad-level userspace API used to configure
+	  video format, size and frame rate between hardware blocks.
+
+	  This API is mostly used by camera interfaces in embedded platforms.
+
 config VIDEO_ADV_DEBUG
 	bool "Enable advanced debug functionality on V4L2 drivers"
 	help
-- 
2.25.1

