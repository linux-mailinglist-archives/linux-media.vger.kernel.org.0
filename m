Return-Path: <linux-media+bounces-66950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eX2fMZL8TWruBAIAu9opvQ
	(envelope-from <linux-media+bounces-66950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 09:30:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58B722A2D
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 09:30:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e6Xc2feN;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66950-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66950-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 017E6309D378
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 07:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC93C3F65FC;
	Wed,  8 Jul 2026 07:23:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3F3F44EA
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 07:23:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495427; cv=none; b=TTrDoj/1NWAhQSR7t//w+InXXbif6lFUClVSkgM4E2rlBR61mNDshYmQUdnpteYQobLmUr2GttdXoyTYLGHyWEMzEJpOL+uySdc1HnFG6KV/lzQnbgMrqiyq+7KJSVSnvMg0T/UPGqFmosITT6rmTjAB9Y9zxX13+DGa4+8pL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495427; c=relaxed/simple;
	bh=Mc9Hhdi+MlmmTpUGUMkd9MUwMZFDO3QrP2FfW4Y593g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=oSAo79UZQEQO9nzEII8c6wq/BH3fk8nYC8mUBmGVoq69mOaTgwZ12Ag98HfrT7XD9s/kZCOXyPy0WJuH4jSsnt5HhgT2TSenjxqFqAM1ONMRjLCpviS9HrfpG0V8z8hAoROLXr2tZdBMPUrtK0N9IHxTMsjV2+LbznJF9kkwtD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6Xc2feN; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso338748a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 00:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783495411; x=1784100211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AjIkGqeMdht6hiLhVYaqloFQG79kReEb1g2147hBT4=;
        b=e6Xc2feNkyAaCwCjShk5qT9Uyy3OBIxy2t8k5hdH7ui9eDM2mR7h5E5qTYPZnYz72Q
         6hTZI7C7NXad0TVl9rmI26QqW9mafmw4NgipRp80mjGRy4mjrfAdcdPS/8Q2L/nbuhTM
         FgNsMMUPj06D997Mge/K6hFD86aNV9kio0au7dWP7qsIeMvfSVcEmQNmS9I48hXibHHY
         bZU0nQcMwy8PUpt58rCzPXmEyluerzIqmEiKuNv/gOboWkb1k8vi4JkHUXpokwWi80f9
         zJecEPmAt35OuVLwZzSUgENM4cmyPzu4An0iutEMxW+Kq+ojGrZ2Ck+lwzWV2PAOrUnw
         yVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495411; x=1784100211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+AjIkGqeMdht6hiLhVYaqloFQG79kReEb1g2147hBT4=;
        b=SzxgFTN0CpqOZngXXKPweHEL47s0Mc+3Or9GRAFSLiNU9gjrmgciNxfzVOFMsHdawS
         9hGRhAVqrDLkdrEIaweLLcyAMxZqy2GC2f8exY4oqvruogKgWaa4bQOXKyp7i3bBxvJ0
         QjQtkVc4OYk2tUtzxMBk8gSl7rCCqTGF6RrBott1L1ZUNWczhzBvwSMv2Vek6FkLq+fp
         zp3MMqFXSh24GT/JNXkSJTRbR2tHzTSz2BDfMEArrhh+Sy4jA47SN/aMRsX0v6acfPaP
         4QuREzqheeIbxjecK+xDIAMhKXyrgcj9h4KFwfUXrw5Y3asyQU8qlIax2POPCHaXxTgH
         q9Tw==
X-Forwarded-Encrypted: i=1; AHgh+RrrQYykMb4NirtUEAohrsarFZT/mX/WLSAiD5dA6uzFoAFuwkssv363QUVrj7M5JsG2t910Wl6Gg749JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDxMdMvgWlfGMPrASY4KiqnUGffr0HWsMsa4a8m4qC+VJZIxF
	+qa/JYsYZEzEmB+7ozssUCa808M83GnUW9kctFqfsmvcUb+mc5zgu4kiD/Bj+uVDqRk=
X-Gm-Gg: AfdE7ckZ+Vsja+0E5oBSBMR0ptssx66V5Gnl3p2i0RFaPqVYf6ldwcoSh7Ib+Iwsjtw
	2XgzYl3xDLo8nsKKhGIe63swgH+ISBHYf1Q66byP5XUIc7bukPFt79B9u4vyBEi+06Gh8vQpCKg
	s9/1gCv6aDBq5F/aIaYK7oyieEV8ZMg0lG2Zyky6XXFMD2rlqXPPrnCxlcXMa5EIDNPwoSFDk81
	CKmeQpeMjTDRCKlzNyCr7SwBDFvq8bW905C6AAzqcw5LBycVcdv2OrBW+W8u889Tf7r74/rcqk+
	Misc60tn9qhUg1kHa9AgSf7K12XxM6NTgXwBvdvY3gzcHA6ypwtKQkdNl0NkCIkbzazYsDLbfJO
	PwiZO+BGXr435L2zvarolnsXLMZkfIWtKCWsYZbFQ5HmFBI9wwEAIL7ievgHy5ipOSMy9NcA=
X-Received: by 2002:a05:6a21:4e03:b0:3bf:82c5:ed0f with SMTP id adf61e73a8af0-3c0bd1763admr1617901637.44.1783495410747;
        Wed, 08 Jul 2026 00:23:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm2053523a12.22.2026.07.08.00.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:23:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steven Toth <stoth@kernellabs.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7164: fix cleanup on resource allocation failure
Date: Wed,  8 Jul 2026 15:21:11 +0800
Message-ID: <20260708072111.723453-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66950-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,gmail.com,kernellabs.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:1742789905@qq.com,m:lgs201920130244@gmail.com,m:hverkuil+cisco@kernel.org,m:stoth@kernellabs.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C58B722A2D

saa7164_dev_setup() adds the device to the global saa7164_devlist before
requesting the PCI BAR memory regions.

If get_resources() fails, saa7164_dev_setup() decrements the device count
and returns an error, but leaves the device on saa7164_devlist. The probe
error path then frees the device, leaving a dangling entry on the global
list.

Remove the device from saa7164_devlist before returning from the
get_resources() failure path, matching the cleanup done by the ioremap
failure paths.

Also release BAR0 if BAR0 was successfully requested but the BAR2
request fails.

Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 6bcde506adf5..225dbd3650da 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -878,6 +878,9 @@ static int get_resources(struct saa7164_dev *dev)
 		if (request_mem_region(pci_resource_start(dev->pci, 2),
 			pci_resource_len(dev->pci, 2), dev->name))
 			return 0;
+
+		release_mem_region(pci_resource_start(dev->pci, 0),
+				   pci_resource_len(dev->pci, 0));
 	}
 
 	printk(KERN_ERR "%s: can't get MMIO memory @ 0x%llx or 0x%llx\n",
@@ -999,6 +1002,9 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 		printk(KERN_ERR "CORE %s No more PCIe resources for subsystem: %04x:%04x\n",
 		       dev->name, dev->pci->subsystem_vendor,
 		       dev->pci->subsystem_device);
+		scoped_guard(mutex, &devlist) {
+			list_del(&dev->devlist);
+		}
 
 		saa7164_devcount--;
 		return -ENODEV;
-- 
2.43.0


