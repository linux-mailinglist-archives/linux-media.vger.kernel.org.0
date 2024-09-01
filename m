Return-Path: <linux-media+bounces-17291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6AF967604
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 13:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0054B1F21925
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 11:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757C0170A23;
	Sun,  1 Sep 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ambKqIuQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pongbukj"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0B1448E3;
	Sun,  1 Sep 2024 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188813; cv=none; b=awuTdhF4TLK3bZpABKln6uztu6N1IwHmJOtyrHo3RjmVNvFbPc7BBP3eE78s/U186zK5DlQcX7rSflW7nvFlv78jOPdA2+Ep2qQF1zsP5qABGJ+txPnJxz7hLXOr4MGGMIKgXs4bB2VVhiVAzt5QQa7ssghe5zcYgQ3bywXhWp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188813; c=relaxed/simple;
	bh=WNkH3rG/XFrVs9DM1DbkYetZgsRKeBPRfFeQfbl6FOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8lIvo554IdXF1KLAdN+MVzLpyyGKf9LXMnZvzSC5xa0Je15PEYtX1FEWdHvxyAZS+EGUh8b/r73Oe8B/nmvU/renDIfqoTlVi8xvXQaAWQApSTAmlzMikz5UcwBJlIduSZnvjkdXOJKlg2IMTD+QC+kP7MiKxouJlCnbRzazmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ambKqIuQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pongbukj; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 94C3211400F9;
	Sun,  1 Sep 2024 07:06:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 01 Sep 2024 07:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725188810; x=
	1725275210; bh=FUbPo43QaNS1gJvAEY59E5ah95jo8legzZDUXAb30zE=; b=a
	mbKqIuQuNXS+hiG9sI5DASHYmU3mpIzif7mz7EEslG7UJui965LWoDx0m2ENt9MN
	3Dd/yS85OwlryX8ITiC+eqbQBjdeROIAKBUkc9uMJTI081fkPADVJOWJNQuuzgF8
	9KZuBg6RF+aGE2Lw3PfYFmOsJJOHKOOQ5CyflOpfNyEZJUX5MAbvLer6b+y7Z0fX
	LEgfMwTwuioBGWTAkaxZhFuPe/IbmJmdrRkmeujjQ9TAvc2ln7cB02tot2QOzVzi
	ZxSCk+Sq37x96IM8RdDcJsJwBtLTMXLvjKlpUB8JsdK/Vq72YKDxXcNF/KcAEZ/f
	hhibT3ofxUNKj9dCDWNdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725188810; x=
	1725275210; bh=FUbPo43QaNS1gJvAEY59E5ah95jo8legzZDUXAb30zE=; b=P
	ongbukjHAVn6sYMb7ciWZvuanZAQkflgRQk8lYZyaG5RUehpfcSHd0Q/RBYlUBEL
	uunmA0xlph+MCMWm44oih/il7SozH2zm0Wi5lAsXyNALZr1NBAcL+bt1uEJxu967
	awzHhhIC8ERrUNs1JN25T0+7r5qpf4lhKhjc7/xH7NWcz4r6eyTVEgn11y92aWtQ
	Xc5NyXEOuUQ4JKtHpvwORmrQl6/dGvfTBibk5iWZqwpj/MtraCNVGhQJ0NQCBcXq
	wibQQddGkkwxZ1bnKDQ70KVjcxYsxeY+rN8H5hN57/D/XdhAMyhznqgRS3FI3C+5
	7ic+6kVrnMZ6tJN9PykdA==
X-ME-Sender: <xms:ykrUZkaY1o5fVmvSuPlusHAGXiagKG0LzBkdxu7UvrUK8oclemrLig>
    <xme:ykrUZvbVq_pYAt21H-ahNVjhPRWshOrwJnG6PE4simywLR0XUbWJczFjOemLujQ_7
    7P0ADffpYjoJfNRBow>
X-ME-Received: <xmr:ykrUZu91jafJQ8lzqNuuLshgn-AoBpYhL9loeC8_IB4IapKkIgdCZ6RjfZneluU75vCg3PHKL-cnoGUfQQu3Xzm4UelPQQ6BRZ7yshzSDlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeghedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvg
    hlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphgr
    ihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepvggumhhunh
    gurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvg
    hvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ykrUZupcZ65ZF7wHkx9-qbLZYLY_PyVtJZDRADgFJnyuLWoA082_lQ>
    <xmx:ykrUZvqPeO8Hiy85kijtoQGO72YU2KEsrBqmjCB1ddwAuXAxUDyccA>
    <xmx:ykrUZsSFDk9CmXGnBxjhkmaZhAHB08Yr-zqNrLPWNBpv6yIwSLM6ow>
    <xmx:ykrUZvqdqnAqMt0NzWEL7ezIKyj9Bx0P5Qkp7iEet0M5oTrf888aIQ>
    <xmx:ykrUZrLJLiMbluTzr8emYDtHzbGG_L-4j8HOb59T3RF4IV4ckMMiS8Jk>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 07:06:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFT][PATCH 1/5] firewire: core: allocate workqueue to handle isochronous contexts in card
Date: Sun,  1 Sep 2024 20:06:38 +0900
Message-ID: <20240901110642.154523-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds a workqueue dedicated for isochronous context processing.

The workqueue is allocated per instance of fw_card structure to satisfy the
following characteristics descending from 1394 OHCI specification:

In 1394 OHCI specification, memory pages are reserved to each isochronous
context dedicated to DMA transmission. It allows to operate these
per-context pages concurrently, thus WQ_UNBOUND is specified. Additionally,
it is sleepable to operate the content of pages, thus WQ_BH is not used.

The isochronous context delivers the packets with time stamp, thus
WQ_HIGHPRI is specified for semi real-time data such as IEC 61883-1/6
protocol implemented by ALSA firewire stack. The isochronous context is not
used by the implementation of SCSI over IEEE1394 protocol (sbp2), thus
WQ_MEM_RECLAIM is not specified.

It is useful for users to adjust cpu affinity of the workqueue depending
on their work loads, thus WQ_SYS is specified to expose the attributes to
user space.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 31 ++++++++++++++++++++++++++++---
 drivers/firewire/core.h      |  4 ++--
 drivers/firewire/ohci.c      |  2 +-
 include/linux/firewire.h     |  2 ++
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index e80b762888fa..e0b8423fd4d0 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -571,11 +571,28 @@ void fw_card_initialize(struct fw_card *card,
 }
 EXPORT_SYMBOL(fw_card_initialize);
 
-int fw_card_add(struct fw_card *card,
-		u32 max_receive, u32 link_speed, u64 guid)
+int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
+		unsigned int supported_isoc_contexts)
 {
+	struct workqueue_struct *isoc_wq;
 	int ret;
 
+	// This workqueue should be:
+	//  * != WQ_BH			Sleepable.
+	//  * == WQ_UNBOUND		Any core can process data for isoc context. The
+	//				implementation of unit protocol could consumes the core
+	//				longer somehow.
+	//  * != WQ_MEM_RECLAIM		Not used for any backend of block device.
+	//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
+	//  * == WQ_SYSFS		Parameters are available via sysfs.
+	//  * max_active == n_it + n_ir	A hardIRQ could notify events for multiple isochronous
+	//				contexts if they are scheduled to the same cycle.
+	isoc_wq = alloc_workqueue("firewire-isoc-card%u",
+				  WQ_UNBOUND | WQ_HIGHPRI | WQ_SYSFS,
+				  supported_isoc_contexts, card->index);
+	if (!isoc_wq)
+		return -ENOMEM;
+
 	card->max_receive = max_receive;
 	card->link_speed = link_speed;
 	card->guid = guid;
@@ -584,9 +601,12 @@ int fw_card_add(struct fw_card *card,
 
 	generate_config_rom(card, tmp_config_rom);
 	ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
-	if (ret < 0)
+	if (ret < 0) {
+		destroy_workqueue(isoc_wq);
 		return ret;
+	}
 
+	card->isoc_wq = isoc_wq;
 	list_add_tail(&card->link, &card_list);
 
 	return 0;
@@ -708,6 +728,8 @@ void fw_core_remove_card(struct fw_card *card)
 {
 	struct fw_card_driver dummy_driver = dummy_driver_template;
 
+	might_sleep();
+
 	card->driver->update_phy_reg(card, 4,
 				     PHY_LINK_ACTIVE | PHY_CONTENDER, 0);
 	fw_schedule_bus_reset(card, false, true);
@@ -719,6 +741,7 @@ void fw_core_remove_card(struct fw_card *card)
 	dummy_driver.free_iso_context	= card->driver->free_iso_context;
 	dummy_driver.stop_iso		= card->driver->stop_iso;
 	card->driver = &dummy_driver;
+	drain_workqueue(card->isoc_wq);
 
 	scoped_guard(spinlock_irqsave, &card->lock)
 		fw_destroy_nodes(card);
@@ -727,6 +750,8 @@ void fw_core_remove_card(struct fw_card *card)
 	fw_card_put(card);
 	wait_for_completion(&card->done);
 
+	destroy_workqueue(card->isoc_wq);
+
 	WARN_ON(!list_empty(&card->transaction_list));
 }
 EXPORT_SYMBOL(fw_core_remove_card);
diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 57d101c01e36..96ae366889e0 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -115,8 +115,8 @@ struct fw_card_driver {
 
 void fw_card_initialize(struct fw_card *card,
 		const struct fw_card_driver *driver, struct device *device);
-int fw_card_add(struct fw_card *card,
-		u32 max_receive, u32 link_speed, u64 guid);
+int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
+		unsigned int supported_isoc_contexts);
 void fw_core_remove_card(struct fw_card *card);
 int fw_compute_block_crc(__be32 *block);
 void fw_schedule_bm_work(struct fw_card *card, unsigned long delay);
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index a3a37955b174..ad3bdc48f0f5 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -3825,7 +3825,7 @@ static int pci_probe(struct pci_dev *dev,
 		goto fail_msi;
 	}
 
-	err = fw_card_add(&ohci->card, max_receive, link_speed, guid);
+	err = fw_card_add(&ohci->card, max_receive, link_speed, guid, ohci->n_it + ohci->n_ir);
 	if (err)
 		goto fail_irq;
 
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 1cca14cf5652..10e135d60824 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -134,6 +134,8 @@ struct fw_card {
 	__be32 topology_map[(CSR_TOPOLOGY_MAP_END - CSR_TOPOLOGY_MAP) / 4];
 
 	__be32 maint_utility_register;
+
+	struct workqueue_struct *isoc_wq;
 };
 
 static inline struct fw_card *fw_card_get(struct fw_card *card)
-- 
2.43.0


