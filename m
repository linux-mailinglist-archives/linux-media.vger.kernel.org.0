Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080A027ECE2
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbgI3PaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:11 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44644 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730962AbgI3P3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:07 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 30C33634C8E
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 032/100] ccs: Add CCS static data parser library
Date:   Wed, 30 Sep 2020 18:27:50 +0300
Message-Id: <20200930152858.8471-33-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-data-defs.h | 215 ++++++
 drivers/media/i2c/ccs/ccs-data.c      | 949 ++++++++++++++++++++++++++
 drivers/media/i2c/ccs/ccs-data.h      | 116 ++++
 4 files changed, 1281 insertions(+), 1 deletion(-)
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
index 000000000000..ffc5154d2c66
--- /dev/null
+++ b/drivers/media/i2c/ccs/ccs-data-defs.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/* Copyright 2019--2020 Intel Corporation */
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
+#define CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT	6
+
+struct __ccs_data_length_specifier {
+	uint8_t length;
+} __attribute__((packed));
+
+struct __ccs_data_length_specifier2 {
+	uint8_t length[2];
+} __attribute__((packed));
+
+struct __ccs_data_length_specifier3 {
+	uint8_t length[3];
+} __attribute__((packed));
+
+struct __ccs_data_block {
+	uint8_t id;
+	struct __ccs_data_length_specifier length;
+} __attribute__((packed));
+
+#define CCS_DATA_BLOCK_HEADER_ID_VERSION_SHIFT	5
+
+struct __ccs_data_block3 {
+	uint8_t id;
+	struct __ccs_data_length_specifier2 length;
+} __attribute__((packed));
+
+struct __ccs_data_block4 {
+	uint8_t id;
+	struct __ccs_data_length_specifier3 length;
+} __attribute__((packed));
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
+	uint8_t static_data_version_major[2];
+	uint8_t static_data_version_minor[2];
+	uint8_t year[2];
+	uint8_t month;
+	uint8_t day;
+} __attribute__((packed));
+
+struct __ccs_data_block_regs {
+	uint8_t reg_len;
+} __attribute__((packed));
+
+#define CCS_DATA_BLOCK_REGS_ADDR_MASK		0x07
+#define CCS_DATA_BLOCK_REGS_LEN_SHIFT		3
+#define CCS_DATA_BLOCK_REGS_LEN_MASK		0x38
+#define CCS_DATA_BLOCK_REGS_SEL_SHIFT		6
+enum ccs_data_block_regs_sel {
+	CCS_DATA_BLOCK_REGS_SEL_REGS = 0,
+	CCS_DATA_BLOCK_REGS_SEL_REGS2 = 1,
+	CCS_DATA_BLOCK_REGS_SEL_REGS3 = 2,
+};
+
+struct __ccs_data_block_regs2 {
+	uint8_t reg_len;
+	uint8_t addr;
+} __attribute__((packed));
+
+#define CCS_DATA_BLOCK_REGS_2_ADDR_MASK		0x01
+#define CCS_DATA_BLOCK_REGS_2_LEN_SHIFT		1
+#define CCS_DATA_BLOCK_REGS_2_LEN_MASK		0x3e
+
+struct __ccs_data_block_regs3 {
+	uint8_t reg_len;
+	uint8_t addr[2];
+} __attribute__((packed));
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
+	uint8_t pixelcode;
+	uint8_t reserved;
+	uint8_t value[2];
+} __attribute__((packed));
+
+struct __ccs_data_block_ffd {
+	uint8_t num_column_descs;
+	uint8_t num_row_descs;
+} __attribute__((packed));
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
+	uint8_t addr[2];
+	uint8_t value;
+	uint8_t mask;
+} __attribute__((packed));
+
+enum __ccs_data_block_pdaf_readout_order{
+	CCS_DATA_BLOCK_PDAF_READOUT_ORDER_ORIGINAL = 1,
+	CCS_DATA_BLOCK_PDAF_READOUT_ORDER_SEPARATE_WITHIN_LINE = 2,
+	CCS_DATA_BLOCK_PDAF_READOUT_ORDER_SEPARATE_TYPES_SEPARATE_LINES = 3,
+};
+
+struct __ccs_data_block_pdaf_readout {
+	uint8_t pdaf_readout_info_reserved;
+	uint8_t pdaf_readout_info_order;
+} __attribute__((packed));
+
+struct __ccs_data_block_pdaf_pix_loc_block_desc {
+	uint8_t block_type_id;
+	uint8_t repeat_x[2];
+} __attribute__((packed));
+
+struct __ccs_data_block_pdaf_pix_loc_block_desc_group {
+	uint8_t num_block_descs[2];
+	uint8_t repeat_y;
+} __attribute__((packed));
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
+	uint8_t pixel_type;
+	uint8_t small_offset_x;
+	uint8_t small_offset_y;
+} __attribute__((packed));
+
+struct __ccs_data_block_pdaf_pix_loc {
+	uint8_t main_offset_x[2];
+	uint8_t main_offset_y[2];
+	uint8_t global_pdaf_type;
+	uint8_t block_width;
+	uint8_t block_height;
+	uint8_t num_block_desc_groups[2];
+} __attribute__((packed));
+
+struct __ccs_data_block_end {
+	uint8_t crc[4];
+} __attribute__((packed));
+
+#endif /* __CCS_DATA_DEFS_H__ */
diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
new file mode 100644
index 000000000000..16aeeee45936
--- /dev/null
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -0,0 +1,949 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/* Copyright 2019--2020 Intel Corporation */
+
+#include "ccs-os.h"
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
+static uint32_t u8_arr_to_u32(const uint8_t *arr, unsigned int size)
+{
+	unsigned int i;
+	uint32_t value = arr[0];
+
+	for (i = 1; i < size; i++) {
+		value <<= 8;
+		value += arr[i];
+	}
+
+	return value;
+}
+
+static void *bin_alloc(struct bin_container *bin, size_t len)
+{
+	void *ptr;
+
+	len = align2(len, 8);
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
+	bin->size += align2(len, 8);
+}
+
+static int bin_backing_alloc(struct bin_container *bin)
+{
+	bin->base = bin->now = os_calloc(bin->size);
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
+			<< 16) + u8_arr_to_u32(&__len3->length[1],
+					       sizeof(__len3->length) - 1);
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
+static uint8_t
+ccs_data_parse_format_version(const struct __ccs_data_block *block)
+{
+	return block->id >> CCS_DATA_BLOCK_HEADER_ID_VERSION_SHIFT;
+}
+
+static uint8_t ccs_data_parse_block_id(const struct __ccs_data_block *block,
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
+	vv->version_major = u8_arr_to_u32(v->static_data_version_major, 2);
+	vv->version_minor = u8_arr_to_u32(v->static_data_version_minor, 2);
+	vv->date_year = u8_arr_to_u32(v->year, 2);
+	vv->date_month = v->month;
+	vv->date_day = v->day;
+
+	return 0;
+}
+
+static void print_ccs_data_version(printf_ctx fh,
+				   struct ccs_data_block_version *v)
+{
+	os_printf(fh,
+		  "static data version %4.4x.%4.4x, date %4.4u-%2.2u-%2.2u\n",
+		  v->version_major, v->version_minor,
+		  v->date_year, v->date_month, v->date_day);
+}
+
+static int ccs_data_block_parse_header(const struct __ccs_data_block *block,
+				       bool is_first, unsigned int *__block_id,
+				       const void **payload,
+				       const struct __ccs_data_block **next_block,
+				       const void *endp, printf_ctx fh,
+				       bool verbose)
+{
+	size_t plen, hlen;
+	uint8_t block_id;
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
+		os_printf(fh,
+			  "Block ID 0x%2.2x, header length %zu, payload length %zu\n",
+			  block_id, hlen, plen);
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
+			       const void *endp, printf_ctx fh)
+{
+	struct ccs_reg *regs_base, *regs;
+	size_t num_regs = 0;
+	uint16_t addr = 0;
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
+			addr += ((uint16_t)(r2->reg_len &
+				 CCS_DATA_BLOCK_REGS_2_ADDR_MASK) << 8)
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
+			addr = u8_arr_to_u32(r3->addr, sizeof(r3->addr));
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
+				    const void *endp, printf_ctx fh)
+{
+	int rval;
+
+	if (!bin->base)
+		return ccs_data_parse_regs(bin, NULL, NULL, payload, endp, fh);
+
+	rval = ccs_data_parse_regs(bin, NULL, __num_regs, payload, endp, fh);
+	if (rval)
+		return rval;
+
+	return ccs_data_parse_regs(bin, __regs, __num_regs, payload, endp,
+				   fh);
+}
+
+static void assign_ffd_entry(struct ccs_frame_format_desc *desc,
+			     const struct __ccs_data_block_ffd_entry *ent)
+{
+	desc->pixelcode = ent->pixelcode;
+	desc->value = u8_arr_to_u32(ent->value, sizeof(ent->value));
+}
+
+static int ccs_data_parse_ffd(struct bin_container *bin,
+			      struct ccs_frame_format_descs **ffd,
+			      const void *payload,
+			      const void *endp, printf_ctx fh)
+{
+	const struct __ccs_data_block_ffd *__ffd = payload;
+	const struct __ccs_data_block_ffd_entry *__entry;
+	unsigned int i;
+
+	if (!is_contained(__ffd, endp))
+		return -ENODATA;
+
+	if ((void *)__ffd + sizeof(*__ffd) +
+	    ((uint32_t)__ffd->num_column_descs +
+	     (uint32_t)__ffd->num_row_descs) *
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
+				       const void *endp, printf_ctx fh)
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
+				  __pdaf + 1, endp, fh);
+}
+
+static int ccs_data_parse_rules(struct bin_container *bin,
+				struct ccs_rule **__rules,
+				size_t *__num_rules, const void *payload,
+				const void *endp, printf_ctx fh)
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
+		const uint8_t *__rule_type;
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
+						u8_arr_to_u32(
+							__if_rules[i].addr,
+							sizeof(__if_rules[i].
+							       addr));
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
+							fh);
+			if (rval)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_RULE_ID_FFD:
+			rval = ccs_data_parse_ffd(bin, &rules->frame_format,
+						  rule_payload,
+						  rule_payload + rule_plen2,
+						  fh);
+			if (rval)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_RULE_ID_MSR:
+			rval = ccs_data_parse_reg_rules(bin,
+							&rules->manufacturer_regs,
+							&rules->num_manufacturer_regs,
+							rule_payload,
+							rule_payload + rule_plen2,
+							fh);
+			if (rval)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
+			rval = ccs_data_parse_pdaf_readout(bin,
+							   &rules->pdaf_readout,
+							   rule_payload,
+							   rule_payload + rule_plen2,
+							   fh);
+			if (rval)
+				return rval;
+			break;
+		default:
+			os_printf(fh,
+				  "Don't know how to handle rule type %u!\n",
+				  *__rule_type);
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
+			       printf_ctx fh)
+{
+	const struct __ccs_data_block_pdaf_pix_loc *__pdaf = payload;
+	const struct __ccs_data_block_pdaf_pix_loc_block_desc_group *__bdesc_group;
+	const struct __ccs_data_block_pdaf_pix_loc_pixel_desc *__pixel_desc;
+	unsigned int i;
+	uint16_t num_block_desc_groups;
+	uint8_t max_block_type_id = 0;
+	const uint8_t *__num_pixel_descs;
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
+		u8_arr_to_u32(__pdaf->num_block_desc_groups,
+			      sizeof(__pdaf->num_block_desc_groups));
+
+	if (bin->base) {
+		(*pdaf)->main_offset_x =
+			u8_arr_to_u32(__pdaf->main_offset_x,
+				      sizeof(__pdaf->main_offset_x));
+		(*pdaf)->main_offset_y =
+			u8_arr_to_u32(__pdaf->main_offset_y,
+				      sizeof(__pdaf->main_offset_y));
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
+		uint16_t num_block_descs;
+		unsigned int j;
+
+		if (!is_contained(__bdesc_group, endp))
+			return -ENODATA;
+
+		num_block_descs =
+			u8_arr_to_u32(__bdesc_group->num_block_descs,
+				      sizeof(__bdesc_group->num_block_descs));
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
+			bdesc->repeat_x = u8_arr_to_u32(
+					__bdesc->repeat_x,
+					sizeof(__bdesc->repeat_x));
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
+			      printf_ctx fh)
+{
+	const struct __ccs_data_block_end *__end = payload;
+
+	if (__end + 1 != endp) {
+		os_printf(fh, "Invalid end block length %u\n",
+			  (unsigned int)(endp - payload));
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
+			    const void *data, size_t len, printf_ctx fh,
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
+		os_printf(fh, "Don't know how to handle version %u\n", version);
+		return -EINVAL;
+	}
+
+	if (verbose)
+		os_printf(fh, "Parsing CCS static data version %u\n", version);
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
+						   fh,
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
+				next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_MANUFACTURER_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->sensor_manufacturer_regs,
+				&ccsdata->num_sensor_manufacturer_regs, payload,
+				next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_READ_ONLY_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->module_read_only_regs,
+				&ccsdata->num_module_read_only_regs, payload,
+				next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_MANUFACTURER_REGS:
+			rval = ccs_data_parse_regs(
+				bin, &ccsdata->module_manufacturer_regs,
+				&ccsdata->num_module_manufacturer_regs, payload,
+				next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_PDAF_PIXEL_LOCATION:
+			rval = ccs_data_parse_pdaf(bin, &ccsdata->sensor_pdaf,
+						   payload, next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_PDAF_PIXEL_LOCATION:
+			rval = ccs_data_parse_pdaf(bin, &ccsdata->module_pdaf,
+						   payload, next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_SENSOR_RULE_BASED_BLOCK:
+			rval = ccs_data_parse_rules(
+				bin, &ccsdata->sensor_rules,
+				&ccsdata->num_sensor_rules, payload, next_block,
+				fh);
+			if (rval < 0)
+				return rval;
+			break;
+		case CCS_DATA_BLOCK_ID_MODULE_RULE_BASED_BLOCK:
+			rval = ccs_data_parse_rules(
+				bin, &ccsdata->module_rules,
+				&ccsdata->num_module_rules, payload, next_block,
+				fh);
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
+						  next_block, fh);
+			if (rval < 0)
+				return rval;
+			break;
+		default:
+			os_printf(fh, "WARNING: not handling block ID 0x%2.2x\n",
+				  block_id);
+		}
+
+		block = next_block;
+		is_first = false;
+	}
+
+	return 0;
+}
+
+int ccs_data_parse(struct ccs_data_container *ccsdata,
+		   const void *data, size_t len, printf_ctx fh, bool verbose)
+{
+	struct bin_container bin = { 0 };
+	int rval;
+
+	rval = __ccs_data_parse(&bin, ccsdata, data, len, fh, verbose);
+	if (rval)
+		return rval;
+
+	rval = bin_backing_alloc(&bin);
+	if (rval)
+		return rval;
+
+	rval = __ccs_data_parse(&bin, ccsdata, data, len, fh, false);
+	if (rval)
+		goto out_free;
+
+	if (verbose && ccsdata->version)
+		print_ccs_data_version(fh, ccsdata->version);
+
+	if (bin.now != bin.end) {
+		rval = -EPROTO;
+		os_printf(fh, "parsing mismatch; base %p; now %p; end %p\n",
+			  bin.base, bin.now, bin.end);
+		goto out_free;
+	}
+
+	ccsdata->backing = bin.base;
+
+	return 0;
+
+out_free:
+	os_free(bin.base);
+
+	return rval;
+}
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
new file mode 100644
index 000000000000..1dfc697fccdf
--- /dev/null
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/* Copyright 2019--2020 Intel Corporation */
+
+#ifndef __CCS_DATA_H__
+#define __CCS_DATA_H__
+
+#include "ccs-os.h"
+
+struct ccs_data_block_version {
+	uint16_t version_major;
+	uint16_t version_minor;
+	uint16_t date_year;
+	uint8_t date_month;
+	uint8_t date_day;
+};
+
+struct ccs_reg {
+	uint16_t addr;
+	uint16_t len;
+	uint8_t *value;
+};
+
+struct ccs_if_rule {
+	uint16_t addr;
+	uint8_t value;
+	uint8_t mask;
+};
+
+struct ccs_frame_format_desc {
+	uint8_t pixelcode;
+	uint16_t value;
+};
+
+struct ccs_frame_format_descs {
+	uint8_t num_column_descs;
+	uint8_t num_row_descs;
+	struct ccs_frame_format_desc *column_descs;
+	struct ccs_frame_format_desc *row_descs;
+};
+
+struct ccs_pdaf_readout {
+	uint8_t pdaf_readout_info_order;
+	struct ccs_frame_format_descs *ffd;
+};
+
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
+struct ccs_pdaf_pix_loc_block_desc {
+	uint8_t block_type_id;
+	uint16_t repeat_x;
+};
+
+struct ccs_pdaf_pix_loc_block_desc_group {
+	uint8_t repeat_y;
+	uint16_t num_block_descs;
+	struct ccs_pdaf_pix_loc_block_desc *block_descs;
+};
+
+struct ccs_pdaf_pix_loc_pixel_desc {
+	uint8_t pixel_type;
+	uint8_t small_offset_x;
+	uint8_t small_offset_y;
+};
+
+struct ccs_pdaf_pix_loc_pixel_desc_group {
+	uint8_t num_descs;
+	struct ccs_pdaf_pix_loc_pixel_desc *descs;
+};
+
+struct ccs_pdaf_pix_loc {
+	uint16_t main_offset_x;
+	uint16_t main_offset_y;
+	uint8_t global_pdaf_type;
+	uint8_t block_width;
+	uint8_t block_height;
+	uint16_t num_block_desc_groups;
+	struct ccs_pdaf_pix_loc_block_desc_group *block_desc_groups;
+	uint8_t num_pixel_desc_grups;
+	struct ccs_pdaf_pix_loc_pixel_desc_group *pixel_desc_groups;
+};
+
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
+		   size_t len, printf_ctx fh, bool verbose);
+
+#endif /* __CCS_DATA_H__ */
-- 
2.27.0

