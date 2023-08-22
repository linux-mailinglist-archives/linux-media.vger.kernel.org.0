Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751D3783EA4
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 13:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbjHVLS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 07:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjHVLS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 07:18:58 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895691BE
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 04:18:56 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVRbp3McLzLpJq;
        Tue, 22 Aug 2023 19:15:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 19:18:54 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <andrzej.p@collabora.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 0/2] media: cx231xx: Add two macros and switch to use kmemdup() helper
Date:   Tue, 22 Aug 2023 19:18:30 +0800
Message-ID: <20230822111832.822367-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As Andrzej suggested, add BUF_SIZE and TIMEOUT_MS macros to replace
the magic constant 4096 and 2000.

On the other hand, use kmemdup() helper instead of open-coding to
simplify the code.

Jinjie Ruan (2):
  media: cx231xx: Add BUF_SIZE and TIMEOUT_MS macros
  media: cx231xx: Switch to use kmemdup() helper

 drivers/media/usb/cx231xx/cx231xx-core.c | 7 +++----
 drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.34.1

