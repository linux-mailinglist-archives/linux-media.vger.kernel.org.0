Return-Path: <linux-media+bounces-52425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBzEJj/iWluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:39:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F24111FDB
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D8A4300BC59
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355C03803C5;
	Mon,  9 Feb 2026 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="N97pyVb8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5837FF7D
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651495; cv=none; b=mtbtokEn0pMiqBpxu0JmKneGNwexkRbKMqQ5r/rP25Gx9DRrF5iwJ5APh8s+S+1eEMM2huUajEzs3jqJcAgmntUl3DW9FjRYfI5LMip69XjAv6bcGJgL8tn76r2/PwJfwwMS1fFKDTS6EWmrNI5+p3UmVXRzF0jMZqvoARHrBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651495; c=relaxed/simple;
	bh=4+KS84gkU8a/qj/+caCigpMBaF9Inx8ny9YhQVJcbQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTJQFLVV/l4OHUUuqU/yXcIOdhWGgKO5VMmnYgJyHYCZhXj6HNN7x7u7RNH4O57Jps5/Mu9euySfS5hyNuB3EBtGFxTzp7j84heHnsl3G/COE6hTjLTlJPdPC4STsu81SoRFTpMAVntTtAL6Y3QWLn3MzhWxAtKHBapdO96yTqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=N97pyVb8; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-483337aa225so7501625e9.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651494; x=1771256294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCp//tMOTqGacLZXvOrrIiaVx7JZ5khmQmJbVkzQNLk=;
        b=N97pyVb85Y940y3ED0rQsIlcpcaSQ6qPYTj+DriixmpTOA0TBbPLvHaQhfQzCroYjV
         U5aFhKjz8ydckIrcttatHUiBL1sKZ5BOjEBoUr+o4VfTf/h/H9FE4OWtfaerhsuBpnRj
         JRiY44e9OIL2fBP/3HIp2Nhl1mO1t1hynFmy8rOxlYYZS/7qH7IScnvJndbCQKG636jz
         vDCy98QlV01TSfEXshLxlaKX8Q1zQc0637jRPIzl2uwM+X4BhTO1JMOqddZ0O6/Q8Szw
         jcOgRw/cjy2FrlhDVkYK8m2mJ36lYmt8wdLFYGdULB2oxSbtYUj2ztIRgjcBOOnL7cn1
         OILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651494; x=1771256294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xCp//tMOTqGacLZXvOrrIiaVx7JZ5khmQmJbVkzQNLk=;
        b=SyXS+SxAZgLphxv0fgufKOYGOYKXo7cE+NYZ/1KpVSkUIdMcbHQnPzs+HmoTLcfbzj
         PrYAudWZfShtj7rNtl2fF9DEpKWmxIJ16YMv5y0DCL5LRHxpgXnihqoRmVwpuLCgDlCl
         U2Sdanjm34YY2pZKYGDUWtJMLe/u4L5w30l6pWIdZ+7PD8jXkbHFXC4XR9d+cEWmQVCE
         Q0Wy2YUhkhHj7k335JvEqDKsBHVDvk5FhoN8wOq0pxqSe9PYnAkEWJPlTOh/odhZrovB
         2gbShXTkAj2I1zs+FrM6bieHnzU1267swMsnSBpY7YWq5o4/zgc3oOcD9iNJLM69WvoR
         26rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlviiMtt/YJxLZiGZEHaqOnJjBjyk3Yenr6jxaloAIvWJDN+tdnqgzNPUO6khM4Npo255ntW6zPGnCGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/n50regP1pP1usbYDT7eXymQJsmFSF2fn6et/crwR7kis+5r
	pAT0Mdx4i6X05+MrZPaXkoxsnu46b6cA23uZFgA2uzIHcLJIALREHBztEiV+Up3IxiI=
X-Gm-Gg: AZuq6aIOTHMxxPGWHIEOBp/Rn03L6XK5WCCJo8jqQSxhZb2ay6Ps0RqUKSp81BAYLM7
	8EzOLfZx3SYzgmb3NCXRWrTpOSA8M2f4i4wRtFFWD34idoIuwHrpQ3kQQIAw10eFX3mCUpxDJWC
	NjiNYJepuV3mWByoKaKkZyvEAAdt3AUsQikURtgmcmmi/TI3kARFg9iCgRB6R+uGrxyw8SRfPBh
	nxzvyzuOXMD6QxaX+SsefsoSQPVd7mJ7KTOaB9ZeOpJvEbZ3+6WprsnbC6392IaDLOMaky6Lp7s
	cYRYRvCe0UgEyaEQ/FdifBhrOk0OBHyxvQmaOq71s5aFbBaCn6ssfmqPglV9SMboHH7jY7xDwMS
	Neb8MibY+862RKvKgVTRY0b6561VuEXbC2TDpI76EnSShiLRQbZp6hqRVJWDld6/nWA8CtMAgxe
	FwPA==
X-Received: by 2002:a05:600c:c16a:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-483201e1895mr157429035e9.9.1770651493820;
        Mon, 09 Feb 2026 07:38:13 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8ebbsm382402735e9.1.2026.02.09.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:13 -0800 (PST)
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
Subject: [PATCH 3/5] dma-buf: heaps: use designated initializer for exp_info
Date: Mon,  9 Feb 2026 16:38:07 +0100
Message-ID: <20260209153809.250835-4-jiri@resnulli.us>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52425-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim,exp_info.name:url,resnulli.us:mid]
X-Rspamd-Queue-Id: 64F24111FDB
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Use designated initializer for dma_heap_export_info instead of
separate field assignments and avoid the need to explicitly
zero fields in preparation to follow-up patch.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 7 ++++---
 drivers/dma-buf/heaps/system_heap.c | 9 ++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 42f88193eab9..d12c98be7fa9 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -388,7 +388,10 @@ static const struct dma_heap_ops cma_heap_ops = {
 
 static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct dma_heap_export_info exp_info;
+	struct dma_heap_export_info exp_info = {
+		.name = name,
+		.ops = &cma_heap_ops,
+	};
 	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
@@ -396,8 +399,6 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = name;
-	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
 	cma_heap->heap = dma_heap_add(&exp_info);
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd4..124dca56e4d8 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -427,13 +427,12 @@ static const struct dma_heap_ops system_heap_ops = {
 
 static int __init system_heap_create(void)
 {
-	struct dma_heap_export_info exp_info;
+	struct dma_heap_export_info exp_info = {
+		.name = "system",
+		.ops = &system_heap_ops,
+	};
 	struct dma_heap *sys_heap;
 
-	exp_info.name = "system";
-	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
-
 	sys_heap = dma_heap_add(&exp_info);
 	if (IS_ERR(sys_heap))
 		return PTR_ERR(sys_heap);
-- 
2.51.1


