Return-Path: <linux-media+bounces-65805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QfU1FC3UP2q5YgkAu9opvQ
	(envelope-from <linux-media+bounces-65805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:46:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3216D208F
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:46:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="Qe4twh//";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65805-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65805-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C2CE30785BA
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B536A3B19B4;
	Sat, 27 Jun 2026 13:42:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE393B19A0;
	Sat, 27 Jun 2026 13:42:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782567764; cv=none; b=Z3vsxOwLzWQs/dbkzvHJkN3bYwr3rQV84/YiIOegGLIJ5HpWbasWweb41cLedN21zK5J8A0UEYS21TRRfqEu/82cSP1z1KQ0Oh691S1TVSjtGnecbp0ZaDTQQfl6GZ+RNyos3f8Xl/YoQfIaVONHcn5Fk+g5Qb1TByMhx7SjOvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782567764; c=relaxed/simple;
	bh=UgCI9QzKomCSQB71bDGfA/GyYABeT2+PqbhgX2xT+U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNqRJNIP6GXxV/L/DF9qcDCI+iu1WFRtDGSZtuYpltSUkai5Er7tGRu/5Y9hR+k+buVuWjlI5CHO/B5huk++oFooXMUmV4eX6BUtwOwHW9wHm24KKKDUWUTBhCVliZBWwhqcM4PAWoepO9mKP2ppUEqn08u52tjFgxGgy87cYlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qe4twh//; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 478A81D15;
	Sat, 27 Jun 2026 15:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782567710;
	bh=UgCI9QzKomCSQB71bDGfA/GyYABeT2+PqbhgX2xT+U4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qe4twh///82PGrJXQFgpVBk+6PDMwhRvT+nhjHoAdPUiTpV3EW7sHOE695Nip4yYk
	 TjM4rw8WBk8rhrjWRRWwK3yhKgsZbuPXK4SGCBLqLvlzZolDFaPCTJcdb/wo6uC+hP
	 V4UM1yQg5zM2+vA7i0FdTGygBO7wTGKP3eRzdX1U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 15:42:03 +0200
Subject: [PATCH v3 6/6] media: v4l2-isp: Add helpers for stats buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-extensible-stats-v3-6-3b600bb2db8b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6316;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=UgCI9QzKomCSQB71bDGfA/GyYABeT2+PqbhgX2xT+U4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP9M61qXYNd/sJpAndrXqLDaG1oQ2p1V9yX3t9
 2Ih5LuT/D2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/TOgAKCRByNAaPFqFW
 PPLwEACZF9LVuMXjZjl3VB5di642u8YCZzuNsoP4t1VZo2WT/FRx4qSTkIaXhuJa66FyqDXfcLB
 15Dh5cS5/GDjlrajS9GJxRRUvSvdUME8wnIzx15lPYNf47moPZCRy60JTvOFqmFfonLoFDgO4Hw
 AeV4iqvb2oAIh8GvzKWzbwVy3rPO3i4fyyp8CwE6aqoE0DzxKPRuIkzZ6CLO2zsXmDwOD7W+VVe
 k3Y1ndk6eN9+iajfd5ydXZXcKb+jy0ABzmFAhlqnSb9gR4m+ZAri5iMxHC0cEcbOGT/nqbik0zx
 1lR38O4LQjteAohlIeEhkS1EgiOj3xnGPmxqHWTDWWFVig8g+8GeXkG6SBDR59nstwfTOQRPjm+
 I+I3IXOoQlSQ1HwwMdLH+mwJuYImUKjFtAUTPU+oKDOLfuGh/5xZAjBSKbWkkTWV20YCcbq/ikJ
 MLJDyy2mt53DKHhfihbk4xFRt0vx1+sjnpki1giOpo6QxoCuGMD/zd4NTsIEVM73WMnXwGZeCzU
 Ooi7Yh9KqwiNYPvK6ip9t2uO0h1udU1GI/j+tF72O5FJj7uo7BztgKs8wRZNaRiPrPlMkHTMAjN
 vg3etVVtJOviBb1qUapHoE9WHfVzD/c+vjQXLWn2KE5L4MIrgEpk9qZyR7AekHu4EbwsFsUQglJ
 dPiZfnzfFaegu9Q==
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
	TAGGED_FROM(0.00)[bounces-65805-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:keke.li@amlogic.com,m:antoine.bouyer@nxp.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,ragnatech.se:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C3216D208F

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

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 52 +++++++++++++++++++++++++++++++++
 include/media/v4l2-isp.h           | 59 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index f497471e9f18..1eb46e080afa 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -130,6 +130,58 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
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
2.54.0


