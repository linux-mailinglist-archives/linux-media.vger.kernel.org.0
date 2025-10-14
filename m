Return-Path: <linux-media+bounces-44359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A41BD80E3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45151921F9D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C086E30F811;
	Tue, 14 Oct 2025 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A/12oMO0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4491D5AC6;
	Tue, 14 Oct 2025 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428883; cv=none; b=V96oJpuc5lU3cOqiEqlhwhuaaIagREAkybXKu13EYrmXxNlIWRqnsqGfH+gXDFI5dsmHVPC532AyJi8Om137Z8itonUqJY+PQcFQiLAHGUbxzhiysEMYDFQ6NxQo4efpPfUIjQXEIgKoneSsZo8ZVIfVqs4ffeROFozNBh8YKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428883; c=relaxed/simple;
	bh=7ktxgAwKbkDVxOZvf+O7nZBZCn134GgJkCvMxSvF7XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdWs5G1vdEAdzQkQ8BHNmSyXyUDJn8DHaqgW+nwSirQL/jAuOlODJ1E/almQGteFWIc9BvPPPwtlkg0DXSdqt6XhB9VYmd5v2RaDbLTNUAuInYXXDVVtMI+ei8NOxWXWSo+eLTqc23arpmY/zUMHcGO6ZLy48ngy5mTCm7syL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A/12oMO0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABB60DF3;
	Tue, 14 Oct 2025 09:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428775;
	bh=7ktxgAwKbkDVxOZvf+O7nZBZCn134GgJkCvMxSvF7XU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A/12oMO03XN1PbJQcbmOmva1Ciy/G5ZGQg/obYMIVER1wB4uT0UunJCoJFWjtoHxK
	 cUzZ5kb0ZI7itfRpIvuxPBsos1k1XlHGTCZZN0qbALIZ2NAU//2z4zeuoBXLlqR0Kj
	 v1mNaJbeOB+enwBAjdOTtpiVE61tLMVjuiXm7Rko=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:00:54 +0200
Subject: [PATCH v7 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-2-6628bed5ca98@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8022;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=7ktxgAwKbkDVxOZvf+O7nZBZCn134GgJkCvMxSvF7XU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNGOhiD7mqa+MQRLm6Fy0fjuwAqXRoMl8Vdi
 +U7sbG7xHGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRgAKCRByNAaPFqFW
 PPaMD/0SPNK6wtpw7BqxFLw6KDkcP6V6q2CqcIiIlspjXeXjAH9h18NGQZGw8zfd9Pjw2kxNkWD
 00NHnk7b+0BCm/6QKKd7UDFTXK7STVr9mCvHxxCWnV/ogYayoQFu0T3CCDxvlfecTdrKVvY5Rf2
 EHYzZ72DUSA04sx44dEZP+b/NYti6Mb8E5+dZHnKYoOdMIg1CtLAxsksXrOZk2uwpHo2FV04Hvi
 g6wHIUo39MceVfaiprI/4cmxE5AlFztOOZo8TOIvbYS0fI4zNKHxJTqJSEvuzRC/LsESxXx+ybc
 RGAKp4264YTBOgCeD+n+y3NLIdzd+Qa4OqIaVHEvwOWxlY86ZAnX1LSWut4kymHSE0f1k4Sd6dH
 sNN83AMIh+KVwNLd/VI5hZ1WrA+kHl8k6oe0pIj4tDBqKGSFVhgQCSrh/L2cT+6jOxZLo/2bPuy
 Pqh6Y/2bfqfFazY5OsAhtEuGlDKdPIX9BnGQscPQxMdzj+TAnVF62iIMASbfVHZTB4Hvd3R5xlx
 7JwQmh7b3G2m7bJ2UatYRhsnl2ybD7bOujHt3j8sWDR91AMyaF2esflbA5q3170+bR1fIBr4nCf
 2WEtjMrmJ+mX9GxRKmwJx9rGmAkqpbR35ZFMUHsPr4dMXVlsjIF9yAnbcBzbC9b8FjXx9XIZGMl
 qrz7t/4MC08gpyw==
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
 include/uapi/linux/rkisp1-config.h | 107 +++++++++----------------------------
 1 file changed, 24 insertions(+), 83 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..b2d2a71f7baff3833b20519264b58db7f168af90 100644
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
@@ -1588,27 +1540,14 @@ struct rkisp1_ext_params_wdr_config {
  * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
  */
 enum rksip1_ext_param_buffer_version {
-	RKISP1_EXT_PARAM_BUFFER_V1 = 1,
+	RKISP1_EXT_PARAM_BUFFER_V1 = V4L2_ISP_PARAMS_VERSION_V1,
 };
 
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


