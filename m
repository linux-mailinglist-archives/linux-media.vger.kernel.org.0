Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD0362ECF
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 05:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfGIDWu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 23:22:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43002 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725886AbfGIDWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 23:22:50 -0400
X-UUID: 141c7fd19f8d48909a1b8d8125d5400b-20190709
X-UUID: 141c7fd19f8d48909a1b8d8125d5400b-20190709
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 902669003; Tue, 09 Jul 2019 11:22:43 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 11:22:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 11:22:27 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH 4/5] media: platform: change GPLv2 license to SPDX
Date:   Tue, 9 Jul 2019 11:21:02 +0800
Message-ID: <20190709032103.10291-5-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190709032103.10291-1-xia.jiang@mediatek.com>
References: <20190709032103.10291-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch GPLv2 license to SPDX license.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      | 9 +--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h      | 9 +--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c    | 9 +--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h    | 9 +--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c | 9 +--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h | 9 +--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h   | 9 +--------
 7 files changed, 7 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ef54802bd813..9094eb7bd00f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1,17 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *         Xia Jiang <xia.jiang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 65ef920651a5..34cd139ee502 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -1,17 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *         Xia Jiang <xia.jiang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _MTK_JPEG_CORE_H
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index aad834d98059..0a8200a0a5c6 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -1,16 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/io.h>
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index 725ce94fd58f..be9a756d6242 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -1,17 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *         Xia Jiang <xia.jiang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _MTK_JPEG_DEC_HW_H
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
index c887f90c3a66..c63d61a957a5 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
@@ -1,16 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
index fdad7f2da6be..8760ff71d38f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
@@ -1,16 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _MTK_JPEG_PARSE_H
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
index fc490d62b012..e01470449b8b 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
@@ -1,16 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _MTK_JPEG_REG_H
-- 
2.18.0

