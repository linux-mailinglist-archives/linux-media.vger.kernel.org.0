Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527963F0624
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239927AbhHROPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239947AbhHROOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:14:48 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CFAC06114E
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:24 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id mq3so2659190pjb.5
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nKNE8ijfWlx9GrUceWKtzIYzjYKV/yPuSFqRxghOMMg=;
        b=NEvL23y8xxuShE6xYlVqlSlYlNJkbLv4ksR82pPD/BFjcEOgr1KPG/pgd/sHDnWAyv
         IAuAPk55Rz9W3uuq+slW6OuC3xb6wlasV69ZbQPXscISqwRiObAGL9yKTOWnVL6l0okV
         0ty5PPJCo0kFkeQ0dr5Gr4G5qHaRgH5K38E07HN++4awJWDMVNceVn1I8alB/cnGpYyX
         bKN1hr1tzatQu8zBoV1qATpGOEqP+XoO4m8YyfxPF7uNdiKv7gkegTjeRqEJXKoVitTV
         LcONwyhI9t2r9R9Uw006GuZIhZHBK6mLdwD75ECF1tajWIZ6abzzBFsvKpO/wY8JRrRU
         6FiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nKNE8ijfWlx9GrUceWKtzIYzjYKV/yPuSFqRxghOMMg=;
        b=h5ukxDL1jxP0QB4mTw13oq1OjDbCe28/Hjn6lNN7mciM7/VDUZVEq+li+P+FNkW44V
         HNr1QSA5KZp2//WTMYrPfjUYwj5UXcBb/JWLwYVmE86Zm74ppq6E8koRG3hrehgjZSyL
         uhklubxHXOYJsKFcpcUzfpP0OJRxNmsGQE9N/hALJR5Yewcv6uDqFiRjms7gU0H1QClc
         1yh0tYTprkcpUGIwSudpsbVCfxb5dtDycGfdq1RioU2Qpe4z8Z402dVXO9KPoed9Igy2
         koI8/LDbne8PzsE4qow6ONdcjKpXdB7XrFBOyu0tD5Nxn0PICm4KEty06HcckYIR0H2w
         vAGg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM532nCb5SjQghPLp1UdEzMXqxtPQ/jUw/ytHKFAlgjM/5Qu8zJTAK
        CduOcVekTjCsU1nF8T5RlwLQ7mphhEpQV2WBgtR6Yjr+yCLHn5BsHhwmuY32vMKKNxgvD6xr0AO
        uqmFutHmqEIvfS7mx
X-Google-Smtp-Source: ABdhPJwE/dxPHNT6cwoDOXFR0Uxlw/pitQ720uZu9vDu5TLWOQ/TIH6eOlhLD6V6dh+JWfEL7pUgAQ==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id q39mr9369479pjq.219.1629296003962;
        Wed, 18 Aug 2021 07:13:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:13:23 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 27/30] media: platform: vxd: Kconfig: Add Video decoder Kconfig and Makefile
Date:   Wed, 18 Aug 2021 19:40:34 +0530
Message-Id: <20210818141037.19990-28-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

Add video decoder basic config to Kconfig and
select the required V4l2 modules.
Add video decoder Makefile.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                |   2 +
 drivers/staging/media/vxd/decoder/Kconfig  |  13 +++
 drivers/staging/media/vxd/decoder/Makefile | 129 +++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/staging/media/vxd/decoder/Kconfig
 create mode 100644 drivers/staging/media/vxd/decoder/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index b5875f9015ba..0616ab620135 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19568,6 +19568,8 @@ F:	drivers/staging/media/vxd/common/talmmu_api.c
 F:	drivers/staging/media/vxd/common/talmmu_api.h
 F:	drivers/staging/media/vxd/common/work_queue.c
 F:	drivers/staging/media/vxd/common/work_queue.h
+F:	drivers/staging/media/vxd/decoder/Kconfig
+F:	drivers/staging/media/vxd/decoder/Makefile
 F:	drivers/staging/media/vxd/decoder/bspp.c
 F:	drivers/staging/media/vxd/decoder/bspp.h
 F:	drivers/staging/media/vxd/decoder/bspp_int.h
diff --git a/drivers/staging/media/vxd/decoder/Kconfig b/drivers/staging/media/vxd/decoder/Kconfig
new file mode 100644
index 000000000000..5ee44cc07dd8
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_IMG_VXD_DEC
+	tristate "IMG VXD DEC (Video Decoder) driver"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_DMA_SG
+	select V4L2_MEM2MEM_DEV
+	help
+	  This is an IMG VXD DEC V4L2 driver that adds support for the
+	  Imagination D5520 (Video Decoder) hardware.
+	  The module name when built is vxd-dec.
diff --git a/drivers/staging/media/vxd/decoder/Makefile b/drivers/staging/media/vxd/decoder/Makefile
new file mode 100644
index 000000000000..80e46a7da1ab
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/Makefile
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Optional Video feature configuration control
+
+# (1)
+# This config allows enabling or disabling of HEVC/H265 video
+# decoding functionality with IMG VXD Video decoder. If you
+# do not want HEVC decode capability, select N.
+# If unsure, select Y
+HAS_HEVC ?=y
+
+# (2)
+# This config enables error concealment with gray pattern.
+# Disable if you do not want error concealment capability.
+# If unsure, say Y
+ERROR_CONCEALMENT ?=y
+
+# (3)
+# This config, if enabled, configures H264 video decoder to
+# output frames in the decode order with no buffering and
+# picture reordering inside codec.
+# If unsure, say N
+REDUCED_DPB_NO_PIC_REORDERING ?=n
+
+# (4)
+# This config, if enabled, enables all the debug traces in
+# decoder driver. Enable it only for debug purpose
+# Keep it always disabled for release codebase
+DEBUG_DECODER_DRIVER ?=n
+
+# (5)
+# This config allows enabling or disabling of MJPEG video
+# decoding functionality with IMG VXD Video decoder. If you
+# do not want MJPEG decode capability, select N.
+# If unsure, select Y
+HAS_JPEG ?=y
+
+# (6)
+# This config allows simulation of Error recovery.
+# This config is only for testing, never enable it for release build.
+ERROR_RECOVERY_SIMULATION ?=n
+
+# (7)
+# This config enables allocation of capture buffers from
+# dma contiguous memory.
+# If unsure, say Y
+CAPTURE_CONTIG_ALLOC ?=y
+
+#VXD
+vxd-dec-y += vxd_core.o
+
+#PVDEC
+vxd-dec-y += vxd_pvdec.o
+
+#MEM_MGR
+vxd-dec-y += ../common/img_mem_man.o ../common/img_mem_unified.o
+vxd-dec-y += ../common/imgmmu.o
+
+#Utilities
+vxd-dec-y += ../common/lst.o ../common/dq.o
+vxd-dec-y += ../common/resource.o
+vxd-dec-y += dec_resources.o
+vxd-dec-y += ../common/rman_api.o
+vxd-dec-y += pixel_api.o
+vxd-dec-y += vdecdd_utils_buf.o
+vxd-dec-y += vdecdd_utils.o
+
+#MMU
+vxd-dec-y += ../common/talmmu_api.o
+vxd-dec-y += ../common/pool.o
+vxd-dec-y += ../common/hash.o
+vxd-dec-y += ../common/ra.o
+vxd-dec-y += ../common/addr_alloc.o
+vxd-dec-y += ../common/work_queue.o
+vxd-dec-y += vdec_mmu_wrapper.o
+
+#DECODER
+vxd-dec-y += ../common/pool_api.o ../common/idgen_api.o
+vxd-dec-y += hw_control.o
+vxd-dec-y += vxd_int.o
+vxd-dec-y += translation_api.o
+vxd-dec-y += decoder.o
+vxd-dec-y += core.o
+
+#BSPP
+vxd-dec-y += swsr.o
+vxd-dec-y += h264_secure_parser.o
+vxd-dec-y += bspp.o
+
+#UM INTERFACE & SYSDEV
+vxd-dec-y += vxd_dec.o
+
+vxd-dec-y += vxd_v4l2.o
+
+ifeq ($(DEBUG_DECODER_DRIVER), y)
+ccflags-y   += -DDEBUG_DECODER_DRIVER
+ccflags-y   += -DDEBUG
+endif
+
+ifeq ($(HAS_HEVC),y)
+ccflags-y   += -DHAS_HEVC
+vxd-dec-y += hevc_secure_parser.o
+endif
+
+ifeq ($(HAS_JPEG),y)
+ccflags-y   += -DHAS_JPEG
+vxd-dec-y += jpeg_secure_parser.o
+endif
+
+
+ifeq ($(ERROR_CONCEALMENT),y)
+ccflags-y   += -DERROR_CONCEALMENT
+endif
+
+ifeq ($(REDUCED_DPB_NO_PIC_REORDERING),y)
+ccflags-y   += -DREDUCED_DPB_NO_PIC_REORDERING
+endif
+
+ifeq ($(ERROR_RECOVERY_SIMULATION),y)
+ccflags-y   += -DERROR_RECOVERY_SIMULATION
+endif
+
+ifeq ($(CAPTURE_CONTIG_ALLOC),y)
+ccflags-y += -DCAPTURE_CONTIG_ALLOC
+endif
+
+obj-$(CONFIG_VIDEO_IMG_VXD_DEC) += vxd-dec.o
+
+ccflags-y += -I$(srctree)/drivers/staging/media/vxd/common
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
