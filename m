Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CDEBC2F9
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 09:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503296AbfIXHoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 03:44:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41223 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2502975AbfIXHoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 03:44:01 -0400
X-UUID: 65df32135bd14d68ac172bc9a400ee4d-20190924
X-UUID: 65df32135bd14d68ac172bc9a400ee4d-20190924
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1091215643; Tue, 24 Sep 2019 15:43:55 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Sep 2019 15:43:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Sep 2019 15:43:52 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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
Subject: [PATCH v3 3/5] media: platform: Rename jpeg dec file name
Date:   Tue, 24 Sep 2019 15:43:03 +0800
Message-ID: <20190924074303.22713-4-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190924074303.22713-1-xia.jiang@mediatek.com>
References: <20190924074303.22713-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the files which are for decode feature. This is preparing
path since the jpeg enc patch will be added later.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v3: no changes

v2: no changes
---
 drivers/media/platform/mtk-jpeg/Makefile                      | 2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c               | 4 ++--
 .../platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}    | 2 +-
 .../platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}    | 2 +-
 .../mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c}       | 2 +-
 .../mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h}       | 2 +-
 .../platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}  | 0
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (99%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (100%)

diff --git a/drivers/media/platform/mtk-jpeg/Makefile b/drivers/media/platform/mtk-jpeg/Makefile
index 92a4fc046bfe..48516dcf96e6 100644
--- a/drivers/media/platform/mtk-jpeg/Makefile
+++ b/drivers/media/platform/mtk-jpeg/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mtk_jpeg-objs := mtk_jpeg_core.o mtk_jpeg_hw.o mtk_jpeg_parse.o
+mtk_jpeg-objs := mtk_jpeg_core.o mtk_jpeg_dec_hw.o mtk_jpeg_dec_parse.o
 obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ee802fc3bcdf..5f0990fce8ef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -23,9 +23,9 @@
 #include <media/videobuf2-dma-contig.h>
 #include <soc/mediatek/smi.h>
 
-#include "mtk_jpeg_hw.h"
+#include "mtk_jpeg_dec_hw.h"
 #include "mtk_jpeg_core.h"
-#include "mtk_jpeg_parse.h"
+#include "mtk_jpeg_dec_parse.h"
 
 static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
 	{
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
similarity index 99%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index ddf0dfa78e20..922dbe421fae 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -9,7 +9,7 @@
 #include <linux/kernel.h>
 #include <media/videobuf2-core.h>
 
-#include "mtk_jpeg_hw.h"
+#include "mtk_jpeg_dec_hw.h"
 
 #define MTK_JPEG_DUNUM_MASK(val)	(((val) - 1) & 0x3)
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
similarity index 98%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index 9c6584eaad99..a37be1a48415 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -11,7 +11,7 @@
 #include <media/videobuf2-core.h>
 
 #include "mtk_jpeg_core.h"
-#include "mtk_jpeg_reg.h"
+#include "mtk_jpeg_dec_reg.h"
 
 enum {
 	MTK_JPEG_DEC_RESULT_EOF_DONE		= 0,
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
similarity index 98%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
index f862d38f3af7..b95c45791c29 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
@@ -8,7 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/videodev2.h>
 
-#include "mtk_jpeg_parse.h"
+#include "mtk_jpeg_dec_parse.h"
 
 #define TEM	0x01
 #define SOF0	0xc0
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
similarity index 92%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
index 0a48eeabaff2..2918f15811f8 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
@@ -8,7 +8,7 @@
 #ifndef _MTK_JPEG_PARSE_H
 #define _MTK_JPEG_PARSE_H
 
-#include "mtk_jpeg_hw.h"
+#include "mtk_jpeg_dec_hw.h"
 
 bool mtk_jpeg_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
 		    u32 src_size);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
-- 
2.18.0

