Return-Path: <linux-media+bounces-37309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640BB00460
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC851AA49C4
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEF0273808;
	Thu, 10 Jul 2025 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YqZNYKOL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC4272803;
	Thu, 10 Jul 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155572; cv=none; b=QI3P1CU41Z/7WctAlBXU+6T4riZ3oouDTOaKeHcIuqcBVzQ8D7j8Ym+Cqeq0pAxOD6hJP38k8WMfYik534KdaMgiGoLS3/fNO8ZBvX5J6l+EYlszeJylzeLZYbinjr1GMtQ7ILbAp43hclZFoZtlam9BLD+EjNGCqFSJ0v/Q8F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155572; c=relaxed/simple;
	bh=7p0S45GnAkMB2JTqcBE/TxN1viQO9Br2/si04uKRvuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUEUtFBpvAi0xcCYq6GiuqtEIF3GmS35PSOy/eosRokApVaZSRUs7fGW3jIytYOi/yLN9sbgb7UustsVq/9vhssmIzxzNKWoy9T2nORhGamfdCKeua9tTgHSlx3axabbM+vIuFuli7EwP0SZfTH+097F0pfFn0CfbFUIiPpkvOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YqZNYKOL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A94C1F09;
	Thu, 10 Jul 2025 15:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752155538;
	bh=7p0S45GnAkMB2JTqcBE/TxN1viQO9Br2/si04uKRvuw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YqZNYKOL4sEZl6L/e0Y/gn4uQUk1zC1PNKArvGTWL53QaSRDx9+jVgO8oTI+v1aRk
	 P4iBCm4S449ERE4Vbu0UgjhzvO94TvXUkzwwMBGLXg0w/e8hywB4EaYremqFjT3QpC
	 5PPtRZFctYDjkbkeNEythomyWmjRS9eE/w3Gxtyk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:52:11 +0200
Subject: [PATCH v2 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-extensible-parameters-validation-v2-2-7ec8918ec443@ideasonboard.com>
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
In-Reply-To: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6938;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=7p0S45GnAkMB2JTqcBE/TxN1viQO9Br2/si04uKRvuw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBob8WqKkT3l39ZAnRcXrrHJdFtr9TupVQPGHlwE
 QmsTyueR6OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaG/FqgAKCRByNAaPFqFW
 PJarD/9zgkvZ8OtUyvwEFgld1YJgvPSgPeZc9uoXH/PBkCdJQGs36mElBh3QwEpCQ8mSlIe9/n8
 IsbZ+IacaaQbLQqsF37+iMsoCbhlBpgq0wNSbewPB76UJWQw5DYf9AqvyNHAvFjgRIJBhaILFKj
 GeFNuFiP9oLyCfQNp0E9z7/TffzvTERZZE+t0xnckxXFvsESGLKKeigCpsexuF9+NL2zqfcV5Zp
 YmBHlnMj1JCmNGMJvRCFaTYMpWYhRV7ypljDtKj/BZNZV+57V8dnP0ceFkpGvNag9YwRbXZiD5x
 uVl8LYrSLDln33D9jPOfGrtT0/H+YEOGF3AmWLBJjyQ5EDdDlcxDrh75HuwDKsUnBKbjEBRE0HT
 w786Br6RKsWU83KJluyidSvcZsixV99iHiwyR+3QYGOZp8z8StknWNkPFpHZAjkuyLWIIP179ox
 2dLVHG1mAUYp/dWx8V6UX2mStbKwrMftJHQCOwS6uHyoB4JexUTRvwkcxD15gVG2cIbwHEq2UL3
 REGGjvMPnKpQChn+2zXzVzV5ra8EVKd2hc16iWH2R6vOCTKzZUu9JOtmezCnBQhi9tiWKuRpbEz
 Nq45hnxN3p1bxrxbuygqtkNb9a4CFX709MP1Ad9KSFmBUsGVS+2HqDRrLHgJB6vDIrKg2OmCgdR
 EYCVjR3IrTQ6IfA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the introduction of common types for extensible parameters
format, convert the rkisp1-config.h header to use the new types.

Factor-out the documentation that is now part of the common header
and only keep the driver-specific on in place.

The conversion to use common types doesn't impact userspace as the
new types are either identical to the ones already existing in the
RkISP1 uAPI or are 1-to-1 type convertible.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/rkisp1-config.h | 67 +++++++++++++-------------------------
 1 file changed, 23 insertions(+), 44 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..fc040c7fb13cf18eaf8d9067e7be38bff120e6f6 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -7,8 +7,13 @@
 #ifndef _UAPI_RKISP1_CONFIG_H
 #define _UAPI_RKISP1_CONFIG_H
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
 #include <linux/types.h>
 
+#include <linux/media/v4l2-extensible-params.h>
+
 /* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
@@ -1158,26 +1163,21 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
 };
 
-#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
-#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
+#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
+#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
 
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
+ * blocks and is identical to :c:type:`v4l2_params_block_header`.
  *
- * The @type field is one of the values enumerated by
+ * The type field is one of the values enumerated by
  * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
- * interpreted by the driver. The @size field specifies the size of the
+ * interpreted by the driver. The size field specifies the size of the
  * parameters block and is used by the driver for validation purposes.
  *
  * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
@@ -1193,14 +1193,14 @@ enum rkisp1_ext_params_block_type {
  * If a new configuration of an ISP block has to be applied userspace shall
  * fully populate the ISP block configuration and omit setting the
  * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
- * in the @flags field.
+ * in the flags field.
  *
  * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
- * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
+ * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed
  * and not accepted by the driver.
  *
  * Userspace is responsible for correctly populating the parameters block header
- * fields (@type, @flags and @size) and the block-specific parameters.
+ * fields (type, flags and size) and the block-specific parameters.
  *
  * For example:
  *
@@ -1220,17 +1220,8 @@ enum rkisp1_ext_params_block_type {
  *		bls->config.fixed_val.gb = blackLevelGreenB_;
  *		bls->config.fixed_val.b = blackLevelBlue_;
  *	}
- *
- * @type: The parameters block type, see
- *	  :c:type:`rkisp1_ext_params_block_type`
- * @flags: A bitmask of block flags
- * @size: Size (in bytes) of the parameters block, including this header
  */
-struct rkisp1_ext_params_block_header {
-	__u16 type;
-	__u16 flags;
-	__u32 size;
-};
+#define rkisp1_ext_params_block_header v4l2_params_block_header
 
 /**
  * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
@@ -1594,21 +1585,7 @@ enum rksip1_ext_param_buffer_version {
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
+ * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
  *
  * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
  * When a new format version will be added, a mechanism for userspace to query
@@ -1624,11 +1601,6 @@ enum rksip1_ext_param_buffer_version {
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
@@ -1678,4 +1650,11 @@ struct rkisp1_ext_params_cfg {
 	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
 };
 
+#ifdef __KERNEL__
+/* Make sure the header is type-convertible to the generic v4l2 params one */
+static_assert((sizeof(struct rkisp1_ext_params_cfg) -
+	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
+	      sizeof(struct v4l2_params_buffer));
+#endif /* __KERNEL__ */
+
 #endif /* _UAPI_RKISP1_CONFIG_H */

-- 
2.49.0


