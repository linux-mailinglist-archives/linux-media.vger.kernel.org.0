Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F16E790B2D
	for <lists+linux-media@lfdr.de>; Sun,  3 Sep 2023 10:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbjICIO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Sep 2023 04:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjICIOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Sep 2023 04:14:55 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC560136
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 01:14:51 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RdkyT33BKzVjht;
        Sun,  3 Sep 2023 16:12:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sun, 3 Sep
 2023 16:14:49 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <andrzej.p@collabora.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v3 0/2] media: cx231xx: Switch to use kmemdup() helper and add two macros
Date:   Sun, 3 Sep 2023 16:14:38 +0800
Message-ID: <20230903081440.1564633-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use kmemdup() helper instead of open-coding to simplify the code.

On the other hand, as Andrzej suggested, add EP5_BUF_SIZE and
EP5_TIMEOUT_MS macros to replace the magic constant 4096 and 2000.

Changes in v3:
- Adjust the second patch to be the first.
- Update the names of the macros.

Jinjie Ruan (2):
  media: cx231xx: Switch to use kmemdup() helper
  media: cx231xx: Add EP5_BUF_SIZE and EP5_TIMEOUT_MS macros

 drivers/media/usb/cx231xx/cx231xx-core.c | 5 ++---
 drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.34.1

