Return-Path: <linux-media+bounces-9610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92538A7549
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BE77282696
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B440A1386D6;
	Tue, 16 Apr 2024 20:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxv5Y2dz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092813AA27
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298302; cv=none; b=a4YNekn4i1pz6yfknEP/FhPVVIL6y4V4OCvERD19RFyd+PxreauV5BRQ+AfstiUBflCj8tCNURrTslnP/iSDbzdorlvIWYMRVyieeRyd9uc6mAZQjz6zv+Nclq09iGRKzZ+GdZT0smooc7uvfsz67icSdlRfunHFhdh/B/9Oey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298302; c=relaxed/simple;
	bh=vQFOMsXbQRI5lDNSjXhdmsbk8xD7MGcW1MhzK1h2URo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4G5ByY6Fj9otR922R/2C5aWBy7+NYFRFibixdkd5EF23b4A5QO59sjp+kHVqKT7oYmpSoZQgas98yvA0/tG9at4EtX/e8Khbye+XpZswyrjPhg9/dnPjW9iAJ/PKxODfrZieLDc+jz6QRsH6cvFffDX3GCAellU+lsv3ucEoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxv5Y2dz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298299; x=1744834299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vQFOMsXbQRI5lDNSjXhdmsbk8xD7MGcW1MhzK1h2URo=;
  b=hxv5Y2dzEgpGb659zwWI3qUzhdOT4BJjhFugWQ1WC3WW8dDYtjTycegv
   K/NmA/Vnfdia3Xh7KT1ofmu3AxiN32HxgsvNBtKmlqwUY+K4hlCo67i0O
   BQmCNlxrSD3+RP9zxXEoNCULoZDWWf1IUvgrq+voiMd+0mH+OSRKJ6s+U
   hckqkHGcVNr1BsrPWzm5Dh0sVT60YpCaK8xYgLcLCvkpszuNrcxA5jHYm
   blMgcZw5MiQMQmJxUKZM/tvlqL3KvTcuZYxvJm5f/oEA121o+72IsAcII
   rufX5ZCpfucBEy42xEdUMfWv6ZZSEVmQo5is0oimh4RBqPB+XQhEVdNKD
   g==;
X-CSE-ConnectionGUID: 955CpkGWQbeN54pFShXIfQ==
X-CSE-MsgGUID: dlkyPxaDSZCBtnvzCrdyUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12601111"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="12601111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:39 -0700
X-CSE-ConnectionGUID: O1DWAupkREmnK3vC5sNyqw==
X-CSE-MsgGUID: jLFlnumSRaOnqOaOQZEhFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22778949"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E662D1204F9;
	Tue, 16 Apr 2024 23:11:29 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v4 11/19] media: intel/ipu6: add the CSI2 DPHY implementation
Date: Tue, 16 Apr 2024 23:10:57 +0300
Message-Id: <20240416201105.781496-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU6 CSI-2 D-PHY hardware varies on different platforms, current IPU6 has
three D-PHY hardware instances which are used on Tigerlake, Alder lake,
Meteor lake and Jasper lake. MCD D-PHY is included in Tigerlake and Alder
lake, DWC D-PHY is included in Meteor lake.

Each PHY has its own register interface, the input system driver calls the
appropriate D-PHY callbacks for the hardware set in isys_probe().

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 536 +++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  | 242 ++++++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  | 720 ++++++++++++++++++
 3 files changed, 1498 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
new file mode 100644
index 000000000000..1715275e6776
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+
+#define IPU6_DWC_DPHY_BASE(i)			(0x238038 + 0x34 * (i))
+#define IPU6_DWC_DPHY_RSTZ			0x00
+#define IPU6_DWC_DPHY_SHUTDOWNZ			0x04
+#define IPU6_DWC_DPHY_HSFREQRANGE		0x08
+#define IPU6_DWC_DPHY_CFGCLKFREQRANGE		0x0c
+#define IPU6_DWC_DPHY_TEST_IFC_ACCESS_MODE	0x10
+#define IPU6_DWC_DPHY_TEST_IFC_REQ		0x14
+#define IPU6_DWC_DPHY_TEST_IFC_REQ_COMPLETION	0x18
+#define IPU6_DWC_DPHY_DFT_CTRL0			0x28
+#define IPU6_DWC_DPHY_DFT_CTRL1			0x2c
+#define IPU6_DWC_DPHY_DFT_CTRL2			0x30
+
+/*
+ * test IFC request definition:
+ * - req: 0 for read, 1 for write
+ * - 12 bits address
+ * - 8bits data (will ignore for read)
+ * --24----16------4-----0
+ * --|-data-|-addr-|-req-|
+ */
+#define IFC_REQ(req, addr, data) (FIELD_PREP(GENMASK(23, 16), data) | \
+				  FIELD_PREP(GENMASK(15, 4), addr) | \
+				  FIELD_PREP(GENMASK(1, 0), req))
+
+#define TEST_IFC_REQ_READ	0
+#define TEST_IFC_REQ_WRITE	1
+#define TEST_IFC_REQ_RESET	2
+
+#define TEST_IFC_ACCESS_MODE_FSM	0
+#define TEST_IFC_ACCESS_MODE_IFC_CTL	1
+
+enum phy_fsm_state {
+	PHY_FSM_STATE_POWERON = 0,
+	PHY_FSM_STATE_BGPON = 1,
+	PHY_FSM_STATE_CAL_TYPE = 2,
+	PHY_FSM_STATE_BURNIN_CAL = 3,
+	PHY_FSM_STATE_TERMCAL = 4,
+	PHY_FSM_STATE_OFFSETCAL = 5,
+	PHY_FSM_STATE_OFFSET_LANE = 6,
+	PHY_FSM_STATE_IDLE = 7,
+	PHY_FSM_STATE_ULP = 8,
+	PHY_FSM_STATE_DDLTUNNING = 9,
+	PHY_FSM_STATE_SKEW_BACKWARD = 10,
+	PHY_FSM_STATE_INVALID,
+};
+
+static void dwc_dphy_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
+			   u32 data)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
+
+	dev_dbg(dev, "write: reg 0x%lx = data 0x%x", base + addr - isys_base,
+		data);
+	writel(data, base + addr);
+}
+
+static u32 dwc_dphy_read(struct ipu6_isys *isys, u32 phy_id, u32 addr)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
+	u32 data;
+
+	data = readl(base + addr);
+	dev_dbg(dev, "read: reg 0x%lx = data 0x%x", base + addr - isys_base,
+		data);
+
+	return data;
+}
+
+static void dwc_dphy_write_mask(struct ipu6_isys *isys, u32 phy_id, u32 addr,
+				u32 data, u8 shift, u8 width)
+{
+	u32 temp;
+	u32 mask;
+
+	mask = (1 << width) - 1;
+	temp = dwc_dphy_read(isys, phy_id, addr);
+	temp &= ~(mask << shift);
+	temp |= (data & mask) << shift;
+	dwc_dphy_write(isys, phy_id, addr, temp);
+}
+
+static u32 __maybe_unused dwc_dphy_read_mask(struct ipu6_isys *isys, u32 phy_id,
+					     u32 addr, u8 shift,  u8 width)
+{
+	u32 val;
+
+	val = dwc_dphy_read(isys, phy_id, addr) >> shift;
+	return val & ((1 << width) - 1);
+}
+
+#define DWC_DPHY_TIMEOUT (5 * USEC_PER_SEC)
+static int dwc_dphy_ifc_read(struct ipu6_isys *isys, u32 phy_id, u32 addr,
+			     u32 *val)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
+	void __iomem *reg;
+	u32 completion;
+	int ret;
+
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_TEST_IFC_REQ,
+		       IFC_REQ(TEST_IFC_REQ_READ, addr, 0));
+	reg = base + IPU6_DWC_DPHY_TEST_IFC_REQ_COMPLETION;
+	ret = readl_poll_timeout(reg, completion, !(completion & BIT(0)),
+				 10, DWC_DPHY_TIMEOUT);
+	if (ret) {
+		dev_err(dev, "DWC ifc request read timeout\n");
+		return ret;
+	}
+
+	*val = completion >> 8 & 0xff;
+	*val = FIELD_GET(GENMASK(15, 8), completion);
+	dev_dbg(dev, "DWC ifc read 0x%x = 0x%x", addr, *val);
+
+	return 0;
+}
+
+static int dwc_dphy_ifc_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
+			      u32 data)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
+	void __iomem *reg;
+	u32 completion;
+	int ret;
+
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_TEST_IFC_REQ,
+		       IFC_REQ(TEST_IFC_REQ_WRITE, addr, data));
+	completion = readl(base + IPU6_DWC_DPHY_TEST_IFC_REQ_COMPLETION);
+	reg = base + IPU6_DWC_DPHY_TEST_IFC_REQ_COMPLETION;
+	ret = readl_poll_timeout(reg, completion, !(completion & BIT(0)),
+				 10, DWC_DPHY_TIMEOUT);
+	if (ret)
+		dev_err(dev, "DWC ifc request write timeout\n");
+
+	return ret;
+}
+
+static void dwc_dphy_ifc_write_mask(struct ipu6_isys *isys, u32 phy_id,
+				    u32 addr, u32 data, u8 shift, u8 width)
+{
+	u32 temp, mask;
+	int ret;
+
+	ret = dwc_dphy_ifc_read(isys, phy_id, addr, &temp);
+	if (ret)
+		return;
+
+	mask = (1 << width) - 1;
+	temp &= ~(mask << shift);
+	temp |= (data & mask) << shift;
+	dwc_dphy_ifc_write(isys, phy_id, addr, temp);
+}
+
+static u32 dwc_dphy_ifc_read_mask(struct ipu6_isys *isys, u32 phy_id, u32 addr,
+				  u8 shift, u8 width)
+{
+	int ret;
+	u32 val;
+
+	ret = dwc_dphy_ifc_read(isys, phy_id, addr, &val);
+	if (ret)
+		return 0;
+
+	return ((val >> shift) & ((1 << width) - 1));
+}
+
+static int dwc_dphy_pwr_up(struct ipu6_isys *isys, u32 phy_id)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 fsm_state;
+	int ret;
+
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_RSTZ, 1);
+	usleep_range(10, 20);
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_SHUTDOWNZ, 1);
+
+	ret = read_poll_timeout(dwc_dphy_ifc_read_mask, fsm_state,
+				(fsm_state == PHY_FSM_STATE_IDLE ||
+				 fsm_state == PHY_FSM_STATE_ULP),
+				100, DWC_DPHY_TIMEOUT, false, isys,
+				phy_id, 0x1e, 0, 4);
+
+	if (ret)
+		dev_err(dev, "Dphy %d power up failed, state 0x%x", phy_id,
+			fsm_state);
+
+	return ret;
+}
+
+struct dwc_dphy_freq_range {
+	u8 hsfreq;
+	u16 min;
+	u16 max;
+	u16 default_mbps;
+	u16 osc_freq_target;
+};
+
+#define DPHY_FREQ_RANGE_NUM		(63)
+#define DPHY_FREQ_RANGE_INVALID_INDEX	(0xff)
+static const struct dwc_dphy_freq_range freqranges[DPHY_FREQ_RANGE_NUM] = {
+	{0x00,	80,	97,	80,	335},
+	{0x10,	80,	107,	90,	335},
+	{0x20,	84,	118,	100,	335},
+	{0x30,	93,	128,	110,	335},
+	{0x01,	103,	139,	120,	335},
+	{0x11,	112,	149,	130,	335},
+	{0x21,	122,	160,	140,	335},
+	{0x31,	131,	170,	150,	335},
+	{0x02,	141,	181,	160,	335},
+	{0x12,	150,	191,	170,	335},
+	{0x22,	160,	202,	180,	335},
+	{0x32,	169,	212,	190,	335},
+	{0x03,	183,	228,	205,	335},
+	{0x13,	198,	244,	220,	335},
+	{0x23,	212,	259,	235,	335},
+	{0x33,	226,	275,	250,	335},
+	{0x04,	250,	301,	275,	335},
+	{0x14,	274,	328,	300,	335},
+	{0x25,	297,	354,	325,	335},
+	{0x35,	321,	380,	350,	335},
+	{0x05,	369,	433,	400,	335},
+	{0x16,	416,	485,	450,	335},
+	{0x26,	464,	538,	500,	335},
+	{0x37,	511,	590,	550,	335},
+	{0x07,	559,	643,	600,	335},
+	{0x18,	606,	695,	650,	335},
+	{0x28,	654,	748,	700,	335},
+	{0x39,	701,	800,	750,	335},
+	{0x09,	749,	853,	800,	335},
+	{0x19,	796,	905,	850,	335},
+	{0x29,	844,	958,	900,	335},
+	{0x3a,	891,	1010,	950,	335},
+	{0x0a,	939,	1063,	1000,	335},
+	{0x1a,	986,	1115,	1050,	335},
+	{0x2a,	1034,	1168,	1100,	335},
+	{0x3b,	1081,	1220,	1150,	335},
+	{0x0b,	1129,	1273,	1200,	335},
+	{0x1b,	1176,	1325,	1250,	335},
+	{0x2b,	1224,	1378,	1300,	335},
+	{0x3c,	1271,	1430,	1350,	335},
+	{0x0c,	1319,	1483,	1400,	335},
+	{0x1c,	1366,	1535,	1450,	335},
+	{0x2c,	1414,	1588,	1500,	335},
+	{0x3d,	1461,	1640,	1550,	208},
+	{0x0d,	1509,	1693,	1600,	214},
+	{0x1d,	1556,	1745,	1650,	221},
+	{0x2e,	1604,	1798,	1700,	228},
+	{0x3e,	1651,	1850,	1750,	234},
+	{0x0e,	1699,	1903,	1800,	241},
+	{0x1e,	1746,	1955,	1850,	248},
+	{0x2f,	1794,	2008,	1900,	255},
+	{0x3f,	1841,	2060,	1950,	261},
+	{0x0f,	1889,	2113,	2000,	268},
+	{0x40,	1936,	2165,	2050,	275},
+	{0x41,	1984,	2218,	2100,	281},
+	{0x42,	2031,	2270,	2150,	288},
+	{0x43,	2079,	2323,	2200,	294},
+	{0x44,	2126,	2375,	2250,	302},
+	{0x45,	2174,	2428,	2300,	308},
+	{0x46,	2221,	2480,	2350,	315},
+	{0x47,	2269,	2500,	2400,	321},
+	{0x48,	2316,	2500,	2450,	328},
+	{0x49,	2364,	2500,	2500,	335}
+};
+
+static u16 get_hsfreq_by_mbps(u32 mbps)
+{
+	unsigned int i = DPHY_FREQ_RANGE_NUM;
+
+	while (i--) {
+		if (freqranges[i].default_mbps == mbps ||
+		    (mbps >= freqranges[i].min && mbps <= freqranges[i].max))
+			return i;
+	}
+
+	return DPHY_FREQ_RANGE_INVALID_INDEX;
+}
+
+static int ipu6_isys_dwc_phy_config(struct ipu6_isys *isys,
+				    u32 phy_id, u32 mbps)
+{
+	struct ipu6_bus_device *adev = isys->adev;
+	struct device *dev = &adev->auxdev.dev;
+	struct ipu6_device *isp = adev->isp;
+	u32 cfg_clk_freqrange;
+	u32 osc_freq_target;
+	u32 index;
+
+	dev_dbg(dev, "config Dphy %u with %u mbps", phy_id, mbps);
+
+	index = get_hsfreq_by_mbps(mbps);
+	if (index == DPHY_FREQ_RANGE_INVALID_INDEX) {
+		dev_err(dev, "link freq not found for mbps %u", mbps);
+		return -EINVAL;
+	}
+
+	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_HSFREQRANGE,
+			    freqranges[index].hsfreq, 0, 7);
+
+	/* Force termination Calibration */
+	if (isys->phy_termcal_val) {
+		dwc_dphy_ifc_write_mask(isys, phy_id, 0x20a, 0x1, 0, 1);
+		dwc_dphy_ifc_write_mask(isys, phy_id, 0x209, 0x3, 0, 2);
+		dwc_dphy_ifc_write_mask(isys, phy_id, 0x209,
+					isys->phy_termcal_val, 4, 4);
+	}
+
+	/*
+	 * Enable override to configure the DDL target oscillation
+	 * frequency on bit 0 of register 0xe4
+	 */
+	dwc_dphy_ifc_write_mask(isys, phy_id, 0xe4, 0x1, 0, 1);
+	/*
+	 * configure registers 0xe2, 0xe3 with the
+	 * appropriate DDL target oscillation frequency
+	 * 0x1cc(460)
+	 */
+	osc_freq_target = freqranges[index].osc_freq_target;
+	dwc_dphy_ifc_write_mask(isys, phy_id, 0xe2,
+				osc_freq_target & 0xff, 0, 8);
+	dwc_dphy_ifc_write_mask(isys, phy_id, 0xe3,
+				(osc_freq_target >> 8) & 0xf, 0, 4);
+
+	if (mbps < 1500) {
+		/* deskew_polarity_rw, for < 1.5Gbps */
+		dwc_dphy_ifc_write_mask(isys, phy_id, 0x8, 0x1, 5, 1);
+	}
+
+	/*
+	 * Set cfgclkfreqrange[5:0] = round[(Fcfg_clk(MHz)-17)*4]
+	 * (38.4 - 17) * 4 = ~85 (0x55)
+	 */
+	cfg_clk_freqrange = (isp->buttress.ref_clk - 170) * 4 / 10;
+	dev_dbg(dev, "ref_clk = %u clk_freqrange = %u",
+		isp->buttress.ref_clk, cfg_clk_freqrange);
+	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_CFGCLKFREQRANGE,
+			    cfg_clk_freqrange, 0, 8);
+
+	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_DFT_CTRL2, 0x1, 4, 1);
+	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_DFT_CTRL2, 0x1, 8, 1);
+
+	return 0;
+}
+
+static void ipu6_isys_dwc_phy_aggr_setup(struct ipu6_isys *isys, u32 master,
+					 u32 slave, u32 mbps)
+{
+	/* Config mastermacro */
+	dwc_dphy_ifc_write_mask(isys, master, 0x133, 0x1, 0, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x133, 0x0, 0, 1);
+
+	/* Config master PHY clk lane to drive long channel clk */
+	dwc_dphy_ifc_write_mask(isys, master, 0x307, 0x1, 2, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x307, 0x0, 2, 1);
+
+	/* Config both PHYs data lanes to get clk from long channel */
+	dwc_dphy_ifc_write_mask(isys, master, 0x508, 0x1, 5, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x508, 0x1, 5, 1);
+	dwc_dphy_ifc_write_mask(isys, master, 0x708, 0x1, 5, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x708, 0x1, 5, 1);
+
+	/* Config slave PHY clk lane to bypass long channel clk to DDR clk */
+	dwc_dphy_ifc_write_mask(isys, master, 0x308, 0x0, 3, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x308, 0x1, 3, 1);
+
+	/* Override slave PHY clk lane enable (DPHYRXCLK_CLL_demux module) */
+	dwc_dphy_ifc_write_mask(isys, slave, 0xe0, 0x3, 0, 2);
+
+	/* Override slave PHY DDR clk lane enable (DPHYHSRX_div124 module) */
+	dwc_dphy_ifc_write_mask(isys, slave, 0xe1, 0x1, 1, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x307, 0x1, 3, 1);
+
+	/* Turn off slave PHY LP-RX clk lane */
+	dwc_dphy_ifc_write_mask(isys, slave, 0x304, 0x1, 7, 1);
+	dwc_dphy_ifc_write_mask(isys, slave, 0x305, 0xa, 0, 5);
+}
+
+#define PHY_E	4
+static int ipu6_isys_dwc_phy_powerup_ack(struct ipu6_isys *isys, u32 phy_id)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 rescal_done;
+	int ret;
+
+	ret = dwc_dphy_pwr_up(isys, phy_id);
+	if (ret != 0) {
+		dev_err(dev, "Dphy %u power up failed(%d)", phy_id, ret);
+		return ret;
+	}
+
+	/* reset forcerxmode */
+	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_DFT_CTRL2, 0, 4, 1);
+	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_DFT_CTRL2, 0, 8, 1);
+
+	dev_dbg(dev, "Dphy %u is ready!", phy_id);
+
+	if (phy_id != PHY_E || isys->phy_termcal_val)
+		return 0;
+
+	usleep_range(100, 200);
+	rescal_done = dwc_dphy_ifc_read_mask(isys, phy_id, 0x221, 7, 1);
+	if (rescal_done) {
+		isys->phy_termcal_val = dwc_dphy_ifc_read_mask(isys, phy_id,
+							       0x220, 2, 4);
+		dev_dbg(dev, "termcal done with value = %u",
+			isys->phy_termcal_val);
+	}
+
+	return 0;
+}
+
+static void ipu6_isys_dwc_phy_reset(struct ipu6_isys *isys, u32 phy_id)
+{
+	dev_dbg(&isys->adev->auxdev.dev, "Reset phy %u", phy_id);
+
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_SHUTDOWNZ, 0);
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_RSTZ, 0);
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_TEST_IFC_ACCESS_MODE,
+		       TEST_IFC_ACCESS_MODE_FSM);
+	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_TEST_IFC_REQ,
+		       TEST_IFC_REQ_RESET);
+}
+
+int ipu6_isys_dwc_phy_set_power(struct ipu6_isys *isys,
+				struct ipu6_isys_csi2_config *cfg,
+				const struct ipu6_isys_csi2_timing *timing,
+				bool on)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	u32 phy_id, primary, secondary;
+	u32 nlanes, port, mbps;
+	s64 link_freq;
+	int ret;
+
+	port = cfg->port;
+
+	if (!isys_base || port >= isys->pdata->ipdata->csi2.nports) {
+		dev_warn(dev, "invalid port ID %d\n", port);
+		return -EINVAL;
+	}
+
+	nlanes = cfg->nlanes;
+	/* only port 0, 2 and 4 support 4 lanes */
+	if (nlanes == 4 && port % 2) {
+		dev_err(dev, "invalid csi-port %u with %u lanes\n", port,
+			nlanes);
+		return -EINVAL;
+	}
+
+	link_freq = ipu6_isys_csi2_get_link_freq(&isys->csi2[port]);
+	if (link_freq < 0) {
+		dev_err(dev, "get link freq failed(%lld).\n", link_freq);
+		return link_freq;
+	}
+
+	mbps = div_u64(link_freq, 500000);
+
+	phy_id = port;
+	primary = port & ~1;
+	secondary = primary + 1;
+	if (on) {
+		if (nlanes == 4) {
+			dev_dbg(dev, "config phy %u and %u in aggr mode\n",
+				primary, secondary);
+
+			ipu6_isys_dwc_phy_reset(isys, primary);
+			ipu6_isys_dwc_phy_reset(isys, secondary);
+			ipu6_isys_dwc_phy_aggr_setup(isys, primary,
+						     secondary, mbps);
+
+			ret = ipu6_isys_dwc_phy_config(isys, primary, mbps);
+			if (ret)
+				return ret;
+			ret = ipu6_isys_dwc_phy_config(isys, secondary, mbps);
+			if (ret)
+				return ret;
+
+			ret = ipu6_isys_dwc_phy_powerup_ack(isys, primary);
+			if (ret)
+				return ret;
+
+			ret = ipu6_isys_dwc_phy_powerup_ack(isys, secondary);
+			return ret;
+		}
+
+		dev_dbg(dev, "config phy %u with %u lanes in non-aggr mode\n",
+			phy_id, nlanes);
+
+		ipu6_isys_dwc_phy_reset(isys, phy_id);
+		ret = ipu6_isys_dwc_phy_config(isys, phy_id, mbps);
+		if (ret)
+			return ret;
+
+		ret = ipu6_isys_dwc_phy_powerup_ack(isys, phy_id);
+		return ret;
+	}
+
+	if (nlanes == 4) {
+		dev_dbg(dev, "Power down phy %u and phy %u for port %u\n",
+			primary, secondary, port);
+		ipu6_isys_dwc_phy_reset(isys, secondary);
+		ipu6_isys_dwc_phy_reset(isys, primary);
+
+		return 0;
+	}
+
+	dev_dbg(dev, "Powerdown phy %u with %u lanes\n", phy_id, nlanes);
+
+	ipu6_isys_dwc_phy_reset(isys, phy_id);
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
new file mode 100644
index 000000000000..c804291cfae9
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/io.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+
+/* only use BB0, BB2, BB4, and BB6 on PHY0 */
+#define IPU6SE_ISYS_PHY_BB_NUM		4
+#define IPU6SE_ISYS_PHY_0_BASE		0x10000
+
+#define PHY_CPHY_DLL_OVRD(x)		(0x100 + 0x100 * (x))
+#define PHY_CPHY_RX_CONTROL1(x)		(0x110 + 0x100 * (x))
+#define PHY_DPHY_CFG(x)			(0x148 + 0x100 * (x))
+#define PHY_BB_AFE_CONFIG(x)		(0x174 + 0x100 * (x))
+
+/*
+ * use port_cfg to configure that which data lanes used
+ * +---------+     +------+ +-----+
+ * | port0 x4<-----|      | |     |
+ * |         |     | port | |     |
+ * | port1 x2<-----|      | |     |
+ * |         |     |      <-| PHY |
+ * | port2 x4<-----|      | |     |
+ * |         |     |config| |     |
+ * | port3 x2<-----|      | |     |
+ * +---------+     +------+ +-----+
+ */
+static const unsigned int csi2_port_cfg[][3] = {
+	{0, 0, 0x1f}, /* no link */
+	{4, 0, 0x10}, /* x4 + x4 config */
+	{2, 0, 0x12}, /* x2 + x2 config */
+	{1, 0, 0x13}, /* x1 + x1 config */
+	{2, 1, 0x15}, /* x2x1 + x2x1 config */
+	{1, 1, 0x16}, /* x1x1 + x1x1 config */
+	{2, 2, 0x18}, /* x2x2 + x2x2 config */
+	{1, 2, 0x19} /* x1x2 + x1x2 config */
+};
+
+/* port, nlanes, bbindex, portcfg */
+static const unsigned int phy_port_cfg[][4] = {
+	/* sip0 */
+	{0, 1, 0, 0x15},
+	{0, 2, 0, 0x15},
+	{0, 4, 0, 0x15},
+	{0, 4, 2, 0x22},
+	/* sip1 */
+	{2, 1, 4, 0x15},
+	{2, 2, 4, 0x15},
+	{2, 4, 4, 0x15},
+	{2, 4, 6, 0x22}
+};
+
+static void ipu6_isys_csi2_phy_config_by_port(struct ipu6_isys *isys,
+					      unsigned int port,
+					      unsigned int nlanes)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *base = isys->adev->isp->base;
+	unsigned int bbnum;
+	u32 val, reg, i;
+
+	dev_dbg(dev, "port %u with %u lanes", port, nlanes);
+
+	/* only support <1.5Gbps */
+	for (i = 0; i < IPU6SE_ISYS_PHY_BB_NUM; i++) {
+		/* cphy_dll_ovrd.crcdc_fsm_dlane0 = 13 */
+		reg = IPU6SE_ISYS_PHY_0_BASE + PHY_CPHY_DLL_OVRD(i);
+		val = readl(base + reg);
+		val |= FIELD_PREP(GENMASK(6, 1), 13);
+		writel(val, base + reg);
+
+		/* cphy_rx_control1.en_crc1 = 1 */
+		reg = IPU6SE_ISYS_PHY_0_BASE + PHY_CPHY_RX_CONTROL1(i);
+		val = readl(base + reg);
+		val |= BIT(31);
+		writel(val, base + reg);
+
+		/* dphy_cfg.reserved = 1, .lden_from_dll_ovrd_0 = 1 */
+		reg = IPU6SE_ISYS_PHY_0_BASE + PHY_DPHY_CFG(i);
+		val = readl(base + reg);
+		val |= BIT(25) | BIT(26);
+		writel(val, base + reg);
+
+		/* cphy_dll_ovrd.lden_crcdc_fsm_dlane0 = 1 */
+		reg = IPU6SE_ISYS_PHY_0_BASE + PHY_CPHY_DLL_OVRD(i);
+		val = readl(base + reg);
+		val |= BIT(0);
+		writel(val, base + reg);
+	}
+
+	/* Front end config, use minimal channel loss */
+	for (i = 0; i < ARRAY_SIZE(phy_port_cfg); i++) {
+		if (phy_port_cfg[i][0] == port &&
+		    phy_port_cfg[i][1] == nlanes) {
+			bbnum = phy_port_cfg[i][2] / 2;
+			reg = IPU6SE_ISYS_PHY_0_BASE + PHY_BB_AFE_CONFIG(bbnum);
+			val = readl(base + reg);
+			val |= phy_port_cfg[i][3];
+			writel(val, base + reg);
+		}
+	}
+}
+
+static void ipu6_isys_csi2_rx_control(struct ipu6_isys *isys)
+{
+	void __iomem *base = isys->adev->isp->base;
+	u32 val, reg;
+
+	reg = CSI2_HUB_GPREG_SIP0_CSI_RX_A_CONTROL;
+	val = readl(base + reg);
+	val |= BIT(0);
+	writel(val, base + CSI2_HUB_GPREG_SIP0_CSI_RX_A_CONTROL);
+
+	reg = CSI2_HUB_GPREG_SIP0_CSI_RX_B_CONTROL;
+	val = readl(base + reg);
+	val |= BIT(0);
+	writel(val, base + CSI2_HUB_GPREG_SIP0_CSI_RX_B_CONTROL);
+
+	reg = CSI2_HUB_GPREG_SIP1_CSI_RX_A_CONTROL;
+	val = readl(base + reg);
+	val |= BIT(0);
+	writel(val, base + CSI2_HUB_GPREG_SIP1_CSI_RX_A_CONTROL);
+
+	reg = CSI2_HUB_GPREG_SIP1_CSI_RX_B_CONTROL;
+	val = readl(base + reg);
+	val |= BIT(0);
+	writel(val, base + CSI2_HUB_GPREG_SIP1_CSI_RX_B_CONTROL);
+}
+
+static int ipu6_isys_csi2_set_port_cfg(struct ipu6_isys *isys,
+				       unsigned int port, unsigned int nlanes)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int sip = port / 2;
+	unsigned int index;
+
+	switch (nlanes) {
+	case 1:
+		index = 5;
+		break;
+	case 2:
+		index = 6;
+		break;
+	case 4:
+		index = 1;
+		break;
+	default:
+		dev_err(dev, "lanes nr %u is unsupported\n", nlanes);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "port config for port %u with %u lanes\n",	port, nlanes);
+
+	writel(csi2_port_cfg[index][2],
+	       isys->pdata->base + CSI2_HUB_GPREG_SIP_FB_PORT_CFG(sip));
+
+	return 0;
+}
+
+static void
+ipu6_isys_csi2_set_timing(struct ipu6_isys *isys,
+			  const struct ipu6_isys_csi2_timing *timing,
+			  unsigned int port, unsigned int nlanes)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *reg;
+	u32 port_base;
+	u32 i;
+
+	port_base = (port % 2) ? CSI2_SIP_TOP_CSI_RX_PORT_BASE_1(port) :
+		CSI2_SIP_TOP_CSI_RX_PORT_BASE_0(port);
+
+	dev_dbg(dev, "set timing for port %u with %u lanes\n", port, nlanes);
+
+	reg = isys->pdata->base + port_base;
+	reg += CSI2_SIP_TOP_CSI_RX_DLY_CNT_TERMEN_CLANE;
+
+	writel(timing->ctermen, reg);
+
+	reg = isys->pdata->base + port_base;
+	reg += CSI2_SIP_TOP_CSI_RX_DLY_CNT_SETTLE_CLANE;
+	writel(timing->csettle, reg);
+
+	for (i = 0; i < nlanes; i++) {
+		reg = isys->pdata->base + port_base;
+		reg += CSI2_SIP_TOP_CSI_RX_DLY_CNT_TERMEN_DLANE(i);
+		writel(timing->dtermen, reg);
+
+		reg = isys->pdata->base + port_base;
+		reg += CSI2_SIP_TOP_CSI_RX_DLY_CNT_SETTLE_DLANE(i);
+		writel(timing->dsettle, reg);
+	}
+}
+
+#define DPHY_TIMER_INCR	0x28
+int ipu6_isys_jsl_phy_set_power(struct ipu6_isys *isys,
+				struct ipu6_isys_csi2_config *cfg,
+				const struct ipu6_isys_csi2_timing *timing,
+				bool on)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	int ret = 0;
+	u32 nlanes;
+	u32 port;
+
+	if (!on)
+		return 0;
+
+	port = cfg->port;
+	nlanes = cfg->nlanes;
+
+	if (!isys_base || port >= isys->pdata->ipdata->csi2.nports) {
+		dev_warn(dev, "invalid port ID %d\n", port);
+		return -EINVAL;
+	}
+
+	ipu6_isys_csi2_phy_config_by_port(isys, port, nlanes);
+
+	writel(DPHY_TIMER_INCR,
+	       isys->pdata->base + CSI2_HUB_GPREG_DPHY_TIMER_INCR);
+
+	/* set port cfg and rx timing */
+	ipu6_isys_csi2_set_timing(isys, timing, port, nlanes);
+
+	ret = ipu6_isys_csi2_set_port_cfg(isys, port, nlanes);
+	if (ret)
+		return ret;
+
+	ipu6_isys_csi2_rx_control(isys);
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
new file mode 100644
index 000000000000..2c85fbe6846f
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/refcount.h>
+#include <linux/time64.h>
+
+#include <media/v4l2-async.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+
+#define CSI_REG_HUB_GPREG_PHY_CTL(id) (CSI_REG_BASE + 0x18008 + (id) * 0x8)
+#define CSI_REG_HUB_GPREG_PHY_CTL_RESET			BIT(4)
+#define CSI_REG_HUB_GPREG_PHY_CTL_PWR_EN		BIT(0)
+#define CSI_REG_HUB_GPREG_PHY_STATUS(id) (CSI_REG_BASE + 0x1800c + (id) * 0x8)
+#define CSI_REG_HUB_GPREG_PHY_POWER_ACK			BIT(0)
+#define CSI_REG_HUB_GPREG_PHY_READY			BIT(4)
+
+#define MCD_PHY_POWER_STATUS_TIMEOUT			(200 * USEC_PER_MSEC)
+
+/*
+ * bridge to phy in buttress reg map, each phy has 16 kbytes
+ * only 2 phys for TGL U and Y
+ */
+#define IPU6_ISYS_MCD_PHY_BASE(i)			(0x10000 + (i) * 0x4000)
+
+/*
+ *  There are 2 MCD DPHY instances on TGL and 1 MCD DPHY instance on ADL.
+ *  Each MCD PHY has 12-lanes which has 8 data lanes and 4 clock lanes.
+ *  CSI port 1, 3 (5, 7) can support max 2 data lanes.
+ *  CSI port 0, 2 (4, 6) can support max 4 data lanes.
+ *  PHY configurations are PPI based instead of port.
+ *  Left:
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | PPI     | PPI5    | PPI4    | PPI3    | PPI2   | PPI1    | PPI0     |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x4      | unused  | D3      | D2      | C0     | D0      | D1       |
+ *  |---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x2x2    | C1      | D0      | D1      | C0     | D0      | D1       |
+ *  ----------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x2x1    | C1      | D0      | unused  | C0     | D0      | D1       |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x1x1    | C1      | D0      | unused  | C0     | D0      | unused   |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x1x2    | C1      | D0      | D1      | C0     | D0      | unused   |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *
+ *  Right:
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | PPI     | PPI6    | PPI7    | PPI8    | PPI9   | PPI10   | PPI11    |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x4      | D1      | D0      | C2      | D2     | D3      | unused   |
+ *  |---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x2x2    | D1      | D0      | C2      | D1     | D0      | C3       |
+ *  ----------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x2x1    | D1      | D0      | C2      | unused | D0      | C3       |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x1x1    | unused  | D0      | C2      | unused | D0      | C3       |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *  |         |         |         |         |        |         |          |
+ *  | x1x2    | unused  | D0      | C2      | D1     | D0      | C3       |
+ *  +---------+---------+---------+---------+--------+---------+----------+
+ *
+ * ppi mapping per phy :
+ *
+ * x4 + x4:
+ * Left : port0 - PPI range {0, 1, 2, 3, 4}
+ * Right: port2 - PPI range {6, 7, 8, 9, 10}
+ *
+ * x4 + x2x2:
+ * Left: port0 - PPI range {0, 1, 2, 3, 4}
+ * Right: port2 - PPI range {6, 7, 8}, port3 - PPI range {9, 10, 11}
+ *
+ * x2x2 + x4:
+ * Left: port0 - PPI range {0, 1, 2}, port1 - PPI range {3, 4, 5}
+ * Right: port2 - PPI range {6, 7, 8, 9, 10}
+ *
+ * x2x2 + x2x2:
+ * Left : port0 - PPI range {0, 1, 2}, port1 - PPI range {3, 4, 5}
+ * Right: port2 - PPI range {6, 7, 8}, port3 - PPI range {9, 10, 11}
+ */
+
+struct phy_reg {
+	u32 reg;
+	u32 val;
+};
+
+static const struct phy_reg common_init_regs[] = {
+	/* for TGL-U, use 0x80000000 */
+	{0x00000040, 0x80000000},
+	{0x00000044, 0x00a80880},
+	{0x00000044, 0x00b80880},
+	{0x00000010, 0x0000078c},
+	{0x00000344, 0x2f4401e2},
+	{0x00000544, 0x924401e2},
+	{0x00000744, 0x594401e2},
+	{0x00000944, 0x624401e2},
+	{0x00000b44, 0xfc4401e2},
+	{0x00000d44, 0xc54401e2},
+	{0x00000f44, 0x034401e2},
+	{0x00001144, 0x8f4401e2},
+	{0x00001344, 0x754401e2},
+	{0x00001544, 0xe94401e2},
+	{0x00001744, 0xcb4401e2},
+	{0x00001944, 0xfa4401e2}
+};
+
+static const struct phy_reg x1_port0_config_regs[] = {
+	{0x00000694, 0xc80060fa},
+	{0x00000680, 0x3d4f78ea},
+	{0x00000690, 0x10a0140b},
+	{0x000006a8, 0xdf04010a},
+	{0x00000700, 0x57050060},
+	{0x00000710, 0x0030001c},
+	{0x00000738, 0x5f004444},
+	{0x0000073c, 0x78464204},
+	{0x00000748, 0x7821f940},
+	{0x0000074c, 0xb2000433},
+	{0x00000494, 0xfe6030fa},
+	{0x00000480, 0x29ef5ed0},
+	{0x00000490, 0x10a0540b},
+	{0x000004a8, 0x7a01010a},
+	{0x00000500, 0xef053460},
+	{0x00000510, 0xe030101c},
+	{0x00000538, 0xdf808444},
+	{0x0000053c, 0xc8422204},
+	{0x00000540, 0x0180088c},
+	{0x00000574, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x1_port1_config_regs[] = {
+	{0x00000c94, 0xc80060fa},
+	{0x00000c80, 0xcf47abea},
+	{0x00000c90, 0x10a0840b},
+	{0x00000ca8, 0xdf04010a},
+	{0x00000d00, 0x57050060},
+	{0x00000d10, 0x0030001c},
+	{0x00000d38, 0x5f004444},
+	{0x00000d3c, 0x78464204},
+	{0x00000d48, 0x7821f940},
+	{0x00000d4c, 0xb2000433},
+	{0x00000a94, 0xc91030fa},
+	{0x00000a80, 0x5a166ed0},
+	{0x00000a90, 0x10a0540b},
+	{0x00000aa8, 0x5d060100},
+	{0x00000b00, 0xef053460},
+	{0x00000b10, 0xa030101c},
+	{0x00000b38, 0xdf808444},
+	{0x00000b3c, 0xc8422204},
+	{0x00000b40, 0x0180088c},
+	{0x00000b74, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x1_port2_config_regs[] = {
+	{0x00001294, 0x28f000fa},
+	{0x00001280, 0x08130cea},
+	{0x00001290, 0x10a0140b},
+	{0x000012a8, 0xd704010a},
+	{0x00001300, 0x8d050060},
+	{0x00001310, 0x0030001c},
+	{0x00001338, 0xdf008444},
+	{0x0000133c, 0x78422204},
+	{0x00001348, 0x7821f940},
+	{0x0000134c, 0x5a000433},
+	{0x00001094, 0x2d20b0fa},
+	{0x00001080, 0xade75dd0},
+	{0x00001090, 0x10a0540b},
+	{0x000010a8, 0xb101010a},
+	{0x00001100, 0x33053460},
+	{0x00001110, 0x0030101c},
+	{0x00001138, 0xdf808444},
+	{0x0000113c, 0xc8422204},
+	{0x00001140, 0x8180088c},
+	{0x00001174, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x1_port3_config_regs[] = {
+	{0x00001894, 0xc80060fa},
+	{0x00001880, 0x0f90fd6a},
+	{0x00001890, 0x10a0840b},
+	{0x000018a8, 0xdf04010a},
+	{0x00001900, 0x57050060},
+	{0x00001910, 0x0030001c},
+	{0x00001938, 0x5f004444},
+	{0x0000193c, 0x78464204},
+	{0x00001948, 0x7821f940},
+	{0x0000194c, 0xb2000433},
+	{0x00001694, 0x3050d0fa},
+	{0x00001680, 0x0ef6d050},
+	{0x00001690, 0x10a0540b},
+	{0x000016a8, 0xe301010a},
+	{0x00001700, 0x69053460},
+	{0x00001710, 0xa030101c},
+	{0x00001738, 0xdf808444},
+	{0x0000173c, 0xc8422204},
+	{0x00001740, 0x0180088c},
+	{0x00001774, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x2_port0_config_regs[] = {
+	{0x00000694, 0xc80060fa},
+	{0x00000680, 0x3d4f78ea},
+	{0x00000690, 0x10a0140b},
+	{0x000006a8, 0xdf04010a},
+	{0x00000700, 0x57050060},
+	{0x00000710, 0x0030001c},
+	{0x00000738, 0x5f004444},
+	{0x0000073c, 0x78464204},
+	{0x00000748, 0x7821f940},
+	{0x0000074c, 0xb2000433},
+	{0x00000494, 0xc80060fa},
+	{0x00000480, 0x29ef5ed8},
+	{0x00000490, 0x10a0540b},
+	{0x000004a8, 0x7a01010a},
+	{0x00000500, 0xef053460},
+	{0x00000510, 0xe030101c},
+	{0x00000538, 0xdf808444},
+	{0x0000053c, 0xc8422204},
+	{0x00000540, 0x0180088c},
+	{0x00000574, 0x00000000},
+	{0x00000294, 0xc80060fa},
+	{0x00000280, 0xcb45b950},
+	{0x00000290, 0x10a0540b},
+	{0x000002a8, 0x8c01010a},
+	{0x00000300, 0xef053460},
+	{0x00000310, 0x8030101c},
+	{0x00000338, 0x41808444},
+	{0x0000033c, 0x32422204},
+	{0x00000340, 0x0180088c},
+	{0x00000374, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x2_port1_config_regs[] = {
+	{0x00000c94, 0xc80060fa},
+	{0x00000c80, 0xcf47abea},
+	{0x00000c90, 0x10a0840b},
+	{0x00000ca8, 0xdf04010a},
+	{0x00000d00, 0x57050060},
+	{0x00000d10, 0x0030001c},
+	{0x00000d38, 0x5f004444},
+	{0x00000d3c, 0x78464204},
+	{0x00000d48, 0x7821f940},
+	{0x00000d4c, 0xb2000433},
+	{0x00000a94, 0xc80060fa},
+	{0x00000a80, 0x5a166ed8},
+	{0x00000a90, 0x10a0540b},
+	{0x00000aa8, 0x7a01010a},
+	{0x00000b00, 0xef053460},
+	{0x00000b10, 0xa030101c},
+	{0x00000b38, 0xdf808444},
+	{0x00000b3c, 0xc8422204},
+	{0x00000b40, 0x0180088c},
+	{0x00000b74, 0x00000000},
+	{0x00000894, 0xc80060fa},
+	{0x00000880, 0x4d4f21d0},
+	{0x00000890, 0x10a0540b},
+	{0x000008a8, 0x5601010a},
+	{0x00000900, 0xef053460},
+	{0x00000910, 0x8030101c},
+	{0x00000938, 0xdf808444},
+	{0x0000093c, 0xc8422204},
+	{0x00000940, 0x0180088c},
+	{0x00000974, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x2_port2_config_regs[] = {
+	{0x00001294, 0xc80060fa},
+	{0x00001280, 0x08130cea},
+	{0x00001290, 0x10a0140b},
+	{0x000012a8, 0xd704010a},
+	{0x00001300, 0x8d050060},
+	{0x00001310, 0x0030001c},
+	{0x00001338, 0xdf008444},
+	{0x0000133c, 0x78422204},
+	{0x00001348, 0x7821f940},
+	{0x0000134c, 0x5a000433},
+	{0x00001094, 0xc80060fa},
+	{0x00001080, 0xade75dd8},
+	{0x00001090, 0x10a0540b},
+	{0x000010a8, 0xb101010a},
+	{0x00001100, 0x33053460},
+	{0x00001110, 0x0030101c},
+	{0x00001138, 0xdf808444},
+	{0x0000113c, 0xc8422204},
+	{0x00001140, 0x8180088c},
+	{0x00001174, 0x00000000},
+	{0x00000e94, 0xc80060fa},
+	{0x00000e80, 0x0fbf16d0},
+	{0x00000e90, 0x10a0540b},
+	{0x00000ea8, 0x7a01010a},
+	{0x00000f00, 0xf5053460},
+	{0x00000f10, 0xc030101c},
+	{0x00000f38, 0xdf808444},
+	{0x00000f3c, 0xc8422204},
+	{0x00000f40, 0x8180088c},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x2_port3_config_regs[] = {
+	{0x00001894, 0xc80060fa},
+	{0x00001880, 0x0f90fd6a},
+	{0x00001890, 0x10a0840b},
+	{0x000018a8, 0xdf04010a},
+	{0x00001900, 0x57050060},
+	{0x00001910, 0x0030001c},
+	{0x00001938, 0x5f004444},
+	{0x0000193c, 0x78464204},
+	{0x00001948, 0x7821f940},
+	{0x0000194c, 0xb2000433},
+	{0x00001694, 0xc80060fa},
+	{0x00001680, 0x0ef6d058},
+	{0x00001690, 0x10a0540b},
+	{0x000016a8, 0x7a01010a},
+	{0x00001700, 0x69053460},
+	{0x00001710, 0xa030101c},
+	{0x00001738, 0xdf808444},
+	{0x0000173c, 0xc8422204},
+	{0x00001740, 0x0180088c},
+	{0x00001774, 0x00000000},
+	{0x00001494, 0xc80060fa},
+	{0x00001480, 0xf9d34bd0},
+	{0x00001490, 0x10a0540b},
+	{0x000014a8, 0x7a01010a},
+	{0x00001500, 0x1b053460},
+	{0x00001510, 0x0030101c},
+	{0x00001538, 0xdf808444},
+	{0x0000153c, 0xc8422204},
+	{0x00001540, 0x8180088c},
+	{0x00001574, 0x00000000},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x4_port0_config_regs[] = {
+	{0x00000694, 0xc80060fa},
+	{0x00000680, 0x3d4f78fa},
+	{0x00000690, 0x10a0140b},
+	{0x000006a8, 0xdf04010a},
+	{0x00000700, 0x57050060},
+	{0x00000710, 0x0030001c},
+	{0x00000738, 0x5f004444},
+	{0x0000073c, 0x78464204},
+	{0x00000748, 0x7821f940},
+	{0x0000074c, 0xb2000433},
+	{0x00000494, 0xfe6030fa},
+	{0x00000480, 0x29ef5ed8},
+	{0x00000490, 0x10a0540b},
+	{0x000004a8, 0x7a01010a},
+	{0x00000500, 0xef053460},
+	{0x00000510, 0xe030101c},
+	{0x00000538, 0xdf808444},
+	{0x0000053c, 0xc8422204},
+	{0x00000540, 0x0180088c},
+	{0x00000574, 0x00000004},
+	{0x00000294, 0x23e030fa},
+	{0x00000280, 0xcb45b950},
+	{0x00000290, 0x10a0540b},
+	{0x000002a8, 0x8c01010a},
+	{0x00000300, 0xef053460},
+	{0x00000310, 0x8030101c},
+	{0x00000338, 0x41808444},
+	{0x0000033c, 0x32422204},
+	{0x00000340, 0x0180088c},
+	{0x00000374, 0x00000004},
+	{0x00000894, 0x5620b0fa},
+	{0x00000880, 0x4d4f21dc},
+	{0x00000890, 0x10a0540b},
+	{0x000008a8, 0x5601010a},
+	{0x00000900, 0xef053460},
+	{0x00000910, 0x8030101c},
+	{0x00000938, 0xdf808444},
+	{0x0000093c, 0xc8422204},
+	{0x00000940, 0x0180088c},
+	{0x00000974, 0x00000004},
+	{0x00000a94, 0xc91030fa},
+	{0x00000a80, 0x5a166ecc},
+	{0x00000a90, 0x10a0540b},
+	{0x00000aa8, 0x5d01010a},
+	{0x00000b00, 0xef053460},
+	{0x00000b10, 0xa030101c},
+	{0x00000b38, 0xdf808444},
+	{0x00000b3c, 0xc8422204},
+	{0x00000b40, 0x0180088c},
+	{0x00000b74, 0x00000004},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x4_port1_config_regs[] = {
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x4_port2_config_regs[] = {
+	{0x00001294, 0x28f000fa},
+	{0x00001280, 0x08130cfa},
+	{0x00001290, 0x10c0140b},
+	{0x000012a8, 0xd704010a},
+	{0x00001300, 0x8d050060},
+	{0x00001310, 0x0030001c},
+	{0x00001338, 0xdf008444},
+	{0x0000133c, 0x78422204},
+	{0x00001348, 0x7821f940},
+	{0x0000134c, 0x5a000433},
+	{0x00001094, 0x2d20b0fa},
+	{0x00001080, 0xade75dd8},
+	{0x00001090, 0x10a0540b},
+	{0x000010a8, 0xb101010a},
+	{0x00001100, 0x33053460},
+	{0x00001110, 0x0030101c},
+	{0x00001138, 0xdf808444},
+	{0x0000113c, 0xc8422204},
+	{0x00001140, 0x8180088c},
+	{0x00001174, 0x00000004},
+	{0x00000e94, 0xd308d0fa},
+	{0x00000e80, 0x0fbf16d0},
+	{0x00000e90, 0x10a0540b},
+	{0x00000ea8, 0x2c01010a},
+	{0x00000f00, 0xf5053460},
+	{0x00000f10, 0xc030101c},
+	{0x00000f38, 0xdf808444},
+	{0x00000f3c, 0xc8422204},
+	{0x00000f40, 0x8180088c},
+	{0x00000f74, 0x00000004},
+	{0x00001494, 0x136850fa},
+	{0x00001480, 0xf9d34bdc},
+	{0x00001490, 0x10a0540b},
+	{0x000014a8, 0x5a01010a},
+	{0x00001500, 0x1b053460},
+	{0x00001510, 0x0030101c},
+	{0x00001538, 0xdf808444},
+	{0x0000153c, 0xc8422204},
+	{0x00001540, 0x8180088c},
+	{0x00001574, 0x00000004},
+	{0x00001694, 0x3050d0fa},
+	{0x00001680, 0x0ef6d04c},
+	{0x00001690, 0x10a0540b},
+	{0x000016a8, 0xe301010a},
+	{0x00001700, 0x69053460},
+	{0x00001710, 0xa030101c},
+	{0x00001738, 0xdf808444},
+	{0x0000173c, 0xc8422204},
+	{0x00001740, 0x0180088c},
+	{0x00001774, 0x00000004},
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg x4_port3_config_regs[] = {
+	{0x00000000, 0x00000000}
+};
+
+static const struct phy_reg *x1_config_regs[4] = {
+	x1_port0_config_regs,
+	x1_port1_config_regs,
+	x1_port2_config_regs,
+	x1_port3_config_regs
+};
+
+static const struct phy_reg *x2_config_regs[4] = {
+	x2_port0_config_regs,
+	x2_port1_config_regs,
+	x2_port2_config_regs,
+	x2_port3_config_regs
+};
+
+static const struct phy_reg *x4_config_regs[4] = {
+	x4_port0_config_regs,
+	x4_port1_config_regs,
+	x4_port2_config_regs,
+	x4_port3_config_regs
+};
+
+static const struct phy_reg **config_regs[3] = {
+	x1_config_regs,
+	x2_config_regs,
+	x4_config_regs
+};
+
+static int ipu6_isys_mcd_phy_powerup_ack(struct ipu6_isys *isys, u8 id)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	u32 val;
+	int ret;
+
+	val = readl(isys_base + CSI_REG_HUB_GPREG_PHY_CTL(id));
+	val |= CSI_REG_HUB_GPREG_PHY_CTL_PWR_EN;
+	writel(val, isys_base + CSI_REG_HUB_GPREG_PHY_CTL(id));
+
+	ret = readl_poll_timeout(isys_base + CSI_REG_HUB_GPREG_PHY_STATUS(id),
+				 val, val & CSI_REG_HUB_GPREG_PHY_POWER_ACK,
+				 200, MCD_PHY_POWER_STATUS_TIMEOUT);
+	if (ret)
+		dev_err(dev, "PHY%d powerup ack timeout", id);
+
+	return ret;
+}
+
+static int ipu6_isys_mcd_phy_powerdown_ack(struct ipu6_isys *isys, u8 id)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	u32 val;
+	int ret;
+
+	writel(0, isys_base + CSI_REG_HUB_GPREG_PHY_CTL(id));
+	ret = readl_poll_timeout(isys_base + CSI_REG_HUB_GPREG_PHY_STATUS(id),
+				 val, !(val & CSI_REG_HUB_GPREG_PHY_POWER_ACK),
+				 200, MCD_PHY_POWER_STATUS_TIMEOUT);
+	if (ret)
+		dev_err(dev, "PHY%d powerdown ack timeout", id);
+
+	return ret;
+}
+
+static void ipu6_isys_mcd_phy_reset(struct ipu6_isys *isys, u8 id, bool assert)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	u32 val;
+
+	val = readl(isys_base + CSI_REG_HUB_GPREG_PHY_CTL(id));
+	if (assert)
+		val |= CSI_REG_HUB_GPREG_PHY_CTL_RESET;
+	else
+		val &= ~(CSI_REG_HUB_GPREG_PHY_CTL_RESET);
+
+	writel(val, isys_base + CSI_REG_HUB_GPREG_PHY_CTL(id));
+}
+
+static int ipu6_isys_mcd_phy_ready(struct ipu6_isys *isys, u8 id)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(isys_base + CSI_REG_HUB_GPREG_PHY_STATUS(id),
+				 val, val & CSI_REG_HUB_GPREG_PHY_READY,
+				 200, MCD_PHY_POWER_STATUS_TIMEOUT);
+	if (ret)
+		dev_err(dev, "PHY%d ready ack timeout", id);
+
+	return ret;
+}
+
+static void ipu6_isys_mcd_phy_common_init(struct ipu6_isys *isys)
+{
+	struct ipu6_bus_device *adev = isys->adev;
+	struct ipu6_device *isp = adev->isp;
+	void __iomem *isp_base = isp->base;
+	struct sensor_async_sd *s_asd;
+	struct v4l2_async_connection *asc;
+	void __iomem *phy_base;
+	unsigned int i;
+	u8 phy_id;
+
+	list_for_each_entry(asc, &isys->notifier.done_list, asc_entry) {
+		s_asd = container_of(asc, struct sensor_async_sd, asc);
+		phy_id = s_asd->csi2.port / 4;
+		phy_base = isp_base + IPU6_ISYS_MCD_PHY_BASE(phy_id);
+
+		for (i = 0; i < ARRAY_SIZE(common_init_regs); i++)
+			writel(common_init_regs[i].val,
+			       phy_base + common_init_regs[i].reg);
+	}
+}
+
+static int ipu6_isys_driver_port_to_phy_port(struct ipu6_isys_csi2_config *cfg)
+{
+	int phy_port;
+	int ret;
+
+	if (!(cfg->nlanes == 4 || cfg->nlanes == 2 || cfg->nlanes == 1))
+		return -EINVAL;
+
+	/* B,F -> C0 A,E -> C1 C,G -> C2 D,H -> C4 */
+	/* normalize driver port number */
+	phy_port = cfg->port % 4;
+
+	/* swap port number only for A and B */
+	if (phy_port == 0)
+		phy_port = 1;
+	else if (phy_port == 1)
+		phy_port = 0;
+
+	ret = phy_port;
+
+	/* check validity per lane configuration */
+	if (cfg->nlanes == 4 && !(phy_port == 0 || phy_port == 2))
+		ret = -EINVAL;
+	else if ((cfg->nlanes == 2 || cfg->nlanes == 1) &&
+		 !(phy_port >= 0 && phy_port <= 3))
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int ipu6_isys_mcd_phy_config(struct ipu6_isys *isys)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu6_bus_device *adev = isys->adev;
+	const struct phy_reg **phy_config_regs;
+	struct ipu6_device *isp = adev->isp;
+	void __iomem *isp_base = isp->base;
+	struct sensor_async_sd *s_asd;
+	struct ipu6_isys_csi2_config cfg;
+	struct v4l2_async_connection *asc;
+	u8 phy_port, phy_id;
+	unsigned int i;
+	void __iomem *phy_base;
+
+	list_for_each_entry(asc, &isys->notifier.done_list, asc_entry) {
+		s_asd = container_of(asc, struct sensor_async_sd, asc);
+		cfg.port = s_asd->csi2.port;
+		cfg.nlanes = s_asd->csi2.nlanes;
+		phy_port = ipu6_isys_driver_port_to_phy_port(&cfg);
+		if (phy_port < 0) {
+			dev_err(dev, "invalid port %d for lane %d", cfg.port,
+				cfg.nlanes);
+			return -ENXIO;
+		}
+
+		phy_id = cfg.port / 4;
+		phy_base = isp_base + IPU6_ISYS_MCD_PHY_BASE(phy_id);
+		dev_dbg(dev, "port%d PHY%u lanes %u\n", cfg.port, phy_id,
+			cfg.nlanes);
+
+		phy_config_regs = config_regs[cfg.nlanes / 2];
+		cfg.port = phy_port;
+		for (i = 0; phy_config_regs[cfg.port][i].reg; i++)
+			writel(phy_config_regs[cfg.port][i].val,
+			       phy_base + phy_config_regs[cfg.port][i].reg);
+	}
+
+	return 0;
+}
+
+#define CSI_MCD_PHY_NUM		2
+static refcount_t phy_power_ref_count[CSI_MCD_PHY_NUM];
+
+int ipu6_isys_mcd_phy_set_power(struct ipu6_isys *isys,
+				struct ipu6_isys_csi2_config *cfg,
+				const struct ipu6_isys_csi2_timing *timing,
+				bool on)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	u8 port, phy_id;
+	refcount_t *ref;
+	int ret;
+
+	port = cfg->port;
+	phy_id = port / 4;
+
+	ref = &phy_power_ref_count[phy_id];
+
+	dev_dbg(dev, "for phy %d port %d, lanes: %d\n", phy_id, port,
+		cfg->nlanes);
+
+	if (!isys_base || port >= isys->pdata->ipdata->csi2.nports) {
+		dev_warn(dev, "invalid port ID %d\n", port);
+		return -EINVAL;
+	}
+
+	if (on) {
+		if (refcount_read(ref)) {
+			dev_dbg(dev, "for phy %d is already UP", phy_id);
+			refcount_inc(ref);
+			return 0;
+		}
+
+		ret = ipu6_isys_mcd_phy_powerup_ack(isys, phy_id);
+		if (ret)
+			return ret;
+
+		ipu6_isys_mcd_phy_reset(isys, phy_id, 0);
+		ipu6_isys_mcd_phy_common_init(isys);
+
+		ret = ipu6_isys_mcd_phy_config(isys);
+		if (ret)
+			return ret;
+
+		ipu6_isys_mcd_phy_reset(isys, phy_id, 1);
+		ret = ipu6_isys_mcd_phy_ready(isys, phy_id);
+		if (ret)
+			return ret;
+
+		refcount_set(ref, 1);
+		return 0;
+	}
+
+	if (!refcount_dec_and_test(ref))
+		return 0;
+
+	return ipu6_isys_mcd_phy_powerdown_ack(isys, phy_id);
+}
-- 
2.39.2


