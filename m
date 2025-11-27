Return-Path: <linux-media+bounces-47795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D091C8D24D
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 08:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385D33AF88C
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 07:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660013203A1;
	Thu, 27 Nov 2025 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqpb5HsZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F98318120
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229276; cv=none; b=GUUgxN3DiJDUcFKbPHwPtwgI032BN7s7YXFhbnCAtvJMghXH7Qi2GaNP7cv8NH+JaX0hubgb8WkFwLtYCCArxxYyNosWOaF8NM+y9VF2p0pes2X6zzWXjgvKSeJ/NaUdU6kBDVYOd/qn2QN81kGZa1Pllhh3udv7GtddUSx1Ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229276; c=relaxed/simple;
	bh=mdIkYc2+6jX+i4VkKjflF+MhxT7eT8qnSHRa7YHnUlw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JLVXkMckPGYMs/oO4aoJ7vx7ASB94LU8QFqIwbLl9pZhn6x0bACSsPAdagZVo8ODmVBAQ+9MKZY5CE2gllr48/7KCoSRGO42AnA0RNYlbsjV3qYBz14ibxUfevFG8CGdy8SAUMliDvombsY2nyldAfMO3MUMuwCOejJ6l8ghvdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqpb5HsZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2957850c63bso4684985ad.0
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 23:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764229269; x=1764834069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TQCT7eTDg2XHHUkD6C/L3ICqZT3KdP+WG9DmEyMuo0=;
        b=uqpb5HsZ/nkECDsRxiLgUihLsFARTKJTnWWivMvpRrOpOLXz6REbeBRfz0UBJrdcaQ
         buiH5eKudfKTvFOIPyqJ6bSGlvIWpk6kkcWh0KWJj60R+V7QW2sh2iwbaTGwdrQahALg
         h7A7N5klv4fjdQi5jkZBUpLToueAJZeAPgL9MhIa0+RsVEeDDIdNN51G2vaYE2u+6c4s
         kaXG0X+TdqwW4eWsIhcVqd7Ll1y8LmYkUu9FMjZZ68j42OMPXr4EFDqbAbJgompUTz8i
         RtCKbHzImysXy9WB/jNyWtIf0Vc3Y2U9ADpmIyK9xKCpa2YPK8IxIExBKR49qyild2PQ
         aleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229269; x=1764834069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TQCT7eTDg2XHHUkD6C/L3ICqZT3KdP+WG9DmEyMuo0=;
        b=cXTTbxL8kJrNzvp4P0/gDWQeq0YAvSYXtvQxUwrMj0p9q1t25r3Q2V+b5B9kFVcpAr
         mcG6+gY4/3D9oTrCP8Dzq0PLow3iHBKaghtWcRhBWAw5Ar5b+3vyVVDarbo0oYkPTPHr
         qwajs8Ht4ZnkfL+yhj6Z3i76h+x6QoW/Xz8KI/1HQ07MMBiaY+rZRqqAFoUVy2vGyweu
         FLB7e+ImXYitH2UEBk70tChhhTtZjEZA9M+NiYuk85zM+Lha9JvdvsdPSgrwWuiw2Qh9
         3yi30MFJd3hiHB0+vHNyTVMyg/rD+tLnmZBE0D54svZS+SxfZJkP/UCUUfehoBE+zxT7
         Q1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXH8e+QwQ1/fW76p0IHkDzcyTbJdOXYE2g0SaV6stv0vPdNZjKuteUTBZCmi3ecZBVKsL2vnbofaKGwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQVHHGNIXZqP97wXVguqy22vDHryz9EZmqGnSHEVLaD2HqFsB
	2A4s93GkCKed+wpbDZ0wBy3SLyv1EWFFhiMOGL9n1nkH8Fc6gRbSm0Pg8du65qbDYF0=
X-Gm-Gg: ASbGncsSP9ND95hB5X+MZgRIU9HSKG1ai9OboTFVn/3piiNGBtryOSmYs7WKklJqzVs
	UG5r0Xw1hVbz3Zkk/8A8xwWlgeOI1ibzDtJpfgllUb3SQ8UXX4jNi7q2ZBHqAEXranY894dDVbH
	pXK8DkjyyNJzyFP/m0p0Imfn/ZSQSPhb+owvXo+iQZLNQ2QuWeSfyGwcjBvgao9lca8GnON232X
	7Lab7DHwh5atNAkt9XUPTzmkihB2XZfvWetL9dNgIAqhQ6Mt95VnsETF4JmIw7RG4g2L2QPDcdo
	oveI0eLiR0IiT1GiGO0zUtQkbkVQSF/PIYxEtaxKP1cQqJ4w1TmdoHEkWSJheVGf7v6ZxRyOxjM
	5Dr8ZD3QjNIttPwJbk7X+nrUvGyOwPR5stHhbu1ZIuE6ka8nkRoEOM2iwSZm8GZmc8ZtVtXLf1H
	lX5Gxya2o0u70=
X-Google-Smtp-Source: AGHT+IEBlmzvPfpPZSYziqgyCSQiiLlC/euU1UMGI4AMImrD/tBfX/XLDOjeV/TfCVGjyrfd8/xH/Q==
X-Received: by 2002:a17:903:3c67:b0:29a:69d:acdc with SMTP id d9443c01a7336-29b6bffd87amr213892395ad.25.1764229268696;
        Wed, 26 Nov 2025 23:41:08 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54454sm7966145ad.84.2025.11.26.23.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:41:08 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Thu, 27 Nov 2025 13:10:55 +0530
Message-Id: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move several dma-buf function declarations under
CONFIG_DMA_SHARED_BUFFER and provide static inline no-op implementations
for the disabled case to allow the callers to build when the feature is
not compiled in.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/dma-buf.h | 116 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e7..06e494d8f6b0 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -568,6 +568,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 	return !!dmabuf->ops->pin;
 }
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *
@@ -609,4 +610,119 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 struct dma_buf *dma_buf_iter_begin(void);
 struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
+
+#else
+static inline struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
+							struct device *dev)
+{
+	return NULL;
+}
+
+static inline struct dma_buf_attachment *
+dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+		       const struct dma_buf_attach_ops *importer_ops,
+		       void *importer_priv)
+{
+	return NULL;
+}
+
+static inline void dma_buf_detach(struct dma_buf *dmabuf,
+				  struct dma_buf_attachment *attach) { }
+
+static inline int dma_buf_pin(struct dma_buf_attachment *attach)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void dma_buf_unpin(struct dma_buf_attachment *attach) { }
+
+static inline struct dma_buf *
+dma_buf_export(const struct dma_buf_export_info *exp_info)
+{
+	return NULL;
+}
+
+
+static inline int dma_buf_fd(struct dma_buf *dmabuf, int flags)
+{
+	return -EOPNOTSUPP;
+}
+
+
+static inline struct dma_buf *dma_buf_get(int fd)
+{
+	return NULL;
+}
+
+static inline void dma_buf_put(struct dma_buf *dmabuf) { }
+
+static inline struct sg_table *
+dma_buf_map_attachment(struct dma_buf_attachment *, enum dma_data_direction)
+{
+	return NULL;
+}
+
+static inline void dma_buf_unmap_attachment(struct dma_buf_attachment *,
+					    struct sg_table *,
+					    enum dma_data_direction) { }
+
+static inline void dma_buf_move_notify(struct dma_buf *dma_buf) { }
+
+static inline int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
+					   enum dma_data_direction dir)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
+					 enum dma_data_direction dir)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct sg_table *
+dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				enum dma_data_direction direction)
+{
+	return NULL;
+}
+
+static inline void
+dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+				  struct sg_table *sg_table,
+				  enum dma_data_direction direction) { }
+
+static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
+			       unsigned long)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{ }
+
+static inline int dma_buf_vmap_unlocked(struct dma_buf *dmabuf,
+					struct iosys_map *map)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf,
+					   struct iosys_map *map) { }
+
+static inline struct dma_buf *dma_buf_iter_begin(void)
+{
+	return NULL;
+}
+
+static inline struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf)
+{
+	return NULL;
+}
+#endif /* CONFIG_DMA_SHARED_BUFFER */
 #endif /* __DMA_BUF_H__ */
-- 
2.31.1.272.g89b43f80a514


