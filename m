Return-Path: <linux-media+bounces-55603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG3OMSrGs2kqawAAu9opvQ
	(envelope-from <linux-media+bounces-55603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03727F558
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3335C300CA07
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DC936C9C6;
	Fri, 13 Mar 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MOcAQW5L"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B637370D5F;
	Fri, 13 Mar 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389346; cv=none; b=EF/oIsK3UkxPUrhWQ7TN2XTpeVFzLNbVLXrhjBsP8ak2aJFBnmaHaEEZXacSx3QONFRbap4hjB+FUFbIQbj1VXBw4BfsBy5U5eVhKrWq8qQJVz2VfVLxxmxnm0nhaWAd8L0v7iiu1sYySDN4LfHMhXGItbr5MfYhQL8EHG6aBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389346; c=relaxed/simple;
	bh=E0DSyunzKE+vLHImQYGoAaCZP7tJD/aLiJNV4Zz/UK0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BTiVGVwfTlpIVbxB69Bt2e7fEGce0oWq+CC6oQnt5F/q12vUxgvYZUxTTv7rbCDhLrqo/pVX7lE3xLTFUNFnuw4oPv2gTTtr0GVSWP6tOCoxgGI3m4oVZi+qHFpcdpAIULkmuJIBjEt6soheeVpA04EN8aYzHReJIwrbSGoqqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MOcAQW5L; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773389335; bh=0rRofAcuvyyFT+Z9Vu/JFJM8UfveyJzPopuRHncNVqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MOcAQW5L+bT26gQOHeQ/Q/hMCeWqlBmm2wBUhpM8S4TPGyxpfM08t2kym3jTJcqMZ
	 HV0P9UBzO0UVvyAcaxaTIzhKuIRXtW8Bcs+EF4wIlwxB/nLoc4jThIXvpDeiVCbpYe
	 +Ow7APr8tdfz3pYUJ+qS7b9ZdzhJvrzMthSQyyBE=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 22E0321C; Fri, 13 Mar 2026 16:08:46 +0800
X-QQ-mid: xmsmtpt1773389327tefqgdrc7
Message-ID: <tencent_1C471D4ACC7A042EF8835483068406994905@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SraLkdMg6AosCMNyk94uH2NWE+Nq+VHRmOYSCnROcrzA+6chxnJ
	 EZUtOfe16MwWBDDBQlwCNru1g6Dxi0+Dfn+k1LZQWKCnodU31rPq3EqjpJ3HYxVKgoxe1iW60mQf
	 vLPhWfrBzuY1epmbsUQIAX0t8YSLjXKnm/IXqeSmCQVDCkOuSHRA1ILSdM9brushm6rMgZOvDIKN
	 kmUVu+sTSpRW9c2+YGsrNkBrj2KUx4ZXT6rLutf3fYzSiNLEdjOhaI4CnVXzrSp0xNNlquwtGo7D
	 titbiwWob98CUIxDArHhr5VLmKx9M9+vw2IhTzmB+b/xKdOHqRi9q1HVgoqfOwnohEDE0iUzES09
	 OVRIZTsRPY3BL9w/MhACaeA/QZsH9YH2nJ7LBiWpuLKikY2fgPL5AdVPl6oUdPfBH7A+WFcqmW1Z
	 Rl4OxIT3JPl3sVGXCdXswmKCJH2fnUIJnAYAjVfruXdfITZDVwVj0AW/faKHC1as/u+swCzNugzW
	 l56PRrigagBjKb+pMIgRxV3lmpTC83eJIGRcj7lBFaobwYzEfDG26gzcsC9291brn7Bl4wxVaxVZ
	 86u47AyyfTJIpE3pEmY6L6QXspeXHTmJShSWhtb/fwLQQTTWfEiPbp416VkxsCR2k6P3nSScYxDS
	 GEZBb1qU5PF7i0Dq/grQY0YLm2T+rI3A2TLg3PeWtN1Eg3YzWsst0ED1DkDrMNF0uNfe8NZH/0WN
	 2tMHXa3TStJ0qvIwRUqZCkp709bgmmn6JgNBq2Nk2tJEdvTp4t0wrydTa/41+BJSnMcYWT0XlJO8
	 +ZVdfhpF7a169nUUEe4wOEHwNOzWe5iUpbw5q8AjKx6N+upBrzBeM2kHJL4JpgmTN8dho6QOa1Ho
	 LXQ+ltq8WIe7VlJd8Tcz4XvaS/JTzfEbwYHakjQ8eXUFuS4AUApF9N0k2L4KU7ROV8dVzEgVG1t4
	 J9Dk5BFtGvByjcrqEkXXwzUT1KIrspCteldLxdBdgmpgmpEpXUdz9OFxj2DY1bSDsHdVmBdiH7Cg
	 iQQzajDuKpou8Rudlhg5LyJtfFt5QdDvxyzO+2HmhSmopNIJMhbkJecqk4RZcPlx0ghy8TyA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH v4] media: saa7164: add ioremap return checks and cleanups
Date: Fri, 13 Mar 2026 16:08:45 +0800
X-OQ-MSGID: <20260313080845.169663-2-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313080845.169663-1-1742789905@qq.com>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
 <20260313080845.169663-1-1742789905@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55603-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B03727F558
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add checks for ioremap return values in saa7164_dev_setup(). If
ioremap for BAR0 or BAR2 fails, release the already allocated PCI
memory regions, remove the device from the global list, decrement
the device count, and return -ENODEV.

This prevents potential null pointer dereferences and ensures proper
cleanup on memory mapping failures.

Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 47 ++++++++++++++++++------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 74406d5ea0a5..47b0594042c6 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -888,6 +888,15 @@ static int get_resources(struct saa7164_dev *dev)
 	return -EBUSY;
 }
 
+static void release_resources(struct saa7164_dev *dev)
+{
+	release_mem_region(pci_resource_start(dev->pci, 0),
+		pci_resource_len(dev->pci, 0));
+
+	release_mem_region(pci_resource_start(dev->pci, 2),
+		pci_resource_len(dev->pci, 2));
+}
+
 static int saa7164_port_init(struct saa7164_dev *dev, int portnr)
 {
 	struct saa7164_port *port = NULL;
@@ -947,9 +956,9 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 
 	snprintf(dev->name, sizeof(dev->name), "saa7164[%d]", dev->nr);
 
-	mutex_lock(&devlist);
-	list_add_tail(&dev->devlist, &saa7164_devlist);
-	mutex_unlock(&devlist);
+	scoped_guard(mutex, &devlist) {
+		list_add_tail(&dev->devlist, &saa7164_devlist);
+	}
 
 	/* board config */
 	dev->board = UNSET;
@@ -996,11 +1005,17 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	}
 
 	/* PCI/e allocations */
-	dev->lmmio = ioremap(pci_resource_start(dev->pci, 0),
-			     pci_resource_len(dev->pci, 0));
+	dev->immio = pci_ioremap_bar(dev->pci_dev, 0);
+	if (!dev->immio) {
+		dev_err(&dev->pci_dev->dev, "Failed to remap MMIO BAR 0\n");
+		goto err_ioremap_bar0;
+	}
 
-	dev->lmmio2 = ioremap(pci_resource_start(dev->pci, 2),
-			     pci_resource_len(dev->pci, 2));
+	dev->lmmio = pci_ioremap_bar(dev->pci_dev, 2);
+	if (!dev->lmmio) {
+		dev_err(&dev->pci_dev->dev, "Failed to remap MMIO BAR 2\n");
+		goto err_ioremap_bar2;
+	}
 
 	dev->bmmio = (u8 __iomem *)dev->lmmio;
 	dev->bmmio2 = (u8 __iomem *)dev->lmmio2;
@@ -1019,17 +1034,25 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	saa7164_pci_quirks(dev);
 
 	return 0;
+
+err_ioremap_bar2:
+	iounmap(dev->lmmio);
+err_ioremap_bar0:
+	release_resources(dev);
+
+	scoped_guard(mutex, &devlist) {
+		list_del(&dev->devlist);
+	}
+	saa7164_devcount--;
+
+	return	-ENODEV;
 }
 
 static void saa7164_dev_unregister(struct saa7164_dev *dev)
 {
 	dprintk(1, "%s()\n", __func__);
 
-	release_mem_region(pci_resource_start(dev->pci, 0),
-		pci_resource_len(dev->pci, 0));
-
-	release_mem_region(pci_resource_start(dev->pci, 2),
-		pci_resource_len(dev->pci, 2));
+	release_resources(dev);
 
 	if (!atomic_dec_and_test(&dev->refcount))
 		return;
-- 
2.43.0


