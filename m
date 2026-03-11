Return-Path: <linux-media+bounces-55378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAfQAwFWsWmGtwIAu9opvQ
	(envelope-from <linux-media+bounces-55378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:46:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03669263108
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FAD7300B51A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274003DDDC2;
	Wed, 11 Mar 2026 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="WgRhneq3"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D068218AB9;
	Wed, 11 Mar 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229560; cv=none; b=cTWaClsVg6UuLwcyiZgsJXd1UZNpMju0wW9wsBeCBNPM+KWysKpHLD0K7dUo3s3FMOHCTbeVk5rD0De81GmTsjvITBv0CK30EAHfTF0o9LNJZjxeOZ8RExEsYKdriVvDzV8m7QmXO9giyvZvnDvG7h4vcU/Oprv+IKY4pq6VH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229560; c=relaxed/simple;
	bh=0iGaghC/NbiVSh6jkUjyWeHTbQd6+D7a9IXIk2s8cUw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=KbKKJ/L0OyH36QBS+sCwXss80QKcOqmxo3Sc07+00APg+1A48hgZAyP2CK/SAuplKzcjYLwegDGTig4bl3mf9Lg1E8LBB8/BeI2jJ4R9NEMlJrbuQ6A7iHrLdF2Oyv+3YM+vn5cxYvd/+Pw+RMDE8Dalft2wT4hftOgn57s5eJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=WgRhneq3; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773229545; bh=wVzmIUwtrK+LR0xt0vPw3jRguiI7cqjlKH5iTXQ8a5Q=;
	h=From:To:Cc:Subject:Date;
	b=WgRhneq3RLUyFnsl3XfCt7+indnpHLsgeXBzyUAxsDMuN3+nSAnzr1oGlP2Rhp0UI
	 za+BcJx/y/4KrD9J4kIa3gQ3yyxO7guWvQXIQKLOoHSQM1lZr54SXYTKDRWlWt0Vvc
	 ifr5Kqyj4253YkzghZOzMI4rY4o/RskeOb8SLlFA=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id B209E03D; Wed, 11 Mar 2026 19:44:32 +0800
X-QQ-mid: xmsmtpt1773229472tjv9i10fi
Message-ID: <tencent_789013E4271D3D28096B0C38C30F0A0D2C07@qq.com>
X-QQ-XMAILINFO: Ns+25EuXnYmwOuTtc6s0UbQYkGXs6viqNAueu3vP5GAOUsCecUY9AzHPVn8axz
	 QPW2SOUxYXzL7FUoB4YT0c+Ifzo7HnigT5yc3NpVv78cedtCYFyOYX2YzLPipuBuPRoAL9K0EQgv
	 wdP/u7Bgpj7K2hi1QEQYDERXEy9xZSmYQ9zKrNDlToi50NQJL5C5GTOJgQbPNg3s5978iHyBzxyV
	 AzrdLYyM3nX6SjKVWGuFp6xTgzfViXwqAJ0ntd1O4XsZ2G/Nnkc9M0zmPpX8x3y0ZjRh8PxYBJ4L
	 RpbncAm8ytC7BqUfjyCRqO+Vccr7h21yQ4K6VhcyAyVGiZaeCFeACFTbf2Ur/NU1Mp7dpQRPk7XC
	 gKuQZrEeNJpPv92chZn2GlEziMIqcyvYYwxg91ASugixaPX7SZQm9GVAZZP0PAKLcqUFAszu9W3Q
	 axZc27LrSbJiPhmW+3iDx0UQlkECo3vu5z+glOA1nv+t7xdFEHymufEQokTxRTOH/8Cnt9ZW2yv9
	 etGSbvNPG8T4KPMbpiLi4OoSXdY6xyHHEddYfWMCHzZl3ojiSwn0w6vh9gW81E2rTjoWy+ZF51Jx
	 eQp3GPTe/1sDGp3F5lOE72ShIuLdjkdA+7UsbDE1cfD5avO07cPrF2TZaJObB00+fiwvlx8yHy+H
	 FPEL1XOkKOXMGqh6Bfqz5/2UK/JLFIebYNeyD3Py9ifGgwKxuh3nciV7LUQ0Cq0jbAYL3I+QdgUg
	 osj9JhVFAiZFlitqDHDzZ77tnMRY9FFKwt3mopiFj/OC2lMCpvvfKTZZuTSGvijY3HhnGuuZet/d
	 xfnrXPCFXWWoJ0LCQPJ0SA4zXfAFd6LZcyGpxrd4fkPmyFkKP9NnXrgUH7b1EJV27quWablS1Nwf
	 73NQ1BrX3deKSqcz35IRHKU1lXrfKHqGEwL1z1PbsrUCzlgPd5PjE503ZaAfwPwEedWsLoAAGqc/
	 QJk8JLSU9KrCg6yQIgUPF/NKq+LntQHqaQuBov4fIz3WsEWrkvB/zP6nKUMXM3xJt1XDV49NsN/q
	 PBG6qSsMdCREVd5li7LwhMvjI7d0RoPkvmbzH/V5ASRbH+3ex7S1Bonxyhe9s=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn
Subject: [PATCH v2] media: saa7164: add missing ioremap error handling
Date: Wed, 11 Mar 2026 19:44:30 +0800
X-OQ-MSGID: <20260311114430.85732-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 03669263108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55378-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid]
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
index a8a004f28ca0..bd4179d568cb 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -998,9 +998,21 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	/* PCI/e allocations */
 	dev->lmmio = ioremap(pci_resource_start(dev->pci, 0),
 			     pci_resource_len(dev->pci, 0));
+	if (!dev->lmmio) {
+		dev_err(&dev->pci->dev,
+				"failed to remap MMIO memory @ 0x%llx\n",
+				(u64)pci_resource_start(dev->pci, 0));
+		goto err_ioremap;
+	}
 
 	dev->lmmio2 = ioremap(pci_resource_start(dev->pci, 2),
 			     pci_resource_len(dev->pci, 2));
+	if (!dev->lmmio2) {
+		dev_err(&dev->pci->dev,
+				"failed to remap MMIO memory @ 0x%llx\n",
+				(u64)pci_resource_start(dev->pci, 2));
+		goto err_ioremap2;
+	}
 
 	dev->bmmio = (u8 __iomem *)dev->lmmio;
 	dev->bmmio2 = (u8 __iomem *)dev->lmmio2;
@@ -1019,6 +1031,23 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	saa7164_pci_quirks(dev);
 
 	return 0;
+err_ioremap2:
+	iounmap(dev->lmmio);
+err_ioremap:
+	/* Release the PCI memory regions allocated in get_resources() */
+	release_mem_region(pci_resource_start(dev->pci, 0),
+					   pci_resource_len(dev->pci, 0));
+
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


