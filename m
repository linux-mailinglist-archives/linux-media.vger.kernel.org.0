Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2AE3F3DB9
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 06:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhHVE2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 00:28:42 -0400
Received: from mx20.baidu.com ([111.202.115.85]:43624 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230285AbhHVE2l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 00:28:41 -0400
Received: from BC-Mail-Ex20.internal.baidu.com (unknown [172.31.51.14])
        by Forcepoint Email with ESMTPS id C952C8C7090AEA636060;
        Sun, 22 Aug 2021 12:27:58 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex20.internal.baidu.com (172.31.51.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sun, 22 Aug 2021 12:27:58 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.15) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sun, 22 Aug 2021 12:27:58 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <tfiga@chromium.org>, <m.szyprowski@samsung.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: videobuf2: Convert to SPDX identifier
Date:   Sun, 22 Aug 2021 12:27:30 +0800
Message-ID: <20210822042730.1360-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.31.62.15]
X-ClientProxiedBy: BJHW-Mail-Ex08.internal.baidu.com (10.127.64.18) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

use SPDX-License-Identifier instead of a verbose license text

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c       | 5 +----
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 5 +----
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 5 +----
 drivers/media/common/videobuf2/videobuf2-memops.c     | 5 +----
 drivers/media/common/videobuf2/videobuf2-v4l2.c       | 5 +----
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 5 +----
 6 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 38ce7c274727..fa62c8438a8c 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * videobuf2-core.c - video buffer 2 core framework
  *
@@ -8,10 +9,6 @@
  *
  * The vb2_thread implementation was based on code from videobuf-dvb.c:
  *	(c) 2004 Gerd Knorr <kraxel@bytesex.org> [SUSE Labs]
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a7f61ba85440..8e6fe2ab0821 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * videobuf2-dma-contig.c - DMA contig memory allocator for videobuf2
  *
  * Copyright (C) 2010 Samsung Electronics
  *
  * Author: Pawel Osciak <pawel@osciak.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #include <linux/dma-buf.h>
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c5b06a509566..40412b3ad840 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * videobuf2-dma-sg.c - dma scatter/gather memory allocator for videobuf2
  *
  * Copyright (C) 2010 Samsung Electronics
  *
  * Author: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #include <linux/module.h>
diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
index 9dd6c27162f4..cd328aa84c5e 100644
--- a/drivers/media/common/videobuf2/videobuf2-memops.c
+++ b/drivers/media/common/videobuf2/videobuf2-memops.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * videobuf2-memops.c - generic memory handling routines for videobuf2
  *
@@ -5,10 +6,6 @@
  *
  * Author: Pawel Osciak <pawel@osciak.com>
  *	   Marek Szyprowski <m.szyprowski@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2988bb38ceb1..08a655e395c3 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * videobuf2-v4l2.c - V4L2 driver helper framework
  *
@@ -8,10 +9,6 @@
  *
  * The vb2_thread implementation was based on code from videobuf-dvb.c:
  *	(c) 2004 Gerd Knorr <kraxel@bytesex.org> [SUSE Labs]
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #include <linux/device.h>
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 83f95258ec8c..9f003e17b788 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * videobuf2-vmalloc.c - vmalloc memory allocator for videobuf2
  *
  * Copyright (C) 2010 Samsung Electronics
  *
  * Author: Pawel Osciak <pawel@osciak.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #include <linux/io.h>
-- 
2.25.1

