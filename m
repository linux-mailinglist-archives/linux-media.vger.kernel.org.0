Return-Path: <linux-media+bounces-55825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JvDI6pTt2n1PwEAu9opvQ
	(envelope-from <linux-media+bounces-55825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:49:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903D29326D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FEBE3004422
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 00:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6400C21146C;
	Mon, 16 Mar 2026 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="l72C19X6"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58091EE7B7;
	Mon, 16 Mar 2026 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622160; cv=none; b=t+FXm+JlPQ9FrirSL7cHTeyBmy0F9BezUU6tl2M1l08k7wA/fRxDqt3RlUdrTS2bWjCbG9v38QrDh8VuAneW/ZnRpDrK2Lj7Uxpd7Ruw2Uv+qFMApebNKHkBu9vwgrdGNUTHcZBrW0whehY7TYsbgc87J2CkEtIWqfAy3yBQ9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622160; c=relaxed/simple;
	bh=P7sr7744rWBZuNKXE3ysOad6x1sqVLb87D9KOug6edE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=qd33Z6ZWAnP5b8W/cqtwVdgM2rqgLBlk9kIX7aauPQo10W1IkzzWh8EuTWxNLFbw4xiaKvdl8Kv9oYP+knX6bT47id489pPzS5fwoktHy+5jWHlWd60P6Fa7BGEUO6xy9jfAMDF1UbFZjoAstz0F9EkEvc0juEiTZ6S8/1DRm2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=l72C19X6; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773622149; bh=9jBg3jqCF1kbWlIOevv9//4WRhEcTPgrOPzJy0L+n0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l72C19X6g+ZN5/mP60AMU+9abwSzFnHSM2IzoqRS47yQb0ecjEWPPH7RLmhGTOw0/
	 BAxhjv9rf33DTVNO0XhtGkz8JwMeNhXbnrC9UXsmJHnMdERwTtdhuncz8xcsjtuxBx
	 S9r4OuRdT7W5dxferYXAmYREQ8B5vKGT4sMXEVYg=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id C398223C; Mon, 16 Mar 2026 08:48:57 +0800
X-QQ-mid: xmsmtpt1773622141tsrg5jwzr
Message-ID: <tencent_85434243050417195C47168AC3BA186EF305@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GmJ6tVvoTTBxAiLbUz7RGwyM2f1e4UfvizyWWMogtkdiabW7IF0
	 wxj8fFlswwEWLG/Nx9WGKZy/IqVPTfnTGnhnC+QgEh/JdwG4M8ypaLV3Peg63AnSKCZzmL2DHGVo
	 0pXvveGtxI+G/77Y4DA5WFXUdTLgM9DFAS5gSuwWm8H8gOmL91XWzuezCofKJ8glu1QOOc60DWV9
	 y5esZOmk8qgardeMj5coZiWe0kgy3dcHDyw8Qh6GVD2CbeRNQcZJ/sSF8cF1OM4uh2HjhfJ2bWgA
	 0aaBGaz7JM/g1/esv+Hc/jEXBWaHMG2SL2j37ZLFtvJLTbna/sTOHgWoA0Tb6OVvdTMDv9JhEizC
	 F0UkwSZQT4t5Ee2gFluWevgG0AIBjjF0gvr4jSRMNfoF2CdMHHLvH1Bh6lUcugmaEMDglK9syUeO
	 4duVrUeZV+NbA4UEEwP5A+3eXJI0nu2ZYvbo8Zr8ESZVTpW1GXzHH+a9vdHsrY3Yn10kxU9zcYbY
	 OooASidCaIQ2QSlykJKgAVQEcKLp3lkX7X/pvu8/hOSb6B0tqU6ZJAwsyHJxrQWi6WafpAE4cUsx
	 j9klnF74CRLLVWY1vdsmhOjq7+AfSB7/h4Bd87FBW4J5Nj8VSs5q9PRXdFtJzwQ/rK2+vEXcukcr
	 ZGzbkeXiNnxbcPbf/+5JZCLq5Gv6q6g/wkNOSswoX6XE2mLfkscHRyepJ2cEqYLcnAdO5pod3Yp2
	 aesR8kzHmIQ58ex0ulBEGotrJYXCSI5CuSu68BQKipe36Grn8wBypB8VWVAw5EE4J/6BLc1P7h6p
	 ejo4UQEQBCtzpmOtiBE+mWkClbKarjcGJTN2ssAQWjtIbJo8SnumwOE65xEgyWThUSnCclv+aRp3
	 qsGxm5+96B1weq+ZsRMi5n01YtH/3sstUmsQtqOQYyNQzI2PX10nV92bro7u31fDK1KAzS0Ix/nc
	 oxwsxyRIkqXXP7oMUMXHIDSc/8pRihTo9/ULR3d1Cjo9DVHd2D3xqTwvRwyTdtjiSVq1bA6Cuqxp
	 LUz+lBRjS1EbbwEeKsvuDKzKjRtkQxDvnuGZXUoPH5dEipSvkQg+tRtTE6R7E=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
Subject: [PATCH v5 1/1] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 08:48:18 +0800
X-OQ-MSGID: <20260316004854.1711-2-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316004854.1711-1-1742789905@qq.com>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
 <20260316004854.1711-1-1742789905@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55825-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 9903D29326D
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
index 74406d5ea0a5..b410e24c403c 100644
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
+	dev->lmmio = pci_ioremap_bar(dev->pci_dev, 0);
+	if (!dev->lmmio) {
+		dev_err(&dev->pci->dev, "Failed to remap MMIO BAR 0\n");
+		goto err_ioremap_bar0;
+	}
 
-	dev->lmmio2 = ioremap(pci_resource_start(dev->pci, 2),
-			     pci_resource_len(dev->pci, 2));
+	dev->lmmio = pci_ioremap_bar(dev->pci_dev, 2);
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


