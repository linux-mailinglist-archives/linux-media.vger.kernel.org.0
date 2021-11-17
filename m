Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97635454465
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235889AbhKQKAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:00:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:35336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235777AbhKQJ74 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B6FF63244;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=FlzFc38H5P5k+wgfCZPqP5HHSDs2AI+C0+PL/VqViVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=imJH/k/LCzVFirrAKGktmTgnHzCtE4x6JLc1XGq/MEwvK9kyck7Q5oSMKwo/W/m2D
         KSgNK3uVJYl6F7icnWA1PwiBK3omIc04Srs2tFJSu9um7L31ysz3Ugz9G/B1GSXPXB
         ssxTbtOVZPlykt4mYklVj8XxusFT7ENTYaepaQA97AuNG0qNRc77qcFSsTj58WoHUh
         HhbnJDCKftn0fholKpBl+r2UtVpN+vSeUL8cb7P2wd8uIKIfRGg49QAb7j2IHOSeWM
         b7lv75/GGni9I3FKTF8EZS201glovHAlstGcjTPNQrlqA4ax/EGnxp5oVdB2G3xj2w
         BPKyxSHWWlktw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUQ-4A; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 01/12] media: atomisp: drop empty files
Date:   Wed, 17 Nov 2021 09:56:43 +0000
Message-Id: <da8fdf490b954f04af6c254f51c29e4e305fc1b9.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's nothing inside such files. Just drop them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/Makefile          |  4 ----
 .../staging/media/atomisp/pci/sh_css_metadata.c | 17 -----------------
 .../staging/media/atomisp/pci/sh_css_morph.c    | 17 -----------------
 .../staging/media/atomisp/pci/sh_css_shading.c  | 17 -----------------
 .../staging/media/atomisp/pci/sh_css_stream.c   | 17 -----------------
 5 files changed, 72 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_metadata.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_morph.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_shading.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_stream.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index a7ad8cfab602..2485d7b3fee2 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -27,20 +27,16 @@ atomisp-objs += \
 	pci/sh_css_firmware.o \
 	pci/sh_css_host_data.o \
 	pci/sh_css_hrt.o \
-	pci/sh_css_metadata.o \
 	pci/sh_css_metrics.o \
 	pci/sh_css_mipi.o \
 	pci/sh_css_mmu.o \
-	pci/sh_css_morph.o \
 	pci/sh_css.o \
 	pci/sh_css_param_dvs.o \
 	pci/sh_css_param_shading.o \
 	pci/sh_css_params.o \
 	pci/sh_css_properties.o \
-	pci/sh_css_shading.o \
 	pci/sh_css_sp.o \
 	pci/sh_css_stream_format.o \
-	pci/sh_css_stream.o \
 	pci/sh_css_version.o \
 	pci/base/circbuf/src/circbuf.o \
 	pci/base/refcount/src/refcount.o \
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metadata.c b/drivers/staging/media/atomisp/pci/sh_css_metadata.c
deleted file mode 100644
index 04a4b7da85e2..000000000000
--- a/drivers/staging/media/atomisp/pci/sh_css_metadata.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-/* This file will contain the code to implement the functions declared in ia_css_metadata.h
-   and associated helper functions */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_morph.c b/drivers/staging/media/atomisp/pci/sh_css_morph.c
deleted file mode 100644
index edd1da941ccb..000000000000
--- a/drivers/staging/media/atomisp/pci/sh_css_morph.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-/* This file will contain the code to implement the functions declared in ia_css_morph.h
-   and associated helper functions */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_shading.c b/drivers/staging/media/atomisp/pci/sh_css_shading.c
deleted file mode 100644
index 462caf9cb571..000000000000
--- a/drivers/staging/media/atomisp/pci/sh_css_shading.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-/* This file will contain the code to implement the functions declared in ia_css_shading.h
-   and associated helper functions */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_stream.c b/drivers/staging/media/atomisp/pci/sh_css_stream.c
deleted file mode 100644
index a768ce90f51c..000000000000
--- a/drivers/staging/media/atomisp/pci/sh_css_stream.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-/* This file will contain the code to implement the functions declared in ia_css_stream.h
-   and associated helper functions */
-- 
2.33.1

