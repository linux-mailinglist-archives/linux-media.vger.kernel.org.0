Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8C26E0ABA
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjDMJzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjDMJzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:55:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E1C903D
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379685; x=1712915685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OIi/hVk/pkGaa2KaIfEyhvNfnYx1sNth5+0TXu1onzc=;
  b=cY2W3hJ7Bbt72DssTeIgU1Fr5OeSksB0vMXS1NJhDp6CCa021Oeykhm1
   LEULAy7+o5zxlDDj9UiaVnQgt3aIrxY98QdGd+FcFS45likV91n3lxv/r
   PkMxIFibObry3bZHcfFWK34dpw3R1JPt2dXMVv3Z8eeQNHbCSfq6gRUbe
   dG0BWOKK3cpiEpmXwQEB/PteWHMMPmJK0zWXKY5jBeZTkORQTj1QL4Z/D
   WW3oXFqgFZjA0LaGxPLKVojajvMOeROX9hTxvoBvnTxYGHEBuXsv5Dcsx
   4jNkRB6fK4CCsy4/x0NU9JxN2o+ZFTeG56JF3YgsEvY2IK6Kl8J5ruilz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371992938"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371992938"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639600033"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639600033"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:54:39 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 04/14] media: intel/ipu6: CPD parsing for get firmware components
Date:   Thu, 13 Apr 2023 18:04:19 +0800
Message-Id: <20230413100429.919622-5-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

For IPU6, firmware is generated and released as signed
Code Partition Directory (CPD) format file, which is aligned with
the SPI flash code partition definition. CPD format include CPD
header, manifest, metadata and module data. Driver can parse them
according to the CPD layout to acquire each component.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 359 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h | 107 +++++++
 2 files changed, 466 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
new file mode 100644
index 000000000000..23eb0ed96686
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2015 - 2023 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-cpd.h"
+
+/* 15 entries + header*/
+#define MAX_PKG_DIR_ENT_CNT		16
+/* 2 qword per entry/header */
+#define PKG_DIR_ENT_LEN			2
+/* PKG_DIR size in bytes */
+#define PKG_DIR_SIZE			((MAX_PKG_DIR_ENT_CNT) *	\
+					 (PKG_DIR_ENT_LEN) * sizeof(u64))
+/* _IUPKDR_ */
+#define PKG_DIR_HDR_MARK		0x5f4955504b44525f
+
+/* $CPD */
+#define CPD_HDR_MARK			0x44504324
+
+#define MAX_MANIFEST_SIZE		(SZ_2K * sizeof(u32))
+#define MAX_METADATA_SIZE		SZ_64K
+
+#define MAX_COMPONENT_ID		127
+#define MAX_COMPONENT_VERSION		0xffff
+
+#define MANIFEST_IDX	0
+#define METADATA_IDX	1
+#define MODULEDATA_IDX	2
+/*
+ * PKG_DIR Entry (type == id)
+ * 63:56        55      54:48   47:32   31:24   23:0
+ * Rsvd         Rsvd    Type    Version Rsvd    Size
+ */
+#define PKG_DIR_SIZE_MASK	GENMASK(23, 0)
+#define PKG_DIR_VERSION_MASK	GENMASK(47, 32)
+#define PKG_DIR_TYPE_MASK	GENMASK(54, 48)
+
+static inline const struct ipu6_cpd_ent *ipu6_cpd_get_entry(const void *cpd,
+							    u8 idx)
+{
+	const struct ipu6_cpd_hdr *cpd_hdr = cpd;
+	const struct ipu6_cpd_ent *ent;
+
+	ent = (const struct ipu6_cpd_ent *)((const u8 *)cpd + cpd_hdr->hdr_len);
+	return ent + idx;
+}
+
+#define ipu6_cpd_get_manifest(cpd) ipu6_cpd_get_entry(cpd, MANIFEST_IDX)
+#define ipu6_cpd_get_metadata(cpd) ipu6_cpd_get_entry(cpd, METADATA_IDX)
+#define ipu6_cpd_get_moduledata(cpd) ipu6_cpd_get_entry(cpd, MODULEDATA_IDX)
+
+static const struct ipu6_cpd_metadata_cmpnt_hdr *
+ipu6_cpd_metadata_get_cmpnt(struct ipu6_device *isp, const void *metadata,
+			    unsigned int metadata_size, u8 idx)
+{
+	size_t extn_size = sizeof(struct ipu6_cpd_metadata_extn);
+	size_t cmpnt_count = metadata_size - extn_size;
+
+	cmpnt_count = div_u64(cmpnt_count, isp->cpd_metadata_cmpnt_size);
+
+	if (idx > MAX_COMPONENT_ID || idx >= cmpnt_count) {
+		dev_err(&isp->pdev->dev, "Component index out of range (%d)\n",
+			idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return metadata + extn_size + idx * isp->cpd_metadata_cmpnt_size;
+}
+
+static u32 ipu6_cpd_metadata_cmpnt_version(struct ipu6_device *isp,
+					   const void *metadata,
+					   unsigned int metadata_size, u8 idx)
+{
+	const struct ipu6_cpd_metadata_cmpnt_hdr *cmpnt =
+		ipu6_cpd_metadata_get_cmpnt(isp, metadata, metadata_size, idx);
+
+	if (IS_ERR(cmpnt))
+		return PTR_ERR(cmpnt);
+
+	return cmpnt->ver;
+}
+
+static int ipu6_cpd_metadata_get_cmpnt_id(struct ipu6_device *isp,
+					  const void *metadata,
+					  unsigned int metadata_size, u8 idx)
+{
+	const struct ipu6_cpd_metadata_cmpnt_hdr *cmpnt =
+		ipu6_cpd_metadata_get_cmpnt(isp, metadata,
+					    metadata_size, idx);
+
+	if (IS_ERR(cmpnt))
+		return PTR_ERR(cmpnt);
+
+	return cmpnt->id;
+}
+
+static int ipu6_cpd_parse_module_data(struct ipu6_device *isp,
+				      const void *module_data,
+				      unsigned int module_data_size,
+				      dma_addr_t dma_addr_module_data,
+				      u64 *pkg_dir, const void *metadata,
+				      unsigned int metadata_size)
+{
+	const struct ipu6_cpd_module_data_hdr *module_data_hdr;
+	const struct ipu6_cpd_hdr *dir_hdr;
+	const struct ipu6_cpd_ent *dir_ent;
+	unsigned int i;
+	u8 len;
+
+	if (!module_data)
+		return -EINVAL;
+
+	module_data_hdr = module_data;
+	dir_hdr = module_data + module_data_hdr->hdr_len;
+	len = dir_hdr->hdr_len;
+	dir_ent = (const struct ipu6_cpd_ent *)(((u8 *)dir_hdr) + len);
+
+	pkg_dir[0] = PKG_DIR_HDR_MARK;
+	/* pkg_dir entry count = component count + pkg_dir header */
+	pkg_dir[1] = dir_hdr->ent_cnt + 1;
+
+	for (i = 0; i < dir_hdr->ent_cnt; i++, dir_ent++) {
+		u64 *p = &pkg_dir[PKG_DIR_ENT_LEN *  (1 + i)];
+		int ver, id;
+
+		*p++ = dma_addr_module_data + dir_ent->offset;
+
+		id = ipu6_cpd_metadata_get_cmpnt_id(isp, metadata,
+						    metadata_size, i);
+
+		if (id < 0 || id > MAX_COMPONENT_ID) {
+			dev_err(&isp->pdev->dev, "Invalid CPD component id\n");
+			return -EINVAL;
+		}
+
+		ver = ipu6_cpd_metadata_cmpnt_version(isp, metadata,
+						      metadata_size, i);
+
+		if (ver < 0 || ver > MAX_COMPONENT_VERSION) {
+			dev_err(&isp->pdev->dev,
+				"Invalid CPD component version\n");
+			return -EINVAL;
+		}
+
+		*p = FIELD_PREP(PKG_DIR_SIZE_MASK, dir_ent->len) |
+			FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
+			FIELD_PREP(PKG_DIR_VERSION_MASK, ver);
+	}
+
+	return 0;
+}
+
+int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src)
+{
+	dma_addr_t dma_addr_src = sg_dma_address(adev->fw_sgt.sgl);
+	const struct ipu6_cpd_ent *ent, *man_ent, *met_ent;
+	struct ipu6_device *isp = adev->isp;
+	unsigned int man_sz, met_sz;
+	void *pkg_dir_pos;
+	int ret;
+
+	man_ent = ipu6_cpd_get_manifest(src);
+	man_sz = man_ent->len;
+
+	met_ent = ipu6_cpd_get_metadata(src);
+	met_sz = met_ent->len;
+
+	adev->pkg_dir_size = PKG_DIR_SIZE + man_sz + met_sz;
+	adev->pkg_dir = dma_alloc_attrs(&adev->dev, adev->pkg_dir_size,
+					&adev->pkg_dir_dma_addr, GFP_KERNEL, 0);
+	if (!adev->pkg_dir)
+		return -ENOMEM;
+
+	/*
+	 * pkg_dir entry/header:
+	 * qword | 63:56 | 55   | 54:48 | 47:32 | 31:24 | 23:0
+	 * N         Address/Offset/"_IUPKDR_"
+	 * N + 1 | rsvd  | rsvd | type  | ver   | rsvd  | size
+	 *
+	 * We can ignore other fields that size in N + 1 qword as they
+	 * are 0 anyway. Just setting size for now.
+	 */
+
+	ent = ipu6_cpd_get_moduledata(src);
+
+	ret = ipu6_cpd_parse_module_data(isp, src + ent->offset,
+					 ent->len, dma_addr_src + ent->offset,
+					 adev->pkg_dir, src + met_ent->offset,
+					 met_ent->len);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Failed to parse module data\n");
+		dma_free_attrs(&isp->psys->dev, adev->pkg_dir_size,
+			       adev->pkg_dir, adev->pkg_dir_dma_addr, 0);
+		return -EINVAL;
+	}
+
+	/* Copy manifest after pkg_dir */
+	pkg_dir_pos = adev->pkg_dir + PKG_DIR_ENT_LEN * MAX_PKG_DIR_ENT_CNT;
+	memcpy(pkg_dir_pos, src + man_ent->offset, man_sz);
+
+	/* Copy metadata after manifest */
+	pkg_dir_pos += man_sz;
+	memcpy(pkg_dir_pos, src + met_ent->offset, met_sz);
+
+	dma_sync_single_range_for_device(&adev->dev, adev->pkg_dir_dma_addr,
+					 0, adev->pkg_dir_size, DMA_TO_DEVICE);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, INTEL_IPU6);
+
+void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev)
+{
+	dma_free_attrs(&adev->dev, adev->pkg_dir_size, adev->pkg_dir,
+		       adev->pkg_dir_dma_addr, 0);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, INTEL_IPU6);
+
+static int ipu6_cpd_validate_cpd(struct ipu6_device *isp, const void *cpd,
+				 unsigned long cpd_size,
+				 unsigned long data_size)
+{
+	const struct ipu6_cpd_hdr *cpd_hdr = cpd;
+	const struct ipu6_cpd_ent *ent;
+	unsigned int i;
+	u8 len;
+
+	len = cpd_hdr->hdr_len;
+
+	/* Ensure cpd hdr is within moduledata */
+	if (cpd_size < len) {
+		dev_err(&isp->pdev->dev, "Invalid CPD moduledata size\n");
+		return -EINVAL;
+	}
+
+	/* Sanity check for CPD header */
+	if ((cpd_size - len) / sizeof(*ent) < cpd_hdr->ent_cnt) {
+		dev_err(&isp->pdev->dev, "Invalid CPD header\n");
+		return -EINVAL;
+	}
+
+	/* Ensure that all entries are within moduledata */
+	ent = (const struct ipu6_cpd_ent *)(((const u8 *)cpd_hdr) + len);
+	for (i = 0; i < cpd_hdr->ent_cnt; i++, ent++) {
+		if (data_size < ent->offset ||
+		    data_size - ent->offset < ent->len) {
+			dev_err(&isp->pdev->dev, "Invalid CPD entry (%d)\n", i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
+					const void *moduledata,
+					u32 moduledata_size)
+{
+	const struct ipu6_cpd_module_data_hdr *mod_hdr = moduledata;
+	int ret;
+
+	/* Ensure moduledata hdr is within moduledata */
+	if (moduledata_size < sizeof(*mod_hdr) ||
+	    moduledata_size < mod_hdr->hdr_len) {
+		dev_err(&isp->pdev->dev, "Invalid CPD moduledata size\n");
+		return -EINVAL;
+	}
+
+	dev_info(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
+	ret = ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
+				    moduledata_size - mod_hdr->hdr_len,
+				    moduledata_size);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Invalid CPD in moduledata\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ipu6_cpd_validate_metadata(struct ipu6_device *isp,
+				      const void *metadata, u32 meta_size)
+{
+	const struct ipu6_cpd_metadata_extn *extn = metadata;
+
+	/* Sanity check for metadata size */
+	if (meta_size < sizeof(*extn) || meta_size > MAX_METADATA_SIZE) {
+		dev_err(&isp->pdev->dev, "Invalid CPD metadata\n");
+		return -EINVAL;
+	}
+
+	/* Validate extension and image types */
+	if (extn->extn_type != IPU6_CPD_METADATA_EXTN_TYPE_IUNIT ||
+	    extn->img_type != IPU6_CPD_METADATA_IMAGE_TYPE_MAIN_FIRMWARE) {
+		dev_err(&isp->pdev->dev,
+			"Invalid CPD metadata descriptor img_type (%d)\n",
+			extn->img_type);
+		return -EINVAL;
+	}
+
+	/* Validate metadata size multiple of metadata components */
+	if ((meta_size - sizeof(*extn)) % isp->cpd_metadata_cmpnt_size) {
+		dev_err(&isp->pdev->dev, "Invalid CPD metadata size\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+			       unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_hdr *hdr = cpd_file;
+	const struct ipu6_cpd_ent *ent;
+	int ret;
+
+	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
+				    cpd_file_size);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Invalid CPD in file\n");
+		return -EINVAL;
+	}
+
+	/* Check for CPD file marker */
+	if (hdr->hdr_mark != CPD_HDR_MARK) {
+		dev_err(&isp->pdev->dev, "Invalid CPD header\n");
+		return -EINVAL;
+	}
+
+	/* Sanity check for manifest size */
+	ent = ipu6_cpd_get_manifest(cpd_file);
+	if (ent->len > MAX_MANIFEST_SIZE) {
+		dev_err(&isp->pdev->dev, "Invalid CPD manifest size\n");
+		return -EINVAL;
+	}
+
+	/* Validate metadata */
+	ent = ipu6_cpd_get_metadata(cpd_file);
+	ret = ipu6_cpd_validate_metadata(isp, cpd_file + ent->offset, ent->len);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Invalid CPD metadata\n");
+		return ret;
+	}
+
+	/* Validate moduledata */
+	ent = ipu6_cpd_get_moduledata(cpd_file);
+	ret = ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
+					   ent->len);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Invalid CPD moduledata\n");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.h b/drivers/media/pci/intel/ipu6/ipu6-cpd.h
new file mode 100644
index 000000000000..baa15faff9d6
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2015 - 2023 Intel Corporation */
+
+#ifndef IPU6_CPD_H
+#define IPU6_CPD_H
+
+#define IPU6_CPD_SIZE_OF_FW_ARCH_VERSION	7
+#define IPU6_CPD_SIZE_OF_SYSTEM_VERSION		11
+#define IPU6_CPD_SIZE_OF_COMPONENT_NAME		12
+
+#define IPU6_CPD_METADATA_EXTN_TYPE_IUNIT	0x10
+
+#define IPU6_CPD_METADATA_IMAGE_TYPE_RESERVED		0
+#define IPU6_CPD_METADATA_IMAGE_TYPE_BOOTLOADER		1
+#define IPU6_CPD_METADATA_IMAGE_TYPE_MAIN_FIRMWARE	2
+
+#define IPU6_CPD_PKG_DIR_PSYS_SERVER_IDX	0
+#define IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX	1
+
+#define IPU6_CPD_PKG_DIR_CLIENT_PG_TYPE		3
+
+#define IPU6_CPD_METADATA_HASH_KEY_SIZE		48
+#define IPU6SE_CPD_METADATA_HASH_KEY_SIZE	32
+
+struct ipu6_cpd_module_data_hdr {
+	u32 hdr_len;
+	u32 endian;
+	u32 fw_pkg_date;
+	u32 hive_sdk_date;
+	u32 compiler_date;
+	u32 target_platform_type;
+	u8 sys_ver[IPU6_CPD_SIZE_OF_SYSTEM_VERSION];
+	u8 fw_arch_ver[IPU6_CPD_SIZE_OF_FW_ARCH_VERSION];
+	u8 rsvd[2];
+} __packed;
+
+/*
+ * ipu6_cpd_hdr structure updated as the chksum and
+ * sub_partition_name is unused on host side
+ * CSE layout version 1.6 for IPU6SE (hdr_len = 0x10)
+ * CSE layout version 1.7 for IPU6 (hdr_len = 0x14)
+ */
+struct ipu6_cpd_hdr {
+	u32 hdr_mark;
+	u32 ent_cnt;
+	u8 hdr_ver;
+	u8 ent_ver;
+	u8 hdr_len;
+} __packed;
+
+struct ipu6_cpd_ent {
+	u8 name[IPU6_CPD_SIZE_OF_COMPONENT_NAME];
+	u32 offset;
+	u32 len;
+	u8 rsvd[4];
+} __packed;
+
+struct ipu6_cpd_metadata_cmpnt_hdr {
+	u32 id;
+	u32 size;
+	u32 ver;
+} __packed;
+
+struct ipu6_cpd_metadata_cmpnt {
+	struct ipu6_cpd_metadata_cmpnt_hdr hdr;
+	u8 sha2_hash[IPU6_CPD_METADATA_HASH_KEY_SIZE];
+	u32 entry_point;
+	u32 icache_base_offs;
+	u8 attrs[16];
+} __packed;
+
+struct ipu6se_cpd_metadata_cmpnt {
+	struct ipu6_cpd_metadata_cmpnt_hdr hdr;
+	u8 sha2_hash[IPU6SE_CPD_METADATA_HASH_KEY_SIZE];
+	u32 entry_point;
+	u32 icache_base_offs;
+	u8 attrs[16];
+} __packed;
+
+struct ipu6_cpd_metadata_extn {
+	u32 extn_type;
+	u32 len;
+	u32 img_type;
+	u8 rsvd[16];
+} __packed;
+
+struct ipu6_cpd_client_pkg_hdr {
+	u32 prog_list_offs;
+	u32 prog_list_size;
+	u32 prog_desc_offs;
+	u32 prog_desc_size;
+	u32 pg_manifest_offs;
+	u32 pg_manifest_size;
+	u32 prog_bin_offs;
+	u32 prog_bin_size;
+} __packed;
+
+int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src);
+void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev);
+int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+			       unsigned long cpd_file_size);
+unsigned int ipu6_cpd_pkg_dir_get_address(const u64 *pkg_dir, int pkg_dir_idx);
+unsigned int ipu6_cpd_pkg_dir_get_num_entries(const u64 *pkg_dir);
+unsigned int ipu6_cpd_pkg_dir_get_size(const u64 *pkg_dir, int pkg_dir_idx);
+unsigned int ipu6_cpd_pkg_dir_get_type(const u64 *pkg_dir, int pkg_dir_idx);
+
+#endif /* IPU6_CPD_H */
-- 
2.39.1

