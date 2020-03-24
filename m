Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45662191315
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgCXO00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbgCXO0Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:25 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 507712080C;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059985;
        bh=PMZLvau6l0DTq6hZbaVXDrSebT6xY40VOvUd+dhMy3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KEfGxndlwReoMWinWpkgMISRaygsaKm0Q4pXckZY232Qw7a9aiyD8xWq1fdN02G12
         Q0vrbrTB/0QygkF2lrr1O+4VG8CtYAjhTNTYAz4sGMtQyRwPIGHDHGkBL/gKNjC7Y9
         VA/EhXz2L1GR+E9cxdtPmtoaDyOm3gA9qyXYLcfA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVb-00266T-HL; Tue, 24 Mar 2020 15:26:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 02/20] media: Kconfig: not all V4L2 platform drivers are for camera
Date:   Tue, 24 Mar 2020 15:26:03 +0100
Message-Id: <e39e656c49c05829f0cf9affd7918818351d09e6.1585059896.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the platform drivers got added, they were all part of
complex camera support. This is not the case anymore, as we
now have codecs and other stuff there too.

So, fix the dependencies, in order to not require users to
manually select something that it doesn't make sense.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig          | 3 +--
 drivers/media/platform/Kconfig | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 9dfea5c4b6ab..4af21fa73fcf 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -99,8 +99,7 @@ source "drivers/media/mc/Kconfig"
 config VIDEO_DEV
 	tristate
 	depends on MEDIA_SUPPORT
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
-	default y
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || V4L_PLATFORM_DRIVERS
 
 config VIDEO_V4L2_SUBDEV_API
 	bool "V4L2 sub-device userspace API"
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index e01bbb9dd1c1..34f40c2c8c45 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -5,7 +5,6 @@
 
 menuconfig V4L_PLATFORM_DRIVERS
 	bool "V4L platform devices"
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  Say Y here to enable support for platform-specific V4L drivers.
 
-- 
2.24.1

