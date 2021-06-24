Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60E33B36EA
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 21:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbhFXTZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 15:25:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48124 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbhFXTZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 15:25:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJMh2l089450;
        Thu, 24 Jun 2021 14:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624562563;
        bh=pVOFEeZFA7vYQNY1cSs8WzQChlNhIdVwTzEBAtIu+8U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GlArYuz4t8uzd71UZPl057SyVpB5x1f+XflA86XwPbxA/iqciFjJQxukfEJOrZGSl
         WCaF2G4jFvY08j8pl283QDmkylAgfCkyLyWJN/keFSNdQzNLPAz92m97x02Gz1ZRxA
         zsRB76OK4t76OKYMjPZN27F9A6JqFswhkBR3yrVo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJMhMv028277
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jun 2021 14:22:43 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:22:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:22:43 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJM14O120548;
        Thu, 24 Jun 2021 14:22:37 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Benoit Parrot <bparrot@ti.com>, Bert Vermeulen <bert@biot.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qiushi Wu <wu000273@umn.edu>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Zou Wei <zou_wei@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH v3 08/11] media: Re-structure TI platform drivers
Date:   Fri, 25 Jun 2021 00:51:57 +0530
Message-ID: <20210624192200.22559-9-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624192200.22559-1-p.yadav@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ti-vpe/ sub-directory does not only contain the VPE-specific things.
It also contains the CAL driver, which is a completely different
subsystem. This is also not a good place to add new drivers for other TI
platforms since they will all get mixed up.

Separate the VPE and CAL parts into different sub-directories and rename
the ti-vpe/ sub-directory to ti/. This is now the place where new TI
platform drivers can be added.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

---
Compile tested only. There should be no functional change.

Changes in v3:
- Add Tomi's R-by.

Changes in v2:
- New in v2.

 MAINTAINERS                                              | 3 ++-
 drivers/media/platform/Makefile                          | 2 +-
 drivers/media/platform/ti/Makefile                       | 3 +++
 drivers/media/platform/ti/cal/Makefile                   | 3 +++
 drivers/media/platform/{ti-vpe => ti/cal}/cal-camerarx.c | 0
 drivers/media/platform/{ti-vpe => ti/cal}/cal-video.c    | 0
 drivers/media/platform/{ti-vpe => ti/cal}/cal.c          | 0
 drivers/media/platform/{ti-vpe => ti/cal}/cal.h          | 0
 drivers/media/platform/{ti-vpe => ti/cal}/cal_regs.h     | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/Makefile       | 4 ----
 drivers/media/platform/{ti-vpe => ti/vpe}/csc.c          | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/csc.h          | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/sc.c           | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/sc.h           | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h     | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c        | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h        | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h   | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c          | 0
 drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h     | 0
 20 files changed, 9 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/platform/ti/Makefile
 create mode 100644 drivers/media/platform/ti/cal/Makefile
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal-camerarx.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal-video.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal_regs.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/Makefile (78%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ae47618c857..5dad98f69683 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18584,7 +18584,8 @@ W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
-F:	drivers/media/platform/ti-vpe/
+F:	drivers/media/platform/ti/cal/
+F:	drivers/media/platform/ti/vpe/
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 73ce083c2fc6..26d15b377a79 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_VIDEO_PXA27x)	+= pxa_camera.o
 
 obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
 
-obj-y	+= ti-vpe/
+obj-y	+= ti/
 
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
 obj-$(CONFIG_VIDEO_CODA)		+= coda/
diff --git a/drivers/media/platform/ti/Makefile b/drivers/media/platform/ti/Makefile
new file mode 100644
index 000000000000..bbc737ccbbea
--- /dev/null
+++ b/drivers/media/platform/ti/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-y += cal/
+obj-y += vpe/
diff --git a/drivers/media/platform/ti/cal/Makefile b/drivers/media/platform/ti/cal/Makefile
new file mode 100644
index 000000000000..45ac35585f0b
--- /dev/null
+++ b/drivers/media/platform/ti/cal/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_TI_CAL) += ti-cal.o
+ti-cal-y := cal.o cal-camerarx.o cal-video.o
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/cal-camerarx.c
rename to drivers/media/platform/ti/cal/cal-camerarx.c
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/cal-video.c
rename to drivers/media/platform/ti/cal/cal-video.c
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti/cal/cal.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/cal.c
rename to drivers/media/platform/ti/cal/cal.c
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti/cal/cal.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/cal.h
rename to drivers/media/platform/ti/cal/cal.h
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti/cal/cal_regs.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/cal_regs.h
rename to drivers/media/platform/ti/cal/cal_regs.h
diff --git a/drivers/media/platform/ti-vpe/Makefile b/drivers/media/platform/ti/vpe/Makefile
similarity index 78%
rename from drivers/media/platform/ti-vpe/Makefile
rename to drivers/media/platform/ti/vpe/Makefile
index ad624056e039..3fadfe084f87 100644
--- a/drivers/media/platform/ti-vpe/Makefile
+++ b/drivers/media/platform/ti/vpe/Makefile
@@ -10,7 +10,3 @@ ti-sc-y := sc.o
 ti-csc-y := csc.o
 
 ccflags-$(CONFIG_VIDEO_TI_VPE_DEBUG) += -DDEBUG
-
-obj-$(CONFIG_VIDEO_TI_CAL) += ti-cal.o
-
-ti-cal-y := cal.o cal-camerarx.o cal-video.o
diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti/vpe/csc.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/csc.c
rename to drivers/media/platform/ti/vpe/csc.c
diff --git a/drivers/media/platform/ti-vpe/csc.h b/drivers/media/platform/ti/vpe/csc.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/csc.h
rename to drivers/media/platform/ti/vpe/csc.h
diff --git a/drivers/media/platform/ti-vpe/sc.c b/drivers/media/platform/ti/vpe/sc.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/sc.c
rename to drivers/media/platform/ti/vpe/sc.c
diff --git a/drivers/media/platform/ti-vpe/sc.h b/drivers/media/platform/ti/vpe/sc.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/sc.h
rename to drivers/media/platform/ti/vpe/sc.h
diff --git a/drivers/media/platform/ti-vpe/sc_coeff.h b/drivers/media/platform/ti/vpe/sc_coeff.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/sc_coeff.h
rename to drivers/media/platform/ti/vpe/sc_coeff.h
diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/vpdma.c
rename to drivers/media/platform/ti/vpe/vpdma.c
diff --git a/drivers/media/platform/ti-vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/vpdma.h
rename to drivers/media/platform/ti/vpe/vpdma.h
diff --git a/drivers/media/platform/ti-vpe/vpdma_priv.h b/drivers/media/platform/ti/vpe/vpdma_priv.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/vpdma_priv.h
rename to drivers/media/platform/ti/vpe/vpdma_priv.h
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
similarity index 100%
rename from drivers/media/platform/ti-vpe/vpe.c
rename to drivers/media/platform/ti/vpe/vpe.c
diff --git a/drivers/media/platform/ti-vpe/vpe_regs.h b/drivers/media/platform/ti/vpe/vpe_regs.h
similarity index 100%
rename from drivers/media/platform/ti-vpe/vpe_regs.h
rename to drivers/media/platform/ti/vpe/vpe_regs.h
-- 
2.30.0

