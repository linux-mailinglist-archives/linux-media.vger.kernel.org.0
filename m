Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8B32E7C4C
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 21:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgL3UqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 15:46:04 -0500
Received: from mga03.intel.com ([134.134.136.65]:53249 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgL3UqE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 15:46:04 -0500
IronPort-SDR: fOIsxAIAlvrFWzQz8IxjcQsfKYS+M+amH2ufHEWw0twnraHTFfcwxzC3c9p5RsFkaDVgYnv6hp
 mGpLRDxzLLPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="176738320"
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; 
   d="scan'208";a="176738320"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 12:44:15 -0800
IronPort-SDR: PbfVCazB5vdnYei5Ucfyht9QctAeRC2wpjbzqFTHBsdvSxXihxOMo16SO9qNCn1tIipB6A8NNh
 jMYEuhZjT46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; 
   d="scan'208";a="344497799"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Dec 2020 12:44:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 32031DE; Wed, 30 Dec 2020 22:44:12 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1] media: ipu3-cio2: Add headers that ipu3-cio2.h is direct user of
Date:   Wed, 30 Dec 2020 22:44:05 +0200
Message-Id: <20201230204405.62892-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add headers that ipu3-cio2.h is direct user of.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Dan, feel free to incorporate this into your series.

 drivers/media/pci/intel/ipu3/ipu3-cio2.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index ccf0b85ae36f..62187ab5ae43 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -4,8 +4,26 @@
 #ifndef __IPU3_CIO2_H
 #define __IPU3_CIO2_H
 
+#include <linux/bits.h>
+#include <linux/dma-mapping.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 
+#include <asm/page.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+struct cio2_fbpt_entry;		/* defined here, after the first usage */
+struct pci_dev;
+
 #define CIO2_NAME					"ipu3-cio2"
 #define CIO2_DEVICE_NAME				"Intel IPU3 CIO2"
 #define CIO2_ENTITY_NAME				"ipu3-csi2"
-- 
2.29.2

