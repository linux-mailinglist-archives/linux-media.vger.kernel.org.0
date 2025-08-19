Return-Path: <linux-media+bounces-40293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F54B2C7BD
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB595189946D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6FF28313A;
	Tue, 19 Aug 2025 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QKtx37C0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D9280033;
	Tue, 19 Aug 2025 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615302; cv=none; b=auvJ0w0jw6r8UKRSG+xgN1Qh2EiG50bSqla/cV9B7gCZBA5htUtgswpSvh4nZlj8s+xiRzxVMM3RpKxyiy4vDRZ55L8iX870dHUdM8+4dbXe5car1ljMIDl1HlyZLCI/CczyhAJabJ8fjIANlMLZ8q6zxFRy6kjvQ6bbppDKcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615302; c=relaxed/simple;
	bh=U7TtISZ9KEkfggbxSuQktBM+tgxpd90TPfrry/poVGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4krlVkre4Gxar5CBNk7+gbAvGdx6IKxkaptt16mvm3Udynd/3yCuu4XTDhUA80IMTifavqFgnBDQRFNtSZLIGIHTqv9eHm8MRpDXanI9MSSXjrpbPvSTlAmshmKs06MJka5uhbuOcLfy3dLdMGgAnSi9Jne7e7mll+v6HW2Gdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QKtx37C0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FEE72FDE;
	Tue, 19 Aug 2025 16:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755615240;
	bh=U7TtISZ9KEkfggbxSuQktBM+tgxpd90TPfrry/poVGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QKtx37C0lvvGAqnffcC4jbkaeANPDWbb24G+TlW1w14HvDhv2CIfU6FjusOI8NI76
	 msZc0X9zB1HuqmctfGbIhX5OEkaeUSELMSJiZrAHeNNExkky8ovbFhTVmQHytaB2tW
	 KPFTNAiFB+S7wUNcMSvJboloB3TiPS2HFSBOLKxo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 19 Aug 2025 16:54:44 +0200
Subject: [PATCH v3 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-extensible-parameters-validation-v3-3-9dc008348b30@ideasonboard.com>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
In-Reply-To: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=U7TtISZ9KEkfggbxSuQktBM+tgxpd90TPfrry/poVGI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopJA7jCfsrlftMN5+YIhnI1+J5urI3m3/9UACi
 80g0qiw0XmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKSQOwAKCRByNAaPFqFW
 PHNiEACoyF+vmfoOK82DWVMArayyOQKpTiJbSU8ubhtsWTZWtpugq2QRVNeuCDnpOzhZWOOCUqZ
 k4+xenxJ0/Kvtu9c+MXBN4Ho4HzPzQVyYGnmL8bFvmi+cg3zuhucIf4f5B1YV+8X8NdFryaE+pe
 L2xUCQMyb3WQT4D0Jy/QWkmwybBFq4xT5tuGRiWC2y7OY6mObqeAbOC8V/nn4zh5P7IOnmcNam1
 /JrRHyDTHaoi95oubqlNX/LmAooFMhcYNIIMVWome6BOWzZRPJMFSP5Tj2OlnfsCdlUTbziTsj5
 Yf8sEgeKnxTlqaBsIlVJKeUcQe5/ftNlTH/sKnKsD7EXctqwSQuH2T4jpT38471uXAKqlGo2czH
 aZwnwaqc1i6wLraQGTKRVT2ksewufCD9D/uSMQ/TWz8I46IsIQhq/l4t507vueLhK7sTIVehOpM
 CiUXNKaEWByzeZ0brD7MZ++xIoMu/mRadUlBuhN5ndxtf+Sxt0YlnogiWPV57Z/CQZohKJX1A0c
 O+mgEKXCbyhluuLTST4bR2hj5/mrvxFPpum/Jjaobml+ZbfgxW1QFDs2baK22CjP11ehXn6MW+h
 rzW8TyvL3hq30uakiRvdNOl061g9CNmoTxMtrULbBJe5RgwpDNgcKGE0NY0BZS1mdb+ScqHog5n
 vSUzwbW/eepQ/+Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the introduction of common types for extensible parameters
format, convert the c3-isp-config.h header to use the new types.

Factor-out the documentation that is now part of the common header
and only keep the driver-specific on in place.

The conversion to use common types doesn't impact userspace as the
new types are either identical to the ones already existing in the
C3 ISP uAPI or are 1-to-1 type convertible.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Keke Li <keke.li@amlogic.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 48 ++++++++----------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..15d3ac289ece610132e1d4b43ecd56b7ef527ef6 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -6,8 +6,13 @@
 #ifndef _UAPI_C3_ISP_CONFIG_H_
 #define _UAPI_C3_ISP_CONFIG_H_
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
 #include <linux/types.h>
 
+#include <linux/media/v4l2-extensible-params.h>
+
 /*
  * Frames are split into zones of almost equal width and height - a zone is a
  * rectangular tile of a frame. The metering blocks within the ISP collect
@@ -183,11 +188,6 @@ enum c3_isp_params_block_type {
  * struct c3_isp_params_block_header - C3 ISP parameter block header
  *
  * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data. The
- * driver inspects this common header to discern the block type and its size and
- * properly handle the block content by casting it to the correct block-specific
- * type.
  *
  * The @type field is one of the values enumerated by
  * :c:type:`c3_isp_params_block_type` and specifies how the data should be
@@ -223,15 +223,8 @@ enum c3_isp_params_block_type {
  *			gamma->pst_gamma_lut[i] = i;
  *	}
  *
- * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
- * @flags: A bitmask of block flags
- * @size: Size (in bytes) of the parameters block, including this header
  */
-struct c3_isp_params_block_header {
-	__u16 type;
-	__u16 flags;
-	__u32 size;
-};
+#define c3_isp_params_block_header v4l2_params_block_header
 
 /**
  * struct c3_isp_params_awb_gains - Gains for auto-white balance
@@ -498,26 +491,9 @@ struct c3_isp_params_blc {
 /**
  * struct c3_isp_params_cfg - C3 ISP configuration parameters
  *
- * This struct contains the configuration parameters of the C3 ISP
- * algorithms, serialized by userspace into an opaque data buffer. Each
- * configuration parameter block is represented by a block-specific structure
- * which contains a :c:type:`c3_isp_param_block_header` entry as first
- * member. Userspace populates the @data buffer with configuration parameters
- * for the blocks that it intends to configure. As a consequence, the data
- * buffer effective size changes according to the number of ISP blocks that
- * userspace intends to configure.
- *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace should populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated revision and return an error if the desired revision is not
- * supported.
- *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between nor overlaps. Userspace shall populate the @total_size field with
- * the effective size, in bytes, of the @data buffer.
+ * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
+ *
+ * Currently only C3_ISP_PARAM_BUFFER_V0 is supported.
  *
  * The expected memory layout of the parameters buffer is::
  *
@@ -561,4 +537,10 @@ struct c3_isp_params_cfg {
 	__u8 data[C3_ISP_PARAMS_MAX_SIZE];
 };
 
+#ifdef __KERNEL__
+/* Make sure the header is type-convertible to the generic v4l2 params one */
+static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
+	      sizeof(struct v4l2_params_buffer));
+#endif /* __KERNEL__ */
+
 #endif

-- 
2.50.1


