Return-Path: <linux-media+bounces-60435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHJ5JP77+WkqFwMAu9opvQ
	(envelope-from <linux-media+bounces-60435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:17:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1644CF3D2
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEA9430CD3D2
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0836447F2E9;
	Tue,  5 May 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D23akZBN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34A47886A;
	Tue,  5 May 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990364; cv=none; b=U1tfcbiEdj4LE2tlE1m6bqBdsbP2pNrvVlNPXD0YdgfhLmlTU53pCKlI0iH4+C5dAsXCBtf+0jBqNHCcaXU1ERe7JTa+BkHpQMOGPcNV8VCMU+SMATY6HJvCnzr7QiqUpkjPX/MHAwBaB/00YGWut57HPnpVVY4LzhBN22AppRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990364; c=relaxed/simple;
	bh=LRf2P2Yp3G9LI6eOo1E5UnmDigQDKrKdASOmK21O+k8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMoOoshXYte/N6QfXADmDyBZ5tn46RyBIa178E7PzVGDau1WtRIs5lk9g4ys44H88v4zFMbDobQAL6kDHZruD6MoSn2sHLs04xHP1B0p5b7a+NynHQkvb9jUX5kNoMyM566198LX4Ro11TFPQBAJWYcCOZhExNtJkrr23EgqGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D23akZBN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE5C9CF5;
	Tue,  5 May 2026 16:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990355;
	bh=LRf2P2Yp3G9LI6eOo1E5UnmDigQDKrKdASOmK21O+k8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D23akZBNXy2MvR0xPhoM3HznyDzxo6inX3Rn5aVMBjz+UYXjpHFzfpWBtBplex40Q
	 +din/BjU+plUWak05QThlzjNBPyMQ/qYR05kkySWzTIv3JUaGfTm+QT9o0nQz1fCYH
	 0DmV8PcSSsXXdqfeHkEjCCFK3Kb4Vpgb2Nr7HzBU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 May 2026 16:12:12 +0200
Subject: [PATCH 1/6] media: uapi: v4l2-isp: Add extensible statistics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-extensible-stats-v1-1-e16f326b8dad@ideasonboard.com>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
In-Reply-To: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9161;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=55DjFZFYN639/R9D++B4U/hE0NeYkRpq4Y9eKFWsgd4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frT4HJrAZukmCANA4Lo3RU5EhQSkHAU51Bto
 e0nLLOAwNqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn60wAKCRByNAaPFqFW
 PCRvD/44vA95refpOUJWSTKyKHhxo3OOSg2AS4t8MwGnQvAdTgKPgeLuMGMtv5sd3lEyu08Dn74
 9cyxoO/iY4M4IfIz++En5368Jq+Yn5GYsyYstRysb1ZkbcMjnemRqbxoHk7qlgnxGKSCygOJ88/
 E47oEjnhhPkXQtBdzJkhODiaGS4wgwojHDZSCfkZa3+8Roywzz7H8ZrCLert+XFcqc5Bd8zUjgT
 VvUeKYPPGtdC7SvVfXNj1+GlBwH0rgz1dcv1KY0ozRHHq9FB4pAa4xn3orkD0E4L1URLweSp9AK
 TqdH88u7PQQ5HotEPZ/PvdYoeHWdyc6COqM4LXHRyErP7zCSQ6bdGmYYeV+cp9GdEPfyM7Zg9cv
 jJNzdEyVTveCrM2d3iqq7zRznVSTFG8/qU+iM7ueTMN63p/0YhicSGbQ2MVBCrYLCABzeIyLhqq
 da3aRySZtmusRuE+VlrjOeFhoxQB1DjPPup43noidxTHjCeCtCA2G3XLYFKqWqUdZAtleWAP6Qw
 eGP5OH3ZRB68C4BxRu3K84vuAT84wm6KaW/7t3t8pF9gFmgkK4UV9ItMA9AK9+O8LYG8u0gV7aO
 fMEojN1X8X4F3bNlwtoKfrPvEyVMdaPHM+kzrl2IQzMkmD0xP4s2VzM0THTfHjas/PtmJylQWbS
 rpmpIuQ+XDyzYWg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: 3B1644CF3D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60435-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]

From: Antoine Bouyer <antoine.bouyer@nxp.com>

Extend the v4l2-isp extensible format introduced for isp parameters buffers
to the support buffers of ISP statistic.

Like for ISP configuration purpose, that will help supporting various ISP
hardware versions reporting different statistics data with less impact on
userspace.

Rename all 'v4l2_isp_params' types to generic 'v4l2_isp' types to
prepare to use them for statistics as well and maintain the existing
types for compatibility with existing userspace only.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
[Rework to remove 'v4l2_isp_stats' and unify types]
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/media/v4l2-isp.h | 125 +++++++++++++++++++++++-------------
 1 file changed, 79 insertions(+), 46 deletions(-)

diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
index 779168f9058e..e4607e1217e1 100644
--- a/include/uapi/linux/media/v4l2-isp.h
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -13,25 +13,33 @@
 #include <linux/types.h>
 
 /**
- * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
+ * enum v4l2_isp_version - V4L2 ISP serialization format versioning
  *
- * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
- *				(for compatibility)
- * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
+ * @V4L2_ISP_VERSION_V0: First version of the V4L2 ISP serialization format
+ *                       (for compatibility)
+ * @V4L2_ISP_VERSION_V1: First version of the V4L2 ISP serialization format
  *
  * V0 and V1 are identical in order to support drivers compatible with the V4L2
- * ISP parameters format already upstreamed which use either 0 or 1 as their
- * versioning identifier. Both V0 and V1 refers to the first version of the
- * V4L2 ISP parameters format.
+ * ISP format already upstreamed which use either 0 or 1 as their versioning
+ * identifier. Both V0 and V1 refers to the first version of the V4L2 ISP
+ * serialization format.
  *
- * Future revisions of the V4L2 ISP parameters format should start from the
+ * Future revisions of the V4L2 ISP serialization format should start from the
  * value of 2.
  */
-enum v4l2_isp_params_version {
-	V4L2_ISP_PARAMS_VERSION_V0 = 0,
-	V4L2_ISP_PARAMS_VERSION_V1
+enum v4l2_isp_version {
+	V4L2_ISP_VERSION_V0 = 0,
+	V4L2_ISP_VERSION_V1
 };
 
+/*
+ * Compatibility with existing users of v4l2_isp_params which pre-date the
+ * introduction of v4l2_isp_stats.
+ */
+#define v4l2_isp_params_version			v4l2_isp_version
+#define V4L2_ISP_PARAMS_VERSION_V0		V4L2_ISP_VERSION_V0
+#define V4L2_ISP_PARAMS_VERSION_V1		V4L2_ISP_VERSION_V1
+
 #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
 #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
 
@@ -39,64 +47,89 @@ enum v4l2_isp_params_version {
  * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
  *
  * Driver-specific flags should be defined as:
- * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
- * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
+ * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(0))
+ * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(1))
  */
-#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+#define V4L2_ISP_FL_DRIVER_FLAGS(n)		((n) + 8)
 
 /**
- * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
- * @type: The parameters block type (driver-specific)
+ * struct v4l2_isp_block_header - V4L2 extensible block header
+ * @type: The parameters or statistics block type (driver-specific)
  * @flags: A bitmask of block flags (driver-specific)
- * @size: Size (in bytes) of the parameters block, including this header
+ * @size: Size (in bytes) of the block, including this header
  *
- * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data.
+ * This structure represents the common part of all the ISP configuration or
+ * statistic blocks. Each block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration or
+ * statistic data.
  *
  * The @type field is an ISP driver-specific value that identifies the block
- * type. The @size field specifies the size of the parameters block.
+ * type. The @size field specifies the size of the block, including this
+ * header.
  *
- * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
- * driver-specific flags specified by the driver header.
+ * The @flags field is a bitmask of per-block flags. If a block is used for
+ * configuration parameters this field can be a combination of
+ * V4L2_ISP_PARAMS_FL_* and driver-specific flags. If a block is used
+ * for statistics this fields is used to report optional
+ * driver-specific flags, if any.
  */
-struct v4l2_isp_params_block_header {
+struct v4l2_isp_block_header {
 	__u16 type;
 	__u16 flags;
 	__u32 size;
 } __attribute__((aligned(8)));
 
 /**
- * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
- * @version: The parameters buffer version (driver-specific)
- * @data_size: The configuration data effective size, excluding this header
- * @data: The configuration data
+ * v4l2_isp_params_block_header - V4L2 extensible parameters block header
+ *
+ * Compatibility with existing users of v4l2_isp_params_block_header
+ * which pre-date the introduction of v4l2_isp_block_header.
+ */
+#define v4l2_isp_params_block_header v4l2_isp_block_header
+
+/**
+ * struct v4l2_isp_buffer - V4L2 extensible buffer
+ * @version: The extensible buffer version (driver-specific)
+ * @data_size: The data effective size, excluding this header
+ * @data: The configuration or statistics data
  *
- * This structure contains the configuration parameters of the ISP algorithms,
- * serialized by userspace into a data buffer. Each configuration parameter
- * block is represented by a block-specific structure which contains a
- * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
- * populates the @data buffer with configuration parameters for the blocks that
- * it intends to configure. As a consequence, the data buffer effective size
- * changes according to the number of ISP blocks that userspace intends to
- * configure and is set by userspace in the @data_size field.
+ * This structure contains ISP configuration parameters or ISP hardware
+ * statistics serialized into a data buffer. Each block is represented by a
+ * block-specific structure which contains a :c:type:`v4l2_isp_block_header`
+ * entry as first member.
  *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace shall populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated version and return an error if the desired version is not
+ * When used for ISP parameters, userspace populates the @data buffer with
+ * configuration parameters for the blocks that it intends to configure. As a
+ * consequence, the data buffer effective size changes according to the number
+ * of ISP blocks that userspace intends to configure.
+ *
+ * When used to report ISP statistics, the driver populates the @data buffer
+ * with statistics for each supported measurement block.
+ *
+ * The buffer is versioned by the @version field to allow modifying
+ * and extending its definition. The writer shall populate the @version field
+ * to inform the reader about the version it intends to use. The reader will
+ * parse and handle the @data buffer according to the data layout specific to
+ * the indicated version and return an error if the desired version is not
  * supported.
  *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between. Userspace shall populate the @data_size field with the effective
- * size, in bytes, of the @data buffer.
+ * For each ISP block, a block-specific structure is appended to the @data
+ * buffer, one after the other without gaps in between. The writer shall
+ * populate the @data_size field with the effective size, in bytes, of the
+ * @data buffer.
  */
-struct v4l2_isp_params_buffer {
+struct v4l2_isp_buffer {
 	__u32 version;
 	__u32 data_size;
 	__u8 data[] __counted_by(data_size);
 };
 
+/**
+ * v4l2_isp_params_buffer - V4L2 extensible parameters compatibility
+ *
+ * Compatibility with existing users of v4l2_isp_params_buffer which
+ * pre-date the introduction of v4l2_isp_buffer.
+ */
+#define v4l2_isp_params_buffer v4l2_isp_buffer
+
 #endif /* _UAPI_V4L2_ISP_H_ */

-- 
2.53.0


