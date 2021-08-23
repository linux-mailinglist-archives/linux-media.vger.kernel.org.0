Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2023F4A55
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbhHWMId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:08:33 -0400
Received: from mx20.baidu.com ([111.202.115.85]:48112 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235813AbhHWMIc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:08:32 -0400
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
        by Forcepoint Email with ESMTPS id DB72F1E4F63E38E7961B;
        Mon, 23 Aug 2021 20:07:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 23 Aug 2021 20:07:48 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 23 Aug 2021 20:07:48 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: dvb-frontends/stv6111: Remove repeated verbose license text
Date:   Mon, 23 Aug 2021 20:07:41 +0800
Message-ID: <20210823120741.590-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex31.internal.baidu.com (172.31.51.25) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove it because SPDX-License-Identifier is already used

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/dvb-frontends/stv6111.c | 9 ---------
 drivers/media/dvb-frontends/stv6111.h | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv6111.c b/drivers/media/dvb-frontends/stv6111.c
index d5035dac4574..2d0adb6fcb08 100644
--- a/drivers/media/dvb-frontends/stv6111.c
+++ b/drivers/media/dvb-frontends/stv6111.c
@@ -3,15 +3,6 @@
  * Driver for the ST STV6111 tuner
  *
  * Copyright (C) 2014 Digital Devices GmbH
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 only, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/media/dvb-frontends/stv6111.h b/drivers/media/dvb-frontends/stv6111.h
index 49e821ac9954..f172c3e3d886 100644
--- a/drivers/media/dvb-frontends/stv6111.h
+++ b/drivers/media/dvb-frontends/stv6111.h
@@ -3,15 +3,6 @@
  * Driver for the ST STV6111 tuner
  *
  * Copyright (C) 2014 Digital Devices GmbH
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 only, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _STV6111_H_
-- 
2.25.1

