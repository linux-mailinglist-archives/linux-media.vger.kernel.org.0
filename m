Return-Path: <linux-media+bounces-56476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aChdDbLxvGls4wIAu9opvQ
	(envelope-from <linux-media+bounces-56476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:05:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B22D6699
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4D8307E851
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2E4359A6A;
	Fri, 20 Mar 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YFjyd2FB"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD634572B;
	Fri, 20 Mar 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990307; cv=none; b=rvGfd37esdhqGGEYD+OJV2HX+6yW06PqA6UD/jnJjDWVLRdqrFzas1irDhjneVL4Lyy/d1s+8LerhVisE1vt+vOYjPfUOaxViKwOYDVEanr1M27jgn39zYhjsSx/JbkNR0ipyUNEXUUxA5EFXWXGfo05S9Ys549fKi9ZUBDCUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990307; c=relaxed/simple;
	bh=bhG3+ejyfgREh/5n4GwjqSoOyMORTMNSPuX7d5gEKuk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=fNDkz/uVmW776q/LxbdRyGI0abwp2XwfAPerkWIR88E25pWOxhmD0+6Va+adcIswkfamN5uGHP+BvaECwteCF97cd7t90PVSRO6jrCki/J0bbDLCICCD5nw0pXp6cq5uCD40HNf2z0TjayX0HmirAkCyJbObqgoKFfYGY374d3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YFjyd2FB; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773990299; bh=5EyfsAtybbmg/tJsn3COKw4q7r7+MZy7e5S8MPIFPlU=;
	h=From:To:Cc:Subject:Date;
	b=YFjyd2FBwd3bJb3RyYExDFv8kF4iK/a4Gv3Xy9VKuTVV3RvMQTex2soPj0R6o3rJd
	 +OuFPxXk1xUtKZdo63hrVUTq+d1aJjx3xWZ4tFxJigLpYuxFFB6z/2EXlY3JaAosT8
	 LcnzGLUZ3HLBGdeZ+dfcWy6duaABc1sRbmNKKOGw=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 137892B0; Fri, 20 Mar 2026 15:04:55 +0800
X-QQ-mid: xmsmtpt1773990295t3aq98a3q
Message-ID: <tencent_8F418158FFC1397C04682081202253E8880A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GmJ6tVvoTTBzwSY9mMxX5NbqnrNt8vJFK0E2OIrFzggI8ejB8BG
	 2nmV8S8jhBF+4hH1LVs+FQ5iEHLtbhjqKfjlpHML7ACS6nO4PoX7wXH1lV7PuyDAc5UNZl+PVW8o
	 Bp6d8eBndPDQN2R3rYApbLv2P5FtV4d3Z/friFDF6uCHRvatdBDMvdT6pcsT7dbTlCpf/sKKlm9n
	 BXiFkOp1MEgKsNGMtctp9zcxAF8UJhJh90SJ21L0UKandtWyhZgKKDip93293iOk/qMA9MxQvLk+
	 /baXExvisZML+ggkhp6nsgv2jNNDcCsqbpttHteOpZjTsLINLlCJuH+lucyUeMBQWQrbq1z2+rzM
	 miK8BqMtc+fNli7sTQEQZQh+FWlUNgCc1+QzdyIks7dlUzXsTR4ytQRxEhmU1ruZEfTC55t9P5YA
	 i/Yoq+hTditn1eYlTGxSu8Dzr1jAxyPAjA1Z/TCs5DUsaOG7nljCZwMw31Q88dhEds9JFKM1WAmP
	 TTIbKSmv3OQp/WAOcckSnfswySr3mUUzgdVeXLgTXCUk6sz+4Mxn/5ek2OPu6MacCadhTBlrbGS/
	 bEnLdptBsLjM68+mxQDlTgU8XTChfZckLlRbHdyIveJuwprId3tSE6RPNwAl+rG9QhORCpkc7312
	 M8ZiLoYQL7boDsN2IA6NZP8L3F2pL1QcbGxPOexGgAt0EmMHq6k9VHdkkBFHTv9Llgagav/DLbBU
	 OmnxepFifMyZgak/AXxlJgYt5d+E+cO8cgRezOSZl7FmqOh6HJ8+IEjRrrMZCdr/RFdwISq/v8b9
	 Yaj1jduxaIMIL8ZvW5gRyW+coSaAaO4aQIf40icNAcqOBQitWMgEVyo3OkyNzBph5mSOLRuQVUvc
	 KJ3Wz1QT4JV71cjb1qk1CkLaollebhJOf9VWPCW7V1QLIMpwQ8s0+xng0ZDsxhs6iLEDyNyjXb3X
	 gwCUJwBQMqluzE2rDYWvkpZIq6nXG1GZUwXPEURI74pdbkKe130Vtf34E3Apz+xqkqvG8O1fg/Mp
	 rmltZoHAdipcJKEaQSQBsgddEDNtic75PApPfIKQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	Kees Cook <kees@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH] media: cx23885: add ioremap return check and cleanup
Date: Fri, 20 Mar 2026 15:04:53 +0800
X-OQ-MSGID: <20260320070453.614-1-1742789905@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56476-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com];
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
	NEURAL_HAM(-0.00)[-0.966];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C3B22D6699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a check for the return value of pci_ioremap_bar()
in cx23885_dev_setup().
If ioremap for BAR0 fails, release the already allocated
PCI memory region,
decrement the device count, and return -ENODEV.

This prevents a potential null pointer dereference and
ensures proper cleanup
on memory mapping failure.

Fixes: d19770e5178a ("V4L/DVB (6150): Add CX23885/CX23887 PCIe bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 0892a5fd137d..98878b6a448a 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -990,8 +990,12 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 	}
 
 	/* PCIe stuff */
-	dev->lmmio = ioremap(pci_resource_start(dev->pci, 0),
-			     pci_resource_len(dev->pci, 0));
+	dev->lmmio = pci_ioremap_bar(dev->pci, 0);
+	if (!dev->lmmio) {
+		dev_err(&dev->pci->dev, "CORE %s: can't ioremap MMIO memory\n",
+			dev->name);
+		goto err_release_region;
+	}
 
 	dev->bmmio = (u8 __iomem *)dev->lmmio;
 
@@ -1096,6 +1100,12 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 	}
 
 	return 0;
+
+err_release_region:
+	release_mem_region(pci_resource_start(dev->pci, 0),
+			   pci_resource_len(dev->pci, 0));
+	cx23885_devcount--;
+	return -ENODEV;
 }
 
 static void cx23885_dev_unregister(struct cx23885_dev *dev)
-- 
2.43.0


