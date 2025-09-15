Return-Path: <linux-media+bounces-42567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B709BB582F2
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73D9F3AD208
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794CA28C5D3;
	Mon, 15 Sep 2025 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QWBY8WrG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jih83UWE"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5550283682;
	Mon, 15 Sep 2025 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956233; cv=none; b=TLylKskIcH74BkBhfD9t1lJLlC418zJyv2TUvDMrk+jht0gt31Qf+FPWURHKOXlUwe/8JmkODMdVpGzdFZLJ/hpB3+zxdvpHvL+txFcgNmszRHhvWGVnFR8SYs0GI8sjw6BTdwitdSEh2giozazwePyg10OxTfdykchZfrZ2jP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956233; c=relaxed/simple;
	bh=PEwixX8LGpX429pCRznzR7ZNgr1hL3S4liJ6aLanZn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lJor4uDVlZ4LmVnud549fTxC+a+UPdkQNjwdyasgpo151TsLXBW8XhwXBnOreKyIyf3UaUv+CLOboswTzvkpkfN0+3mJzdqxHSJQr0xzhf85OvRuDp1k7FoKl9g1nemMUaakiiKq1KpvMNLEHs6P3fm1gJ7NhVYyUsjd8GtPtH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QWBY8WrG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jih83UWE; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8206B1D0019D;
	Mon, 15 Sep 2025 13:10:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 15 Sep 2025 13:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956227;
	 x=1758042627; bh=tQ5PkvvgeMjSfbL230X9aurlwCI/SS65UyUgggi2foU=; b=
	QWBY8WrGEIRzWvVqYfyhvO5CDYdUMOWI0JCJWRScBcrlpMU2+HDrL6CHq/mTPYNW
	l/bscBw+kM+K7XWY7cCoqivt8yjw11JzNJlVKrF4z58YK9ipK83f+DDHQZS3M0MR
	AZmvHQ2RKXsJf1GjKnCWs6M70Q/T2npKgkYWTG9xLaOLdmUcNH31wdgqA3ZrCAWq
	/z2xUbJD9350hY463/pNCoNK/v71Q8Xkp0CpfN2lw/D05BR69gq5dzuJ7HwnoOsm
	u9P0ru6vAv08hvpPIXC2wOt0m+dGXlbEyNyhffm7Jv/KY9DC0pv2R+gHZqxs8ZUU
	QvOcNc2vabhhhJVwm/z5Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956227; x=
	1758042627; bh=tQ5PkvvgeMjSfbL230X9aurlwCI/SS65UyUgggi2foU=; b=J
	ih83UWE//Fc8dg6KN8qjLbiBgizDKsoykKmgLnWeusPmHOadQ7cQZ3+5uncN6WD0
	5JQ2WqI7j8XMkj7TdQIXmwT26TsRLgDo7YdplQxAZP4HcBtXICarfdNFXBMr+kDS
	HnaWX0PAt+Oaf0CZAUti+3duPrpoZ8AAE2EBeYrUQ//qwrwOdUZeSXB5b/KXq45S
	bVov37UKihT5tZQIiNAkOm4p2Uwu6bsp+xN46Ao7o5JDBEH4G2UeUrP6/wlcB/jj
	i3Ll3sqAzR8N2kABF8V6NkEM2OEqBdZyRGQ+WlElBuwJ14cvREprCS5apGl+38HF
	gkOFy163cNtc3lzfLNNBA==
X-ME-Sender: <xms:gkjIaI-GvJPpNhVWfiIWyMErLmp8esYrkkVDZ5dL1JHl7QCuc1ChMA>
    <xme:gkjIaIUg2Mkrviqp_jbiIBFv07zuM5Q-dkbkU4JIT357kQA7IOYxAExjiAxHTAyHh
    aQlJt2N-SJUZDbkWUY>
X-ME-Received: <xmr:gkjIaLpRQv2hbHaoCBPBe3TbZ-9KEv-aONaujfatgtFAeVXIZmlF20zAquJ_JSw2AIsmVMSfLPmpFml9TMBillu3-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhgu
    odhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:g0jIaCmmrqHimCMkakCzxAb9IuqfwZwmLBRsXN7EKa8BGj9wvLqE4A>
    <xmx:g0jIaD2zWvHYZZU5cqpt1hwrBM4PQDE_EiWlFQ-CJnqGBwAuWg672A>
    <xmx:g0jIaHStIYt5SHFrMwXGlH55_iY1C5i4ESSezFlpwmgDTPc1a0_1fA>
    <xmx:g0jIaEwQ1d4kNAsEhHRuh54czQJyDPfecruZmfxbpiqhQTzFm_smRQ>
    <xmx:g0jIaJT-Drm4xMeqNnPGAQUgJja-6CkJ5tj4Q46_l7l1D2x55uqa_Mzj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:26 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 01/12] media: rppx1: Add framework to support Dreamchip RPPX1 ISP
Date: Mon, 15 Sep 2025 19:07:32 +0200
Message-ID: <20250915170743.106249-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a framework driver for Dreamchip RPPX1 ISP. The driver aims to
provide a framework for other V4L2 based drivers to drive the RPPX1
functionality. The reason for this split is that the RPPX1 IP itself do
not provide any DMA engines to drive data to/from the device, instead it
depends on other IP blocks to implement these features.

While the peripherals around the RPPX1 ISP used in different designs and
by different vendors are different the RPPX1 core itself is the same.
For this reason the framework solution to be able to split the Dreamchip
RPPX1 driver from vendors usage of it have been picked in hope to reduce
duplication of the common parts.

The functions provided by the RPPX1 is similar to what is exposed by
other ISP drivers already in tree (RkISP1 primarily), but the
implementation of them are different. It do however open up for the
possibility to reuse the RkISP1 parameter and statistics pixel formats
in an initial implementation.

The design is to try and keep the surface of this framework as small as
possible. The intention of this change is to be able to fill all needs
of this.

  * Two functions to create and destroy a RPPX1 instance, rppx1_create()
    and rppx1_destory(). These are intended to be called in the users
    probe and remove code paths.

  * Two functions to start and stop the RPPX1 processing, rppx1_start()
    and rppx1_stop(). These are intended to be called in the users
    stream on and stream off code paths.

  * One function to ask the RPPX1 to process parameters buffer prepared
    by user space, rppx1_params_rkisp1(). This is intended to translate
    the parameter buffer (RkISP1 format) to the register writes needed
    to be preformed on the RPPX1. The intention is to call this function
    when the parameter buffer is queued to the V4L2 driver and the
    result stored by the driver until the time it needs to be written to
    the RPPX1. It's the users responsibility to write it either using
    MMIO or other means.

  * One function to fill in a statistic buffer (RkISP1 format) based on
    the current status of the RPPX1, rppx1_stats_fill_isr(). The
    intention is that the user call's this in its interrupt handler when
    it knows the RPPX1 is done processing a frame.

  * One function to ack and retrieve the interrupts generated by the
    RPPX1, rppx1_interrupt(). The intention is to call this function
    when the users interrupt handler detects the RPPX1 have raised and
    interrupt. There is no need for the user to understand, or act, on
    the actual RPPX1 interrupt, but it can if it wants too.

The initial support in the framework is limited and do not implement any
ISP processing algorithms other then configuring the RPPX1 to process
any Bayer (8-, 10, or 12-bit) image and produce either a RGB or YUYV
output. It do however probe all function blocks of the RPPX1 and provide
an interface to interact with both parameter and statistic bufferers.
The user of the framework will not change as algorithms for the
different function blocks of the ISP are being added.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS                                   |   6 +
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/dreamchip/Kconfig      |   3 +
 drivers/media/platform/dreamchip/Makefile     |   6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |  11 +
 .../media/platform/dreamchip/rppx1/Makefile   |  33 ++
 .../platform/dreamchip/rppx1/rpp_module.c     |  40 +++
 .../platform/dreamchip/rppx1/rpp_module.h     | 157 ++++++++
 .../platform/dreamchip/rppx1/rpp_params.c     |  46 +++
 .../platform/dreamchip/rppx1/rpp_stats.c      |  15 +
 .../media/platform/dreamchip/rppx1/rppx1.c    | 337 ++++++++++++++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    |  99 +++++
 .../platform/dreamchip/rppx1/rppx1_acq.c      | 147 ++++++++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |  30 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |  52 +++
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |  80 +++++
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  59 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |  29 ++
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 106 ++++++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |  44 +++
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |  76 ++++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  51 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |  49 +++
 .../platform/dreamchip/rppx1/rppx1_hist.c     |  76 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |  46 +++
 .../media/platform/dreamchip/rppx1/rppx1_is.c |  42 +++
 .../platform/dreamchip/rppx1/rppx1_lin.c      |  60 ++++
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |  68 ++++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |  48 +++
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |  41 +++
 .../platform/dreamchip/rppx1/rppx1_outif.c    |  45 +++
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |  75 ++++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |  64 ++++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |  47 +++
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |  64 ++++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  61 ++++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |  26 ++
 include/media/rppx1.h                         |  33 ++
 39 files changed, 2274 insertions(+)
 create mode 100644 drivers/media/platform/dreamchip/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_params.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_stats.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_db.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_is.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
 create mode 100644 include/media/rppx1.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f3335f0f7c3c..8259af1904a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7469,6 +7469,12 @@ F:	drivers/block/drbd/
 F:	include/linux/drbd*
 F:	lib/lru_cache.c
 
+DREAMCHIP RPPX1 ISP
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/platform/dreamchip/rppx1/
+
 DRIVER COMPONENT FRAMEWORK
 L:	dri-devel@lists.freedesktop.org
 F:	drivers/base/component.c
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9287faafdce5..726309238dd1 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -70,6 +70,7 @@ source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/broadcom/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
 source "drivers/media/platform/chips-media/Kconfig"
+source "drivers/media/platform/dreamchip/Kconfig"
 source "drivers/media/platform/imagination/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6fd7db0541c7..3a34df769759 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -13,6 +13,7 @@ obj-y += atmel/
 obj-y += broadcom/
 obj-y += cadence/
 obj-y += chips-media/
+obj-y += dreamchip/
 obj-y += imagination/
 obj-y += intel/
 obj-y += marvell/
diff --git a/drivers/media/platform/dreamchip/Kconfig b/drivers/media/platform/dreamchip/Kconfig
new file mode 100644
index 000000000000..d177d4ee79ae
--- /dev/null
+++ b/drivers/media/platform/dreamchip/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/media/platform/dreamchip/rppx1/Kconfig"
diff --git a/drivers/media/platform/dreamchip/Makefile b/drivers/media/platform/dreamchip/Makefile
new file mode 100644
index 000000000000..ba47ba2d136e
--- /dev/null
+++ b/drivers/media/platform/dreamchip/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for the Dreamchip device drivers.
+#
+
+obj-y += rppx1/
diff --git a/drivers/media/platform/dreamchip/rppx1/Kconfig b/drivers/media/platform/dreamchip/rppx1/Kconfig
new file mode 100644
index 000000000000..8bac9fd8ed24
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_DCT_RPPX1
+	tristate "Dreamchip HDR RPP X1 High Dynamic Range Real-time Pixel Processor support library"
+	depends on V4L_PLATFORM_DRIVERS
+	help
+	  Support library for Dreamchip HDR RPP X1 High Dynamic Range Real-time
+	  Pixel Processor (RPP). The library can be used by other drivers who
+	  utilises the RPP as part of an ISP implementation.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rppx1.
diff --git a/drivers/media/platform/dreamchip/rppx1/Makefile b/drivers/media/platform/dreamchip/rppx1/Makefile
new file mode 100644
index 000000000000..b2bd6b5d68bc
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/Makefile
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+dct-rpp-x1-objs = \
+	rpp_module.o \
+	rpp_params.o \
+	rpp_stats.o \
+	rppx1.o \
+	rppx1_acq.o \
+	rppx1_awbg.o \
+	rppx1_bd.o \
+	rppx1_bdrgb.o \
+	rppx1_bls.o \
+	rppx1_cac.o \
+	rppx1_ccor.o \
+	rppx1_db.o \
+	rppx1_dpcc.o \
+	rppx1_exm.o \
+	rppx1_ga.o \
+	rppx1_hist.o \
+	rppx1_hist256.o \
+	rppx1_is.o \
+	rppx1_lin.o \
+	rppx1_lsc.o \
+	rppx1_ltm.o \
+	rppx1_ltmmeas.o \
+	rppx1_outif.o \
+	rppx1_outregs.o \
+	rppx1_rmap.o \
+	rppx1_rmapmeas.o \
+	rppx1_shrp.o \
+	rppx1_wbmeas.o \
+	rppx1_xyz2luv.o
+
+obj-$(CONFIG_VIDEO_DCT_RPPX1) += dct-rpp-x1.o
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.c b/drivers/media/platform/dreamchip/rppx1/rpp_module.c
new file mode 100644
index 000000000000..cd923b7ff5c1
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include <linux/slab.h>
+
+#include "rppx1.h"
+#include "rpp_module.h"
+
+int rpp_module_probe(struct rpp_module *mod, struct rppx1 *rpp,
+		     const struct rpp_module_ops *ops, u32 base)
+{
+	mod->rpp = rpp;
+	mod->base = base;
+	mod->ops = ops;
+
+	if (ops->probe)
+		return ops->probe(mod);
+
+	return 0;
+}
+
+void rpp_module_write(struct rpp_module *mod, u32 offset, u32 value)
+{
+	rppx1_write(mod->rpp, mod->base + offset, value);
+}
+
+u32 rpp_module_read(struct rpp_module *mod, u32 offset)
+{
+	return rppx1_read(mod->rpp, mod->base + offset);
+}
+
+void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value)
+{
+	u32 reg = rpp_module_read(mod, offset) & ~mask;
+
+	rpp_module_write(mod, offset, reg | value);
+}
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
new file mode 100644
index 000000000000..25869990948d
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#ifndef __RPPX1_MODULE_H__
+#define __RPPX1_MODULE_H__
+
+#include <linux/types.h>
+#include <linux/v4l2-mediabus.h>
+
+#include <linux/rkisp1-config.h>
+
+#include <media/rppx1.h>
+
+struct rpp_module_ops;
+
+enum rpp_raw_pattern {
+	RPP_RGGB = 0,
+	RPP_GRBG,
+	RPP_GBRG,
+	RPP_BGGR,
+};
+
+struct rpp_module {
+	struct rppx1 *rpp;
+	u32 base;
+
+	const struct rpp_module_ops *ops;
+
+	union {
+		struct {
+			enum rpp_raw_pattern raw_pattern;
+		} acq;
+		struct {
+			unsigned int colorbits;
+		} bdrgb;
+		struct {
+			unsigned int colorbits;
+		} bls;
+		struct {
+			unsigned int colorbits;
+			unsigned int type;
+		} ccor;
+		struct {
+			unsigned int colorbits;
+		} dpcc;
+		struct {
+			unsigned int resultbits;
+		} exm;
+		struct {
+			unsigned int colorbits;
+		} ga;
+		struct {
+			unsigned int colorbits;
+		} hist;
+		struct {
+			unsigned int colorbits;
+		} lin;
+		struct {
+			unsigned int colorbits_high;
+			unsigned int colorbits_low;
+		} rmap;
+		struct {
+			unsigned int colorbits_high;
+			unsigned int colorbits_low;
+		} rmapmeas;
+		struct {
+			unsigned int colorbits;
+		} shrp;
+		struct {
+			unsigned int colorbits;
+		} wbmeas;
+	} info;
+};
+
+int rpp_module_probe(struct rpp_module *mod, struct rppx1 *rpp,
+		     const struct rpp_module_ops *ops, u32 base);
+
+void rpp_module_write(struct rpp_module *mod, u32 offset, u32 value);
+u32 rpp_module_read(struct rpp_module *mod, u32 offset);
+void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
+
+union rppx1_params_rkisp1_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_ext_params_bls_config bls;
+	struct rkisp1_ext_params_dpcc_config dpcc;
+	struct rkisp1_ext_params_sdg_config sdg;
+	struct rkisp1_ext_params_lsc_config lsc;
+	struct rkisp1_ext_params_awb_gain_config awbg;
+	struct rkisp1_ext_params_flt_config flt;
+	struct rkisp1_ext_params_bdm_config bdm;
+	struct rkisp1_ext_params_ctk_config ctk;
+	struct rkisp1_ext_params_goc_config goc;
+	struct rkisp1_ext_params_dpf_config dpf;
+	struct rkisp1_ext_params_dpf_strength_config dpfs;
+	struct rkisp1_ext_params_cproc_config cproc;
+	struct rkisp1_ext_params_ie_config ie;
+	struct rkisp1_ext_params_awb_meas_config awbm;
+	struct rkisp1_ext_params_hst_config hst;
+	struct rkisp1_ext_params_aec_config aec;
+	struct rkisp1_ext_params_afc_config afc;
+};
+
+struct rpp_module_ops {
+	int (*probe)(struct rpp_module *mod);
+	int (*start)(struct rpp_module *mod, const struct v4l2_mbus_framefmt *fmt);
+
+	int (*param_rkisp1)(struct rpp_module *mod,
+			    const union rppx1_params_rkisp1_config *block,
+			    rppx1_reg_write write, void *priv);
+	int (*stats_rkisp1)(struct rpp_module *mod,
+			    struct rkisp1_cif_isp_stat *stats);
+};
+
+extern const struct rpp_module_ops rppx1_acq_ops;
+extern const struct rpp_module_ops rppx1_awbg_ops;
+extern const struct rpp_module_ops rppx1_bd_ops;
+extern const struct rpp_module_ops rppx1_bdrgb_ops;
+extern const struct rpp_module_ops rppx1_bls_ops;
+extern const struct rpp_module_ops rppx1_cac_ops;
+extern const struct rpp_module_ops rppx1_ccor_ops;
+extern const struct rpp_module_ops rppx1_ccor_csm_ops;
+extern const struct rpp_module_ops rppx1_db_ops;
+extern const struct rpp_module_ops rppx1_dpcc_ops;
+extern const struct rpp_module_ops rppx1_exm_ops;
+extern const struct rpp_module_ops rppx1_ga_ops;
+extern const struct rpp_module_ops rppx1_hist256_ops;
+extern const struct rpp_module_ops rppx1_hist_ops;
+extern const struct rpp_module_ops rppx1_is_ops;
+extern const struct rpp_module_ops rppx1_lin_ops;
+extern const struct rpp_module_ops rppx1_lsc_ops;
+extern const struct rpp_module_ops rppx1_ltm_ops;
+extern const struct rpp_module_ops rppx1_ltmmeas_ops;
+extern const struct rpp_module_ops rppx1_outif_ops;
+extern const struct rpp_module_ops rppx1_outregs_ops;
+extern const struct rpp_module_ops rppx1_rmapmeas_ops;
+extern const struct rpp_module_ops rppx1_rmap_ops;
+extern const struct rpp_module_ops rppx1_shrp_ops;
+extern const struct rpp_module_ops rppx1_wbmeas_ops;
+extern const struct rpp_module_ops rppx1_xyz2luv_ops;
+
+#define rpp_module_call(mod, op, args...)				\
+	({								\
+		struct rpp_module *__mod = (mod);			\
+		int __result;						\
+		if (!__mod)						\
+			__result = -ENODEV;				\
+		else if (!__mod->ops->op)				\
+			__result = 0;					\
+		else							\
+			__result = __mod->ops->op(__mod, ##args);	\
+		__result;						\
+	})
+
+#endif /* __RPPX1_MODULE_H__ */
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
new file mode 100644
index 000000000000..0bed0ee9d6f8
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rppx1.h"
+
+int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
+			rppx1_reg_write write, void *priv)
+{
+	size_t block_offset = 0;
+
+	if (WARN_ON(!cfg))
+		return -EINVAL;
+
+	/* Walk the list of parameter blocks and process them. */
+	while (block_offset < cfg->data_size) {
+		const union rppx1_params_rkisp1_config *block =
+			(const union rppx1_params_rkisp1_config *)&cfg->data[block_offset];
+		struct rpp_module *module;
+		int ret;
+
+		block_offset += block->header.size;
+
+		switch (block->header.type) {
+		default:
+			module = NULL;
+			break;
+		}
+
+		if (!module) {
+			pr_warn("Not handled RPPX1 block type: 0x%04x\n", block->header.type);
+			continue;
+		}
+
+		ret = rpp_module_call(module, param_rkisp1, block, write, priv);
+		if (ret) {
+			pr_err("Error processing RPPX1 block type: 0x%04x\n", block->header.type);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rppx1_params_rkisp1);
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
new file mode 100644
index 000000000000..a5daa28e09cf
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rppx1.h"
+
+void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
+{
+	struct rkisp1_stat_buffer *stats = buf;
+
+	stats->meas_type = 0;
+}
+EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
new file mode 100644
index 000000000000..c2a0deb4d253
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ *
+ * Support library for Dreamchip HDR RPPX1 High Dynamic Range Real-time Pixel
+ * Processor.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+
+#include "rppx1.h"
+
+/* RPP_HDR Base Addresses */
+#define HDRREGS_BASE				0x0000
+#define HDR_IRQ_BASE				0x0200
+#define RPP_OUT_BASE				0x0800
+#define RPP_RMAP_BASE				0x0c00
+#define RPP_RMAP_MEAS_BASE			0x1000
+#define RPP_MAIN_PRE1_BASE			0x2000
+#define RPP_MAIN_PRE2_BASE			0x4000
+#define RPP_MAIN_POST_BASE			0xa000
+#define RPP_MVOUT_BASE				0xc000
+#define RPP_FUSA_BASE				0xf000
+
+#define RPP_HDRREGS_VERSION_REG			(HDRREGS_BASE + 0x0000)
+#define RPP_HDR_UPD_REG				(HDRREGS_BASE + 0x0004)
+#define RESERVED_3_REG				(HDRREGS_BASE + 0x0008)
+#define RPP_HDR_INFORM_ENABLE_REG		(HDRREGS_BASE + 0x000c)
+#define RPP_HDR_OUT_IF_ON_REG			(HDRREGS_BASE + 0x0010)
+#define RPP_HDR_OUT_IF_OFF_REG			(HDRREGS_BASE + 0x0014)
+#define RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(HDRREGS_BASE + 0x0018)
+
+#define RPP_ISM					(HDR_IRQ_BASE + 0x00)
+#define RPP_RIS					(HDR_IRQ_BASE + 0x04)
+#define RPP_MIS					(HDR_IRQ_BASE + 0x08)
+#define RPP_ISC					(HDR_IRQ_BASE + 0x0c)
+
+/* RPP_OUT/MV_OUT Pipelines - Base Addresses */
+#define GAMMA_OUT_BASE				0x0000 /* HV, MV */
+#define IS_BASE					0x00c0 /* HV, MV */
+#define CSM_BASE				0x0100 /* HV, MV */
+#define OUT_IF_BASE				0x0200 /* HV, MV */
+#define RPP_OUTREGS_BASE			0x02c0 /* HV, MV */
+#define LUV_BASE				0x0300 /* MV */
+
+/* PRE1/PRE2/POST Pipelines - Base Addresses */
+#define ACQ_BASE				0x0080 /* PRE1, PRE2 */
+#define BLS_BASE				0x0100 /* PRE1, PRE2 */
+#define GAMMA_IN_BASE				0x0200 /* PRE1, PRE2 */
+#define LSC_BASE				0x0400 /* PRE1, PRE2 */
+#define AWB_GAIN_BASE				0x0500 /* PRE1, PRE2, POST */
+#define DPCC_BASE				0x0600 /* PRE1, PRE2 */
+#define DPF_BASE				0x0700 /* PRE1, PRE2 */
+#define FILT_BASE				0x0800 /* POST */
+#define CAC_BASE				0x0880 /* POST */
+#define CCOR_BASE				0x0900 /* POST */
+#define HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
+#define HIST256_BASE				0x0b00 /* PRE1 */
+#define EXM_BASE				0x0c00 /* PRE1, PRE2 */
+#define LTM_BASE				0x1000 /* POST */
+#define LTM_MEAS_BASE				0x1200 /* POST */
+#define WBMEAS_BASE				0x1700 /* POST */
+#define BDRGB_BASE				0x1800 /* POST */
+#define SHRP_BASE				0x1a00 /* POST */
+
+/* Functional Safety Module Base Addresses */
+#define FMU_BASE				0x0100
+
+#define RPP_HDR_FMU_FSM				(RPP_FUSA_BASE + FMU_BASE + 0x00)
+#define RPP_HDR_FMU_RFS				(RPP_FUSA_BASE + FMU_BASE + 0x04)
+#define RPP_HDR_FMU_MFS				(RPP_FUSA_BASE + FMU_BASE + 0x08)
+#define RPP_HDR_FMU_FSC				(RPP_FUSA_BASE + FMU_BASE + 0x0c)
+
+void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value)
+{
+	iowrite32(value, rpp->base + offset);
+}
+
+u32 rppx1_read(struct rppx1 *rpp, u32 offset)
+{
+	u32 ret = ioread32(rpp->base + offset);
+	return ret;
+}
+
+bool rppx1_interrupt(struct rppx1 *rpp, u32 *isc)
+{
+	u32 status, raw, fault;
+
+	fault = rppx1_read(rpp, RPP_HDR_FMU_MFS);
+	if (fault) {
+		pr_err("%s: fault 0x%08x\n", __func__, fault);
+		rppx1_write(rpp, RPP_HDR_FMU_FSC, fault);
+	}
+
+	/* Read raw interrupt status. */
+	raw = rppx1_read(rpp, RPP_RIS);
+	status = rppx1_read(rpp, RPP_MIS);
+
+	/* Propagate the isc status. */
+	if (isc)
+		*isc = status | raw;
+
+	/* Clear enabled interrupts */
+	rppx1_write(rpp, RPP_ISC, status);
+
+	return !!(status & RPPX1_IRQ_ID_OUT_FRAME);
+}
+EXPORT_SYMBOL_GPL(rppx1_interrupt);
+
+void rppx1_destroy(struct rppx1 *rpp)
+{
+	kfree(rpp);
+}
+EXPORT_SYMBOL_GPL(rppx1_destroy);
+
+/**
+ * Allocate the private data structure and verify the hardware is present.
+ */
+struct rppx1 *rppx1_create(void __iomem *base)
+{
+	struct rppx1 *rpp;
+	u32 reg;
+
+	/* Allocate library structure */
+	rpp = kzalloc(sizeof(*rpp), GFP_KERNEL);
+	if (!rpp)
+		return NULL;
+
+	rpp->base = base;
+
+	/* Check communication with RPP and verify it truly is a X1. */
+	reg = rppx1_read(rpp, RPP_HDRREGS_VERSION_REG);
+	if (reg != 3) {
+		pr_err("Unsupported HDR version (%u)\n", reg);
+		rppx1_destroy(rpp);
+		return NULL;
+	}
+
+	/* Probe the PRE1 pipeline. */
+	if (rpp_module_probe(&rpp->pre1.acq, rpp, &rppx1_acq_ops,
+			     RPP_MAIN_PRE1_BASE + ACQ_BASE) ||
+	    rpp_module_probe(&rpp->pre1.bls, rpp, &rppx1_bls_ops,
+			     RPP_MAIN_PRE1_BASE + BLS_BASE) ||
+	    rpp_module_probe(&rpp->pre1.lin, rpp, &rppx1_lin_ops,
+			     RPP_MAIN_PRE1_BASE + GAMMA_IN_BASE) ||
+	    rpp_module_probe(&rpp->pre1.lsc, rpp, &rppx1_lsc_ops,
+			     RPP_MAIN_PRE1_BASE + LSC_BASE) ||
+	    rpp_module_probe(&rpp->pre1.awbg, rpp, &rppx1_awbg_ops,
+			     RPP_MAIN_PRE1_BASE + AWB_GAIN_BASE) ||
+	    rpp_module_probe(&rpp->pre1.dpcc, rpp, &rppx1_dpcc_ops,
+			     RPP_MAIN_PRE1_BASE + DPCC_BASE) ||
+	    rpp_module_probe(&rpp->pre1.bd, rpp, &rppx1_bd_ops,
+			     RPP_MAIN_PRE1_BASE + DPF_BASE) ||
+	    rpp_module_probe(&rpp->pre1.hist, rpp, &rppx1_hist_ops,
+			     RPP_MAIN_PRE1_BASE + HIST_BASE) ||
+	    rpp_module_probe(&rpp->pre1.hist256, rpp, &rppx1_hist256_ops,
+			     RPP_MAIN_PRE1_BASE + HIST256_BASE) ||
+	    rpp_module_probe(&rpp->pre1.exm, rpp, &rppx1_exm_ops,
+			     RPP_MAIN_PRE1_BASE + EXM_BASE))
+		goto err;
+
+	/* Probe the PRE2 pipeline. */
+	if (rpp_module_probe(&rpp->pre2.acq, rpp, &rppx1_acq_ops,
+			     RPP_MAIN_PRE2_BASE + ACQ_BASE) ||
+	    rpp_module_probe(&rpp->pre2.bls, rpp, &rppx1_bls_ops,
+			     RPP_MAIN_PRE2_BASE + BLS_BASE) ||
+	    rpp_module_probe(&rpp->pre2.lin, rpp, &rppx1_lin_ops,
+			     RPP_MAIN_PRE2_BASE + GAMMA_IN_BASE) ||
+	    rpp_module_probe(&rpp->pre2.lsc, rpp, &rppx1_lsc_ops,
+			     RPP_MAIN_PRE2_BASE + LSC_BASE) ||
+	    rpp_module_probe(&rpp->pre2.awbg, rpp, &rppx1_awbg_ops,
+			     RPP_MAIN_PRE2_BASE + AWB_GAIN_BASE) ||
+	    rpp_module_probe(&rpp->pre2.dpcc, rpp, &rppx1_dpcc_ops,
+			     RPP_MAIN_PRE2_BASE + DPCC_BASE) ||
+	    rpp_module_probe(&rpp->pre2.bd, rpp, &rppx1_bd_ops,
+			     RPP_MAIN_PRE2_BASE + DPF_BASE) ||
+	    rpp_module_probe(&rpp->pre2.hist, rpp, &rppx1_hist_ops,
+			     RPP_MAIN_PRE2_BASE + HIST_BASE) ||
+	    rpp_module_probe(&rpp->pre2.exm, rpp, &rppx1_exm_ops,
+			     RPP_MAIN_PRE2_BASE + EXM_BASE))
+		goto err;
+
+	/* Probe the POST pipeline. */
+	if (rpp_module_probe(&rpp->post.awbg, rpp, &rppx1_awbg_ops,
+			     RPP_MAIN_POST_BASE + AWB_GAIN_BASE) ||
+	    rpp_module_probe(&rpp->post.ccor, rpp, &rppx1_ccor_ops,
+			     RPP_MAIN_POST_BASE + CCOR_BASE) ||
+	    rpp_module_probe(&rpp->post.hist, rpp, &rppx1_hist_ops,
+			     RPP_MAIN_POST_BASE + HIST_BASE) ||
+	    rpp_module_probe(&rpp->post.db, rpp, &rppx1_db_ops,
+			     RPP_MAIN_POST_BASE + FILT_BASE) ||
+	    rpp_module_probe(&rpp->post.cac, rpp, &rppx1_cac_ops,
+			     RPP_MAIN_POST_BASE + CAC_BASE) ||
+	    rpp_module_probe(&rpp->post.ltm, rpp, &rppx1_ltm_ops,
+			     RPP_MAIN_POST_BASE + LTM_BASE) ||
+	    rpp_module_probe(&rpp->post.ltmmeas, rpp, &rppx1_ltmmeas_ops,
+			     RPP_MAIN_POST_BASE + LTM_MEAS_BASE) ||
+	    rpp_module_probe(&rpp->post.wbmeas, rpp, &rppx1_wbmeas_ops,
+			     RPP_MAIN_POST_BASE + WBMEAS_BASE) ||
+	    rpp_module_probe(&rpp->post.bdrgb, rpp, &rppx1_bdrgb_ops,
+			     RPP_MAIN_POST_BASE + BDRGB_BASE) ||
+	    rpp_module_probe(&rpp->post.shrp, rpp, &rppx1_shrp_ops,
+			     RPP_MAIN_POST_BASE + SHRP_BASE))
+		goto err;
+
+	/* Probe the Human Vision pipeline. */
+	if (rpp_module_probe(&rpp->hv.ga, rpp, &rppx1_ga_ops,
+			     RPP_OUT_BASE + GAMMA_OUT_BASE) ||
+	    rpp_module_probe(&rpp->hv.is, rpp, &rppx1_is_ops,
+			     RPP_OUT_BASE + IS_BASE) ||
+	    rpp_module_probe(&rpp->hv.ccor, rpp, &rppx1_ccor_csm_ops,
+			     RPP_OUT_BASE + CSM_BASE) ||
+	    rpp_module_probe(&rpp->hv.outif, rpp, &rppx1_outif_ops,
+			     RPP_OUT_BASE + OUT_IF_BASE) ||
+	    rpp_module_probe(&rpp->hv.outregs, rpp, &rppx1_outregs_ops,
+			     RPP_OUT_BASE + RPP_OUTREGS_BASE))
+		goto err;
+
+	/* Probe the Machine Vision pipeline. */
+	if (rpp_module_probe(&rpp->mv.ga, rpp, &rppx1_ga_ops,
+			     RPP_MVOUT_BASE + GAMMA_OUT_BASE) ||
+	    rpp_module_probe(&rpp->mv.is, rpp, &rppx1_is_ops,
+			     RPP_MVOUT_BASE + IS_BASE) ||
+	    rpp_module_probe(&rpp->mv.ccor, rpp, &rppx1_ccor_csm_ops,
+			     RPP_MVOUT_BASE + CSM_BASE) ||
+	    rpp_module_probe(&rpp->mv.outif, rpp, &rppx1_outif_ops,
+			     RPP_MVOUT_BASE + OUT_IF_BASE) ||
+	    rpp_module_probe(&rpp->mv.outregs, rpp, &rppx1_outregs_ops,
+			     RPP_MVOUT_BASE + RPP_OUTREGS_BASE) ||
+	    rpp_module_probe(&rpp->mv.xyz2luv, rpp, &rppx1_xyz2luv_ops,
+			     RPP_MVOUT_BASE + LUV_BASE))
+		goto err;
+
+	/* Probe the standalone Radiance Mapping modules. */
+	if (rpp_module_probe(&rpp->rmap, rpp, &rppx1_rmap_ops,
+			     RPP_RMAP_BASE) ||
+	    rpp_module_probe(&rpp->rmapmeas, rpp, &rppx1_rmapmeas_ops,
+			     RPP_RMAP_MEAS_BASE))
+		goto err;
+
+	return rpp;
+err:
+	rppx1_destroy(rpp);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(rppx1_create);
+
+int rppx1_start(struct rppx1 *rpp,
+		const struct v4l2_mbus_framefmt *input,
+		const struct v4l2_mbus_framefmt *hv,
+		const struct v4l2_mbus_framefmt *mv)
+{
+	if (rpp_module_call(&rpp->pre1.acq, start, input) ||
+	    rpp_module_call(&rpp->pre1.bls, start, input) ||
+	    rpp_module_call(&rpp->pre1.lin, start, input) ||
+	    rpp_module_call(&rpp->pre1.lsc, start, input) ||
+	    rpp_module_call(&rpp->pre1.awbg, start, input) ||
+	    rpp_module_call(&rpp->pre1.dpcc, start, input) ||
+	    rpp_module_call(&rpp->pre1.bd, start, input) ||
+	    rpp_module_call(&rpp->pre1.hist, start, input) ||
+	    rpp_module_call(&rpp->pre1.exm, start, input) ||
+	    rpp_module_call(&rpp->pre1.hist256, start, input))
+		return -EINVAL;
+
+	if (rpp_module_call(&rpp->rmap, start, NULL) ||
+	    rpp_module_call(&rpp->rmapmeas, start, NULL))
+		return -EINVAL;
+
+	if (rpp_module_call(&rpp->post.awbg, start, input) ||
+	    rpp_module_call(&rpp->post.db, start, input) ||
+	    rpp_module_call(&rpp->post.cac, start, input) ||
+	    rpp_module_call(&rpp->post.ccor, start, input) ||
+	    rpp_module_call(&rpp->post.ltm, start, input) ||
+	    rpp_module_call(&rpp->post.bdrgb, start, input) ||
+	    rpp_module_call(&rpp->post.shrp, start, input) ||
+	    rpp_module_call(&rpp->post.ltmmeas, start, input) ||
+	    rpp_module_call(&rpp->post.wbmeas, start, input) ||
+	    rpp_module_call(&rpp->post.hist, start, input))
+		return -EINVAL;
+
+	if (hv && (rpp_module_call(&rpp->hv.ga, start, hv) ||
+		   rpp_module_call(&rpp->hv.ccor, start, hv) ||
+		   rpp_module_call(&rpp->hv.outregs, start, hv) ||
+		   rpp_module_call(&rpp->hv.is, start, hv) ||
+		   rpp_module_call(&rpp->hv.outif, start, hv)))
+		return -EINVAL;
+
+	if (mv && (rpp_module_call(&rpp->mv.ga, start, mv) ||
+		   rpp_module_call(&rpp->mv.ccor, start, mv) ||
+		   rpp_module_call(&rpp->mv.xyz2luv, start, mv) ||
+		   rpp_module_call(&rpp->mv.outregs, start, mv) ||
+		   rpp_module_call(&rpp->mv.is, start, mv) ||
+		   rpp_module_call(&rpp->mv.outif, start, mv)))
+		return -EINVAL;
+
+	rppx1_write(rpp, RPP_HDR_UPD_REG, 0x00000001);
+
+	/* Clear fault interrupts. */
+	rppx1_write(rpp, RPP_HDR_SAFETY_ACCESS_PROTECTION_REG, 0x00000001);
+	rppx1_write(rpp, RPP_HDR_FMU_FSM, 0x000001c0);
+	rppx1_write(rpp, RPP_HDR_FMU_FSC, rppx1_read(rpp, RPP_HDR_FMU_MFS));
+	rppx1_write(rpp, RPP_HDR_SAFETY_ACCESS_PROTECTION_REG, 0x00000000);
+
+	/* Set interrupt mask. */
+	rppx1_write(rpp, RPP_ISM, RPPX1_IRQ_ID_OUT_FRAME);
+
+	rppx1_write(rpp, RPP_HDR_UPD_REG, 0x00000001);
+	rppx1_write(rpp, RPP_HDR_UPD_REG, 0x00000002);
+
+	/* Clear any pending interrupts. */
+	rppx1_interrupt(rpp, NULL);
+
+	/* Enable input formatters. */
+	rppx1_write(rpp, RPP_HDR_INFORM_ENABLE_REG, 1);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rppx1_start);
+
+int rppx1_stop(struct rppx1 *rpp)
+{
+	/* Disable input formatters. */
+	rppx1_write(rpp, RPP_HDR_INFORM_ENABLE_REG, 0);
+
+	/* Clear any pending interrupts. */
+	rppx1_interrupt(rpp, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rppx1_stop);
+
+MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
+MODULE_DESCRIPTION("Dreamchip HDR RPPX1 support library");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
new file mode 100644
index 000000000000..dcf43826d308
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __MEDIA_RPPX1_H__
+#define __MEDIA_RPPX1_H__
+
+#include <linux/types.h>
+
+#include "rpp_module.h"
+
+#define RPPX1_IRQ_ID_256HIST			BIT(27)
+#define RPPX1_IRQ_ID_PRE2_DPCC			BIT(25)
+#define RPPX1_IRQ_ID_PRE1_DPCC			BIT(24)
+#define RPPX1_IRQ_ID_MV_OUT_FRAME_OUT		BIT(23)
+#define RPPX1_IRQ_ID_MV_OUT_OFF			BIT(22)
+#define RPPX1_IRQ_ID_POST_AWB_MEAS		BIT(21)
+#define RPPX1_IRQ_ID_POST_HIST_MEAS		BIT(20)
+#define RPPX1_IRQ_ID_POST_TM			BIT(19)
+#define RPPX1_IRQ_ID_PRE1_EXM			BIT(18)
+#define RPPX1_IRQ_ID_PRE1_HIST			BIT(17)
+#define RPPX1_IRQ_ID_PRE1_FRAME_IN		BIT(16)
+#define RPPX1_IRQ_ID_PRE1_HSTART		BIT(15)
+#define RPPX1_IRQ_ID_PRE1_VSTART		BIT(14)
+#define RPPX1_IRQ_ID_PRE2_EXM			BIT(13)
+#define RPPX1_IRQ_ID_PRE2_HIST			BIT(12)
+#define RPPX1_IRQ_ID_PRE2_FRAME_IN		BIT(11)
+#define RPPX1_IRQ_ID_PRE2_HSTART		BIT(10)
+#define RPPX1_IRQ_ID_PRE2_VSTART		BIT(9)
+#define RPPX1_IRQ_ID_OUT_FRAME			BIT(3)
+#define RPPX1_IRQ_ID_OUT_OFF			BIT(2)
+#define RPPX1_IRQ_ID_RMAP_MEAS			BIT(1)
+#define RPPX1_IRQ_ID_RMAP_DONE			BIT(0)
+
+struct rppx1 {
+	struct device *dev;
+	void __iomem *base;
+
+	struct {
+		struct rpp_module acq;
+		struct rpp_module bls;
+		struct rpp_module lin;
+		struct rpp_module lsc;
+		struct rpp_module awbg;
+		struct rpp_module dpcc;
+		struct rpp_module bd;
+		struct rpp_module hist;
+		struct rpp_module hist256;
+		struct rpp_module exm;
+	} pre1;
+
+	struct {
+		struct rpp_module acq;
+		struct rpp_module bls;
+		struct rpp_module lin;
+		struct rpp_module lsc;
+		struct rpp_module awbg;
+		struct rpp_module dpcc;
+		struct rpp_module bd;
+		struct rpp_module hist;
+		struct rpp_module exm;
+	} pre2;
+
+	struct {
+		struct rpp_module awbg;
+		struct rpp_module ccor;
+		struct rpp_module hist;
+		struct rpp_module db;
+		struct rpp_module cac;
+		struct rpp_module ltm;
+		struct rpp_module ltmmeas;
+		struct rpp_module wbmeas;
+		struct rpp_module bdrgb;
+		struct rpp_module shrp;
+	} post;
+
+	struct {
+		struct rpp_module ga;
+		struct rpp_module is;
+		struct rpp_module ccor;
+		struct rpp_module outif;
+		struct rpp_module outregs;
+	} hv;
+
+	struct {
+		struct rpp_module ga;
+		struct rpp_module is;
+		struct rpp_module ccor;
+		struct rpp_module outif;
+		struct rpp_module outregs;
+		struct rpp_module xyz2luv;
+	} mv;
+
+	struct rpp_module rmap;
+	struct rpp_module rmapmeas;
+};
+
+void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value);
+u32 rppx1_read(struct rppx1 *rpp, u32 offset);
+
+#endif /* __MEDIA_RPPX1_H__ */
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_acq.c b/drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
new file mode 100644
index 000000000000..45f619ccb684
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define ACQ_VERSION_REG				0x0000
+
+#define ACQ_CTRL_REG				0x0004
+#define ACQ_CTRL_ALTERNATIVE_CFG_MODE_ENABLE	BIT(8)
+#define ACQ_CTRL_RPP_MODE_MASK			GENMASK(3, 1)
+#define ACQ_CTRL_RPP_MODE_RAWBT601		(0 << 1)
+#define ACQ_CTRL_RPP_MODE_BT656			(1 << 1)
+#define ACQ_CTRL_RPP_MODE_BT601			(2 << 1)
+#define ACQ_CTRL_RPP_MODE_BAYER			(3 << 1)
+#define ACQ_CTRL_RPP_MODE_DATA			(4 << 1)
+#define ACQ_CTRL_RPP_MODE_BAYERRGB		(5 << 1)
+#define ACQ_CTRL_RPP_MODE_RAWBT656		(6 << 1)
+#define ACQ_CTRL_INFORM_EN_ENABLE		BIT(0)
+
+#define ACQ_PROP_REG				0x0008
+
+#define ACQ_PROP_SENSOR_IN_LSB_ALIGNED_IN_LSB	BIT(30)
+#define ACQ_PROP_YUV_OUT_SEL			BIT(25)
+#define ACQ_PROP_MUX_DMA_SEL			BIT(24)
+#define ACQ_PROP_SECOND_INPUT_TYPE		BIT(18)
+#define ACQ_PROP_LATENCY_FIFO_INPUT_SELECTION	BIT(15)
+#define ACQ_PROP_INPUT_SELECTION_MASK		GENMASK(14, 12)
+#define ACQ_PROP_INPUT_SELECTION_8BIT		(0 << 12)
+#define ACQ_PROP_INPUT_SELECTION_10BIT		(1 << 12)
+#define ACQ_PROP_INPUT_SELECTION_12BIT		(2 << 12)
+#define ACQ_PROP_BAYER_PAT_MASK			GENMASK(4, 3)
+#define ACQ_PROP_BAYER_PAT_RGRG			(0 << 3)
+#define ACQ_PROP_BAYER_PAT_GRGR			(1 << 3)
+#define ACQ_PROP_BAYER_PAT_GBGB			(2 << 3)
+#define ACQ_PROP_BAYER_PAT_BGBG			(3 << 3)
+#define ACQ_PROP_VSYNC_POL			BIT(2)
+#define ACQ_PROP_HSYNC_POL			BIT(1)
+#define ACQ_PROP_SAMPLE_EDGE			BIT(0)
+
+#define ACQ_H_OFFS_REG				0x000c
+#define ACQ_V_OFFS_REG				0x0010
+#define ACQ_H_SIZE_REG				0x0014
+#define ACQ_V_SIZE_REG				0x0018
+#define ACQ_OUT_H_OFFS_REG			0x001c
+#define ACQ_OUT_V_OFFS_REG			0x0020
+#define ACQ_OUT_H_SIZE_REG			0x0024
+#define ACQ_OUT_V_SIZE_REG			0x0028
+#define FLAGS_SHD_REG				0x002c
+#define ACQ_OUT_H_OFFS_SHD_REG			0x0030
+#define ACQ_OUT_V_OFFS_SHD_REG			0x0034
+#define ACQ_OUT_H_SIZE_SHD_REG			0x0038
+#define ACQ_OUT_V_SIZE_SHD_REG			0x003c
+
+static int rppx1_acq_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, ACQ_VERSION_REG) != 0x0b)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rppx1_acq_start(struct rpp_module *mod,
+			   const struct v4l2_mbus_framefmt *fmt)
+{
+	u32 bayerpat, selection;
+
+	rpp_module_clrset(mod, ACQ_CTRL_REG, ACQ_CTRL_RPP_MODE_MASK,
+			  ACQ_CTRL_RPP_MODE_BAYER);
+
+	rpp_module_write(mod, ACQ_H_OFFS_REG, 0);
+	rpp_module_write(mod, ACQ_V_OFFS_REG, 0);
+	rpp_module_write(mod, ACQ_H_SIZE_REG, fmt->width);
+	rpp_module_write(mod, ACQ_V_SIZE_REG, fmt->height);
+	rpp_module_write(mod, ACQ_OUT_H_OFFS_REG, 0);
+	rpp_module_write(mod, ACQ_OUT_V_OFFS_REG, 0);
+	rpp_module_write(mod, ACQ_OUT_H_SIZE_REG, fmt->width);
+	rpp_module_write(mod, ACQ_OUT_V_SIZE_REG, fmt->height);
+
+	switch (fmt->code) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+		mod->info.acq.raw_pattern = RPP_BGGR;
+		bayerpat = ACQ_PROP_BAYER_PAT_BGBG;
+		break;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+		mod->info.acq.raw_pattern = RPP_GBRG;
+		bayerpat = ACQ_PROP_BAYER_PAT_GBGB;
+		break;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+		mod->info.acq.raw_pattern = RPP_GRBG;
+		bayerpat = ACQ_PROP_BAYER_PAT_GRGR;
+		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		mod->info.acq.raw_pattern = RPP_RGGB;
+		bayerpat = ACQ_PROP_BAYER_PAT_RGRG;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt->code) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		selection = ACQ_PROP_INPUT_SELECTION_8BIT;
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		selection = ACQ_PROP_INPUT_SELECTION_10BIT;
+		break;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		selection = ACQ_PROP_INPUT_SELECTION_12BIT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rpp_module_write(mod, ACQ_PROP_REG, bayerpat | selection |
+			 ACQ_PROP_SENSOR_IN_LSB_ALIGNED_IN_LSB);
+
+	rpp_module_clrset(mod, ACQ_CTRL_REG, ACQ_CTRL_INFORM_EN_ENABLE,
+			  ACQ_CTRL_INFORM_EN_ENABLE);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_acq_ops = {
+	.probe = rppx1_acq_probe,
+	.start = rppx1_acq_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
new file mode 100644
index 000000000000..e20bc369ca8c
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define AWB_GAIN_VERSION_REG		0x0000
+
+#define AWB_ENABLE_REG			0x0004
+#define AWB_ENABLE_AWB_GAIN_EN		BIT(0)
+
+#define AWB_GAIN_GR_REG			0x0008
+#define AWB_GAIN_GB_REG			0x000c
+#define AWB_GAIN_R_REG			0x0010
+#define AWB_GAIN_B_REG			0x0014
+
+static int rppx1_awbg_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, AWB_GAIN_VERSION_REG) != 3)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_awbg_ops = {
+	.probe = rppx1_awbg_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
new file mode 100644
index 000000000000..acbfbcd59591
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define DPF_VERSION_REG			0x0000
+
+#define DPF_MODE_REG			0x0004
+#define DPF_MODE_USE_NF_GAIN		BIT(9)
+#define DPF_MODE_LSC_GAIN_COMP		BIT(8)
+#define DPF_MODE_NLL_SEGMENTATION	BIT(6)
+#define DPF_MODE_RB_FILTER_SIZE		BIT(5)
+#define DPF_MODE_R_FILTER_OFF		BIT(4)
+#define DPF_MODE_GR_FILTER_OFF		BIT(3)
+#define DPF_MODE_GB_FILTER_OFF		BIT(2)
+#define DPF_MODE_B_FILTER_OFF		BIT(1)
+#define DPF_MODE_DPF_ENABLE		BIT(0)
+
+#define DPF_STRENGTH_R_REG		0x0008
+#define DPF_STRENGTH_G_REG		0x000c
+#define DPF_STRENGTH_B_REG		0x0010
+#define DPF_S_WEIGHT_G_1_4_REG		0x0014
+#define DPF_S_WEIGHT_G_5_6_REG		0x0018
+#define DPF_S_WEIGHT_RB_1_4_REG		0x001c
+#define DPF_S_WEIGHT_RB_5_6_REG		0x0020
+
+#define DPF_NLL_G_COEFF_REG_NUM		17
+#define DPF_NLL_G_COEFF_REG(n)		(0x0024 + (4 * (n)))
+
+#define DPF_NLL_RB_COEFF_REG_NUM	17
+#define DPF_NLL_RB_COEFF_REG(n)		(0x0068 + (4 * (n)))
+
+#define DPF_NF_GAIN_R_REG		0x00ac
+#define DPF_NF_GAIN_GR_REG		0x00b0
+#define DPF_NF_GAIN_GB_REG		0x00b4
+#define DPF_NF_GAIN_B_REG		0x00b8
+
+static int rppx1_bd_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, DPF_VERSION_REG) != 5)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_bd_ops = {
+	.probe = rppx1_bd_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
new file mode 100644
index 000000000000..292f0b7bfd3f
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define RGBDENOISE_VERSION_REG					0x0000
+
+#define RGBDENOISE_HW_BYPASS_REG				0x0004
+#define RGBDENOISE_HW_BYPASS_BYPASS_EN				BIT(0)
+
+#define RGBDENOISE_SPNR_CTRL_REG				0x0008
+#define RGBDENOISE_SPNR_CTRL_C2NR_INTENSITY_SHIFT_C_MASK	GENMASK(11, 8)
+#define RGBDENOISE_SPNR_CTRL_C2NR_INTENSITY_SHIFT_Y_MASK	GENMASK(7, 4)
+#define RGBDENOISE_SPNR_CTRL_C2NR_EN				BIT(0)
+
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_00_07_REG			0x000c
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_08_15_REG			0x0010
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_16_23_REG			0x0014
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_24_31_REG			0x0018
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_00_07_REG		0x001c
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_08_15_REG		0x0020
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_16_23_REG		0x0024
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_24_31_REG		0x0028
+#define RGBDENOISE_SPNR_SPATIAL_COEF_0_3_REG			0x002c
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_0_REG			0x0030
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_1_REG			0x0034
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_2_REG			0x0038
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_3_REG			0x003c
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_4_REG			0x0040
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_5_REG			0x0044
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_6_REG			0x0048
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_7_REG			0x004c
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_8_REG			0x0050
+#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_R_REG			0x0054
+#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_G_REG			0x0058
+#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_B_REG			0x005c
+#define RGBDENOISE_HW_BYPASS_SDW_REG				0x0060
+#define RGBDENOISE_SPNR_CTRL_SDW_REG				0x0064
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_00_07_SDW_REG		0x0068
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_08_15_SDW_REG		0x006c
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_16_23_SDW_REG		0x0070
+#define RGBDENOISE_SPNR_LUMA_IF_COEF_24_31_SDW_REG		0x0074
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_00_07_SDW_REG		0x0078
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_08_15_SDW_REG		0x007c
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_16_23_SDW_REG		0x0080
+#define RGBDENOISE_SPNR_CHROMA_IF_COEF_24_31_SDW_REG		0x0084
+#define RGBDENOISE_SPNR_SPATIAL_COEFF_0_3_SDW_REG		0x0088
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_0_SDW_REG			0x008c
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_1_SDW_REG			0x0090
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_2_SDW_REG			0x0094
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_3_SDW_REG			0x0098
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_4_SDW_REG			0x009c
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_5_SDW_REG			0x00a0
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_6_SDW_REG			0x00a4
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_7_SDW_REG			0x00a8
+#define RGBDENOISE_RGB2YUV_CCOR_COEFF_8_SDW_REG			0x00ac
+#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_R_SDW_REG		0x00b0
+#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_G_SDW_REG		0x00b4
+#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_B_SDW_REG		0x00b8
+
+static int rppx1_bdrgb_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, RGBDENOISE_VERSION_REG)) {
+	case 6:
+		mod->info.bdrgb.colorbits = 12;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_bdrgb_ops = {
+	.probe = rppx1_bdrgb_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
new file mode 100644
index 000000000000..de7008befd8e
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define BLS_VERSION_REG				0x0000
+
+#define BLS_CTRL_REG				0x0004
+#define BLS_CTRL_BLS_WIN2			BIT(3)
+#define BLS_CTRL_BLS_WIN1			BIT(2)
+#define BLS_CTRL_BLS_MODE_MEASURED		BIT(1)
+#define BLS_CTRL_BLS_EN				BIT(0)
+
+#define BLS_SAMPLES_REG				0x0008
+#define BLS_H1_START_REG			0x000c
+#define BLS_H1_STOP_REG				0x0010
+#define BLS_V1_START_REG			0x0014
+#define BLS_V1_STOP_REG				0x0018
+#define BLS_H2_START_REG			0x001c
+#define BLS_H2_STOP_REG				0x0020
+#define BLS_V2_START_REG			0x0024
+#define BLS_V2_STOP_REG				0x0028
+#define BLS_A_FIXED_REG				0x002c
+#define BLS_B_FIXED_REG				0x0030
+#define BLS_C_FIXED_REG				0x0034
+#define BLS_D_FIXED_REG				0x0038
+#define BLS_A_MEASURED_REG			0x003c
+#define BLS_B_MEASURED_REG			0x0040
+#define BLS_C_MEASURED_REG			0x0044
+#define BLS_D_MEASURED_REG			0x0048
+
+static int rppx1_bls_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, BLS_VERSION_REG)) {
+	case 3:
+	case 5:
+		mod->info.bls.colorbits = 12;
+		break;
+	case 2:
+	case 4:
+		mod->info.bls.colorbits = 20;
+		break;
+	case 6:
+		mod->info.bls.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_bls_ops = {
+	.probe = rppx1_bls_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_cac.c b/drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
new file mode 100644
index 000000000000..5ed8c60982ba
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define CAC_VERSION_REG			0x0000
+#define CAC_CTRL_REG			0x0004
+#define CAC_COUNT_START_REG		0x0008
+#define CAC_A_REG			0x000c
+#define CAC_B_REG			0x0010
+#define CAC_C_REG			0x0014
+#define CAC_X_NORM_REG			0x0018
+#define CAC_Y_NORM_REG			0x001c
+
+static int rppx1_cac_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, CAC_VERSION_REG) != 3)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_cac_ops = {
+	.probe = rppx1_cac_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
new file mode 100644
index 000000000000..4754b0bbce0a
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define CCOR_VERSION_REG				0x0000
+
+#define CCOR_COEFF_REG_NUM				9
+#define CCOR_COEFF_REG(n)				(0x0004 + (4 * (n)))
+
+#define CCOR_OFFSET_R_REG				0x0028
+#define CCOR_OFFSET_G_REG				0x002c
+#define CCOR_OFFSET_B_REG				0x0030
+
+#define CCOR_CONFIG_TYPE_REG				0x0034
+#define CCOR_CONFIG_TYPE_USE_OFFSETS_AS_PRE_OFFSETS	BIT(1)
+#define CCOR_CONFIG_TYPE_CCOR_RANGE_AVAILABLE		BIT(0)
+
+#define CCOR_RANGE_REG					0x0038
+#define CCOR_RANGE_CCOR_C_RANGE				BIT(1)
+#define CCOR_RANGE_CCOR_Y_RANGE				BIT(0)
+
+static int rppx1_ccor_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, CCOR_VERSION_REG)) {
+	case 3:
+		mod->info.ccor.colorbits = 12;
+		break;
+	case 4:
+		mod->info.ccor.colorbits = 20;
+		break;
+	case 5:
+		mod->info.ccor.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mod->info.ccor.type = rpp_module_read(mod, CCOR_CONFIG_TYPE_REG);
+
+	return 0;
+}
+
+static int rppx1_ccor_start(struct rpp_module *mod,
+			    const struct v4l2_mbus_framefmt *fmt)
+{
+	/* Configure matrix in bypass mode. */
+	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x1000);
+	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0000);
+	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0000);
+
+	rpp_module_write(mod, CCOR_COEFF_REG(3), 0x0000);
+	rpp_module_write(mod, CCOR_COEFF_REG(4), 0x1000);
+	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0000);
+
+	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0000);
+	rpp_module_write(mod, CCOR_COEFF_REG(7), 0x0000);
+	rpp_module_write(mod, CCOR_COEFF_REG(8), 0x1000);
+
+	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
+	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000000);
+	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000000);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_ccor_ops = {
+	.probe = rppx1_ccor_probe,
+	.start = rppx1_ccor_start,
+};
+
+static int rppx1_ccor_csm_start(struct rpp_module *mod,
+				const struct v4l2_mbus_framefmt *fmt)
+{
+	/* Reuse bypass matrix setup. */
+	if (fmt->code == MEDIA_BUS_FMT_RGB888_1X24)
+		return rppx1_ccor_start(mod, fmt);
+
+	/* Color Transformation RGB to YUV according to ITU-R BT.709. */
+	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x0367);
+	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0b71);
+	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0128);
+
+	rpp_module_write(mod, CCOR_COEFF_REG(3), 0xfe2b);
+	rpp_module_write(mod, CCOR_COEFF_REG(4), 0xf9d5);
+	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0800);
+
+	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0800);
+	rpp_module_write(mod, CCOR_COEFF_REG(7), 0xf8bc);
+	rpp_module_write(mod, CCOR_COEFF_REG(8), 0xff44);
+
+	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
+	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000800);
+	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000800);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_ccor_csm_ops = {
+	.probe = rppx1_ccor_probe,
+	.start = rppx1_ccor_csm_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
new file mode 100644
index 000000000000..5e233896cfc8
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define FILT_VERSION_REG		0x0000
+
+#define DEMOSAIC_REG			0x0004
+#define DEMOSAIC_DEMOSAIC_BYPASS	BIT(16)
+#define DEMOSAIC_DEMOSAIC_TH_MASK	GENMASK(15, 0)
+
+#define FILT_MODE_REG			0x0008
+#define FILT_MODE_FILT_LP_SELECT_MASK	GENMASK(11, 8)
+#define FILT_MODE_FILT_CHR_H_MODE_MASK	GENMASK(7, 6)
+#define FILT_MODE_FILT_CHR_V_MODE_MASK	GENMASK(5, 4)
+#define FILT_MODE_FILT_MODE		BIT(1)
+#define FILT_MODE_FILT_ENABLE		BIT(0)
+
+#define FILT_THRESH_BL0_REG		0x000c
+#define FILT_THRESH_BL1_REG		0x0010
+#define FILT_THRESH_SH0_REG		0x0014
+#define FILT_THRESH_SH1_REG		0x0018
+#define FILT_LUM_WEIGHT_REG		0x001c
+#define FILT_FAC_SH1_REG		0x0020
+#define FILT_FAC_SH0_REG		0x0024
+#define FILT_FAC_MID_REG		0x0028
+#define FILT_FAC_BL0_REG		0x002c
+#define FILT_FAC_BL1_REG		0x0030
+
+static int rppx1_db_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, FILT_VERSION_REG) != 5)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_db_ops = {
+	.probe = rppx1_db_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
new file mode 100644
index 000000000000..ae0b65976452
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define DPCC_VERSION_REG			0x0000
+
+#define DPCC_MODE_REG				0x0004
+#define DPCC_MODE_STAGE1_ENABLE			BIT(2)
+#define DPCC_MODE_GRAYSCALE_MODE		BIT(1)
+#define DPCC_MODE_DPCC_ENABLE			BIT(0)
+
+#define DPCC_OUTPUT_MODE_REG			0x0008
+#define DPCC_SET_USE_REG			0x000c
+#define DPCC_METHODS_SET_1_REG			0x0010
+#define DPCC_METHODS_SET_2_REG			0x0014
+#define DPCC_METHODS_SET_3_REG			0x0018
+#define DPCC_LINE_THRESH_1_REG			0x001c
+#define DPCC_LINE_MAD_FAC_1_REG			0x0020
+#define DPCC_PG_FAC_1_REG			0x0024
+#define DPCC_RND_THRESH_1_REG			0x0028
+#define DPCC_RG_FAC_1_REG			0x002c
+#define DPCC_LINE_THRESH_2_REG			0x0030
+#define DPCC_LINE_MAD_FAC_2_REG			0x0034
+#define DPCC_PG_FAC_2_REG			0x0038
+#define DPCC_RND_THRESH_2_REG			0x003c
+#define DPCC_RG_FAC_2_REG			0x0040
+#define DPCC_LINE_THRESH_3_REG			0x0044
+#define DPCC_LINE_MAD_FAC_3_REG			0x0048
+#define DPCC_PG_FAC_3_REG			0x004c
+#define DPCC_RND_THRESH_3_REG			0x0050
+#define DPCC_RG_FAC_3_REG			0x0054
+#define DPCC_RO_LIMITS_REG			0x0058
+#define DPCC_RND_OFFS_REG			0x005c
+#define DPCC_BPT_CTRL_REG			0x0060
+#define DPCC_BP_NUMBER_REG			0x0064
+#define DPCC_BP_TADDR_REG			0x0068
+#define DPCC_BP_POSITION_REG			0x006c
+
+static int rppx1_dpcc_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, DPCC_VERSION_REG)) {
+	case 2:
+	case 4:
+	case 6:
+		mod->info.dpcc.colorbits = 12;
+		break;
+	case 3:
+	case 5:
+	case 7:
+		mod->info.dpcc.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rppx1_dpcc_start(struct rpp_module *mod,
+			    const struct v4l2_mbus_framefmt *fmt)
+{
+	/* Bypass stage1 and DPCC. */
+	rpp_module_write(mod, DPCC_MODE_REG, 0);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_dpcc_ops = {
+	.probe = rppx1_dpcc_probe,
+	.start = rppx1_dpcc_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
new file mode 100644
index 000000000000..0c40300e13ad
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define EXM_VERSION_REG			0x0000
+#define EXM_START_REG			0x0004
+
+#define EXM_CTRL_REG			0x0008
+#define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
+
+#define EXM_MODE_REG			0x000c
+#define EXM_CHANNEL_SEL_REG		0x0010
+#define EXM_LAST_MEAS_LINE_REG		0x0014
+#define EXM_COEFF_R_REG			0x0018
+#define EXM_COEFF_G_GR_REG		0x001c
+#define EXM_COEFF_B_REG			0x0020
+#define EXM_COEFF_GB_REG		0x0024
+#define EXM_H_OFFS_REG			0x0028
+#define EXM_V_OFFS_REG			0x002c
+#define EXM_H_SIZE_REG			0x0030
+#define EXM_V_SIZE_REG			0x0034
+#define EXM_FORCED_UPD_START_LINE_REG	0x0038
+#define EXM_VSTART_STATUS_REG		0x003c
+
+#define EXM_MEAN_REG_NUM		25
+#define EXM_MEAN_REG(n)			(0x0040 + (4 * (n)))
+
+static int rppx1_exm_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, EXM_VERSION_REG)) {
+	case 1:
+		mod->info.exm.resultbits = 8;
+		break;
+	case 3:
+		mod->info.exm.resultbits = 20;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_exm_ops = {
+	.probe = rppx1_exm_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
new file mode 100644
index 000000000000..d6c7f951cf29
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define GAMMA_OUT_VERSION_REG			0x0000
+
+#define GAMMA_OUT_ENABLE_REG			0x0004
+#define GAMMA_OUT_ENABLE_GAMMA_OUT_EN		BIT(0)
+
+#define GAMMA_OUT_MODE_REG			0x0008
+#define GAMMA_OUT_MODE_GAMMA_OUT_EQU_SEGM	BIT(0)
+
+#define GAMMA_OUT_Y_REG_NUM			17
+#define GAMMA_OUT_Y_REG(n)			(0x000c + (4 * (n)))
+
+static int rppx1_ga_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, GAMMA_OUT_VERSION_REG)) {
+	case 1:
+		mod->info.ga.colorbits = 12;
+		break;
+	case 2:
+		mod->info.ga.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rppx1_ga_start(struct rpp_module *mod,
+			  const struct v4l2_mbus_framefmt *fmt)
+{
+	/* Disable stage. */
+	rpp_module_write(mod, GAMMA_OUT_ENABLE_REG, 0);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_ga_ops = {
+	.probe = rppx1_ga_probe,
+	.start = rppx1_ga_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
new file mode 100644
index 000000000000..cab498ece5a8
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define HIST_VERSION_REG			0x0000
+
+#define HIST_CTRL_REG				0x0004
+#define HIST_CTRL_HIST_UPDATE_ENABLE		BIT(0)
+
+#define HIST_MODE_REG				0x0008
+#define HIST_MODE_HIST_MODE_MASK		GENMASK(2, 0)
+#define HIST_MODE_HIST_MODE_DISABLE		0
+#define HIST_MODE_HIST_MODE_YRGB		1
+#define HIST_MODE_HIST_MODE_R			2
+#define HIST_MODE_HIST_MODE_GR			3
+#define HIST_MODE_HIST_MODE_B			4
+#define HIST_MODE_HIST_MODE_GB			5
+
+#define HIST_CHANNEL_SEL_REG			0x000c
+#define HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK	GENMASK(2, 0)
+
+#define HIST_LAST_MEAS_LINE_REG			0x0010
+#define HIST_SUBSAMPLING_REG			0x0014
+#define HIST_COEFF_R_REG			0x0018
+#define HIST_COEFF_G_REG			0x001c
+#define HIST_COEFF_B_REG			0x0020
+#define HIST_H_OFFS_REG				0x0024
+#define HIST_V_OFFS_REG				0x0028
+#define HIST_H_SIZE_REG				0x002c
+#define HIST_V_SIZE_REG				0x0030
+
+#define HIST_SAMPLE_RANGE_REG			0x0034
+#define HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK	GENMASK(28, 24)
+#define HIST_SAMPLE_RANGE_SAMPLE_OFFSET_MASK	GENMASK(23, 0)
+
+#define HIST_WEIGHT_00TO30_REG			0x0038
+#define HIST_WEIGHT_40TO21_REG			0x003c
+#define HIST_WEIGHT_31TO12_REG			0x0040
+#define HIST_WEIGHT_22TO03_REG			0x0044
+#define HIST_WEIGHT_13TO43_REG			0x0048
+#define HIST_WEIGHT_04TO34_REG			0x004c
+#define HIST_WEIGHT_44_REG			0x0050
+#define HIST_FORCED_UPD_START_LINE_REG		0x0054
+#define HIST_FORCED_UPDATE_REG			0x0058
+#define HIST_VSTART_STATUS_REG			0x005c
+
+#define HIST_BIN_REG_NUM			32
+#define HIST_BIN_REG(n)				(0x0060 + (4 * (n)))
+
+static int rppx1_hist_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, HIST_VERSION_REG)) {
+	case 3:
+		mod->info.hist.colorbits = 12;
+		break;
+	case 4:
+		mod->info.hist.colorbits = 20;
+		break;
+	case 5:
+		mod->info.hist.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_hist_ops = {
+	.probe = rppx1_hist_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
new file mode 100644
index 000000000000..5b846b415a49
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define HIST256_VERSION_REG			0x0000
+#define HIST256_MODE_REG			0x0004
+#define HIST256_MODE_HIST256_MODE		BIT(0)
+
+#define HIST256_CHANNEL_SEL_REG			0x0008
+#define HIST256_CHANNEL_SEL_CHANNEL_SELECT	GENMASK(2, 0)
+
+#define HIST256_H_OFFS_REG			0x000c
+#define HIST256_V_OFFS_REG			0x0010
+#define HIST256_H_SIZE_REG			0x0014
+#define HIST256_V_SIZE_REG			0x0018
+#define HIST256_SAMPLE_OFFSET_REG		0x001c
+#define HIST256_SAMPLE_SCALE_REG		0x0020
+#define HIST256_MEAS_RESULT_ADDR_AUTOINCR_REG	0x0024
+#define HIST256_MEAS_RESULT_ADDR_REG		0x0028
+#define HIST256_MEAS_RESULT_DATA_REG		0x002c
+
+#define HIST256_LOG_ENABLE_REG			0x0030
+#define HIST256_LOG_ENABLE_HIST256_LOG_EN	BIT(0)
+
+#define HIST256_LOG_DX_LO_REG			0x0034
+#define HIST256_LOG_DX_HI_REG			0x0038
+
+#define HIST256_Y_REG_NUM			17
+#define HIST256_Y_REG(n)			(0x0040 + (4 * (n)))
+
+static int rppx1_hist256_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, HIST256_VERSION_REG) != 2)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_hist256_ops = {
+	.probe = rppx1_hist256_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_is.c b/drivers/media/platform/dreamchip/rppx1/rppx1_is.c
new file mode 100644
index 000000000000..3637a2e677ca
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_is.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define IS_VERSION			0x0000
+#define IS_H_OFFS			0x0008
+#define IS_V_OFFS			0x000c
+#define IS_H_SIZE			0x0010
+#define IS_V_SIZE			0x0014
+#define IS_H_OFFS_SHD			0x0024
+#define IS_V_OFFS_SHD			0x0028
+#define IS_H_SIZE_SHD			0x002c
+#define IS_V_SIZE_SHD			0x0030
+
+static int rppx1_is_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, IS_VERSION) != 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rppx1_is_start(struct rpp_module *mod,
+			  const struct v4l2_mbus_framefmt *fmt)
+{
+	rpp_module_write(mod, IS_H_OFFS, 0);
+	rpp_module_write(mod, IS_V_OFFS, 0);
+	rpp_module_write(mod, IS_H_SIZE, fmt->width);
+	rpp_module_write(mod, IS_V_SIZE, fmt->height);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_is_ops = {
+	.probe = rppx1_is_probe,
+	.start = rppx1_is_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
new file mode 100644
index 000000000000..e4b0a7be7665
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+/* NOTE: The module is called LIN the registers GAMMA_IN. */
+#define LIN_VERSION_REG				0x0000
+
+#define LIN_ENABLE_REG				0x0004
+#define LIN_ENABLE_GAMMA_IN_EN			BIT(0)
+
+#define LIN_DX_LO_REG				0x0008
+#define LIN_DX_HI_REG				0x000c
+
+#define LIN_R_Y_REG_NUM				17
+#define LIN_R_Y_REG(n)				(0x0010 + (4 * (n)))
+
+#define LIN_G_Y_REG_NUM				17
+#define LIN_G_Y_REG(n)				(0x0054 + (4 * (n)))
+
+#define LIN_B_Y_REG_NUM				17
+#define LIN_B_Y_REG(n)				(0x0098 + (4 * (n)))
+
+#define LIN_SAMPLES_NUM	17
+
+static int rppx1_lin_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, LIN_VERSION_REG)) {
+	case 7:
+		mod->info.lin.colorbits = 12;
+		break;
+	case 8:
+		mod->info.lin.colorbits = 20;
+		break;
+	case 9:
+		mod->info.lin.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rppx1_lin_start(struct rpp_module *mod,
+			   const struct v4l2_mbus_framefmt *fmt)
+{
+	rpp_module_clrset(mod, LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN, 0);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_lin_ops = {
+	.probe = rppx1_lin_probe,
+	.start = rppx1_lin_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
new file mode 100644
index 000000000000..e8acdf744956
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define LSC_VERSION_REG		0x0000
+
+#define LSC_CTRL_REG		0x0004
+#define LSC_CTRL_LSC_EN		BIT(0)
+
+#define LSC_R_TABLE_ADDR_REG	0x0008
+#define LSC_GR_TABLE_ADDR_REG	0x000c
+#define LSC_B_TABLE_ADDR_REG	0x0010
+#define LSC_GB_TABLE_ADDR_REG	0x0014
+#define LSC_R_TABLE_DATA_REG	0x0018
+#define LSC_GR_TABLE_DATA_REG	0x001c
+#define LSC_B_TABLE_DATA_REG	0x0020
+#define LSC_GB_TABLE_DATA_REG	0x0024
+#define LSC_XGRAD_01_REG	0x0028
+#define LSC_XGRAD_23_REG	0x002c
+#define LSC_XGRAD_45_REG	0x0030
+#define LSC_XGRAD_67_REG	0x0034
+#define LSC_XGRAD_89_REG	0x0038
+#define LSC_XGRAD_1011_REG	0x003c
+#define LSC_XGRAD_1213_REG	0x0040
+#define LSC_XGRAD_1415_REG	0x0044
+#define LSC_YGRAD_01_REG	0x0048
+#define LSC_YGRAD_23_REG	0x004c
+#define LSC_YGRAD_45_REG	0x0050
+#define LSC_YGRAD_67_REG	0x0054
+#define LSC_YGRAD_89_REG	0x0058
+#define LSC_YGRAD_1011_REG	0x005c
+#define LSC_YGRAD_1213_REG	0x0060
+#define LSC_YGRAD_1415_REG	0x0064
+#define LSC_XSIZE_01_REG	0x0068
+#define LSC_XSIZE_23_REG	0x006c
+#define LSC_XSIZE_45_REG	0x0070
+#define LSC_XSIZE_67_REG	0x0074
+#define LSC_XSIZE_89_REG	0x0078
+#define LSC_XSIZE_1011_REG	0x007c
+#define LSC_XSIZE_1213_REG	0x0080
+#define LSC_XSIZE_1415_REG	0x0084
+#define LSC_YSIZE_01_REG	0x0088
+#define LSC_YSIZE_23_REG	0x008c
+#define LSC_YSIZE_45_REG	0x0090
+#define LSC_YSIZE_67_REG	0x0094
+#define LSC_YSIZE_89_REG	0x0098
+#define LSC_YSIZE_1011_REG	0x009c
+#define LSC_YSIZE_1213_REG	0x00a0
+#define LSC_YSIZE_1415_REG	0x00a4
+#define LSC_TABLE_SEL_REG	0x00a8
+#define LSC_STATUS_REG		0x00ac
+
+static int rppx1_lsc_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, LSC_VERSION_REG) != 0x04)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_lsc_ops = {
+	.probe = rppx1_lsc_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
new file mode 100644
index 000000000000..693cf5ed1689
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define LTM_VERSION_REG				0x0000
+
+#define LTM_CTRL_REG				0x0004
+#define LTM_CTRL_LTM_ENABLE			BIT(0)
+
+#define LTM_RGB_WEIGHTS_REG			0x0008
+#define LTM_CLB_LINESIZE_REG			0x000c
+#define LTM_TONECURVE_1_REG			0x0010
+#define LTM_TONECURVE_2_REG			0x0014
+#define LTM_TONECURVE_3_REG			0x0018
+#define LTM_TONECURVE_4_REG			0x001c
+#define LTM_TONECURVE_5_REG			0x0020
+#define LTM_TONECURVE_6_REG			0x0024
+#define LTM_TONECURVE_YM_REG(n)			(0x0028 + (4 * (n)))
+#define LTM_L0W_REG				0x00ec
+#define LTM_L0W_R_REG				0x00f0
+#define LTM_L0D_REG				0x00f4
+#define LTM_L0D_R_REG				0x00f8
+#define LTM_KMIND_REG				0x00fc
+#define LTM_KMAXD_REG				0x0100
+#define LTM_KDIFFD_REG				0x0104
+#define LTM_KDIFFD_R_REG			0x0108
+#define LTM_KW_REG				0x010c
+#define LTM_KW_R_REG				0x0110
+#define LTM_CGAIN_REG				0x0114
+#define LTM_LPRCH_R_HIGH_REG			0x0118
+#define LTM_LPRCH_R_LOW_REG			0x011c
+
+static int rppx1_ltm_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, LTM_VERSION_REG) != 8)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_ltm_ops = {
+	.probe = rppx1_ltm_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
new file mode 100644
index 000000000000..efc3d09db5eb
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define LTM_MEAS_VERSION_REG		0x0000
+
+#define LTM_MEAS_CTRL_REG		0x0004
+#define LTM_MEAS_CTRL_LTM_MEAS_ENABLE	BIT(0)
+
+#define LTM_MEAS_RGB_WEIGHTS_REG	0x0008
+#define LTM_MEAS_H_OFFS_REG		0x000c
+#define LTM_MEAS_V_OFFS_REG		0x0010
+#define LTM_MEAS_H_SIZE_REG		0x0014
+#define LTM_MEAS_V_SIZE_REG		0x0018
+
+#define LTM_MEAS_PRC_THRESH_NUM		8
+#define LTM_MEAS_PRC_THRESH_REG(n)	(0x001c + (4 * (n)))
+
+#define LTM_MEAS_PRC_REG_NUM		8
+#define LTM_MEAS_PRC_REG(n)		(0x003c + (4 * (n)))
+
+#define LTM_MEAS_L_MIN_REG		0x005c
+#define LTM_MEAS_L_MAX_REG		0x0060
+#define LTM_MEAS_L_GMEAN_REG		0x0064
+
+static int rppx1_ltmmeas_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, LTM_MEAS_VERSION_REG) != 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_ltmmeas_ops = {
+	.probe = rppx1_ltmmeas_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_outif.c b/drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
new file mode 100644
index 000000000000..742c81844912
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define OUT_IF_VERSION_REG			0x0000
+
+#define OUT_IF_ON_REG				0x0004
+#define OUT_IF_ON_RPP_ON			BIT(0)
+
+#define OUT_IF_OFF_REG				0x0008
+
+#define OUT_IF_NR_FRAMES_REG			0x000c
+#define OUT_IF_NR_FRAMES_NR_FRAMES		GENMASK(9, 0)
+
+#define OUT_IF_NR_FRAMES_CNT_REG		0x0010
+#define FLAGS_SHD_REG				0x0018
+
+static int rppx1_outif_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, OUT_IF_VERSION_REG) != 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rppx1_outif_start(struct rpp_module *mod,
+			     const struct v4l2_mbus_framefmt *fmt)
+{
+	rpp_module_clrset(mod, OUT_IF_NR_FRAMES_REG,
+			  OUT_IF_NR_FRAMES_NR_FRAMES, 0);
+
+	rpp_module_write(mod, OUT_IF_ON_REG, OUT_IF_ON_RPP_ON);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_outif_ops = {
+	.probe = rppx1_outif_probe,
+	.start = rppx1_outif_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c b/drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
new file mode 100644
index 000000000000..63d61e1dc447
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define OUTREGS_VERSION_REG					0x0000
+
+#define OUT_MODE_REG						0x0004
+#define OUT_MODE_UNSELECTED_MODE_MASK				GENMASK(11, 8)
+#define OUT_MODE_UNSELECTED_MODE_MAIN				(0x1 << 8)
+#define OUT_MODE_UNSELECTED_MODE_PRE1				(0x2 << 8)
+#define OUT_MODE_UNSELECTED_MODE_PRE2				(0x4 << 8)
+#define OUT_MODE_IN_SEL_MASK					GENMASK(3, 0)
+#define OUT_MODE_IN_SEL_MAIN					1
+#define OUT_MODE_IN_SEL_PRE1					2
+#define OUT_MODE_IN_SEL_PRE2					4
+
+#define OUT_CONV_422_METHOD_REG					0x0008
+#define OUT_CONV_422_METHOD_CONV_422_METHOD_MASK		GENMASK(1, 0)
+#define OUT_CONV_422_METHOD_CONV_422_METHOD_CO_SITED1		0
+#define OUT_CONV_422_METHOD_CONV_422_METHOD_CO_SITED2		1
+#define OUT_CONV_422_METHOD_CONV_422_METHOD_NON_CO_SITED	2
+
+#define OUTREGS_FORMAT_REG					0x000c
+#define OUTREGS_FORMAT_OUTPUT_FORMAT_MASK			GENMASK(1, 0)
+#define OUTREGS_FORMAT_OUTPUT_FORMAT_RGB			0
+#define OUTREGS_FORMAT_OUTPUT_FORMAT_YUV422			1
+#define OUTREGS_FORMAT_OUTPUT_FORMAT_YUV420			2
+
+static int rppx1_outregs_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, OUTREGS_VERSION_REG) != 2)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rppx1_outregs_start(struct rpp_module *mod,
+			       const struct v4l2_mbus_framefmt *fmt)
+{
+	u32 format;
+
+	switch (fmt->code) {
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+		format = OUTREGS_FORMAT_OUTPUT_FORMAT_YUV422;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		format = OUTREGS_FORMAT_OUTPUT_FORMAT_RGB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rpp_module_clrset(mod, OUT_MODE_REG,
+			  OUT_MODE_UNSELECTED_MODE_MASK | OUT_MODE_IN_SEL_MASK,
+			  OUT_MODE_UNSELECTED_MODE_MASK | OUT_MODE_IN_SEL_MAIN);
+
+	rpp_module_clrset(mod, OUT_CONV_422_METHOD_REG,
+			  OUT_CONV_422_METHOD_CONV_422_METHOD_MASK,
+			  OUT_CONV_422_METHOD_CONV_422_METHOD_CO_SITED1);
+
+	rpp_module_clrset(mod, OUTREGS_FORMAT_REG,
+			  OUTREGS_FORMAT_OUTPUT_FORMAT_MASK, format);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_outregs_ops = {
+	.probe = rppx1_outregs_probe,
+	.start = rppx1_outregs_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c b/drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
new file mode 100644
index 000000000000..f6773a452bd1
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define RMAP_DATA_VERSION_REG		0x0000
+
+#define RMAP_CTRL_REG			0x0004
+#define RMAP_CTRL_BYPASS_LONG		BIT(2)
+
+#define RMAP_WBTHRESHOLD_LONG_REG	0x0008
+#define RMAP_WBTHRESHOLD_SHORT_REG	0x000c
+#define RMAP_RESERVED_1_REG		0x0010
+#define RMAP_WBGAIN_LONG_RED_REG	0x0014
+#define RMAP_WBGAIN_LONG_BLUE_REG	0x0018
+#define RMAP_WBGAIN_SHORT_RED_REG	0x001c
+#define RMAP_WBGAIN_SHORT_BLUE_REG	0x0020
+#define RMAP_RESERVED_2_REG		0x0024
+#define RMAP_RESERVED_3_REG		0x0028
+#define RMAP_MAP_FAC_SHORT_REG		0x002c
+#define RMAP_RESERVED_4_REG		0x0030
+#define RMAP_MIN_THRES_SHORT_REG	0x0034
+#define RMAP_MAX_THRES_SHORT_REG	0x0038
+#define RMAP_STEPSIZE_SHORT_REG		0x003c
+#define RMAP_MIN_THRES_LONG_REG		0x0040
+#define RMAP_MAX_THRES_LONG_REG		0x0044
+#define RMAP_STEPSIZE_LONG_REG		0x0048
+#define RMAP_CLB_LINESIZE_REG		0x004c
+
+static int rppx1_rmap_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, RMAP_DATA_VERSION_REG)) {
+	case 8:
+		mod->info.rmap.colorbits_high = 20;
+		mod->info.rmap.colorbits_low = 12;
+		break;
+	case 9:
+		mod->info.rmap.colorbits_high = 24;
+		mod->info.rmap.colorbits_low = 12;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rppx1_rmap_start(struct rpp_module *mod,
+			    const struct v4l2_mbus_framefmt *fmt)
+{
+	/* Bypass radiance mapping and use the long exposure channel (PRE1). */
+	rpp_module_write(mod, RMAP_CTRL_REG, RMAP_CTRL_BYPASS_LONG);
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_rmap_ops = {
+	.probe = rppx1_rmap_probe,
+	.start = rppx1_rmap_start,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
new file mode 100644
index 000000000000..c04f92508f6d
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define RMAP_MEAS_VERSION_REG			0x0000
+#define RMAP_MEAS_MODE_REG			0x0004
+#define RMAP_MEAS_SUBSAMPLING_REG		0x0008
+#define RMAP_MEAS_RESERVED_1_REG		0x000c
+#define RMAP_MEAS_MIN_THRES_SHORT_REG		0x0010
+#define RMAP_MEAS_MAX_THRES_SHORT_REG		0x0014
+#define RMAP_MEAS_MAX_THRES_LONG_REG		0x0018
+#define RMAP_MEAS_H_OFFS_REG			0x001c
+#define RMAP_MEAS_V_OFFS_REG			0x0020
+#define RMAP_MEAS_H_SIZE_REG			0x0024
+#define RMAP_MEAS_V_SIZE_REG			0x0028
+#define RMAP_MEAS_LAST_MEAS_LINE_REG		0x002c
+#define RMAP_MEAS_LS_RESULTSHORT0_REG		0x0030
+#define RMAP_MEAS_LS_RESULTLONG0_REG		0x0034
+#define RMAP_MEAS_RESERVED_2_REG		0x0038
+#define RMAP_MEAS_RESERVED_3_REG		0x003c
+#define RMAP_MEAS_LS_RESULTSHORT1_REG		0x0040
+#define RMAP_MEAS_LS_RESULTLONG1_REG		0x0044
+#define RMAP_MEAS_RESERVED_4_REG		0x0048
+#define RMAP_MEAS_RESERVED_5_REG		0x004c
+
+static int rppx1_rmapmeas_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, RMAP_MEAS_VERSION_REG)) {
+	case 3:
+		mod->info.rmapmeas.colorbits_high = 24;
+		mod->info.rmapmeas.colorbits_low = 12;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_rmapmeas_ops = {
+	.probe = rppx1_rmapmeas_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c b/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
new file mode 100644
index 000000000000..5bec022e8f05
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define SHRPCNR_VERSION_REG				0x0000
+
+#define SHRPCNR_CTRL_REG				0x0004
+#define SHRPCNR_CTRL_CAD_EN				BIT(3)
+#define SHRPCNR_CTRL_DESAT_EN				BIT(2)
+#define SHRPCNR_CTRL_CNR_EN				BIT(1)
+#define SHRPCNR_CTRL_SHARPEN_EN				BIT(0)
+
+#define SHRPCNR_PARAM_REG				0x0008
+#define SHRPCNR_PARAM_SHARP_FACTOR_MASK			GENMASK(19, 12)
+#define SHRPCNR_PARAM_CORING_THR_MASK			GENMASK(11, 0)
+
+#define SHRPCNR_MAT_1_REG				0x000c
+#define SHRPCNR_MAT_2_REG				0x0010
+#define SHRPCNR_CLB_LINESIZE_REG			0x0014
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_0_REG		0x0018
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_1_REG		0x001c
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_2_REG		0x0020
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_3_REG		0x0024
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_4_REG		0x0028
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_5_REG		0x002c
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_6_REG		0x0030
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_7_REG		0x0034
+#define SHRPCNR_YUV2RGB_CCOR_COEFF_8_REG		0x0038
+#define SHRPCNR_YUV2RGB_CCOR_OFFSET_R_REG		0x003c
+#define SHRPCNR_YUV2RGB_CCOR_OFFSET_G_REG		0x0040
+#define SHRPCNR_YUV2RGB_CCOR_OFFSET_B_REG		0x0044
+
+#define SHRPCNR_CNR_THRES_REG				0x0048
+#define SHRPCNR_CNR_THRES_CNR_THRES_CR_MASK		GENMASK(27, 16)
+#define SHRPCNR_CNR_THRES_CNR_THRES_CB_MASK		GENMASK(11, 0)
+
+#define SHRPCNR_CRED_THRES_REG				0x004c
+#define SHRPCNR_CRED_SLOPE_REG				0x0050
+#define SHRPCNR_CAD_RESTORE_LVL_REG			0x0054
+#define SHRPCNR_CAD_THRESH_V_UNEG_REG			0x0058
+#define SHRPCNR_CAD_THRESH_V_UPOS_REG			0x005c
+#define SHRPCNR_CAD_THRESH_U_REG			0x0060
+
+static int rppx1_shrp_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, SHRPCNR_VERSION_REG)) {
+	case 2:
+		mod->info.shrp.colorbits = 12;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_shrp_ops = {
+	.probe = rppx1_shrp_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
new file mode 100644
index 000000000000..3d197d914d07
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define AWB_MEAS_VERSION_REG			0x0000
+
+#define AWB_MEAS_PROP_REG			0x0004
+#define AWB_MEAS_PROP_MEAS_MODE_RGB		BIT(16) /* 0: YCbCr 1: RGB */
+#define AWB_MEAS_PROP_YMAX			BIT(2)
+#define AWB_MEAS_PROP_AWB_MODE_ON		BIT(1)
+
+#define AWB_MEAS_H_OFFS_REG			0x0008
+#define AWB_MEAS_V_OFFS_REG			0x000c
+#define AWB_MEAS_H_SIZE_REG			0x0010
+#define AWB_MEAS_V_SIZE_REG			0x0014
+#define AWB_MEAS_FRAMES_REG			0x0018
+#define AWB_MEAS_REF_CB_MAX_B_REG		0x001c
+#define AWB_MEAS_REF_CR_MAX_R_REG		0x0020
+#define AWB_MEAS_MAX_Y_REG			0x0024
+#define AWB_MEAS_MIN_Y_MAX_G_REG		0x0028
+#define AWB_MEAS_MAX_CSUM_REG			0x002c
+#define AWB_MEAS_MIN_C_REG			0x0030
+#define AWB_MEAS_WHITE_CNT_REG			0x0034
+#define AWB_MEAS_MEAN_Y_G_REG			0x0038
+#define AWB_MEAS_MEAN_CB_B_REG			0x003c
+#define AWB_MEAS_MEAN_CR_R_REG			0x0040
+
+#define AWB_MEAS_CCOR_COEFF_NUM			9
+#define AWB_MEAS_CCOR_COEFF_REG(n)		(0x0044 + (4 * (n)))
+
+#define AWB_MEAS_CCOR_OFFSET_R_REG		0x0068
+#define AWB_MEAS_CCOR_OFFSET_G_REG		0x006c
+#define AWB_MEAS_CCOR_OFFSET_B_REG		0x0070
+
+static int rppx1_wbmeas_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	switch (rpp_module_read(mod, AWB_MEAS_VERSION_REG)) {
+	case 1:
+		mod->info.wbmeas.colorbits = 8;
+		break;
+	case 2:
+		mod->info.wbmeas.colorbits = 20;
+		break;
+	case 3:
+		mod->info.wbmeas.colorbits = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_wbmeas_ops = {
+	.probe = rppx1_wbmeas_probe,
+};
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c b/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
new file mode 100644
index 000000000000..73789c48c057
--- /dev/null
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include "rpp_module.h"
+
+#define XYZ2LUV_VERSION_REG			0x0000
+#define XYZ2LUV_U_REF_REG			0x0004
+#define XYZ2LUV_V_REF_REG			0x0008
+#define XYZ2LUV_LUMA_OUT_FAC_REG		0x000c
+#define XYZ2LUV_CHROMA_OUT_FAC_REG		0x0010
+
+static int rppx1_xyz2luv_probe(struct rpp_module *mod)
+{
+	/* Version check. */
+	if (rpp_module_read(mod, XYZ2LUV_VERSION_REG) != 4)
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct rpp_module_ops rppx1_xyz2luv_ops = {
+	.probe = rppx1_xyz2luv_probe,
+};
diff --git a/include/media/rppx1.h b/include/media/rppx1.h
new file mode 100644
index 000000000000..111e0218846e
--- /dev/null
+++ b/include/media/rppx1.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+#ifndef __MEDIA_DCT_RPPX1_H__
+#define __MEDIA_DCT_RPPX1_H__
+
+#include <linux/v4l2-mediabus.h>
+
+#include <linux/rkisp1-config.h>
+
+struct rppx1;
+
+struct rppx1 *rppx1_create(void __iomem *base);
+
+void rppx1_destroy(struct rppx1 *rpp);
+
+int rppx1_start(struct rppx1 *rpp, const struct v4l2_mbus_framefmt *input,
+		const struct v4l2_mbus_framefmt *hv,
+		const struct v4l2_mbus_framefmt *mv);
+
+int rppx1_stop(struct rppx1 *rpp);
+
+bool rppx1_interrupt(struct rppx1 *rpp, u32 *isc);
+
+typedef int (*rppx1_reg_write)(void *priv, u32 offset, u32 value);
+int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
+			rppx1_reg_write write, void *priv);
+
+void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf);
+
+#endif /* __MEDIA_DCT_RPPX1_H__ */
-- 
2.51.0


