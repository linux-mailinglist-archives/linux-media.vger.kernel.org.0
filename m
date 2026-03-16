Return-Path: <linux-media+bounces-55873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B9cOmrLt2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:20:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99652296DCA
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D1263059ABB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2B238657D;
	Mon, 16 Mar 2026 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="IrMgo/7F"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650A385533;
	Mon, 16 Mar 2026 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652649; cv=none; b=Upf9rX/metrNflB/KzK6qybMbAemos69S0yxQ6rajfqVXhMk6g5FDT+2FeOxc3hVk69e8ghyEngcrq9N+q0XhB+GowZpL5LAp0IOZFed+LV3S+cI58f8+vzKV2gBy3N0e/2/8xAOezgGdGpmIusg6bYOZWpJ33jVgfgKHDSJbVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652649; c=relaxed/simple;
	bh=kW0uevZIAiHlWGLEWUUwO3X4mshB7DijrK8eKuBN1pY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VO69nvIszfwXdxbh4fbTuCiLqm1yAKUboVOHU/vx8DsVMRVhXp/R1RDf3uck8JG7cQA79vHm7qT77eKnhQufWgJBRfwztsTvnOo7mf0LJDxa0cvZzcxgluIqDhNh3V1LSsp2hW8QPhNkafHdKVSP8yAIvH0mC4/9ve6K3qdG8e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=IrMgo/7F; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773652626; bh=EgPkdtjellcGPlO/mT0/8ktiAnBmk8sNk4Hq0Z6O344=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IrMgo/7F9XQCK7SwODSSglNUdcXz12OtkB+FW6C2oZLYSU+gmuV6726Niv/9H0GIf
	 Uuyn525xYt0nbUqmbHQM1HAKJWwkHz/8ovEoqWbn96D7ZxsZ4YGl/aem4LZBvpuhOD
	 ppILmLXcoAdJQhkb94pqpUvZEshXmZAdn/TqlakY=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 432AD2D1; Mon, 16 Mar 2026 17:16:50 +0800
X-QQ-mid: xmsmtpt1773652619t6i0q337v
Message-ID: <tencent_F686048835F2A38E0A148AF50F1CE147BB06@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5VXfkThOnAAGmduqINloI/VW4GikcsecxI1xhElz1I47QeEY6ck
	 MVDuq1IKnTC72aDbAraGMb0+DpqFGCbbfAwX18tC5hrl/5uSk4kCHrTLAitN+eezHnHcEZQg9acu
	 Ko9QRx60Oz3SdXVh5W+yhePyMg7yKwezqFXFi90P3jQXFVtAz/vgGnBIa1TB5hG/e13SeUQffZMZ
	 Z49QNqgpiWNKNLws4rqd3Oad7WR5njTDKADzg99O2ZTc1R23UeaHh90dSU8Z7JJMyOs3MCg36wwK
	 X74d9e27Bi+UBKHbP8jIRM7tFDfMr7HXAZd+ugAp/cDI1m1/bH2U0F4rClYRIcHThZPn5TZWQ8vC
	 CvolsJtFpBvwNg4M2vrUrwPV0b76UcCfvgLo1oxRUcxGOTSN3mwf3BLlILodMLfpgup8cPB7QV67
	 Txj8KCJLYjof0CmkCaATQYQ6Usp896UAEZweQYJzTYKQq/lkb3AzhJepcQciIICXumOohtFzxpGr
	 KKxrziYqWhZSZ/oDRIqvO+sfXmjZLna6C0W5jFtnEUB9fYMxvLtbrlqsni51BlWVVGM7XeJlsPiE
	 K2greZ9kcEb9OAQK16sXAhVCfupe07FJSXzmqOVAb6E2ysOTRinHpbQmDen8XbzPoPKqQta+UAIH
	 D5ug/7RuGL6Zn+oV3XGnB25eCOlU7NPAgHqvq1BF+F3TdERP7fa5bTZtQHPbqtURaGvklpu+AEKz
	 2x5uKuTYXW784lUeVg9gSZ2vesbqwxE4N3Ar3CRHnXPgDowx7QXoQCnv74AIAjivLMN9vw83x9Xj
	 jdX2WroRkbZ008J2Bta4UvsEgkuwiRhWkUirm+Ac2kQMG7Mv+gxgrPYX5lALP9LVRfdO8TK8YnHI
	 Ub/0jfezP+V9VRlz01LL2cNscB6zzF+zDVGYd1LIYGkVe1bMZfOvjfBm6rnoFr3BMnidj8noPcNf
	 /bhdczlSGXM8enttjPNyDYfpGi+ueA3jx/5aqYKOZytQKiu4wPWk426ZOZnsO2JAMx3DXp08v7K8
	 QqtAsifm90+6xIopG9For3/z7+z9U+nL2oT4xh+dbdKDwl4jzzbGc0m7vBkn4=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Subject: [PATCH v6 1/1] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 17:16:48 +0800
X-OQ-MSGID: <20260316091649.14827-2-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316091649.14827-1-1742789905@qq.com>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
 <20260316091649.14827-1-1742789905@qq.com>
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
	TAGGED_FROM(0.00)[bounces-55873-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99652296DCA
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
index 74406d5ea0a5..5aea5ab34c3f 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -888,6 +888,15 @@ static int get_resources(struct saa7164_dev *dev)
 	return -EBUSY;
 }
 
+static void release_resources(struct saa7164_dev *dev)
+{
+	release_mem_region(pci_resource_start(dev->pci, 0),
+			   pci_resource_len(dev->pci, 0));
+
+	release_mem_region(pci_resource_start(dev->pci, 2),
+			   pci_resource_len(dev->pci, 2));
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


