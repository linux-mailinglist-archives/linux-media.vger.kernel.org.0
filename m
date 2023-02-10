Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60408691600
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 02:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjBJBAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 20:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjBJBAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 20:00:25 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00004C22
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 17:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675990824; x=1707526824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWB6i1R0hRSQi17PJ41xbkQC2m/YTpM2kB96UwAvNM4=;
  b=g9U2fpKaaHTTYILicl1AcmAWP03h14OAbWiNBNMVeZsu4krGvFJ6tARZ
   2iMjF3tqyYxfPZma+TGS0sjF8KTWtoPV7zVQvYN9vzoYClG7VimkhbA57
   Q7Q0xfE7zjaAzgy6ZxD80iwPyG4rNIsGPzYHuMJDMmDP52HLjbSRWAu8V
   eUIjN5hoSxO3dy2EvoldGTCtL5setXXbC1uTyAT8pedqe6DaZmFO7IBqg
   mqiVzx49ki+ZL9+WyKDam85GiMl5Guv3Bpzd8vCJpicg7qckuNrKruAEY
   qH6NIpm5L8D5n8iH2hogBVqHsgrthO9/SDgcZkewduDi8kYvBL8BzOFXA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="313943414"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="313943414"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 17:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="667878127"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="667878127"
Received: from wentongw-hp-z228-microtower-workstation.sh.intel.com ([10.239.153.109])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2023 17:00:21 -0800
From:   Wentong Wu <wentong.wu@intel.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com,
        pierre-louis.bossart@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v1 3/3] media: pci: intel: ivsc: Add acquire/release API for ivsc
Date:   Fri, 10 Feb 2023 09:02:21 +0800
Message-Id: <20230210010221.2466486-4-wentong.wu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210010221.2466486-1-wentong.wu@intel.com>
References: <20230210010221.2466486-1-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IVSC directly connects to camera sensor on source side, and on
output side it not only connects ISH via I2C, but also exposes
MIPI CSI-2 interface to output camera sensor data. IVSC can use
the camera sensor data to do AI algorithm, and send the results
to ISH. On the other end, IVSC can share camera sensor to host
by routing the raw camera sensor data to the exposed MIPI CSI-2
interface. But they can not work at the same time, so software
APIs are defined to sync the ownership.

This commit defines the interfaces between IVSC and camera sensor
driver in include/linux/ivsc.h. The camera driver controls
ownership of the CSI-2 link and sensor with the acquire/release
APIs. When acquiring camera, lane number and link freq are also
required by IVSC frame router.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/Makefile |  1 +
 drivers/media/pci/intel/ivsc/ivsc.c   | 84 +++++++++++++++++++++++++++
 include/linux/ivsc.h                  | 55 ++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/ivsc.c

diff --git a/drivers/media/pci/intel/ivsc/Makefile b/drivers/media/pci/intel/ivsc/Makefile
index de0a425c22c2..b8b6fc1083be 100644
--- a/drivers/media/pci/intel/ivsc/Makefile
+++ b/drivers/media/pci/intel/ivsc/Makefile
@@ -4,3 +4,4 @@
 
 obj-$(CONFIG_INTEL_VSC) += mei_csi.o
 obj-$(CONFIG_INTEL_VSC) += mei_ace.o
+obj-$(CONFIG_INTEL_VSC) += ivsc.o
diff --git a/drivers/media/pci/intel/ivsc/ivsc.c b/drivers/media/pci/intel/ivsc/ivsc.c
new file mode 100644
index 000000000000..12996b587639
--- /dev/null
+++ b/drivers/media/pci/intel/ivsc/ivsc.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Intel Corporation. All rights reserved.
+ * Intel Visual Sensing Controller interface
+ */
+
+#include <linux/delay.h>
+#include <linux/ivsc.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+
+#include "mei_ace.h"
+#include "mei_csi.h"
+
+/* lock for ivsc APIs */
+static DEFINE_MUTEX(ivsc_mutex);
+
+int ivsc_acquire_camera(u32 nr_of_lanes, u64 link_freq,
+			void (*callback)(void *, enum ivsc_privacy_status),
+			void *context)
+{
+	int ret;
+
+	mutex_lock(&ivsc_mutex);
+
+	/* switch camera sensor ownership to host */
+	ret = ace_set_camera_owner(ACE_CAMERA_HOST);
+	if (ret)
+		goto error;
+
+	/* switch CSI-2 link to host */
+	ret = csi_set_link_owner(CSI_LINK_HOST, callback, context);
+	if (ret)
+		goto release_camera;
+
+	/* configure CSI-2 link */
+	ret = csi_set_link_cfg(nr_of_lanes, link_freq);
+	if (ret)
+		goto release_csi;
+
+	mutex_unlock(&ivsc_mutex);
+
+	return 0;
+
+release_csi:
+	csi_set_link_owner(CSI_LINK_IVSC, NULL, NULL);
+
+release_camera:
+	ace_set_camera_owner(ACE_CAMERA_IVSC);
+
+error:
+	mutex_unlock(&ivsc_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ivsc_acquire_camera);
+
+int ivsc_release_camera(void)
+{
+	int ret;
+
+	mutex_lock(&ivsc_mutex);
+
+	/* switch CSI-2 link to IVSC */
+	ret = csi_set_link_owner(CSI_LINK_IVSC, NULL, NULL);
+	if (ret)
+		goto error;
+
+	/* switch camera sensor ownership to IVSC */
+	ret = ace_set_camera_owner(ACE_CAMERA_IVSC);
+
+error:
+	mutex_unlock(&ivsc_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ivsc_release_camera);
+
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_SOFTDEP("pre: mei_csi mei_ace");
+MODULE_DESCRIPTION("IVSC interface");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(IVSC);
diff --git a/include/linux/ivsc.h b/include/linux/ivsc.h
index 6572ca4f340c..bc9006cd6efc 100644
--- a/include/linux/ivsc.h
+++ b/include/linux/ivsc.h
@@ -16,4 +16,59 @@ enum ivsc_privacy_status {
 	IVSC_PRIVACY_MAX,
 };
 
+#if IS_ENABLED(CONFIG_INTEL_VSC)
+/*
+ * @brief Acquire camera sensor ownership to host and setup
+ * the CSI-2 link between host and IVSC
+ *
+ * IVSC provides a privacy mode. When the privacy mode is turned
+ * on, camera sensor can't be used. This means that both IVSC and
+ * host Image Processing Unit(IPU) can't get image data. And when
+ * this mode is turned on, host Image Processing Unit(IPU) driver
+ * is informed via the registered callback, so that user can be
+ * notified.
+ *
+ * @param nr_of_lanes Number of data lanes used on the CSI-2 link
+ * @param link_freq Frequency of the CSI-2 link
+ * @param callback The pointer of privacy callback function
+ * @param context Privacy callback function runtime context
+ *
+ * @retval 0 If success
+ * @retval -EIO IO error
+ * @retval -EINVAL Invalid argument
+ * @retval -EAGAIN IVSC device not ready
+ * @retval negative values for other errors
+ */
+int ivsc_acquire_camera(u32 nr_of_lanes, u64 link_freq,
+			void (*callback)(void *, enum ivsc_privacy_status),
+			void *context);
+
+/*
+ * @brief Release camera sensor ownership and stop the CSI-2
+ * link between host and IVSC
+ *
+ * @retval 0 If success
+ * @retval -EIO IO error
+ * @retval -EINVAL Invalid argument
+ * @retval -EAGAIN IVSC device not ready
+ * @retval negative values for other errors
+ */
+int ivsc_release_camera(void);
+
+#else
+static inline
+int ivsc_acquire_camera(u32 nr_of_lanes, u64 link_freq,
+			void (*callback)(void *, enum ivsc_privacy_status),
+			void *context)
+{
+	return 0;
+}
+
+static inline int ivsc_release_camera(void)
+{
+	return 0;
+}
+
+#endif
+
 #endif
-- 
2.25.1

