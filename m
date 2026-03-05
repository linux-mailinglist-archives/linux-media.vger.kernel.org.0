Return-Path: <linux-media+bounces-54634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHcROT95qWl77wAAu9opvQ
	(envelope-from <linux-media+bounces-54634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:38:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647D211CCA
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ABA83060BF3
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652F939C632;
	Thu,  5 Mar 2026 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="hNGECdZe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C027339E172
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714209; cv=none; b=thMRMRDc8Nz4H25A/S288Lwp5sAnzgiIn7/SbuAVm3Md+VRhdoC6LL9MWa0HSjkYtLqz/kq0Ka0su2ISn0VkPWPV0Gnm6g1GILOhS8drcxCasC1GvnkcFKH50rq2CNChm6gtWt7Q5I/OkfcHEXxuKo6vT0S2YPKY7DuAVyXYBbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714209; c=relaxed/simple;
	bh=hL1KRdcUkqD5m38qDR44cdwSUdn+MD14fevRfOfX13o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gp2Ph8GKEWdbKxhJY+xgGgHMBTdyzB5XRxsE5AkGp7+PHloIhvu9PkgwGXydiJum0ay2wSHkZukipe6USoc/8kwIjZTwBn1H2N9wOL1y86DSfRd2Ivds6KY6kG+pr8aJKG2qwvshKXvDQPdz6vlrow6zVBFP7rTUsfq2skGmBCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=hNGECdZe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso82508055e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714204; x=1773319004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
        b=hNGECdZerIdFdQenVTvtwz/snM1RbSJdOhU7JmZp1QjEpp7fpWvKWMblUGSE+shokD
         W3iwz8DkqIBP8LB/pVkrzcqY6nzY4tG9nJhZjwPcMFT6UpuGh1UXB7HqUqav70JLcPLM
         WctuG0fKAybJcZYjRuhy1eM76va7LbBSC17cUOUSQTQ9m8kgRgSAdVviLAj05ZZiYfqd
         AVmrNSo+U505akSx0mU0ktsrh+mOHsFXof//bIgDdY4GKQ0UQ/H+yQ6z7sXTu6tK+SfZ
         sjIMl1YLvgUTT0Xl+fvOdI8+NsQG3cGSKkjVxKazxcjhUSBPKIvRkVyNaymBQJK01M6k
         E2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714204; x=1773319004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
        b=wgb+MvltiqrVgcWfw9YoG4an/KY9SfhdFDW5FvrV1+BZTa+4rpcxRaPxBKHyi+v2UR
         NDsdXSWJdS8hrY4hQsa4ikiH35IK/8BaKh4+JxZN8H+oq7tPFxC0PYaJUOiICx1UOmLv
         gYbNfGVrxuE82J7IQpZqdgha9vT3sUotXZotl5OZOg4226aZt0jGrx8D5gUSX/Qgl8ej
         sBkYuBEvbV2qa4qFK01i9XjN7v5pPmwsOt37UCDasFV2s9dyZEyDpIXnvaW2EQBGTtWp
         j09pr9PXzCpMrS5u+l/dz0w/8r+XNaj4ySA0E/DN5Q8QO78ix8sjhhREa2TkgFpPTI5C
         +Clw==
X-Forwarded-Encrypted: i=1; AJvYcCXNzwEAHnevEwO2oqvzt6EEz3+eeHRCPWStz5rPX/h+LirKH0KldkrahgZjdHm/GiFPd0r0TNfZRXSIEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8lrgPpd+BfznboBb2YXkRadr2H/czg2eSeeNYdUJEs4E8RMfD
	7FJ5Zh+qdb5OUpIWKmmfFAfGeqEeUM5qGAvUJ34nmt4jjnOPbQyFohegO+gafrhR7gk=
X-Gm-Gg: ATEYQzyD+SgQrtRxrqh/TTaRh8/Ry5HGUtiQXBapY6amVMJlgPc/zCu62JUtqPX71Tc
	rOty9M34VA/Cl/wu3FK/6mL3US9Yqk5YkzGbs8HwnT7szVGmP2unEtdjAWhaupSjmvZAmyXZAEn
	TKaFXIu39U0a0Jk+T/+E/wbB9dpOIxbb9MHLvxaANGbd/zu4cz80gCMqYX9/JaZb0RLfSPRthlh
	Lm4rS5jRlhW+evPYWwplzW7L8jW1RMdiIVNUnrYV9WdUbo1aAARaHlIOkn+u5Bg1Ekp976KR/5d
	vwEfGk9idJN78N3SMrMjadL3wM8kUm1RVdNdo5GHlb2NCvCf3NhYgQ0/0ay7PVrfil2HkqCtRQV
	JhjpP+g4hWSAF/u3+iQYnsvyA5inZqc85N+3icCqCLKdehdBlXtcYAABRAFevA9EeHGKi+JnSww
	U45a6VBr43Rn/OvA==
X-Received: by 2002:a05:600d:15:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4851ee7bfc7mr38207005e9.8.1772714204144;
        Thu, 05 Mar 2026 04:36:44 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55d15besm37523468f8f.30.2026.03.05.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:36:43 -0800 (PST)
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
Subject: [PATCH net-next v3 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Date: Thu,  5 Mar 2026 13:36:40 +0100
Message-ID: <20260305123641.164164-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>
References: <20260305123641.164164-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8647D211CCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54634-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim]
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


