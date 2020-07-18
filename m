Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456672249B1
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 09:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgGRHfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 03:35:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:47270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbgGRHfv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 03:35:51 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C89B420775;
        Sat, 18 Jul 2020 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595057751;
        bh=rt7r8XiIxEkqFJ0t2gUyj37btoYwlDfLnXTwW+Dcn+Q=;
        h=From:To:Cc:Subject:Date:From;
        b=h5cmUHdpdOrsBqM2cZyRpJyKxqMw36AviFE5rkcmgeK/EH20yZgw4eUeHdadxl4cN
         Fa81ywvUr/OlLbzh5RTuKiqsrxyhorBB+tkMQDiXT+LEVv+ITp30X2I8OsjYvslRHl
         l5jD1utOp96F4jSyQWWO4c7EBysaEOjpGC+4lMS0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jwhNs-005EPN-J1; Sat, 18 Jul 2020 09:35:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: atomisp: get rid of some unused static vars
Date:   Sat, 18 Jul 2020 09:35:45 +0200
Message-Id: <06a617f163762cd60474fde9c88fde72dca447f4.1595057709.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several static vars declared inside the
system local headers. This causes lots of warnings when W=1.

Remove the unused ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/isp2400_system_local.h  | 38 -------------------
 .../media/atomisp/pci/isp2401_system_local.h  | 30 ---------------
 2 files changed, 68 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
index 675b8e5bdcc1..f889b7bf8f2d 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
@@ -38,11 +38,6 @@
 
 #define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
 
-/* DDR */
-static const hrt_address DDR_BASE[N_DDR_ID] = {
-	(hrt_address)0x0000000120000000ULL
-};
-
 /* ISP */
 static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
 	(hrt_address)0x0000000000020000ULL
@@ -56,16 +51,6 @@ static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
 	(hrt_address)0x0000000000100000ULL
 };
 
-static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
-	(hrt_address)0x00000000001C0000ULL,
-	(hrt_address)0x00000000001D0000ULL,
-	(hrt_address)0x00000000001E0000ULL
-};
-
-static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
-	(hrt_address)0x00000000001F0000ULL
-};
-
 /* SP */
 static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
 	(hrt_address)0x0000000000010000ULL
@@ -75,10 +60,6 @@ static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
 	(hrt_address)0x0000000000300000ULL
 };
 
-static const hrt_address SP_PMEM_BASE[N_SP_ID] = {
-	(hrt_address)0x00000000000B0000ULL
-};
-
 /* MMU */
 /*
  * MMU0_ID: The data MMU
@@ -177,11 +158,6 @@ static const hrt_address RX_BASE[N_RX_ID] = {
 
 #define GP_FIFO_BASE   ((hrt_address)0x00090104)		/* This is NOT a base address */
 
-/* DDR : Attention, this value not defined in 32-bit */
-static const hrt_address DDR_BASE[N_DDR_ID] = {
-	(hrt_address)0x00000000UL
-};
-
 /* ISP */
 static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
 	(hrt_address)0x00020000UL
@@ -195,16 +171,6 @@ static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
 	(hrt_address)0x100000UL
 };
 
-static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
-	(hrt_address)0xffffffffUL,
-	(hrt_address)0xffffffffUL,
-	(hrt_address)0xffffffffUL
-};
-
-static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
-	(hrt_address)0xffffffffUL
-};
-
 /* SP */
 static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
 	(hrt_address)0x00010000UL
@@ -214,10 +180,6 @@ static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
 	(hrt_address)0x00300000UL
 };
 
-static const hrt_address SP_PMEM_BASE[N_SP_ID] = {
-	(hrt_address)0x000B0000UL
-};
-
 /* MMU */
 /*
  * MMU0_ID: The data MMU
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
index b09f8faadb13..1bb01e627cd7 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
@@ -36,11 +36,6 @@
 
 #define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
 
-/* DDR */
-static const hrt_address DDR_BASE[N_DDR_ID] = {
-	0x0000000120000000ULL
-};
-
 /* ISP */
 static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
 	0x0000000000020000ULL
@@ -54,16 +49,6 @@ static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
 	0x0000000000100000ULL
 };
 
-static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
-	0x00000000001C0000ULL,
-	0x00000000001D0000ULL,
-	0x00000000001E0000ULL
-};
-
-static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
-	0x00000000001F0000ULL
-};
-
 /* SP */
 static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
 	0x0000000000010000ULL
@@ -217,11 +202,6 @@ static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
 
 #define GP_FIFO_BASE   ((hrt_address)0x00090104)		/* This is NOT a base address */
 
-/* DDR : Attention, this value not defined in 32-bit */
-static const hrt_address DDR_BASE[N_DDR_ID] = {
-	0x00000000UL
-};
-
 /* ISP */
 static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
 	0x00020000UL
@@ -235,16 +215,6 @@ static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
 	0xffffffffUL
 };
 
-static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
-	0xffffffffUL,
-	0xffffffffUL,
-	0xffffffffUL
-};
-
-static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
-	0xffffffffUL
-};
-
 /* SP */
 static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
 	0x00010000UL
-- 
2.26.2

