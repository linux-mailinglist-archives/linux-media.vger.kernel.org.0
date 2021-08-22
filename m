Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A443F3D66
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 06:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhHVEEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 00:04:38 -0400
Received: from mx20.baidu.com ([111.202.115.85]:53890 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229479AbhHVEEh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 00:04:37 -0400
Received: from BC-Mail-EX04.internal.baidu.com (unknown [172.31.51.44])
        by Forcepoint Email with ESMTPS id D7FBBF0C0DAF11AF86C9;
        Sun, 22 Aug 2021 12:03:54 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX04.internal.baidu.com (172.31.51.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sun, 22 Aug 2021 12:03:54 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.12) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sun, 22 Aug 2021 12:03:54 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: b2c2: flexcop: Convert to SPDX identifier
Date:   Sun, 22 Aug 2021 12:03:39 +0800
Message-ID: <20210822040339.1837-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.31.62.12]
X-ClientProxiedBy: BC-Mail-Ex27.internal.baidu.com (172.31.51.21) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

use SPDX-License-Identifier instead of a verbose license text

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/common/b2c2/flexcop.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
index cbaa61f10d5f..2eaff1316952 100644
--- a/drivers/media/common/b2c2/flexcop.c
+++ b/drivers/media/common/b2c2/flexcop.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Linux driver for digital TV devices equipped with B2C2 FlexcopII(b)/III
  * flexcop.c - main module part
@@ -15,16 +16,6 @@
  *   Uwe Bugla, uwe.bugla at gmx.de (doing tests, restyling code, writing docu)
  *   Niklas Peinecke, peinecke at gdv.uni-hannover.de (hardware pid/mac
  *               filtering)
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
  */
 
 #include "flexcop.h"
-- 
2.25.1

