Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00C041574D
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 06:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhIWEMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 00:12:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:31700 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhIWEMv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 00:12:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="246206099"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="246206099"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 21:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="513543287"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2021 21:11:18 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     tian.shu.qiu@intel.com, laurent.pinchart@ideasonboard.com,
        tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: ipu3-cio2: Update high watermark to support higher data rate camera sensors
Date:   Thu, 23 Sep 2021 12:10:18 +0800
Message-Id: <1632370218-5508-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CIO2 worked well with most camera sensors so far, but CIO2 will meet SRAM
overflow when working with higher data rate camera sensors such as 13M@30fps.
We must set lower high watermark value to trigger the DRAM write to support
such camera sensors.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 3806d7f04d69..fde80d48533b 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -181,7 +181,7 @@ struct pci_dev;
 #define CIO2_PBM_WMCTRL1_MID1_2CK	(16 << CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT)
 #define CIO2_PBM_WMCTRL1_MID2_2CK	(21 << CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT)
 #define CIO2_REG_PBM_WMCTRL2				0x1468
-#define CIO2_PBM_WMCTRL2_HWM_2CK			40U
+#define CIO2_PBM_WMCTRL2_HWM_2CK			30U
 #define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT			0U
 #define CIO2_PBM_WMCTRL2_LWM_2CK			22U
 #define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT			8U
-- 
2.7.4

