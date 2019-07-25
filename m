Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 724847482E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 09:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388117AbfGYHa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 03:30:27 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50673 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387738AbfGYHa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 03:30:26 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id 1MbBUc-1iNg1v2Yrw-00bcBb
 for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 09:30:23 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: staging: davinci: remove vpfe driver
Date:   Thu, 25 Jul 2019 09:30:23 +0200
Message-Id: <20190725073023.2573613-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QU+JGLUCt1hSDR5Y8DMZatbETc4BtCeMwKInP/5pu5R9EQNlfp+
 1/on18MupxjdB1HZmafn+gHFif136Q7mBf7RMHBD9l+W8Dwq7vTWgVeuqaHqgs0GRFNGsud
 LkAivewl3eOuvEw5H9XyyO8GGtPxJEd3TzFoE2jgRgaGIAmMAHfamn29jimPanfm0Z6pfgg
 RPk/Il8Y6Wkky3G9NQs6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tbmc9JMeiIg=:RhwDc3uTBacG6L05MN5wOg
 JgZvj4PuZl8RKtGT0xEFBWiGTYlOx+A3bfoBnOPAd0gxW6Bh/evrHsQSynVpDR/g0aVgfqJ+F
 1QKyzQluw4ro/hg9FEmIS8S+PwpwPGhzjt+yT6+95T0MG+S9FU2l9T5wH1hWgnjgJmQgRVNqo
 I6xpcLcDq20az3h7W24KMYoqlciEzt9KdayyxIfa1gCUf3Npuadvz44e6TdLjspeIA7XhpQlf
 +UUCD1VhPKTT8PeoWDB885GGlzmM34v71CIhRYI5uelxo6zWKdwkapvfQW2+T6X+eWBuBuYB5
 t/sdnoNbZ1GHd+ykaRZRGz+CdcTRuDT9qhEhmC0RuqgulsPf9l6/CnRulv3tk3PID5hNbnaTb
 n+3GKVnwJoAxTm9syOVSbq0/Nr90oJyrTGezI0XM5GtcjWfiBOiivS6IC66p/K2G2atwXELvR
 g4Bt83Ghf5md07/A3cQXPsSwd5sueI/7rafhGL3uzHn5OFQFJqZ9ChEzS/Yb+JRddciui4J4J
 6XdlTimzoehX8Rpawd1UNoAMAJqf01zsdheMtYyxddbJJv8VNZXQh6Xbajr07S4o2nCHGGd6A
 0m6VgQWdLZZv2qJvbNFFzq95A/INwMgFJ7JdYmB4x9nMJpxf4DVHfN6J3WgbOJjiUH++tjwsV
 xfY2DbwAAsEvkfn6KKTtpk6pa4Wi2FyfcKEjhpcovpuZHDNeJNOK5AYPc8Ae8a9OUSePYDZvf
 eOkRJloRFjL25hUEhfpBvax7YDvbzMAQPR5lqQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The davinci_vpfe driver was merged into staging back in 2012 by Manjunath
Hadli from TI, with a long TODO list.

For all I can tell, since then it has only seen fixes for compile-time
issues and global cleanups, but nobody has actually worked on the items
on the TODO list.

To make things worse, the driver in its current form is incompatible with
the platform code in arch/arm/mach-davinci, i.e. the driver expects to
get its platform_data passed to the device as a 'struct vpfe_config',
but uses a differnet definition for that structure compared to what the
platform uses.

Finally, there is another driver for the same device in
drivers/media/platform/davinci/vpfe_capture.c. From all I can tell, the
staging version was originally a copy of a more featureful driver in TI's
downstream kernels. However, that kernel no longer supports dm365 after
linux-2.6.37, and the mainline version moved in a different direction.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
resending once more with 'git format-patch -D' to get below the size
limit for linux-media

 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/davinci_vpfe/Kconfig    |   13 -
 drivers/staging/media/davinci_vpfe/Makefile   |   11 -
 drivers/staging/media/davinci_vpfe/TODO       |   38 -
 .../media/davinci_vpfe/davinci-vpfe-mc.txt    |  154 --
 .../media/davinci_vpfe/davinci_vpfe_user.h    | 1287 ----------
 .../staging/media/davinci_vpfe/dm365_ipipe.c  | 1852 ---------------
 .../staging/media/davinci_vpfe/dm365_ipipe.h  |  174 --
 .../media/davinci_vpfe/dm365_ipipe_hw.c       | 1038 --------
 .../media/davinci_vpfe/dm365_ipipe_hw.h       |  556 -----
 .../media/davinci_vpfe/dm365_ipipeif.c        | 1070 ---------
 .../media/davinci_vpfe/dm365_ipipeif.h        |  228 --
 .../media/davinci_vpfe/dm365_ipipeif_user.h   |   90 -
 .../staging/media/davinci_vpfe/dm365_isif.c   | 2097 -----------------
 .../staging/media/davinci_vpfe/dm365_isif.h   |  200 --
 .../media/davinci_vpfe/dm365_isif_regs.h      |  291 ---
 .../media/davinci_vpfe/dm365_resizer.c        | 1995 ----------------
 .../media/davinci_vpfe/dm365_resizer.h        |  241 --
 drivers/staging/media/davinci_vpfe/vpfe.h     |   83 -
 .../media/davinci_vpfe/vpfe_mc_capture.c      |  716 ------
 .../media/davinci_vpfe/vpfe_mc_capture.h      |   90 -
 .../staging/media/davinci_vpfe/vpfe_video.c   | 1646 -------------
 .../staging/media/davinci_vpfe/vpfe_video.h   |  150 --
 24 files changed, 14023 deletions(-)
 delete mode 100644 drivers/staging/media/davinci_vpfe/Kconfig
 delete mode 100644 drivers/staging/media/davinci_vpfe/Makefile
 delete mode 100644 drivers/staging/media/davinci_vpfe/TODO
 delete mode 100644 drivers/staging/media/davinci_vpfe/davinci-vpfe-mc.txt
 delete mode 100644 drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif_user.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif_regs.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_resizer.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_resizer.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_video.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_video.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 534d85d6c5e3..b1bfc51131de 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -24,8 +24,6 @@ source "drivers/staging/media/allegro-dvt/Kconfig"
 
 source "drivers/staging/media/bcm2048/Kconfig"
 
-source "drivers/staging/media/davinci_vpfe/Kconfig"
-
 source "drivers/staging/media/hantro/Kconfig"
 
 source "drivers/staging/media/imx/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index c486298194da..b93c5819549f 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -2,7 +2,6 @@
 obj-$(CONFIG_VIDEO_ALLEGRO_DVT)	+= allegro-dvt/
 obj-$(CONFIG_I2C_BCM2048)	+= bcm2048/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
-obj-$(CONFIG_VIDEO_DM365_VPFE)	+= davinci_vpfe/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
diff --git a/drivers/staging/media/davinci_vpfe/Kconfig b/drivers/staging/media/davinci_vpfe/Kconfig
deleted file mode 100644
index 94bf6746c03f..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/Makefile b/drivers/staging/media/davinci_vpfe/Makefile
deleted file mode 100644
index 0ae8c5014f74..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/TODO b/drivers/staging/media/davinci_vpfe/TODO
deleted file mode 100644
index cc8bd9306f2a..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/davinci-vpfe-mc.txt b/drivers/staging/media/davinci_vpfe/davinci-vpfe-mc.txt
deleted file mode 100644
index a1e91778aa9b..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h b/drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h
deleted file mode 100644
index 8d772029c91d..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
deleted file mode 100644
index 52397ad0e3e2..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.h b/drivers/staging/media/davinci_vpfe/dm365_ipipe.h
deleted file mode 100644
index 866ae12aeb07..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
deleted file mode 100644
index 110473c30577..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
deleted file mode 100644
index 16b6a14b7058..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c b/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
deleted file mode 100644
index 51d4cd1bdb97..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.h b/drivers/staging/media/davinci_vpfe/dm365_ipipeif.h
deleted file mode 100644
index 4d126fc871f3..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipeif_user.h b/drivers/staging/media/davinci_vpfe/dm365_ipipeif_user.h
deleted file mode 100644
index 046dbdec67d8..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
deleted file mode 100644
index 05a997f7aa5d..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.h b/drivers/staging/media/davinci_vpfe/dm365_isif.h
deleted file mode 100644
index 0e1fe472fb2b..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif_regs.h b/drivers/staging/media/davinci_vpfe/dm365_isif_regs.h
deleted file mode 100644
index 6695680817b9..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_resizer.c b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
deleted file mode 100644
index 7adf1fae43f6..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/dm365_resizer.h b/drivers/staging/media/davinci_vpfe/dm365_resizer.h
deleted file mode 100644
index 5e31de96b2c9..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/vpfe.h b/drivers/staging/media/davinci_vpfe/vpfe.h
deleted file mode 100644
index 1f8e011fc162..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/vpfe_mc_capture.c b/drivers/staging/media/davinci_vpfe/vpfe_mc_capture.c
deleted file mode 100644
index 9dc28ffe38d5..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/vpfe_mc_capture.h b/drivers/staging/media/davinci_vpfe/vpfe_mc_capture.h
deleted file mode 100644
index fe4a421b5dba..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c b/drivers/staging/media/davinci_vpfe/vpfe_video.c
deleted file mode 100644
index ab6bc452d9f6..000000000000
diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.h b/drivers/staging/media/davinci_vpfe/vpfe_video.h
deleted file mode 100644
index 5d01c4883ab4..000000000000
-- 
2.20.0

