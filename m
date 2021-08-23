Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8113F4A65
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236620AbhHWMNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:13:34 -0400
Received: from mx21.baidu.com ([220.181.3.85]:52490 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235092AbhHWMNe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:13:34 -0400
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
        by Forcepoint Email with ESMTPS id 0FD262CFC6780D1AB533;
        Mon, 23 Aug 2021 20:12:50 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 23 Aug 2021 20:12:49 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 23 Aug 2021 20:12:49 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: dvb-frontend/mxl5xx: Remove repeated verbose license text
Date:   Mon, 23 Aug 2021 20:12:43 +0800
Message-ID: <20210823121243.711-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove it because SPDX-License-Identifier is already used

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/dvb-frontends/mxl5xx.c      |  9 ---------
 drivers/media/dvb-frontends/mxl5xx.h      |  9 ---------
 drivers/media/dvb-frontends/mxl5xx_defs.h |  4 ----
 drivers/media/dvb-frontends/mxl5xx_regs.h | 10 ----------
 4 files changed, 32 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
index 0b00a23436ed..934d1c0b214a 100644
--- a/drivers/media/dvb-frontends/mxl5xx.c
+++ b/drivers/media/dvb-frontends/mxl5xx.c
@@ -9,15 +9,6 @@
  * based on code:
  * Copyright (c) 2011-2013 MaxLinear, Inc. All rights reserved
  * which was released under GPL V2
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/media/dvb-frontends/mxl5xx.h b/drivers/media/dvb-frontends/mxl5xx.h
index 706a2f5d8f97..139e16b2ecfc 100644
--- a/drivers/media/dvb-frontends/mxl5xx.h
+++ b/drivers/media/dvb-frontends/mxl5xx.h
@@ -9,15 +9,6 @@
  * based on code:
  * Copyright (c) 2011-2013 MaxLinear, Inc. All rights reserved
  * which was released under GPL V2
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _MXL5XX_H_
diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 1442af8dc176..097271f73740 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -7,10 +7,6 @@
  * based on code:
  * Copyright (c) 2011-2013 MaxLinear, Inc. All rights reserved
  * which was released under GPL V2
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2, as published by the Free Software Foundation.
  */
 
 enum MXL_BOOL_E {
diff --git a/drivers/media/dvb-frontends/mxl5xx_regs.h b/drivers/media/dvb-frontends/mxl5xx_regs.h
index 86d5317eba7a..b38a13847033 100644
--- a/drivers/media/dvb-frontends/mxl5xx_regs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_regs.h
@@ -2,16 +2,6 @@
 /*
  * Copyright (c) 2011-2013 MaxLinear, Inc. All rights reserved
  *
- * License type: GPLv2
- *
- * This program is free software; you can redistribute it and/or modify it under
- * the terms of the GNU General Public License as published by the Free Software
- * Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
- * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
- *
  * This program may alternatively be licensed under a proprietary license from
  * MaxLinear, Inc.
  *
-- 
2.25.1

