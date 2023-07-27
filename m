Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E8B76481B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjG0HMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbjG0HLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:11:43 -0400
Received: from mgamail.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A45459C7
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690441582; x=1721977582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZyoVzA4YK4nFA/mBMBIEpNdZh3xZ5MNNwfoIXeRuaOo=;
  b=CwLqRno2skMx16dMVV3b+433pEHYdUo2J1VIGRZNcuuEyCXNtL8r3s+X
   z18j/Kl+4olYYxAE/J/9WjsBrWtwUDxCrkCiUIuwDevf3AHSNPdc8ovOU
   qZKQjPdbqHhgcPz0lhWyT2aQ1NHENrWFWSWJt6GHagFozGKS+diUw3zdL
   aFwGv8eE9JxmwT41CEyJqbA4Ex6Mcww21sSmV7EdyGY/u4+BbVjqH6d5K
   Om77VTQIOeK0SDkeTT6b6q844K9t0SYxv1uXU2a6Ba4/QUZSvv3Q3vfQm
   Ib/flo162ji0TfpF+t8trY9lfE6k2/THg9oCeBWZDOq5MXY2577EqCzeh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370900928"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370900928"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704073119"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704073119"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 00:04:44 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH 10/15] media: intel/ipu6: add input system driver
Date:   Thu, 27 Jul 2023 15:15:53 +0800
Message-Id: <20230727071558.1148653-11-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727071558.1148653-1-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Input system driver do basic isys hardware setup and irq handling
and work with fwnode and v4l2 to register the ISYS v4l2 devices.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 1348 ++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h |  188 +++
 2 files changed, 1536 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
new file mode 100644
index 000000000000..c5db58f12c93
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -0,0 +1,1348 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-cpd.h"
+#include "ipu6-dma.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-isys-phy.h"
+#include "ipu6-isys-video.h"
+#include "ipu6-mmu.h"
+#include "ipu6-platform.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+#include "ipu6-platform-regs.h"
+
+#define IPU6_BUTTRESS_FABIC_CONTROL		0x68
+#define GDA_ENABLE_IWAKE_INDEX			2
+#define GDA_IWAKE_THRESHOLD_INDEX		1
+#define GDA_IRQ_CRITICAL_THRESHOLD_INDEX	0
+#define GDA_MEMOPEN_THRESHOLD_INDEX		3
+#define DEFAULT_DID_RATIO			90
+#define DEFAULT_IWAKE_THRESHOLD			0x42
+#define DEFAULT_MEM_OPEN_TIME			10
+#define ONE_THOUSAND_MICROSECOND		1000
+/* One page is 2KB, 8 x 16 x 16 = 2048B = 2KB */
+#define ISF_DMA_TOP_GDA_PROFERTY_PAGE_SIZE	0x800
+
+/* LTR & DID value are 10 bit at most */
+#define LTR_DID_VAL_MAX		1023
+#define LTR_DEFAULT_VALUE	0x70503C19
+#define FILL_TIME_DEFAULT_VALUE 0xFFF0783C
+#define LTR_DID_PKGC_2R		20
+#define LTR_SCALE_DEFAULT	5
+#define LTR_SCALE_1024NS	2
+#define DID_SCALE_1US		2
+#define DID_SCALE_32US		3
+#define REG_PKGC_PMON_CFG	0xB00
+
+#define VAL_PKGC_PMON_CFG_RESET 0x38
+#define VAL_PKGC_PMON_CFG_START 0x7
+
+#define IS_PIXEL_BUFFER_PAGES		0x80
+/* when iwake mode is disabled, the critical threshold is statically set to 75%
+ * of the IS pixel buffer criticalThreshold = (128 * 3) / 4
+ */
+#define CRITICAL_THRESHOLD_IWAKE_DISABLE	(IS_PIXEL_BUFFER_PAGES * 3 / 4)
+
+union fabric_ctrl {
+	struct {
+		u16 ltr_val   : 10;
+		u16 ltr_scale : 3;
+		u16 reserved  : 3;
+		u16 did_val   : 10;
+		u16 did_scale : 3;
+		u16 reserved2 : 1;
+		u16 keep_power_in_D0   : 1;
+		u16 keep_power_override : 1;
+	} bits;
+	u32 value;
+};
+
+enum ltr_did_type {
+	LTR_IWAKE_ON,
+	LTR_IWAKE_OFF,
+	LTR_ISYS_ON,
+	LTR_ISYS_OFF,
+	LTR_ENHANNCE_IWAKE,
+	LTR_TYPE_MAX
+};
+
+#define ISYS_PM_QOS_VALUE	300
+
+static int
+isys_complete_ext_device_registration(struct ipu6_isys *isys,
+				      struct v4l2_subdev *sd,
+				      struct ipu6_isys_csi2_config *csi2)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		if (sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
+			break;
+	}
+
+	if (i == sd->entity.num_pads) {
+		dev_warn(dev, "no src pad in external entity\n");
+		ret = -ENOENT;
+		goto unregister_subdev;
+	}
+
+	ret = media_create_pad_link(&sd->entity, i,
+				    &isys->csi2[csi2->port].asd.sd.entity,
+				    0, 0);
+	if (ret) {
+		dev_warn(dev, "can't create link\n");
+		goto unregister_subdev;
+	}
+
+	isys->csi2[csi2->port].nlanes = csi2->nlanes;
+
+	return 0;
+
+unregister_subdev:
+	v4l2_device_unregister_subdev(sd);
+
+	return ret;
+}
+
+static void isys_stream_init(struct ipu6_isys *isys)
+{
+	u32 i;
+
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
+		mutex_init(&isys->streams[i].mutex);
+		init_completion(&isys->streams[i].stream_open_completion);
+		init_completion(&isys->streams[i].stream_close_completion);
+		init_completion(&isys->streams[i].stream_start_completion);
+		init_completion(&isys->streams[i].stream_stop_completion);
+		INIT_LIST_HEAD(&isys->streams[i].queues);
+		isys->streams[i].isys = isys;
+		isys->streams[i].stream_handle = i;
+		isys->streams[i].vc = INVALID_VC_ID;
+	}
+}
+
+static void isys_csi2_unregister_subdevices(struct ipu6_isys *isys)
+{
+	const struct ipu6_isys_internal_csi2_pdata *csi2 =
+		&isys->pdata->ipdata->csi2;
+	unsigned int i;
+
+	for (i = 0; i < csi2->nports; i++)
+		ipu6_isys_csi2_cleanup(&isys->csi2[i]);
+}
+
+static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
+{
+	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
+		&isys->pdata->ipdata->csi2;
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int i;
+	int ret;
+
+	isys->csi2 = devm_kcalloc(dev, csi2_pdata->nports,
+				  sizeof(*isys->csi2), GFP_KERNEL);
+	if (!isys->csi2) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	for (i = 0; i < csi2_pdata->nports; i++) {
+		ret = ipu6_isys_csi2_init(&isys->csi2[i], isys,
+					  isys->pdata->base +
+					  csi2_pdata->offsets[i], i);
+		if (ret)
+			goto fail;
+
+		isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
+	}
+
+	return 0;
+
+fail:
+	while (i--)
+		ipu6_isys_csi2_cleanup(&isys->csi2[i]);
+
+	return ret;
+}
+
+static int isys_csi2_create_media_links(struct ipu6_isys *isys)
+{
+	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
+		&isys->pdata->ipdata->csi2;
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int i, j, k;
+	int ret;
+
+	for (i = 0; i < csi2_pdata->nports; i++) {
+		struct media_entity *sd = &isys->csi2[i].asd.sd.entity;
+
+		for (j = 0; j < NR_OF_VIDEO_DEVICE; j++) {
+			struct media_entity *v = &isys->av[j].vdev.entity;
+			u32 flag = MEDIA_LNK_FL_DYNAMIC;
+
+			for (k = CSI2_PAD_SRC; k < NR_OF_CSI2_PADS; k++) {
+				ret = media_create_pad_link(sd, k, v, 0, flag);
+				if (ret) {
+					dev_err(dev, "CSI2 can't create link\n");
+					return ret;
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void isys_unregister_video_devices(struct ipu6_isys *isys)
+{
+	unsigned int i;
+
+	for (i = 0; i < NR_OF_VIDEO_DEVICE; i++)
+		ipu6_isys_video_cleanup(&isys->av[i]);
+}
+
+static int isys_register_video_devices(struct ipu6_isys *isys)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < NR_OF_VIDEO_DEVICE; i++) {
+		snprintf(isys->av[i].vdev.name, sizeof(isys->av[i].vdev.name),
+			 IPU6_ISYS_ENTITY_PREFIX " ISYS Capture %u", i);
+		isys->av[i].isys = isys;
+		isys->av[i].aq.buf_prepare = ipu6_isys_buf_prepare;
+		isys->av[i].aq.fill_frame_buf_set =
+			ipu6_isys_buf_to_fw_frame_buf_pin;
+		isys->av[i].aq.link_fmt_validate = ipu6_isys_link_fmt_validate;
+		isys->av[i].aq.vbq.buf_struct_size =
+			sizeof(struct ipu6_isys_video_buffer);
+		isys->av[i].pfmt = &ipu6_isys_pfmts[0];
+
+		ret = ipu6_isys_video_init(&isys->av[i]);
+		if (ret)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	while (i--)
+		ipu6_isys_video_cleanup(&isys->av[i]);
+
+	return ret;
+}
+
+void isys_setup_hw(struct ipu6_isys *isys)
+{
+	void __iomem *base = isys->pdata->base;
+	const u8 *thd = isys->pdata->ipdata->hw_variant.cdc_fifo_threshold;
+	u32 irqs = 0;
+	unsigned int i, nports;
+
+	nports = isys->pdata->ipdata->csi2.nports;
+
+	/* Enable irqs for all MIPI ports */
+	for (i = 0; i < nports; i++)
+		irqs |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
+
+	writel(irqs, base + isys->pdata->ipdata->csi2.ctrl0_irq_edge);
+	writel(irqs, base + isys->pdata->ipdata->csi2.ctrl0_irq_lnp);
+	writel(irqs, base + isys->pdata->ipdata->csi2.ctrl0_irq_mask);
+	writel(irqs, base + isys->pdata->ipdata->csi2.ctrl0_irq_enable);
+	writel(GENMASK(19, 0),
+	       base + isys->pdata->ipdata->csi2.ctrl0_irq_clear);
+
+	irqs = ISYS_UNISPART_IRQS;
+	writel(irqs, base + IPU6_REG_ISYS_UNISPART_IRQ_EDGE);
+	writel(irqs, base + IPU6_REG_ISYS_UNISPART_IRQ_LEVEL_NOT_PULSE);
+	writel(GENMASK(28, 0), base + IPU6_REG_ISYS_UNISPART_IRQ_CLEAR);
+	writel(irqs, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+	writel(irqs, base + IPU6_REG_ISYS_UNISPART_IRQ_ENABLE);
+
+	writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
+	writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_MUX_REG);
+
+	/* Write CDC FIFO threshold values for isys */
+	for (i = 0; i < isys->pdata->ipdata->hw_variant.cdc_fifos; i++)
+		writel(thd[i], base + IPU6_REG_ISYS_CDC_THRESHOLD(i));
+}
+
+static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys_stream *stream;
+	unsigned int i;
+	u32 status;
+	int source;
+
+	ipu6_isys_register_errors(csi2);
+
+	status = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+		       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
+
+	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+
+	source = csi2->asd.source;
+	for (i = 0; i < NR_OF_CSI2_VC; i++) {
+		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
+			stream = ipu6_isys_query_stream_by_source(csi2->isys,
+								  source, i);
+			if (stream) {
+				ipu6_isys_csi2_sof_event_by_stream(stream);
+				ipu6_isys_put_stream(stream);
+			}
+		}
+
+		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
+			stream = ipu6_isys_query_stream_by_source(csi2->isys,
+								  source, i);
+			if (stream) {
+				ipu6_isys_csi2_eof_event_by_stream(stream);
+				ipu6_isys_put_stream(stream);
+			}
+		}
+	}
+}
+
+irqreturn_t isys_isr(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	void __iomem *base = isys->pdata->base;
+	u32 status_sw, status_csi;
+	u32 ctrl0_status, ctrl0_clear;
+
+	spin_lock(&isys->power_lock);
+	if (!isys->power) {
+		spin_unlock(&isys->power_lock);
+		return IRQ_NONE;
+	}
+
+	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
+	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
+
+	status_csi = readl(isys->pdata->base + ctrl0_status);
+	status_sw = readl(isys->pdata->base +
+			  IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
+
+	writel(ISYS_UNISPART_IRQS & ~IPU6_ISYS_UNISPART_IRQ_SW,
+	       base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+
+	do {
+		writel(status_csi, isys->pdata->base + ctrl0_clear);
+
+		writel(status_sw, isys->pdata->base +
+		       IPU6_REG_ISYS_UNISPART_IRQ_CLEAR);
+
+		if (isys->isr_csi2_bits & status_csi) {
+			unsigned int i;
+
+			for (i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+				/* irq from not enabled port */
+				if (!isys->csi2[i].base)
+					continue;
+				if (status_csi & IPU6_ISYS_UNISPART_IRQ_CSI2(i))
+					ipu6_isys_csi2_isr(&isys->csi2[i]);
+			}
+		}
+
+		writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
+
+		if (!isys_isr_one(adev))
+			status_sw = IPU6_ISYS_UNISPART_IRQ_SW;
+		else
+			status_sw = 0;
+
+		status_csi = readl(isys->pdata->base + ctrl0_status);
+		status_sw |= readl(isys->pdata->base +
+				   IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
+	} while ((status_csi & isys->isr_csi2_bits) ||
+		 (status_sw & IPU6_ISYS_UNISPART_IRQ_SW));
+
+	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+
+	spin_unlock(&isys->power_lock);
+
+	return IRQ_HANDLED;
+}
+
+static void get_lut_ltrdid(struct ipu6_isys *isys, struct ltr_did *pltr_did)
+{
+	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
+	struct ltr_did ltrdid_default;
+
+	ltrdid_default.lut_ltr.value = LTR_DEFAULT_VALUE;
+	ltrdid_default.lut_fill_time.value = FILL_TIME_DEFAULT_VALUE;
+
+	if (iwake_watermark->ltrdid.lut_ltr.value)
+		*pltr_did = iwake_watermark->ltrdid;
+	else
+		*pltr_did = ltrdid_default;
+}
+
+static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 req_id = index;
+	u32 offset = 0;
+	int ret = 0;
+
+	ret = ipu6_fw_isys_send_proxy_token(isys, req_id, index, offset, value);
+	if (ret)
+		dev_err(dev, "write %d failed %d", index, ret);
+
+	return ret;
+}
+
+/*
+ * When input system is powered up and before enabling any new sensor capture,
+ * or after disabling any sensor capture the following values need to be set:
+ * LTR_value = LTR(usec) from calculation;
+ * LTR_scale = 2;
+ * DID_value = DID(usec) from calculation;
+ * DID_scale = 2;
+ *
+ * When input system is powered down, the LTR and DID values
+ * must be returned to the default values:
+ * LTR_value = 1023;
+ * LTR_scale = 5;
+ * DID_value = 1023;
+ * DID_scale = 2;
+ */
+static void set_iwake_ltrdid(struct ipu6_isys *isys, u16 ltr, u16 did,
+			     enum ltr_did_type use)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	u16 ltr_val, ltr_scale = LTR_SCALE_1024NS;
+	u16 did_val, did_scale = DID_SCALE_1US;
+	struct ipu6_device *isp = isys->adev->isp;
+	union fabric_ctrl fc;
+
+	switch (use) {
+	case LTR_IWAKE_ON:
+		ltr_val = min_t(u16, ltr, (u16)LTR_DID_VAL_MAX);
+		did_val = min_t(u16, did, (u16)LTR_DID_VAL_MAX);
+		ltr_scale = (ltr == LTR_DID_VAL_MAX &&
+			     did == LTR_DID_VAL_MAX) ?
+			LTR_SCALE_DEFAULT : LTR_SCALE_1024NS;
+		break;
+	case LTR_ISYS_ON:
+	case LTR_IWAKE_OFF:
+		ltr_val = LTR_DID_PKGC_2R;
+		did_val = LTR_DID_PKGC_2R;
+		break;
+	case LTR_ISYS_OFF:
+		ltr_val   = LTR_DID_VAL_MAX;
+		did_val   = LTR_DID_VAL_MAX;
+		ltr_scale = LTR_SCALE_DEFAULT;
+		break;
+	case LTR_ENHANNCE_IWAKE:
+		if (ltr == LTR_DID_VAL_MAX && did == LTR_DID_VAL_MAX) {
+			ltr_val = LTR_DID_VAL_MAX;
+			did_val = LTR_DID_VAL_MAX;
+			ltr_scale = LTR_SCALE_DEFAULT;
+		} else if (did < ONE_THOUSAND_MICROSECOND) {
+			ltr_val = ltr;
+			did_val = did;
+		} else {
+			ltr_val = ltr;
+			/* div 90% value by 32 to account for scale change */
+			did_val = did / 32;
+			did_scale = DID_SCALE_32US;
+		}
+		break;
+	default:
+		ltr_val   = LTR_DID_VAL_MAX;
+		did_val   = LTR_DID_VAL_MAX;
+		ltr_scale = LTR_SCALE_DEFAULT;
+		break;
+	}
+
+	fc.value = readl(isp->base + IPU6_BUTTRESS_FABIC_CONTROL);
+	fc.bits.ltr_val = ltr_val;
+	fc.bits.ltr_scale = ltr_scale;
+	fc.bits.did_val = did_val;
+	fc.bits.did_scale = did_scale;
+
+	dev_dbg(dev, "ltr: value %u scale %u, did: value %u scale %u\n",
+		ltr_val, ltr_scale, did_val, did_scale);
+	writel(fc.value, isp->base + IPU6_BUTTRESS_FABIC_CONTROL);
+}
+
+/*
+ * Driver may clear register GDA_ENABLE_IWAKE before FW configures the
+ * stream for debug purpose. Otherwise driver should not access this register.
+ */
+static void enable_iwake(struct ipu6_isys *isys, bool enable)
+{
+	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
+	int ret;
+
+	mutex_lock(&iwake_watermark->mutex);
+
+	if (iwake_watermark->iwake_enabled == enable) {
+		mutex_unlock(&iwake_watermark->mutex);
+		return;
+	}
+
+	ret = set_iwake_register(isys, GDA_ENABLE_IWAKE_INDEX, enable);
+	if (!ret)
+		iwake_watermark->iwake_enabled = enable;
+
+	mutex_unlock(&iwake_watermark->mutex);
+}
+
+void update_watermark_setting(struct ipu6_isys *isys)
+{
+	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
+	u32 iwake_threshold, iwake_critical_threshold, page_num;
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 calc_fill_time_us = 0, ltr = 0, did = 0;
+	struct video_stream_watermark *p_watermark;
+	enum ltr_did_type ltr_did_type;
+	struct list_head *stream_node;
+	u64 isys_pb_datarate_mbs = 0;
+	u32 mem_open_threshold = 0;
+	struct ltr_did ltrdid;
+	u64 threshold_bytes;
+	u32 max_sram_size;
+	u32 shift;
+
+	shift = isys->pdata->ipdata->sram_gran_shift;
+	max_sram_size = isys->pdata->ipdata->max_sram_size;
+
+	mutex_lock(&iwake_watermark->mutex);
+	if (iwake_watermark->force_iwake_disable) {
+		set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
+		set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+				   CRITICAL_THRESHOLD_IWAKE_DISABLE);
+		goto unlock_exit;
+	}
+
+	if (list_empty(&iwake_watermark->video_list)) {
+		isys_pb_datarate_mbs = 0;
+	} else {
+		list_for_each(stream_node, &iwake_watermark->video_list) {
+			p_watermark = list_entry(stream_node,
+						 struct video_stream_watermark,
+						 stream_node);
+			isys_pb_datarate_mbs += p_watermark->stream_data_rate;
+		}
+	}
+	mutex_unlock(&iwake_watermark->mutex);
+
+	if (!isys_pb_datarate_mbs) {
+		enable_iwake(isys, false);
+		set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
+		mutex_lock(&iwake_watermark->mutex);
+		set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+				   CRITICAL_THRESHOLD_IWAKE_DISABLE);
+		goto unlock_exit;
+	}
+
+	enable_iwake(isys, true);
+	calc_fill_time_us = max_sram_size / isys_pb_datarate_mbs;
+
+	if (isys->pdata->ipdata->enhanced_iwake) {
+		ltr = isys->pdata->ipdata->ltr;
+		did = calc_fill_time_us * DEFAULT_DID_RATIO / 100;
+		ltr_did_type = LTR_ENHANNCE_IWAKE;
+	} else {
+		get_lut_ltrdid(isys, &ltrdid);
+
+		if (calc_fill_time_us <= ltrdid.lut_fill_time.bits.th0)
+			ltr = 0;
+		else if (calc_fill_time_us <= ltrdid.lut_fill_time.bits.th1)
+			ltr = ltrdid.lut_ltr.bits.val0;
+		else if (calc_fill_time_us <= ltrdid.lut_fill_time.bits.th2)
+			ltr = ltrdid.lut_ltr.bits.val1;
+		else if (calc_fill_time_us <= ltrdid.lut_fill_time.bits.th3)
+			ltr = ltrdid.lut_ltr.bits.val2;
+		else
+			ltr = ltrdid.lut_ltr.bits.val3;
+
+		did = calc_fill_time_us - ltr;
+		ltr_did_type = LTR_IWAKE_ON;
+	}
+
+	set_iwake_ltrdid(isys, ltr, did, ltr_did_type);
+
+	/* calculate iwake threshold with 2KB granularity pages */
+	threshold_bytes = did * isys_pb_datarate_mbs;
+	iwake_threshold = max_t(u32, 1, threshold_bytes >> shift);
+	iwake_threshold = min_t(u32, iwake_threshold, max_sram_size);
+
+	mutex_lock(&iwake_watermark->mutex);
+	if (isys->pdata->ipdata->enhanced_iwake) {
+		set_iwake_register(isys, GDA_IWAKE_THRESHOLD_INDEX,
+				   DEFAULT_IWAKE_THRESHOLD);
+		/* calculate number of pages that will be filled in 10 usec */
+		page_num = (DEFAULT_MEM_OPEN_TIME * isys_pb_datarate_mbs) /
+			ISF_DMA_TOP_GDA_PROFERTY_PAGE_SIZE;
+		page_num += ((DEFAULT_MEM_OPEN_TIME * isys_pb_datarate_mbs) %
+			     ISF_DMA_TOP_GDA_PROFERTY_PAGE_SIZE) ? 1 : 0;
+		mem_open_threshold = isys->pdata->ipdata->memopen_threshold;
+		mem_open_threshold = max_t(u32, mem_open_threshold, page_num);
+		dev_dbg(dev, "mem_open_threshold: %u\n", mem_open_threshold);
+		set_iwake_register(isys, GDA_MEMOPEN_THRESHOLD_INDEX,
+				   mem_open_threshold);
+	} else {
+		set_iwake_register(isys, GDA_IWAKE_THRESHOLD_INDEX,
+				   iwake_threshold);
+	}
+
+	iwake_critical_threshold = iwake_threshold +
+		(IS_PIXEL_BUFFER_PAGES - iwake_threshold) / 2;
+
+	dev_dbg(dev, "threshold: %u critical: %u\n", iwake_threshold,
+		iwake_critical_threshold);
+
+	set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
+			   iwake_critical_threshold);
+
+	writel(VAL_PKGC_PMON_CFG_RESET,
+	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
+	writel(VAL_PKGC_PMON_CFG_START,
+	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
+unlock_exit:
+	mutex_unlock(&iwake_watermark->mutex);
+}
+
+static int isys_iwake_watermark_init(struct ipu6_isys *isys)
+{
+	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
+
+	INIT_LIST_HEAD(&iwake_watermark->video_list);
+	mutex_init(&iwake_watermark->mutex);
+
+	iwake_watermark->ltrdid.lut_ltr.value = 0;
+	iwake_watermark->isys = isys;
+	iwake_watermark->iwake_enabled = false;
+	iwake_watermark->force_iwake_disable = false;
+
+	return 0;
+}
+
+static int isys_iwake_watermark_cleanup(struct ipu6_isys *isys)
+{
+	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
+
+	mutex_lock(&iwake_watermark->mutex);
+	list_del(&iwake_watermark->video_list);
+	mutex_unlock(&iwake_watermark->mutex);
+
+	mutex_destroy(&iwake_watermark->mutex);
+
+	return 0;
+}
+
+/* The .bound() notifier callback when a match is found */
+static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *sd,
+			       struct v4l2_async_subdev *asd)
+{
+	struct ipu6_isys *isys =
+		container_of(notifier, struct ipu6_isys, notifier);
+	struct sensor_async_subdev *s_asd =
+		container_of(asd, struct sensor_async_subdev, asd);
+
+	dev_dbg(&isys->adev->auxdev.dev, "bind %s nlanes is %d port is %d\n",
+		sd->name, s_asd->csi2.nlanes, s_asd->csi2.port);
+	isys_complete_ext_device_registration(isys, sd, &s_asd->csi2);
+
+	return v4l2_device_register_subdev_nodes(&isys->v4l2_dev);
+}
+
+static int isys_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct ipu6_isys *isys =
+		container_of(notifier, struct ipu6_isys, notifier);
+
+	return v4l2_device_register_subdev_nodes(&isys->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations isys_async_ops = {
+	.bound = isys_notifier_bound,
+	.complete = isys_notifier_complete,
+};
+
+static int isys_fwnode_parse(struct device *dev,
+			     struct v4l2_fwnode_endpoint *vep,
+			     struct v4l2_async_subdev *asd)
+{
+	struct sensor_async_subdev *s_asd =
+		container_of(asd, struct sensor_async_subdev, asd);
+
+	s_asd->csi2.port = vep->base.port;
+	s_asd->csi2.nlanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	return 0;
+}
+
+static int isys_notifier_init(struct ipu6_isys *isys)
+{
+	size_t asd_struct_size = sizeof(struct sensor_async_subdev);
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu6_device *isp = isys->adev->isp;
+	int ret;
+
+	v4l2_async_nf_init(&isys->notifier);
+	ret = v4l2_async_nf_parse_fwnode_endpoints(&isp->pdev->dev,
+						   &isys->notifier,
+						   asd_struct_size,
+						   isys_fwnode_parse);
+	if (ret < 0) {
+		dev_err(dev, "parse fwnode endpoints failed: %d\n", ret);
+		return ret;
+	}
+
+	if (list_empty(&isys->notifier.asd_list)) {
+		/* isys probe could continue with async subdevs missing */
+		dev_warn(dev, "no subdev found in graph\n");
+		return 0;
+	}
+
+	isys->notifier.ops = &isys_async_ops;
+	ret = v4l2_async_nf_register(&isys->v4l2_dev, &isys->notifier);
+	if (ret) {
+		dev_err(dev, "failed to register async notifier : %d\n", ret);
+		v4l2_async_nf_cleanup(&isys->notifier);
+	}
+
+	return ret;
+}
+
+static void isys_notifier_cleanup(struct ipu6_isys *isys)
+{
+	v4l2_async_nf_unregister(&isys->notifier);
+	v4l2_async_nf_cleanup(&isys->notifier);
+}
+
+static int isys_register_devices(struct ipu6_isys *isys)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct pci_dev *pdev = isys->adev->isp->pdev;
+	int ret;
+
+	isys->media_dev.dev = dev;
+	media_device_pci_init(&isys->media_dev,
+			      pdev, IPU6_MEDIA_DEV_MODEL_NAME);
+
+	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
+		sizeof(isys->v4l2_dev.name));
+
+	ret = media_device_register(&isys->media_dev);
+	if (ret < 0)
+		goto out_media_device_unregister;
+
+	isys->v4l2_dev.mdev = &isys->media_dev;
+	isys->v4l2_dev.ctrl_handler = NULL;
+
+	ret = v4l2_device_register(dev->parent, &isys->v4l2_dev);
+	if (ret < 0)
+		goto out_media_device_unregister;
+
+	ret = isys_register_video_devices(isys);
+	if (ret)
+		goto out_v4l2_device_unregister;
+
+	ret = isys_csi2_register_subdevices(isys);
+	if (ret)
+		goto out_isys_unregister_video_device;
+
+	ret = isys_csi2_create_media_links(isys);
+	if (ret)
+		goto out_isys_unregister_subdevices;
+
+	ret = isys_notifier_init(isys);
+	if (ret)
+		goto out_isys_unregister_subdevices;
+
+	return 0;
+
+out_isys_unregister_subdevices:
+	isys_csi2_unregister_subdevices(isys);
+
+out_isys_unregister_video_device:
+	isys_unregister_video_devices(isys);
+
+out_v4l2_device_unregister:
+	v4l2_device_unregister(&isys->v4l2_dev);
+
+out_media_device_unregister:
+	media_device_unregister(&isys->media_dev);
+	media_device_cleanup(&isys->media_dev);
+
+	dev_err(dev, "failed to register isys devices\n");
+
+	return ret;
+}
+
+static void isys_unregister_devices(struct ipu6_isys *isys)
+{
+	isys_unregister_video_devices(isys);
+	isys_csi2_unregister_subdevices(isys);
+	v4l2_device_unregister(&isys->v4l2_dev);
+	media_device_unregister(&isys->media_dev);
+	media_device_cleanup(&isys->media_dev);
+}
+
+static int isys_runtime_pm_resume(struct device *dev)
+{
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu6_device *isp = adev->isp;
+	unsigned long flags;
+	int ret;
+
+	if (!isys)
+		return 0;
+
+	ret = ipu6_mmu_hw_init(adev->mmu);
+	if (ret)
+		return ret;
+
+	cpu_latency_qos_update_request(&isys->pm_qos, ISYS_PM_QOS_VALUE);
+
+	ret = ipu6_buttress_start_tsc_sync(isp);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&isys->power_lock, flags);
+	isys->power = 1;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+
+	isys_setup_hw(isys);
+
+	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
+
+	return 0;
+}
+
+static int isys_runtime_pm_suspend(struct device *dev)
+{
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
+	struct ipu6_isys *isys;
+	unsigned long flags;
+
+	isys = dev_get_drvdata(dev);
+	if (!isys)
+		return 0;
+
+	spin_lock_irqsave(&isys->power_lock, flags);
+	isys->power = 0;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+
+	mutex_lock(&isys->mutex);
+	isys->need_reset = false;
+	mutex_unlock(&isys->mutex);
+
+	isys->phy_termcal_val = 0;
+	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
+
+	ipu6_mmu_hw_cleanup(adev->mmu);
+
+	return 0;
+}
+
+static int isys_suspend(struct device *dev)
+{
+	struct ipu6_isys *isys = dev_get_drvdata(dev);
+
+	/* If stream is open, refuse to suspend */
+	if (isys->stream_opened)
+		return -EBUSY;
+
+	return 0;
+}
+
+static int isys_resume(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops isys_pm_ops = {
+	.runtime_suspend = isys_runtime_pm_suspend,
+	.runtime_resume = isys_runtime_pm_resume,
+	.suspend = isys_suspend,
+	.resume = isys_resume,
+};
+
+static void isys_remove(struct auxiliary_device *auxdev)
+{
+	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
+	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
+	struct ipu6_device *isp = adev->isp;
+	struct isys_fw_msgs *fwmsg, *safe;
+	unsigned int i;
+
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
+		mutex_destroy(&isys->streams[i].mutex);
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
+		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
+			       fwmsg, fwmsg->dma_addr, 0);
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
+		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
+			       fwmsg, fwmsg->dma_addr, 0);
+
+	isys_iwake_watermark_cleanup(isys);
+	isys_notifier_cleanup(isys);
+	isys_unregister_devices(isys);
+
+	cpu_latency_qos_remove_request(&isys->pm_qos);
+
+	if (!isp->secure_mode) {
+		ipu6_cpd_free_pkg_dir(adev);
+		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+		release_firmware(adev->fw);
+	}
+
+	mutex_destroy(&isys->stream_mutex);
+	mutex_destroy(&isys->mutex);
+}
+
+static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct isys_fw_msgs *addr;
+	dma_addr_t dma_addr;
+	unsigned long flags;
+	unsigned int i;
+
+	for (i = 0; i < amount; i++) {
+		addr = dma_alloc_attrs(dev, sizeof(struct isys_fw_msgs),
+				       &dma_addr, GFP_KERNEL, 0);
+		if (!addr)
+			break;
+		addr->dma_addr = dma_addr;
+
+		spin_lock_irqsave(&isys->listlock, flags);
+		list_add(&addr->head, &isys->framebuflist);
+		spin_unlock_irqrestore(&isys->listlock, flags);
+	}
+
+	if (i == amount)
+		return 0;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	while (!list_empty(&isys->framebuflist)) {
+		addr = list_first_entry(&isys->framebuflist,
+					struct isys_fw_msgs, head);
+		list_del(&addr->head);
+		spin_unlock_irqrestore(&isys->listlock, flags);
+		dma_free_attrs(dev, sizeof(struct isys_fw_msgs), addr,
+			       addr->dma_addr, 0);
+		spin_lock_irqsave(&isys->listlock, flags);
+	}
+	spin_unlock_irqrestore(&isys->listlock, flags);
+
+	return -ENOMEM;
+}
+
+struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream)
+{
+	struct ipu6_isys *isys = stream->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct isys_fw_msgs *msg;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	if (list_empty(&isys->framebuflist)) {
+		spin_unlock_irqrestore(&isys->listlock, flags);
+		dev_dbg(dev, "Frame list empty\n");
+
+		ret = alloc_fw_msg_bufs(isys, 5);
+		if (ret < 0)
+			return NULL;
+
+		spin_lock_irqsave(&isys->listlock, flags);
+		if (list_empty(&isys->framebuflist)) {
+			spin_unlock_irqrestore(&isys->listlock, flags);
+			dev_err(dev, "Frame list empty\n");
+			return NULL;
+		}
+	}
+	msg = list_last_entry(&isys->framebuflist, struct isys_fw_msgs, head);
+	list_move(&msg->head, &isys->framebuflist_fw);
+	spin_unlock_irqrestore(&isys->listlock, flags);
+	memset(&msg->fw_msg, 0, sizeof(msg->fw_msg));
+
+	return msg;
+}
+
+void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys)
+{
+	struct isys_fw_msgs *fwmsg, *fwmsg0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	list_for_each_entry_safe(fwmsg, fwmsg0, &isys->framebuflist_fw, head)
+		list_move(&fwmsg->head, &isys->framebuflist);
+	spin_unlock_irqrestore(&isys->listlock, flags);
+}
+
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, u64 data)
+{
+	struct isys_fw_msgs *msg;
+	unsigned long flags;
+	u64 *ptr = (u64 *)data;
+
+	if (!ptr)
+		return;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	msg = container_of(ptr, struct isys_fw_msgs, fw_msg.dummy);
+	list_move(&msg->head, &isys->framebuflist);
+	spin_unlock_irqrestore(&isys->listlock, flags);
+}
+
+static int isys_probe(struct auxiliary_device *auxdev,
+		      const struct auxiliary_device_id *auxdev_id)
+{
+	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
+	struct ipu6_device *isp = adev->isp;
+	const struct firmware *fw;
+	struct ipu6_isys *isys;
+	unsigned int i;
+	int ret = 0;
+
+	isys = devm_kzalloc(&auxdev->dev, sizeof(*isys), GFP_KERNEL);
+	if (!isys)
+		return -ENOMEM;
+
+	ret = ipu6_mmu_hw_init(adev->mmu);
+	if (ret)
+		return ret;
+
+	adev->auxdrv_data =
+		(const struct ipu6_auxdrv_data *)auxdev_id->driver_data;
+	adev->auxdrv = to_auxiliary_drv(auxdev->dev.driver);
+	isys->adev = adev;
+	isys->pdata = adev->pdata;
+
+	/* initial sensor type */
+	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
+
+	spin_lock_init(&isys->streams_lock);
+	spin_lock_init(&isys->power_lock);
+	isys->power = 0;
+	isys->phy_termcal_val = 0;
+
+	mutex_init(&isys->mutex);
+	mutex_init(&isys->stream_mutex);
+
+	spin_lock_init(&isys->listlock);
+	INIT_LIST_HEAD(&isys->framebuflist);
+	INIT_LIST_HEAD(&isys->framebuflist_fw);
+
+	isys->line_align = IPU6_ISYS_2600_MEM_LINE_ALIGN;
+	isys->icache_prefetch = 0;
+
+	dev_set_drvdata(&auxdev->dev, isys);
+
+	isys_stream_init(isys);
+
+	if (!isp->secure_mode) {
+		fw = isp->cpd_fw;
+		ret = ipu6_buttress_map_fw_image(adev, fw, &adev->fw_sgt);
+		if (ret)
+			goto release_firmware;
+
+		ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
+		if (ret)
+			goto remove_shared_buffer;
+	}
+
+	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	ret = alloc_fw_msg_bufs(isys, 20);
+	if (ret < 0)
+		goto out_remove_pkg_dir_shared_buffer;
+
+	ret = isys_iwake_watermark_init(isys);
+	if (ret)
+		goto out_remove_pkg_dir_shared_buffer;
+
+	if (is_ipu6se(adev->isp->hw_ver))
+		isys->phy_set_power = ipu6_isys_jsl_phy_set_power;
+	else if (is_ipu6ep_mtl(adev->isp->hw_ver))
+		isys->phy_set_power = ipu6_isys_dwc_phy_set_power;
+	else
+		isys->phy_set_power = ipu6_isys_mcd_phy_set_power;
+
+	ret = isys_register_devices(isys);
+	if (ret)
+		goto out_remove_pkg_dir_shared_buffer;
+
+	ipu6_mmu_hw_cleanup(adev->mmu);
+
+	return 0;
+
+out_remove_pkg_dir_shared_buffer:
+	if (!isp->secure_mode)
+		ipu6_cpd_free_pkg_dir(adev);
+remove_shared_buffer:
+	if (!isp->secure_mode)
+		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+release_firmware:
+	if (!isp->secure_mode)
+		release_firmware(adev->fw);
+
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
+		mutex_destroy(&isys->streams[i].mutex);
+
+	mutex_destroy(&isys->mutex);
+	mutex_destroy(&isys->stream_mutex);
+
+	ipu6_mmu_hw_cleanup(adev->mmu);
+
+	return ret;
+}
+
+struct fwmsg {
+	int type;
+	char *msg;
+	bool valid_ts;
+};
+
+static const struct fwmsg fw_msg[] = {
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE, "STREAM_OPEN_DONE", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK, "STREAM_CLOSE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK, "STREAM_START_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+	 "STREAM_START_AND_CAPTURE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK, "STREAM_STOP_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK, "STREAM_FLUSH_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY, "PIN_DATA_READY", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK, "STREAM_CAPTURE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+	 "STREAM_START_AND_CAPTURE_DONE", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE, "STREAM_CAPTURE_DONE", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF, "FRAME_SOF", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF, "FRAME_EOF", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY, "STATS_READY", 1},
+	{-1, "UNKNOWN MESSAGE", 0},
+};
+
+static int resp_type_to_index(int type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fw_msg); i++)
+		if (fw_msg[i].type == type)
+			return i;
+
+	return  ARRAY_SIZE(fw_msg) - 1;
+}
+
+int isys_isr_one(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu6_fw_isys_resp_info_abi *resp;
+	struct ipu6_isys_stream *stream;
+	struct ipu6_isys_csi2 *csi2 = NULL;
+	u64 ts;
+
+	if (!isys->fwcom)
+		return 0;
+
+	resp = ipu6_fw_isys_get_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
+	if (!resp)
+		return 1;
+
+	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
+
+	if (resp->error_info.error == IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION)
+		/* Suspension is kind of special case: not enough buffers */
+		dev_dbg(&adev->auxdev.dev,
+			"FW error resp %02d %s, stream %u, error SUSPENSION, details %d, timestamp 0x%16.16llx, pin %d\n",
+			resp->type,
+			fw_msg[resp_type_to_index(resp->type)].msg,
+			resp->stream_handle,
+			resp->error_info.error_details,
+			fw_msg[resp_type_to_index(resp->type)].valid_ts ?
+			ts : 0, resp->pin_id);
+	else if (resp->error_info.error)
+		dev_dbg(&adev->auxdev.dev,
+			"FW error resp %02d %s, stream %u, error %d, details %d, timestamp 0x%16.16llx, pin %d\n",
+			resp->type,
+			fw_msg[resp_type_to_index(resp->type)].msg,
+			resp->stream_handle,
+			resp->error_info.error, resp->error_info.error_details,
+			fw_msg[resp_type_to_index(resp->type)].valid_ts ?
+			ts : 0, resp->pin_id);
+	else
+		dev_dbg(&adev->auxdev.dev,
+			"FW resp %02d %s, stream %u, timestamp 0x%16.16llx, pin %d\n",
+			resp->type,
+			fw_msg[resp_type_to_index(resp->type)].msg,
+			resp->stream_handle,
+			fw_msg[resp_type_to_index(resp->type)].valid_ts ?
+			ts : 0, resp->pin_id);
+
+	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
+		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
+			resp->stream_handle);
+		goto leave;
+	}
+
+	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
+	if (!stream) {
+		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
+			resp->stream_handle);
+		goto leave;
+	}
+	stream->error = resp->error_info.error;
+
+	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+
+	switch (resp->type) {
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
+		complete(&stream->stream_open_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
+		complete(&stream->stream_close_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
+		/*
+		 * firmware only release the capture msg until software
+		 * get pin_data_ready event
+		 */
+		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins[resp->pin_id].pin_ready)
+			stream->output_pins[resp->pin_id].pin_ready(stream,
+								    resp);
+		else
+			dev_err(&adev->auxdev.dev,
+				"%d:No data pin ready handler for pin id %d\n",
+				resp->stream_handle, resp->pin_id);
+		if (csi2)
+			ipu6_isys_csi2_error(csi2);
+
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
+
+		ipu6_isys_csi2_sof_event_by_stream(stream);
+		stream->seq[stream->seq_index].sequence =
+			atomic_read(&stream->sequence) - 1;
+		stream->seq[stream->seq_index].timestamp = ts;
+		dev_dbg(&adev->auxdev.dev,
+			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
+			resp->stream_handle,
+			stream->seq[stream->seq_index].sequence, ts);
+		stream->seq_index = (stream->seq_index + 1)
+			% IPU6_ISYS_MAX_PARALLEL_SOF;
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
+		ipu6_isys_csi2_eof_event_by_stream(stream);
+		dev_dbg(&adev->auxdev.dev,
+			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
+			resp->stream_handle,
+			stream->seq[stream->seq_index].sequence, ts);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
+		break;
+	default:
+		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
+			resp->stream_handle, resp->type);
+		break;
+	}
+
+	ipu6_isys_put_stream(stream);
+leave:
+	ipu6_fw_isys_put_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
+	return 0;
+}
+
+static const struct pci_device_id isys_pci_tbl[] = {
+	{ PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
+	{ }
+};
+
+static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
+	.isr = isys_isr,
+	.isr_threaded = NULL,
+	.wake_isr_thread = false,
+};
+
+static const struct auxiliary_device_id ipu6_isys_id_table[] = {
+	{
+		.name = "intel_ipu6.isys",
+		.driver_data = (kernel_ulong_t)&ipu6_isys_auxdrv_data,
+	},
+};
+
+static struct auxiliary_driver isys_driver = {
+	.name = IPU6_ISYS_NAME,
+	.probe = isys_probe,
+	.remove = isys_remove,
+	.id_table = ipu6_isys_id_table,
+	.driver = {
+		.pm = &isys_pm_ops,
+	},
+};
+
+module_auxiliary_driver(isys_driver);
+
+MODULE_DEVICE_TABLE(pci, isys_pci_tbl);
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
+MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
+MODULE_AUTHOR("Hongju Wang <hongju.wang@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Intel IPU6 input system driver");
+MODULE_IMPORT_NS(INTEL_IPU6);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
new file mode 100644
index 000000000000..ef0115914297
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -0,0 +1,188 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_ISYS_H
+#define IPU6_ISYS_H
+
+#include <linux/pm_qos.h>
+#include <linux/spinlock.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+
+#include "ipu6.h"
+#include "ipu6-fw-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-isys-video.h"
+
+#define IPU6_ISYS_ENTITY_PREFIX		"Intel IPU6"
+/* FW support max 16 streams */
+#define IPU6_ISYS_MAX_STREAMS		16
+#define ISYS_UNISPART_IRQS	(IPU6_ISYS_UNISPART_IRQ_SW |	\
+				 IPU6_ISYS_UNISPART_IRQ_CSI0 |	\
+				 IPU6_ISYS_UNISPART_IRQ_CSI1)
+
+#define IPU6_ISYS_2600_MEM_LINE_ALIGN	64
+
+/*
+ * Current message queue configuration. These must be big enough
+ * so that they never gets full. Queues are located in system memory
+ */
+#define IPU6_ISYS_SIZE_RECV_QUEUE 40
+#define IPU6_ISYS_SIZE_SEND_QUEUE 40
+#define IPU6_ISYS_SIZE_PROXY_RECV_QUEUE 5
+#define IPU6_ISYS_SIZE_PROXY_SEND_QUEUE 5
+#define IPU6_ISYS_NUM_RECV_QUEUE 1
+
+#define IPU6_ISYS_MIN_WIDTH		1U
+#define IPU6_ISYS_MIN_HEIGHT		1U
+#define IPU6_ISYS_MAX_WIDTH		4672U
+#define IPU6_ISYS_MAX_HEIGHT		3416U
+
+/* the threshold granularity is 2KB on IPU6 */
+#define IPU6_SRAM_GRANULARITY_SHIFT	11
+#define IPU6_SRAM_GRANULARITY_SIZE	2048
+/* the threshold granularity is 1KB on IPU6SE */
+#define IPU6SE_SRAM_GRANULARITY_SHIFT	10
+#define IPU6SE_SRAM_GRANULARITY_SIZE	1024
+/* IS pixel buffer is 256KB, MaxSRAMSize is 200KB on IPU6 */
+#define IPU6_MAX_SRAM_SIZE			(200 << 10)
+/* IS pixel buffer is 128KB, MaxSRAMSize is 96KB on IPU6SE */
+#define IPU6SE_MAX_SRAM_SIZE			(96 << 10)
+
+#define IPU6EP_LTR_VALUE			200
+#define IPU6EP_MIN_MEMOPEN_TH			0x4
+#define IPU6EP_MTL_LTR_VALUE			1023
+#define IPU6EP_MTL_MIN_MEMOPEN_TH		0xc
+
+struct ltr_did {
+	union {
+		u32 value;
+		struct {
+			u8 val0;
+			u8 val1;
+			u8 val2;
+			u8 val3;
+		} bits;
+	} lut_ltr;
+	union {
+		u32 value;
+		struct {
+			u8 th0;
+			u8 th1;
+			u8 th2;
+			u8 th3;
+		} bits;
+	} lut_fill_time;
+};
+
+struct isys_iwake_watermark {
+	bool iwake_enabled;
+	bool force_iwake_disable;
+	u32 iwake_threshold;
+	u64 isys_pixelbuffer_datarate;
+	struct ltr_did ltrdid;
+	struct mutex mutex; /* protect whole struct */
+	struct ipu6_isys *isys;
+	struct list_head video_list;
+};
+
+struct ipu6_isys_csi2_config {
+	u32 nlanes;
+	u32 port;
+};
+
+struct sensor_async_subdev {
+	struct v4l2_async_subdev asd;
+	struct ipu6_isys_csi2_config csi2;
+};
+
+/*
+ * struct ipu6_isys
+ *
+ * @media_dev: Media device
+ * @v4l2_dev: V4L2 device
+ * @adev: ISYS bus device
+ * @power: Is ISYS powered on or not?
+ * @isr_bits: Which bits does the ISR handle?
+ * @power_lock: Serialise access to power (power state in general)
+ * @csi2_rx_ctrl_cached: cached shared value between all CSI2 receivers
+ * @streams_lock: serialise access to streams
+ * @streams: streams per firmware stream ID
+ * @fwcom: fw communication layer private pointer
+ *         or optional external library private pointer
+ * @line_align: line alignment in memory
+ * @phy_termcal_val: the termination calibration value, only used for DWC PHY
+ * @need_reset: Isys requires d0i0->i3 transition
+ * @ref_count: total number of callers fw open
+ * @mutex: serialise access isys video open/release related operations
+ * @stream_mutex: serialise stream start and stop, queueing requests
+ * @pdata: platform data pointer
+ * @csi2: CSI-2 receivers
+ */
+struct ipu6_isys {
+	struct media_device media_dev;
+	struct v4l2_device v4l2_dev;
+	struct ipu6_bus_device *adev;
+
+	int power;
+	spinlock_t power_lock;
+	u32 isr_csi2_bits;
+	u32 csi2_rx_ctrl_cached;
+	spinlock_t streams_lock;
+	struct ipu6_isys_stream streams[IPU6_ISYS_MAX_STREAMS];
+	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
+	void *fwcom;
+	unsigned int line_align;
+	u32 phy_termcal_val;
+	bool need_reset;
+	bool icache_prefetch;
+	bool csi2_cse_ipc_not_supported;
+	unsigned int ref_count;
+	unsigned int stream_opened;
+	unsigned int sensor_type;
+
+	struct mutex mutex;
+	struct mutex stream_mutex;
+
+	struct ipu6_isys_pdata *pdata;
+
+	int (*phy_set_power)(struct ipu6_isys *isys,
+			     struct ipu6_isys_csi2_config *cfg,
+			     const struct ipu6_isys_csi2_timing *timing,
+			     bool on);
+
+	struct ipu6_isys_csi2 *csi2;
+	struct ipu6_isys_video av[NR_OF_VIDEO_DEVICE];
+
+	struct pm_qos_request pm_qos;
+	spinlock_t listlock;	/* Protect framebuflist */
+	struct list_head framebuflist;
+	struct list_head framebuflist_fw;
+	struct v4l2_async_notifier notifier;
+	struct isys_iwake_watermark iwake_watermark;
+};
+
+struct isys_fw_msgs {
+	union {
+		u64 dummy;
+		struct ipu6_fw_isys_frame_buff_set_abi frame;
+		struct ipu6_fw_isys_stream_cfg_data_abi stream;
+	} fw_msg;
+	struct list_head head;
+	dma_addr_t dma_addr;
+};
+
+struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream);
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, u64 data);
+void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
+
+extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
+
+void isys_setup_hw(struct ipu6_isys *isys);
+int isys_isr_one(struct ipu6_bus_device *adev);
+irqreturn_t isys_isr(struct ipu6_bus_device *adev);
+void update_watermark_setting(struct ipu6_isys *isys);
+
+#endif /* IPU6_ISYS_H */
-- 
2.40.1

