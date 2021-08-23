Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5083F4A6D
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbhHWMPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:15:01 -0400
Received: from mx21.baidu.com ([220.181.3.85]:53628 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236775AbhHWMOk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:14:40 -0400
Received: from BC-Mail-Ex09.internal.baidu.com (unknown [172.31.51.49])
        by Forcepoint Email with ESMTPS id 2DF8E64DA7EFF141C104;
        Mon, 23 Aug 2021 20:13:57 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex09.internal.baidu.com (172.31.51.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 23 Aug 2021 20:13:57 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 23 Aug 2021 20:13:56 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: dvb-frontend/mxl692: Remove repeated verbose license text
Date:   Mon, 23 Aug 2021 20:13:50 +0800
Message-ID: <20210823121350.765-1-caihuoqing@baidu.com>
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
 drivers/media/dvb-frontends/mxl692.c      | 9 ---------
 drivers/media/dvb-frontends/mxl692.h      | 9 ---------
 drivers/media/dvb-frontends/mxl692_defs.h | 9 ---------
 3 files changed, 27 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-frontends/mxl692.c
index a246db683cdf..dd7954e8f553 100644
--- a/drivers/media/dvb-frontends/mxl692.c
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -7,15 +7,6 @@
  * based on code:
  * Copyright (c) 2016 MaxLinear, Inc. All rights reserved
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
 
 #include <linux/mutex.h>
diff --git a/drivers/media/dvb-frontends/mxl692.h b/drivers/media/dvb-frontends/mxl692.h
index 45bc48f1f12f..77764a047c07 100644
--- a/drivers/media/dvb-frontends/mxl692.h
+++ b/drivers/media/dvb-frontends/mxl692.h
@@ -7,15 +7,6 @@
  * based on code:
  * Copyright (c) 2016 MaxLinear, Inc. All rights reserved
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
 
 #ifndef _MXL692_H_
diff --git a/drivers/media/dvb-frontends/mxl692_defs.h b/drivers/media/dvb-frontends/mxl692_defs.h
index 776ac407b4e7..c603f3d6f27f 100644
--- a/drivers/media/dvb-frontends/mxl692_defs.h
+++ b/drivers/media/dvb-frontends/mxl692_defs.h
@@ -7,15 +7,6 @@
  * based on code:
  * Copyright (c) 2016 MaxLinear, Inc. All rights reserved
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
 
 /*****************************************************************************
-- 
2.25.1

