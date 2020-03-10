Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38AB217FF20
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgCJNoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727280AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73417246AD;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=Wco8Lrt6IWo3LhWvojV2+XjOxrfkIusfjVYlvpSsUeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gIJJ/pizUq9t1HsweRGhncII2VfYDeQjW8zKo9gQGYreFl7/svIn87zakwUOJYE5S
         dgClc6KJzz2NU8AIiP5Qi+T3NMY8HhV+Yg3kffTDGILJDCYPcR9MFzcYGA5DaC+gsj
         xve/gXdeyF8SLGSr1vKKHYq6p+aCxkzvYJS1EeeU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wW-Hr; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>
Subject: [PATCH v2 17/22] media: docs: kAPI docs: move them to driver-api
Date:   Tue, 10 Mar 2020 14:43:08 +0100
Message-Id: <5bffe1ff2266f81062f37dde9c93f71ed17ae5fd.1583847557.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All those documents describe the media driver API. So, move
them to the right place within the Kernel documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{media/kapi => driver-api/media}/cec-core.rst    |  0
 .../{media/kapi => driver-api/media}/csi2.rst        |  0
 .../{media/kapi => driver-api/media}/dtv-ca.rst      |  0
 .../{media/kapi => driver-api/media}/dtv-common.rst  |  0
 .../{media/kapi => driver-api/media}/dtv-core.rst    |  0
 .../{media/kapi => driver-api/media}/dtv-demux.rst   |  0
 .../kapi => driver-api/media}/dtv-frontend.rst       |  0
 .../{media/kapi => driver-api/media}/dtv-net.rst     |  0
 .../media_kapi.rst => driver-api/media/index.rst}    | 12 ++++++------
 .../{media/kapi => driver-api/media}/mc-core.rst     |  0
 .../{media/kapi => driver-api/media}/rc-core.rst     |  0
 .../{media/kapi => driver-api/media}/v4l2-async.rst  |  0
 .../{media/kapi => driver-api/media}/v4l2-clocks.rst |  0
 .../{media/kapi => driver-api/media}/v4l2-common.rst |  0
 .../kapi => driver-api/media}/v4l2-controls.rst      |  0
 .../{media/kapi => driver-api/media}/v4l2-core.rst   |  0
 .../{media/kapi => driver-api/media}/v4l2-dev.rst    |  0
 .../{media/kapi => driver-api/media}/v4l2-device.rst |  0
 .../kapi => driver-api/media}/v4l2-dv-timings.rst    |  0
 .../{media/kapi => driver-api/media}/v4l2-event.rst  |  0
 .../{media/kapi => driver-api/media}/v4l2-fh.rst     |  0
 .../media}/v4l2-flash-led-class.rst                  |  0
 .../{media/kapi => driver-api/media}/v4l2-fwnode.rst |  0
 .../{media/kapi => driver-api/media}/v4l2-intro.rst  |  0
 .../{media/kapi => driver-api/media}/v4l2-mc.rst     |  0
 .../kapi => driver-api/media}/v4l2-mediabus.rst      |  0
 .../kapi => driver-api/media}/v4l2-mem2mem.rst       |  0
 .../{media/kapi => driver-api/media}/v4l2-rect.rst   |  0
 .../{media/kapi => driver-api/media}/v4l2-subdev.rst |  0
 .../{media/kapi => driver-api/media}/v4l2-tuner.rst  |  0
 .../kapi => driver-api/media}/v4l2-tveeprom.rst      |  0
 .../kapi => driver-api/media}/v4l2-videobuf.rst      |  0
 .../kapi => driver-api/media}/v4l2-videobuf2.rst     |  0
 Documentation/media/index.rst                        |  2 +-
 Documentation/media/v4l-drivers/max2175.rst          |  2 +-
 .../zh_CN/video4linux/v4l2-framework.txt             |  6 +++---
 MAINTAINERS                                          |  4 +++-
 37 files changed, 14 insertions(+), 12 deletions(-)
 rename Documentation/{media/kapi => driver-api/media}/cec-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/csi2.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-ca.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-common.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-demux.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-frontend.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-net.rst (100%)
 rename Documentation/{media/media_kapi.rst => driver-api/media/index.rst} (89%)
 rename Documentation/{media/kapi => driver-api/media}/mc-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/rc-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-async.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-clocks.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-common.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-controls.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-dev.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-device.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-dv-timings.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-event.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-fh.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-flash-led-class.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-fwnode.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-intro.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mc.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mediabus.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mem2mem.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-rect.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-subdev.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-tuner.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-tveeprom.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-videobuf.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-videobuf2.rst (100%)

diff --git a/Documentation/media/kapi/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
similarity index 100%
rename from Documentation/media/kapi/cec-core.rst
rename to Documentation/driver-api/media/cec-core.rst
diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/driver-api/media/csi2.rst
similarity index 100%
rename from Documentation/media/kapi/csi2.rst
rename to Documentation/driver-api/media/csi2.rst
diff --git a/Documentation/media/kapi/dtv-ca.rst b/Documentation/driver-api/media/dtv-ca.rst
similarity index 100%
rename from Documentation/media/kapi/dtv-ca.rst
rename to Documentation/driver-api/media/dtv-ca.rst
diff --git a/Documentation/media/kapi/dtv-common.rst b/Documentation/driver-api/media/dtv-common.rst
similarity index 100%
rename from Documentation/media/kapi/dtv-common.rst
rename to Documentation/driver-api/media/dtv-common.rst
diff --git a/Documentation/media/kapi/dtv-core.rst b/Documentation/driver-api/media/dtv-core.rst
similarity index 100%
rename from Documentation/media/kapi/dtv-core.rst
rename to Documentation/driver-api/media/dtv-core.rst
diff --git a/Documentation/media/kapi/dtv-demux.rst b/Documentation/driver-api/media/dtv-demux.rst
similarity index 100%
rename from Documentation/media/kapi/dtv-demux.rst
rename to Documentation/driver-api/media/dtv-demux.rst
diff --git a/Documentation/media/kapi/dtv-frontend.rst b/Documentation/driver-api/media/dtv-frontend.rst
similarity index 100%
rename from Documentation/media/kapi/dtv-frontend.rst
rename to Documentation/driver-api/media/dtv-frontend.rst
diff --git a/Documentation/media/kapi/dtv-net.rst b/Documentation/driver-api/media/dtv-net.rst
similarity index 100%
rename from Documentation/media/kapi/dtv-net.rst
rename to Documentation/driver-api/media/dtv-net.rst
diff --git a/Documentation/media/media_kapi.rst b/Documentation/driver-api/media/index.rst
similarity index 89%
rename from Documentation/media/media_kapi.rst
rename to Documentation/driver-api/media/index.rst
index 1389998c90f7..d2842f300bbd 100644
--- a/Documentation/media/media_kapi.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -30,9 +30,9 @@ For more details see the file COPYING in the source distribution of Linux.
     :maxdepth: 5
     :numbered:
 
-    kapi/v4l2-core
-    kapi/dtv-core
-    kapi/rc-core
-    kapi/mc-core
-    kapi/cec-core
-    kapi/csi2
+    v4l2-core
+    dtv-core
+    rc-core
+    mc-core
+    cec-core
+    csi2
diff --git a/Documentation/media/kapi/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
similarity index 100%
rename from Documentation/media/kapi/mc-core.rst
rename to Documentation/driver-api/media/mc-core.rst
diff --git a/Documentation/media/kapi/rc-core.rst b/Documentation/driver-api/media/rc-core.rst
similarity index 100%
rename from Documentation/media/kapi/rc-core.rst
rename to Documentation/driver-api/media/rc-core.rst
diff --git a/Documentation/media/kapi/v4l2-async.rst b/Documentation/driver-api/media/v4l2-async.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-async.rst
rename to Documentation/driver-api/media/v4l2-async.rst
diff --git a/Documentation/media/kapi/v4l2-clocks.rst b/Documentation/driver-api/media/v4l2-clocks.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-clocks.rst
rename to Documentation/driver-api/media/v4l2-clocks.rst
diff --git a/Documentation/media/kapi/v4l2-common.rst b/Documentation/driver-api/media/v4l2-common.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-common.rst
rename to Documentation/driver-api/media/v4l2-common.rst
diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-controls.rst
rename to Documentation/driver-api/media/v4l2-controls.rst
diff --git a/Documentation/media/kapi/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-core.rst
rename to Documentation/driver-api/media/v4l2-core.rst
diff --git a/Documentation/media/kapi/v4l2-dev.rst b/Documentation/driver-api/media/v4l2-dev.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-dev.rst
rename to Documentation/driver-api/media/v4l2-dev.rst
diff --git a/Documentation/media/kapi/v4l2-device.rst b/Documentation/driver-api/media/v4l2-device.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-device.rst
rename to Documentation/driver-api/media/v4l2-device.rst
diff --git a/Documentation/media/kapi/v4l2-dv-timings.rst b/Documentation/driver-api/media/v4l2-dv-timings.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-dv-timings.rst
rename to Documentation/driver-api/media/v4l2-dv-timings.rst
diff --git a/Documentation/media/kapi/v4l2-event.rst b/Documentation/driver-api/media/v4l2-event.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-event.rst
rename to Documentation/driver-api/media/v4l2-event.rst
diff --git a/Documentation/media/kapi/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-fh.rst
rename to Documentation/driver-api/media/v4l2-fh.rst
diff --git a/Documentation/media/kapi/v4l2-flash-led-class.rst b/Documentation/driver-api/media/v4l2-flash-led-class.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-flash-led-class.rst
rename to Documentation/driver-api/media/v4l2-flash-led-class.rst
diff --git a/Documentation/media/kapi/v4l2-fwnode.rst b/Documentation/driver-api/media/v4l2-fwnode.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-fwnode.rst
rename to Documentation/driver-api/media/v4l2-fwnode.rst
diff --git a/Documentation/media/kapi/v4l2-intro.rst b/Documentation/driver-api/media/v4l2-intro.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-intro.rst
rename to Documentation/driver-api/media/v4l2-intro.rst
diff --git a/Documentation/media/kapi/v4l2-mc.rst b/Documentation/driver-api/media/v4l2-mc.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-mc.rst
rename to Documentation/driver-api/media/v4l2-mc.rst
diff --git a/Documentation/media/kapi/v4l2-mediabus.rst b/Documentation/driver-api/media/v4l2-mediabus.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-mediabus.rst
rename to Documentation/driver-api/media/v4l2-mediabus.rst
diff --git a/Documentation/media/kapi/v4l2-mem2mem.rst b/Documentation/driver-api/media/v4l2-mem2mem.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-mem2mem.rst
rename to Documentation/driver-api/media/v4l2-mem2mem.rst
diff --git a/Documentation/media/kapi/v4l2-rect.rst b/Documentation/driver-api/media/v4l2-rect.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-rect.rst
rename to Documentation/driver-api/media/v4l2-rect.rst
diff --git a/Documentation/media/kapi/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-subdev.rst
rename to Documentation/driver-api/media/v4l2-subdev.rst
diff --git a/Documentation/media/kapi/v4l2-tuner.rst b/Documentation/driver-api/media/v4l2-tuner.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-tuner.rst
rename to Documentation/driver-api/media/v4l2-tuner.rst
diff --git a/Documentation/media/kapi/v4l2-tveeprom.rst b/Documentation/driver-api/media/v4l2-tveeprom.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-tveeprom.rst
rename to Documentation/driver-api/media/v4l2-tveeprom.rst
diff --git a/Documentation/media/kapi/v4l2-videobuf.rst b/Documentation/driver-api/media/v4l2-videobuf.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-videobuf.rst
rename to Documentation/driver-api/media/v4l2-videobuf.rst
diff --git a/Documentation/media/kapi/v4l2-videobuf2.rst b/Documentation/driver-api/media/v4l2-videobuf2.rst
similarity index 100%
rename from Documentation/media/kapi/v4l2-videobuf2.rst
rename to Documentation/driver-api/media/v4l2-videobuf2.rst
diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
index 8118c2d001ff..308f6a396d1c 100644
--- a/Documentation/media/index.rst
+++ b/Documentation/media/index.rst
@@ -13,7 +13,7 @@ Linux Media Subsystem Documentation
    :maxdepth: 2
 
    ../userspace-api/media/index
-   media_kapi
+   ../driver-api/media/index
    dvb-drivers/index
    v4l-drivers/index
    cec-drivers/index
diff --git a/Documentation/media/v4l-drivers/max2175.rst b/Documentation/media/v4l-drivers/max2175.rst
index a5e35059d98d..35d3c4b41fc7 100644
--- a/Documentation/media/v4l-drivers/max2175.rst
+++ b/Documentation/media/v4l-drivers/max2175.rst
@@ -9,7 +9,7 @@ The MAX2175 driver implements the following driver-specific controls:
 -------------------------------
     Enable/Disable I2S output of the tuner. This is a private control
     that can be accessed only using the subdev interface.
-    Refer to Documentation/media/kapi/v4l2-controls.rst for more details.
+    Refer to Documentation/driver-api/media/v4l2-controls.rst for more details.
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index 9c39ee58ea50..4d2af480a112 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/media/media_kapi.rst
+Chinese translated version of Documentation/driver-api/media/index.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -9,7 +9,7 @@ or if there is a problem with the translation.
 Maintainer: Mauro Carvalho Chehab <mchehab@kernel.org>
 Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
-Documentation/media/media_kapi.rst 的中文翻译
+Documentation/driver-api/media/index.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
@@ -777,7 +777,7 @@ v4l2 核心 API 提供了一个处理视频缓冲的标准方法(称为“videob
 线性 DMA(videobuf-dma-contig)以及大多用于 USB 设备的用 vmalloc
 分配的缓冲(videobuf-vmalloc)。
 
-请参阅 Documentation/media/kapi/v4l2-videobuf.rst，以获得更多关于 videobuf
+请参阅 Documentation/driver-api/media/v4l2-videobuf.rst，以获得更多关于 videobuf
 层的使用信息。
 
 v4l2_fh 结构体
diff --git a/MAINTAINERS b/MAINTAINERS
index 0ce0a1c93961..b5af1feb5ba1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3853,7 +3853,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	http://linuxtv.org
 S:	Supported
-F:	Documentation/media/kapi/cec-core.rst
+F:	Documentation/driver-api/media/cec-core.rst
 F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
 F:	drivers/media/rc/keymaps/rc-cec.c
@@ -5109,6 +5109,7 @@ X:	Documentation/devicetree/
 X:	Documentation/i2c/
 X:	Documentation/media/
 X:	Documentation/userspace-api/media/
+X:	Documentation/driver-api/media/
 X:	Documentation/power/
 X:	Documentation/spi/
 T:	git git://git.lwn.net/linux.git docs-next
@@ -10489,6 +10490,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/
 F:	Documentation/media/
 F:	Documentation/userspace-api/media/
+F:	Documentation/driver-api/media/
 F:	drivers/media/
 F:	drivers/staging/media/
 F:	include/linux/platform_data/media/
-- 
2.24.1

