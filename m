Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789686DC2E3
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 05:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjDJDOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 23:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjDJDOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 23:14:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC92230C6
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681096486; x=1712632486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XEAZLByaPKkylBI3yFk8HPz1bsgNv+vmo/OPvJ3UmzE=;
  b=dQNkgW21YG6nq0/e3an0Xh8gtI+5+/Fs0NA2/Xl7Pc+EDCuRxFMS7BA7
   2NmNbnAOcEXvtCfZgDCDVCLAz673q9BdVFDHxehMuPQ/p5seNszpiuib4
   lzjPZVItZFDted6HmAUelG33BpPNdheeSvdQpFUtyUe0E5By5Eja1CyuF
   wQMTEgGX3xnlXRyVj8n7ddRY9nlgTdOzDMctzaOUZZ9PjPVy/xj3UUN7R
   LCnO4Mm72YKAzju8/kUWUbIpYVKQRhJrwdgeKB/vobuXEXUHmFaHea3wP
   6aTrt6LiZrQ8bgT+1M5iAU9q7hx2JofMAwnTARRORP7VmixKdn6W408BX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406104123"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="406104123"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 20:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="1017854027"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="1017854027"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2023 20:14:43 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v5 2/3] media: pci: intel: ivsc: Add ACE submodule
Date:   Mon, 10 Apr 2023 11:14:24 +0800
Message-Id: <1681096465-17287-3-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ACE is a submodule of IVSC which controls camera sensor's
ownership, belonging to host or IVSC. When IVSC owns camera
sensor, it is for algorithm computing. When host wants to
control camera sensor, ACE module needs to be informed of
ownership with defined interface.

The interface is via MEI. There is a separate MEI UUID, which
this driver uses to enumerate.

To switch ownership of camera sensor between IVSC and host,
the caller specifies the defined ownership information which
will be sent to firmware by sending MEI command.

Device link(device_link_add) is used to set the right camera
sensor ownership before accessing the sensor via I2C. With
DL_FLAG_PM_RUNTIME and DL_FLAG_RPM_ACTIVE, the supplier device
will be PM runtime resumed before the consumer(camera sensor).
So use runtime PM callbacks to transfer the ownership between
host and IVSC.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/Makefile  |   3 +
 drivers/media/pci/intel/ivsc/mei_ace.c | 560 +++++++++++++++++++++++++++++++++
 2 files changed, 563 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c

diff --git a/drivers/media/pci/intel/ivsc/Makefile b/drivers/media/pci/intel/ivsc/Makefile
index cbd194a..00fad29 100644
--- a/drivers/media/pci/intel/ivsc/Makefile
+++ b/drivers/media/pci/intel/ivsc/Makefile
@@ -4,3 +4,6 @@
 
 obj-$(CONFIG_INTEL_VSC) += ivsc-csi.o
 ivsc-csi-y += mei_csi.o
+
+obj-$(CONFIG_INTEL_VSC) += ivsc-ace.o
+ivsc-ace-y += mei_ace.o
diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
new file mode 100644
index 0000000..e76a871
--- /dev/null
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -0,0 +1,560 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Intel Corporation. All rights reserved.
+ * Intel Visual Sensing Controller ACE Linux driver
+ */
+
+/*
+ * To set ownership of camera sensor, there is specific command, which
+ * is sent via MEI protocol. That's a two-step scheme where the firmware
+ * first acks receipt of the command and later responses the command was
+ * executed. The command sending function uses "completion" as the
+ * synchronization mechanism. The notification for command is received
+ * via a mei callback which wakes up the caller. There can be only one
+ * outstanding command at a time.
+ *
+ * The power line of camera sensor is directly connected to IVSC instead
+ * of host, when camera sensor ownership is switched to host, sensor is
+ * already powered up by firmware.
+ */
+
+#include <linux/acpi.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+
+#define	MEI_ACE_DRIVER_NAME	"ivsc_ace"
+
+/* indicating driver message */
+#define	ACE_DRV_MSG		1
+/* indicating set command */
+#define	ACE_CMD_SET		4
+/* command timeout determined experimentally */
+#define	ACE_CMD_TIMEOUT		(5 * HZ)
+/* indicating the first command block */
+#define	ACE_CMD_INIT_BLOCK	1
+/* indicating the last command block */
+#define	ACE_CMD_FINAL_BLOCK	1
+/* size of camera status notification content */
+#define	ACE_CAMERA_STATUS_SIZE	5
+
+/* UUID used to get firmware id */
+#define ACE_GET_FW_ID_UUID UUID_LE(0x6167DCFB, 0x72F1, 0x4584, 0xBF, \
+				   0xE3, 0x84, 0x17, 0x71, 0xAA, 0x79, 0x0B)
+
+/* UUID used to get csi device */
+#define MEI_CSI_UUID UUID_LE(0x92335FCF, 0x3203, 0x4472, \
+			     0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
+
+/* identify firmware event type */
+enum ace_event_type {
+	/* firmware ready */
+	ACE_FW_READY = 0x8,
+
+	/* command response */
+	ACE_CMD_RESPONSE = 0x10,
+};
+
+/* identify camera sensor ownership */
+enum ace_camera_owner {
+	ACE_CAMERA_IVSC,
+	ACE_CAMERA_HOST,
+};
+
+/* identify the command id supported by firmware IPC */
+enum ace_cmd_id {
+	/* used to switch camera sensor to host */
+	ACE_SWITCH_CAMERA_TO_HOST = 0x13,
+
+	/* used to switch camera sensor to IVSC */
+	ACE_SWITCH_CAMERA_TO_IVSC = 0x14,
+
+	/* used to get firmware id */
+	ACE_GET_FW_ID = 0x1A,
+};
+
+/* ACE command header structure */
+struct ace_cmd_hdr {
+	u32 firmware_id : 16;
+	u32 instance_id : 8;
+	u32 type : 5;
+	u32 rsp : 1;
+	u32 msg_tgt : 1;
+	u32 _hw_rsvd_1 : 1;
+	u32 param_size : 20;
+	u32 cmd_id : 8;
+	u32 final_block : 1;
+	u32 init_block : 1;
+	u32 _hw_rsvd_2 : 2;
+} __packed;
+
+/* ACE command parameter structure */
+union ace_cmd_param {
+	uuid_le uuid;
+	u32 param;
+};
+
+/* ACE command structure */
+struct ace_cmd {
+	struct ace_cmd_hdr hdr;
+	union ace_cmd_param param;
+} __packed;
+
+/* ACE notification header */
+union ace_notif_hdr {
+	struct _confirm {
+		u32 status : 24;
+		u32 type : 5;
+		u32 rsp : 1;
+		u32 msg_tgt : 1;
+		u32 _hw_rsvd_1 : 1;
+		u32 param_size : 20;
+		u32 cmd_id : 8;
+		u32 final_block : 1;
+		u32 init_block : 1;
+		u32 _hw_rsvd_2 : 2;
+	} __packed ack;
+
+	struct _event {
+		u32 rsvd1 : 16;
+		u32 event_type : 8;
+		u32 type : 5;
+		u32 ack : 1;
+		u32 msg_tgt : 1;
+		u32 _hw_rsvd_1 : 1;
+		u32 rsvd2 : 30;
+		u32 _hw_rsvd_2 : 2;
+	} __packed event;
+
+	struct _response {
+		u32 event_id : 16;
+		u32 notif_type : 8;
+		u32 type : 5;
+		u32 rsp : 1;
+		u32 msg_tgt : 1;
+		u32 _hw_rsvd_1 : 1;
+		u32 event_data_size : 16;
+		u32 request_target : 1;
+		u32 request_type : 5;
+		u32 cmd_id : 8;
+		u32 _hw_rsvd_2 : 2;
+	} __packed response;
+};
+
+/* ACE notification content */
+union ace_notif_cont {
+	u16 firmware_id;
+	u8 state_notif;
+	u8 camera_status[ACE_CAMERA_STATUS_SIZE];
+};
+
+/* ACE notification structure */
+struct ace_notif {
+	union ace_notif_hdr hdr;
+	union ace_notif_cont cont;
+} __packed;
+
+struct mei_ace {
+	struct mei_cl_device *cldev;
+
+	/* command ack */
+	struct ace_notif cmd_ack;
+	/* command response */
+	struct ace_notif cmd_response;
+	/* used to wait for command ack and response */
+	struct completion cmd_completion;
+	/* lock used to prevent multiple call to send command */
+	struct mutex lock;
+
+	/* used to construct command */
+	u16 firmware_id;
+
+	/* runtime PM link from ace to csi */
+	struct device_link *csi_link;
+	/* runtime PM link from ace to sensor */
+	struct device_link *sensor_link;
+};
+
+static inline void init_cmd_hdr(struct ace_cmd_hdr *hdr)
+{
+	memset(hdr, 0, sizeof(struct ace_cmd_hdr));
+
+	hdr->type = ACE_CMD_SET;
+	hdr->msg_tgt = ACE_DRV_MSG;
+	hdr->init_block = ACE_CMD_INIT_BLOCK;
+	hdr->final_block = ACE_CMD_FINAL_BLOCK;
+}
+
+static int construct_command(struct mei_ace *ace, struct ace_cmd *cmd,
+			     enum ace_cmd_id cmd_id)
+{
+	union ace_cmd_param *param = &cmd->param;
+	struct ace_cmd_hdr *hdr = &cmd->hdr;
+
+	init_cmd_hdr(hdr);
+
+	hdr->cmd_id = cmd_id;
+	switch (cmd_id) {
+	case ACE_GET_FW_ID:
+		param->uuid = ACE_GET_FW_ID_UUID;
+		hdr->param_size = sizeof(param->uuid);
+		break;
+	case ACE_SWITCH_CAMERA_TO_IVSC:
+		param->param = 0;
+		hdr->firmware_id = ace->firmware_id;
+		hdr->param_size = sizeof(param->param);
+		break;
+	case ACE_SWITCH_CAMERA_TO_HOST:
+		hdr->firmware_id = ace->firmware_id;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return hdr->param_size + sizeof(cmd->hdr);
+}
+
+/* send command to firmware */
+static int mei_ace_send(struct mei_ace *ace, struct ace_cmd *cmd,
+			size_t len, bool only_ack)
+{
+	union ace_notif_hdr *resp_hdr = &ace->cmd_response.hdr;
+	union ace_notif_hdr *ack_hdr = &ace->cmd_ack.hdr;
+	struct ace_cmd_hdr *cmd_hdr = &cmd->hdr;
+	int ret;
+
+	mutex_lock(&ace->lock);
+
+	reinit_completion(&ace->cmd_completion);
+
+	ret = mei_cldev_send(ace->cldev, (u8 *)cmd, len);
+	if (ret < 0)
+		goto out;
+
+	ret = wait_for_completion_killable_timeout(&ace->cmd_completion,
+						   ACE_CMD_TIMEOUT);
+	if (ret < 0) {
+		goto out;
+	} else if (!ret) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (ack_hdr->ack.cmd_id != cmd_hdr->cmd_id) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* command ack status */
+	ret = ack_hdr->ack.status;
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+
+	if (only_ack)
+		goto out;
+
+	ret = wait_for_completion_killable_timeout(&ace->cmd_completion,
+						   ACE_CMD_TIMEOUT);
+	if (ret < 0) {
+		goto out;
+	} else if (!ret) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (resp_hdr->response.cmd_id != cmd_hdr->cmd_id)
+		ret = -EINVAL;
+
+out:
+	mutex_unlock(&ace->lock);
+
+	return ret;
+}
+
+static int ace_set_camera_owner(struct mei_ace *ace,
+				enum ace_camera_owner owner)
+{
+	enum ace_cmd_id cmd_id;
+	struct ace_cmd cmd;
+	int cmd_size;
+	int ret;
+
+	if (owner == ACE_CAMERA_IVSC)
+		cmd_id = ACE_SWITCH_CAMERA_TO_IVSC;
+	else
+		cmd_id = ACE_SWITCH_CAMERA_TO_HOST;
+
+	cmd_size = construct_command(ace, &cmd, cmd_id);
+	if (cmd_size >= 0)
+		ret = mei_ace_send(ace, &cmd, cmd_size, false);
+	else
+		ret = cmd_size;
+
+	return ret;
+}
+
+/* the first command downloaded to firmware */
+static inline int ace_get_firmware_id(struct mei_ace *ace)
+{
+	struct ace_cmd cmd;
+	int cmd_size;
+	int ret;
+
+	cmd_size = construct_command(ace, &cmd, ACE_GET_FW_ID);
+	if (cmd_size >= 0)
+		ret = mei_ace_send(ace, &cmd, cmd_size, true);
+	else
+		ret = cmd_size;
+
+	return ret;
+}
+
+static void handle_command_response(struct mei_ace *ace,
+				    struct ace_notif *resp, int len)
+{
+	union ace_notif_hdr *hdr = &resp->hdr;
+
+	switch (hdr->response.cmd_id) {
+	case ACE_SWITCH_CAMERA_TO_IVSC:
+	case ACE_SWITCH_CAMERA_TO_HOST:
+		memcpy(&ace->cmd_response, resp, len);
+		complete(&ace->cmd_completion);
+		break;
+	case ACE_GET_FW_ID:
+		break;
+	default:
+		break;
+	}
+}
+
+static void handle_command_ack(struct mei_ace *ace,
+			       struct ace_notif *ack, int len)
+{
+	union ace_notif_hdr *hdr = &ack->hdr;
+
+	switch (hdr->ack.cmd_id) {
+	case ACE_GET_FW_ID:
+		ace->firmware_id = ack->cont.firmware_id;
+		fallthrough;
+	case ACE_SWITCH_CAMERA_TO_IVSC:
+	case ACE_SWITCH_CAMERA_TO_HOST:
+		memcpy(&ace->cmd_ack, ack, len);
+		complete(&ace->cmd_completion);
+		break;
+	default:
+		break;
+	}
+}
+
+/* callback for receive */
+static void mei_ace_rx(struct mei_cl_device *cldev)
+{
+	struct mei_ace *ace = mei_cldev_get_drvdata(cldev);
+	struct ace_notif event;
+	union ace_notif_hdr *hdr = &event.hdr;
+	int ret;
+
+	ret = mei_cldev_recv(cldev, (u8 *)&event, sizeof(event));
+	if (ret < 0) {
+		dev_err(&cldev->dev, "recv error: %d\n", ret);
+		return;
+	}
+
+	if (hdr->event.ack) {
+		handle_command_ack(ace, &event, ret);
+		return;
+	}
+
+	switch (hdr->event.event_type) {
+	case ACE_CMD_RESPONSE:
+		handle_command_response(ace, &event, ret);
+		break;
+	case ACE_FW_READY:
+		/*
+		 * firmware ready notification sent to driver
+		 * after HECI client connected with firmware.
+		 */
+		dev_dbg(&cldev->dev, "firmware ready\n");
+		break;
+	default:
+		break;
+	}
+}
+
+static int mei_ace_setup_dev_link(struct mei_ace *ace)
+{
+	struct device *dev = &ace->cldev->dev;
+	uuid_le uuid = MEI_CSI_UUID;
+	struct acpi_device *adev;
+	struct device *csi_dev;
+	char name[64];
+
+	snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev->parent), &uuid);
+
+	csi_dev = device_find_child_by_name(dev->parent, name);
+	if (!csi_dev)
+		return -EPROBE_DEFER;
+
+	/* sensor's ACPI _DEP is mei bus device */
+	adev = acpi_dev_get_next_consumer_dev(ACPI_COMPANION(dev->parent),
+					      NULL);
+	if (!adev)
+		return -EPROBE_DEFER;
+
+	/* setup link between mei_ace and mei_csi */
+	ace->csi_link = device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
+					DL_FLAG_RPM_ACTIVE);
+	if (!ace->csi_link) {
+		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
+		return -EINVAL;
+	}
+
+	/* setup link between mei_ace and sensor */
+	ace->sensor_link = device_link_add(&adev->dev, dev, DL_FLAG_PM_RUNTIME |
+					   DL_FLAG_RPM_ACTIVE);
+	if (!ace->sensor_link) {
+		dev_err(dev, "failed to link to %s\n", dev_name(&adev->dev));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mei_ace_probe(struct mei_cl_device *cldev,
+			 const struct mei_cl_device_id *id)
+{
+	struct device *dev = &cldev->dev;
+	struct mei_ace *ace;
+	int ret;
+
+	ace = devm_kzalloc(dev, sizeof(struct mei_ace), GFP_KERNEL);
+	if (!ace)
+		return -ENOMEM;
+
+	ace->cldev = cldev;
+
+	ret = mei_ace_setup_dev_link(ace);
+	if (ret)
+		return ret;
+
+	mutex_init(&ace->lock);
+	init_completion(&ace->cmd_completion);
+
+	mei_cldev_set_drvdata(cldev, ace);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_err(dev, "mei_cldev_enable failed: %d\n", ret);
+		goto destroy_mutex;
+	}
+
+	ret = mei_cldev_register_rx_cb(cldev, mei_ace_rx);
+	if (ret) {
+		dev_err(dev, "event cb registration failed: %d\n", ret);
+		goto err_disable;
+	}
+
+	ret = ace_get_firmware_id(ace);
+	if (ret) {
+		dev_err(dev, "get firmware id failed: %d\n", ret);
+		goto err_disable;
+	}
+
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+	} else {
+		ret = ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_HOST);
+		if (ret) {
+			dev_err(dev, "switch camera to host failed: %d\n", ret);
+			goto err_disable;
+		}
+	}
+
+	acpi_dev_clear_dependencies(ACPI_COMPANION(dev->parent));
+
+	return 0;
+
+err_disable:
+	mei_cldev_disable(cldev);
+
+destroy_mutex:
+	mutex_destroy(&ace->lock);
+
+	device_link_del(ace->csi_link);
+	device_link_del(ace->sensor_link);
+
+	return ret;
+}
+
+static void mei_ace_remove(struct mei_cl_device *cldev)
+{
+	struct mei_ace *ace = mei_cldev_get_drvdata(cldev);
+
+	device_link_del(ace->csi_link);
+	device_link_del(ace->sensor_link);
+
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_disable(&cldev->dev);
+		pm_runtime_set_suspended(&cldev->dev);
+	} else {
+		ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_IVSC);
+	}
+
+	mutex_destroy(&ace->lock);
+}
+
+static int __maybe_unused mei_ace_runtime_suspend(struct device *dev)
+{
+	struct mei_ace *ace = dev_get_drvdata(dev);
+
+	return ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_IVSC);
+}
+
+static int __maybe_unused mei_ace_runtime_resume(struct device *dev)
+{
+	struct mei_ace *ace = dev_get_drvdata(dev);
+
+	return ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_HOST);
+}
+
+static const struct dev_pm_ops mei_ace_pm_ops = {
+	SET_RUNTIME_PM_OPS(mei_ace_runtime_suspend,
+			   mei_ace_runtime_resume, NULL)
+};
+
+#define MEI_ACE_UUID UUID_LE(0x5DB76CF6, 0x0A68, 0x4ED6, \
+			     0x9B, 0x78, 0x03, 0x61, 0x63, 0x5E, 0x24, 0x47)
+
+static const struct mei_cl_device_id mei_ace_tbl[] = {
+	{ MEI_ACE_DRIVER_NAME, MEI_ACE_UUID, MEI_CL_VERSION_ANY },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(mei, mei_ace_tbl);
+
+static struct mei_cl_driver mei_ace_driver = {
+	.id_table = mei_ace_tbl,
+	.name = MEI_ACE_DRIVER_NAME,
+
+	.probe = mei_ace_probe,
+	.remove = mei_ace_remove,
+
+	.driver = {
+		.pm = &mei_ace_pm_ops,
+	},
+};
+
+module_mei_cl_driver(mei_ace_driver);
+
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_DESCRIPTION("Device driver for IVSC ACE");
+MODULE_LICENSE("GPL");
-- 
2.7.4

