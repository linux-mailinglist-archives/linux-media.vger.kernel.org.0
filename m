Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A79F79F90A
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 05:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbjINDvd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 23:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjINDvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 23:51:32 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C0F99
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 20:51:28 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RmNYf65l8ztSTt;
        Thu, 14 Sep 2023 11:47:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 11:51:26 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <ye.xingchen@zte.com.cn>, <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH 0/2] media: siano: Fix two bugs in smsdvb_debugfs_create()
Date:   Thu, 14 Sep 2023 11:50:33 +0800
Message-ID: <20230914035035.3765754-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As debugfs_create_file() returns ERR_PTR and never NULL, check NULL is not
correct to catch the error.

And if kzalloc() fails in smsdvb_debugfs_create(), the dir and file which
is created by debugfs_create_dir() and debugfs_create_file() is
not freed.

This patch set fix the above 2 bugs.

Jinjie Ruan (2):
  media: siano: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
  media: siano: Fix the missing err path in smsdvb_debugfs_create()

 drivers/media/common/siano/smsdvb-debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

