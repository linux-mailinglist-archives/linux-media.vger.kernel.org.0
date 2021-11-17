Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8F44543A1
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbhKQJ2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:58824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235007AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F067463240;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141142;
        bh=/w8qGkF1hWlUq4AmjGfz1b+POlJBLcRk1dT4kXfEkWA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HeVTyRl/9TD1/YZEzIuvx9s6eo0jGY03GLUnipV7hTGS4XWAcBzicOyOedW1KwYlg
         U2MrAL1VGBlEb1KlfMpBOvW5qiVXzVuZ7lZaVLWh2e7IPih6xyOgUeCkgbozLHQN6z
         hoPr5HQqbRCuIiFTfqwjuXyL7cbqasy8QnKAWWRAZe20HQnNAD4MoszwzS4+NhKggp
         to94YNk6vCTbmLlIlc5UzaxhUQnpfh++Scyi0RvsSLcEme9qfEl1Rayo+mx/erIWVD
         rG59NTohBYjgRBk/XxbE3YTC0u/MAqlqehhhRsyyb0MeWMaU5CJVgozDuOO7oi5rof
         4Tx574Kcj6LyA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb5d-5x; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 01/13] media: atomisp: drop empty files
Date:   Wed, 17 Nov 2021 09:25:26 +0000
Message-Id: <45ad66591a7441277ee2660e1a6b5c10c7f09178.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
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
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

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

