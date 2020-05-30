Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C3F1E8EAC
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgE3G4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728642AbgE3G4D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB28820810;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=payUHdblQ9WpxUJ095ppuUef0wMW0WnZ1KqZslhe2T8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dVEKqx2kBPqiAiDsCgLNHGLe9xkgBYOGX8ooUP3hruPutjLmvqoCDOVsiyuFQs8Jx
         BsXplm9GNeVRqVAztFa0gYK+9pTOWWtXr/oBzmEeHPq7WGKg+RKxIoBGpigJR14+31
         Xarlfqzuep+DcQM1ZlZlCXf7dmXiH/Dj7AtRWUo8=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hoW-O6; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 06/41] media: atomisp: get rid of unused memory_realloc code
Date:   Sat, 30 May 2020 08:55:23 +0200
Message-Id: <f9e6c4e27373d71ba95023f3bef8e9a91a820bff.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code for it is commented out, probably because it is
broken or uneeded for the driver to work. So, let's get
rid of it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |  1 -
 .../pci/hive_isp_css_include/memory_realloc.h | 38 ---------
 .../media/atomisp/pci/memory_realloc.c        | 80 -------------------
 .../staging/media/atomisp/pci/sh_css_params.c |  4 +-
 4 files changed, 1 insertion(+), 122 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_realloc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/memory_realloc.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 889227dcebfe..4a77d6d6910d 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -115,7 +115,6 @@ atomisp-objs += \
 	pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.o \
 	pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.o \
 	pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.o \
-	pci/memory_realloc.o \
 	pci/mmu/isp_mmu.o \
 	pci/mmu/sh_mmu_mrfld.o \
 	pci/runtime/binary/src/binary.o \
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_realloc.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_realloc.h
deleted file mode 100644
index 546b93ca1186..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_realloc.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
-*/
-#ifndef __MEMORY_REALLOC_H_INCLUDED__
-#define __MEMORY_REALLOC_H_INCLUDED__
-
-/*!
- * \brief
- * Define the internal reallocation of private css memory
- *
- */
-
-#include <type_support.h>
-/*
- * User provided file that defines the (sub)system address types:
- *	- hrt_vaddress	a type that can hold the (sub)system virtual address range
- */
-#include "system_types.h"
-#include "ia_css_err.h"
-
-bool reallocate_buffer(
-    hrt_vaddress *curr_buf,
-    size_t *curr_size,
-    size_t needed_size,
-    bool force,
-    enum ia_css_err *err);
-
-#endif /*__MEMORY_REALLOC_H_INCLUDED__*/
diff --git a/drivers/staging/media/atomisp/pci/memory_realloc.c b/drivers/staging/media/atomisp/pci/memory_realloc.c
deleted file mode 100644
index ec0a078e65f9..000000000000
--- a/drivers/staging/media/atomisp/pci/memory_realloc.c
+++ /dev/null
@@ -1,80 +0,0 @@
-/*
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
-*/
-#include "memory_realloc.h"
-#include "ia_css_debug.h"
-#include "ia_css_refcount.h"
-#include "memory_access.h"
-
-static bool realloc_isp_css_mm_buf(
-    hrt_vaddress *curr_buf,
-    size_t *curr_size,
-    size_t needed_size,
-    bool force,
-    enum ia_css_err *err,
-    uint16_t mmgr_attribute);
-
-bool reallocate_buffer(
-    hrt_vaddress *curr_buf,
-    size_t *curr_size,
-    size_t needed_size,
-    bool force,
-    enum ia_css_err *err)
-{
-	bool ret;
-
-	IA_CSS_ENTER_PRIVATE("void");
-
-	ret = realloc_isp_css_mm_buf(curr_buf,
-				     curr_size, needed_size, force, err, 0);
-
-	IA_CSS_LEAVE_PRIVATE("ret=%d", ret);
-	return ret;
-}
-
-static bool realloc_isp_css_mm_buf(
-    hrt_vaddress *curr_buf,
-    size_t *curr_size,
-    size_t needed_size,
-    bool force,
-    enum ia_css_err *err,
-    uint16_t mmgr_attribute)
-{
-	s32 id;
-
-	*err = IA_CSS_SUCCESS;
-	/* Possible optimization: add a function sh_css_isp_css_mm_realloc()
-	 * and implement on top of hmm. */
-
-	IA_CSS_ENTER_PRIVATE("void");
-
-	if (ia_css_refcount_is_single(*curr_buf) && !force &&
-	    *curr_size >= needed_size) {
-		IA_CSS_LEAVE_PRIVATE("false");
-		return false;
-	}
-
-	id = IA_CSS_REFCOUNT_PARAM_BUFFER;
-	ia_css_refcount_decrement(id, *curr_buf);
-	*curr_buf = ia_css_refcount_increment(id, mmgr_alloc_attr(needed_size,
-					      mmgr_attribute));
-
-	if (!*curr_buf) {
-		*err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
-		*curr_size = 0;
-	} else {
-		*curr_size = needed_size;
-	}
-	IA_CSS_LEAVE_PRIVATE("true");
-	return true;
-}
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 890f8e74a85d..70a8e7ae765e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -46,9 +46,7 @@
 #include "ia_css_pipeline.h"
 #include "ia_css_debug.h"
 #include "memory_access.h"
-#if 0   /* FIXME */
-#include "memory_realloc.h"
-#endif
+
 #include "ia_css_isp_param.h"
 #include "ia_css_isp_params.h"
 #include "ia_css_mipi.h"
-- 
2.26.2

