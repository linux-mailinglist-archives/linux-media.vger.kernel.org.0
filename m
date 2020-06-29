Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BFB20D749
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgF2T2d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:28:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:4716 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729373AbgF2T20 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:28:26 -0400
IronPort-SDR: h8cquvd4pUdRX4j3aAL0ls90lHKzyYoHuI9mzH/UtlKebMkWyn3z3ssrKhXRZrgft7EzWeq52x
 31ha8Dzcn1eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="145063766"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="145063766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:22:08 -0700
IronPort-SDR: 86Bmt34df9qssARpKaRTi3ExbknnCpvFsiJ1QOuZMUt7ohu7vUpI4gyzkEK/yGmFt44COFwjUz
 c+m2M6tFidNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="480847127"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2020 09:22:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6AA292C2; Mon, 29 Jun 2020 13:57:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 5/5] media: atomisp: Clean up non-existing folders from Makefile
Date:   Mon, 29 Jun 2020 13:57:39 +0300
Message-Id: <20200629105739.3098-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
References: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Compiler is not happy about leftovers:
cc1: warning: .../pci/hrt/: No such file or directory [-Wmissing-include-dirs]
cc1: warning: .../pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
cc1: warning: .../pci/css_2400_system/hrt/: No such file or directory [-Wmissing-include-dirs]

Drop them from Makefile.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 41a5656da85c..9e5a29c6fb71 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -182,7 +182,6 @@ INCLUDES += \
 	-I$(atomisp)/include/hmm/ \
 	-I$(atomisp)/include/mmu/ \
 	-I$(atomisp)/pci/ \
-	-I$(atomisp)/pci/hrt/ \
 	-I$(atomisp)/pci/base/circbuf/interface/ \
 	-I$(atomisp)/pci/base/refcount/interface/ \
 	-I$(atomisp)/pci/camera/pipe/interface/ \
@@ -192,7 +191,6 @@ INCLUDES += \
 	-I$(atomisp)/pci/hive_isp_css_include/ \
 	-I$(atomisp)/pci/hive_isp_css_include/device_access/ \
 	-I$(atomisp)/pci/hive_isp_css_include/host/ \
-	-I$(atomisp)/pci/hive_isp_css_include/memory_access/ \
 	-I$(atomisp)/pci/hive_isp_css_shared/ \
 	-I$(atomisp)/pci/hive_isp_css_shared/host/ \
 	-I$(atomisp)/pci/isp/kernels/ \
@@ -311,9 +309,7 @@ INCLUDES += \
 	-I$(atomisp)/pci/runtime/tagger/interface/
 
 INCLUDES_byt += \
-	-I$(atomisp)/pci/css_2400_system/ \
 	-I$(atomisp)/pci/css_2400_system/hive/ \
-	-I$(atomisp)/pci/css_2400_system/hrt/ \
 
 INCLUDES_cht += \
 	-I$(atomisp)/pci/css_2401_system/ \
@@ -321,7 +317,6 @@ INCLUDES_cht += \
 	-I$(atomisp)/pci/css_2401_system/hive/ \
 	-I$(atomisp)/pci/css_2401_system/hrt/ \
 
-#	-I$(atomisp)/pci/css_2401_system/hrt/ \
 #	-I$(atomisp)/pci/css_2401_system/hive_isp_css_2401_system_generated/ \
 
 DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
-- 
2.27.0

