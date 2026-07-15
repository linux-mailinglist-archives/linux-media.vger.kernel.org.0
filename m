Return-Path: <linux-media+bounces-67627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EOtkKLU9V2rdHwEAu9opvQ
	(envelope-from <linux-media+bounces-67627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:58:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57475BAB6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:58:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dHGx5lg7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67627-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67627-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22590309E9FA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274A03C872C;
	Wed, 15 Jul 2026 07:56:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E957A3C5857
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:56:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102177; cv=none; b=X/9MfvE/tNZ3fdskRgXwgae4rNLwMaSCB73v4pW4wb6NwtJGbD0IblYBi/PbbuRB2HuXnOBpVG5xnftbJX0qgGWBdAnQY14t1kcAmYuNg3bFLAUBoqLF7aA69NlxdyrdCUU/R3ZooTNT1AJsPhOZX4bgtYyeacO7ZTt80sx3mFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102177; c=relaxed/simple;
	bh=o1UOI4x9Sdti9Rwq7LDBhzWmbP5Y8aCqgX8jrlL8EbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y5+MUXavuivJMuqMTN+YeH7sg0A+EDDXWA1DST9Co5BRuUszO9WUj5GwT0rKNxG92Mz63o8kKtd5jfF9GOaccsWMilPJa0kwfvE89HXFKaXI+7cI9Hf+r92/KZa+9D+jShZLSS0ExI0fqcMef4cd6w4IlkMVDLLqX9XfhZF8+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHGx5lg7; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5482675b3a.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784102175; x=1784706975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgB1QNokjBQfrUZXlrBy1dE0OfERYD7fnTE5ODO13eU=;
        b=dHGx5lg7ABZGp0Wxx8plPVGZ5RYJAHPSkOiikzIMbQP+bL4xCJJA6MZKG4szIk4VeT
         iNfy74Lzr87i1NouoWjv1Pcfge0vqFF/AWfEeSLu4UuBH3tJMPJba4pMBuxQZ2bqH2DG
         OtdJ7PrAym/VDaRMkemXGqh5FQJIJJ7owupUmu+eswDZkDsjJuNd0bkbTOK1/bWfX5IW
         azKo4mzkjQDDAj0D/2gNz4V35b2CMPpTkzhEp+JA1VRUv7d+GItsRmfDuLIWYUCfmnDt
         p+ueVjTHjXIeius7MFJArgcSrsPqOXZfL5oIBUolAxOsSwbyUGtgmI4ilN8b727ICtoI
         kBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102175; x=1784706975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgB1QNokjBQfrUZXlrBy1dE0OfERYD7fnTE5ODO13eU=;
        b=CUefDPaHNFiABkNyanQnL/zJLZSt5lTTvfGc7t84oMrwWgR3tmIYN6Z2ED/rzb09MF
         qnPTCnXUOMprQMSbJ7hzS3/73cr7B8LIG+tXyxyrM4+1RaJoG+Gs2+HQgZPT2ytWglDq
         7SAo+/rZyq/qtE607OprjvrPXQGG5ZCAU2nNUP+lI94eaNANg44Ycp4vK30VqZcOUO81
         ddGF/Uxd0RM79asKYZNadVH6QEt+n9G3TVLdo+Gq16teKcgAsNT6q5w9sWpqhXxmDdAn
         QrO7uXj2CAKSgIyGxLgNbsGuHRlCYUf+cb9AhsyyXJT6QXO9pmIk1Xfe8VzJJaSnxJro
         g3nA==
X-Forwarded-Encrypted: i=1; AHgh+RooFjiUAxkP2F8GBky5ZTJg5JlDnJEvxYi3Af3o0anQFHc4mzlz3dz0Oo0OgN8ACIcJliFj6Qv2F/V6XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPigx6xehdmnmuUm3JC6s+t7dosAGJRLy9yX0BOj8v6UC+c3i
	ByLoV2kT9REpVlfZKwjkmxlRzzSDIb+DIVuUw8fQoCvrWLOOdGuqtGU=
X-Gm-Gg: AfdE7cnAwfcPz3C0XUdJmPT6GVfSiQPmBYBEFnoRN5LSetTVqkpJyN5G4y8bbbsmPoy
	zGOKHfR3Y1clKgbJh1f2xZrjG3HWZzpRd9b9GGtwjNnUMkCZYRce6K41YvMzE86HLC/QJBAaK3P
	zZYFhdrnUEjuGQYDDSbKIbUYEIOR+SHdvX0iQsdHsKSnFzrJ1bSKyH3CpLFYcyqRsM6AHNNGF4T
	G+B5ho6psLHnBZKwI/NwFDmS23AqLMjndRSWS9Kwqls+V1hrYBHjH9jUqcnZXtSP6bigExhhiJs
	yeIEOvzH0F1T8I8mF28ZyLt6stdKWAJAYuLahhBQts4p1+x6EzrCRD4c6odNWM3wue7IXt45KvO
	Aqhmt1MFc6ddFvhhTBB2U0vkJk4t40+/z/berhytQhkVg8pPUmRPj32J2wXWboz941M0OXDLB0J
	OJvZiCeKymsucKkf88X69V3eNZkJFEamlNNkB+k4cFxqZhNCA9xvLQ1pu84aWbM0KZFZlK8x9Xb
	TfYBuvXqZ+p0bOxouRR88wXzuc++m0zmL2LIKOdC5wk8M/4EaTmi1KWdRnT
X-Received: by 2002:a05:6a00:4612:b0:848:2f6e:e52e with SMTP id d2e1a72fcca58-84a5587a0a1mr5492855b3a.66.1784102175283;
        Wed, 15 Jul 2026 00:56:15 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7ea31csm2738303b3a.51.2026.07.15.00.56.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 00:56:14 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: ipu3-cio2: disable MSI on probe failure and remove
Date: Wed, 15 Jul 2026 16:56:07 +0900
Message-Id: <20260715075607.62277-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67627-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yong.zhi@intel.com,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:dan.scally@ideasonboard.com,m:tian.shu.qiu@intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mhun512@gmail.com,m:ae878000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A57475BAB6

cio2_pci_probe() enables MSI with pci_enable_msi() but pci_disable_msi() is
never called, so MSI is left enabled on the probe error paths and on normal
removal in cio2_pci_remove().

The IRQ is requested with devm_request_irq() and freed by devres only after
remove() (or a failed probe) returns, so a plain pci_disable_msi() in
remove() would tear the MSI vector down before free_irq() runs. Register it
with devm_add_action_or_reset() right after pci_enable_msi() instead: devres
releases in reverse order, so the IRQ is freed before MSI is disabled, on
every error path and on remove.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 986b9afd7c..3f738ca681 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1654,6 +1654,13 @@ static void cio2_queues_exit(struct cio2_device *cio2)
 
 /**************** PCI interface ****************/
 
+static void cio2_disable_msi(void *data)
+{
+	struct pci_dev *pci_dev = data;
+
+	pci_disable_msi(pci_dev);
+}
+
 static int cio2_pci_probe(struct pci_dev *pci_dev,
 			  const struct pci_device_id *id)
 {
@@ -1707,6 +1714,10 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 		return r;
 	}
 
+	r = devm_add_action_or_reset(dev, cio2_disable_msi, pci_dev);
+	if (r)
+		return r;
+
 	r = cio2_fbpt_init_dummy(cio2);
 	if (r)
 		return r;
-- 
2.47.1


