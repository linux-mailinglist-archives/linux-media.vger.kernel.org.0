Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAA619131D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgCXO02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728144AbgCXO00 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAEAE2173E;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059985;
        bh=PIDxz4PON1tXTrgxL90qolW3m/5TZ0UEZSh0QEWn66Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NTjSvsQYlZ/4OMGLrODOVB2mRbA/T9UknCnJK5WLUK01rMo45Zd6tzOwv9ftzrBP4
         KlJ6lVWycjW0fCNOE0IwAvp6ShHWd1I+72T37BqP4uHEAI5/FK3JP85xfOE8QdpDd+
         vkNlP7lEZMJeh1Qgmq/CV9xV+WXdWDW/rNLb+Dqo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVc-00267N-0F; Tue, 24 Mar 2020 15:26:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 13/20] media: Kconfig: move V4L2 subdev API to v4l2-core/Kconfig
Date:   Tue, 24 Mar 2020 15:26:14 +0100
Message-Id: <0d4e432860f3f56e13d5dcda414f5f142831c04a.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
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
index 44aceb5e5b63..d6fb8411a8de 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -140,15 +140,6 @@ config VIDEO_DEV
 	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || V4L_PLATFORM_DRIVERS
 
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
2.24.1

