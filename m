Return-Path: <linux-media+bounces-17586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCA96BD17
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FA9E1C2482E
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBED1DA624;
	Wed,  4 Sep 2024 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="M84nyQbf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aRZsavbO"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAA1DA0F9;
	Wed,  4 Sep 2024 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454326; cv=none; b=Es5kIpAWjen/wHtxzL1OvYtMkn1JdpFvTitIMx+l6WHp2ZeAUtfWZIO+MpKOPHH4u3ez4OooVc/ys/XCg/kcx7GDTDS4kdMA88y3Hz+PuEQgsLY6AosKMY9gfsytSNyG0TX8pWeuER9QKVNHdJcz22g2/HUQNFoVJteL26hmeA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454326; c=relaxed/simple;
	bh=C20p58o23RybaLCy7Uefjz1YpuuKQk3hZiEMinwkUsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARl2rFn9pRCLJGKnr4l650L7DaE8lgkVdWnSl9FbXN2CRQNhoMGDRhKXKFRQXkCE9NBfTtK4KUYbBX2kSkEL6a79VBQY4Cc3iDmfgNDA47TPpqyJTFsW78jvzxH3mJylhr4WONvflnXtrz2yw7r+dLjwoxuIn0X2u6AsOsrJZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=M84nyQbf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aRZsavbO; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 794DE1140186;
	Wed,  4 Sep 2024 08:52:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 04 Sep 2024 08:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725454323; x=
	1725540723; bh=WazlOufqSk7gZmSGDY67vvnRDePqJMEVBnNj+5hH5Go=; b=M
	84nyQbfT9DVLk71D5DyZzift/zyQqs6LglR2vfQl7GmyvW0+6KStvlRKPWvKnXX8
	zuci3u9Z2cg81VJ/qvKjKIRfqiJDCSjTmW6ap2q0gWZ79+FhL8laK8M0LOUy3qMR
	id6iGexfku7Z6aB/TUEI9ajQdQ6Khq1LV0KdeE/gTvA4GXMGLBoxDKxJKHJS7HIP
	28+oPFsOqRxyMqA9gOtCpYwkZCpw1HjP51b4JDEJZKqGwpiE1WONw+v28oY8lPzc
	y2uRrM4hA4mCot6/LaTPb5E/KtnP2/k6eRm8mTj66bq2OEbtQfJkmq6vjScMl0Ql
	8PJZA8JDYP96lClJoioOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725454323; x=
	1725540723; bh=WazlOufqSk7gZmSGDY67vvnRDePqJMEVBnNj+5hH5Go=; b=a
	RZsavbOtIbE5IXMDIDzWn88MPILbsCjfbnfJeB0GCvCVEQ4rQ4Xy9X7lqea/JRZs
	OZF7w+P/bBZpRCh8PsGQJIx/tIYUCCBBItiRnQJ53MgeWjlfDDtizuKm70VAhudE
	ytCdki4g8ym4t8hcvOxg2u70b9Pgox1AhkVg6x5QFmLWeyxXnCUP5xDZ8X9ga+3a
	KhXyixPsUwfJN1Jrlgp5e2EtFklIz/UnRZO86PNMszujo/yLaXIuM6E8t108a4F7
	Q0FvqexTHlavFEBcs4OFiuoD13EaSzc/DBZR3k4+jqaUn21EOsN6n0QfzvzxKOv/
	Gc1EpFdqe+jUYEaZkdIPA==
X-ME-Sender: <xms:81fYZhJFjusZo61BlCyn_TzFUXqmtTkPJ9B48ZdxSujJx0_8e_kQew>
    <xme:81fYZtKwL64pbC5UeKln7lpwGnkJrdjQV1fImiLd5V9m8zjxZ6j002QibyynAo51t
    06OHSa6vl5tJ7B_etY>
X-ME-Received: <xmr:81fYZptNIxhnEiZr_5sZZUItfz-7U2vaiHrDFyWS2L2PnWNvz8BTkZkGXI00LXo0lExtNLfP5WELUe9axBOWuAlyI8A-z39guRHGIAuvnNg3qA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrphgrihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhr
    tghpthhtohepvggumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:81fYZia5iDiOtKkynNoXT7io-gmPUC0bFLc8PC7UZwrakyoLS-BwfA>
    <xmx:81fYZoa92scdMEGVYNZFPAqtpEysy1PWvZykYTQYRkdGvPlCfbbJ1w>
    <xmx:81fYZmCy1wrP2r5KtQnf4ofa8cgeOXwB24mgNETf8WBVXSBILx9UNQ>
    <xmx:81fYZmbENot-fDe1-uC5Slmwl07y2os237VlgLi-va9X-LxAUnZMgA>
    <xmx:81fYZo4TD2uPZh3jwbOcy59QB4qkz83tHF0wqZBBS2F0g_dzYgtnOvq7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 08:52:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/5] firewire: core: allocate workqueue to handle isochronous contexts in card
Date: Wed,  4 Sep 2024 21:51:50 +0900
Message-ID: <20240904125155.461886-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
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
per-context pages concurrently. Software can schedule hardware interrupt
for several isochronous context to the same cycle, thus WQ_UNBOUND is
specified. Additionally, it is sleepable to operate the content of pages,
thus WQ_BH is not used.

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
 drivers/firewire/core-card.c | 33 ++++++++++++++++++++++++++++++---
 drivers/firewire/core.h      |  4 ++--
 drivers/firewire/ohci.c      |  2 +-
 include/linux/firewire.h     |  2 ++
 4 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index e80b762888fa..01354b9de8b2 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -571,11 +571,30 @@ void fw_card_initialize(struct fw_card *card,
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
+	//  * == WQ_FREEZABLE		Isochronous communication is at regular interval in real
+	//				time, thus should be drained if possible at freeze phase.
+	//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
+	//  * == WQ_SYSFS		Parameters are available via sysfs.
+	//  * max_active == n_it + n_ir	A hardIRQ could notify events for multiple isochronous
+	//				contexts if they are scheduled to the same cycle.
+	isoc_wq = alloc_workqueue("firewire-isoc-card%u",
+				  WQ_UNBOUND | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
+				  supported_isoc_contexts, card->index);
+	if (!isoc_wq)
+		return -ENOMEM;
+
 	card->max_receive = max_receive;
 	card->link_speed = link_speed;
 	card->guid = guid;
@@ -584,9 +603,12 @@ int fw_card_add(struct fw_card *card,
 
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
@@ -708,6 +730,8 @@ void fw_core_remove_card(struct fw_card *card)
 {
 	struct fw_card_driver dummy_driver = dummy_driver_template;
 
+	might_sleep();
+
 	card->driver->update_phy_reg(card, 4,
 				     PHY_LINK_ACTIVE | PHY_CONTENDER, 0);
 	fw_schedule_bus_reset(card, false, true);
@@ -719,6 +743,7 @@ void fw_core_remove_card(struct fw_card *card)
 	dummy_driver.free_iso_context	= card->driver->free_iso_context;
 	dummy_driver.stop_iso		= card->driver->stop_iso;
 	card->driver = &dummy_driver;
+	drain_workqueue(card->isoc_wq);
 
 	scoped_guard(spinlock_irqsave, &card->lock)
 		fw_destroy_nodes(card);
@@ -727,6 +752,8 @@ void fw_core_remove_card(struct fw_card *card)
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
index 3930fdd56155..50627b8fc38f 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -3827,7 +3827,7 @@ static int pci_probe(struct pci_dev *dev,
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


