Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73BE38E523
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhEXLOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:14:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5751 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbhEXLOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:14:48 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpZHD25tNzmks2;
        Mon, 24 May 2021 19:09:44 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:13:19 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:13:19 +0800
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
To:     <linux-media@vger.kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Erik Andren <erik.andren@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] m5602_ov7660: remove the repeated declaration
Date:   Mon, 24 May 2021 19:13:12 +0800
Message-ID: <1621854792-18123-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function 'ov7660_init' is declared twice, remove the repeated
declaration.

Cc: Erik Andren <erik.andren@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/media/usb/gspca/m5602/m5602_ov7660.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/gspca/m5602/m5602_ov7660.h b/drivers/media/usb/gspca/m5602/m5602_ov7660.h
index d60247e10c2c..6146e8ef17c0 100644
--- a/drivers/media/usb/gspca/m5602/m5602_ov7660.h
+++ b/drivers/media/usb/gspca/m5602/m5602_ov7660.h
@@ -86,7 +86,6 @@ extern bool dump_sensor;
 
 int ov7660_probe(struct sd *sd);
 int ov7660_init(struct sd *sd);
-int ov7660_init(struct sd *sd);
 int ov7660_init_controls(struct sd *sd);
 int ov7660_start(struct sd *sd);
 int ov7660_stop(struct sd *sd);
-- 
2.7.4

