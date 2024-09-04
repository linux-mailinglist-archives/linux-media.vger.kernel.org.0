Return-Path: <linux-media+bounces-17585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB396BD14
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344921F263F0
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B541D9D94;
	Wed,  4 Sep 2024 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="iaPlb+a4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ET22MXwD"
X-Original-To: linux-media@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04AA1DA0F4;
	Wed,  4 Sep 2024 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454324; cv=none; b=K/wfngeAu4eF96az4fcWdpBNCG+DUgmd6nVvAhveT0qlqFu1M+UtLoBjh6TxvRMA4nGaF2TNu0bc2IS07LbIza1l9EjsE3MO/O5TIHOfQ8+kioC19vZYtWJ+rG2iOQDaV0m8KfedSzd7ubGwJtRgLJiWLq9gfgNK3zb+bmoRGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454324; c=relaxed/simple;
	bh=QwjFKh7knPAsUBg9vZKdhQxvZEVVvdQsABfIksWJp/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWgA/0BDUAIGII274E/tupfRt0XvIsfjJUraKH/jPuhUWuOwI0xAofUAmkqJPJjAaBob8fLcoomskBoke5SIW/pe6cxTa+AnQl6P+w8YMxZvr2oCyyWd6YpHKp0vEivJeI8xTQnGMzTN1u3CLWBUEf6OfWiKm1oSMAmwWCZ+QCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=iaPlb+a4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ET22MXwD; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D99C413801F7;
	Wed,  4 Sep 2024 08:52:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Sep 2024 08:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1725454320; x=1725540720; bh=rtJeKbajnw
	BMQkkm8Iq8uao/eRkVqmKTadD1J6GeV/k=; b=iaPlb+a4zN0/ozWD5Iw7MaIy7r
	TiYL8+0n0XtDeTVh0ydlfMBasv9DKSUja3mRsZwfDP/eYfdQCyQu8lhYKrMHvwi/
	o51woKa4EY87+i88DWiZfHiz+ErjmvnXpazGzNBwtDNA7rTpfzOWlMBOCA8jHXyQ
	SXh5ZcTvPLobsn5EDy7cLp8zqWuOD/FPQM3gzFXnu26rI9UdcRzpT+4cl6Va8m71
	Se6lJ3vOlbUz84lj+gyf549hey0XWTlt76cj6QwJRXG5QCpzf8umRVoQuMhOwm5l
	J8+qqg0e8Z8PaDyzdkJ5/zGpPipRKytm0uPD/9LJ3T4zEU1spP1xA9lKG7pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725454320; x=1725540720; bh=rtJeKbajnwBMQkkm8Iq8uao/eRkV
	qmKTadD1J6GeV/k=; b=ET22MXwDqXIapOI4EMTdv97n+/E9loGxrKTDzQan89Sr
	MreHqui32OxdpnnSQz5tDqzflrLb0tOiKoO4a7BQdr86uCs1kYNv/2JTUbfciabj
	q/OW6LIV4POZjbR7jHYdw6ES7sOMN5f+Ra3+ZxLf+CBgvWwm3ZXnwBmQLKOkbXhO
	ldkHW/G6XCBwDkYpw5HTDoHBIOxDk4hTTPmc2Fg4p7ud5i7Hq2Q7dwfl1ZUXX89Z
	T5hEyS7D4w3wysqQkvZae5PWRBeZTe7nJzSu5giB7vFXHDxtQhNGCq206UfvSDfz
	iC1lcuAQmyuePIXlFiQKNbylsDtUPcfk0rF3TfbTRQ==
X-ME-Sender: <xms:8FfYZtGtVXQHCXcczrjJLP2Esd2SDXp1Yo6KXYwAOLgMttVKMZaTFg>
    <xme:8FfYZiXkRkW5Kpi3RjWJOLTTflAwxsOYDKcyL_gJijJ03AnT51Zy9q1tCRbDrUmnf
    Wi7enWSP7lpmQXwFMo>
X-ME-Received: <xmr:8FfYZvK5pI9xkKevec5vZdK1eEnean7cBC1HRo2wa7Xqx-DKpwPArCGeGNKIitTZLaCDaeg_qTGwqKJzga-6BJZhSFxoFw8bGPCsxBTVNa8z-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohht
    ohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtth
    gvrhhnpeeggfehleehjeeileehveefkefhtdeffedtfeeghfekffetudevjeegkeevhfdv
    ueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
    hhhirdhjphdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhifigrihesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhunh
    gusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghprghisheslhhinhhu
    gidrmhhitghrohhsohhfthdrtghomhdprhgtphhtthhopegvughmuhhnugdrrhgrihhlvg
    esphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8FfYZjEELrQeBjbpsKlvRhxXOagEq6VyWUYmmYFBQMNDJJ_vcGGGcg>
    <xmx:8FfYZjWTy6Zb3XO4lLl1mGTMvAnMwixWHEE-x85V2blrZ45Y71TBEQ>
    <xmx:8FfYZuPnsRZmzPNnxn9gj_CKftzRmUfzOwPs00394l4JKttbgzialw>
    <xmx:8FfYZi0_95HWGdQIwNHkpYIjWOfltHwbZ8GuYCPjg87ApeolFfBJkw>
    <xmx:8FfYZqHB9VeRvUDCGq5F7xZXCNJPW3Ka6g9dYZ-DmVoqapYsXpYMyiZ2>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 08:51:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/5] firewire: use sleepable workqueue to handle 1394 OHCI IT/IR context events
Date: Wed,  4 Sep 2024 21:51:49 +0900
Message-ID: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series of changes updates my previous RFT[1] to apply for v6.12
kernel. For the detail, please refer to the previous one.

To Iwai-san, this series includes the change for sound subsystem as
well. All of changes are specific to ALSA firewire stack, so I would
like to send it to Linus as the part of firewire subsystem updates if
you do not mind it.

Changes from the RFT:
* WQ_FREEZABLE is newly supported in the workqueue
* Improve code comment in IEC 61883-1/6 packet streaming engine
* Avoid dead lock in the calls of workqueue sync API

[1] https://lore.kernel.org/lkml/20240901110642.154523-1-o-takashi@sakamocchi.jp/


Regards

Takashi Sakamoto (5):
  firewire: core: allocate workqueue to handle isochronous contexts in
    card
  firewire: core: add local API to queue work item to workqueue specific
    to isochronous contexts
  firewire: ohci: operate IT/IR events in sleepable work process instead
    of tasklet softIRQ
  firewire: core: non-atomic memory allocation for isochronous event to
    user client
  ALSA: firewire: use nonatomic PCM operation

 drivers/firewire/core-card.c             | 33 ++++++++++++--
 drivers/firewire/core-cdev.c             |  4 +-
 drivers/firewire/core-iso.c              | 30 ++++++++++++-
 drivers/firewire/core.h                  | 14 +++++-
 drivers/firewire/ohci.c                  | 57 +++++++++++++++++++-----
 include/linux/firewire.h                 |  3 ++
 sound/firewire/amdtp-stream.c            | 34 +++++++++++---
 sound/firewire/bebob/bebob_pcm.c         |  1 +
 sound/firewire/dice/dice-pcm.c           |  1 +
 sound/firewire/digi00x/digi00x-pcm.c     |  1 +
 sound/firewire/fireface/ff-pcm.c         |  1 +
 sound/firewire/fireworks/fireworks_pcm.c |  1 +
 sound/firewire/isight.c                  |  1 +
 sound/firewire/motu/motu-pcm.c           |  1 +
 sound/firewire/oxfw/oxfw-pcm.c           |  1 +
 sound/firewire/tascam/tascam-pcm.c       |  1 +
 16 files changed, 157 insertions(+), 27 deletions(-)

-- 
2.43.0


