Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76D01A7BA7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 15:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502518AbgDNNDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 09:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2502515AbgDNNDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 09:03:43 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAB9C061A0C;
        Tue, 14 Apr 2020 06:03:42 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E67972A1860
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: Kconfig: Don't expose API options
Date:   Tue, 14 Apr 2020 10:02:10 -0300
Message-Id: <20200414130210.18970-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to expose API options; instead,
drivers that support a given API are expected to just select it.

Happily, this is currently the case, so simply stop
exposing the options.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/Kconfig           | 2 +-
 drivers/media/mc/Kconfig        | 3 +--
 drivers/media/v4l2-core/Kconfig | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a8def1591352..eef4c6761ffb 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -173,7 +173,7 @@ config VIDEO_DEV
 	  radio devices and by some input devices.
 
 config MEDIA_CONTROLLER
-	bool "Media Controller API"
+	bool
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_PLATFORM_SUPPORT
 	help
 	  Enable the media controller API used to query media devices internal
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 002a918c4c75..0cdf885ce24d 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -2,7 +2,6 @@
 
 #
 # Media controller
-#	Selectable only for webcam/grabbers, as other drivers don't use it
 #
 
 config MEDIA_CONTROLLER_DVB
@@ -14,7 +13,7 @@ config MEDIA_CONTROLLER_DVB
 	  This is currently experimental.
 
 config MEDIA_CONTROLLER_REQUEST_API
-	bool "Enable Media controller Request API (EXPERIMENTAL)"
+	bool
 	depends on MEDIA_CONTROLLER && STAGING_MEDIA
 	help
 	  DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 3fa75352d04c..d034185856bb 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -17,7 +17,7 @@ config VIDEO_V4L2_I2C
 	default y
 
 config VIDEO_V4L2_SUBDEV_API
-	bool "V4L2 sub-device userspace API"
+	bool
 	depends on VIDEO_DEV && MEDIA_CONTROLLER
 	help
 	  Enables the V4L2 sub-device pad-level userspace API used to configure
-- 
2.26.0.rc2

