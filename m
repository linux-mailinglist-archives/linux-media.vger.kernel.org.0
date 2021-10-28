Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE96F43DDB1
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 11:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhJ1J1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 05:27:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:42982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhJ1J1w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 05:27:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2EC660E78;
        Thu, 28 Oct 2021 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635413125;
        bh=Y5mRnOfcpDHbrEcKPxOejw1RoXP9QeM+TxRILiKOfo0=;
        h=From:To:Cc:Subject:Date:From;
        b=pbmDGr6wOXPSBSdwgtUvZlsOLLxT5Ryzm7W5imGXKv/RDJG/gdBxA8lkpldGEG8rN
         T1lXwbiyM37gFySVp7kNCXXpRQYF7Nuyjjevmm5C7TY2dHjxtug96MWIXiO7uhk+Ug
         DpXZvmkeU1NZ/d5zSIbU+kxIffGSKMY5Er7LBQMOejALdrK21srwGlHG65HX+Ul6zb
         TKhKi5Y2DcHgP780spnrF0Utx3j1ZIvqGGfKALqSFPfBFSyu0riQG8UnXz6cSGVl8K
         PM1e764H8PFh3aMFLICnP6ohRwXjx2w62Ip/1xz8Sx2HGeFp/CTkbeFEmAXQ5Hq61a
         yur7LYkJL6wug==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mg1f0-0004Nk-Oz; Thu, 28 Oct 2021 10:25:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: [PATCH] media: atomisp: get rid of two unused functions
Date:   Thu, 28 Oct 2021 10:25:21 +0100
Message-Id: <320510b91925e0ebdb5fdaa1d4843dc470067440.1635413116.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those cause build to break with -Werror with clang-12:

	drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c:121:24: error: unused function 'gdc_reg_load' [-Werror,-Wunused-function]
	drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c:33:1: error: unused function 'sh_css_elems_bytes_from_info' [-Werror,-Wunused-function]

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/hive_isp_css_common/host/gdc.c  | 11 -----------
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c     |  6 ------
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8ed1cffc5384..25e082d6a94a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -28,10 +28,6 @@ static inline void gdc_reg_store(
     const unsigned int	reg,
     const hrt_data		value);
 
-static inline hrt_data gdc_reg_load(
-    const gdc_ID_t		ID,
-    const unsigned int	reg);
-
 #ifndef __INLINE_GDC__
 #include "gdc_private.h"
 #endif /* __INLINE_GDC__ */
@@ -117,10 +113,3 @@ static inline void gdc_reg_store(
 	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
 	return;
 }
-
-static inline hrt_data gdc_reg_load(
-    const gdc_ID_t		ID,
-    const unsigned int	reg)
-{
-	return ia_css_device_load_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data));
-}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index c505c94a7241..f741beb9ed8a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -29,12 +29,6 @@ static const struct ia_css_raw_configuration default_config = {
 	.pipe = (struct sh_css_sp_pipeline *)NULL,
 };
 
-static inline unsigned
-sh_css_elems_bytes_from_info(unsigned int raw_bit_depth)
-{
-	return CEIL_DIV(raw_bit_depth, 8);
-}
-
 /* MW: These areMIPI / ISYS properties, not camera function properties */
 static enum sh_stream_format
 css2isp_stream_format(enum atomisp_input_format from) {
-- 
2.31.1

