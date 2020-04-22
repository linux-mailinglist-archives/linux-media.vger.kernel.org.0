Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10B31B4EA3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 22:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDVU4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 16:56:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgDVU4Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 16:56:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B54F721473;
        Wed, 22 Apr 2020 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587588975;
        bh=o6eph75UOaFJRiceBp+FaifsGkhh9mRQ8rJI+2Yrp1o=;
        h=From:To:Cc:Subject:Date:From;
        b=Y21EXQyT9O1NawslF3EYuCs/wsM2x54xd/YpjFXmH+jtgoVH6rquZEGk75Jc9t9HZ
         AxPVoBVOgXXceHqA/yC9BeW6AurCRagVMiqq94TmDi4ot+ZPaRg2aK8hQHEsw4meZi
         n8On4VtmqYDr7PKXBK8NPNJkVPVClS98vrfaTHXE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jRMPl-00ENMS-H4; Wed, 22 Apr 2020 22:56:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stefan Agner <stefan@agner.ch>
Subject: [PATCH] media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies
Date:   Wed, 22 Apr 2020 22:56:08 +0200
Message-Id: <02b11864f5d4b2ae6de47ea41ed25c3dd0a25cf0.1587588963.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are three tuners that depend on some functions inside
V4L2 core:

	$ git grep -l -E 'v4l2_[0-9a-zA-Z_]+\(' drivers/media/tuners/
	drivers/media/tuners/e4000.c
	drivers/media/tuners/fc2580.c
	drivers/media/tuners/msi001.c

Make them dependent of VIDEO_V4L2, as otherwise, this would happen:

	on x86_64:
	CONFIG_VIDEO_V4L2=m
	CONFIG_MEDIA_TUNER_E4000=y

	ld: drivers/media/tuners/e4000.o: in function `e4000_remove':
	e4000.c:(.text+0x34): undefined reference to `v4l2_ctrl_handler_free'
	ld: drivers/media/tuners/e4000.o: in function `e4000_probe':
	e4000.c:(.text+0x16c1): undefined reference to `v4l2_ctrl_handler_init_class'
	ld: e4000.c:(.text+0x16eb): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x1731): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x1762): undefined reference to `v4l2_ctrl_auto_cluster'
	ld: e4000.c:(.text+0x178c): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x17d6): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x1804): undefined reference to `v4l2_ctrl_auto_cluster'
	ld: e4000.c:(.text+0x182e): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x1878): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x18a6): undefined reference to `v4l2_ctrl_auto_cluster'
	ld: e4000.c:(.text+0x18d0): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x191a): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x1948): undefined reference to `v4l2_ctrl_auto_cluster'
	ld: e4000.c:(.text+0x1972): undefined reference to `v4l2_ctrl_new_std'
	ld: e4000.c:(.text+0x19a6): undefined reference to `v4l2_ctrl_handler_free'
	ld: e4000.c:(.text+0x1a2a): undefined reference to `v4l2_i2c_subdev_init'

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/tuners/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index 2368b0e230e5..4605bb377574 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -223,7 +223,7 @@ config MEDIA_TUNER_TDA18212
 
 config MEDIA_TUNER_E4000
 	tristate "Elonics E4000 silicon tuner"
-	depends on MEDIA_SUPPORT && I2C
+	depends on MEDIA_SUPPORT && I2C && VIDEO_V4L2
 	select REGMAP_I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -231,7 +231,7 @@ config MEDIA_TUNER_E4000
 
 config MEDIA_TUNER_FC2580
 	tristate "FCI FC2580 silicon tuner"
-	depends on MEDIA_SUPPORT && I2C
+	depends on MEDIA_SUPPORT && I2C && VIDEO_V4L2
 	select REGMAP_I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
-- 
2.25.2

