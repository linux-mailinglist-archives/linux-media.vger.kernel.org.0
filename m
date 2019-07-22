Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718BC6FAFF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbfGVINI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:13:08 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34819 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfGVINH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:13:07 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MDy54-1hfXGl0sHk-009wlj; Mon, 22 Jul 2019 10:12:47 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mukesh Ojha <mojha@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ioannis Valasakis <code@wizofe.uk>,
        Arushi Singhal <arushisinghal19971997@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/davinci_vpfe: fix pinmux setup compilation
Date:   Mon, 22 Jul 2019 10:12:28 +0200
Message-Id: <20190722081243.2084226-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hlukYgWRgt4/3YVHFCw1Vmew2hCmJnG8RvD4P1hBcKoJOViX8q9
 oFlF/jBcClWveHnPZ2Zee+wn0w15iK9LcURzTVmH9Cv5iFpAZeFRjGTHyIN3TSyIVSlLouW
 cLm9pZxR2RspvgMhpvP9O82HTs6TzdW/he0JmH6O3dTp8m5xwyVrq2hyo05EQWUgMm3OM2a
 qx7SEApLChBFMO2aRGvFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mfkrykcANHw=:BCZhyRk2rSDGXAWBHPXmWJ
 uNuM0JtyKqKfmWwnKTI5qbgEp0IZJWa6Xejzi9V5wLzTVSPVu2hyfw8gFfs7wzNaBDwfjtcA8
 Ap0BBOIWZzQDqAWaIMQtIxOU9iKQW1bFMFHxVTs8BBxNbC9PH4FCCawMpW6Y3jonX5Hb7oD0T
 XJCu4+6ZMRwVpuDmXio1pa4BElsAu77mhkKPQPkOHz3luiSrVQGe1a2rTcQjZn5mAeU3nAVGb
 zmfirkh7wqcnlO7zhiFR7veIfFxhORu9FDWHN9q6zLu4avmFy3U6izido9DLOs1fF9yMCWmI1
 /IjB2OD68YuERsNeZ/DJ6p9SlaD9DiFkRi789Q0RBs0QtIbNZVFI1QBnrLRHx3Bpsz1ASNZ0Y
 OxQdjoqY+qBfw+5G2CymtRzSLptQMmJACmDpG9klzohH3TdUrk4m0Ge4Sqqon13eFt1ZvL5lT
 AVYrLWpY8G7idU7kq/oQk6nn5tREniXjIjjERvsaS5SFwGgkGPyhOOWJsu3J53M0da0WT0zHY
 XIVI3bdoAf9jMmVntVPLMszIJaEP+owVJRFOufThaGcTItOLxAny8K6vXagn6X9iKRetWsg2b
 Z5fwsxPPDWcF3Pw+35//6v4MSibsIiZ/N5yqyj0AqjPhN908vp0suvr0jvZt9LQiKqXLMmmLt
 wNn2mWyB4iaMJiJsGaCensjyVbS7nXoVnP7k/DjK9GYFoWRuiywIzJmyuVCut0uiG7TfHEJRk
 7VdBscaaKxP4qPEQSa0QRMaDd/5fSQGrXmJe4A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dm365_isif staging driver uses an odd method for configuring its
pin muxing by calling directly into low-level davinci platform specific
code, even when being compile-tested for other platforms.

As we want davinci to be part of a multi-platform kernel, this will
cause a build failure when those headers are no longer exported even
for davinci:

drivers/staging/media/davinci_vpfe/dm365_isif.c: In function 'vpfe_isif_init':
drivers/staging/media/davinci_vpfe/dm365_isif.c:2031:2: error: implicit declaration of function 'davinci_cfg_reg'; did you mean 'omap_cfg_reg'? [-Werror=implicit-function-declaration]
  davinci_cfg_reg(DM365_VIN_CAM_WEN);
  ^~~~~~~~~~~~~~~
  omap_cfg_reg
drivers/staging/media/davinci_vpfe/dm365_isif.c:2031:18: error: 'DM365_VIN_CAM_WEN' undeclared (first use in this function); did you mean 'DM365_ISIF_MAX_CLDC'?
  davinci_cfg_reg(DM365_VIN_CAM_WEN);
                  ^~~~~~~~~~~~~~~~~

Digging further, it seems that the platform data structures defined
in drivers/staging/media/davinci_vpfe/vpfe.h are an incompatible
version of the same structures in include/media/davinci/vpfe_capture.h,
which is the version that is used by the platform code, so the
combination that exists in the mainline kernel cannot be used.

The platform code already has an abstraction for the pinmux,
in the form of the dm365_isif_setup_pinmux() helper. If we want
to ever get to use the staging driver again, this needs to be
read from the platform data passed to this driver, or rewritten
to use the pinmux framework.

For the moment, pretend we pass the helper function in the
staging platform driver to get it to build cleanly. I could
not figure out how the staging driver relates to the code
in drivers/media/platform/davinci/, some clarification on that
would be helpful to decide what the long-term plan on this
should be to either remove the staging driver as obsolete or
integrate it with the rest in a way that actually works.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/davinci_vpfe/Makefile     | 5 -----
 drivers/staging/media/davinci_vpfe/dm365_isif.c | 8 +++-----
 drivers/staging/media/davinci_vpfe/dm365_isif.h | 2 --
 drivers/staging/media/davinci_vpfe/vpfe.h       | 2 ++
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/Makefile b/drivers/staging/media/davinci_vpfe/Makefile
index 0ae8c5014f74..3b93e0583940 100644
--- a/drivers/staging/media/davinci_vpfe/Makefile
+++ b/drivers/staging/media/davinci_vpfe/Makefile
@@ -4,8 +4,3 @@ obj-$(CONFIG_VIDEO_DM365_VPFE) += davinci-vfpe.o
 davinci-vfpe-objs := \
 	dm365_isif.o dm365_ipipe_hw.o dm365_ipipe.o \
 	dm365_resizer.o dm365_ipipeif.o vpfe_mc_capture.o vpfe_video.o
-
-# Allow building it with COMPILE_TEST on other archs
-ifndef CONFIG_ARCH_DAVINCI
-ccflags-y += -I $(srctree)/arch/arm/mach-davinci/include/
-endif
diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
index 05a997f7aa5d..5cfd52ea3ba7 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/delay.h>
+#include "vpfe.h"
 #include "dm365_isif.h"
 #include "vpfe_mc_capture.h"
 
@@ -1983,6 +1984,7 @@ int vpfe_isif_init(struct vpfe_isif_device *isif, struct platform_device *pdev)
 	struct v4l2_subdev *sd = &isif->subdev;
 	struct media_pad *pads = &isif->pads[0];
 	struct media_entity *me = &sd->entity;
+	struct vpfe_config *cfg = pdev->dev.platform_data;
 	static resource_size_t res_len;
 	struct resource *res;
 	void __iomem *addr;
@@ -2023,11 +2025,7 @@ int vpfe_isif_init(struct vpfe_isif_device *isif, struct platform_device *pdev)
 		}
 		i++;
 	}
-	davinci_cfg_reg(DM365_VIN_CAM_WEN);
-	davinci_cfg_reg(DM365_VIN_CAM_VD);
-	davinci_cfg_reg(DM365_VIN_CAM_HD);
-	davinci_cfg_reg(DM365_VIN_YIN4_7_EN);
-	davinci_cfg_reg(DM365_VIN_YIN0_3_EN);
+	cfg->isif_setup_pinmux();
 
 	/* queue ops */
 	isif->video_out.ops = &isif_video_ops;
diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.h b/drivers/staging/media/davinci_vpfe/dm365_isif.h
index 0e1fe472fb2b..82eeba9c24c2 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.h
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.h
@@ -21,8 +21,6 @@
 
 #include <linux/platform_device.h>
 
-#include <mach/mux.h>
-
 #include <media/davinci/vpfe_types.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
diff --git a/drivers/staging/media/davinci_vpfe/vpfe.h b/drivers/staging/media/davinci_vpfe/vpfe.h
index 1f8e011fc162..54ef6720ceeb 100644
--- a/drivers/staging/media/davinci_vpfe/vpfe.h
+++ b/drivers/staging/media/davinci_vpfe/vpfe.h
@@ -74,6 +74,8 @@ struct vpfe_config {
 	char *card_name;
 	/* setup function for the input path */
 	int (*setup_input)(enum vpfe_subdev_id id);
+	/* point to dm365_isif_setup_pinmux() */
+	void (*isif_setup_pinmux)(void);
 	/* number of clocks */
 	int num_clocks;
 	/* clocks used for vpfe capture */
-- 
2.20.0

