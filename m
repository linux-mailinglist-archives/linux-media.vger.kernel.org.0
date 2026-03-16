Return-Path: <linux-media+bounces-55902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK5cJcH2t2mfXQEAu9opvQ
	(envelope-from <linux-media+bounces-55902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:25:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916629974F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 460573011141
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F32D395D98;
	Mon, 16 Mar 2026 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MMXrGwYv"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2317220F3E;
	Mon, 16 Mar 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663929; cv=none; b=snOCEcAcJKVrjWZPUtEBrVrej0U9x3zmFI+JE68oqXLMLtroHRnfiDxPvkQskGDOl75lKrNwKHu26QQ260t87eEcGlDVP9Kr8UBp1P1uiU6AFiWfg4vtrzJ90Da1DBPioWXHc+1r9FWKsXJsdNRATQW0Gi3azBzM/mrt3F6ouF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663929; c=relaxed/simple;
	bh=kPJYIEAJR54rRZMU4vjSNZyuTkSLhKkgEbKyOFFoJkc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ih3QRhsJp5smtf6jODhXa8z32Y9anOP+eMsX3KP36/1UR32Dm2pJh+kehUYBuq599cy7A2zAKBAISEYeghghdpWNkXRopgmm6teXAP5fL3a3uUbUCJ7e4px+z1h9gaGQaotlezEtxRc8XmT1jCNANIeTyjLY2bn69WCk038knZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MMXrGwYv; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773663919; bh=8IlexxpMmwKQzRij5fT70kj2wanqMWnzZ9aWuQZ0bFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MMXrGwYvMxa7UkPPOwwjkHPJJZaAh9t+UEZxsosofHd9RM/7STYZG2uKwzbcsYg12
	 iFpW2sh96OKJaFNY1zOiPWmCPE9oTx6G+euKV4VfWTAC/Jk0oMHugreiK3Q0lTeI89
	 Z7VK5O6ME2kS+smVThl9F/GRASwEzEia3OXLpvQM=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 6040EEFF; Mon, 16 Mar 2026 20:24:04 +0800
X-QQ-mid: xmsmtpt1773663846tp2qb4xg8
Message-ID: <tencent_58827022DBE97040A15A03C0657EC869140A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9Xixzd0RHdhCMLvrK3ihLIBz5bhDAPSwLnSLRRGDvVDPmxKOESBI
	 mMQkN4Z65t9+iSvQRhSaC6rQhFcsdzQPJDkqWwJr1s6crwt+ubEiYpC6vwm25Zyv4kN4IaQWvny1
	 CiPXGyS86SmmMsICcWH+N4D5ADgChRQ9fxSJkdIra//40cstQ4fgHRKZ8sXjFx8u010mRke0EPht
	 9FSkPoJJr9eZehdUvSibFS4QUwwbPfnu0SBCMTE7xA6OYPPpN/qzhdbFKy/0DTBnX6Fg+LFBXUWJ
	 Z44sidX0ApdJPnYnkBt7JjwV9VmjZjsTprDmmX75Xy1wuC1PwTDWXMsx9STHDtpB5eoVs1dqqyQW
	 H+O2D2DTDnsq+CHRE3LD8XL0hEp2+sO+Pw5X4xCmVxWsXOWpvPExJFcyh+9Tr+dLkgdvhvwus1t8
	 u75QobVUKhzcRpLZKgdyVpUbWFnIlEaWEdfk/aYG4/3Wwo7UwXpsyEa3TIUTTXIws8k3zU4qnLmX
	 54TzEm2YN0yYT1+tN6QKZUcqGccRxxBPWWXX0UhM9mipvlTklbP0ny6i1Sthkhn6yBWG0yMrb6i/
	 HQjMbDGni+H8l5jpdQINFDwjO8BWByd2YE88cY2kCOjadU7B2Cl2QZ4quxuaeILPJdcTyzYJZroF
	 2GNt4GijYT22dw67h78qYj6cb8Lthoyju1oX49WOWpcvrQeaYEFjN1j7EGqbVCRsVVTdBr0Tp7WM
	 HD6vuCgLXtNteCVO0WKAhmc3IujpznE2A7x6Dsb2p/hAVXf0/9T2isNJw58gouZobY+t0TygIsOo
	 Uj8kIxdgW4LGJ5CEBH1tBGjHg1/Qbgm/Y0AEtxEbMf+CViZ9/yXC/N2hr9L4oDzQ0Nxi2oTN97kJ
	 HgVqihBqSDFIJ+icp5fI33S8whTCt8NGdPtVXETcfsS4fUEBqfMfJi2iGGuf5p28r26M//iRQH43
	 K7ub7+c1k8ytm0BrP6Zs/vne1JwyNVd78UOXjU1qeO1OHPrMYlRUrn1wbRZEmO2KStsWVRL+suYK
	 wnMd90rq6z5+mqA6sS/MWsU+eSC6k6HaE+2jyWisuRUTaQ8YJSMAiznvEKAznADTtxXf7yFcz0tn
	 bqUAnhNeQgovB+13w=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Subject: [PATCH v7 1/1] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 20:24:01 +0800
X-OQ-MSGID: <20260316122403.23337-2-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316122403.23337-1-1742789905@qq.com>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
 <20260316122403.23337-1-1742789905@qq.com>
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
	TAGGED_FROM(0.00)[bounces-55902-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 3916629974F
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
index 74406d5ea0a5..e8037ac1db73 100644
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
+	dev->lmmio2 = pci_ioremap_bar(dev->pci, 2);
+	if (!dev->lmmio2) {
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


