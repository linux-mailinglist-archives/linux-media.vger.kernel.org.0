Return-Path: <linux-media+bounces-55499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA/BI1PCsmmvPAAAu9opvQ
	(envelope-from <linux-media+bounces-55499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 14:40:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC4272C14
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 14:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C6D530B4683
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F1E3C342F;
	Thu, 12 Mar 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="NHFspxSo"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1621A681B;
	Thu, 12 Mar 2026 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322388; cv=none; b=rkUUGfeWsfwZUhY+YU7F/wfArsqioMNvp1KQ4si7+IuGG7j/7TMgvMRuYpoy5qn0wIei7+RJS9jMlNIfzaVpzTQ4ObaHm3mZwzVdOO/8ToFPcDDnkJlQk6nuc01Ae8YtogGH91dXyZJRm+ZMyoXv1rIo+zaw5dWtJYJPvAn9PkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322388; c=relaxed/simple;
	bh=kH/CCqp/S9t36WCSxHH//xItxwGYzwcLCyQX5gh1oMQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=KIWlfld7R+rlR5r+7zxeCO0N9LEQJSTNrTDkaO2lIiCGsVAoFHki/j7QlKpe+bYyK5aLcpseNGG+HE0kPpMWMxAq3X67mcocPMGfBVYZ/cDFDRlB+Yo/blpNKsxPoC8bUSgm54nQB10UlzeDMrPGRoxU1/64Vb5D/jSjSRxKqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=NHFspxSo; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773322376; bh=m4AYJvonpuTEFUAb32I5fp8ckUa9C5ZFi2THJVsWCIQ=;
	h=From:To:Cc:Subject:Date;
	b=NHFspxSo05NeosAK5zXQwljpX8FN8k7fpyyJXr1vWuxwOSmvnuq1lLy8dgfaD3iFR
	 1BLOumPCEzoX8AkDokQDojg7rINfSeVQHZ2rrtjzeM2uKCqlKbK47ylMFYH1EyZD4Z
	 /FdbGyL25H3/E2qVJh34QrkslEV3ay9INlN+tFXg=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 83606A26; Thu, 12 Mar 2026 21:32:54 +0800
X-QQ-mid: xmsmtpt1773322374tg89rxym9
Message-ID: <tencent_D591461D8821B2B10E09549FF5379CE6C706@qq.com>
X-QQ-XMAILINFO: N0xl8emtHWY1Nlt0DgfUK57tmr8bwDbxmfxo/pCSU/gqYmRZWjyDkcYlTedEif
	 /p2VhcDUxI8PodOmblr1vRH9/qFTKe5giuP97LgP86YebQCOEpSfUlD2+pBZsmTOFvkzorb8JZWc
	 pdm9Xg1PRWX2TorCGsQnoDPdwnf2JvbE9a8BK1pyVzlbCzEcZ42hilbkuAS3wSDOKh/AjMkUdQXE
	 jkpU5wpE6KkmsrALlnLJqgIA8edNTEPnCgoWXGB3Q2tVf89re8ErZdFPFIgUkSJO2OepsYGs1DdF
	 n89XFUXW9lFq9GhUOt5GyyJ4Fw1IGOdoBVncgV3q1HSDloaZRh4+AqCbfUm/RKKv1UjFq4VNJQPq
	 pqDA4bfuH19cPhX74kdP0vIFVAssGqBH5cqJBLU7t03EhxI/Hz27cZTBMMboRe+AJc88aqkNi2Ke
	 AeFcKA7GgKYq4PXY1FxNlrwv0Ph6IKEJ20+LymxhvlD6Es+io4NnSeIQIZap16jZKSD3MH6rvmT5
	 zimmD6NuDrp4B7KBHFF8vDg8Vk164BYWPUIQ352xTLiswpPc7ihdFEuKJ8t5OJUwSPMIufwPezmQ
	 UxZGOsaFzMRzxVzrMXH4JloZ11KR2bJkg7QwkmSinN7sNDlXBgBa7yeIqzscWOSAIz5ufkB1fU9U
	 5rINJKPAeM6TWsffV8r0EdxacsSsTfea+YBSHhR87J5uRIQdtkxdi7LCzVRI/gbMxGWvzGuob8LG
	 NiQ7M83LtP2uL6HFPxExKtZx+nETJCETumnMLJt+W1J9dkEjrvbpdriDJ3ctHrd6fXScCO26tIM5
	 HE2N4/TMt17x2tQegm0W7o415BcAHkGcRzrFgVVfVCTXd0JQ5AzWKdRNaO/wYQS13i1KpINwFAzO
	 0K+Oms5OpPJsgIFiNpDvPrMzX8uSGaJXTwEHYr82O8enzxi9zXvFGx2TXJrNWTXoZuUD3OoiEOvj
	 Jo7KUq65WZ3vxJlTUnd32d5R4qz3++5ecy4Wjwaz2kvjXbxuT3COSeK37+xPW/DYv+PT5uj3G62V
	 mM74wGgCRzowEaCoEqIndf1sTRVLXiGrEz17VkFp4yM1xHNC2E/errvLvwasI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn
Subject: [PATCH v3] media: saa7164: add missing ioremap error handling
Date: Thu, 12 Mar 2026 21:32:53 +0800
X-OQ-MSGID: <20260312133253.162587-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55499-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 0BBC4272C14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add checks for ioremap return values in saa7164_dev_setup(). If
ioremap for BAR0 or BAR2 fails, release the already allocated PCI
memory regions, remove the device from the global list, decrement
the device count, and return -ENODEV.

This prevents potential null pointer dereferences and ensures proper
cleanup on memory mapping failures.

Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index a8a004f28ca0..dc68d7cac7cf 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -998,9 +998,21 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	/* PCI/e allocations */
 	dev->lmmio = ioremap(pci_resource_start(dev->pci, 0),
 			     pci_resource_len(dev->pci, 0));
+	if (!dev->lmmio) {
+		dev_err(&dev->pci->dev,
+				"failed to remap MMIO memory @ 0x%llx\n",
+			(u64)pci_resource_start(dev->pci, 0));
+		goto err_ioremap;
+	}
 
 	dev->lmmio2 = ioremap(pci_resource_start(dev->pci, 2),
 			     pci_resource_len(dev->pci, 2));
+	if (!dev->lmmio2) {
+		dev_err(&dev->pci->dev,
+				"failed to remap MMIO memory @ 0x%llx\n",
+			(u64)pci_resource_start(dev->pci, 2));
+		goto err_ioremap2;
+	}
 
 	dev->bmmio = (u8 __iomem *)dev->lmmio;
 	dev->bmmio2 = (u8 __iomem *)dev->lmmio2;
@@ -1019,6 +1031,23 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	saa7164_pci_quirks(dev);
 
 	return 0;
+
+err_ioremap2:
+	iounmap(dev->lmmio);
+err_ioremap:
+	/* Release the PCI memory regions allocated in get_resources() */
+	release_mem_region(pci_resource_start(dev->pci, 0),
+					   pci_resource_len(dev->pci, 0));
+	release_mem_region(pci_resource_start(dev->pci, 2),
+					   pci_resource_len(dev->pci, 2));
+
+	/* Remove from device list and decrement count */
+	mutex_lock(&devlist);
+	list_del(&dev->devlist);
+	mutex_unlock(&devlist);
+	saa7164_devcount--;
+
+	return -ENODEV;
 }
 
 static void saa7164_dev_unregister(struct saa7164_dev *dev)
-- 
2.43.0


