Return-Path: <linux-media+bounces-60440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IYfGxn7+WkYFwMAu9opvQ
	(envelope-from <linux-media+bounces-60440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8A4CF2DA
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E09303021F5E
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99B448094B;
	Tue,  5 May 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hdH9ZZXK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD523E51D7;
	Tue,  5 May 2026 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990381; cv=none; b=dBjvRicM4jZDswknxH9KeMVletYkHa2wWFpCKHCeLoceMKlmrAhz8nvweI510lT4Ai8wHfothx45Bv1Cm4F8glmppWJqZdAg44jp9vkgM3IWcsJzCaBxr6gAGrvzIKjd/YadwToOkMtEH3oSkoxODFSC30DlYJq5eNbtA8q/FeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990381; c=relaxed/simple;
	bh=sdg+In5npj58wlKZzHtgpFYt9UT5solngSihfomc5jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za8l8MIEKiFkM694EsSZ/py8l/KLvt3ovv8kCuTZL7MzaGNsZQjVtAxPFkWHf0Fo62ifCxClBH4X4GIMSExABm/mjZiLiQQOXoPzWdssN9eqCIiKAiFZiyJn2u1SI178xu86zvxpbVtn2jWNC6vVkJgkEj3HSpc8YE/Fx2ATT58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hdH9ZZXK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90A5125BF;
	Tue,  5 May 2026 16:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990360;
	bh=sdg+In5npj58wlKZzHtgpFYt9UT5solngSihfomc5jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hdH9ZZXK1AIqKK5NHZmFsCb5gC3KYOW8ZPV5wHZdzNl6Jkat6ToJ1m2fQC1fqW8B1
	 VYyJLvnqZKIhSYJ5SNYVQfUMfr+0h6xHfwA+z0JURSHCld77yJZR6fe15VRp4zwTfD
	 /9lVquU/erDwqmlLmQJ9ezjPOCNzYkSq9WBvCko4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 May 2026 16:12:17 +0200
Subject: [PATCH 6/6] media: v4l2-isp: Add helpers for stats buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6244;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=sdg+In5npj58wlKZzHtgpFYt9UT5solngSihfomc5jk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frUrkDEtpN+ZvdNQrCSRcAuqoSUqYJgqoP1L
 tsxDLhAmHuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn61AAKCRByNAaPFqFW
 POlzD/4hKIvLmuY3xF9HZu3dCAy/7Kov3tsZnAVtxcGP7t1cl6IqWSfMpwbePgn0kCb/XDm54kh
 OX9JKk+00jHYn0lrbYpjyQ2IdJ0I9qc9P8YKnRX4uWQZdwZljoKmbZfwRHn7FD0BrbbpRtd6hM2
 40NSW22m3As5ZydVXGP/smjG+aj48GFjZIpiN2yph736ckXL1qrT5Uto4Gr81ki4EYIR0n33bpu
 dQ8p+JyC3n2pfTSrIRMFwD+Erey3w0a5a5MXS79UDYgDPC8iu3+DRMLhxS571ABgGj8jOU1Q7UL
 pQBCTbz+iYQufHp1/cLgTNrag6d74/B0bBJfNJrvKsX2a7VpYw5644sKTN3enBZnOOLRmcurnrU
 De9qQErh44iuDSZJWknPJUuJPcF7FiUxBP495IL47zgyTAF8AMgJwIwww2bZwOo2aPUG9Yk+9SI
 fUcB20sQUwfqGWg8Vm+xvTJI7BWKdAHN+M4pvJhwi9J3fyVjvN5xEdplf8+Vtft2c7NT5CudhqH
 57K4Hk0kjTJkajvGbh5Wr5Ia3VIOJXnKcq2OQlZFERHGAI6cDg0F4mXmctVfUPM0k04mN9xy7Dc
 Zx+RCf0qehVvtEIeCVbJ8CdAMFzyfSSBkzi8R71wTMYbREeWHJeEgS6FzpF9P22H4nFLSfgJUcJ
 6fpyShkywuBnmlQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: 4DB8A4CF2DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60440-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add two helper functions to v4l2-isp to handle statistics:

- v4l2_isp_stats_init_buffer() to initialize a statistics buffer
- v4l2_isp_stats_init_block() to initialize a statistics block in the
  next available memory location of a buffer

The v4l2_isp_stats_init_buffer() resets the data size counter of the
buffer and initializes its 'version' field.

The v4l2_isp_stats_init_block() helper accepts the type of the stats
block about to be populated, an array of per-block-type information and
the maximum size of the v4l2-isp buffer. If enough space for the new
block is available, the function increments the
v4l2_isp_buffer.data_size counter, initializes the new stats block
header and returns a pointer to the block for the driver to populate it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 52 +++++++++++++++++++++++++++++++++
 include/media/v4l2-isp.h           | 59 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 10760659f8a3..8482010776d4 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -131,6 +131,58 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 }
 EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
 
+void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
+				enum v4l2_isp_version version)
+{
+	if (WARN_ON(!buf))
+		return;
+
+	if (WARN_ON(version > V4L2_ISP_VERSION_V1))
+		return;
+
+	buf->version = version;
+	buf->data_size = 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_buffer);
+
+struct v4l2_isp_block_header *
+v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
+			  const struct v4l2_isp_stats_block_type_info *type_info,
+			  size_t num_block_types, unsigned int block_type,
+			  size_t max_size)
+{
+	const struct v4l2_isp_stats_block_type_info *block_info;
+	struct v4l2_isp_block_header *header;
+	size_t used;
+
+	if (WARN_ON(!dev || !buf || !type_info))
+		return ERR_PTR(-EINVAL);
+
+	if (block_type >= num_block_types) {
+		dev_err(dev, "Invalid block type %u\n", block_type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	block_info = &type_info[block_type];
+	used = buf->data_size;
+
+	if (used + block_info->size > max_size) {
+		dev_err(dev, "No space for stats block type %u of size %zu\n",
+			block_type, block_info->size);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	buf->data_size += block_info->size;
+
+	header = (struct v4l2_isp_block_header *)&buf->data[used];
+	header->type = block_type;
+	header->size = block_info->size;
+	header->flags = 0;
+
+	return header;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_block);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com");
 MODULE_DESCRIPTION("V4L2 generic ISP parameters and statistics helpers");
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index 1f35a52f978a..7a54cf98c79a 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -53,7 +53,7 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
 					 size_t max_size);
 
 /**
- * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
+ * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info
  * @size: the block type expected size
  * @block_validate: driver's callback to implement per-block validation
  *
@@ -97,4 +97,61 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 				    const struct v4l2_isp_params_block_type_info *type_info,
 				    size_t num_block_types);
 
+/**
+ * struct v4l2_isp_stats_block_type_info - V4L2 ISP stats per-block-type info
+ * @size: the block type expected size
+ *
+ * The v4l2_isp_stats_block_type_info collects information of the ISP
+ * statistics block types for validation purposes. It currently only contains
+ * the expected block size.
+ *
+ * Drivers shall prepare a list of statistics block type info, indexed by block
+ * type, one for each supported ISP statistics block type and correctly populate
+ * them with the expected block size.
+ */
+struct v4l2_isp_stats_block_type_info {
+	size_t size;
+};
+
+/**
+ * v4l2_isp_stats_init_buffer - Initialize a statistics buffer
+ *
+ * Initialize a buffer of statistics. Only set the 'version' field and reset
+ * 'data_size' to 0.
+ *
+ * @buf: the v4l2_isp_buffer to initialize
+ * @version: the v4l2-isp serialization format version used by the driver
+ */
+void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
+				enum v4l2_isp_version version);
+
+/**
+ * v4l2_isp_stats_init_block - Create and initialize a new block in a statistics
+ *			       buffer
+ * @dev: the driver's device pointer
+ * @buf: the v4l2_isp_buffer where statistics are serialized
+ * @type_info: the array of per-block-type validation info
+ * @num_block_types: the number of block types in the type_info array
+ * @block_type: the type of the statistics block to initialize
+ * @max_size: the maximum size of the data[] member of @buf
+ *
+ * This function locates and initialize a new statistics block in @buf for the
+ * driver to populate its content. The function checks that enough space for the
+ * requested @block_type is available in @buf and increments the 'data_size'
+ * member of @buf. The newly created statistics block's header is initialized
+ * with the size and type information provided by the caller in @type_info.
+ *
+ * Drivers should call this function before populating a new statistics block
+ * content.
+ *
+ * Returns a pointer to the next available location in @buf, or an error pointer
+ * if the requested @block_size is not available in @buf or @block_type is not
+ * valid.
+ */
+struct v4l2_isp_block_header *
+v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
+			  const struct v4l2_isp_stats_block_type_info *type_info,
+			  size_t num_block_types, unsigned int block_type,
+			  size_t max_size);
+
 #endif /* _V4L2_ISP_H_ */

-- 
2.53.0


