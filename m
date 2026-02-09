Return-Path: <linux-media+bounces-52424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD//L5H/iWluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:38:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20851111FD3
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8710300B51F
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2441D37F721;
	Mon,  9 Feb 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nKkuBN2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440BA37FF70
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651494; cv=none; b=FFTJwT7hPGCmtWJlhwsRymxpi71a5SWTgjbXjcxKKMYO8EQyvohMkO3C44jvGrlcS8pHgvJl0WGF0tKgSZJHTMRjl52XgzVLaOhQhNMUj+y+dmjbLTWeQSRt6vB+pL0Ap+lvbHZ2j0J/CASWQyBSM6r/9rDUkcAROeAge63vaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651494; c=relaxed/simple;
	bh=ntpJZbbpBAGBfrW0cjUkMTCbCe6n90bP2ZCU7ZGm4GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMTcLQFk3rCLHuXuNMLlF3Q6HMwYZcP82lReYy6b85CavhO1Jj7rLSAVEQZt1y7dRPMozB6sJxX2olojqRHfmDQR3/NHgshrwW5/SnPIXeeKrsoLSx/WWfD/kI3jeMrg+ZDt57h3Fk8ynFH7DyhDwPLctZMgWii709vTkRfaSAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=nKkuBN2i; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359a302794so1976775f8f.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651493; x=1771256293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10eo7Xx3UsXznodXP/t6JgtysFzGllvuxfjnxVYXEzw=;
        b=nKkuBN2iTUOR3NFsSwXZayT/YuZ89208RN4C4ikwE4JLWD+c8YwEvVlvQzkdsUhbML
         ioCU6i/BOMSAZbIBzB3Yg1bXrPIat0e/1EH7RdTkuewF3bSHrXR0cKk8nrMDhNUM7tvz
         m83Jxcz+heGRicwa3eLkTOqfR8wy7bG6TqvqIKfAp0LQ5ojcOWPkzCzajs0hHT6RPxAr
         f41mtFOv6yVbbDQRRgyX79XnZEt6Yig3Ajk7QKI8MDjx7Xo3BlwXYfDEClCDF/B5BtCZ
         gz56kLbcG28HNvMjPfgaoY1kleahNwLtWWvQoFZLF6Dbtk7kjsmAZonc/R8+q4uoNbYc
         x/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651493; x=1771256293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10eo7Xx3UsXznodXP/t6JgtysFzGllvuxfjnxVYXEzw=;
        b=v/LfSeC3l9ZOXCugUuYK9IfJobCoGgF8oZODnUEoSS3Wud4Jx3TWRmY1CZLW9x5o51
         m1IKSutLz+6B75UH3xaKh13Qhu3J3+4kWrhgRQJByLqmLM0yzKYGO7XOJcOanRhq6bka
         uJ1Cn8lzNKoZCfJIrujHSP2p2q7h5cvS6lJ+QUMGCM+ydu9ttaFormEjp403WXi86wK6
         IYgrZzOo2filf7g/bl5I/HUEmBol+aDfJRQVIzv09qlNNhZKlpsJkH/cpo3n3QQb4TPe
         /HUoSGhhlZ207L4ghAbNh7jVMT2hG4qcDqQh6HKYtVpwHLQxHBAyrDiTEZxxarhSSNSP
         Xfqg==
X-Forwarded-Encrypted: i=1; AJvYcCWBVR9/QH2Zg0sewTsmT+xpyHzdfUEJ+In0/LciRVQJE+0/sDK+1X7b1D3KQxjZCoVOMxcovwfq+IqIgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF/V6ItxjZaOuRg1xZKRns1HYDgzKNRILA0D/ECzmokKAHnFy5
	/8HyC5R/W5u/4ISKLkdtVEUSb5cSIewrcfz8TxqrqJqP1QCa7R6m79J/LK2QFNFU+Ls=
X-Gm-Gg: AZuq6aJb8XfAypUhQLISWn/8eZgigXX3mcR+FfuQFolQWOBx3ovrUAFfgK9/DxOZ82E
	SQinXiosDZMzggbQ3Gl3RJbngURS053WlB/8/K63AbBeci9/wP1VPHhnpx2aXFgPOc7xdvTx0px
	dUcYV8czp/d89PPOHp+dKRGLmN3xszBUuvA7lTeWenR9dw+YhCSX09rvJB0NHOF94Qi9m5gV3lg
	ZU/gCwvEgDKgZZMlVQQmZ494owC96CT3DntriF5GzrtrQvszr02PYSEQxZDPswJIpUzVyvvmitm
	/jZG0LGhf5OU72XPXsi2xnx260HWgYC5K66bKaBzhYvL/r69Y/MgzJKxBy5DDJ70u0F3xDa1V2y
	EwINSYltVPOqP8gt/51ljJs6EqcVi+oYlhM/xSJaukMEABB7MGCcEepnqXG5hwwFUuvlkGNqSol
	+Qhw==
X-Received: by 2002:a05:6000:4211:b0:435:b755:c67e with SMTP id ffacd0b85a97d-4362938a453mr16934813f8f.49.1770651492550;
        Mon, 09 Feb 2026 07:38:12 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm27481147f8f.17.2026.02.09.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:12 -0800 (PST)
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
Subject: [PATCH 2/5] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Date: Mon,  9 Feb 2026 16:38:06 +0100
Message-ID: <20260209153809.250835-3-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52424-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,resnulli.us:mid,resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: 20851111FD3
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

This is only relevant inside confidential computing (CoCo) virtual
machines, not on the hypervisor side.

Current CoCo designs don't place a vIOMMU in front of untrusted devices.
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
 include/linux/dma-mapping.h |  7 +++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index aa36a0d1d9df..052235feb853 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -78,6 +78,13 @@
  */
 #define DMA_ATTR_MMIO		(1UL << 10)
 
+/*
+ * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
+ * (shared) for confidential computing guests. The caller must have
+ * called set_memory_decrypted(). A struct page is required.
+ */
+#define DMA_ATTR_CC_DECRYPTED	(1UL << 11)
+
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index b3fef140ae15..b3c2cee8841a 100644
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
index 62f0d9d0ba02..ae5bc1919e1c 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,16 +87,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
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


