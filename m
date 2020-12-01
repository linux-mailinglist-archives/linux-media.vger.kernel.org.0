Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FFA2CA8AA
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389162AbgLAQsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:48:06 -0500
Received: from retiisi.eu ([95.216.213.190]:50044 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388925AbgLAQsF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 11:48:05 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E636C634C92;
        Tue,  1 Dec 2020 18:45:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 08/30] ccs: Add CCS static data parser library
Date:   Tue,  1 Dec 2020 18:42:24 +0200
Message-Id: <20201201164246.18003-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a parser library for parsing the CCS static data format.

The library may be also compiled in user space as the format has uses also
in the user space. Therefore it is dual licensed under the 3-clause BSD
license as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/Makefile        |   2 +-
 drivers/media/i2c/ccs/ccs-data-defs.h | 221 ++++++
 drivers/media/i2c/ccs/ccs-data.c      | 953 ++++++++++++++++++++++++++
 drivers/media/i2c/ccs/ccs-data.h      | 227 ++++++
 4 files changed, 1402 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/i2c/ccs/ccs-data-defs.h
 create mode 100644 drivers/media/i2c/ccs/ccs-data.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data.h

diff --git a/drivers/media/i2c/ccs/Makefile b/drivers/media/i2c/ccs/Makefile
index 08dd4e948fb0..44601ba8cd53 100644
--- a/drivers/media/i2c/ccs/Makefile
+++ b/drivers/media/i2c/ccs/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccs-objs			+= ccs-core.o ccs-reg-access.o \
-				   ccs-quirk.o ccs-limits.o
+				   ccs-quirk.o ccs-limits.o ccs-data.o
 obj-$(CONFIG_VIDEO_CCS)		+= ccs.o
 
 ccflags-y += -I $(srctree)/drivers/media/i2c
diff --git a/drivers/media/i2c/ccs/ccs-data-defs.h b/drivers/media/i2c/ccs/ccs-data-defs.h
new file mode 100644
index 000000000000..1c9b1d1acd50
--- /dev/null
+++ b/drivers/media/i2c/ccs/ccs-data-defs.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * CCS static data binary format definitions
+ *
+ * Copyright 2019--2020 Intel Corporation
+ */
+
+#ifndef __CCS_DATA_DEFS_H__
+#define __CCS_DATA_DEFS_H__
+
+#include "ccs-data.h"
+
+#define CCS_STATIC_DATA_VERSION	0
+
+enum __ccs_data_length_specifier_id {
+	CCS_DATA_LENGTH_SPECIFIER_1 = 0,
+	CCS_DATA_LENGTH_SPECIFIER_2 = 1,
+	CCS_DATA_LENGTH_SPECIFIER_3 = 2
+};
+
+#define CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT	6
+
+struct __ccs_data_length_specifier {
+	u8 length;
+} __packed;
+
+struct __ccs_data_length_specifier2 {
+	u8 length[2];
+} __packed;
+
+struct __ccs_data_length_specifier3 {
+	u8 length[3];
+} __packed;
+
+struct __ccs_data_block {
+	u8 id;
+	struct __ccs_data_length_specifier length;
+} __packed;
+
+#define CCS_DATA_BLOCK_HEADER_ID_VERSION_SHIFT	5
+
+struct __ccs_data_block3 {
+	u8 id;
+	struct __ccs_data_length_specifier2 length;
+} __packed;
+
+struct __ccs_data_block4 {
+	u8 id;
+	struct __ccs_data_length_specifier3 length;
+} __packed;
+
+enum __ccs_data_block_id {
+	CCS_DATA_BLOCK_ID_DUMMY	= 1,
+	CCS_DATA_BLOCK_ID_DATA_VERSION = 2,
+	CCS_DATA_BLOCK_ID_SENSOR_READ_ONLY_REGS = 3,
+	CCS_DATA_BLOCK_ID_MODULE_READ_ONLY_REGS = 4,
+	CCS_DATA_BLOCK_ID_SENSOR_MANUFACTURER_REGS = 5,
+	CCS_DATA_BLOCK_ID_MODULE_MANUFACTURER_REGS = 6,
+	CCS_DATA_BLOCK_ID_SENSOR_RULE_BASED_BLOCK = 32,
+	CCS_DATA_BLOCK_ID_MODULE_RULE_BASED_BLOCK = 33,
+	CCS_DATA_BLOCK_ID_SENSOR_PDAF_PIXEL_LOCATION = 36,
+	CCS_DATA_BLOCK_ID_MODULE_PDAF_PIXEL_LOCATION = 37,
+	CCS_DATA_BLOCK_ID_LICENSE = 40,
+	CCS_DATA_BLOCK_ID_END = 127,
+};
+
+struct __ccs_data_block_version {
+	u8 static_data_version_major[2];
+	u8 static_data_version_minor[2];
+	u8 year[2];
+	u8 month;
+	u8 day;
+} __packed;
+
+struct __ccs_data_block_regs {
+	u8 reg_len;
+} __packed;
+
+#define CCS_DATA_BLOCK_REGS_ADDR_MASK		0x07
+#define CCS_DATA_BLOCK_REGS_LEN_SHIFT		3
+#define CCS_DATA_BLOCK_REGS_LEN_MASK		0x38
+#define CCS_DATA_BLOCK_REGS_SEL_SHIFT		6
+
+enum ccs_data_block_regs_sel {
+	CCS_DATA_BLOCK_REGS_SEL_REGS = 0,
+	CCS_DATA_BLOCK_REGS_SEL_REGS2 = 1,
+	CCS_DATA_BLOCK_REGS_SEL_REGS3 = 2,
+};
+
+struct __ccs_data_block_regs2 {
+	u8 reg_len;
+	u8 addr;
+} __packed;
+
+#define CCS_DATA_BLOCK_REGS_2_ADDR_MASK		0x01
+#define CCS_DATA_BLOCK_REGS_2_LEN_SHIFT		1
+#define CCS_DATA_BLOCK_REGS_2_LEN_MASK		0x3e
+
+struct __ccs_data_block_regs3 {
+	u8 reg_len;
+	u8 addr[2];
+} __packed;
+
+#define CCS_DATA_BLOCK_REGS_3_LEN_MASK		0x3f
+
+enum __ccs_data_ffd_pixelcode {
+	CCS_DATA_BLOCK_FFD_PIXELCODE_EMBEDDED = 1,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_DUMMY = 2,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BLACK = 3,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_DARK = 4,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_VISIBLE = 5,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_0 = 8,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_1 = 9,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_2 = 10,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_3 = 11,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_4 = 12,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_5 = 13,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_MS_6 = 14,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOP_OB = 16,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BOTTOM_OB = 17,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_LEFT_OB = 18,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_RIGHT_OB = 19,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOP_LEFT_OB = 20,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOP_RIGHT_OB = 21,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BOTTOM_LEFT_OB = 22,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BOTTOM_RIGHT_OB = 23,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOTAL = 24,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOP_PDAF = 32,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BOTTOM_PDAF = 33,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_LEFT_PDAF = 34,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_RIGHT_PDAF = 35,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOP_LEFT_PDAF = 36,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_TOP_RIGHT_PDAF = 37,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BOTTOM_LEFT_PDAF = 38,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_BOTTOM_RIGHT_PDAF = 39,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_SEPARATED_PDAF = 40,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_ORIGINAL_ORDER_PDAF = 41,
+	CCS_DATA_BLOCK_FFD_PIXELCODE_VENDOR_PDAF = 41,
+};
+
+struct __ccs_data_block_ffd_entry {
+	u8 pixelcode;
+	u8 reserved;
+	u8 value[2];
+} __packed;
+
+struct __ccs_data_block_ffd {
+	u8 num_column_descs;
+	u8 num_row_descs;
+} __packed;
+
+enum __ccs_data_block_rule_id {
+	CCS_DATA_BLOCK_RULE_ID_IF = 1,
+	CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS = 2,
+	CCS_DATA_BLOCK_RULE_ID_FFD = 3,
+	CCS_DATA_BLOCK_RULE_ID_MSR = 4,
+	CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT = 5,
+};
+
+struct __ccs_data_block_rule_if {
+	u8 addr[2];
+	u8 value;
+	u8 mask;
+} __packed;
+
+enum __ccs_data_block_pdaf_readout_order {
+	CCS_DATA_BLOCK_PDAF_READOUT_ORDER_ORIGINAL = 1,
+	CCS_DATA_BLOCK_PDAF_READOUT_ORDER_SEPARATE_WITHIN_LINE = 2,
+	CCS_DATA_BLOCK_PDAF_READOUT_ORDER_SEPARATE_TYPES_SEPARATE_LINES = 3,
+};
+
+struct __ccs_data_block_pdaf_readout {
+	u8 pdaf_readout_info_reserved;
+	u8 pdaf_readout_info_order;
+} __packed;
+
+struct __ccs_data_block_pdaf_pix_loc_block_desc {
+	u8 block_type_id;
+	u8 repeat_x[2];
+} __packed;
+
+struct __ccs_data_block_pdaf_pix_loc_block_desc_group {
+	u8 num_block_descs[2];
+	u8 repeat_y;
+} __packed;
+
+enum __ccs_data_block_pdaf_pix_loc_pixel_type {
+	CCS_DATA_PDAF_PIXEL_TYPE_LEFT_SEPARATED = 0,
+	CCS_DATA_PDAF_PIXEL_TYPE_RIGHT_SEPARATED = 1,
+	CCS_DATA_PDAF_PIXEL_TYPE_TOP_SEPARATED = 2,
+	CCS_DATA_PDAF_PIXEL_TYPE_BOTTOM_SEPARATED = 3,
+	CCS_DATA_PDAF_PIXEL_TYPE_LEFT_SIDE_BY_SIDE = 4,
+	CCS_DATA_PDAF_PIXEL_TYPE_RIGHT_SIDE_BY_SIDE = 5,
+	CCS_DATA_PDAF_PIXEL_TYPE_TOP_SIDE_BY_SIDE = 6,
+	CCS_DATA_PDAF_PIXEL_TYPE_BOTTOM_SIDE_BY_SIDE = 7,
+	CCS_DATA_PDAF_PIXEL_TYPE_TOP_LEFT = 8,
+	CCS_DATA_PDAF_PIXEL_TYPE_TOP_RIGHT = 9,
+	CCS_DATA_PDAF_PIXEL_TYPE_BOTTOM_LEFT = 10,
+	CCS_DATA_PDAF_PIXEL_TYPE_BOTTOM_RIGHT = 11,
+};
+
+struct __ccs_data_block_pdaf_pix_loc_pixel_desc {
+	u8 pixel_type;
+	u8 small_offset_x;
+	u8 small_offset_y;
+} __packed;
+
+struct __ccs_data_block_pdaf_pix_loc {
+	u8 main_offset_x[2];
+	u8 main_offset_y[2];
+	u8 global_pdaf_type;
+	u8 block_width;
+	u8 block_height;
+	u8 num_block_desc_groups[2];
+} __packed;
+
+struct __ccs_data_block_end {
+	u8 crc[4];
+} __packed;
+
+#endif /* __CCS_DATA_DEFS_H__ */
diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
new file mode 100644
index 000000000000..9a6097b088bd
--- /dev/null
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -0,0 +1,953 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * CCS static data binary parser library
+ *
+ * Copyright 2019--2020 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/limits.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "ccs-data-defs.h"
+
+struct bin_container {
+	void *base;
+	void *now;
+	void *end;
+	size_t size;
+};
+
+static void *bin_alloc(struct bin_container *bin, size_t len)
+{
+	void *ptr;
+
+	len = ALIGN(len, 8);
+
+	if (bin->end - bin->now < len)
+		return NULL;
+
+	ptr = bin->now;
+	bin->now += len;
+
+	return ptr;
+}
+
+static void bin_reserve(struct bin_container *bin, size_t len)
+{
+	bin->size += ALIGN(len, 8);
+}
+
+static int bin_backing_alloc(struct bin_container *bin)
+{
+	bin->base = bin->now = kvzalloc(bin->size, GFP_KERNEL);
+	if (!bin->base)
+		return -ENOMEM;
+
+	bin->end = bin->base + bin->size;
+
+	return 0;
+}
+
+#define is_contained(var, endp)				\
+	(sizeof(*var) <= (endp) - (void *)(var))
+#define has_headroom(ptr, headroom, endp)	\
+	((headroom) <= (endp) - (void *)(ptr))
+#define is_contained_with_headroom(var, headroom, endp)		\
+	(sizeof(*var) + (headroom) <= (endp) - (void *)(var))
+
+static int
+ccs_data_parse_length_specifier(const struct __ccs_data_length_specifier *__len,
+				size_t *__hlen, size_t *__plen,
+				const void *endp)
+{
+	size_t hlen, plen;
+
+	if (!is_contained(__len, endp))
+		return -ENODATA;
+
+	switch (__len->length >> CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT) {
+	case CCS_DATA_LENGTH_SPECIFIER_1:
+		hlen = sizeof(*__len);
+		plen = __len->length &
+			((1 << CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT) - 1);
+		break;
+	case CCS_DATA_LENGTH_SPECIFIER_2: {
+		struct __ccs_data_length_specifier2 *__len2 = (void *)__len;
+
+		if (!is_contained(__len2, endp))
+			return -ENODATA;
+
+		hlen = sizeof(*__len2);
+		plen = ((size_t)
+			(__len2->length[0] &
+			 ((1 << CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT) - 1))
+			<< 8) + __len2->length[1];
+		break;
+	}
+	case CCS_DATA_LENGTH_SPECIFIER_3: {
+		struct __ccs_data_length_specifier3 *__len3 = (void *)__len;
+
+		if (!is_contained(__len3, endp))
+			return -ENODATA;
+
+		hlen = sizeof(*__len3);
+		plen = ((size_t)
+			(__len3->length[0] &
+			 ((1 << CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT) - 1))
+			<< 16) + (__len3->length[0] << 8) + __len3->length[1];
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+
+	if (!has_headroom(__len, hlen + plen, endp))
+		return -ENODATA;
+
+	*__hlen = hlen;
+	*__plen = plen;
+
+	return 0;
+}
+
+static u8
+ccs_data_parse_format_version(const struct __ccs_data_block *block)
+{
+	return block->id >> CCS_DATA_BLOCK_HEADER_ID_VERSION_SHIFT;
+}
+
+static u8 ccs_data_parse_block_id(const struct __ccs_data_block *block,
+				       bool is_first)
+{
+	if (!is_first)
+		return block->id;
+
+	return block->id & ((1 << CCS_DATA_BLOCK_HEADER_ID_VERSION_SHIFT) - 1);
+}
+
+static int ccs_data_parse_version(struct bin_container *bin,
+				  struct ccs_data_container *ccsdata,
+				  const void *payload, const void *endp)
+{
+	const struct __ccs_data_block_version *v = payload;
+	struct ccs_data_block_version *vv;
+
+	if (v + 1 != endp)
+		return -ENODATA;
+
+	if (!bin->base) {
+		bin_reserve(bin, sizeof(*ccsdata->version));
+		return 0;
+	}
+
+	ccsdata->version = bin_alloc(bin, sizeof(*ccsdata->version));
+	if (!ccsdata->version)
+		return -ENOMEM;
+
+	vv = ccsdata->version;
+	vv->version_major = ((u16)v->static_data_version_major[0] << 8) +
+		v->static_data_version_major[1];
+	vv->version_minor = ((u16)v->static_data_version_minor[0] << 8) +
+		v->static_data_version_major[1];
+	vv->date_year =  ((u16)v->year[0] << 8) + v->year[1];
+	vv->date_month = v->month;
+	vv->date_day = v->day;
+
+	return 0;
+}
+
+static void print_ccs_data_version(struct device *dev,
+				   struct ccs_data_block_version *v)
+{
+	dev_dbg(dev,
+		"static data version %4.4x.%4.4x, date %4.4u-%2.2u-%2.2u\n",
+		v->version_major, v->version_minor,
+		v->date_year, v->date_month, v->date_day);
+}
+
+static int ccs_data_block_parse_header(const struct __ccs_data_block *block,
+				       bool is_first, unsigned int *__block_id,
+				       const void **payload,
+				       const struct __ccs_data_block **next_block,
+				       const void *endp, struct device *dev,
+				       bool verbose)
+{
+	size_t plen, hlen;
+	u8 block_id;
+	int rval;
+
+	if (!is_contained(block, endp))
+		return -ENODATA;
+
+	rval = ccs_data_parse_length_specifier(&block->length, &hlen, &plen,
+					       endp);
+	if (rval < 0)
+		return rval;
+
+	block_id = ccs_data_parse_block_id(block, is_first);
+
+	if (verbose)
+		dev_dbg(dev,
+			"Block ID 0x%2.2x, header length %zu, payload length %zu\n",
+			block_id, hlen, plen);
+
+	if (!has_headroom(&block->length, hlen + plen, endp))
+		return -ENODATA;
+
+	if (__block_id)
+		*__block_id = block_id;
+
+	if (payload)
+		*payload = (void *)&block->length + hlen;
+
+	if (next_block)
+		*next_block = (void *)&block->length + hlen + plen;
+
+	return 0;
+}
+
+static int ccs_data_parse_regs(struct bin_container *bin,
+			       struct ccs_reg **__regs,
+			       size_t *__num_regs, const void *payload,
+			       const void *endp, struct device *dev)
+{
+	struct ccs_reg *regs_base, *regs;
+	size_t num_regs = 0;
+	u16 addr = 0;
+
+	if (bin->base && __regs) {
+		regs = regs_base = bin_alloc(bin, sizeof(*regs) * *__num_regs);
+		if (!regs)
+			return -ENOMEM;
+	}
+
+	while (payload < endp && num_regs < INT_MAX) {
+		const struct __ccs_data_block_regs *r = payload;
+		size_t len;
+		const void *data;
+
+		if (!is_contained(r, endp))
+			return -ENODATA;
+
+		switch (r->reg_len >> CCS_DATA_BLOCK_REGS_SEL_SHIFT) {
+		case CCS_DATA_BLOCK_REGS_SEL_REGS:
+			addr += r->reg_len & CCS_DATA_BLOCK_REGS_ADDR_MASK;
+			len = ((r->reg_len & CCS_DATA_BLOCK_REGS_LEN_MASK)
+			       >> CCS_DATA_BLOCK_REGS_LEN_SHIFT) + 1;
+
+			if (!is_contained_with_headroom(r, len, endp))
+				return -ENODATA;
+
+			data = r + 1;
+			break;
+		case CCS_DATA_BLOCK_REGS_SEL_REGS2: {
+			const struct __ccs_data_block_regs2 *r2 = payload;
+
+			if (!is_contained(r2, endp))
+				return -ENODATA;
+
+			addr += ((u16)(r2->reg_len &
+				       CCS_DATA_BLOCK_REGS_2_ADDR_MASK) << 8)
+				+ r2->addr;
+			len = ((r2->reg_len & CCS_DATA_BLOCK_REGS_2_LEN_MASK)
+			       >> CCS_DATA_BLOCK_REGS_2_LEN_SHIFT) + 1;
+
+			if (!is_contained_with_headroom(r2, len, endp))
+				return -ENODATA;
+
+			data = r2 + 1;
+			break;
+		}
+		case CCS_DATA_BLOCK_REGS_SEL_REGS3: {
+			const struct __ccs_data_block_regs3 *r3 = payload;
+
+			if (!is_contained(r3, endp))
+				return -ENODATA;
+
+			addr = ((u16)r3->addr[0] << 8) + r3->addr[1];
+			len = (r3->reg_len & CCS_DATA_BLOCK_REGS_3_LEN_MASK) + 1;
+
+			if (!is_contained_with_headroom(r3, len, endp))
+				return -ENODATA;
+
+			data = r3 + 1;
+			break;
+		}
+		default:
+			return -EINVAL;
+		}
+
+		num_regs++;
+
+		if (!bin->base) {
+			bin_reserve(bin, len);
+		} else if (__regs) {
+			regs->addr = addr;
+			regs->len = len;
+			regs->value = bin_alloc(bin, len);
+			if (!regs->value)
+				return -ENOMEM;
+
+			memcpy(regs->value, data, len);
+			regs++;
+		}
+
+		addr += len;
+		payload = data + len;
+	}
+
+	if (!bin->base)
+		bin_reserve(bin, sizeof(*regs) * num_regs);
+
+	if (__num_regs)
+		*__num_regs = num_regs;
+
+	if (bin->base && __regs)
+		*__regs = regs_base;
+
+	return 0;
+}
+
+static int ccs_data_parse_reg_rules(struct bin_container *bin,
+				    struct ccs_reg **__regs,
+				    size_t *__num_regs,
+				    const void *payload,
+				    const void *endp, struct device *dev)
+{
+	int rval;
+
+	if (!bin->base)
+		return ccs_data_parse_regs(bin, NULL, NULL, payload, endp, dev);
+
+	rval = ccs_data_parse_regs(bin, NULL, __num_regs, payload, endp, dev);
+	if (rval)
+		return rval;
+
+	return ccs_data_parse_regs(bin, __regs, __num_regs, payload, endp,
+				   dev);
+}
+
+static void assign_ffd_entry(struct ccs_frame_format_desc *desc,
+			     const struct __ccs_data_block_ffd_entry *ent)
+{
+	desc->pixelcode = ent->pixelcode;
+	desc->value = ((u16)ent->value[0] << 8) + ent->value[1];
+}
+
+static int ccs_data_parse_ffd(struct bin_container *bin,
+			      struct ccs_frame_format_descs **ffd,
+			      const void *payload,
+			      const void *endp, struct device *dev)
+{
+	const struct __ccs_data_block_ffd *__ffd = payload;
+	const struct __ccs_data_block_ffd_entry *__entry;
+	unsigned int i;
+
+	if (!is_contained(__ffd, endp))
+		return -ENODATA;
+
+	if ((void *)__ffd + sizeof(*__ffd) +
+	    ((u32)__ffd->num_column_descs +
+	     (u32)__ffd->num_row_descs) *
+	    sizeof(struct __ccs_data_block_ffd_entry) != endp)
+		return -ENODATA;
+
+	if (!bin->base) {
+		bin_reserve(bin, sizeof(**ffd));
+		bin_reserve(bin, __ffd->num_column_descs *
+			    sizeof(struct ccs_frame_format_desc));
+		bin_reserve(bin, __ffd->num_row_descs *
+			    sizeof(struct ccs_frame_format_desc));
+
+		return 0;
+	}
+
+	*ffd = bin_alloc(bin, sizeof(**ffd));
+	if (!*ffd)
+		return -ENOMEM;
+
+	(*ffd)->num_column_descs = __ffd->num_column_descs;
+	(*ffd)->num_row_descs = __ffd->num_row_descs;
+	__entry = (void *)(__ffd + 1);
+
+	(*ffd)->column_descs = bin_alloc(bin, __ffd->num_column_descs *
+					 sizeof(*(*ffd)->column_descs));
+	if (!(*ffd)->column_descs)
+		return -ENOMEM;
+
+	for (i = 0; i < __ffd->num_column_descs; i++, __entry++)
+		assign_ffd_entry(&(*ffd)->column_descs[i], __entry);
+
+	(*ffd)->row_descs = bin_alloc(bin, __ffd->num_row_descs *
+				      sizeof(*(*ffd)->row_descs));
+	if (!(*ffd)->row_descs)
+		return -ENOMEM;
+
+	for (i = 0; i < __ffd->num_row_descs; i++, __entry++)
+		assign_ffd_entry(&(*ffd)->row_descs[i], __entry);
+
+	if (__entry != endp)
+		return -EPROTO;
+
+	return 0;
+}
+
+static int ccs_data_parse_pdaf_readout(struct bin_container *bin,
+				       struct ccs_pdaf_readout **pdaf_readout,
+				       const void *payload,
+				       const void *endp, struct device *dev)
+{
+	const struct __ccs_data_block_pdaf_readout *__pdaf = payload;
+
+	if (!is_contained(__pdaf, endp))
+		return -ENODATA;
+
+	if (!bin->base) {
+		bin_reserve(bin, sizeof(**pdaf_readout));
+	} else {
+		*pdaf_readout = bin_alloc(bin, sizeof(**pdaf_readout));
+		if (!*pdaf_readout)
+			return -ENOMEM;
+
+		(*pdaf_readout)->pdaf_readout_info_order =
+			__pdaf->pdaf_readout_info_order;
+	}
+
+	return ccs_data_parse_ffd(bin, !bin->base ? NULL : &(*pdaf_readout)->ffd,
+				  __pdaf + 1, endp, dev);
+}
+
+static int ccs_data_parse_rules(struct bin_container *bin,
+				struct ccs_rule **__rules,
+				size_t *__num_rules, const void *payload,
+				const void *endp, struct device *dev)
+{
+	struct ccs_rule *rules_base, *rules = NULL, *next_rule;
+	size_t num_rules = 0;
+	const void *__next_rule = payload;
+	int rval;
+
+	if (bin->base) {
+		rules_base = next_rule =
+			bin_alloc(bin, sizeof(*rules) * *__num_rules);
+		if (!rules_base)
+			return -ENOMEM;
+	}
+
+	while (__next_rule < endp) {
+		size_t rule_hlen, rule_plen, rule_plen2;
+		const u8 *__rule_type;
+		const void *rule_payload;
+
+		/* Size of a single rule */
+		rval = ccs_data_parse_length_specifier(__next_rule, &rule_hlen,
+						       &rule_plen, endp);
+
+		if (rval < 0)
+			return rval;
+
+		__rule_type = __next_rule + rule_hlen;
+
+		if (!is_contained(__rule_type, endp))
+			return -ENODATA;
+
+		rule_payload = __rule_type + 1;
+		rule_plen2 = rule_plen - sizeof(*__rule_type);
+
+		switch (*__rule_type) {
+		case CCS_DATA_BLOCK_RULE_ID_IF: {
+			const struct __ccs_data_block_rule_if *__if_rules =
+				rule_payload;
+			const size_t __num_if_rules =
+				rule_plen2 / sizeof(*__if_rules);
+			struct ccs_if_rule *if_rule;
+
+			if (!has_headroom(__if_rules,
+					  sizeof(*__if_rules) * __num_if_rules,
+					  rule_payload + rule_plen2))
+				return -ENODATA;
+
+			/* Also check there is no extra data */
+			if (__if_rules + __num_if_rules !=
+			    rule_payload + rule_plen2)
+				return -EINVAL;
+
+			if (!bin->base) {
+				bin_reserve(bin,
+					    sizeof(*if_rule) *
+					    __num_if_rules);
+				num_rules++;
+			} else {
+				unsigned int i;
+
+				rules = next_rule;
+				next_rule++;
+
+				if_rule = bin_alloc(bin,
+						    sizeof(*if_rule) *
+						    __num_if_rules);
+				if (!if_rule)
+					return -ENOMEM;
+
+				for (i = 0; i < __num_if_rules; i++) {
+					if_rule[i].addr =
+						((u16)__if_rules[i].addr[0]
+						 << 8) +
+						__if_rules[i].addr[1];
+					if_rule[i].value = __if_rules[i].value;
+					if_rule[i].mask = __if_rules[i].mask;
+				}
+
+				rules->if_rules = if_rule;
+				rules->num_if_rules = __num_if_rules;
+			}
+			break;
+		}
+		case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
+			rval = ccs_data_parse_reg_rules(bin, &rules->read_only_regs,
+							&rules->num_read_only_regs,
+							rule_payload,
+							rule_payload + rule_plen2,
+							dev);
+			if (rval)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_RULE_ID_FFD:
+			rval = ccs_data_parse_ffd(bin, &rules->frame_format,
+						  rule_payload,
+						  rule_payload + rule_plen2,
+						  dev);
+			if (rval)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_RULE_ID_MSR:
+			rval = ccs_data_parse_reg_rules(bin,
+							&rules->manufacturer_regs,
+							&rules->num_manufacturer_regs,
+							rule_payload,
+							rule_payload + rule_plen2,
+							dev);
+			if (rval)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
+			rval = ccs_data_parse_pdaf_readout(bin,
+							   &rules->pdaf_readout,
+							   rule_payload,
+							   rule_payload + rule_plen2,
+							   dev);
+			if (rval)
+				return rval;
+			break;
+		default:
+			dev_dbg(dev,
+				"Don't know how to handle rule type %u!\n",
+				*__rule_type);
+			return -EINVAL;
+		}
+		__next_rule = __next_rule + rule_hlen + rule_plen;
+	}
+
+	if (!bin->base) {
+		bin_reserve(bin, sizeof(*rules) * num_rules);
+		*__num_rules = num_rules;
+	} else {
+		*__rules = rules_base;
+	}
+
+	return 0;
+}
+
+static int ccs_data_parse_pdaf(struct bin_container *bin, struct ccs_pdaf_pix_loc **pdaf,
+			       const void *payload, const void *endp,
+			       struct device *dev)
+{
+	const struct __ccs_data_block_pdaf_pix_loc *__pdaf = payload;
+	const struct __ccs_data_block_pdaf_pix_loc_block_desc_group *__bdesc_group;
+	const struct __ccs_data_block_pdaf_pix_loc_pixel_desc *__pixel_desc;
+	unsigned int i;
+	u16 num_block_desc_groups;
+	u8 max_block_type_id = 0;
+	const u8 *__num_pixel_descs;
+
+	if (!is_contained(__pdaf, endp))
+		return -ENODATA;
+
+	if (bin->base) {
+		*pdaf = bin_alloc(bin, sizeof(**pdaf));
+		if (!*pdaf)
+			return -ENOMEM;
+	} else {
+		bin_reserve(bin, sizeof(**pdaf));
+	}
+
+	num_block_desc_groups =
+		((u16)__pdaf->num_block_desc_groups[0] << 8) +
+		__pdaf->num_block_desc_groups[1];
+
+	if (bin->base) {
+		(*pdaf)->main_offset_x =
+			((u16)__pdaf->main_offset_x[0] << 8) +
+			__pdaf->main_offset_x[1];
+		(*pdaf)->main_offset_y =
+			((u16)__pdaf->main_offset_y[0] << 8) +
+			__pdaf->main_offset_y[1];
+		(*pdaf)->global_pdaf_type = __pdaf->global_pdaf_type;
+		(*pdaf)->block_width = __pdaf->block_width;
+		(*pdaf)->block_height = __pdaf->block_height;
+		(*pdaf)->num_block_desc_groups = num_block_desc_groups;
+	}
+
+	__bdesc_group = (const void *)(__pdaf + 1);
+
+	if (bin->base) {
+		(*pdaf)->block_desc_groups =
+			bin_alloc(bin,
+				  sizeof(struct ccs_pdaf_pix_loc_block_desc_group) *
+				  num_block_desc_groups);
+		if (!(*pdaf)->block_desc_groups)
+			return -ENOMEM;
+	} else {
+		bin_reserve(bin, sizeof(struct ccs_pdaf_pix_loc_block_desc_group) *
+			    num_block_desc_groups);
+	}
+
+	for (i = 0; i < num_block_desc_groups; i++) {
+		const struct __ccs_data_block_pdaf_pix_loc_block_desc *__bdesc;
+		u16 num_block_descs;
+		unsigned int j;
+
+		if (!is_contained(__bdesc_group, endp))
+			return -ENODATA;
+
+		num_block_descs =
+			((u16)__bdesc_group->num_block_descs[0] << 8) +
+			__bdesc_group->num_block_descs[1];
+
+		if (bin->base) {
+			(*pdaf)->block_desc_groups[i].repeat_y =
+				__bdesc_group->repeat_y;
+			(*pdaf)->block_desc_groups[i].num_block_descs =
+				num_block_descs;
+		}
+
+		__bdesc = (const void *)(__bdesc_group + 1);
+
+		if (bin->base) {
+			(*pdaf)->block_desc_groups[i].block_descs =
+				bin_alloc(bin,
+					  sizeof(struct ccs_pdaf_pix_loc_block_desc) *
+					  num_block_descs);
+			if (!(*pdaf)->block_desc_groups[i].block_descs)
+				return -ENOMEM;
+		} else {
+			bin_reserve(bin, sizeof(struct ccs_pdaf_pix_loc_block_desc) *
+				    num_block_descs);
+		}
+
+		for (j = 0; j < num_block_descs; j++, __bdesc++) {
+			struct ccs_pdaf_pix_loc_block_desc *bdesc;
+
+			if (!is_contained(__bdesc, endp))
+				return -ENODATA;
+
+			if (max_block_type_id <= __bdesc->block_type_id)
+				max_block_type_id = __bdesc->block_type_id + 1;
+
+			if (!bin->base)
+				continue;
+
+			bdesc = &(*pdaf)->block_desc_groups[i].block_descs[j];
+
+			bdesc->repeat_x = ((u16)__bdesc->repeat_x[0] << 8)
+				+ __bdesc->repeat_x[1];
+
+			if (__bdesc->block_type_id >= num_block_descs)
+				return -EINVAL;
+
+			bdesc->block_type_id = __bdesc->block_type_id;
+		}
+
+		__bdesc_group = (const void *)__bdesc;
+	}
+
+	__num_pixel_descs = (const void *)__bdesc_group;
+
+	if (bin->base) {
+		(*pdaf)->pixel_desc_groups =
+			bin_alloc(bin,
+				  sizeof(struct ccs_pdaf_pix_loc_pixel_desc_group) *
+				  max_block_type_id);
+		if (!(*pdaf)->pixel_desc_groups)
+			return -ENOMEM;
+		(*pdaf)->num_pixel_desc_grups = max_block_type_id;
+	} else {
+		bin_reserve(bin, sizeof(struct ccs_pdaf_pix_loc_pixel_desc_group) *
+			    max_block_type_id);
+	}
+
+	for (i = 0; i < max_block_type_id; i++) {
+		struct ccs_pdaf_pix_loc_pixel_desc_group *pdgroup;
+		unsigned int j;
+
+		if (!is_contained(__num_pixel_descs, endp))
+			return -ENODATA;
+
+		if (bin->base) {
+			pdgroup = &(*pdaf)->pixel_desc_groups[i];
+			pdgroup->descs =
+				bin_alloc(bin,
+					  sizeof(struct ccs_pdaf_pix_loc_pixel_desc) *
+					  *__num_pixel_descs);
+			if (!pdgroup->descs)
+				return -ENOMEM;
+			pdgroup->num_descs = *__num_pixel_descs;
+		} else {
+			bin_reserve(bin, sizeof(struct ccs_pdaf_pix_loc_pixel_desc) *
+				    *__num_pixel_descs);
+		}
+
+		__pixel_desc = (const void *)(__num_pixel_descs + 1);
+
+		for (j = 0; j < *__num_pixel_descs; j++, __pixel_desc++) {
+			struct ccs_pdaf_pix_loc_pixel_desc *pdesc;
+
+			if (!is_contained(__pixel_desc, endp))
+				return -ENODATA;
+
+			if (!bin->base)
+				continue;
+
+			pdesc = &pdgroup->descs[j];
+			pdesc->pixel_type = __pixel_desc->pixel_type;
+			pdesc->small_offset_x = __pixel_desc->small_offset_x;
+			pdesc->small_offset_y = __pixel_desc->small_offset_y;
+		}
+
+		__num_pixel_descs = (const void *)(__pixel_desc + 1);
+	}
+
+	return 0;
+}
+
+static int ccs_data_parse_license(struct bin_container *bin,
+				  char **__license,
+				  size_t *__license_length,
+				  const void *payload, const void *endp)
+{
+	size_t size = endp - payload;
+	char *license;
+
+	if (!bin->base) {
+		bin_reserve(bin, size);
+		return 0;
+	}
+
+	license = bin_alloc(bin, size);
+	if (!license)
+		return -ENOMEM;
+
+	memcpy(license, payload, size);
+
+	*__license = license;
+	*__license_length = size;
+
+	return 0;
+}
+
+static int ccs_data_parse_end(bool *end, const void *payload, const void *endp,
+			      struct device *dev)
+{
+	const struct __ccs_data_block_end *__end = payload;
+
+	if (__end + 1 != endp) {
+		dev_dbg(dev, "Invalid end block length %u\n",
+			(unsigned int)(endp - payload));
+		return -ENODATA;
+	}
+
+	*end = true;
+
+	return 0;
+}
+
+static int __ccs_data_parse(struct bin_container *bin,
+			    struct ccs_data_container *ccsdata,
+			    const void *data, size_t len, struct device *dev,
+			    bool verbose)
+{
+	const struct __ccs_data_block *block = data;
+	const struct __ccs_data_block *endp = data + len;
+	unsigned int version;
+	bool is_first = true;
+	int rval;
+
+	version = ccs_data_parse_format_version(block);
+	if (version != CCS_STATIC_DATA_VERSION) {
+		dev_dbg(dev, "Don't know how to handle version %u\n", version);
+		return -EINVAL;
+	}
+
+	if (verbose)
+		dev_dbg(dev, "Parsing CCS static data version %u\n", version);
+
+	if (!bin->base)
+		*ccsdata = (struct ccs_data_container){ 0 };
+
+	while (block < endp) {
+		const struct __ccs_data_block *next_block;
+		unsigned int block_id;
+		const void *payload;
+
+		rval = ccs_data_block_parse_header(block, is_first, &block_id,
+						   &payload, &next_block, endp,
+						   dev,
+						   bin->base ? false : verbose);
+
+		if (rval < 0)
+			return rval;
+
+		switch (block_id) {
+		case CCS_DATA_BLOCK_ID_DUMMY:
+			break;
+		case CCS_DATA_BLOCK_ID_DATA_VERSION:
+			rval = ccs_data_parse_version(bin, ccsdata, payload,
+						      next_block);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_READ_ONLY_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->sensor_read_only_regs,
+				&ccsdata->num_sensor_read_only_regs, payload,
+				next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_MANUFACTURER_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->sensor_manufacturer_regs,
+				&ccsdata->num_sensor_manufacturer_regs, payload,
+				next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_READ_ONLY_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->module_read_only_regs,
+				&ccsdata->num_module_read_only_regs, payload,
+				next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_MANUFACTURER_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->module_manufacturer_regs,
+				&ccsdata->num_module_manufacturer_regs, payload,
+				next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_PDAF_PIXEL_LOCATION:
+			rval = ccs_data_parse_pdaf(bin, &ccsdata->sensor_pdaf,
+						   payload, next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_PDAF_PIXEL_LOCATION:
+			rval = ccs_data_parse_pdaf(bin, &ccsdata->module_pdaf,
+						   payload, next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_RULE_BASED_BLOCK:
+			rval = ccs_data_parse_rules(
+				bin, &ccsdata->sensor_rules,
+				&ccsdata->num_sensor_rules, payload, next_block,
+				dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_RULE_BASED_BLOCK:
+			rval = ccs_data_parse_rules(
+				bin, &ccsdata->module_rules,
+				&ccsdata->num_module_rules, payload, next_block,
+				dev);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_LICENSE:
+			rval = ccs_data_parse_license(bin, &ccsdata->license,
+						      &ccsdata->license_length,
+						      payload, next_block);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_END:
+			rval = ccs_data_parse_end(&ccsdata->end, payload,
+						  next_block, dev);
+			if (rval < 0)
+				return rval;
+			break;
+		default:
+			dev_dbg(dev, "WARNING: not handling block ID 0x%2.2x\n",
+				block_id);
+		}
+
+		block = next_block;
+		is_first = false;
+	}
+
+	return 0;
+}
+
+/**
+ * ccs_data_parse - Parse a CCS static data file into a usable in-memory
+ *		    data structure
+ * @ccsdata:	CCS static data in-memory data structure
+ * @data:	CCS static data binary
+ * @len:	Length of @data
+ * @dev:	Device the data is related to (used for printing debug messages)
+ * @verbose:	Whether to be verbose or not
+ */
+int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
+		   size_t len, struct device *dev, bool verbose)
+{
+	struct bin_container bin = { 0 };
+	int rval;
+
+	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, verbose);
+	if (rval)
+		return rval;
+
+	rval = bin_backing_alloc(&bin);
+	if (rval)
+		return rval;
+
+	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, false);
+	if (rval)
+		goto out_free;
+
+	if (verbose && ccsdata->version)
+		print_ccs_data_version(dev, ccsdata->version);
+
+	if (bin.now != bin.end) {
+		rval = -EPROTO;
+		dev_dbg(dev, "parsing mismatch; base %p; now %p; end %p\n",
+			bin.base, bin.now, bin.end);
+		goto out_free;
+	}
+
+	ccsdata->backing = bin.base;
+
+	return 0;
+
+out_free:
+	kvfree(bin.base);
+
+	return rval;
+}
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
new file mode 100644
index 000000000000..1327fb2e68b5
--- /dev/null
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * CCS static data in-memory data structure definitions
+ *
+ * Copyright 2019--2020 Intel Corporation
+ */
+
+#ifndef __CCS_DATA_H__
+#define __CCS_DATA_H__
+
+#include <linux/types.h>
+
+/**
+ * struct ccs_data_block_version - CCS static data version
+ * @version_major: Major version number
+ * @version_minor: Minor version number
+ * @date_year: Year
+ * @date_month: Month
+ * @date_day: Day
+ */
+struct ccs_data_block_version {
+	u16 version_major;
+	u16 version_minor;
+	u16 date_year;
+	u8 date_month;
+	u8 date_day;
+};
+
+/**
+ * struct ccs_reg - CCS register value
+ * @addr: The 16-bit address of the register
+ * @len: Length of the data
+ * @value: Data
+struct ccs_reg {
+	u16 addr;
+	u16 len;
+	u8 *value;
+};
+
+/**
+ * struct ccs_if_rule - CCS static data if rule
+ * @addr: Register address
+ * @value: Register value
+ * @mask: Value applied to both actual register value and @value
+ */
+struct ccs_if_rule {
+	u16 addr;
+	u8 value;
+	u8 mask;
+};
+
+/**
+ * struct ccs_frame_format_desc - CCS frame format descriptor
+ * @pixelcode: The pixelcode; CCS_DATA_BLOCK_FFD_PIXELCODE_*
+ * @value: Value related to the pixelcode
+ */
+struct ccs_frame_format_desc {
+	u8 pixelcode;
+	u16 value;
+};
+
+/**
+ * struct ccs_frame_format_descs - A series of CCS frame format descriptors
+ * @num_column_descs: Number of column descriptors
+ * @num_row_descs: Number of row descriptors
+ * @column_descs: Column descriptors
+ * @row_descs: Row descriptors
+ */
+struct ccs_frame_format_descs {
+	u8 num_column_descs;
+	u8 num_row_descs;
+	struct ccs_frame_format_desc *column_descs;
+	struct ccs_frame_format_desc *row_descs;
+};
+
+/**
+ * struct ccs_pdaf_readout - CCS PDAF data readout descriptor
+ * @pdaf_readout_info_order: PDAF readout order
+ * @ffd: Frame format of PDAF data
+ */
+struct ccs_pdaf_readout {
+	u8 pdaf_readout_info_order;
+	struct ccs_frame_format_descs *ffd;
+};
+
+/**
+ * struct ccs_rule - A CCS static data rule
+ * @num_if_rules: Number of if rules
+ * @if_rules: If rules
+ * @num_read_only_regs: Number of read-only registers
+ * @read_only_regs: Read-only registers
+ * @num_manufacturer_regs: Number of manufacturer-specific registers
+ * @manufacturer_regs: Manufacturer-specific registers
+ * @frame_format: Frame format
+ * @pdaf_readout: PDAF readout
+ */
+struct ccs_rule {
+	size_t num_if_rules;
+	struct ccs_if_rule *if_rules;
+	size_t num_read_only_regs;
+	struct ccs_reg *read_only_regs;
+	size_t num_manufacturer_regs;
+	struct ccs_reg *manufacturer_regs;
+	struct ccs_frame_format_descs *frame_format;
+	struct ccs_pdaf_readout *pdaf_readout;
+};
+
+/**
+ * struct ccs_pdaf_pix_loc_block_desc - PDAF pixel location block descriptor
+ * @block_type_id: Block type identifier, from 0 to n
+ * @repeat_x: Number of times this block is repeated to right
+ */
+struct ccs_pdaf_pix_loc_block_desc {
+	u8 block_type_id;
+	u16 repeat_x;
+};
+
+/**
+ * struct ccs_pdaf_pix_loc_block_desc_group - PDAF pixel location block
+ *					      descriptor group
+ * @repeat_y: Number of times the group is repeated down
+ * @num_block_descs: Number of block descriptors in @block_descs
+ * @block_descs: Block descriptors
+ */
+struct ccs_pdaf_pix_loc_block_desc_group {
+	u8 repeat_y;
+	u16 num_block_descs;
+	struct ccs_pdaf_pix_loc_block_desc *block_descs;
+};
+
+/**
+ * struct ccs_pdaf_pix_loc_block_desc - PDAF pixel location block descriptor
+ * @pixel_type: Type of the pixel; CCS_DATA_PDAF_PIXEL_TYPE_*
+ * @small_offset_x: offset X coordinate
+ * @small_offset_y: offset Y coordinate
+ */
+struct ccs_pdaf_pix_loc_pixel_desc {
+	u8 pixel_type;
+	u8 small_offset_x;
+	u8 small_offset_y;
+};
+
+/**
+ * struct ccs_pdaf_pix_loc_pixel_desc_group - PDAF pixel location pixel
+ *					      descriptor group
+ * @num_descs: Number of descriptors in @descs
+ * @descs: PDAF pixel location pixel descriptors
+ */
+struct ccs_pdaf_pix_loc_pixel_desc_group {
+	u8 num_descs;
+	struct ccs_pdaf_pix_loc_pixel_desc *descs;
+};
+
+/**
+ * struct ccs_pdaf_pix_loc - PDAF pixel locations
+ * @main_offset_x: Start X coordinate of PDAF pixel blocks
+ * @main_offset_y: Start Y coordinate of PDAF pixel blocks
+ * @global_pdaf_type: PDAF pattern type
+ * @block_width: Width of a block in pixels
+ * @block_height: Heigth of a block in pixels
+ * @num_block_desc_groups: Number of block descriptor groups
+ * @block_desc_groups: Block descriptor groups
+ * @num_pixel_desc_grups: Number of pixel descriptor groups
+ * @pixel_desc_groups: Pixel descriptor groups
+ */
+struct ccs_pdaf_pix_loc {
+	u16 main_offset_x;
+	u16 main_offset_y;
+	u8 global_pdaf_type;
+	u8 block_width;
+	u8 block_height;
+	u16 num_block_desc_groups;
+	struct ccs_pdaf_pix_loc_block_desc_group *block_desc_groups;
+	u8 num_pixel_desc_grups;
+	struct ccs_pdaf_pix_loc_pixel_desc_group *pixel_desc_groups;
+};
+
+/**
+ * struct ccs_data_container - In-memory CCS static data
+ * @version: CCS static data version
+ * @num_sensor_read_only_regs: Number of the read-only registers for the sensor
+ * @sensor_read_only_regs: Read-only registers for the sensor
+ * @num_sensor_manufacturer_regs: Number of the manufacturer-specific registers
+ *				  for the sensor
+ * @sensor_manufacturer_regs: Manufacturer-specific registers for the sensor
+ * @num_sensor_rules: Number of rules for the sensor
+ * @sensor_rules: Rules for the sensor
+ * @num_module_read_only_regs: Number of the read-only registers for the module
+ * @module_read_only_regs: Read-only registers for the module
+ * @num_module_manufacturer_regs: Number of the manufacturer-specific registers
+ *				  for the module
+ * @module_manufacturer_regs: Manufacturer-specific registers for the module
+ * @num_module_rules: Number of rules for the module
+ * @module_rules: Rules for the module
+ * @sensor_pdaf: PDAF data for the sensor
+ * @module_pdaf: PDAF data for the module
+ * @license_length: Lenght of the license data
+ * @license: License data
+ * @end: Whether or not there's an end block
+ * @backing: Raw data, pointed to from elsewhere so keep it around
+ */
+struct ccs_data_container {
+	struct ccs_data_block_version *version;
+	size_t num_sensor_read_only_regs;
+	struct ccs_reg *sensor_read_only_regs;
+	size_t num_sensor_manufacturer_regs;
+	struct ccs_reg *sensor_manufacturer_regs;
+	size_t num_sensor_rules;
+	struct ccs_rule *sensor_rules;
+	size_t num_module_read_only_regs;
+	struct ccs_reg *module_read_only_regs;
+	size_t num_module_manufacturer_regs;
+	struct ccs_reg *module_manufacturer_regs;
+	size_t num_module_rules;
+	struct ccs_rule *module_rules;
+	struct ccs_pdaf_pix_loc *sensor_pdaf;
+	struct ccs_pdaf_pix_loc *module_pdaf;
+	size_t license_length;
+	char *license;
+	bool end;
+	void *backing;
+};
+
+int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
+		   size_t len, struct device *dev, bool verbose);
+
+#endif /* __CCS_DATA_H__ */
-- 
2.27.0

