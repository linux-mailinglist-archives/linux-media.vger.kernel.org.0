Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348D87996E3
	for <lists+linux-media@lfdr.de>; Sat,  9 Sep 2023 10:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244402AbjIIIg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Sep 2023 04:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236692AbjIIIgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Sep 2023 04:36:25 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765A7170C
        for <linux-media@vger.kernel.org>; Sat,  9 Sep 2023 01:36:18 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RjR9F02qmz1M96s
        for <linux-media@vger.kernel.org>; Sat,  9 Sep 2023 16:34:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 9 Sep
 2023 16:36:16 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v4 0/2] media: cx231xx: Switch to use kmemdup() helper and add two macros
Date:   Sat, 9 Sep 2023 16:36:10 +0800
Message-ID: <20230909083612.1845757-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use kmemdup() helper instead of open-coding to simplify the code.

On the other hand, as Andrzej suggested, add EP5_BUF_SIZE and
EP5_TIMEOUT_MS macros to replace the magic constant 4096 and 2000.

changes in v4:
- Add Reviewed-by.
- Replace the other 4 places with EP5_BUF_SIZE.

Changes in v3:
- Adjust the second patch to be the first.
- Update the names of the macros.

Jinjie Ruan (2):
  media: cx231xx: Switch to use kmemdup() helper
  media: cx231xx: Add EP5_BUF_SIZE and EP5_TIMEOUT_MS macros

 drivers/media/usb/cx231xx/cx231xx-417.c  | 9 ++++-----
 drivers/media/usb/cx231xx/cx231xx-core.c | 7 +++----
 drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.34.1

