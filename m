Return-Path: <linux-media+bounces-55348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCGSAQ4xsWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:08:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59296260019
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 188F531A2EFA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DF2FB99D;
	Wed, 11 Mar 2026 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zL7IaI3P"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924B3C1401;
	Wed, 11 Mar 2026 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219045; cv=none; b=mi8SKsVlkebFwIy39RazcqTqsmPbSCdLuPAxg4U32OkaK+uQ1Dwta2GHOvzBHlAd32dylUA6A8i/NiloxYu7cLg9d2YP1U7ZZp63tpnSTI1aT7M+F0wq74c0g+y5vrHG+4MfRlgB68uZM0fDo0PTlibRXKq6Yh62R3oLtyFvIbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219045; c=relaxed/simple;
	bh=fH3mtajKUm/pU4bouNPlhJI8zCa7s7zFXLZf0aiMR3A=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=H9/e9DKyrLCzpHiqZgdx74sIPSS5mnBfxDNq39ZYQeI4OYAWxsxDWUkLybJDwq4TkNq4XvkEw+AGdXzodThHCpF6Izz2xeZxxZQP7ofYnQKhPnIoVb/vQH8UboI9ZyeA6PkMl5FURs+92BoTq/jsYNbKy0rdn2JUkAuw07xg1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zL7IaI3P; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773219024; bh=m4AYJvonpuTEFUAb32I5fp8ckUa9C5ZFi2THJVsWCIQ=;
	h=From:To:Cc:Subject:Date;
	b=zL7IaI3P3CCKFtIScfyv2NvaM4cFa6hyMr4svXCnZeZadJeeKlBJ3xJe8JmQtbGWw
	 IpfgWrh0HSxp/URN7x1G9Jdd763bf41nyEOrM1vvlmNb6BuJQYNQLiONc2K9/EIhs/
	 rKjJQJDnVF9A7v3RhCD42Vmw7eA1dSPTRnWdiU8Y=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id C94AE8E7; Wed, 11 Mar 2026 16:50:20 +0800
X-QQ-mid: xmsmtpt1773219020tl2s1qrrq
Message-ID: <tencent_A4D58795C63C081EB29A4E3D54B5B5041C06@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GevpqaKte0ffoU68tJ2ugIpQhpahcNcUO3hB30kxmD3RTkADWHK
	 MtZKdY9VAN1wYlEJ3wtkDgqK4ZKKn5pClidZJu+PcLe74IUVR2jsrp0wgRYUyHw3+DaoEKHravGW
	 RTraRFllgPe5XI4ZP2nlU3xbAyvvbhGra2+1Mx+iGekjqwrBzewHtjujMt/DXpsDAOtDvaRRZNTQ
	 Hr8eZF9BBVcA/bdRxbzlB2yh7KCsgR1g/pYoPBzouL/AAcEb0WPxrijMl96p+aNAuXhkQxfuk0Hs
	 EvmrYzTmEFbAXPg+SG1z/p2fr11oZH8xw5/e+mcwaQ9O5XN/c0GWS0zXGlTsUnlWFby4ksdphuna
	 as25Ei4ENP2NFIXYlF92zX3pV03oumcXSGPQqhBmc1hbIziSFVSXTIr502zFkH6T6+OG6EcxW+gZ
	 GGXMKWsi8AErfJbfIBtpM7sr1KyVr4WtXAy3CdYpyXMF7E3oaZJaSCT+A+cp0JmPgoyaBSTfF23B
	 cwbJ3FZOj5eIMWwVkbEVWKCmW2MqpyBop6eKBw4JlqjGuv/U3dSx2IrT+0OxHNj19xy/UUnz1l0L
	 k4RsOoRbuXRvthurQoalgr9U8HzmkyMLwRsWXMOlht5u31/l6BL5brZVAsZM81ymGyFCD2dkUNca
	 8uBT0viDEsoFw3O4ymsphNO6OYE3AejnUEzUlzprzEDMEPN3FyPul/mA8MydQUu9Eag4bY+f3dxT
	 3K8uVofpXF/DXQEbq7/rxZqv4x9pwc7j2iJ0OqOR2PggLyYblkvnGlk3tAnDMyzgZqONiR4QX9pr
	 Wijmbr0z+hIEzaI3gnuoA+lhdNCaYwQjLoxgubUMZHcT9iouHN/uZt6CSqejB1n5uJyqPhnqqOgr
	 Fu8+uHh3JlEToKIvAePtJ5Kp9hGwjx3GhY6qYcGKwoapj4gcWbZmbv9ehWktxPR2q2n8gzyaW/x/
	 /83YgY1VDRzQ/uzI1UKDE5WyYhfsTy6CGO+gBNutuMW46gN7BrimoYaK9zBACgN39pGaNFUyx07k
	 RfRRHk6lQ/ePWZ5jGvCNw17QUkqHU=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn
Subject: [PATCH] media: saa7164: add missing ioremap error handling
Date: Wed, 11 Mar 2026 16:50:18 +0800
X-OQ-MSGID: <20260311085018.29506-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 59296260019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55348-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Action: no action

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
+			"failed to remap MMIO memory @ 0x%llx\n",
+			(u64)pci_resource_start(dev->pci, 0));
+		goto err_ioremap;
+	}
 
 	dev->lmmio2 = ioremap(pci_resource_start(dev->pci, 2),
 			     pci_resource_len(dev->pci, 2));
+	if (!dev->lmmio2) {
+		dev_err(&dev->pci->dev,
+			"failed to remap MMIO memory @ 0x%llx\n",
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
+		pci_resource_len(dev->pci, 0));
+	release_mem_region(pci_resource_start(dev->pci, 2),
+		pci_resource_len(dev->pci, 2));
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


