Return-Path: <linux-media+bounces-55842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDqUDfSet2l/TgEAu9opvQ
	(envelope-from <linux-media+bounces-55842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:11:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BC294FDB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02EB63013246
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB3534A3AC;
	Mon, 16 Mar 2026 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="efYPDvhy"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8D347FD7;
	Mon, 16 Mar 2026 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641413; cv=none; b=SpHn3hv95HJbuXssnwRJbNOwX8ayd4Rvp/rGwCXezfh2nWTXmIaa7e8+Aos4MpDo253mtRAdg10xK2LetJXoIbG+fCNUifKULav0x3LR+bcCk/2Oflus/X4e56FPiDUx9VWZgnlUdXV5Oo2i2/FpfMeFAU5qE9vk9VP/skEi9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641413; c=relaxed/simple;
	bh=ANA3bDUj1AYJAfK38Am2rFs1a0kVN9KcOZoZRUwTHMo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=TpMLMJnySCsA0GP/EQTlgnqpvlK1qKlXPhks6BpVmIS+Etdo6FzNyk3ugPU13bE2xjc4TQxgYQ5rAuKJTKISMuBqpJb+LprdPb86c6yAYPkDhPEYnh2FxAAf7S1kr7OqkiaqtVx/2lZFRs/2mSfnf7OEhUqCrXy+MF8AMCoKKD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=efYPDvhy; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773641408; bh=/KLgD1omgnLhk2q+OQkiJsSMEFttKQPleJm4kbMxrTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=efYPDvhyyPMZd7P792Wi+0FGrLnLvOrog7pzVJgTmry+YeYpU+Boi0B6AMgfQPCQ/
	 u9FDPNfugPLfByhbmTcVdAjbsITVmEEkn8Y4JOGyQLxmg/GAmAVKintKFQYk4PYVo1
	 hLQYgz0Zvr674Kcc6AwVggoH3464kQJlHFjEhTu4=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 26C8EC29; Mon, 16 Mar 2026 14:09:44 +0800
X-QQ-mid: xmsmtpt1773641396tbqbmi9uh
Message-ID: <tencent_1FDD3A0B2EE4634BA305E400F94547048A05@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNzn6pIYWH5zW+OLbI3BvrEETokp0Lg++XJGK9OnqSjxI8ICI9ESU3
	 94/jUU9xnJAV6UmsEzEFoTCWPzp+PIk9yU+r/x/1RoyCE7tQYIg0xf2f4aHfay+41eAVR1Xc4qK1
	 Z/Cw8G7OfnyP82fhwUqcUzMoiMScUeb4tpSuCFgZAruYXNZIHbNt3NyV8lEXyF1R7TMdaU2+oXoV
	 a1l3VWmhaNEioD8mHx9jzP7uN383gFoUqWqJcEF0AmVCP0ZSXQncCrCaGF1Iqc+e/La/r2t/HiYd
	 0OUQ8SXtfhaLYF39cWrvybAXYO7aUy2oQhdKsx7mDA5iYKlXD3i+evfbJozt86FVnitEWbcIJGZz
	 9vVGKb9i1cTW3FUr6KteZfbQUtqZLdsYLoHEf3dN/G4GYVdu3eul1pd89sWjitzIDj91Tqw5VMhM
	 6K4ZbzKldjuhmNICI6A5ZTdkA1zaOrAT75RtemPiEbbh5C61ukayqrRRIqOg5z6CXuKWpBCah5Hr
	 49IKcJjibr5EX/A5/7cf+p2G2yseA5Ghlr8JIF0HJvmuW//t8HioeHTiLti87bCKN1rhs64G5diM
	 MXuxVKT8VFnBAzppBy29pt3/44DCG4iW26aND7rkR/ZowpsxQD7DcYa7IB8jCe/MN8grQnr9fuhh
	 mnMkXNniKwGtUb8dMTMwhFnePt8ysxfY0BUxXT3V8F2gZYAagDLGV1aAdkWia37QHkxqGISLkjqf
	 KmDzv3Zy3eo4rQTMPePdgZI9FehbpVluwVrl1yiOTWV62dSWScRiZyv08/UFQlzLgh2zMEKZHcug
	 HzdJ4dXqUOWrNsjxzCL/3bWMJ34HXOe59T1WlwhzaaHaFMMxHTf4q03x5V5bSaF/HWrpUoG0C8LQ
	 P4kXYKWMsLtRo++UBgQ0130GO1eWgPZH5kiAEXooWxqntjVlT54F5m8GyWCOMrlLwuELXvkwgVcK
	 OQXvECjPxEVvb+Vg4r7CZ2HGd6j8NSeWJweTIh9bRsG+BMG93gHUox7aM/30e/YXWofgtSfRtS1k
	 24Iziv8wYU4qX0/T+RvkNFWMIjiS9wkHJw+8O7oYqR4ugHlpRd9FPV/F73fwqFb4z/rPSI2Q==
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
Subject: [PATCH v5] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 14:09:38 +0800
X-OQ-MSGID: <20260316060940.9659-2-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316060940.9659-1-1742789905@qq.com>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
 <20260316060940.9659-1-1742789905@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55842-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: CB2BC294FDB
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
index 74406d5ea0a5..5e9e85c6ddb4 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -888,6 +888,15 @@ static int get_resources(struct saa7164_dev *dev)
 	return -EBUSY;
 }
 
+static void release_resources(struct saa7164_dev *dev)
+{
+	release_mem_region(pci_resource_start(dev->pci, 0),
+					   pci_resource_len(dev->pci, 0));
+
+	release_mem_region(pci_resource_start(dev->pci, 2),
+					   pci_resource_len(dev->pci, 2));
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
+	dev->lmmio = pci_ioremap_bar(dev->pci, 0);
+	if (!dev->lmmio) {
+		dev_err(&dev->pci->dev, "Failed to remap MMIO BAR 0\n");
+		goto err_ioremap_bar0;
+	}
 
-	dev->lmmio2 = ioremap(pci_resource_start(dev->pci, 2),
-			     pci_resource_len(dev->pci, 2));
+	dev->lmmio = pci_ioremap_bar(dev->pci, 2);
+	if (!dev->lmmio) {
+		dev_err(&dev->pci->dev, "Failed to remap MMIO BAR 2\n");
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


