Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BA541126D
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 11:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbhITKAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 06:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235146AbhITKAA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 06:00:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CCC160FC0;
        Mon, 20 Sep 2021 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632131914;
        bh=xGTDUY6etx4mvWGTyYfaqkyCJe8IjP1eL1OrpZKEXZY=;
        h=From:To:Cc:Subject:Date:From;
        b=kfnTcImb8uyt9guvJHsThKvSkTnjlgwd8wBedX7rKyuvSAv1QAWMEm1tXgbVz8sGD
         2wR5nNDegLZaDiorsUUJ4RiSU8YZ3cgTi8F/axZU6LcPQfxO/umq619tAkNexN7+U6
         HkEotJL9JrVEjaX4/2c6VKAPwbTh7UkkYmL9pQyKK7HH9stgnSLgyLBp7lTNl5SB5J
         rsjywGKeeM/sRHV1MSx2sN080GbyjPd0O7cm2tFsdqQ/dbMgyVEQYL9jIikOgpHbJ1
         Ykuny+u3kie+assaUPaBNOjEctKxSswORqwqpH/Vs4DyFDOsdfvXADvKsG6NB4YyyS
         hq/7cYK4EDLXQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: select V4L2_ASYNC where needed
Date:   Mon, 20 Sep 2021 11:58:24 +0200
Message-Id: <20210920095830.1259051-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

I came across a link failure from randconfig builds:

x86_64-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_remove':
ths8200.c:(.text+0x491): undefined reference to `v4l2_async_unregister_subdev'
x86_64-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_probe':
ths8200.c:(.text+0xe49): undefined reference to `v4l2_async_register_subdev'
x86_64-linux-ld: drivers/media/i2c/tw9910.o: in function `tw9910_remove':
tw9910.c:(.text+0x467): undefined reference to `v4l2_async_unregister_subdev'
x86_64-linux-ld: drivers/media/i2c/tw9910.o: in function `tw9910_probe':
tw9910.c:(.text+0x1123): undefined reference to `v4l2_async_register_subdev'

These clearly lack a 'select' statement, but I don't know why
this started happening only now. I had a bit of a look around to find
other configs that have the same problem, but could not come up with
a reliable way and found nothing else through experimentation.
It is likely that other symbols like these exist that need an extra
select.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 08feb3e8c1bf..d49eecc4fe33 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -450,6 +450,7 @@ config VIDEO_TW9906
 config VIDEO_TW9910
 	tristate "Techwell TW9910 video decoder"
 	depends on VIDEO_V4L2 && I2C
+	select V4L2_ASYNC
 	help
 	  Support for Techwell TW9910 NTSC/PAL/SECAM video decoder.
 
@@ -597,6 +598,7 @@ config VIDEO_AK881X
 config VIDEO_THS8200
 	tristate "Texas Instruments THS8200 video encoder"
 	depends on VIDEO_V4L2 && I2C
+	select V4L2_ASYNC
 	help
 	  Support for the Texas Instruments THS8200 video encoder.
 
-- 
2.29.2

