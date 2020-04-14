Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6151A8E35
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 00:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436992AbgDNWGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 18:06:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48614 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729934AbgDNWGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 18:06:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 59D0D2A02F8
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: Kconfig: Don't expose the Request API option
Date:   Tue, 14 Apr 2020 19:06:24 -0300
Message-Id: <20200414220624.5396-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200414130210.18970-1-ezequiel@collabora.com>
References: <20200414130210.18970-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Request API isn't meant to be chosen by users,
but instead should be selected by drivers that want
to support it.

Hantro and Cedrus are already selecting the right options,
so only the test drivers need to be fixed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/mc/Kconfig                   | 6 ++++--
 drivers/media/test_drivers/Kconfig         | 2 ++
 drivers/media/test_drivers/vicodec/Kconfig | 2 ++
 drivers/media/test_drivers/vivid/Kconfig   | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 002a918c4c75..7c9628f37196 100644
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
@@ -24,3 +23,6 @@ config MEDIA_CONTROLLER_REQUEST_API
 
 	  There is currently no intention to provide API or ABI stability for
 	  this new API as of yet.
+
+comment "Please notice that the enabled Media controller Request API is EXPERIMENTAL"
+	depends on MEDIA_CONTROLLER_REQUEST_API
diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test_drivers/Kconfig
index 9f4a9cfbacc9..d62d974138e4 100644
--- a/drivers/media/test_drivers/Kconfig
+++ b/drivers/media/test_drivers/Kconfig
@@ -17,6 +17,8 @@ config VIDEO_VIM2M
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  This is a virtual test device for the memory-to-memory driver
 	  framework.
diff --git a/drivers/media/test_drivers/vicodec/Kconfig b/drivers/media/test_drivers/vicodec/Kconfig
index 89456665cb16..d77c67810c73 100644
--- a/drivers/media/test_drivers/vicodec/Kconfig
+++ b/drivers/media/test_drivers/vicodec/Kconfig
@@ -4,6 +4,8 @@ config VIDEO_VICODEC
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Driver for a Virtual Codec
 
diff --git a/drivers/media/test_drivers/vivid/Kconfig b/drivers/media/test_drivers/vivid/Kconfig
index e2ff06edfa93..c3abde2986b2 100644
--- a/drivers/media/test_drivers/vivid/Kconfig
+++ b/drivers/media/test_drivers/vivid/Kconfig
@@ -11,6 +11,8 @@ config VIDEO_VIVID
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEO_V4L2_TPG
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Enables a virtual video driver. This driver emulates a webcam,
 	  TV, S-Video and HDMI capture hardware, including VBI support for
-- 
2.26.0.rc2

