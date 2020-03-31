Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69EC0199504
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbgCaLMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:57946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730615AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77C2621775;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=XwS4ayLWGntmitgw3x/jeHYYNVZ8iTyIKaq58v4+O9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wrug+N3JhJIOclwYWKhoDM//v/i5TEiEnldj6+rz8gLoMX4YLXL1iTlB2eF8d818K
         t1nER+yMJbv1lNY4ZZNGhqOaLSEQW4dSvoB63hHoOhAjLmqST+hFTAXAAExf/98F6M
         iEWee0jneucFU+yLRNZ/5Yusxk+83VSZ4nWQYL5M=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brP-MD; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 20/33] media: Kconfig: reorganize the drivers menu options
Date:   Tue, 31 Mar 2020 13:11:56 +0200
Message-Id: <a2778b47c9e4b43f1abec8f52fd47ef625d086c2.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comments before some of the drivers support look
weird, because their Kconfig have their own "comment"
directive inside it. So, rearrange them to make it
look a little nicer for the ones with are not too
familiar with the media system.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 9c32616f863a..b1a6874acbcc 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -104,9 +104,7 @@ config MEDIA_TEST_SUPPORT
 
 	  In case of doubts, say N.
 
-source "drivers/media/cec/Kconfig"
-
-source "drivers/media/mc/Kconfig"
+comment "Multimedia core features"
 
 #
 # Video4Linux support
@@ -130,8 +128,6 @@ config VIDEO_V4L2_SUBDEV_API
 
 	  This API is mostly used by camera interfaces in embedded platforms.
 
-source "drivers/media/v4l2-core/Kconfig"
-
 #
 # DVB Core
 #	Only enables if one of DTV is selected
@@ -174,7 +170,10 @@ config DVB_NET
 	  You may want to disable the network support on embedded devices. If
 	  unsure say Y.
 
+source "drivers/media/v4l2-core/Kconfig"
+source "drivers/media/mc/Kconfig"
 source "drivers/media/dvb-core/Kconfig"
+source "drivers/media/cec/Kconfig"
 
 comment "Media drivers"
 
@@ -182,6 +181,9 @@ source "drivers/media/usb/Kconfig"
 source "drivers/media/pci/Kconfig"
 source "drivers/media/radio/Kconfig"
 
+# Common driver options
+source "drivers/media/common/Kconfig"
+
 if MEDIA_PLATFORM_SUPPORT
 source "drivers/media/platform/Kconfig"
 source "drivers/media/test_drivers/Kconfig"
@@ -190,9 +192,6 @@ endif
 
 source "drivers/media/firewire/Kconfig"
 
-# Common driver options
-source "drivers/media/common/Kconfig"
-
 comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
 
 #
-- 
2.25.1

