Return-Path: <linux-media+bounces-20230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574859AF023
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 20:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55FED1C2210A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 18:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340B215001;
	Thu, 24 Oct 2024 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="YVhA4YLF"
X-Original-To: linux-media@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3222141D0;
	Thu, 24 Oct 2024 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729796092; cv=none; b=FxTAxU9ITAlFA30ybAbZNKEk33ltCpxUBq3TvA1y55BX0Fg+/mvRRyrNpWvLMx5uzjNBerEdF2659Z6uw+4HC6N3ZZf9jYH4ZSd5FiOay+p87fT6y0yJ5LWf44OPC7Ob0ScMgnqgup9n8D8kMS3cfbwfFLLnSBnNaPgMozEncpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729796092; c=relaxed/simple;
	bh=vcj4Zl30hZKPQmEgDV2ndtG3//dMR+88Svx8gersokc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ez0qGVxiWUOuYHpLrrUcWbyn3IIlOJCjz03ogREw+HhoWhWa9K4Ip+ZvpDQT3hQilqG+CKQM3ARAPUQD83I97dlz6yLrNU18TY3PuUiqxzQ7Ghe3sTFx8I9EfXpGP9EZGQxhZjcJXB3OAdjpWCoEUf94AEv6Iu1nTsdEBftgfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=YVhA4YLF; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=YVhA4YLF;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10de:2e00:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 49OIhGvY1383422
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 19:43:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1729795395; bh=HAoa7xblMSKwHtp1ssQvpwrF+I1Db85YOC/jYT6LvdY=;
	h=From:To:Cc:Subject:Date:Message-Id:From;
	b=YVhA4YLFT5sS0545dThy+CmfLgQw1v4ec1jNDzcHagUrfrPRP32dXMC07z6w3WXOY
	 67tHRxNRooIQCP1j/5gnHBo4dQdbVwCT3uvyStCB1pjjQMciGyQTEDI8r6uoopC2YL
	 1yovFG2FzeIVA0s5PlkJBgzC14lzxzGadEiRNw2s=
Received: from miraculix.mork.no ([IPv6:2a01:799:10de:2e0a:149a:2079:3a3a:3457])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 49OIhFmN609116
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 20:43:15 +0200
Received: (nullmailer pid 700022 invoked by uid 1000);
	Thu, 24 Oct 2024 18:43:15 -0000
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] media: mantis: remove orphan mantis_core.h
Date: Thu, 24 Oct 2024 20:43:13 +0200
Message-Id: <20241024184313.700010-1-bjorn@mork.no>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.0.5 at canardo.mork.no
X-Virus-Status: Clean

This file has been an orphan ever since commit b3b961448f70
("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper
devices into the PCI ID list"), having no references except
for the orphan removed by commit 519648bed470 ("media: mantis:
remove orphan mantis_core.c")

Fixes: b3b961448f70 ("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper devices into the PCI ID list")
Link: https://patchwork.linuxtv.org/project/linux-media/patch/1277054487-14384-1-git-send-email-bjorn@mork.no/
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---

Yes, I did try to clean up this mess in 2010 already. Not sure
why I bother, really.


 drivers/media/pci/mantis/mantis_core.h | 43 --------------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 drivers/media/pci/mantis/mantis_core.h

diff --git a/drivers/media/pci/mantis/mantis_core.h b/drivers/media/pci/mantis/mantis_core.h
deleted file mode 100644
index 93c89a10a2c7..000000000000
--- a/drivers/media/pci/mantis/mantis_core.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
-	Mantis PCI bridge driver
-
-	Copyright (C) Manu Abraham (abraham.manu@gmail.com)
-
-*/
-
-#ifndef __MANTIS_CORE_H
-#define __MANTIS_CORE_H
-
-#include "mantis_common.h"
-
-
-#define FE_TYPE_SAT	0
-#define FE_TYPE_CAB	1
-#define FE_TYPE_TER	2
-
-#define FE_TYPE_TS204	0
-#define FE_TYPE_TS188	1
-
-
-struct vendorname {
-	u8  *sub_vendor_name;
-	u32 sub_vendor_id;
-};
-
-struct devicetype {
-	u8  *sub_device_name;
-	u32 sub_device_id;
-	u8  device_type;
-	u32 type_flags;
-};
-
-
-extern int mantis_dma_init(struct mantis_pci *mantis);
-extern int mantis_dma_exit(struct mantis_pci *mantis);
-extern void mantis_dma_start(struct mantis_pci *mantis);
-extern void mantis_dma_stop(struct mantis_pci *mantis);
-extern int mantis_i2c_init(struct mantis_pci *mantis);
-extern int mantis_i2c_exit(struct mantis_pci *mantis);
-
-#endif /* __MANTIS_CORE_H */
-- 
2.39.5


