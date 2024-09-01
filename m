Return-Path: <linux-media+bounces-17290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C619675FE
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 13:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D1801F219F2
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 11:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CF816A92E;
	Sun,  1 Sep 2024 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="pi8VD0Ye";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tj5Ar7Du"
X-Original-To: linux-media@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5ED1CD2A;
	Sun,  1 Sep 2024 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188812; cv=none; b=ERboOIXSuy+oGyFL+W/Xui/+T1qn/3dGc1/bd6+gywBAB/86fCGhvqLwL82ubnVfKBs2ic3GAHnqnfNhsODiA+fTdMAmIX1DomNKSRFNOa9VKmxnOFy3qld/lDs5Vo/ny5K3eiG6kkkEtxtAEG+P0be+yuWnShq9Z5x3a4WxIyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188812; c=relaxed/simple;
	bh=8EE//13VKyOOyKRwrbm4Wi/1OhvuxH0QAt9zH94+PAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRrrBOPql1XvV6+0dcBDMNC+lk7wtYtnnPKKDg4ECZBorOYHwu8ouyxbCH3e2dnkoGndJM5ecESXFjjQ/Ed7hDv8/T45JHK4ednbwxwH9JdZAShMnAgzH/nzQZQLGH/nn91S6WliAalY2kWff5PgkDZ83f1ZtpgCbcTiG5Ym+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=pi8VD0Ye; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tj5Ar7Du; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6E9FE13802B3;
	Sun,  1 Sep 2024 07:06:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 01 Sep 2024 07:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1725188808; x=1725275208; bh=fQaHGBYS2v
	UeI3Tw0ZhFpIQPr/E1ocVBSRnvZo0R4yM=; b=pi8VD0YeVzrO2hgD4uSGdtNyS8
	nKANw8iXQNIaCD8/ORWUifpyIjxpJmMj2AkOgfY9Wrmq+wZ6Q/FYVHkUj2ah5/cI
	FGGhw2pjNhfrcngpRZQyIO5N62HAaXqTIEBEZZWk8YinHes5lnVAFu52VJRCe4+x
	8CaYf9SaSk9KzV5YcM46ctM0yrv0Ktem/+7imPDft9+VX6oxxt03faQSuObDmdfl
	kDx66BjWb1z+k2cHqRH18SJgXG5pqO8KCz6f8/4f/Bl1TyjW1D4UQkCOeN+yxagL
	S58YgHHIgzMQFN6NEzRvF1KYN/TTVkf4RjqPH9KienFSW/yCW/UeVXZQ4+BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725188808; x=1725275208; bh=fQaHGBYS2vUeI3Tw0ZhFpIQPr/E1
	ocVBSRnvZo0R4yM=; b=tj5Ar7DuZLFwAg78ya0pbiOawfwX1328EZXN7ks0k4BH
	VM4h7VvuMZr9/mmEEbMm3BaBseTAd+CtkEZyVQ3nyib8TtoqyKO/e/NIlmpOFwAY
	pJdwaAF9vnASk4fnb6DkXXvZeU0qcqFkBdiMp9xbwEk8NT1fcSdVMUus5VzXGU8T
	gpv52/uAzJLnLm+9Kmut9BmWNgo75107q9oAtZ9ZX+0rGgjsPr1Do1J74ha7cHz6
	UwaZgmqMXmo5GzWw0tqiqppJP+nd8B9hW5TEk6e8M3KDxMhqkYwJEXnLAQNGAI44
	dg1VKl2TaOGNp/LdO5SxxZrlwcywo08BmTpBfEKpVQ==
X-ME-Sender: <xms:yErUZka4Ay8iJHswOOgnl1Rhu0pYdeZncMUCTPKIOzZ4TppnnDj9vQ>
    <xme:yErUZvZ1ojhUULeRl5acEnZOEGzD8CxaBd4SoKN_h5fnwe3hlVrqR5KjuyCCpno9g
    LoDLblXoi8TgrOBY-E>
X-ME-Received: <xmr:yErUZu-VTx1xv-67afizRcQdz6WhbVmV65-V5xAO10ggsjMA4jTwETLewEHTHHwVMn9Klbwjd2v2nk2VKcMzBaxkX7SW1CFVKaL8eWhEAWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeghedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohht
    ohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtth
    gvrhhnpefgtdfhteehtdevfedtheehtdduhfevleehueejieffteefvdfhgfetgeekheet
    ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhs
    rdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhn
    ugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphgrihhssehlihhnuh
    igrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepvggumhhunhgurdhrrghilhgv
    sehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yErUZur8zroL-5ZT1O1Y__ws_dU5ojuTzdIgPBFB44O6X8wf8wAIhw>
    <xmx:yErUZvqvV9Gz0kGrjQkRZ2E3cmWT9s6vuRCuWNqMDcd5YutIxtHe1A>
    <xmx:yErUZsQlz3HqLpNm10wqSyLWZl28fh4sdemxSlVYgEk579X_TsFDNA>
    <xmx:yErUZvq9bswMz4rMDuEtbzA7Jwq0B3scWs-7mXGwG3X1JbE_F6xRRA>
    <xmx:yErUZrJpDUyCvFu_KAkxm67d3wpgIn1eHKZWQnV9XScdyV1yEq4s9peq>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 07:06:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFT][PATCH 0/5] firewire: use sleepable workqueue to handle 1394 OHCI IT/IR context events
Date: Sun,  1 Sep 2024 20:06:37 +0900
Message-ID: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series of change is inspired by BH workqueue available in recent
kernel.

In Linux FireWire subsystem, tasklet softIRQ context has been utilized to
operate 1394 OHCI Isochronous Transmit (IT) and Isochronous Receive (IR)
contexts. The tasklet context is not preferable, as you know.

I have already received a proposal[1][2] to replace the usage of tasklet
with BH workqueue. However, the proposal includes bare replacement for 1394
OHCI IT, IR, Asynchronous Transmit (AT), and Asynchronous Receive (AR)
contexts with neither any care of actual usage for each context nor
practical test reports. In theory, this kind of change should be done by
step by step with enough amount of evaluation over software design to avoid
any disorder.

In this series of changes, the usage of tasklet for 1394 OHCI IT/IR
contexts is just replaced, as a first step. In 1394 OHCI IR/IT events,
software is expected to process the content of page dedicated to DMA
transmission for each isochronous context. It means that the content can be
processed concurrently per isochronous context. Additionally, the content
of page is immutable as long as the software schedules the transmission
again for the page. It means that the task to process the content can sleep
or be preempted. Due to the characteristics, BH workqueue is _not_ used.

At present, 1394 OHCI driver is responsible for the maintenance of tasklet
context, while in this series of change the core function is responsible
for the maintenance of workqueue and work items. This change is an attempt
to let each implementation focus on own task.

The change affects the following implementations of unit protocols which
operate isochronous contexts:

- firewire-net for IP over 1394 (RFC 2734/3146)
- firedtv
- drivers in ALSA firewire stack for IEC 61883-1/6
- user space applications

As long as reading their codes, the first two drivers look to require no
change. While the drivers in ALSA firewire stack require change to switch
the type of context in which callback is executed. The series of change
includes a patch for them to adapt to work process context.

Finally, these changes are tested by devices supported by ALSA firewire
stack with/without no-period-wakeup runtime of PCM substream. I also tested
examples in libhinoko[3] as samples of user space applications. Currently I
face no issue.

On the other hand, I have neither tested for firewire-net nor firedtv,
since I have never used these functions. If someone has any experience to
use them, I would request to test the change.

[1] https://lore.kernel.org/lkml/20240403144558.13398-1-apais@linux.microsoft.com/
[2] https://github.com/allenpais/for-6.9-bh-conversions/issues/1
[3] https://git.kernel.org/pub/scm/libs/ieee1394/libhinoko.git/


Regards

Takashi Sakamoto (5):
  firewire: core: allocate workqueue to handle isochronous contexts in
    card
  firewire: core: add local API for work items scheduled to workqueue
    specific to isochronous contexts
  firewire: ohci: process IT/IR events in sleepable work process to
    obsolete tasklet softIRQ
  firewire: core: non-atomic memory allocation for isochronous event to
    user client
  ALSA: firewire: use nonatomic PCM operation

 drivers/firewire/core-card.c             | 31 +++++++++++--
 drivers/firewire/core-cdev.c             |  4 +-
 drivers/firewire/core-iso.c              | 22 ++++++++-
 drivers/firewire/core.h                  | 14 +++++-
 drivers/firewire/ohci.c                  | 57 +++++++++++++++++++-----
 include/linux/firewire.h                 |  3 ++
 sound/firewire/amdtp-stream.c            |  9 +++-
 sound/firewire/bebob/bebob_pcm.c         |  1 +
 sound/firewire/dice/dice-pcm.c           |  1 +
 sound/firewire/digi00x/digi00x-pcm.c     |  1 +
 sound/firewire/fireface/ff-pcm.c         |  1 +
 sound/firewire/fireworks/fireworks_pcm.c |  1 +
 sound/firewire/isight.c                  |  1 +
 sound/firewire/motu/motu-pcm.c           |  1 +
 sound/firewire/oxfw/oxfw-pcm.c           |  1 +
 sound/firewire/tascam/tascam-pcm.c       |  1 +
 16 files changed, 128 insertions(+), 21 deletions(-)

-- 
2.43.0


