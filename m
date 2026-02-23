Return-Path: <linux-media+bounces-53177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNgGNTojnGkCAAQAu9opvQ
	(envelope-from <linux-media+bounces-53177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:51:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB301743CC
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B74DD302194B
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D12D354AE3;
	Mon, 23 Feb 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="MZ14esI0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ABC350A08
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840303; cv=none; b=LBqvNbauelC5zG57rvRFvQ83Ju9v0lF7qZib502FpwDRBZzCanWDG/esdwAkn+eVKFiXUfgX8UQCg00d3H8RZxXxVfOzeV22lAMJ6BG7P1Q6zAhKqu3wmNOJwmjCoLBRw7aSdu7h2yHRYCDdPZayX9lcdnrmZbO33B0tndNJt9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840303; c=relaxed/simple;
	bh=hL1KRdcUkqD5m38qDR44cdwSUdn+MD14fevRfOfX13o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6r+eZtJJunf84xhj3rXfreSM2PBpBJJFzWhM5okSMrvc4PuXsCkLewawxWVXBBSqvQxdNIw+eNLhe5dYl7HmuwuyOW8xGbIzkBrutn46/X1VcDggw9eYo7OOT+t+zf8hQm2XJ5rGeyy6dCUNjvKrqVvIL3R7BKQVpIGyXC6BE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=MZ14esI0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so38185145e9.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771840299; x=1772445099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
        b=MZ14esI0l0R90faCb8ODOQ8XBiWNV7vCnmAtXq5GJt7lZCp3IEMqvAZ2PjK3beeEl/
         lJHR+yZ0A2xrTr84uDO1zF36xtxwdcqyN8Bi1AWkQmCc29ZlbJIjH7pnfzcVb4UCHifk
         0lG42cf71+6utGvxgTJIBOYzM3B5SL2ruhHPqB5xo1KehAlJDyBMPiyrETbxPm0S2aWG
         YRCsmsuFC4imrA86nVyCFtEqpqXAcV4mnrY9gXe0O3kVhYAIf5l2PPwW9r4PxgIURTnz
         t/Qwvh+dn4pH+WL8bmtGsZ1eunmdnZA3TkdbMc8hL89D7CXnU7a+Qd6xgLeaThAc9Pd6
         VPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840299; x=1772445099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
        b=qLoVQPYM3Zl+Fi+Ustu8ZJ/RtwCDD1wXvTQzfCLjIqU+K1NglYvoqTcuWYGWp+eusL
         Fa5rMvsYR/T4LRTa1oA4XIw/DcSJkLug5C66B+ER13Cz8mitazI+M6I8ZVGsqnkD0eli
         nEew90Z8GdcJUaQfN7u6E22ALtE1LC/xL17jwyOC4ap+aFgSRIjw/N/5+i9bFLvl/e8a
         Rp1/jhoQzVeyb/xI7QKVHB7ubu7CkR54ToidU80fsnyYDcOvftYCkDU387z4jB0Cj7zj
         K1Vro19c3tpkVV+bUO22ivm+imRGSEZ9Vh5b5C5L51+utKEwaFmtJhJGjwMWfbSfiYCJ
         njYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdDWbATduo5tbgyOMEHLMXb33LxX2Pu25uWmKQyOGnD9pej1PusnXXYbmIVnUBTw+1IVYT00lHfmKlDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxhQU73Ka5ZYI8iVONAveuaNkEdV+Fq2mT6yOv9+qxmebXqOGG
	+8jf1tPJ2PxOJaSUkkdq+MIgePK64uBJ/hRWyoSMy88kJoVAdACc5ZUs/MuW4Avycas=
X-Gm-Gg: AZuq6aJ/9OLhVCm+RTSIoRT9BHc9Bw1NEFgfW/iVcFlU+A6pQNsHL9nc4ElVOnbK8lb
	aM5KEBmrEa6q3R2SmJqO4JyWznF88lNZ+hlQMO45QugQj99z2A2NO0znwaUYE/qDNE6288Xaqux
	Vvht6+rh1dYN/NwVIhBG/X+ERoGqfP8IYm3Zp3VuqQahcktpfNcziZumaX3KPfO4I5p2DNn1DPl
	VoxZglGR07tuA1ZJXzGjpZ/34KLApK8bvpfO9/tK5gPgf2VCnNcss6T/kyoQdN/9dXm03d0qVM5
	ofTZJ02+9yoMBMh8x2H8XaetkK/u6ezUVwgFACJCsHz+pTqlEFuFL4AcrqCrGK9J8Y+TGao3Vkk
	wbHvbfFkGcigKWbXUDGRXb6tZpQE+OPpEQC1YwIUXdPUltQpTSUMRaAvv4c7qjE2C6AhHfiVShc
	QM5K8Nvoql47LEfd25ZkqGUllJ
X-Received: by 2002:a05:600c:1e1d:b0:483:456a:514b with SMTP id 5b1f17b1804b1-483a95befe5mr129473145e9.12.1771840299027;
        Mon, 23 Feb 2026 01:51:39 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm397848795e9.1.2026.02.23.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:51:38 -0800 (PST)
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
Subject: [PATCH v2 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Date: Mon, 23 Feb 2026 10:51:35 +0100
Message-ID: <20260223095136.225277-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223095136.225277-1-jiri@resnulli.us>
References: <20260223095136.225277-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53177-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 7DB301743CC
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Current CC designs don't place a vIOMMU in front of untrusted devices.
Instead, the DMA API forces all untrusted device DMA through swiotlb
bounce buffers (is_swiotlb_force_bounce()) which copies data into
decrypted memory on behalf of the device.

When a caller has already arranged for the memory to be decrypted
via set_memory_decrypted(), the DMA API needs to know so it can map
directly using the unencrypted physical address rather than bounce
buffering. Following the pattern of DMA_ATTR_MMIO, add
DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
caller knows what kind of memory it has and must inform the DMA API
for it to work correctly.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v1->v2:
- rebased on top of recent dma-mapping-fixes
---
 include/linux/dma-mapping.h |  6 ++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 29973baa0581..ae3d85e494ec 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -85,6 +85,12 @@
  * a cacheline must have this attribute for this to be considered safe.
  */
 #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
+/*
+ * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
+ * (shared) for confidential computing guests. The caller must have
+ * called set_memory_decrypted(). A struct page is required.
+ */
+#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
 
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index 33e99e792f1a..b8082d5177c4 100644
--- a/include/trace/events/dma.h
+++ b/include/trace/events/dma.h
@@ -32,7 +32,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
 		{ DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
 		{ DMA_ATTR_NO_WARN, "NO_WARN" }, \
 		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
-		{ DMA_ATTR_MMIO, "MMIO" })
+		{ DMA_ATTR_MMIO, "MMIO" }, \
+		{ DMA_ATTR_CC_DECRYPTED, "CC_DECRYPTED" })
 
 DECLARE_EVENT_CLASS(dma_map,
 	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index e89f175e9c2d..c047a9d0fda3 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -84,16 +84,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	dma_addr_t dma_addr;
 
 	if (is_swiotlb_force_bounce(dev)) {
-		if (attrs & DMA_ATTR_MMIO)
-			return DMA_MAPPING_ERROR;
+		if (!(attrs & DMA_ATTR_CC_DECRYPTED)) {
+			if (attrs & DMA_ATTR_MMIO)
+				return DMA_MAPPING_ERROR;
 
-		return swiotlb_map(dev, phys, size, dir, attrs);
+			return swiotlb_map(dev, phys, size, dir, attrs);
+		}
+	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
+		return DMA_MAPPING_ERROR;
 	}
 
 	if (attrs & DMA_ATTR_MMIO) {
 		dma_addr = phys;
 		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
 			goto err_overflow;
+	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
+		dma_addr = phys_to_dma_unencrypted(dev, phys);
+		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
+			goto err_overflow;
 	} else {
 		dma_addr = phys_to_dma(dev, phys);
 		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
-- 
2.51.1


