Return-Path: <linux-media+bounces-67362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CCWGFuhXUmpDOgMAu9opvQ
	(envelope-from <linux-media+bounces-67362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 16:49:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F19741D3B
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 16:49:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=XjOct0D2;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67362-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67362-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DD4730234C0
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7FE2C21F2;
	Sat, 11 Jul 2026 14:49:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370526B2D3;
	Sat, 11 Jul 2026 14:49:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781341; cv=pass; b=AYUpoY11Jt2YLBOqQ1jQzIGXH29FBIXwO92W+x/TmcP+JeY4dC0I5VCOwO5LFhMJaAqiY5jt7GRclRe1cmGl3ZGjOvZ6ypomKLs0PbVzk7QT/TBkatO1QpNJ+QFzsRxJtP7Z98nmvN3MjIDOEaz1CV5uZhcmiqISv6clDJPu2nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781341; c=relaxed/simple;
	bh=eD+1Bml6jKdRXQ9pK0g5MVyYZFVmsCFzE2qXtUdKw5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRddeLaM+T9x4ZbBz119r6T1ev+k2aqrWdPHA3YUFGFv8mVJhk9ODCPwfr4x/OrENL+4sKQXPKeGiLyZEmDuU1ecaugVtW2egOhJHcVuDu8y0480e1S/o5+O20O6cwCSnihgNss/WRYyLM1XOyO8MsqettE161l5vO2Uh5+u5zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b=XjOct0D2; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1783781328; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BH4dZUWFXQTfpBTQhaOCxYSOrJSIBoAMYPL0GW2hOvxf8SPFEl3Jaz/BLUiAaj+YfT4mmi0BJKs0xDW7qcFSEn/NuISdleLOwOspZtx1lSCrkl5WkP2L6aGxdK4nswV6YvI7MZ+Vjs8wCBZJmm3on2Poj+K9s8ExjZDMiN6xaoQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783781328; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kGHh/6tYI5CXdwmaq9gUtobNs8A8Brc1JnxMpe3H3lc=; 
	b=kscEkUlWDfYiPizyVcRM2SqCMaGPorOa1/2xfEC/oLBE9CmvrWgDCM9Wa4B/xLYvFP94zbCZRobizZETbC8R4XIyxog1/mQHqHZMGAj4a0QJG+A5qJdXsy6l/R5zpBgQCtBY41snFaMtJ/inbXYfSXiyo/wxUe91yEGOQeFlQc8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783781328;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kGHh/6tYI5CXdwmaq9gUtobNs8A8Brc1JnxMpe3H3lc=;
	b=XjOct0D2Ll/nKAqt2RjQ+kSHU589TeaBxWRRs6xjdGy6+gpcnFZ/7kuq8FefC1ho
	o40rOta3xUV1OIgsZs8owLfrX0PyKtKO7HbD1sm/kgzZUl4+DY9jSy5mO2Qp6OfXlof
	nscyEV5UGpn1hAMcyZ2+X4qYIUq18BQHecMkNs2U=
Received: by mx.zohomail.com with SMTPS id 1783781326029184.89565228296215;
	Sat, 11 Jul 2026 07:48:46 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] dma-buf/udmabuf: Introduce CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
Date: Sat, 11 Jul 2026 16:48:12 +0200
Message-ID: <20260711144814.8205-1-robert.mader@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:robert.mader@collabora.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67362-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robert.mader@collabora.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robert.mader@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94F19741D3B

As udmabuf increasingly enjoys popularity - being used in projects like
libcamera, Gstreamer, Mesa and KWin - users more frequently encounter
cases where the current default size limit of 64MB is too low. Examples
include allocating video buffers at a 8K resolution - and even 4K is
affected when using non-subsampled video formats or high bit depths.

While the limit can already be changed via the kernel command line,
exposing it as a kernel config makes that easier and more discoverable
for distros. Thus let's do that.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/dma-buf/Kconfig   | 6 ++++++
 drivers/dma-buf/udmabuf.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 7efc0f0d0712..35f0779cdc80 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -40,6 +40,12 @@ config UDMABUF
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
 
+config UDMABUF_SIZE_LIMIT_MBYTES
+	int "Size limit in Mega Bytes"
+	default 64
+	help
+	  Maximum size of a udmabuf, in megabytes. Default is 64.
+
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0d65..a83153326362 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -20,7 +20,11 @@ static int list_limit = 1024;
 module_param(list_limit, int, 0644);
 MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
 
+#ifdef CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
+static int size_limit_mb = CONFIG_UDMABUF_SIZE_LIMIT_MBYTES;
+#else
 static int size_limit_mb = 64;
+#endif
 module_param(size_limit_mb, int, 0644);
 MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
 
-- 
2.55.0


