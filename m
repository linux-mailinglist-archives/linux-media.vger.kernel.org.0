Return-Path: <linux-media+bounces-43856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20477BC2573
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D01188FE75
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163362E974C;
	Tue,  7 Oct 2025 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJpFJS4u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC22E7BCF;
	Tue,  7 Oct 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860755; cv=none; b=dKz0RZxFdIjpzJU/UB1UOJZDYZAFhcuAKrf7ZlJEE+PXed5JOAskq8+odDVDi8IvOi2JXY+tGI/ezKTCnDk9+BZQKDeUWePiDk1SsT7VPL6LOBTbc3ZREqRj9CCbF5Z23LvYQxDhe6gWXzigLFi0nqNRU0ZoiwgWZ2yhTuACh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860755; c=relaxed/simple;
	bh=Oer7+SVKkWs5I3y4KWYiwuqB2+mjnGg10Pkx15hV7Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLs6qHzFVJmCG8awnsa3w1AYZTMP1KNkmjZscbVzvVEBaPf8J11TmYIJ5EJWNjvt2z1LtyAOlUHnMm9rnsFpxoQ9ttlArDk4HdDVTDthtuAxv5Ok20m0DsL95ubIoBtulQDymHb1X1M6pKm1Sq8hgtgdlGL4veIXBPUV8GNDisc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJpFJS4u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF4F46DF;
	Tue,  7 Oct 2025 20:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860653;
	bh=Oer7+SVKkWs5I3y4KWYiwuqB2+mjnGg10Pkx15hV7Tw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AJpFJS4ugHVhILrxmsmH0w32GivukdwFyLzzU/TnrAgMyWfhIJi5Zwba2XhEBI6FK
	 WdFGr0/ka9hJNTcyrlrz4Gu/1RpHMXeDq0Oh32zraWfpW9zgT2/i01GSaQ8wTrHT81
	 PFlbZW/5C4ComJgWZefZT3/2U+izk0GCsx2Rv1HQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:11 +0200
Subject: [PATCH v6 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-2-5f719d9f39e5@ideasonboard.com>
References: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
In-Reply-To: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7792;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Oer7+SVKkWs5I3y4KWYiwuqB2+mjnGg10Pkx15hV7Tw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgHDdDt9pOTiHUjSpxE1iMmeeqJ/QvJMN9xU
 30WTBcJR9+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBwAKCRByNAaPFqFW
 PLZfD/4h0gAJuib5Mf74/spCyTtPoqvsweZdYawcX8vF+IuMGerRmEjEdb/8119s8KahmRTNkOz
 wCOOIwvNqDuvnGUeTPFGeWr6xE/pwczuz9rryaF83Y/chDaLEinODdzPuqK96bqcbGo+N8cNZqZ
 C7ihY3hj9qZHi9AZMG5O+VQD4kDgc1xxkDdkMww2jewG/95mVg2JN1NZggBd9iHnSo8uVC78aQq
 zT/zwhF76JXsNwKH5W93jL2+i/z4X0xHmJJf7A5hObZs2yvZrjVYF853lK49ZLSQYVPBkzJbD1K
 mMDlUlPsKEJLJjiAQniS3NOvEzFhiYurUQqCVdmL9mDjIjMQQfM5HAgPRWTFJmisZiDggWO8utm
 QpccJuxx6gDASfcp91bbkbZn/VZsyX4EMG9KgpTyI796FHbVETwxVRuLCev0oqXlI8l1sWoLs2P
 dh7ilDuk5KcP1lrEaaNOtOQUtIK0MK6YQama9uUCmXpcPjB4WQd9VpRNd+R2lmDkW1R5cjGbjys
 RSqcG6VxMV9UXzVXEFamiauppwekEU/j4GINBK+Zb7ooViOjA/MWFpMLAPTLjNxCz+EbMJbHT9d
 9Js74k1n6FUJMNE0MReAH5x4clP2nSwbKSOVfP7Be5bZryR/h5ad9KkDzXpLB+IPNivnrTqQguz
 IqQwELHlfUwDPUg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the introduction of common types for extensible parameters
format, convert the rkisp1-config.h header to use the new types.

Factor-out the documentation that is now part of the common header
and only keep the driver-specific on in place.

The conversion to use common types doesn't impact userspace as the
new types are either identical to the ones already existing in the
RkISP1 uAPI or are 1-to-1 type convertible.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/uapi/linux/rkisp1-config.h | 105 ++++++++-----------------------------
 1 file changed, 23 insertions(+), 82 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..950020c62781ad19db149200a285c206ef000a37 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -7,8 +7,13 @@
 #ifndef _UAPI_RKISP1_CONFIG_H
 #define _UAPI_RKISP1_CONFIG_H
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
 #include <linux/types.h>
 
+#include <linux/media/v4l2-isp.h>
+
 /* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
@@ -1158,79 +1163,26 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
 };
 
-#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
-#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
+/* For backward compatibility */
+#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_ISP_PARAMS_FL_BLOCK_DISABLE
+#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
 
 /* A bitmask of parameters blocks supported on the current hardware. */
 #define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
 
 /**
- * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
- *					   header
+ * rkisp1_ext_params_block_header - RkISP1 extensible parameters block header
  *
  * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data. The
- * driver inspects this common header to discern the block type and its size and
- * properly handle the block content by casting it to the correct block-specific
- * type.
+ * blocks and is identical to :c:type:`v4l2_isp_params_block_header`.
  *
- * The @type field is one of the values enumerated by
+ * The type field is one of the values enumerated by
  * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
- * interpreted by the driver. The @size field specifies the size of the
- * parameters block and is used by the driver for validation purposes.
- *
- * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
- *
- * When userspace wants to configure and enable an ISP block it shall fully
- * populate the block configuration and set the
- * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE bit in the @flags field.
- *
- * When userspace simply wants to disable an ISP block the
- * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
- * driver ignores the rest of the block configuration structure in this case.
- *
- * If a new configuration of an ISP block has to be applied userspace shall
- * fully populate the ISP block configuration and omit setting the
- * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
- * in the @flags field.
- *
- * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
- * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
- * and not accepted by the driver.
- *
- * Userspace is responsible for correctly populating the parameters block header
- * fields (@type, @flags and @size) and the block-specific parameters.
- *
- * For example:
+ * interpreted by the driver.
  *
- * .. code-block:: c
- *
- *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
- *		struct rkisp1_ext_params_bls_config *bls =
- *			(struct rkisp1_ext_params_bls_config *)block;
- *
- *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
- *		bls->header.flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;
- *		bls->header.size = sizeof(*bls);
- *
- *		bls->config.enable_auto = 0;
- *		bls->config.fixed_val.r = blackLevelRed_;
- *		bls->config.fixed_val.gr = blackLevelGreenR_;
- *		bls->config.fixed_val.gb = blackLevelGreenB_;
- *		bls->config.fixed_val.b = blackLevelBlue_;
- *	}
- *
- * @type: The parameters block type, see
- *	  :c:type:`rkisp1_ext_params_block_type`
- * @flags: A bitmask of block flags
- * @size: Size (in bytes) of the parameters block, including this header
+ * The flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
  */
-struct rkisp1_ext_params_block_header {
-	__u16 type;
-	__u16 flags;
-	__u32 size;
-};
+#define rkisp1_ext_params_block_header v4l2_isp_params_block_header
 
 /**
  * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
@@ -1594,21 +1546,8 @@ enum rksip1_ext_param_buffer_version {
 /**
  * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
  *
- * This struct contains the configuration parameters of the RkISP1 ISP
- * algorithms, serialized by userspace into a data buffer. Each configuration
- * parameter block is represented by a block-specific structure which contains a
- * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
- * populates the @data buffer with configuration parameters for the blocks that
- * it intends to configure. As a consequence, the data buffer effective size
- * changes according to the number of ISP blocks that userspace intends to
- * configure and is set by userspace in the @data_size field.
- *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace shall populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated version and return an error if the desired version is not
- * supported.
+ * This is the driver-specific implementation of
+ * :c:type:`v4l2_isp_params_buffer`.
  *
  * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
  * When a new format version will be added, a mechanism for userspace to query
@@ -1624,11 +1563,6 @@ enum rksip1_ext_param_buffer_version {
  * the maximum value represents the blocks supported by the kernel driver,
  * independently of the device instance.
  *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between nor overlaps. Userspace shall populate the @data_size field with
- * the effective size, in bytes, of the @data buffer.
- *
  * The expected memory layout of the parameters buffer is::
  *
  *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
@@ -1678,4 +1612,11 @@ struct rkisp1_ext_params_cfg {
 	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
 };
 
+#ifdef __KERNEL__
+/* Make sure the header is type-convertible to the generic v4l2 params one */
+static_assert((sizeof(struct rkisp1_ext_params_cfg) -
+	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
+	      sizeof(struct v4l2_isp_params_buffer));
+#endif /* __KERNEL__ */
+
 #endif /* _UAPI_RKISP1_CONFIG_H */

-- 
2.51.0


