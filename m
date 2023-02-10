Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3CD6915FE
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 02:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjBJBA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 20:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjBJBAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 20:00:17 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7B983
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 17:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675990815; x=1707526815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LO/Sgt8SzsWeg4DpRXmwisOohS2NXb9JY6Wj2UA16pc=;
  b=dxOdNxa3l2QHWV4aMONnPrcuGle2YMOLmtaAuFZjwo8simSbie2OwmvB
   Cy8znrMJPYmcS68ilHe94sXMC9qa96voIcCekucIOSaoxK2788ZxElNNK
   T5G+PE662qpZKEhbTioPqnsJnIJv6+N2dZU73h67y0+ptbjyYfcRFSnUJ
   /PeoB0QHKUOoDOABFFjCdcW9R8HXjT159utmOvwPTcIn+lnmuKiPL2dQ8
   aEg1UKVOQXuPFb4cYxEeNiXPTowgan3PIrgOUB48q/OC0g8BQhf4KOaCD
   pxKrx2jPv34/YTpqwVkvRAH4TvLRIa68mR6tpzBWDYVRVjSWn7+LrpWPL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="313943378"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="313943378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 17:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="667878091"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="667878091"
Received: from wentongw-hp-z228-microtower-workstation.sh.intel.com ([10.239.153.109])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2023 17:00:12 -0800
From:   Wentong Wu <wentong.wu@intel.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com,
        pierre-louis.bossart@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v1 1/3] media: pci: intel: ivsc: Add CSI submodule
Date:   Fri, 10 Feb 2023 09:02:19 +0800
Message-Id: <20230210010221.2466486-2-wentong.wu@intel.com>
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

CSI is a submodule of IVSC which can route camera sensor data
to the outbound MIPI CSI-2 interface.

The interface communicating with firmware is via MEI. There is
a separate MEI UUID, which this driver uses to enumerate.

To route camera sensor data to host, the caller specifies link
frequency and number of data lanes. This information is sent to
firmware by sending MEI command.

Two APIs are exported: csi_set_link_owner is used to switch
ownership of CSI-2 link, and csi_set_link_cfg is to configure
CSI-2 link when routing camera sensor data to host.

CSI also provides a privacy mode. When privacy mode is turned
on, camera sensor can't be used. This means that both IVSC and
host Image Processing Unit(IPU) can't get image data. And when
this mode is turned on, host Image Processing Unit(IPU) driver
is informed via the registered callback, so that user can be
notified.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/Kconfig              |   1 +
 drivers/media/pci/intel/Makefile       |   2 +
 drivers/media/pci/intel/ivsc/Kconfig   |  12 +
 drivers/media/pci/intel/ivsc/Makefile  |   5 +
 drivers/media/pci/intel/ivsc/mei_csi.c | 341 +++++++++++++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.h |  60 +++++
 include/linux/ivsc.h                   |  19 ++
 7 files changed, 440 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
 create mode 100644 drivers/media/pci/intel/ivsc/Makefile
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.h
 create mode 100644 include/linux/ivsc.h

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 1224d908713a..16661ab0b816 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -74,6 +74,7 @@ config VIDEO_PCI_SKELETON
 	  when developing new drivers.
 
 source "drivers/media/pci/intel/ipu3/Kconfig"
+source "drivers/media/pci/intel/ivsc/Kconfig"
 
 endif #MEDIA_PCI_SUPPORT
 endif #PCI
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index 0b4236c4db49..d27ca636c860 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -4,3 +4,5 @@
 #
 
 obj-y	+= ipu3/
+
+obj-$(CONFIG_INTEL_VSC) += ivsc/
diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
new file mode 100644
index 000000000000..9535ac10f4f7
--- /dev/null
+++ b/drivers/media/pci/intel/ivsc/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2023, Intel Corporation. All rights reserved.
+
+config INTEL_VSC
+	tristate "Intel Visual Sensing Controller"
+	depends on INTEL_MEI
+	help
+	  This adds support for Intel Visual Sensing Controller (IVSC).
+
+	  Enables the IVSC firmware services required for controlling
+	  camera sensor ownership and CSI-2 link through Image Processing
+	  Unit(IPU) driver of Intel.
diff --git a/drivers/media/pci/intel/ivsc/Makefile b/drivers/media/pci/intel/ivsc/Makefile
new file mode 100644
index 000000000000..1825aad45cff
--- /dev/null
+++ b/drivers/media/pci/intel/ivsc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (C) 2023, Intel Corporation. All rights reserved.
+
+obj-$(CONFIG_INTEL_VSC) += mei_csi.o
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
new file mode 100644
index 000000000000..36b144a10fdf
--- /dev/null
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Intel Corporation. All rights reserved.
+ * Intel Visual Sensing Controller CSI Linux driver
+ */
+
+/*
+ * To set ownership of CSI-2 link and to configure CSI-2 link, there
+ * are specific commands, which are sent via MEI protocol. The send
+ * command function uses "completion" as a synchronization mechanism.
+ * The response for command is received via a mei callback which wakes
+ * up the caller. There can be only one outstanding command at a time.
+ */
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/units.h>
+#include <linux/uuid.h>
+#include <linux/workqueue.h>
+
+#include "mei_csi.h"
+
+#define MEI_CSI_DRIVER_NAME "ivsc_csi"
+
+/* the 5s used here is based on experiment */
+#define CSI_CMD_TIMEOUT (5 * HZ)
+/* to setup CSI-2 link an extra delay needed and determined experimentally */
+#define CSI_FW_READY_DELAY_MS 100
+/* link frequency unit is 100kHz */
+#define CSI_LINK_FREQ(x) ((u32)(x / (100 * HZ_PER_KHZ)))
+
+/*
+ * identify the command id supported by firmware
+ * IPC, as well as the privacy notification id
+ * used when processing privacy event.
+ */
+enum csi_cmd_id {
+	/* used to set csi ownership */
+	CSI_SET_OWNER = 0,
+
+	/* used to configure CSI-2 link */
+	CSI_SET_CONF = 2,
+
+	/* privacy notification id used when privacy state changes */
+	CSI_PRIVACY_NOTIF = 6,
+};
+
+/* configuration of the CSI-2 link between host and IVSC */
+struct csi_link_cfg {
+	/* number of data lanes used on the CSI-2 link */
+	u32 nr_of_lanes;
+
+	/* frequency of the CSI-2 link */
+	u32 link_freq;
+
+	/* for future use */
+	u32 rsvd[2];
+} __packed;
+
+/* CSI command structure */
+struct csi_cmd {
+	u32 cmd_id;
+	union _cmd_param {
+		u32 param;
+		struct csi_link_cfg conf;
+	} param;
+} __packed;
+
+/* CSI notification structure */
+struct csi_notif {
+	u32 cmd_id;
+	int status;
+	union _resp_cont {
+		u32 cont;
+		struct csi_link_cfg conf;
+	} cont;
+} __packed;
+
+struct mei_csi {
+	struct mei_cl_device *cldev;
+
+	/* command response */
+	struct csi_notif cmd_response;
+	/* used to wait for command response from firmware */
+	struct completion cmd_completion;
+
+	/* work element used to handle firmware event */
+	struct work_struct event_work;
+
+	/* privacy status */
+	enum ivsc_privacy_status status;
+	/* privacy callback */
+	void (*callback)(void *, enum ivsc_privacy_status);
+	/* privacy callback runtime context */
+	void *context;
+};
+
+/* only one for now */
+static struct mei_csi *csi;
+/* lock used to prevent multiple call to csi */
+static DEFINE_MUTEX(csi_mutex);
+
+/* send a command to firmware and mutex must be held by caller */
+static int mei_csi_send(u8 *buf, size_t len)
+{
+	struct csi_cmd *cmd = (struct csi_cmd *)buf;
+	int ret;
+
+	reinit_completion(&csi->cmd_completion);
+
+	ret = mei_cldev_send(csi->cldev, buf, len);
+	if (ret < 0)
+		goto out;
+
+	ret = wait_for_completion_killable_timeout(&csi->cmd_completion,
+						   CSI_CMD_TIMEOUT);
+	if (ret < 0) {
+		goto out;
+	} else if (!ret) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	/* command response status */
+	ret = csi->cmd_response.status;
+	if (ret) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (csi->cmd_response.cmd_id != cmd->cmd_id)
+		ret = -EINVAL;
+
+out:
+	return ret;
+}
+
+int csi_set_link_owner(enum csi_link_owner owner,
+		       void (*callback)(void *, enum ivsc_privacy_status),
+		       void *context)
+{
+	struct csi_cmd cmd = { 0 };
+	size_t cmd_size;
+	int ret;
+
+	cmd.cmd_id = CSI_SET_OWNER;
+	cmd.param.param = owner;
+	cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
+
+	mutex_lock(&csi_mutex);
+	if (unlikely(!csi)) {
+		mutex_unlock(&csi_mutex);
+		return -EAGAIN;
+	}
+
+	ret = mei_csi_send((u8 *)&cmd, cmd_size);
+
+	/*
+	 * cancel possible event work and wait for it to finish
+	 * to make sure no work running for the ongoing changes
+	 * to callback and context.
+	 */
+	cancel_work_sync(&csi->event_work);
+	csi->callback = callback;
+	csi->context = context;
+	mutex_unlock(&csi_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(csi_set_link_owner, IVSC);
+
+int csi_set_link_cfg(u32 nr_of_lanes, u64 link_freq)
+{
+	struct csi_cmd cmd = { 0 };
+	size_t cmd_size;
+	int ret;
+
+	cmd.cmd_id = CSI_SET_CONF;
+	cmd.param.conf.nr_of_lanes = nr_of_lanes;
+	cmd.param.conf.link_freq = CSI_LINK_FREQ(link_freq);
+	cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
+
+	mutex_lock(&csi_mutex);
+	if (unlikely(!csi)) {
+		mutex_unlock(&csi_mutex);
+		return -EAGAIN;
+	}
+
+	ret = mei_csi_send((u8 *)&cmd, cmd_size);
+	/*
+	 * wait configuration ready if download success. placing
+	 * delay under mutex is to make sure current command flow
+	 * completed before starting a possible new one.
+	 */
+	if (!ret)
+		msleep(CSI_FW_READY_DELAY_MS);
+	mutex_unlock(&csi_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(csi_set_link_cfg, IVSC);
+
+/* event handling routine */
+static void mei_csi_event_work(struct work_struct *work)
+{
+	if (csi->callback)
+		csi->callback(csi->context, READ_ONCE(csi->status));
+}
+
+/* callback for receive */
+static void mei_csi_rx(struct mei_cl_device *cldev)
+{
+	struct csi_notif notif = { 0 };
+	int ret;
+
+	ret = mei_cldev_recv(cldev, (u8 *)&notif, sizeof(notif));
+	if (ret < 0) {
+		dev_err(&cldev->dev, "recv error: %d\n", ret);
+		return;
+	}
+
+	switch (notif.cmd_id) {
+	case CSI_PRIVACY_NOTIF:
+		if (notif.cont.cont < IVSC_PRIVACY_MAX) {
+			WRITE_ONCE(csi->status, notif.cont.cont);
+
+			schedule_work(&csi->event_work);
+		}
+		break;
+	case CSI_SET_OWNER:
+	case CSI_SET_CONF:
+		memcpy(&csi->cmd_response, &notif, ret);
+
+		complete(&csi->cmd_completion);
+		break;
+	default:
+		break;
+	}
+}
+
+static int mei_csi_probe(struct mei_cl_device *cldev,
+			 const struct mei_cl_device_id *id)
+{
+	int ret;
+
+	mutex_lock(&csi_mutex);
+	/*
+	 * only instance is possible in the current hardware,
+	 * but adding protection for future hardware.
+	 */
+	if (csi) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	csi = kzalloc(sizeof(*csi), GFP_KERNEL);
+	if (!csi) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	csi->cldev = cldev;
+	init_completion(&csi->cmd_completion);
+	INIT_WORK(&csi->event_work, mei_csi_event_work);
+
+	mei_cldev_set_drvdata(cldev, csi);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_err(&cldev->dev, "mei_cldev_enable failed: %d\n", ret);
+		goto err_free;
+	}
+
+	ret = mei_cldev_register_rx_cb(cldev, mei_csi_rx);
+	if (ret) {
+		dev_err(&cldev->dev, "event cb registration failed: %d\n", ret);
+		goto err_disable;
+	}
+	mutex_unlock(&csi_mutex);
+
+	return 0;
+
+err_disable:
+	mei_cldev_disable(cldev);
+
+err_free:
+	kfree(csi);
+	/* disable csi */
+	csi = NULL;
+
+err_unlock:
+	mutex_unlock(&csi_mutex);
+
+	return ret;
+}
+
+static void mei_csi_remove(struct mei_cl_device *cldev)
+{
+	mutex_lock(&csi_mutex);
+	/* disable mei csi client device */
+	mei_cldev_disable(cldev);
+
+	/* cancel event work and wait for it to finish */
+	cancel_work_sync(&csi->event_work);
+
+	kfree(csi);
+	/* disable csi */
+	csi = NULL;
+	mutex_unlock(&csi_mutex);
+}
+
+#define MEI_CSI_UUID UUID_LE(0x92335FCF, 0x3203, 0x4472, \
+			     0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
+
+static const struct mei_cl_device_id mei_csi_tbl[] = {
+	{ MEI_CSI_DRIVER_NAME, MEI_CSI_UUID, MEI_CL_VERSION_ANY },
+
+	/* required last entry */
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_csi_tbl);
+
+static struct mei_cl_driver mei_csi_driver = {
+	.id_table = mei_csi_tbl,
+	.name = MEI_CSI_DRIVER_NAME,
+
+	.probe = mei_csi_probe,
+	.remove = mei_csi_remove,
+};
+
+module_mei_cl_driver(mei_csi_driver);
+
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_DESCRIPTION("Device driver for IVSC CSI");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.h b/drivers/media/pci/intel/ivsc/mei_csi.h
new file mode 100644
index 000000000000..0cc51e6a5250
--- /dev/null
+++ b/drivers/media/pci/intel/ivsc/mei_csi.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Intel Corporation. All rights reserved.
+ * Intel Visual Sensing Controller CSI external interface
+ */
+
+#ifndef _MEI_CSI_H_
+#define _MEI_CSI_H_
+
+#include <linux/ivsc.h>
+
+/* CSI-2 link ownership definition */
+enum csi_link_owner {
+	CSI_LINK_IVSC,
+	CSI_LINK_HOST,
+};
+
+#if IS_ENABLED(CONFIG_INTEL_VSC)
+/*
+ * @brief set CSI-2 link ownership
+ *
+ * @param owner The csi ownership being set
+ * @param callback The pointer of privacy callback being set
+ * @param context Privacy callback runtime context
+ *
+ * @return 0 on success, negative on failure
+ */
+int csi_set_link_owner(enum csi_link_owner owner,
+		       void (*callback)(void *, enum ivsc_privacy_status),
+		       void *context);
+
+/*
+ * @brief configure CSI-2 link between host and IVSC
+ * with provided parameters
+ *
+ * @param nr_of_lanes The number of data lanes being used
+ * on the CSI-2 link
+ * @param link_freq The frequency being set on the CSI-2 link
+ *
+ * @return 0 on success, negative on failure
+ */
+int csi_set_link_cfg(u32 nr_of_lanes, u64 link_freq);
+
+#else
+static inline
+int csi_set_link_owner(enum csi_link_owner owner,
+		       void (*callback)(void *, enum ivsc_privacy_status),
+		       void *context)
+{
+	return 0;
+}
+
+static inline int csi_set_link_cfg(u32 nr_of_lanes, u64 link_freq)
+{
+	return 0;
+}
+
+#endif
+
+#endif
diff --git a/include/linux/ivsc.h b/include/linux/ivsc.h
new file mode 100644
index 000000000000..6572ca4f340c
--- /dev/null
+++ b/include/linux/ivsc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Intel Corporation. All rights reserved.
+ * Intel Visual Sensing Controller interface
+ */
+
+#ifndef _LINUX_IVSC_H_
+#define _LINUX_IVSC_H_
+
+#include <linux/types.h>
+
+/* IVSC privacy status definition */
+enum ivsc_privacy_status {
+	IVSC_PRIVACY_OFF,
+	IVSC_PRIVACY_ON,
+	IVSC_PRIVACY_MAX,
+};
+
+#endif
-- 
2.25.1

