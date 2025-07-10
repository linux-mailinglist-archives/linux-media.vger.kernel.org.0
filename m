Return-Path: <linux-media+bounces-37310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567DB0046A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32EB5C542E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBFD273D8D;
	Thu, 10 Jul 2025 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UhciDtS+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106232737F6;
	Thu, 10 Jul 2025 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155573; cv=none; b=IeWU8mU62dqrmlCE6q0B+vBnsEfqImTCST1L3t5rBLRckRLG6bOKq7ijMToBnXvt7Wh38r7zYPpCa5myJ1+iz6MNbo5umquXb+cG9vPX009RX1+bpUhhD7bTo7QrzfaEIpIRthX5zuyKR2bD+RwG/Rr6cuV594f7IrogtliPXII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155573; c=relaxed/simple;
	bh=ocDfHmwhFkBEj++dyd8u+aPRUHOxpBG9wQGQR9RmuDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ1VSNDk6Bn3lQMeqqpXf+2iXFtBt1TCgcchCcIYaK66icv4UIfTRvlYxZNIYvv8ZcOtxEllvrSZlnjRNWmrW9BZ3ELIYn0WN+M6gNyursLGuZvuCz/DZ3NeDDp7QYc19g+1M0V9JHm3uJxdz18/JO02gTArbm3gA5M7+VuuJn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UhciDtS+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B365E111D;
	Thu, 10 Jul 2025 15:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752155539;
	bh=ocDfHmwhFkBEj++dyd8u+aPRUHOxpBG9wQGQR9RmuDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UhciDtS+kjwJ/ov+tdkJ6AKRPqPNGZTS84L6iDXIr65oPzJyjT6VJhpgAL8HS4pe+
	 8fhVEdxs3uykC9BUP3yGSHu8Nvh2l8EZMX9Z/x/NOGCP3n5iatsyWHUH0L7PtNH6LE
	 sp9/CqJsuOz+WZSObxh7aKGiQ8creKleWvOZG3mM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:52:12 +0200
Subject: [PATCH v2 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-extensible-parameters-validation-v2-3-7ec8918ec443@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4576;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ocDfHmwhFkBEj++dyd8u+aPRUHOxpBG9wQGQR9RmuDc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBob8WqsCxcIv3CltSYirvfLaD6Ver6y9j6jhjT+
 rmU9kx4LoGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaG/FqgAKCRByNAaPFqFW
 PAgyD/9cp+kfbyqwNXXtWpRZdhKI3OVUbbhLXAl+udHK1pgaq5kFfqdmJ6uYFH1kgBJUwKWIybd
 YkZ+2RQKTHiaA/7xZLPhmUzvzDe+da2avK+3GiUcXnNudvpMySHHmeUw0XsWR69YZ69gqLLbnaq
 GsvH5apS4O6YnjOw2dIIuKX4XOxyYIj1oJjzo8hkT++OoixoeF5+ejZJIaQBoxYsiMFKUcgw3sn
 cy6vb9pJ/dQO1UsMH+FDZAWRBA645cgz6TVtkqtL3qjqEajApS8AGOgESUFiJ9CObLuvwH1nrlC
 3XUI7c0HNmhIJJtCGSrWecNuH1fGFXhFUC1OpFiSvxJkrvhxCfuqau2Re9AjLBxVP3/w8uatmmb
 zD1BgLoYeCSJfQI08e8PtnNnB7hYPQsyvweUV+K2xXGc/Lgo8UkdSg39/VRs/ks5aZkZs/N8LZY
 Ws2dtKadr1ltIQXByavgL+n/zds3Mxi7CKwer1uLDkVOuafOf6s7zDaykibJeRgtAAeehU3K4ab
 D0MFrsslYrsJHVl637N6pxs5VwnmvB3U4Lu7ZEajmM3aOAijESu7G58vGChq+HVrqwJIAl8JYjc
 79RahXilwyL0yS4Z9S+Wgyzs5/LbyzvV9jMjXJ23a51aCysBLfXgOolfW+wP1XNGTYg4+rQ4cPe
 t0fAw6cxaicX3AA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the introduction of common types for extensible parameters
format, convert the c3-isp-config.h header to use the new types.

Factor-out the documentation that is now part of the common header
and only keep the driver-specific on in place.

The conversion to use common types doesn't impact userspace as the
new types are either identical to the ones already existing in the
C3 ISP uAPI or are 1-to-1 type convertible.

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
2.49.0


