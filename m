Return-Path: <linux-media+bounces-57091-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGefC2Q2xGkAxQQAu9opvQ
	(envelope-from <linux-media+bounces-57091-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 20:24:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4932B283
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 20:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58F2E304F098
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703AD2459EA;
	Wed, 25 Mar 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Qi1LZbWW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4D336886
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466639; cv=none; b=RHW76YYrPaG2uaX3uTPHsZaIC498Xz6VbiCsxYRTLTJYVKIL6r35RyukO1RIz8/45h7dbGK5yJDhdgVPp9JIkM7I1bVDQi1BPnjAfD5a3mNr2UjulvWqWjoc5KhQcaakUKJPzDShgur+gZuUF/FmpB0wUezDKphstCS4Q8179Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466639; c=relaxed/simple;
	bh=OvQSPP2jw/fFSL7LjhGRg/VLBAZ7+z7wdrvtVgyUR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O29CsXzW3ctXeQWr9DlLej6nkbajuRN49yDRzXLPSD4E08nL5Bigbu3EDoMaHTnY4zxe46b4aT238QZ9Lpgh2p326dTXcXTsf97DOHgBjSGO2bhFdyP5YQ+O7+w+ykRJY4BmHskgCb20lNMZi37KpCKTY8eAb5zKtzP9Cnt+qAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Qi1LZbWW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so2480065e9.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774466635; x=1775071435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMfoKT234OWAIu2ygAH4xOQ0BTmCnNSAwf62AjGD0Kg=;
        b=Qi1LZbWWiHS/vssFXZJm+Xgc3/aQoopMH0fPXvyyb/LdJeLAcEp1zofKG7f9DRWY2N
         lKDMmxuTUpQkXIH/vqWu1xNKgAk+d6qe0AsuviJcROGHZcNt3nr4oZyQrd4Dxk7DbTV+
         gH5O5jJ2Hdk4TLZ5RuelmFWZEmdsulMxmora1FJ0B+xAnsVaOdUmOKEWdcsHZxyBk1Ao
         t3Je8zjF7oPrzFX6f3j4SgkNx/lBCfthUhLlzzu+9C2bvQ4WY7liTAW3493l6gqcl0zr
         osf01ZCy2TkpdZwNjtpG5cxptWz6D5o8ndW+OCRpdNo8yN9m/6rB0IDA2bj1NnZZX1JI
         sh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466635; x=1775071435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YMfoKT234OWAIu2ygAH4xOQ0BTmCnNSAwf62AjGD0Kg=;
        b=mbvU1xLWNUTPw3oZB6CK8O4Qjq++mpuKdEnhEnwSxhMHdtlGnbwyRSqpob0S+7AE+W
         RGKUhJopTLLGhL9KkHRb7cuXU+IyzdWS5JLulgDlVGR5j6+pbqWuic2B6FsMzID0y0jh
         3ibtXzAmC/f5fz8ZLhr0g+T4cy9FFOgURwVX5luxZ7vCDgKJ/vj7gyRHWxQidpboOpA3
         q1lwMHFdtL543X7C3PKoGD2887wpNrvBH+gUoJDacLhYZBL1CM+McxoPGJ+OHsWW7Bs1
         LUqMnDy3y+nP/Y0C20xCb0zYaSQBQ8qK5tuHdz2cU43ZdUgG0o5K5RAyDfT7k1OOxjdL
         3Iig==
X-Forwarded-Encrypted: i=1; AJvYcCX+HXs90ao51x47Vcc2Rx9PyZhnuiAbjyjkD6/KYpgaXwcrQrrhrWpRQC0CxoOElfk+I5XBEfO7OSE/2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Q8GPIEieUXJk+TDHFzobWxYoYpWFayBgxDkke1PGCOtvO7Mn
	fRtfzbRRXWIYK2Cbxgb+d7c2GibeIwfa+2/FOOufI1WDcWjIdPDBg4LzeX+gK+xJVBc=
X-Gm-Gg: ATEYQzyBc8utb+x9guBWZYtcnIQGdvAz7R6dVbMNDlZLuDX0fxqYLNdxqmqvcO48Ndy
	E4OYWUm18xRFYRR3Cb2uYP9i8eley+ffjt61jw0KWOoStsWziE394tVuZvEl+WA+ENgmkRcVpOZ
	Zx502mCBEUsnt4jysBz/hv23BvWvRvqxF0+wQS+eu36h4gtbqC1tJ4vtSO/rBBkSAxrsDkjhAcq
	RWq5in91RwPgXDo4G4Do0w3ugw3yvTfWnt3TQhqKI8QnmsnzXlKLsa+rFK0CM/MT2V2KUYIEQAH
	R0Gu9rVvZmqvWzVh/pINCmSJJI06OA4ObOIFLDs5SweNAkXSPQ5fjwHBVBxSe4cGn+49bYkB7H9
	L4g6ydWPcdknOLHfJ8fQcJQUxVvPftl8ID+gNmfeXx2GzvDBihUHOoZvIxJbYwx+j416+X8H9xe
	EUCMvLUuHDLSLFoc0wMg==
X-Received: by 2002:a05:600c:c4a4:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-48716056512mr65908275e9.18.1774466634748;
        Wed, 25 Mar 2026 12:23:54 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm146523035e9.5.2026.03.25.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:23:54 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for shared memory
Date: Wed, 25 Mar 2026 20:23:51 +0100
Message-ID: <20260325192352.437608-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260325192352.437608-1-jiri@resnulli.us>
References: <20260325192352.437608-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57091-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9DB4932B283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jiri Pirko <jiri@nvidia.com>

Current CC designs don't place a vIOMMU in front of untrusted devices.
Instead, the DMA API forces all untrusted device DMA through swiotlb
bounce buffers (is_swiotlb_force_bounce()) which copies data into
shared memory on behalf of the device.

When a caller has already arranged for the memory to be shared
via set_memory_decrypted(), the DMA API needs to know so it can map
directly using the unencrypted physical address rather than bounce
buffering. Following the pattern of DMA_ATTR_MMIO, add
DMA_ATTR_CC_SHARED for this purpose. Like the MMIO case, only the
caller knows what kind of memory it has and must inform the DMA API
for it to work correctly.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v4->v5:
- rebased on top od dma-mapping-for-next
- s/decrypted/shared/
v3->v4:
- added some sanity checks to dma_map_phys and dma_unmap_phys
- enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
v1->v2:
- rebased on top of recent dma-mapping-fixes
---
 include/linux/dma-mapping.h | 10 ++++++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 kernel/dma/mapping.c        | 13 +++++++++++--
 4 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 677c51ab7510..db8ab24a54f4 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -92,6 +92,16 @@
  * flushing.
  */
 #define DMA_ATTR_REQUIRE_COHERENT	(1UL << 12)
+/*
+ * DMA_ATTR_CC_SHARED: Indicates the DMA mapping is shared (decrypted) for
+ * confidential computing guests. For normal system memory the caller must have
+ * called set_memory_decrypted(), and pgprot_decrypted must be used when
+ * creating CPU PTEs for the mapping. The same shared semantic may be passed
+ * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
+ * DMA_ATTR_MMIO to indicate shared MMIO. Unless DMA_ATTR_MMIO is provided
+ * a struct page is required.
+ */
+#define DMA_ATTR_CC_SHARED	(1UL << 13)
 
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index 63597b004424..31c9ddf72c9d 100644
--- a/include/trace/events/dma.h
+++ b/include/trace/events/dma.h
@@ -34,7 +34,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
 		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
 		{ DMA_ATTR_MMIO, "MMIO" }, \
 		{ DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, "CACHELINES_OVERLAP" }, \
-		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" })
+		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" }, \
+		{ DMA_ATTR_CC_SHARED, "CC_SHARED" })
 
 DECLARE_EVENT_CLASS(dma_map,
 	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index b86ff65496fc..7140c208c123 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -89,16 +89,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	dma_addr_t dma_addr;
 
 	if (is_swiotlb_force_bounce(dev)) {
-		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
-			return DMA_MAPPING_ERROR;
+		if (!(attrs & DMA_ATTR_CC_SHARED)) {
+			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
+				return DMA_MAPPING_ERROR;
 
-		return swiotlb_map(dev, phys, size, dir, attrs);
+			return swiotlb_map(dev, phys, size, dir, attrs);
+		}
+	} else if (attrs & DMA_ATTR_CC_SHARED) {
+		return DMA_MAPPING_ERROR;
 	}
 
 	if (attrs & DMA_ATTR_MMIO) {
 		dma_addr = phys;
 		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
 			goto err_overflow;
+	} else if (attrs & DMA_ATTR_CC_SHARED) {
+		dma_addr = phys_to_dma_unencrypted(dev, phys);
+		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
+			goto err_overflow;
 	} else {
 		dma_addr = phys_to_dma(dev, phys);
 		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index df3eccc7d4ca..23ed8eb9233e 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -157,6 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
+	bool is_cc_shared = attrs & DMA_ATTR_CC_SHARED;
 	dma_addr_t addr = DMA_MAPPING_ERROR;
 
 	BUG_ON(!valid_dma_direction(dir));
@@ -168,8 +169,11 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		return DMA_MAPPING_ERROR;
 
 	if (dma_map_direct(dev, ops) ||
-	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
+	    (!is_mmio && !is_cc_shared &&
+	     arch_dma_map_phys_direct(dev, phys + size)))
 		addr = dma_direct_map_phys(dev, phys, size, dir, attrs, true);
+	else if (is_cc_shared)
+		return DMA_MAPPING_ERROR;
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
@@ -206,11 +210,16 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
+	bool is_cc_shared = attrs & DMA_ATTR_CC_SHARED;
 
 	BUG_ON(!valid_dma_direction(dir));
+
 	if (dma_map_direct(dev, ops) ||
-	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
+	    (!is_mmio && !is_cc_shared &&
+	     arch_dma_unmap_phys_direct(dev, addr + size)))
 		dma_direct_unmap_phys(dev, addr, size, dir, attrs, true);
+	else if (is_cc_shared)
+		return;
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
-- 
2.51.1


