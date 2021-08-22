Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEC53F3D6B
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 06:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhHVEHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 00:07:23 -0400
Received: from mx21.baidu.com ([220.181.3.85]:56196 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229479AbhHVEHW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 00:07:22 -0400
Received: from BJHW-MAIL-EX04.internal.baidu.com (unknown [10.127.64.14])
        by Forcepoint Email with ESMTPS id 338E4CFCAD39FB4399EA;
        Sun, 22 Aug 2021 12:06:40 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sun, 22 Aug 2021 12:06:40 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.19) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sun, 22 Aug 2021 12:06:38 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: dvb-core: Convert to SPDX identifier
Date:   Sun, 22 Aug 2021 12:06:25 +0800
Message-ID: <20210822040625.1190-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.31.62.19]
X-ClientProxiedBy: BC-Mail-Ex27.internal.baidu.com (172.31.51.21) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

use SPDX-License-Identifier instead of a verbose license text
and remove verbose license text.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/dvb-core/dmxdev.c    | 12 +-----------
 drivers/media/dvb-core/dvb_demux.c | 12 +-----------
 drivers/media/dvb-core/dvb_vb2.c   |  4 ----
 drivers/media/dvb-core/dvbdev.c    | 12 +-----------
 4 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 5d5a48475a54..e94ae9427fdb 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1,19 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * dmxdev.c - DVB demultiplexer device
  *
  * Copyright (C) 2000 Ralph Metzler & Marcus Metzler
  *		      for convergence integrated media GmbH
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2.1
- * of the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #define pr_fmt(fmt) "dmxdev: " fmt
diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 5fde1d38b3e3..c7a145bfbc55 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1,20 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * dvb_demux.c - DVB kernel demux API
  *
  * Copyright (C) 2000-2001 Ralph  Metzler <ralph@convergence.de>
  *		       & Marcus Metzler <marcus@convergence.de>
  *			 for convergence integrated media GmbH
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2.1
- * of the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #define pr_fmt(fmt) "dvb_demux: " fmt
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 6974f1731529..602bbc52bd22 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -5,10 +5,6 @@
  * Copyright (C) 2015 Samsung Electronics
  *
  * Author: jh1009.sung@samsung.com
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation.
  */
 
 #include <linux/err.h>
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 795d9bfaba5c..d7c341bfcca1 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -1,20 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * dvbdev.c
  *
  * Copyright (C) 2000 Ralph  Metzler <ralph@convergence.de>
  *                  & Marcus Metzler <marcus@convergence.de>
  *                    for convergence integrated media GmbH
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2.1
- * of the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #define pr_fmt(fmt) "dvbdev: " fmt
-- 
2.25.1

