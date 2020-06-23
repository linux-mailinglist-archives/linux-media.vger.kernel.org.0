Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F9A205A1C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733187AbgFWSFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:05:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:56773 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728916AbgFWSFh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:05:37 -0400
IronPort-SDR: DqXykTrgdOrWiS0fraqBP+Bb8B0bSC6JERdIUu+UTxxmh3BLA/ptE36C9CQ1ARyeeKqgGqFsqJ
 8FrfIB43uMhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="205679031"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="205679031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:36 -0700
IronPort-SDR: z/f4igGHgTb58A+5xktcss0omVTMouFaRA9aScHHiF1GqUWcCEMCOYcJI9Yxx503NEy4DABFNb
 eUT5wWkr9TQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="279192815"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 23 Jun 2020 11:05:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F3F9013B; Tue, 23 Jun 2020 21:05:33 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/9] media: atomisp: Replace last use of Intel MID APIs
Date:   Tue, 23 Jun 2020 21:05:25 +0300
Message-Id: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Intel MID special header is not in use in this driver.
Replace it with a better macro for now on.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/include/linux/atomisp_platform.h   | 1 +
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 873344a02ccf..5a5121d958ed 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -250,6 +250,7 @@ const struct atomisp_camera_caps *atomisp_get_default_camera_caps(void);
 #define IS_MFLD	__IS_SOC(INTEL_FAM6_ATOM_SALTWELL_MID)
 #define IS_BYT	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT)
 #define IS_CHT	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT)
+#define IS_MRFD	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT_MID)
 #define IS_MOFD	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT_MID)
 
 /* Both CHT and MOFD come with ISP2401 */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index c1e282a974d0..df352be06474 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -33,8 +33,6 @@
 #include "atomisp_ioctl.h"
 #include "atomisp_acc.h"
 
-#include <asm/intel-mid.h>
-
 #include "ia_css_debug.h"
 #include "ia_css_isp_param.h"
 #include "sh_css_hrt.h"
@@ -1966,8 +1964,7 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 			true,
 			0x13000,
 			&size_mem_words) != 0) {
-			if (intel_mid_identify_cpu() ==
-			    INTEL_MID_CPU_CHIP_TANGIER)
+			if (IS_MRFD)
 				size_mem_words = CSS_MIPI_FRAME_BUFFER_SIZE_2;
 			else
 				size_mem_words = CSS_MIPI_FRAME_BUFFER_SIZE_1;
-- 
2.27.0

