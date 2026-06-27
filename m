Return-Path: <linux-media+bounces-65800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TahvGW/TP2qZYgkAu9opvQ
	(envelope-from <linux-media+bounces-65800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:43:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB476D2066
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:43:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Vi+VPc3+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65800-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65800-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A42D3034DF9
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1B53B19DB;
	Sat, 27 Jun 2026 13:42:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DC5373BF3;
	Sat, 27 Jun 2026 13:42:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782567748; cv=none; b=kMsuX7RLzNlkkX7EwVS3p/ATEbaT1uED1DhXJERzaIEvEOuOkny5kijCicxiZ9T/ggpo3GI7qXSXHwl267Wt8pBnaFALOGJi5SX4tt2KjPLSQmoKkm8f/fTkB2pPDwOLI2fnrjmG+OiWvl77npr2ho7f1lup1jprUYvUdywp5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782567748; c=relaxed/simple;
	bh=l5ExzzEzeiyo+lZdJhpKPLtdiDCIv2BQ/MgTfgCgLJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7TkeSbDV/47V/JN//aTn78nvOv6eqssAOtFhOgjAlXoZIK3Zvcjue47ohUBgToi2m+kot0Yxu2Km9aMSRAA4S90Uh+P9AF2ew7cz76/7v3OOjptG8JxlGML8PIh7NKD434YiNqTYKSZKibQyInbwm2v7lbysSVjylSiNq8z6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vi+VPc3+; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C094982A;
	Sat, 27 Jun 2026 15:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782567701;
	bh=l5ExzzEzeiyo+lZdJhpKPLtdiDCIv2BQ/MgTfgCgLJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vi+VPc3+FlnnRCJQSY1sgNFZXjtFYggGEC64awxbDBSKmyiEo95IVMUuO93ImM09n
	 IHdCvOeDUKzZiXKGHOkYhpNHxhOnKQSUEbcLOCAR1kqaNY0BOJO7T+ROPhm0JacLyL
	 QiBl1U+HW28SLOipN7PHeQbLf9yJLaqD7qjvvMPQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 15:41:58 +0200
Subject: [PATCH v3 1/6] media: uapi: v4l2-isp: Add extensible statistics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-extensible-stats-v3-1-3b600bb2db8b@ideasonboard.com>
References: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
In-Reply-To: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9233;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Up9T2NPpR+9MPW/wcg2CYHM6lSUlYZK3GreMYGUgA8E=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP9M61iGlOIEV+sByj3/TvG5iZ+Z+07wUGQKV2
 iRKZAI3Lj2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/TOgAKCRByNAaPFqFW
 PEh1D/9vIYa9Ht+/CzFMy3ZCOKKyfeJp0Gp6NT6xDNeOLMBGwa3xUdunbkeT5bfKZ0DLtgJqxHq
 5rR9PeNHsfq0GIiZkcUF718pHoC/GpgzosXfNz5bQM37tOCsT2qBJNiUkt6IJXwDxZI42GL/vm7
 UE8+DVDNRviWMyl5ZJowOl3za02q/P+uucbRmDE/KqA2Mi35X15BNRi2p9NQGhTcEsNoMnHZ2j4
 4r+gPR0rXPsAW4bGwK6ffRCNu3hujuwM4auUVBQEftEvqVcDvlxk0azJg3txOehXhfE4B/sxdpm
 mMlN3+mF+7IGOEU4ItoFuYMxlFOP6yLHx1LJfDDhNJcES+4Oe3jAdHyIROdtPxGbkFjqopAhiyT
 5aC8HXzd5141+CIjGYAbzFUxG8SjabOCHwNaL6WYzZQXchQq79lu4rAYUTWytaDHIHQH9ybkA27
 DTnwzjGvb/1rapeXAf61USt9uS7tPJTI4SXfAUyiI6DN7LglzbIM+/lm9oADeIcoUuCgiSj0C2Z
 BYWfOtW5S2k5cr3u5lARh2soEgRA38qs+hknrp31SbYjy1OF5EKgEqSdXkdbVVlxmgHL4sqX9Wu
 D5esLJthLKBll7RthVU7NrfKJcmrrmPxphU3silXvQceKl5grRSTvcOeNE/aL0aTZOgVjki9ERQ
 3P5h/LJYj0GfDJA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65800-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:keke.li@amlogic.com,m:antoine.bouyer@nxp.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ragnatech.se:email,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDB476D2066

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
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.54.0


